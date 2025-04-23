Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC811DE3AD
	for <chrome-platform@lists.linux.dev>; Wed, 23 Apr 2025 22:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745445913; cv=none; b=MyzBqe5byi/6FqW5RTyZkfCjVvH/IXk9JJjMjME5tYRYrDm5OSoJ8QvHtesrOz9J1i68Rw8UFZb7NXi7aX9W3BHA0y8/O9F/UNHp5P15JYdrWMc5SMbLjnGoqUx62aDZ8PsjIFlVEFBRsSAMyQ+N+LBfdF8O/c5OEvcWyaOXQ2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745445913; c=relaxed/simple;
	bh=xnZKhDn7otNLXhNZbcdoZRSWnSDIyGSANSQbXEe6skw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P21FXxnzRfQALul2sBXP3v8IlJkWdHm3DA/fls19CYEtQIswLmkf55+rRGEEzkKlt6lAdJeWXzNb6ovEZKPDqyHde8NgSOKC4xRuTn7JMyo1r2vlIjbgiq0YhcRmlfcYwf+Oma8+XrylwZi8FYE/v7NAo5R2eux/MMrfThO0US4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=b3q55FsO; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="b3q55FsO"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso251008b3a.2
        for <chrome-platform@lists.linux.dev>; Wed, 23 Apr 2025 15:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745445911; x=1746050711; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jffhp1hKLKw2I8ZSd4rm9aBy59gHCqNpHWIp+bmrqS8=;
        b=b3q55FsO3oMP1qJKVxfqzGHEkv0jp8vf6gd7Q7f/RAftxHb+CgqGl8fnkfHscnyPTP
         IhLQulV3a/HaXBwp8Jc4bqGvD3nkNYV379YS0J3UAGBtFTNshsEloD3JvBUsBuqK3sMQ
         kbdiI+0/XvXZZDwOiBEqEYOQIoy4i69TzHMkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745445911; x=1746050711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jffhp1hKLKw2I8ZSd4rm9aBy59gHCqNpHWIp+bmrqS8=;
        b=egUJ6yizgKnkshrADhR1JtsMq2T4Lo3XTV9Bgx5CR6N9urrYe4P0oz0+dFuzV/x1fj
         wphzKxMQ177CyK1jremP8sY8ZZmySRzMG1SUeZtKGoxOtlD1KUs/sBp+s2tcqcHaK2+l
         ERQm3a8C7ncS4MlOvy9OKppO7kP+d5yrerSFGJ8GKJwMM1eUhLtwEvQhUgSKIrzWXyNe
         OkbNG/I8rpn8qWum4AMjmQxMYrL4vXojAFcaHSmnxJy6Qt+RxCw+jXkfSWMM/JQpqhMF
         rMTbblmbXT6CjlbhsDzmeBOzsYzGhaGIvFuylGBBx1ExmQQ6pJAnE4TSKCXkBWZigmqp
         J/tw==
X-Forwarded-Encrypted: i=1; AJvYcCW6gPxbPam38qRxw52sfAyRpDR3KmZk9//9tFJV5kv1keEMtBsKBJ0u7q75e5rpCF6/V39OJ0GmbgoHNJvix84=@lists.linux.dev
X-Gm-Message-State: AOJu0YwV9eVi5paa8XUq/kQdMHyABPUbeEPvWlLylCLIdMIYwycmB8zr
	/nU0OtuJ8RQD7Q3d8DtPXSt6Um5vXhLM/f55J0nN8MAqcjHOxiWAAklvBCFwZg==
X-Gm-Gg: ASbGncuZ3SgoKY/Kt4hyJv5AnLGw4tEOtuNznaXX7Fmt3B+eOnaZBj0/Ngu3M0AB1ak
	R6halC7+kqAhfTLLgwwfneuJJsW/DoyAKYDlrm+dk0ApLQZi/yS3TynJt1eOD3+jaahg8qiQsY+
	u9YT+Uz8/aXqbORPUheaMFHYmn020IFtFqzP6Rz71aS+aAjuejcZJGkuc7e64dcGl2hkcWw/FII
	1kuio0wG8JqtJaFfyhShtveNytJ4x6LNSIdgeEBSf7Lq1A6Hbi/iG/FSZmNHVIFGXi/TSCLEEse
	MasztAP77n1S5OD8OfRAyfBgZQwS9Rzd/6eLtgbiOdw=
