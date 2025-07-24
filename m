Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7574024EF7F
	for <chrome-platform@lists.linux.dev>; Thu, 24 Jul 2025 09:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753351123; cv=none; b=N4IhDyhkOIg8lt/qziG1/zNdWE/CE6uzHFFizi99u7naLGi8dJ3Etg8EkxwgSGw6hMQ7Ish23u5TyF8DnXDwoiMda+4rLha9aSxVKoBfZLPCLhGjzw9SJQfUicGMJpkCAIPdQ5iWPFPHdjlBHBcNBeOfXLXL14GqmZiQmh9qeNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753351123; c=relaxed/simple;
	bh=OJ/31ZKNJUAYOI1mmIgdnwEGmpUtgS9GPV3Sxo+wMx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=STcmbHwWgEgSe+Xq5PYRth5aBvL278oAd4IgxLdPXJjiiizDUY8aAGL5B36PjW3wa70XS8Bk9N3yMLvejRJPN089sbrKpq0XV5Y9qoov7S9Yb2zHrfBz9XwePWZKmyWOn8XbfW34QTIuaZU8CmIQfN7J6Ov/IDX5zTlaGCPEx1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Akrj8Ftl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Akrj8Ftl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19409C4CEED;
	Thu, 24 Jul 2025 09:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753351123;
	bh=OJ/31ZKNJUAYOI1mmIgdnwEGmpUtgS9GPV3Sxo+wMx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Akrj8FtlH9aORm9FNnXAWkAJPVRMT+37wuYwNfKxf2/ckzs7KYzuXqjRmQWzbSmC0
	 JeK1nCCyJrYs3o1mr42sF6zjyxBM94YZnJ9bPbCnlbyh/1nHXpCXw1q7EH2OkXSYA5
	 SAB9RafeZLZ3KFtKem0UadjbAnm1HsWYpr6qbZOMmwZGh3g2DsimxW/0CLfUP8I/fi
	 hg0bdQhKeZO2bm3151hFjaepjm7ittefgxWXm1CVqpcKDchStDXybNMJC5kFw56OMh
	 ou3DX2C7pi+jvbJvpX2ocA/JljVG7d9ABQ5RFDJU960P+3fYmYj6Io4uxIqgi/IFwZ
	 1vatVdfUY5t2Q==
Date: Thu, 24 Jul 2025 09:58:39 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: bleung@chromium.org, dawidn@google.com, chrome-platform@lists.linux.dev,
	mhiramat@kernel.org
Subject: Re: [PATCH v3 5/8] platform/chrome: Introduce cros_ec_device_alloc()
Message-ID: <aIIDz_qtbRjZB8Sg@google.com>
References: <20250721044456.2736300-1-tzungbi@kernel.org>
 <20250721044456.2736300-6-tzungbi@kernel.org>
 <2025072114-unifier-screen-1594@gregkh>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025072114-unifier-screen-1594@gregkh>

On Mon, Jul 21, 2025 at 08:15:07AM +0200, Greg KH wrote:
> On Mon, Jul 21, 2025 at 04:44:53AM +0000, Tzung-Bi Shih wrote:
> > Prepare to decouple the lifecycle of struct cros_ec_device from specific
> > device by introducing a kref.
> 
> Ick, are you sure?  This is a device, so use struct device for it.
> That's what it is there for.
> 
> So shouldn't this be its own 'struct device' and let the driver core
> handle it correctly instead of trying to have a "child" structure with a
> reference count that is not shown in sysfs at all?

Thanks for the review.

