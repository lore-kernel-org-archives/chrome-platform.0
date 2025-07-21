Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6DA1A315C
	for <chrome-platform@lists.linux.dev>; Mon, 21 Jul 2025 04:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753073125; cv=none; b=sHF/t9SCWf530KJ5UBqqC4rFduy41Gsl08HjxV4zBb8r5xMnVzCvY946cQZI+gWGvmHIROgu4bSN7sPvgt+lK+c7pExy+8OTmKDeF3SN13dmiwqbJCSDirIpPd+Ygcj5btNzGKfRLqBF/+OfzfwVibIsB1/tzQ9kTBNJ3ndHLcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753073125; c=relaxed/simple;
	bh=nfo8H9zP0N3GUvX/nZFZWgvKts/w4XOiTSEjcoD/eeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DzuioMsCPJb/Uh+V5OpK+StvDwFat6Q9fJ3KlcS6nl51f4vMoOiFzTdYDIkqqQsNWRZqcF+cGPJfIBsh/y4E/bwDTOK2TVGr7GvCr7rFDSr5udjQpEEAhBGcXOX/nWUF9/jH0nOl7ZPAaQsmlQQxEHfvTU61cYh3lVJzk8lJ4VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aPQE5YyQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aPQE5YyQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB0E7C4CEF1;
	Mon, 21 Jul 2025 04:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753073125;
	bh=nfo8H9zP0N3GUvX/nZFZWgvKts/w4XOiTSEjcoD/eeQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aPQE5YyQvzGoCFfb76alLND9BSgtWcVMY/Qjy0pxm4FGcUgjxJOOkcFOZCteddZoq
	 10//ZXCYzivcUrmuwERFVBFo/2IVTINXWtgdKqm8Yc+buK+vEjZ5oDBTOmDSV0nCgR
	 Jtgb+5nXqP1B43pN4JkqwQHhduw5aFilDaPnSilDGWLdHjaVIAMFxDpVBjWUJwtpLg
	 fqitTFu3wTyLIoA03Na4mRHOJhGqlbTlhZTsEWXraQqDPvFP4kEKW+nk2jwtDAXVd1
	 DkowrExUYitqRGEfE66FfCVZUIBDmUy08rdyPCd4yGP9XKZ6vE1uMezU1bGc6gBJAR
	 gBdsDvhVxs7TA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org
Cc: tzungbi@kernel.org,
	dawidn@google.com,
	gregkh@linuxfoundation.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v3 5/8] platform/chrome: Introduce cros_ec_device_alloc()
Date: Mon, 21 Jul 2025 04:44:53 +0000
Message-ID: <20250721044456.2736300-6-tzungbi@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250721044456.2736300-1-tzungbi@kernel.org>
References: <20250721044456.2736300-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prepare to decouple the lifecycle of struct cros_ec_device from specific
device by introducing a kref.

Replace all occurrences of kzalloc for struct cros_ec_device to a new
helper cros_ec_device_alloc() and initialize the kref in the helper.