X-Google-Smtp-Source: AGHT+IFTQuwm5PJqZ/wRRM668FD8oALUjvziG6gCcOfIhXnw8NcDvO/urULrUnjQLbspA5EZIgZFfA==
X-Received: by 2002:a05:6a00:1d88:b0:736:b402:533a with SMTP id d2e1a72fcca58-73e245bd3c1mr469646b3a.1.1745445910938;
        Wed, 23 Apr 2025 15:05:10 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:642:d9cc:2ed4:9b6c])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-73e25accfc9sm66755b3a.176.2025.04.23.15.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 15:05:10 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: jic23@kernel.org
Cc: tzungbi@kernel.org,
	chrome-platform@lists.linux.dev,
	linux-iio@vger.kernel.org,
	Gwendal Grignou <gwendal@chromium.org>
Subject: [PATCH v4] iio: cros_ec_sensors: Flush when changing the FIFO timeout
Date: Wed, 23 Apr 2025 15:05:06 -0700
Message-ID: <20250423220506.2061021-1-gwendal@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

|hwfifo_timeout| is used by the EC firmware only when new samples are
available.
When the timeout changes, espcially when the new timeout is shorter than
the current one, send the samples waiting in the FIFO to the host.
Inline the call to transmit |hwfifo_timeout| value to the firmware.

Now flush when a sensor is suspended (ODR set to 0) as well.

Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
Changes in v4:
- Do not drop lock between changing FIFO timeout and flush
- Remove unrelated comments
- Use local style error handling.

Changes in v3:
- Fix error detection when setting the sensor frequency

Changes in v2:
- Fix sysfs attribute in commit message
- Indicated the function to send the content of the attribute is now
  inline.
- Improve error detection when setting the sensor frequency and flusing
  the FIFO.
 .../cros_ec_sensors/cros_ec_sensors_core.c    | 48 ++++++++++++-------
 1 file changed, 31 insertions(+), 17 deletions(-)

diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
index b1abd6e16c4ba..639cac3b4596a 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
@@ -103,22 +103,6 @@ static void get_default_min_max_freq(enum motionsensor_type type,
 	}
 }
 
-static int cros_ec_sensor_set_ec_rate(struct cros_ec_sensors_core_state *st,
-				      int rate)
-{
-	int ret;
-
-	if (rate > U16_MAX)
-		rate = U16_MAX;
-
-	mutex_lock(&st->cmd_lock);
-	st->param.cmd = MOTIONSENSE_CMD_EC_RATE;
-	st->param.ec_rate.data = rate;
-	ret = cros_ec_motion_send_host_cmd(st, 0);
-	mutex_unlock(&st->cmd_lock);
-	return ret;
-}
-
 static ssize_t cros_ec_sensor_set_report_latency(struct device *dev,
 						 struct device_attribute *attr,
 						 const char *buf, size_t len)
@@ -134,7 +118,25 @@ static ssize_t cros_ec_sensor_set_report_latency(struct device *dev,
 
 	/* EC rate is in ms. */
 	latency = integer * 1000 + fract / 1000;
-	ret = cros_ec_sensor_set_ec_rate(st, latency);
+
+	mutex_lock(&st->cmd_lock);
+	st->param.cmd = MOTIONSENSE_CMD_EC_RATE;
+	st->param.ec_rate.data = min(U16_MAX, latency);
+	ret = cros_ec_motion_send_host_cmd(st, 0);
+	if (ret < 0) {
+		mutex_unlock(&st->cmd_lock);
+		return ret;
+	}
+
+	/*
+	 * Flush samples currently in the FIFO, especially when the new latency
+	 * is shorter than the old one: new timeout value is only considered when
+	 * there is a new sample available. It can take a while for a slow
+	 * sensor.
+	 */
+	st->param.cmd = MOTIONSENSE_CMD_FIFO_FLUSH;
+	ret = cros_ec_motion_send_host_cmd(st, 0);
+	mutex_unlock(&st->cmd_lock);
 	if (ret < 0)
 		return ret;
 
@@ -853,6 +855,18 @@ int cros_ec_sensors_core_write(struct cros_ec_sensors_core_state *st,
 		st->param.sensor_odr.roundup = 1;
 
 		ret = cros_ec_motion_send_host_cmd(st, 0);
+		if (ret)
+			break;
+
+		/* Flush the FIFO when a sensor is stopped.
+		 * If the FIFO has just been emptied, pending samples will be
+		 * stuck until new samples are available. It will not happen
+		 * when all the sensors are stopped.
+		 */
+		if (frequency == 0) {
+			st->param.cmd = MOTIONSENSE_CMD_FIFO_FLUSH;
+			ret = cros_ec_motion_send_host_cmd(st, 0);
+		}
 		break;
 	default:
 		ret = -EINVAL;
-- 
2.49.0.805.g082f7c87e0-goog

