Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E67C17CA
	for <chrome-platform@lists.linux.dev>; Wed, 12 Oct 2022 04:10:04 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id p3-20020a17090a284300b0020a85fa3ffcso883594pjf.2
        for <chrome-platform@lists.linux.dev>; Tue, 11 Oct 2022 21:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMYmfDXtL0KG/q4RUcOljekTDXhrXEWn1lhT/Gvet50=;
        b=KWuAptyXrV9UyQlEdIeE0PJ8h7lVIvj+GqsN3AFoOJIv2PKcs6CkTnyHETGMJ09JJ9
         OdZ3nHPANP8OmWj/wUfATpxihKgVo4ymZEx2yAiYbQEEipllFCFf3oAo37Izx8ndnVw2
         amoKih8BI0s+gMumoGvtlWR2cg/C85IaasecI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YMYmfDXtL0KG/q4RUcOljekTDXhrXEWn1lhT/Gvet50=;
        b=mVzn++jK5q0MC0DeIJGxEkGjcN/v/VPmnD6QbZSB9yKd226QJ7zQVjgT/UGCfM4JFx
         B1euUqe4YY1qRwQE1J2WCfYDqnCKpzcQ2uN3nNq1Y9rGmAIXcxfG/8KKqKcuYiyMn/AF
         SXydWzNa+zMMG2AQOjwxfzmd8+Qi03DGOxy+U7xBrfomSE4Z68Yh9nWYIfAJB6cxGftc
         Mr/+PUiZeUVx8/HVJzznDSBZebCEGFuT5pBdg1GsM87logWZ9SVM7qyKyptGW1avPbvC
         NdYUygHOZe10ExogYPOD/ACReZzj3HH1+CMKCFWwMqFr/GKb7HHMYmj97zCmDlVwpfev
         ob2Q==
X-Gm-Message-State: ACrzQf1wQaTpKBio9lZkdTnwhVeGEWzC88Lm6GOvj1iNKHqbMGaCxrzN
	ZrUOFI1rXOYyvPSTBYI3DT0eT/ANfkaIlQ==
X-Google-Smtp-Source: AMsMyM6YKrTSotw4huVpc/eDK4nwlkXh8m/Ck3eOLUC6Z7mm63RnNBMc0yDbhwrbsa7DX+1k7UvCTA==
X-Received: by 2002:a17:90b:1a88:b0:20d:8df0:ac64 with SMTP id ng8-20020a17090b1a8800b0020d8df0ac64mr685583pjb.140.1665547803039;
        Tue, 11 Oct 2022 21:10:03 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:4704:5b50:96e5:620f])
        by smtp.gmail.com with UTF8SMTPSA id m15-20020a170902f64f00b00172751a2fa4sm3325863plg.80.2022.10.11.21.10.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 21:10:02 -0700 (PDT)
From: Dan Callaghan <dcallagh@chromium.org>
To: chrome-platform@lists.linux.dev
Cc: LKML <linux-kernel@vger.kernel.org>,
	=?UTF-8?q?Sami=20Ky=C3=B6stil=C3=A4?= <skyostil@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dan Callaghan <dcallagh@chromium.org>
Subject: [PATCH v5 1/1] platform/chrome: add a driver for HPS
Date: Wed, 12 Oct 2022 15:09:18 +1100
Message-Id: <20221012040918.272582-2-dcallagh@chromium.org>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
In-Reply-To: <20221012040918.272582-1-dcallagh@chromium.org>
References: <20221012040918.272582-1-dcallagh@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Sami Kyöstilä <skyostil@chromium.org>

This patch introduces a driver for the ChromeOS human presence
sensor (aka. HPS). The driver supports a sensor connected to the I2C bus
and identified as "GOOG0020" in the ACPI tables.

When loaded, the driver exports the sensor to userspace through a
character device. This device only supports power management, i.e.,
communication with the sensor must be done through regular I2C
transmissions from userspace.

Power management is implemented by enabling the respective power GPIO
while at least one userspace process holds an open fd on the character
device. By default, the device is powered down if there are no active
clients.

Note that the driver makes no effort to preserve the state of the sensor
between power down and power up events. Userspace is responsible for
reinitializing any needed state once power has been restored.

The device firmware, I2C protocol and other documentation is available
at https://chromium.googlesource.com/chromiumos/platform/hps-firmware.

