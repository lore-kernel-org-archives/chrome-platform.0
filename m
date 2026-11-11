Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382004;
	b=DMghzDcUzApxLCE8dcUIwz/RQbAqzP6wS/VuKaLrD4li9ABZOK+2fiv1MWt6a9P/xRgX
	 zEaQ2wbNaZ4TAoBhsrkfxSlI6xYtMtQjxrje1TE6O8Qgt8xRogIrVikdUN6dxt2XwiMxn
	 tq9NCayBlBv9aV5l6jWy5hDaFU4zu0anKK7ZgwsecqEYdLUwO3FfkpWWm8DFStzasNgfM
	 G+WGXkvIPjdaShFjgiD1FQLGcUpKfChihXHBcaHGP1JTs+2SSF3vZP0z/DvRemOkUnz4I
	 B5OGG73AchbputBOOaJSAO6YBlouK89Cg3SjDNK1ePb0ysaKQYX8lKQ+O0LpynOVEdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=qyaSt7rfLd9UWAEQmgIczF6QNCmMTt6/VnKgUqvfogg=;
	b=DHCZsb1palpm4Y5Iizmx3OlBd51Sg1uvJQU7nIPua+AOAZulA+hKFJTgkRsVzrQr/JCC
	 M1T8AuV6VC2Md5ssQZgJZ51kb5zTQSEjB8JRueO0XjVOFATywQqlU9VJGVFgewQmtab4f
	 PwvymlFNa9WJ47RT3KTbeXclD+f9xEiMp8c2V05ErBW0qPZDFNbZAlzwarR67jTw2ZVPH
	 /XLFz0Vvv6RQuq+vRUsszfz4jZvdI+az28RL/0J9l1ik/OM+ZSmC7F6H8oDD3yT+/cmIT
	 GrBwSlSPBHW1zNejolDUTLsUT5L9kxbZaW6q6vioTN2IB5iD7p57o9A92fIplQgIBsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--diwux.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IPlpP3L6;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0945D606A320
	for <chrome-platform@lists.linux.dev>; Wed, 11 Nov 2026 07:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0945D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--diwux.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IPlpP3L6
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed08904845so42986595ad.3
        for <chrome-platform@lists.linux.dev>; Tue, 10 Nov 2026 23:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794382003; x=1794986803; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qyaSt7rfLd9UWAEQmgIczF6QNCmMTt6/VnKgUqvfogg=;
        b=IPlpP3L63llvrY2F+cnisRrKWuLUhwF2bazfxDKfBweUsVqtjpfgZHlJm9BGb3U+GY
         PDCjUWRX0RyTL4VTUqaCsr+JYkFSayJb+FenI9gVCZ8dhRT7ZJz2r5SgL4iaYEEJR2B0
         KKhaoEU1wLGtiAwuULMMzXlpvaQ3f8RdZ92XFZOARK6KcBK9S7CyLnlwOJHXzQOSKtke
         3k5huKgLXE0lFig3TcQ7Ym3ETO7pDq/CCeW0y4DEAGi+ijHMulTUv6ndJF2y0bzplOSP
         LXGDo1oItNw0JlT1vagrGd/h9Yy10usNS4ARtRNRtj/26XVWyoMo6NVMZNHv7sDaIxmp
         y/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382003; x=1794986803;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qyaSt7rfLd9UWAEQmgIczF6QNCmMTt6/VnKgUqvfogg=;
        b=MM6661YHp7UbgU11KFARyGEEyIiBTKJx9IPVhhzrAjJjemjrQXA7nUwan4o+5C0g5D
         rs8JAWCV9KK2YucS2zhR26ERf4suGvIE/WmcUAMeYNtTH3WU96eIUu4lm7Z38toLbohx
         hDfdaq3Sn1kWm8vHySzzY+Fs9dAxb8bDgjuFNO2bpi8OXsfboKofgMze4C9Suy1fc8tu
         NxtJRqdUWIZhtb6xA/tQAvU4RIFn+JqiHZJyJvhqjgvYBw4skJ9no5xp/8kJANPu830P
         WBLzN5c0K7hMnSf6ZwLgyRmVLPXy11KsC37QUxXGvM1GnuBr5RW5EGMvkmafm6x+XzWI
         /H5g==
X-Forwarded-Encrypted: i=1; AL+hErF0LNow03D7EhMEfa98+PbQv9iFOBLbErGXzSZl3Q0nritsd7oSl8Cjf9uqhZecmThGI36u5k3DBHsPc5TMbYE=@lists.linux.dev
X-Gm-Message-State: APuU4Z8HAlO+OKie3Vkc1PT3ms7my5uRwvC/pVfq+gCquWS3cw1zbrzV
	IjDLpOKi6X8JfsqTt0KGnPcWJ71S+EbsAUwIhu9OEmpAN7U58Ri4BubaAbaKSeVnmleCAEjzCgW
	IYA==
X-Received: from pla14.prod.google.com ([2002:a17:902:ffce:b0:2ea:7f9c:2ce])
 (user=diwux job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f78d:b0:2ed:e22b:779f
 with SMTP id d9443c01a7336-2ede22b8363mr6850925ad.58.1794381971881; Tue, 10
 Nov 2026 23:26:11 -0800 (PST)
Date: Wed, 11 Nov 2026 07:26:08 +0000
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111072608.3490763-1-diwux@google.com>
Subject: [PATCH] iio: cros_ec: use sysfs_emit() in show callbacks
From: Di Wu <diwux@google.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	bleung@chromium.org, groeck@chromium.org, tzungbi@kernel.org, 
	linux-iio@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Di Wu <diwux@google.com>
Content-Type: text/plain; charset="UTF-8"

Replace sprintf() and snprintf() with sysfs_emit() in the sysfs show
and ext_info read callbacks. sysfs_emit() is aware of the sysfs buffer
PAGE_SIZE limit and is the preferred helper for show callbacks.

Signed-off-by: Di Wu <diwux@google.com>
---
 .../iio/common/cros_ec_sensors/cros_ec_sensors_core.c  | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
index d03e40c91582..624d4b32b034 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
@@ -149,9 +149,9 @@ static ssize_t cros_ec_sensor_get_report_latency(struct device *dev,
 	if (ret < 0)
 		return ret;
 
-	return sprintf(buf, "%d.%06u\n",
-		       latency / 1000,
-		       (latency % 1000) * 1000);
+	return sysfs_emit(buf, "%d.%06u\n",
+			  latency / 1000,
+			  (latency % 1000) * 1000);
 }
 
 static IIO_DEVICE_ATTR(hwfifo_timeout, 0644,
@@ -165,7 +165,7 @@ static ssize_t hwfifo_watermark_max_show(struct device *dev,
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct cros_ec_sensors_core_state *st = iio_priv(indio_dev);
 
-	return sprintf(buf, "%d\n", st->fifo_max_event_count);
+	return sysfs_emit(buf, "%d\n", st->fifo_max_event_count);
 }
 
 static IIO_DEVICE_ATTR_RO(hwfifo_watermark_max, 0);
@@ -465,7 +465,7 @@ static ssize_t cros_ec_sensors_id(struct iio_dev *indio_dev,
 {
 	struct cros_ec_sensors_core_state *st = iio_priv(indio_dev);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", st->param.info.sensor_num);
+	return sysfs_emit(buf, "%d\n", st->param.info.sensor_num);
 }
 
 const struct iio_chan_spec_ext_info cros_ec_sensors_ext_info[] = {

base-commit: b70566610b48ba49dec636019da4d696db64b085
-- 
2.56.0.455.g6c5a503b38-goog

