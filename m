Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813C2254852
	for <chrome-platform@lists.linux.dev>; Tue,  8 Apr 2025 15:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744127785; cv=none; b=lIJ68qRiXW0mu1nCdiOa0AAMRnAqGldakez+6iXteKx6jjhEX2tVQeWMNU9FL7mkqUBcN/HOyQt6W7j4BaEq8da7yD/2T4HyzNS5P+jvk5bUrv+GPE6CzB4qP5Iwv1QSMCoGWXVH6mjATuwKTdY5/aYKu5wAO6goQkKnXbsMDTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744127785; c=relaxed/simple;
	bh=+eXao014CZnAwhC+SM1Hq9YPL6wJDL2oazpBhbkQcaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WeRowdaZSewEdR32YYR1CwsIMVgUDcna9aa9NLmxdJUVXh9ZhdcAjM4s5Ig5LsuYQqqhixuTjCCOgqnSjMCBja9iTWFzcYAaGvwqm1Zi4s5EeBpLfozXFnQorBOgljLuzrOTMU9Uj3JuBIAUq9IXKFRDDwGUcaSB2hiC6Ikux+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UOK51068; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UOK51068"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-739525d4e12so5227491b3a.3
        for <chrome-platform@lists.linux.dev>; Tue, 08 Apr 2025 08:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744127782; x=1744732582; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ZUpULk8hennxfcny51FPWJJyNUQSuBx+DrAa2UJoac=;
        b=UOK51068XIzHHxCD6yqHXRy689Af3iqCV1XmfNgTeU6qQEIOPl0O0hl4sTVcKJHbtZ
         aMg7qr7LbU9XoVuF1AnQ2S+IbgGHYsnWoBUACkUYBaPH9R9bIIeDOD+uZxckfaVp8l+J
         vymchA9UXSwvTV696HRPlRbenYuoR83C+XHps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744127782; x=1744732582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ZUpULk8hennxfcny51FPWJJyNUQSuBx+DrAa2UJoac=;
        b=Mkk6kfIZxfI1ZYeEoU7hoR5M7mC/+xVy+BkVUKZmOXIgdw7Iyp3PA8bLre01P9qVg5
         X7uq0EthJXE63rXBchjZFGi2yq1uupN6RX9o3B3UQtWGC1iYWABjtEnUNULe6hLlIpig
         3QQONiNZ/aVvPod3I5bIdttLUM3gL5+70I+iCoJ/S5iVOQmLBfHLf+oDyFlLlhaUcIxr
         BQ2VoYrh04wOL041JIa7jcf3Nwvkq65BbonVUJ8G4BO4VDT796ynmk6NQXTA6V1Zvm+8
         PSySOZhyMx2UdrD20V4/nczsKVBndojvky+P5SmSAPOc5B+aJMHhtTa1VcE/5LNjPIL3
         Ki8g==
X-Forwarded-Encrypted: i=1; AJvYcCUUvjiycLopCHDeBguy4jZp1Z+v/GfWda5LX9F5a4xhrBcTx4ZUp12N5BwGiv0RF1aTBpUR7hYLpSs05IvLgHo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzKTA4xZuXf3scFrIksIQeQPJRJlArlyPnraZmSMI0zs1pcVBbv
	1XZJVqMEgp/CatB9V5cFX2/klVzPnbA5okJz17IxHuzBCzPO9Px7zaq87a22DQ==
X-Gm-Gg: ASbGncsVKR8aPFm+AJkK0VeNQEReziut2ZmO5T2KOUOBhZ6/em44gjNxMPcoo2ntRcg
	vxoq9QPjLDPMVm/gF7aYIlQufYihF7tiuJdjZ81gWFcPKbkJB8i01lY19RO5sOXvHZkOz1VTCPd
	cq9zua2aRKF9e92A6NSl3j+RNEvYbxcw32XgKfo0y+9oqet4Qlz4UjmeRXoizpOSh9tx8W882U4
	8MCxKduMdMHJK1YQs1wcpkMhOcCyV8WspsLhEFKjgHTNYahuOA23vCZa0cD+mSxXSs7xBMMcfGN
	WVrpkg/GicONrj2BUu07fr9oSRF8SJC6lEXDzw==