Signed-off-by: Sami Kyöstilä <skyostil@chromium.org>
Signed-off-by: Dan Callaghan <dcallagh@chromium.org>
---

Changes in v5:
- Updated MAINTAINERS.

Changes in v4:
- Simplified open/release pm logic.
- Renamed device to "cros-hps".
- Stylistics cleanups.

Changes in v3:
- Moved from drivers/misc to drivers/platform/chrome.

Changes in v2:
- Removed custom ioctl interface.
- Reworked to use miscdev.

 MAINTAINERS                            |   6 +
 drivers/platform/chrome/Kconfig        |  10 ++
 drivers/platform/chrome/Makefile       |   1 +
 drivers/platform/chrome/cros_hps_i2c.c | 151 +++++++++++++++++++++++++
 4 files changed, 168 insertions(+)
 create mode 100644 drivers/platform/chrome/cros_hps_i2c.c

diff --git a/MAINTAINERS b/MAINTAINERS
index c1e4977cb1c3..13bfab399219 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4903,6 +4903,12 @@ S:	Maintained
 F:	drivers/platform/chrome/cros_usbpd_notify.c
 F:	include/linux/platform_data/cros_usbpd_notify.h
 
+CHROMEOS HPS DRIVER
+M:	Dan Callaghan <dcallagh@chromium.org>
+R:	Sami Kyöstilä <skyostil@chromium.org>
+S:	Maintained
+F:	drivers/platform/chrome/cros_hps_i2c.c
+
 CHRONTEL CH7322 CEC DRIVER
 M:	Joe Tessler <jrt@google.com>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
index 6b954c5acadb..c1ca247987d2 100644
--- a/drivers/platform/chrome/Kconfig
+++ b/drivers/platform/chrome/Kconfig
@@ -228,6 +228,16 @@ config CROS_EC_TYPEC
 	  To compile this driver as a module, choose M here: the module will be
 	  called cros_ec_typec.
 
+config CROS_HPS_I2C
+	tristate "ChromeOS HPS device"
+	depends on HID && I2C && PM
+	help
+	  Say Y here if you want to enable support for the ChromeOS
+	  human presence sensor (HPS), attached via I2C. The driver supports a
+	  sensor connected to the I2C bus and exposes it as a character device.
+	  To save power, the sensor is automatically powered down when no
+	  clients are accessing it.
+
 config CROS_USBPD_LOGGER
 	tristate "Logging driver for USB PD charger"
 	depends on CHARGER_CROS_USBPD
diff --git a/drivers/platform/chrome/Makefile b/drivers/platform/chrome/Makefile
index 2950610101f1..f6068d077a40 100644
--- a/drivers/platform/chrome/Makefile
+++ b/drivers/platform/chrome/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_CROS_EC_DEBUGFS)		+= cros_ec_debugfs.o
 cros-ec-sensorhub-objs			:= cros_ec_sensorhub.o cros_ec_sensorhub_ring.o
 obj-$(CONFIG_CROS_EC_SENSORHUB)		+= cros-ec-sensorhub.o
 obj-$(CONFIG_CROS_EC_SYSFS)		+= cros_ec_sysfs.o
+obj-$(CONFIG_CROS_HPS_I2C)		+= cros_hps_i2c.o
 obj-$(CONFIG_CROS_USBPD_LOGGER)		+= cros_usbpd_logger.o
 obj-$(CONFIG_CROS_USBPD_NOTIFY)		+= cros_usbpd_notify.o
 
