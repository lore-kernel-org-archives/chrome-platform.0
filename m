Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793863870;
	b=m7cscv1O553LD8H+stTcKJSYKc3W9hylDYJNW8Db/DpWK9pOysslvxtA+k20OmQazNa6
	 jFnNib/HCA6PuAx3nXPIdxKCFvI6biwgtckeVExQHrZj3R+3mPbkfCWl3AZ2ypI0QDr63
	 3EmW7a7FfP8N6J4fhIUwFvxospxTmDxQMkAN/3VNSaClX61yZX0EHsc4WielspiJvROgJ
	 Bw8GB7XJ3Hdo5QuBMsNXVO8fae5QlACoim7v/UDGKPRyhp5pt7Y28Fah5NFgkwyHD7pEj
	 WF8HFlXWfuGJ5RuQbay15MqhgX1o9qQkGGd+jR9k8n7DNhfPa0xWn7lgkPrSs0NXZeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793863870;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=2KTLKxxRm/mTERWifE6NdSkq/id0fx4CDjmOeHHWEQI=;
	b=KesE4FtqLLsyoUaw0ovibmbVMrJwlNKo3AmzkBHB3rV1MppD3EZ+Athf++O8OSGHWsWu
	 j81WuZYJd19yaMqGACqIL1u0V+nbx+VnKw45b5CHbM463VpKNaJa3qp4Vqk5iFe3GQbKl
	 geZCVkoIZ93IN2+XHjelHDiD78vkymVDNBtueRtnvk46sKyYmSO4g6sQX2vLN8fuKSYmA
	 vw9M0rT0aeg5hFKA9MgAzWNhnQYqlQpt23XONDWilUbQbH5PIOmhfOFZGrjpZl5QyOlgX
	 xBIrAg5Si4bnqlF6FuRlFsWR+k66GNZeTTi5fHuiWcaMozDANkQQWy7D+IEojqwuy/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="e/+YKals";
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF02606A326
	for <chrome-platform@lists.linux.dev>; Thu,  5 Nov 2026 07:31:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFF02606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e/+YKals
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a5971cf7ceso2568224b3a.1
        for <chrome-platform@lists.linux.dev>; Wed, 04 Nov 2026 23:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793863869; x=1794468669; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2KTLKxxRm/mTERWifE6NdSkq/id0fx4CDjmOeHHWEQI=;
        b=e/+YKalsKGfCTEY+5xCyayE4Nh+o77On9b3YxSvo5aY8dV2gHlRpV0yhQetoup7VDD
         lkMC9v0A8mISEIR+YIDlt5VqYFkomeJandmN4PktjuMQVPTIJ0EiRTFen/8qrEhL/dcK
         zx3pYJWb2Ckuk696qYupr1sRrJjBZ16nD7Qtvyg6qlLIHRPJrnO5nljNvepnQewAVUsa
         Cs/xnvggl/0fXS857CATIX4SusJFY6tst9dD+ZB9hS9q6yRjcHGaxO1vDv9HSf4n/mMO
         NFi0Cgram0PHdi73W+e67kp1HamLmAK7WEAUL1rz4DQdaisw6LVeCjRZnTxw0klyahlI
         s7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793863869; x=1794468669;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2KTLKxxRm/mTERWifE6NdSkq/id0fx4CDjmOeHHWEQI=;
        b=YOm7Bwzg2k1QZsJ9VhdSVLULsITrAO+rupCH4ikbuVvTVUgbBT4+zDhnKjOa0oied+
         soahV35PeV4FXp3hGA2Ma+FuPKSAylJeoF/rooalKh+QDJX2vCxS3hQM6mdFNmIhTK+G
         YvrkYHm/P4ba4iAo9ubTr4K0ICI6cIxtYGsu5MvrT6bSBc1aXcz28ETi6+dN0a6/7lBj
         7ENdKr/dx5FFWvc4GHUxiV1KwbWcn+5hj0k8qfWCDLKsgzPUWLgC/Je8OJPG1xenfXvT
         dfjKUfMkXYqgF8oVcBMmPZgoTVNze9AU3CoAlbJx2EuKHPjsr6OkGXCadeDtph0OGem6
         r0Kg==
X-Forwarded-Encrypted: i=1; AKwUvBw2c8yZ6Xacb3Ywf+Qpc+5F3NWwf7zmHdLYEGE7K+dYgEZZR8dFBrZFqnbuENr3etAtJ7QL3FOba/zT6Q36+ao=@lists.linux.dev
X-Gm-Message-State: APuU4Z96v2md0587cyvPmeyts6MkwWE/vx3AGIDrRMHLy957xaZ/ZHRw
	F9hZM2NUqrdG571EoSrvv3TMQTqtEZk+FcWJvQEAy/vlhjkCoLMVTK7i0C5WKGdCOlrXRd8aijZ
	ewQqbLU5B5/1m1A==
X-Received: from pgdo3-n1.prod.google.com ([2002:a05:6a02:6203:10b0:cca:c02e:bfd6])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:8901:b0:3e2:99ef:ae90 with SMTP id adf61e73a8af0-3e928a0b2a1mr12244927637.53.1793863869003;
 Wed, 04 Nov 2026 23:31:09 -0800 (PST)
Date: Thu,  5 Nov 2026 07:31:07 +0000
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
Message-ID: <20261105073107.172121-1-sgsatyam@google.com>
Subject: [PATCH] iio: cros_ec: Use platform sensor_num to unregister FIFO callback
From: Satyam Gupta <sgsatyam@google.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, "=?UTF-8?q?Nuno=20S=C3=A1?=" <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Gwendal Grignou <gwendal@chromium.org>, linux-iio@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

cros_ec_sensors_core_register() registers the FIFO callback for the
sensor number found in the platform data. The matching cleanup action,
cros_ec_sensors_core_clean(), reads the number back from
st->param.info.sensor_num instead.

st->param is the EC host command buffer. Drivers fill it in under
cmd_lock before each command, while the cleanup action reads it without
that lock. It is also set only for physical sensors. If the field holds
another value when the device is unbound, the cleanup clears the wrong
slot and leaves the callback in place, still pointing to the iio_dev
that is about to be freed.

Use the platform data in the cleanup action too, so it always
unregisters the slot that cros_ec_sensors_core_register() registered.

Signed-off-by: Satyam Gupta <sgsatyam@google.com>
---
Tested on an Android desktop device (6.18, Intel) with two
accelerometers and a lid angle sensor: each sensor was unbound and
bound 20 times while a reader kept EC commands in flight, then FIFO
samples were streamed. Also tested on a ChromeOS device (6.6) with an
RGB light sensor, together with downstream changes to that driver.

 drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
index d03e40c91582..4d019132cd78 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
@@ -216,11 +216,11 @@ static void cros_ec_sensors_core_clean(void *arg)
 	struct platform_device *pdev = (struct platform_device *)arg;
 	struct cros_ec_sensorhub *sensor_hub =
 		dev_get_drvdata(pdev->dev.parent);
-	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
-	struct cros_ec_sensors_core_state *st = iio_priv(indio_dev);
-	u8 sensor_num = st->param.info.sensor_num;
+	struct cros_ec_sensor_platform *sensor_platform =
+		dev_get_platdata(&pdev->dev);
 
-	cros_ec_sensorhub_unregister_push_data(sensor_hub, sensor_num);
+	cros_ec_sensorhub_unregister_push_data(sensor_hub,
+					       sensor_platform->sensor_num);
 }
 
 /**
-- 
2.56.0.398.g882cbad275-goog

