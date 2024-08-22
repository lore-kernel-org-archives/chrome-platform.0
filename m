Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2994185B4B
	for <chrome-platform@lists.linux.dev>; Thu, 22 Aug 2024 09:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724318453; cv=none; b=NAU0Mb5M32nQHsC8tddAznIBJAGjxkR/3m9XnJQdKaLk2WZTs0n7q8J2xBMSDneCjKthuS8DIt7ZE1Vk3cXH2JVlXk9rVHfZHbyd9Fn5ERxmco8GZ4/Lf8BGApm8CZevngZHjeSInVMq7NnjlgV77gdBAW0naUsc/OtiSldsJqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724318453; c=relaxed/simple;
	bh=7PXjrfDF7BHqqcZZ2pniX9XcCoIrPJyShubjWsTVSL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kRxNzXfdkMfforVaDDjjrm2s/HkwWMf3dLdU59030J1VLOfAjuQDfrHTo2HY3WgkYBppuuMZnU13urfie4oKLCTo2dYmqGSWlZ9bCZP0tteiFXvrFUH8TcDxnBvkswBNjM8Cp+luzBn5Qu2f96RZ6IDCBfZ21BmfICmQxhpLzbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fQmAtdDp; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fQmAtdDp"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-27018df4ff3so387293fac.1
        for <chrome-platform@lists.linux.dev>; Thu, 22 Aug 2024 02:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724318450; x=1724923250; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oIuVa6xe5T9fPXAC3Ljp+tme57B/5X5NOOiRmoSNKDs=;
        b=fQmAtdDpXZZjuyhuYg0tJN578gcJ3B4gdGaiMiuJp+SXPcZ4YwUI3C+jJtcENt3WTA
         1BNY+abeR2SjU0l8sFEtCB+kJLVHegzX12D5MNG9vjumeqGHE8+mVjXHgs4bJFXGnlya
         hMHlMzhAc+BVFO6D1F88N5RV1CfqR+TNnAPBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724318450; x=1724923250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oIuVa6xe5T9fPXAC3Ljp+tme57B/5X5NOOiRmoSNKDs=;
        b=bcuOujuyuvabXZ68j5gOQWomm5nfw3jcWswskTFfKDyvLaU+CBfiSwjWDYUCx3y14a
         zeprJLVJjqO2hGp7V7VbNNgN0DDvgCZVy2qRdp9ZHa5Ws5jrcPykJXos7FOrUyoLFw0s
         VwtS94wT0I4j4ekvT343R/U9UqRPV+Syc0xfiCgECUs/TO+KUY03ZTt96gbWWFkxLc6W
         CmfIGvbPKvO7tX8W43TsctpenUij1NUTr37Wxibt5L4t/IcD59byEi3oKoQN577JyHk0
         ATU3S/+0F5JsvZWNzZvOL6+kGwi0cwKN2Jx/ETk+a31TiBCyWNTwiH3duZTRRA3DUJ/R
         HNmg==
X-Forwarded-Encrypted: i=1; AJvYcCWXU7C9/J6qp0eBtEsUFi/X6outBL9qYjELrUVnF9rzOOJRn5vF5VxrAytt6Lp72fACIAQd7Wn2JEBkmOHCMAY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzXbcl2dyd8bgER0eib+aBGE1qmLrjU6kDyIxBR5dGudLcpOBHX
	pXmyMglOEkXqFdOsnP+TE2A4Y6sNQrwiQLfZxPM6VEtE7tJ09MC6rKRhgh8RUA==
X-Google-Smtp-Source: AGHT+IE7GKAi5GcWfleItjZNggbXuAhjFv7VDxVtEAzSHPTiX6tW2gRy6Kxe6kC20IJZDqjxfuUcSg==
X-Received: by 2002:a05:6870:7a07:b0:260:fc49:3e96 with SMTP id 586e51a60fabf-273cff98fcbmr1222495fac.46.1724318449803;
        Thu, 22 Aug 2024 02:20:49 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8470:6a67:8877:ce2c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434335e69sm951398b3a.194.2024.08.22.02.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:20:49 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v5 08/10] i2c: of-prober: Add GPIO support
