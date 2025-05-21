Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CFE23E33A
	for <chrome-platform@lists.linux.dev>; Wed, 21 May 2025 23:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747871474; cv=none; b=E7PiAWrwjN7E1pye79+n+VLo+PoR0+H8F4aVDr+F6nN/eztFgNwpdmQhp4WuWwEuQgmxu+FWwF40be6N0LHtGO1tWhlDMQO+RTCvnWJpyO9n5atPV04wbm60Lu55yPpaVAK77PgmHSXZDtKOEYo68NdG/BBf/7CzGN0qov48ujc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747871474; c=relaxed/simple;
	bh=+3IWNZAlvXEoMmP7ekvMLseDpaw9AdtX5YIxnNMJ4Dg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZvYrSocY5ZkGvBIyekJybQ5s/WZZ86fl8NTlGBvum3/6yr0G5BqRCRah8HDVIEee+QoyNWX5Gnnk1YA807gC6qQpMlnDvBjAsA+tQ00vGq0Sg4IwSEhHT5kJ920VuSiUzyzkcYUvW3j2LvPgsNnDS8WeaDxA6VNUb4yhQ7ls9NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N+0Q4ds0; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N+0Q4ds0"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-23035b3edf1so61149055ad.3
        for <chrome-platform@lists.linux.dev>; Wed, 21 May 2025 16:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747871472; x=1748476272; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H9hC2FRmi2gymXY99QJfYXgymNkTkIUJqKX26DDvHc0=;
        b=N+0Q4ds0IETi81wN6pqtjTOwqD0Y1rLEtrVqesAIyZWqjM8/9Kl9V7vsWrkXEoZT8Z
         9hx4kPcB42qJPpVS/FoIfSjW7aJQfZedh52dzQBCd6YWvf1HDhpWa8fP1MLZylF55CZ3
         kemL4oTa6f1aVsUW2NT0KPj5tY8eAMsUPYXak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747871472; x=1748476272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H9hC2FRmi2gymXY99QJfYXgymNkTkIUJqKX26DDvHc0=;
        b=qjIwYhTByOrYmpk9lRMGSHvpbUOiRfSU2WYjlE5rsJIsm7iizk9RniKT11Ac/r/Oyx
         7PDZYl8ScgZOj2QZ89RFWS5aMSJSH2e+GchW2u2IlxNyxtRCNnz/53sMNNjrQhOMbqQU
         JqUbJCc+2RFk+Mo8h2yxw/Oz6NUTy2oAw6R/tvuTG2KFhV3ohFriD9PnG/zhJe3/qvip
         NW8sOEqFKIlFgZqRv1GnmTnGc2WpbIKrACx+SaxVm5QKoeCCUedLYzVeeNMD7AZSb2Vj
         4j5yRQ10RcG/wxQxfPfbDbqFLosjCSQhs/qB/xtFMTszOsOJD+eIWmwHGTbdI9Q/B2d/
         uh5A==
X-Gm-Message-State: AOJu0Yx86RQXN8B+SiopuFNM9ra02ekiJPjwdmiCADhUSoaSmNfAnN+1
	vxZ1cnQCelK+9lK1iWhOoAPTMqgKCccjyqRqZZ/Xy7rsXaEZ2ZZPuJ04mCMWOvv6IQ==
X-Gm-Gg: ASbGncvnEyYxk777ucjGcTyXeCW8T5HIY3oD3pUH+x5PadpVHbhJMG4bJR2nd+Ydq07
	B21rJHdpQXgweeF1xuiqoKefkiaxQfvmrlQ10vnwjz0276bvmpLVKcb2JDLFEBZjFIaP3FrzMd6
	EvdcYp18vgFVQt0phgnRuLneeGZIgRXPDN/R3aL0YBvJxkuA02edqtfKOOVQWdMIBv1dYPnwfF5
	PQUEXMvcbWVu5q1gG2koANCdZC54eHlOaVmn+kX4i75mjCfI1J4u4MWjCRofGgRf8qGKBYalw3g
	iU9Qm4J52YFE2/lmgR9rySn8/9lUl1pOHcd40RJV9UpD