No functional changes.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
No changes since v2 (https://patchwork.kernel.org/project/chrome-platform/patch/20250708080034.3425427-5-tzungbi@kernel.org/).

 drivers/platform/chrome/cros_ec.c           |  7 +++-
 drivers/platform/chrome/cros_ec_i2c.c       |  4 +-
 drivers/platform/chrome/cros_ec_ishtp.c     |  9 +++--
 drivers/platform/chrome/cros_ec_lpc.c       | 11 +++--
 drivers/platform/chrome/cros_ec_proto.c     | 45 +++++++++++++++++++++
 drivers/platform/chrome/cros_ec_rpmsg.c     | 20 +++++----
 drivers/platform/chrome/cros_ec_spi.c       | 10 +++--
 drivers/platform/chrome/cros_ec_uart.c      | 17 +++++---
 include/linux/platform_data/cros_ec_proto.h |  6 +++
 9 files changed, 101 insertions(+), 28 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index 42512e2b4f65..9604424b6e7a 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -173,8 +173,10 @@ static int cros_ec_ready_event(struct notifier_block *nb,
  * cros_ec_register() - Register a new ChromeOS EC, using the provided info.
  * @ec_dev: Device to register.
  *
- * Before calling this, allocate a pointer to a new device and then fill
- * in all the fields up to the --private-- marker.
+ * Before calling this, allocate a pointer to a new device via
+ * cros_ec_device_alloc() and then fill in all the required fields.
+ *
+ * On success, the ownership of refcount of the ec_dev will be taken.
  *
  * Return: 0 on success or negative error code.
  */
@@ -330,6 +332,7 @@ void cros_ec_unregister(struct cros_ec_device *ec_dev)
 	platform_device_unregister(ec_dev->ec);
 	mutex_destroy(&ec_dev->lock);
 	lockdep_unregister_key(&ec_dev->lockdep_key);
+	cros_ec_device_put(ec_dev);
 }
 EXPORT_SYMBOL(cros_ec_unregister);
 
diff --git a/drivers/platform/chrome/cros_ec_i2c.c b/drivers/platform/chrome/cros_ec_i2c.c
index 38af97cdaab2..26c32ceef2bd 100644
--- a/drivers/platform/chrome/cros_ec_i2c.c
+++ b/drivers/platform/chrome/cros_ec_i2c.c
@@ -292,12 +292,11 @@ static int cros_ec_i2c_probe(struct i2c_client *client)
 	struct cros_ec_device *ec_dev = NULL;
 	int err;
 
-	ec_dev = devm_kzalloc(dev, sizeof(*ec_dev), GFP_KERNEL);
+	ec_dev = cros_ec_device_alloc(dev);
 	if (!ec_dev)
 		return -ENOMEM;
 
 	i2c_set_clientdata(client, ec_dev);
-	ec_dev->dev = dev;
 	ec_dev->priv = client;
 	ec_dev->irq = client->irq;
 	ec_dev->cmd_xfer = cros_ec_cmd_xfer_i2c;
@@ -311,6 +310,7 @@ static int cros_ec_i2c_probe(struct i2c_client *client)
 	err = cros_ec_register(ec_dev);
 	if (err) {
 		dev_err(dev, "cannot register EC\n");
+		cros_ec_device_put(ec_dev);
 		return err;
 	}
 
diff --git a/drivers/platform/chrome/cros_ec_ishtp.c b/drivers/platform/chrome/cros_ec_ishtp.c
index 7e7190b30cbb..fdf61acb6772 100644
--- a/drivers/platform/chrome/cros_ec_ishtp.c
+++ b/drivers/platform/chrome/cros_ec_ishtp.c
@@ -542,15 +542,15 @@ static int cros_ec_dev_init(struct ishtp_cl_data *client_data)
 {
 	struct cros_ec_device *ec_dev;
 	struct device *dev = cl_data_to_dev(client_data);
+	int ret;
 
-	ec_dev = devm_kzalloc(dev, sizeof(*ec_dev), GFP_KERNEL);
+	ec_dev = cros_ec_device_alloc(dev);
 	if (!ec_dev)
 		return -ENOMEM;
 
 	client_data->ec_dev = ec_dev;
 	dev->driver_data = ec_dev;
 
-	ec_dev->dev = dev;
 	ec_dev->priv = client_data->cros_ish_cl;
 	ec_dev->cmd_xfer = NULL;
 	ec_dev->pkt_xfer = cros_ec_pkt_xfer_ish;
@@ -559,7 +559,10 @@ static int cros_ec_dev_init(struct ishtp_cl_data *client_data)
 			   sizeof(struct ec_response_get_protocol_info);
 	ec_dev->dout_size = sizeof(struct cros_ish_out_msg) + sizeof(struct ec_params_rwsig_action);
 
-	return cros_ec_register(ec_dev);
+	ret = cros_ec_register(ec_dev);
+	if (ret)
+		cros_ec_device_put(ec_dev);
+	return ret;
 }
 
 static void reset_handler(struct work_struct *work)
diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 7d9a78289c96..f75849cc14c3 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -637,12 +637,11 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 		}
 	}
 