To make sure I understand, do the following patches (draft and simplified) make
sense?  Short summary:
- cros_ec_device_alloc() allocates resources and setup the destructor.
- cros_ec_register() adds the device to the device hierarchy.
- cros_ec_unregister() removes the device.
- cros_ec_chardev_open() gets a refcount of the device.
- cros_ec_chardev_release() puts the refcount.

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index f8ffdc1e1b16..4d0f1ffc3387 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -11,0 +12 @@
+#include <linux/idr.h>
@@ -22,0 +24,6 @@
+static DEFINE_IDA(cros_ec_devid_ida);
+
+static struct class cros_ec_class = {
+	.name = "cros_ec",
+};
+
@@ -101,0 +109,44 @@ EXPORT_SYMBOL(cros_ec_irq_thread);
+static void cros_ec_device_release(struct device *dev)
+{
+	struct cros_ec_device *ec_dev = container_of(dev, struct cros_ec_device, this_dev);
+
+	ida_free(&cros_ec_devid_ida, ec_dev->devid);
+	kfree(ec_dev);
+}
+
+/**
+ * cros_ec_device_alloc - Allocate a new struct cros_ec_device.
+ *
+ * @parent: The parent device.
+ */
+struct cros_ec_device *cros_ec_device_alloc(struct device *parent)
+{
+	struct cros_ec_device *ec_dev = NULL;
+	int id = -1;
+
+	ec_dev = kzalloc(sizeof(*ec_dev), GFP_KERNEL);
+	if (!ec_dev)
+		goto err;
+
+	id = ida_alloc(&cros_ec_devid_ida, GFP_KERNEL);
+	if (id < 0)
+		goto err;
+
+	ec_dev->dev = &ec_dev->this_dev;
+	ec_dev->this_dev.parent = parent;
+	ec_dev->this_dev.release = cros_ec_device_release;
+	ec_dev->this_dev.class = &cros_ec_class;
+	ec_dev->devid = id;
+
+	device_initialize(&ec_dev->this_dev);
+	dev_set_name(&ec_dev->this_dev, "cros_ec_transport.%d", id);
+	dev_set_drvdata(&ec_dev->this_dev, ec_dev);
+	return ec_dev;
+err:
+	if (id >= 0)
+		ida_free(&cros_ec_devid_ida, id);
+	kfree(ec_dev);
+	return NULL;
+}
+EXPORT_SYMBOL(cros_ec_device_alloc);
+
@@ -206,0 +258,4 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
+	err = device_add(dev);
+	if (err)
+		return err;
+
@@ -334,0 +390,2 @@ void cros_ec_unregister(struct cros_ec_device *ec_dev)
+
+	device_unregister(&ec_dev->this_dev);
@@ -500,0 +558,19 @@ EXPORT_SYMBOL(cros_ec_resume);
+static int __init cros_ec_init(void)
+{
+	int ret;
+
+	ret = class_register(&cros_ec_class);
+	if (ret)
+		pr_err("cros_ec: Failed to register device class\n");
+
+	return ret;
+}
+
+static void __exit cros_ec_exit(void)
+{
+	class_unregister(&cros_ec_class);
+}
+
+module_init(cros_ec_init);
+module_exit(cros_ec_exit);
+

diff --git a/drivers/platform/chrome/cros_ec_spi.c b/drivers/platform/chrome/cros_ec_spi.c
index 8ca0f854e7ac..6851e466e1dc 100644
--- a/drivers/platform/chrome/cros_ec_spi.c
+++ b/drivers/platform/chrome/cros_ec_spi.c
@@ -752 +752 @@ static int cros_ec_spi_probe(struct spi_device *spi)
-	ec_dev = devm_kzalloc(dev, sizeof(*ec_dev), GFP_KERNEL);
+	ec_dev = cros_ec_device_alloc(dev);
@@ -760 +759,0 @@ static int cros_ec_spi_probe(struct spi_device *spi)
-	ec_dev->dev = dev;

diff --git a/drivers/platform/chrome/cros_ec_chardev.c b/drivers/platform/chrome/cros_ec_chardev.c
index c9d80ad5b57e..13109ef6e452 100644
--- a/drivers/platform/chrome/cros_ec_chardev.c
+++ b/drivers/platform/chrome/cros_ec_chardev.c
@@ -183,0 +184 @@ static int cros_ec_chardev_open(struct inode *inode, struct file *filp)
+	get_device(ec_dev->dev);
@@ -258,0 +260 @@ static int cros_ec_chardev_release(struct inode *inode, struct file *filp)
+	put_device(ec_dev->dev);
