Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B42139D1B
	for <chrome-platform@lists.linux.dev>; Mon, 31 Mar 2025 16:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743439722; cv=none; b=aABhibSribXqUOP1dSaGwQe8C0TWwTwTnhdU3tlx0lSTB3rH2IhpXedAVnk7XnPVYkJi7fe0SmxO55ElbBR2o+QZkHdtYvFRXsjfmn37SOLKphIpdovKSC//pJosDK5JMf2KlMgOvrLu0V/Fh0U4VDa3YtC5ix1k/tnkqMtl+BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743439722; c=relaxed/simple;
	bh=/Ml7N2eC8DLx+ini9moz/rIqFI6r/eoVnw1iyxVjvKc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jSQc1uSNq4WdAknXE2fg0Tzi2ZalJyctJEiUFzgHHi4c0ZNGfTB0/mPFW0uvpJ/cuXI8OLsNDbdIY8ne9U/DF2X+AwK6PWCARb4IothZRWNwOYxGQwMu4m/p9DDUlN6dpBdPi38YNJ+WipPunEDfxZy9TjnWyQc4YrY2x3JB2m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jywtWZB3; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jywtWZB3"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22580c9ee0aso93669445ad.2
        for <chrome-platform@lists.linux.dev>; Mon, 31 Mar 2025 09:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743439719; x=1744044519; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qt+KFlGVqPv32OaHgTtc6K8wA3HBhqq+sb6w5Nh3F8A=;
        b=jywtWZB32OZr/5nh+GATqkgOkmO6k1WiHokaYLOBLXeAX1Pp6+1UJ/7+RWuU7wYxhf
         vQ8VQ1P1YRDGNWAS8p8Vj0vBvP7inLphvCln7EjSPavEzk9VGVKVybM+PZPzBfkxkEVu
         e1WWWUBpuQ7d5kvIXSqiL61Q+5cj4cV6Aa+gg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743439719; x=1744044519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qt+KFlGVqPv32OaHgTtc6K8wA3HBhqq+sb6w5Nh3F8A=;
        b=Qs2JWVVXUfv12NyBklasWQVGr9zbIXRbzZye81PXedFe05yu64frIHchXr6/3M/cR4
         mX0L27gRPl40sy2iSqX+Ci4OM4m0G2+0mwGBVHMqrby4gfCA9ZpoBCHe1G50LhtV76q7
         4vutK8wcRENSm7W/LrGcmGPSVMyEaw4FOqcMjWap/8AKplCW1hV5DbOYY7RerVGz6f/v
         UsbQKiJ1RGsSWB2PPGk4XVrv3lhk1mfPDapFhJ3/1p57W14kbz4/w9BknZ8eOzEhMYXx
         nFwq9TdMJM51i7HNT937nLJyprDuH8iRAHfp85D7rfFfnt1vq0pt5Mw/fAUDYNv4H+Uu
         KbJg==
X-Forwarded-Encrypted: i=1; AJvYcCXc0UL+GQ+f/ec3L9kLnwQ/OGSmfYeJHebxUoZ4M5ywuUTWZTF24HnMN2UdYypEKLabYZ2oFJRqyR/acdAmsaI=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywy5LxSSswzcHST4du1XbguuTV74llzSyiSZctGKf+ANl7+et5o
	Dtvdo/YOiaSlpoaD1u4lzD3JnrTJIBgqGgRJMuVasFdCMKdYV2f0prd9jNFx5g==
X-Gm-Gg: ASbGncsl62cctuePMoj81PGfrL7/LLmhR4V2I5O3kS3Fbz2Uox5L+wF3mg1s2lDXjC8
	ZhP9zVoPpLqtJzq+aNiMKtGKCRriwW/mzSLJx8OKp8dzYk/RD144MZ5PrZYB3aB+IHP38pGKohD
	xHYKBgl1dVUnvko6q12gH/AbfW7HmP9jiqrPoM1fyWzeUMsR3hfzxs6dCDaklsv4tdWPry89KVK
	KhKqIGivVwh/ZCeqKH7v+flr2f7B/k6YSe7ghCMV+DOmD2GQRik6X+fiHMui1jAdyPHkqP26X1l
	GoqOzbTdEFAZlIAIeF6p2w8BOl5WVOWnJvzGhA==