-	ec_dev = devm_kzalloc(dev, sizeof(*ec_dev), GFP_KERNEL);
+	ec_dev = cros_ec_device_alloc(dev);
 	if (!ec_dev)
 		return -ENOMEM;
 
 	platform_set_drvdata(pdev, ec_dev);
-	ec_dev->dev = dev;
 	ec_dev->phys_name = dev_name(dev);
 	ec_dev->cmd_xfer = cros_ec_cmd_xfer_lpc;
 	ec_dev->pkt_xfer = cros_ec_pkt_xfer_lpc;
@@ -661,13 +660,14 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 		ec_dev->irq = irq;
 	else if (irq != -ENXIO) {
 		dev_err(dev, "couldn't retrieve IRQ number (%d)\n", irq);
-		return irq;
+		ret = irq;
+		goto err;
 	}
 
 	ret = cros_ec_register(ec_dev);
 	if (ret) {
 		dev_err(dev, "couldn't register ec_dev (%d)\n", ret);
-		return ret;
+		goto err;
 	}
 
 	/*
@@ -685,6 +685,9 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 	}
 
 	return 0;
+err:
+	cros_ec_device_put(ec_dev);
+	return ret;
 }
 
 static void cros_ec_lpc_remove(struct platform_device *pdev)
diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index ee3050ffe226..7fac4d7c1b78 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -1159,6 +1159,51 @@ int cros_ec_get_cmd_versions(struct cros_ec_device *ec_dev, u16 cmd)
 }
 EXPORT_SYMBOL_GPL(cros_ec_get_cmd_versions);
 
+/**
+ * cros_ec_device_alloc - Allocate memory for struct cros_ec_device.
+ *
+ * @dev: The associated device.
+ */
+struct cros_ec_device *cros_ec_device_alloc(struct device *dev)
+{
+	struct cros_ec_device *ec_dev = devm_kzalloc(dev, sizeof(*ec_dev), GFP_KERNEL);
+
+	if (ec_dev) {
+		ec_dev->dev = dev;
+		kref_init(&ec_dev->kref);
+	}
+
+	return ec_dev;
+}
+EXPORT_SYMBOL_GPL(cros_ec_device_alloc);
+
+/**
+ * cros_ec_device_get - Get a refcount of the ec_dev.
+ *
+ * @ec_dev: EC device
+ */
+void cros_ec_device_get(struct cros_ec_device *ec_dev)
+{
+	kref_get(&ec_dev->kref);
+}
+EXPORT_SYMBOL_GPL(cros_ec_device_get);
+
+static void cros_ec_device_release(struct kref *kref)
+{
+	/* Do not free the cros_ec_device as it is still dev-managed. */
+}
+
+/**
+ * cros_ec_device_put - Put a refcount of the ec_dev.
+ *
+ * @ec_dev: EC device
+ */
+void cros_ec_device_put(struct cros_ec_device *ec_dev)
+{
+	kref_put(&ec_dev->kref, cros_ec_device_release);
+}
+EXPORT_SYMBOL_GPL(cros_ec_device_put);
+
 /**
  * cros_ec_device_registered - Check if the ec_dev is registered.
  *
diff --git a/drivers/platform/chrome/cros_ec_rpmsg.c b/drivers/platform/chrome/cros_ec_rpmsg.c
index bc2666491db1..85afb15cd162 100644
--- a/drivers/platform/chrome/cros_ec_rpmsg.c
+++ b/drivers/platform/chrome/cros_ec_rpmsg.c
@@ -216,15 +216,16 @@ static int cros_ec_rpmsg_probe(struct rpmsg_device *rpdev)
 	struct cros_ec_device *ec_dev;
 	int ret;
 
-	ec_dev = devm_kzalloc(dev, sizeof(*ec_dev), GFP_KERNEL);
+	ec_dev = cros_ec_device_alloc(dev);
 	if (!ec_dev)
 		return -ENOMEM;
 
 	ec_rpmsg = devm_kzalloc(dev, sizeof(*ec_rpmsg), GFP_KERNEL);
-	if (!ec_rpmsg)
-		return -ENOMEM;
+	if (!ec_rpmsg) {
+		ret = -ENOMEM;
+		goto err;
+	}
 
-	ec_dev->dev = dev;
 	ec_dev->priv = ec_rpmsg;
 	ec_dev->cmd_xfer = cros_ec_cmd_xfer_rpmsg;
 	ec_dev->pkt_xfer = cros_ec_pkt_xfer_rpmsg;
@@ -240,14 +241,16 @@ static int cros_ec_rpmsg_probe(struct rpmsg_device *rpdev)
 		  cros_ec_rpmsg_host_event_function);
 
 	ec_rpmsg->ept = cros_ec_rpmsg_create_ept(rpdev);
-	if (!ec_rpmsg->ept)
-		return -ENOMEM;
+	if (!ec_rpmsg->ept) {
+		ret = -ENOMEM;
+		goto err;
+	}
 
 	ret = cros_ec_register(ec_dev);
 	if (ret < 0) {
 		rpmsg_destroy_ept(ec_rpmsg->ept);
 		cancel_work_sync(&ec_rpmsg->host_event_work);
-		return ret;
+		goto err;
 	}
 
 	ec_rpmsg->probe_done = true;
@@ -256,6 +259,9 @@ static int cros_ec_rpmsg_probe(struct rpmsg_device *rpdev)
 		schedule_work(&ec_rpmsg->host_event_work);
 
 	return 0;
+err:
+	cros_ec_device_put(ec_dev);
+	return ret;
 }
 
 static void cros_ec_rpmsg_remove(struct rpmsg_device *rpdev)
diff --git a/drivers/platform/chrome/cros_ec_spi.c b/drivers/platform/chrome/cros_ec_spi.c
index 8ca0f854e7ac..3f31d9ee4335 100644
--- a/drivers/platform/chrome/cros_ec_spi.c
+++ b/drivers/platform/chrome/cros_ec_spi.c
@@ -749,7 +749,7 @@ static int cros_ec_spi_probe(struct spi_device *spi)
 	if (ec_spi == NULL)
 		return -ENOMEM;
 	ec_spi->spi = spi;
-	ec_dev = devm_kzalloc(dev, sizeof(*ec_dev), GFP_KERNEL);
+	ec_dev = cros_ec_device_alloc(dev);
 	if (!ec_dev)
 		return -ENOMEM;
 
@@ -757,7 +757,6 @@ static int cros_ec_spi_probe(struct spi_device *spi)
 	cros_ec_spi_dt_probe(ec_spi, dev);
 
 	spi_set_drvdata(spi, ec_dev);
-	ec_dev->dev = dev;
 	ec_dev->priv = ec_spi;
 	ec_dev->irq = spi->irq;
 	ec_dev->cmd_xfer = cros_ec_cmd_xfer_spi;
@@ -772,17 +771,20 @@ static int cros_ec_spi_probe(struct spi_device *spi)
 
 	err = cros_ec_spi_devm_high_pri_alloc(dev, ec_spi);
 	if (err)
-		return err;
+		goto fail;
 
 	err = cros_ec_register(ec_dev);
 	if (err) {
 		dev_err(dev, "cannot register EC\n");
-		return err;
+		goto fail;
 	}
 
 	device_init_wakeup(&spi->dev, true);
 
 	return 0;
+fail:
+	cros_ec_device_put(ec_dev);
+	return err;
 }
 
 static void cros_ec_spi_remove(struct spi_device *spi)
diff --git a/drivers/platform/chrome/cros_ec_uart.c b/drivers/platform/chrome/cros_ec_uart.c
index 19c179d49c90..9ee7ad9dcc0e 100644
--- a/drivers/platform/chrome/cros_ec_uart.c
+++ b/drivers/platform/chrome/cros_ec_uart.c
@@ -259,7 +259,7 @@ static int cros_ec_uart_probe(struct serdev_device *serdev)
 	if (!ec_uart)
 		return -ENOMEM;
 
-	ec_dev = devm_kzalloc(dev, sizeof(*ec_dev), GFP_KERNEL);
+	ec_dev = cros_ec_device_alloc(dev);
 	if (!ec_dev)
 		return -ENOMEM;
 
@@ -271,12 +271,11 @@ static int cros_ec_uart_probe(struct serdev_device *serdev)
 	ret = cros_ec_uart_acpi_probe(ec_uart);
 	if (ret < 0) {
 		dev_err(dev, "Failed to get ACPI info (%d)", ret);
-		return ret;
+		goto err;
 	}
 
 	/* Initialize ec_dev for cros_ec  */
 	ec_dev->phys_name = dev_name(dev);