Date: Thu, 22 Aug 2024 17:20:01 +0800
Message-ID: <20240822092006.3134096-9-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
In-Reply-To: <20240822092006.3134096-1-wenst@chromium.org>
References: <20240822092006.3134096-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds GPIO management to the I2C OF component prober.
Components that the prober intends to probe likely require their
regulator supplies be enabled, and GPIOs be toggled to enable them or
bring them out of reset before they will respond to probe attempts.
regulator support was added in the previous patch.

Without specific knowledge of each component's resource names or
power sequencing requirements, the prober can only enable the
regulator supplies all at once, and toggle the GPIOs all at once.
Luckily, reset pins tend to be active low, while enable pins tend to
be active high, so setting the raw status of all GPIO pins to high
should work. The wait time before and after resources are enabled
are collected from existing drivers and device trees.

The prober collects resources from all possible components and enables
them together, instead of enabling resources and probing each component
one by one. The latter approach does not provide any boot time benefits
over simply enabling each component and letting each driver probe
sequentially.

The prober will also deduplicate the resources, since on a component
swap out or co-layout design, the resources are always the same.
While duplicate regulator supplies won't cause much issue, shared
GPIOs don't work reliably, especially with other drivers. For the
same reason, the prober will release the GPIOs before the successfully
probed component is actually enabled.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

---
Changes since v4:
- Split out from previous patch
- Moved GPIO property name check to common function in gpiolib.c in new
  patch
- Moved i2c_of_probe_free_gpios() into for_each_child_of_node_scoped()
- Rewrote in gpiod_*_array-esque fashion
---
 drivers/i2c/i2c-core-of-prober.c | 126 ++++++++++++++++++++++++++++++-
 1 file changed, 124 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index 32184cfd10f6..046e6605053c 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -10,6 +10,7 @@
 #include <linux/device.h>
 #include <linux/dev_printk.h>
 #include <linux/err.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -29,11 +30,11 @@
  * address responds.
  *
  * TODO:
- * - Support handling common GPIOs.
  * - Support I2C muxes
  */
 
 struct i2c_of_probe_data {
+	struct gpio_descs *gpiods;
 	struct regulator_bulk_data *regulators;
 	unsigned int regulators_num;
 };
@@ -71,8 +72,88 @@ static int i2c_of_probe_get_regulator(struct device *dev, struct device_node *no
 	return ret;
 }
 
+/*
+ * Returns 1 if property is GPIO and GPIO successfully requested,
+ * 0 if not a GPIO property, or error if request for GPIO failed.
+ */
+static int i2c_of_probe_get_gpiod(struct device_node *node, struct property *prop,
+				  struct i2c_of_probe_data *data)
+{
+	struct fwnode_handle *fwnode = of_fwnode_handle(node);
+	struct gpio_descs *gpiods;
+	struct gpio_desc *gpiod;
+	char con[32]; /* 32 is max size of property name */
+	char *con_id = NULL;
+	size_t new_size;
+	int len;
+
+	len = gpio_property_name_length(prop->name);
+	if (len < 0)
+		return 0;
+
+	if (len >= sizeof(con) - 1) {
+		pr_err("%pOF: length of GPIO name \"%s\" exceeds current limit\n",
+		       node, prop->name);
+		return -EINVAL;
+	}
+
+	if (len > 0) {
+		strscpy(con, prop->name, len + 1);
+		con_id = con;
+	}
+
+	/*
+	 * GPIO descriptors are not reference counted. GPIOD_FLAGS_BIT_NONEXCLUSIVE
+	 * can't differentiate between GPIOs shared between devices to be probed and
+	 * other devices (which is incorrect). If the initial request fails with
+	 * -EBUSY, retry with GPIOD_FLAGS_BIT_NONEXCLUSIVE and see if it matches
+	 * any existing ones.
+	 */
+	gpiod = fwnode_gpiod_get_index(fwnode, con_id, 0, GPIOD_ASIS, "i2c-of-prober");
+	if (IS_ERR(gpiod)) {
+		int i;
+
+		if (PTR_ERR(gpiod) != -EBUSY || !data->gpiods)
+			return PTR_ERR(gpiod);
+
+		gpiod = fwnode_gpiod_get_index(fwnode, con_id, 0,
+					       GPIOD_ASIS | GPIOD_FLAGS_BIT_NONEXCLUSIVE,
+					       "i2c-of-prober");
+		for (i = 0; i < data->gpiods->ndescs; i++)
+			if (gpiod == data->gpiods->desc[i])
+				return 1;
+
+		return -EBUSY;
+	}
+
+	new_size = struct_size(gpiods, desc, data->gpiods ? data->gpiods->ndescs + 1 : 1);
+	gpiods = krealloc(data->gpiods, new_size, GFP_KERNEL);
+	if (!gpiods) {
+		gpiod_put(gpiod);
+		return -ENOMEM;
+	}
+
+	data->gpiods = gpiods;
+	data->gpiods->desc[data->gpiods->ndescs++] = gpiod;
+
+	return 1;
+}
+
+/*
+ * This is split into two functions because in the normal flow the GPIOs
+ * have to be released before the actual driver probes so that the latter
+ * can acquire them.
+ */
+static void i2c_of_probe_free_gpios(struct i2c_of_probe_data *data)
+{
+	if (data->gpiods)
+		gpiod_put_array(data->gpiods);
+	data->gpiods = NULL;
+}
+
 static void i2c_of_probe_free_res(struct i2c_of_probe_data *data)
 {
+	i2c_of_probe_free_gpios(data);
 	regulator_bulk_free(data->regulators_num, data->regulators);
 }
 