X-Google-Smtp-Source: AGHT+IET2IGY1bkBg5zL2SVho439a24OFmrzQ2RadOLGAwXRbRNSq7QM+dEU7zPM2lLyYAYrxvzCJQ==
X-Received: by 2002:a17:902:c943:b0:224:1005:7280 with SMTP id d9443c01a7336-2292f9ee0c0mr128471695ad.38.1743439719375;
        Mon, 31 Mar 2025 09:48:39 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:9a21:5ba5:99d6:3daa])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2291eec693esm71337745ad.31.2025.03.31.09.48.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 09:48:38 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: jic23@kernel.org
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Gwendal Grignou <gwendal@chromium.org>
Subject: [PATCH] drivers: iio: cros_ec_sensors: Flush changing the FIFO timeout
Date: Mon, 31 Mar 2025 09:48:32 -0700
Message-ID: <20250331164832.4039379-1-gwendal@chromium.org>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fifo_timeout is used by the EC firmware only when a new sample is
available.
When the timeout changes, espcially when the new timeout is shorter than
the current one, we need to send the samples waiting in the FIFO to the
host.
We also need to flush when a sensor is suspended (ODR set to 0).

Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 .../cros_ec_sensors/cros_ec_sensors_core.c    | 51 ++++++++++++-------
 1 file changed, 33 insertions(+), 18 deletions(-)

diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
index b1abd6e16c4ba..4486c7e1e5b42 100644
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
 
@@ -152,7 +154,6 @@ static ssize_t cros_ec_sensor_get_report_latency(struct device *dev,
 	mutex_lock(&st->cmd_lock);
 	st->param.cmd = MOTIONSENSE_CMD_EC_RATE;
 	st->param.ec_rate.data = EC_MOTION_SENSE_NO_VALUE;
-
 	ret = cros_ec_motion_send_host_cmd(st, 0);
 	latency = st->resp->ec_rate.ret;
 	mutex_unlock(&st->cmd_lock);
@@ -764,6 +765,8 @@ EXPORT_SYMBOL_GPL(cros_ec_sensors_capture);
  * @mask:	specifies which values to be requested
  *
  * Return:	the type of value returned by the device
+ *
+ * cmd_lock mutex held.
  */
 int cros_ec_sensors_core_read(struct cros_ec_sensors_core_state *st,
 			  struct iio_chan_spec const *chan,
@@ -836,6 +839,8 @@ EXPORT_SYMBOL_GPL(cros_ec_sensors_core_read_avail);
  * @mask:	specifies which values to write
  *
  * Return:	the type of value returned by the device
+ *
+ * cmd_lock mutex held.
  */
 int cros_ec_sensors_core_write(struct cros_ec_sensors_core_state *st,
 			       struct iio_chan_spec const *chan,
@@ -853,6 +858,16 @@ int cros_ec_sensors_core_write(struct cros_ec_sensors_core_state *st,
 		st->param.sensor_odr.roundup = 1;
 
 		ret = cros_ec_motion_send_host_cmd(st, 0);
+
+		/* Flush the FIFO in case we are stopping a sensor.
+		 * If the FIFO has just been emptied, pending samples will be
+		 * stuck until new samples are available. It will not happen
+		 * when all the sensors are stopped.
+		 */
+		if (frequency == 0) {
+			st->param.cmd = MOTIONSENSE_CMD_FIFO_FLUSH;
+			cros_ec_motion_send_host_cmd(st, 0);
+		}
 		break;
 	default:
 		ret = -EINVAL;
-- 
2.49.0.472.ge94155a9ec-goog