X-Google-Smtp-Source: AGHT+IFUP8QWQLK9wp+rilARdgKJsTNxh31AmEv2URQh+4tER8xq/Wpyyj0251T01fdFpIQT9JexRg==
X-Received: by 2002:a17:903:25c7:b0:231:e331:b7df with SMTP id d9443c01a7336-231e331bbbbmr247383665ad.29.1747871471954;
        Wed, 21 May 2025 16:51:11 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:9e0a:3224:dd11:f8a4])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-231d4ed23a8sm98501865ad.220.2025.05.21.16.51.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 16:51:11 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
X-Google-Original-From: Gwendal Grignou <gwendal@google.com>
To: jic23@kernel.org,
	tzungbi@kernel.org
Cc: chrome-platform@lists.linux.dev,
	linux-iio@vger.kernel.org,
	Gwendal Grignou <gwendal@google.com>
Subject: [PATCH v2] iio: cros_ec_sensors: add cros_ec_activity driver
Date: Wed, 21 May 2025 16:51:08 -0700
Message-ID: <20250521235108.2088274-1-gwendal@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ChromeOS EC can report activity information derived from the
accelerometer:
- Reports on-body/off-body as a proximity event.
- Reports significant motion as an activity event.

This new sensor is a virtual sensor, included only when the EC firmware
is compiled with the appropriate module.

Signed-off-by: Gwendal Grignou <gwendal@google.com>
---
Changes in v2:
- fix usage of cros_ec_motion_send_host_cmd
- use dev instead of &pdev->dev
- fix documentation errors.

 drivers/iio/common/cros_ec_sensors/Kconfig    |   9 +
 drivers/iio/common/cros_ec_sensors/Makefile   |   1 +
 .../common/cros_ec_sensors/cros_ec_activity.c | 325 ++++++++++++++++++
 .../cros_ec_sensors/cros_ec_sensors_core.c    |  10 +
 .../linux/iio/common/cros_ec_sensors_core.h   |   1 +
 .../linux/platform_data/cros_ec_commands.h    |  36 +-
 6 files changed, 376 insertions(+), 6 deletions(-)
 create mode 100644 drivers/iio/common/cros_ec_sensors/cros_ec_activity.c

diff --git a/drivers/iio/common/cros_ec_sensors/Kconfig b/drivers/iio/common/cros_ec_sensors/Kconfig
index fefad9572790..394e319c9c97 100644
--- a/drivers/iio/common/cros_ec_sensors/Kconfig
+++ b/drivers/iio/common/cros_ec_sensors/Kconfig
@@ -30,3 +30,12 @@ config IIO_CROS_EC_SENSORS_LID_ANGLE
 	  convertible devices.
 	  This module is loaded when the EC can calculate the angle between the base
 	  and the lid.
+
+config IIO_CROS_EC_ACTIVITY
+	tristate "ChromeOS EC Activity Sensors"
+	depends on IIO_CROS_EC_SENSORS_CORE
+	help
+	  Module to handle activity events presented by the ChromeOS EC sensor hub.
+	  Activities can be a proximity detector (on body/off body detection)
+	  or a significant motion detector.
+	  Creates an IIO device to manage all activities.
diff --git a/drivers/iio/common/cros_ec_sensors/Makefile b/drivers/iio/common/cros_ec_sensors/Makefile
index e0a33ab66d21..a7849c52f3c8 100644
--- a/drivers/iio/common/cros_ec_sensors/Makefile
+++ b/drivers/iio/common/cros_ec_sensors/Makefile
@@ -3,6 +3,7 @@
 # Makefile for sensors seen through the ChromeOS EC sensor hub.
 #
 
+obj-$(CONFIG_IIO_CROS_EC_ACTIVITY) += cros_ec_activity.o
 obj-$(CONFIG_IIO_CROS_EC_SENSORS_CORE) += cros_ec_sensors_core.o
 obj-$(CONFIG_IIO_CROS_EC_SENSORS) += cros_ec_sensors.o
 obj-$(CONFIG_IIO_CROS_EC_SENSORS_LID_ANGLE) += cros_ec_lid_angle.o
diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_activity.c b/drivers/iio/common/cros_ec_sensors/cros_ec_activity.c
new file mode 100644
index 000000000000..81c6ae0f44ad
--- /dev/null
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_activity.c
@@ -0,0 +1,325 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * cros_ec_sensors_activity - Driver for activities/gesture recognition.
+ *
+ * Copyright 2025 Google, Inc
+ *
+ * This driver uses the cros-ec interface to communicate with the ChromeOS
+ * EC about activity data. Accelerometer access is presented through iio sysfs.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+
+#include <linux/platform_data/cros_ec_commands.h>
+#include <linux/platform_data/cros_ec_proto.h>
+
+#include <linux/iio/common/cros_ec_sensors_core.h>
+#include <linux/iio/events.h>
+#include <linux/iio/iio.h>
+#include <linux/iio/trigger_consumer.h>
+
+#define DRV_NAME "cros-ec-activity"
+
+/* state data for ec_sensors iio driver. */
+struct cros_ec_sensors_state {
+	/* Shared by all sensors */
+	struct cros_ec_sensors_core_state core;
+
+	struct iio_chan_spec *channels;
+
+	int body_detection_channel_index;
+	int sig_motion_channel_index;
+};
+
+static const struct iio_event_spec cros_ec_activity_single_shot[] = {
+	{
+		.type = IIO_EV_TYPE_CHANGE,
+		/* significant motion trigger when we get out of still. */
+		.dir = IIO_EV_DIR_FALLING,
+		.mask_separate = BIT(IIO_EV_INFO_ENABLE),
+	},
+};
+
+static const struct iio_event_spec cros_ec_body_detect_events[] = {
+	{
+		.type = IIO_EV_TYPE_CHANGE,
+		.dir = IIO_EV_DIR_EITHER,
+		.mask_separate = BIT(IIO_EV_INFO_ENABLE),
+	},
+};
+
+static int ec_sensors_read(struct iio_dev *indio_dev,
+			   struct iio_chan_spec const *chan,
+			   int *val, int *val2, long mask)
+{
+	struct cros_ec_sensors_state *st = iio_priv(indio_dev);
+	int ret;
+
+	mutex_lock(&st->core.cmd_lock);
+	if (chan->type == IIO_PROXIMITY && mask == IIO_CHAN_INFO_RAW) {
+		st->core.param.cmd = MOTIONSENSE_CMD_GET_ACTIVITY;
+		st->core.param.get_activity.activity =
+			MOTIONSENSE_ACTIVITY_BODY_DETECTION;
+		ret = cros_ec_motion_send_host_cmd(&st->core, 0);
+		if (ret == 0) {
+			*val = st->core.resp->get_activity.state;
+			ret = IIO_VAL_INT;
+		}
+	} else {
+		ret = -EINVAL;
+	}
+	mutex_unlock(&st->core.cmd_lock);
+	return ret;
+}
+
+static int cros_ec_read_event_config(struct iio_dev *indio_dev,
+				     const struct iio_chan_spec *chan,
+				     enum iio_event_type type,
+				     enum iio_event_direction dir)
+{
+	struct cros_ec_sensors_state *st = iio_priv(indio_dev);
+	int ret;
+
+	if (chan->type != IIO_ACTIVITY && chan->type != IIO_PROXIMITY)
+		return -EINVAL;
+
+	mutex_lock(&st->core.cmd_lock);
+	st->core.param.cmd = MOTIONSENSE_CMD_LIST_ACTIVITIES;
+	ret = cros_ec_motion_send_host_cmd(&st->core, 0);
+	if (ret)
+		goto done;
+	switch (chan->type) {
+	case IIO_PROXIMITY:
+		ret = !!(st->core.resp->list_activities.enabled &
+			 (1 << MOTIONSENSE_ACTIVITY_BODY_DETECTION));
+		break;
+	case IIO_ACTIVITY:
+		if (chan->channel2 == IIO_MOD_STILL) {
+			ret = !!(st->core.resp->list_activities.enabled &
+				 (1 << MOTIONSENSE_ACTIVITY_SIG_MOTION));
+		} else {
+			dev_warn(&indio_dev->dev, "Unknown activity: %d\n",
+				 chan->channel2);
+			ret = -EINVAL;
+		}
+		break;
+	default:
+		dev_warn(&indio_dev->dev, "Unknown channel type: %d\n",
+			 chan->type);
+		ret = -EINVAL;
+	}
+done:
+	mutex_unlock(&st->core.cmd_lock);
+	return ret;
+}
+
+static int cros_ec_write_event_config(struct iio_dev *indio_dev,
+				      const struct iio_chan_spec *chan,
+				      enum iio_event_type type,
+				      enum iio_event_direction dir, int state)
+{
+	struct cros_ec_sensors_state *st = iio_priv(indio_dev);
+	int ret;
+
+	if (chan->type != IIO_ACTIVITY && chan->type != IIO_PROXIMITY)
+		return -EINVAL;
+
+	mutex_lock(&st->core.cmd_lock);
+	st->core.param.cmd = MOTIONSENSE_CMD_SET_ACTIVITY;
+	switch (chan->type) {
+	case IIO_PROXIMITY:
+		st->core.param.set_activity.activity =
+			MOTIONSENSE_ACTIVITY_BODY_DETECTION;
+		break;
+	case IIO_ACTIVITY:
+		if (chan->channel2 == IIO_MOD_STILL) {
+			st->core.param.set_activity.activity =
+				MOTIONSENSE_ACTIVITY_SIG_MOTION;
+		} else {
+			dev_warn(&indio_dev->dev, "Unknown activity: %d\n",
+				 chan->channel2);
+		}
+		break;
+	default:
+		dev_warn(&indio_dev->dev, "Unknown channel type: %d\n",
+			 chan->type);
+	}
+	st->core.param.set_activity.enable = state;
+
+	ret = cros_ec_motion_send_host_cmd(&st->core, 0);
+
+	mutex_unlock(&st->core.cmd_lock);
+	return ret;
+}
+
+static int cros_ec_activity_push_data(struct iio_dev *indio_dev,
+				      s16 *data,
+				      s64 timestamp)
+{
+	struct ec_response_activity_data *activity_data =
+			(struct ec_response_activity_data *)data;
+	enum motionsensor_activity activity = activity_data->activity;
+	u8 state = activity_data->state;
+	const struct cros_ec_sensors_state *st = iio_priv(indio_dev);
+	const struct iio_chan_spec *chan;
+	const struct iio_event_spec *event;
+	enum iio_event_direction dir;
+	int index;
+	u64 ev;
+
+	switch (activity) {
+	case MOTIONSENSE_ACTIVITY_BODY_DETECTION:
+		index = st->body_detection_channel_index;
+		dir = state ? IIO_EV_DIR_FALLING : IIO_EV_DIR_RISING;
+		break;
+	case MOTIONSENSE_ACTIVITY_SIG_MOTION:
+		index = st->sig_motion_channel_index;
+		dir = IIO_EV_DIR_FALLING;
+		break;
+	default:
+		dev_warn(&indio_dev->dev, "Unknown activity: %d\n", activity);
+		return 0;
+	}
+	chan = &st->channels[index];
+	event = &chan->event_spec[0];
+
+	ev = IIO_UNMOD_EVENT_CODE(chan->type, index, event->type, dir);
+	iio_push_event(indio_dev, ev, timestamp);
+	return 0;
+}
+
+static irqreturn_t cros_ec_activity_capture(int irq, void *p)
+{
+	struct iio_poll_func *pf = p;
+	struct iio_dev *indio_dev = pf->indio_dev;
+
+	dev_warn(&indio_dev->dev, "%s: Not Expected\n", __func__);
+	return IRQ_NONE;
+}
+
+static const struct iio_info ec_sensors_info = {
+	.read_raw = &ec_sensors_read,
+	.read_event_config = cros_ec_read_event_config,
+	.write_event_config = cros_ec_write_event_config,
+};
+
+static int cros_ec_sensors_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cros_ec_device *ec_device = dev_get_drvdata(dev->parent);
+	struct iio_dev *indio_dev;
+	struct cros_ec_sensors_state *st;
+	struct iio_chan_spec *channel;
+	unsigned long activities;
+	int i, index, ret, nb_activities;
+
+	if (!ec_device) {
+		dev_warn(dev, "No CROS EC device found.\n");
+		return -EINVAL;
+	}
+
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*st));
+	if (!indio_dev)
+		return -ENOMEM;
+
+	ret = cros_ec_sensors_core_init(pdev, indio_dev, true,
+					cros_ec_activity_capture);
+	if (ret)
+		return ret;
+
+	indio_dev->info = &ec_sensors_info;
+	st = iio_priv(indio_dev);
+	st->core.type = st->core.resp->info.type;
+	st->core.read_ec_sensors_data = cros_ec_sensors_read_cmd;
+
+	/*
+	 * List all available activities
+	 */
+	st->core.param.cmd = MOTIONSENSE_CMD_LIST_ACTIVITIES;
+	ret = cros_ec_motion_send_host_cmd(&st->core, 0);
+	if (ret)
+		return ret;
+	activities = st->core.resp->list_activities.enabled |
+		     st->core.resp->list_activities.disabled;
+	nb_activities = hweight_long(activities) + 1;
+
+	if (!activities)
+		return -ENODEV;
+
+	/* Allocate a channel per activity and one for timestamp */
+	st->channels = devm_kcalloc(dev, nb_activities,
+				    sizeof(*st->channels), GFP_KERNEL);
+	if (!st->channels)
+		return -ENOMEM;
+
+	channel = &st->channels[0];
+	index = 0;
+	for_each_set_bit(i, &activities, BITS_PER_LONG) {
+		channel->scan_index = index++;
+
+		/* List all available triggers */
+		if (i == MOTIONSENSE_ACTIVITY_BODY_DETECTION) {
+			channel->type = IIO_PROXIMITY;
+			channel->info_mask_separate = BIT(IIO_CHAN_INFO_RAW);
+			channel->modified = 0;
+			channel->event_spec = cros_ec_body_detect_events;
+			channel->num_event_specs =
+				ARRAY_SIZE(cros_ec_body_detect_events);
+			st->body_detection_channel_index = channel->scan_index;
+		} else {
+			channel->type = IIO_ACTIVITY;
+			channel->modified = 1;
+			channel->event_spec = cros_ec_activity_single_shot;
+			channel->num_event_specs =
+				ARRAY_SIZE(cros_ec_activity_single_shot);
+			if (i == MOTIONSENSE_ACTIVITY_SIG_MOTION) {
+				channel->channel2 = IIO_MOD_STILL;
+				st->sig_motion_channel_index =
+					channel->scan_index;
+			} else {
+				dev_warn(dev, "Unknown activity: %d\n", i);
+				continue;
+			}
+		}
+		channel->ext_info = cros_ec_sensors_limited_info;
+		channel++;
+	}
+
+	/* Timestamp */
+	channel->scan_index = index;
+	channel->type = IIO_TIMESTAMP;
+	channel->channel = -1;
+	channel->scan_type.sign = 's';
+	channel->scan_type.realbits = 64;
+	channel->scan_type.storagebits = 64;
+
+	indio_dev->channels = st->channels;
+	indio_dev->num_channels = index + 1;
+
+	return cros_ec_sensors_core_register(dev, indio_dev,
+					     cros_ec_activity_push_data);
+}
+
+static void cros_ec_sensors_remove(struct platform_device *pdev)
+{
+	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
+
+	iio_device_unregister(indio_dev);
+}
+
+static struct platform_driver cros_ec_sensors_platform_driver = {
+	.driver = {
+		.name	= DRV_NAME,
+	},
+	.probe		= cros_ec_sensors_probe,
+	.remove		= cros_ec_sensors_remove,
+};
+module_platform_driver(cros_ec_sensors_platform_driver);
+
+MODULE_DESCRIPTION("ChromeOS EC activity sensors driver");
+MODULE_ALIAS("platform:" DRV_NAME);
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
index 64bada1e8678..1bd07ca3abfe 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
@@ -489,6 +489,16 @@ const struct iio_chan_spec_ext_info cros_ec_sensors_ext_info[] = {
 };
 EXPORT_SYMBOL_GPL(cros_ec_sensors_ext_info);
 