@@ -88,6 +169,18 @@ static int i2c_of_probe_get_res(struct device *dev, struct device_node *node,
 		goto err_cleanup;
 	}
 
+	for_each_property_of_node(node, prop) {
+		dev_dbg(dev, "Trying property %pOF/%s\n", node, prop->name);
+
+		/* GPIOs */
+		ret = i2c_of_probe_get_gpiod(node, prop, data);
+		if (ret < 0) {
+			dev_err_probe(dev, ret, "Failed to get GPIO from %pOF/%s\n",
+				      node, prop->name);
+			goto err_cleanup;
+		}
+	}
+
 	return 0;
 
 err_cleanup:
@@ -98,6 +191,7 @@ static int i2c_of_probe_get_res(struct device *dev, struct device_node *node,
 static int i2c_of_probe_enable_res(struct device *dev, struct i2c_of_probe_data *data)
 {
 	int ret = 0;
+	int gpio_i;
 
 	dev_dbg(dev, "Enabling regulator supplies\n");
 
@@ -108,7 +202,32 @@ static int i2c_of_probe_enable_res(struct device *dev, struct i2c_of_probe_data
 	/* largest post-power-on pre-reset-deassert delay seen among drivers */
 	msleep(500);
 
+	if (!data->gpiods)
+		return 0;
+
+	for (gpio_i = 0; gpio_i < data->gpiods->ndescs; gpio_i++) {
+		/*
+		 * reset GPIOs normally have opposite polarity compared to
+		 * enable GPIOs. Instead of parsing the flags again, simply
+		 * set the raw value to high.
+		 */
+		dev_dbg(dev, "Setting GPIO %d\n", gpio_i);
+		ret = gpiod_direction_output_raw(data->gpiods->desc[gpio_i], 1);
+		if (ret)
+			goto disable_gpios;
+	}
+
+	/* largest post-reset-deassert delay seen in tree for Elan I2C HID */
+	msleep(300);
+
 	return 0;
+
+disable_gpios:
+	for (gpio_i--; gpio_i >= 0; gpio_i--)
+		gpiod_set_raw_value_cansleep(data->gpiods->desc[gpio_i], 0);
+	regulator_bulk_disable(data->regulators_num, data->regulators);
+
+	return ret;
 }
 
 static void i2c_of_probe_disable_regulators(struct i2c_of_probe_data *data)
@@ -234,7 +353,9 @@ int i2c_of_probe_component(struct device *dev, const char *type)
 			return ret;
 	}
 
-	dev_dbg(dev, "Resources: # of regulator supplies = %d\n", probe_data.regulators_num);
+	dev_dbg(dev, "Resources: # of GPIOs = %d, # of regulator supplies = %d\n",
+		probe_data.gpiods ? probe_data.gpiods->ndescs : 0,
+		probe_data.regulators_num);
 
 	/* Enable resources */
 	ret = i2c_of_probe_enable_res(dev, &probe_data);
@@ -256,6 +377,7 @@ int i2c_of_probe_component(struct device *dev, const char *type)
 			continue;
 
 		/* Found a device that is responding */
+		i2c_of_probe_free_gpios(&probe_data);
 		ret = i2c_of_probe_enable_node(dev, node);
 		break;
 	}
-- 
2.46.0.184.g6999bdac58-goog