-	ec_dev->dev = dev;
 	ec_dev->priv = ec_uart;
 	ec_dev->irq = ec_uart->irq;
 	ec_dev->cmd_xfer = NULL;
@@ -290,18 +289,24 @@ static int cros_ec_uart_probe(struct serdev_device *serdev)
 	ret = devm_serdev_device_open(dev, serdev);
 	if (ret) {
 		dev_err(dev, "Unable to open UART device");
-		return ret;
+		goto err;
 	}
 
 	ret = serdev_device_set_baudrate(serdev, ec_uart->baudrate);
 	if (ret < 0) {
 		dev_err(dev, "Failed to set up host baud rate (%d)", ret);
-		return ret;
+		goto err;
 	}
 
 	serdev_device_set_flow_control(serdev, ec_uart->flowcontrol);
 
-	return cros_ec_register(ec_dev);
+	ret = cros_ec_register(ec_dev);
+	if (ret)
+		goto err;
+	return 0;
+err:
+	cros_ec_device_put(ec_dev);
+	return ret;
 }
 
 static void cros_ec_uart_remove(struct serdev_device *serdev)
diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
index 9ab83a8318ce..ecab81ed4f2b 100644
--- a/include/linux/platform_data/cros_ec_proto.h
+++ b/include/linux/platform_data/cros_ec_proto.h
@@ -159,6 +159,7 @@ struct cros_ec_command {
  * @pd: The platform_device used by the mfd driver to interface with the
  *      PD behind an EC.
  * @panic_notifier: EC panic notifier.
+ * @kref: The refcount.
  */
 struct cros_ec_device {
 	/* These are used by other drivers that want to talk to the EC */
@@ -205,6 +206,8 @@ struct cros_ec_device {
 	struct platform_device *pd;
 
 	struct blocking_notifier_head panic_notifier;
+
+	struct kref kref;
 };
 
 /**
@@ -274,6 +277,9 @@ int cros_ec_cmd_readmem(struct cros_ec_device *ec_dev, u8 offset, u8 size, void
 
 int cros_ec_get_cmd_versions(struct cros_ec_device *ec_dev, u16 cmd);
 
+struct cros_ec_device *cros_ec_device_alloc(struct device *dev);
+void cros_ec_device_get(struct cros_ec_device *ec_dev);
+void cros_ec_device_put(struct cros_ec_device *ec_dev);
 bool cros_ec_device_registered(struct cros_ec_device *ec_dev);
 
 /**
-- 
2.50.0.727.gbf7dc18ff4-goog