+const struct iio_chan_spec_ext_info cros_ec_sensors_limited_info[] = {
+	{
+		.name = "id",
+		.shared = IIO_SHARED_BY_ALL,
+		.read = cros_ec_sensors_id
+	},
+	{ },
+};
+EXPORT_SYMBOL_GPL(cros_ec_sensors_limited_info);
+
 /**
  * cros_ec_sensors_idx_to_reg - convert index into offset in shared memory
  * @st:		pointer to state information for device
diff --git a/include/linux/iio/common/cros_ec_sensors_core.h b/include/linux/iio/common/cros_ec_sensors_core.h
index e72167b96d27..bb966abcde53 100644
--- a/include/linux/iio/common/cros_ec_sensors_core.h
+++ b/include/linux/iio/common/cros_ec_sensors_core.h
@@ -126,5 +126,6 @@ extern const struct dev_pm_ops cros_ec_sensors_pm_ops;
 
 /* List of extended channel specification for all sensors. */
 extern const struct iio_chan_spec_ext_info cros_ec_sensors_ext_info[];
+extern const struct iio_chan_spec_ext_info cros_ec_sensors_limited_info[];
 
 #endif  /* __CROS_EC_SENSORS_CORE_H */
diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index ecf290a0c98f..0f6d53e7cb97 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -2388,6 +2388,12 @@ enum motionsense_command {
 	 */
 	MOTIONSENSE_CMD_SENSOR_SCALE = 18,
 
+	/*
+	 * Activity management
+	 * Retrieve current status of given activity.
+	 */
+	MOTIONSENSE_CMD_GET_ACTIVITY = 20,
+
 	/* Number of motionsense sub-commands. */
 	MOTIONSENSE_NUM_CMDS
 };