X-Google-Smtp-Source: AGHT+IHKOMlwlJBzUBH1cp/XU5mAvhv3qP5Kx5amf6dtB8HfkU2s+spaYD0qsczOSgsFuhNauPNiJg==
X-Received: by 2002:a05:6a00:2351:b0:736:5e28:cfba with SMTP id d2e1a72fcca58-739e4be3c73mr23939938b3a.18.1744127782556;
        Tue, 08 Apr 2025 08:56:22 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:8551:1093:9956:f769])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-739d97d188dsm10734863b3a.7.2025.04.08.08.56.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 08:56:22 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: tzungbi@kernel.org,
	jic23@kernel.org
Cc: linux-iio@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org,
	Gwendal Grignou <gwendal@chromium.org>
Subject: [PATCH v3] iio: cros_ec_sensors: Flush when changing the FIFO timeout
Date: Tue,  8 Apr 2025 08:56:19 -0700
Message-ID: <20250408155619.2169189-1-gwendal@chromium.org>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
In-Reply-To: <CAPUE2uuY=BaPFro5cQSmQg4JS1Z5J5aBL7XvqqAo-X=LR4be3Q@mail.gmail.com>
References: <CAPUE2uuY=BaPFro5cQSmQg4JS1Z5J5aBL7XvqqAo-X=LR4be3Q@mail.gmail.com>
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
Changes in v3:
- Fix error detection when setting the sensor frequency

Changes in v2:
- Fix sysfs attribute in commit message
- Indicated the function to send the content of the attribute is now
  inline.
- Improve error detection when setting the sensor frequency and flusing
  the FIFO.
 .../cros_ec_sensors/cros_ec_sensors_core.c    | 50 ++++++++++++-------
 1 file changed, 33 insertions(+), 17 deletions(-)

diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
index b1abd6e16c4ba..67ffe88df7b23 100644
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
+	mutex_unlock(&st->cmd_lock);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * Flush samples currently in the FIFO, especially when the new latency
+	 * is shorter than the old one: new timeout value is only considered when
+	 * there is a new sample available. It can take a while for a slow
+	 * sensor.
+	 */
+	mutex_lock(&st->cmd_lock);
+	st->param.cmd = MOTIONSENSE_CMD_FIFO_FLUSH;
+	ret = cros_ec_motion_send_host_cmd(st, 0);
+	mutex_unlock(&st->cmd_lock);
 	if (ret < 0)
 		return ret;
 
@@ -764,6 +766,8 @@ EXPORT_SYMBOL_GPL(cros_ec_sensors_capture);
  * @mask:	specifies which values to be requested
  *
  * Return:	the type of value returned by the device
+ *
+ * cmd_lock mutex held.
  */
 int cros_ec_sensors_core_read(struct cros_ec_sensors_core_state *st,
 			  struct iio_chan_spec const *chan,
@@ -836,6 +840,8 @@ EXPORT_SYMBOL_GPL(cros_ec_sensors_core_read_avail);
  * @mask:	specifies which values to write
  *
  * Return:	the type of value returned by the device
+ *
+ * cmd_lock mutex held.
  */
 int cros_ec_sensors_core_write(struct cros_ec_sensors_core_state *st,
 			       struct iio_chan_spec const *chan,
@@ -853,6 +859,16 @@ int cros_ec_sensors_core_write(struct cros_ec_sensors_core_state *st,
 		st->param.sensor_odr.roundup = 1;
 
 		ret = cros_ec_motion_send_host_cmd(st, 0);
+
+		/* Flush the FIFO in case we are stopping a sensor.
+		 * If the FIFO has just been emptied, pending samples will be
+		 * stuck until new samples are available. It will not happen
+		 * when all the sensors are stopped.
+		 */
+		if (ret == 0 && frequency == 0) {
+			st->param.cmd = MOTIONSENSE_CMD_FIFO_FLUSH;
+			ret = cros_ec_motion_send_host_cmd(st, 0);
+		}
 		break;
 	default:
 		ret = -EINVAL;
-- 
2.49.0.504.g3bcea36a83-goog