diff --git a/drivers/platform/chrome/cros_hps_i2c.c b/drivers/platform/chrome/cros_hps_i2c.c
new file mode 100644
index 000000000000..a5505951f989
--- /dev/null
+++ b/drivers/platform/chrome/cros_hps_i2c.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for the ChromeOS human presence sensor (HPS), attached via I2C.
+ *
+ * The driver exposes HPS as a character device, although currently no read or
+ * write operations are supported. Instead, the driver only controls the power
+ * state of the sensor, keeping it on only while userspace holds an open file
+ * descriptor to the HPS device.
+ *
+ * Copyright 2022 Google LLC.
+ */
+
+#include <linux/acpi.h>
+#include <linux/fs.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+
+#define HPS_ACPI_ID		"GOOG0020"
+
+struct hps_drvdata {
+	struct i2c_client *client;
+	struct miscdevice misc_device;
+	struct gpio_desc *enable_gpio;
+};
+
+static void hps_set_power(struct hps_drvdata *hps, bool state)
+{
+	gpiod_set_value_cansleep(hps->enable_gpio, state);
+}
+
+static int hps_open(struct inode *inode, struct file *file)
+{
+	struct hps_drvdata *hps = container_of(file->private_data,
+					       struct hps_drvdata, misc_device);
+	struct device *dev = &hps->client->dev;
+
+	return pm_runtime_resume_and_get(dev);
+}
+
+static int hps_release(struct inode *inode, struct file *file)
+{
+	struct hps_drvdata *hps = container_of(file->private_data,
+					       struct hps_drvdata, misc_device);
+	struct device *dev = &hps->client->dev;
+
+	return pm_runtime_put(dev);
+}
+
+static const struct file_operations hps_fops = {
+	.owner = THIS_MODULE,
+	.open = hps_open,
+	.release = hps_release,
+};
+
+static int hps_i2c_probe(struct i2c_client *client)
+{
+	struct hps_drvdata *hps;
+	int ret;
+
+	hps = devm_kzalloc(&client->dev, sizeof(*hps), GFP_KERNEL);
+	if (!hps)
+		return -ENOMEM;
+
+	memset(&hps->misc_device, 0, sizeof(hps->misc_device));
+	hps->misc_device.parent = &client->dev;
+	hps->misc_device.minor = MISC_DYNAMIC_MINOR;
+	hps->misc_device.name = "cros-hps";
+	hps->misc_device.fops = &hps_fops;
+
+	i2c_set_clientdata(client, hps);
+	hps->client = client;
+	hps->enable_gpio = devm_gpiod_get(&client->dev, "enable", GPIOD_OUT_HIGH);
+	if (IS_ERR(hps->enable_gpio)) {
+		ret = PTR_ERR(hps->enable_gpio);
+		dev_err(&client->dev, "failed to get enable gpio: %d\n", ret);
+		return ret;
+	}
+
+	ret = misc_register(&hps->misc_device);
+	if (ret) {
+		dev_err(&client->dev, "failed to initialize misc device: %d\n", ret);
+		return ret;
+	}
+
+	hps_set_power(hps, false);
+	pm_runtime_enable(&client->dev);
+	return 0;
+}
+
+static int hps_i2c_remove(struct i2c_client *client)
+{
+	struct hps_drvdata *hps = i2c_get_clientdata(client);
+
+	pm_runtime_disable(&client->dev);
+	misc_deregister(&hps->misc_device);
+	hps_set_power(hps, true);
+	return 0;
+}
+
+static int hps_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct hps_drvdata *hps = i2c_get_clientdata(client);
+
+	hps_set_power(hps, false);
+	return 0;
+}
+
+static int hps_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct hps_drvdata *hps = i2c_get_clientdata(client);
+
+	hps_set_power(hps, true);
+	return 0;
+}
+static UNIVERSAL_DEV_PM_OPS(hps_pm_ops, hps_suspend, hps_resume, NULL);
+
+static const struct i2c_device_id hps_i2c_id[] = {
+	{ "cros-hps", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, hps_i2c_id);
+
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id hps_acpi_id[] = {
+	{ HPS_ACPI_ID, 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, hps_acpi_id);
+#endif /* CONFIG_ACPI */
+
+static struct i2c_driver hps_i2c_driver = {
+	.probe_new = hps_i2c_probe,
+	.remove = hps_i2c_remove,
+	.id_table = hps_i2c_id,
+	.driver = {
+		.name = "cros-hps",
+		.pm = &hps_pm_ops,
+		.acpi_match_table = ACPI_PTR(hps_acpi_id),
+	},
+};
+module_i2c_driver(hps_i2c_driver);
+
+MODULE_ALIAS("acpi:" HPS_ACPI_ID);
+MODULE_AUTHOR("Sami Kyöstilä <skyostil@chromium.org>");
+MODULE_DESCRIPTION("Driver for ChromeOS HPS");
+MODULE_LICENSE("GPL");
-- 
2.38.0.rc1.362.ged0d419d3c-goog