@@ -2447,6 +2453,11 @@ enum motionsensor_orientation {
 	MOTIONSENSE_ORIENTATION_UNKNOWN = 4,
 };
 
+struct ec_response_activity_data {
+	uint8_t activity; /* motionsensor_activity */
+	uint8_t state;
+} __ec_todo_packed;
+
 struct ec_response_motion_sensor_data {
 	/* Flags for each sensor. */
 	uint8_t flags;
@@ -2454,15 +2465,14 @@ struct ec_response_motion_sensor_data {
 	uint8_t sensor_num;
 	/* Each sensor is up to 3-axis. */
 	union {
-		int16_t             data[3];
+		int16_t                                  data[3];
 		struct __ec_todo_packed {
-			uint16_t    reserved;
-			uint32_t    timestamp;
+			uint16_t                         reserved;
+			uint32_t                         timestamp;
 		};
 		struct __ec_todo_unpacked {
-			uint8_t     activity; /* motionsensor_activity */
-			uint8_t     state;
-			int16_t     add_info[2];
+			struct ec_response_activity_data activity_data;
+			int16_t                          add_info[2];
 		};
 	};
 } __ec_todo_packed;
@@ -2494,6 +2504,7 @@ enum motionsensor_activity {
 	MOTIONSENSE_ACTIVITY_SIG_MOTION = 1,
 	MOTIONSENSE_ACTIVITY_DOUBLE_TAP = 2,
 	MOTIONSENSE_ACTIVITY_ORIENTATION = 3,
+	MOTIONSENSE_ACTIVITY_BODY_DETECTION = 4,
 };
 
 struct ec_motion_sense_activity {
@@ -2671,6 +2682,7 @@ struct ec_params_motion_sense {
 			uint32_t max_data_vector;
 		} fifo_read;
 
+		/* Used for MOTIONSENSE_CMD_SET_ACTIVITY */
 		struct ec_motion_sense_activity set_activity;
 
 		/* Used for MOTIONSENSE_CMD_LID_ANGLE */
@@ -2716,6 +2728,14 @@ struct ec_params_motion_sense {
 			 */
 			int16_t hys_degree;
 		} tablet_mode_threshold;
+
+		/*
+		 * Used for MOTIONSENSE_CMD_GET_ACTIVITY.
+		 */
+		struct __ec_todo_unpacked {
+			uint8_t sensor_num;
+			uint8_t activity;  /* enum motionsensor_activity */
+		} get_activity;
 	};
 } __ec_todo_packed;
 
@@ -2833,6 +2853,10 @@ struct ec_response_motion_sense {
 			uint16_t hys_degree;
 		} tablet_mode_threshold;
 
+		/* USED for MOTIONSENSE_CMD_GET_ACTIVITY. */
+		struct __ec_todo_unpacked {
+			uint8_t     state;
+		} get_activity;
 	};
 } __ec_todo_packed;
 
-- 
2.49.0.1151.ga128411c76-goog

