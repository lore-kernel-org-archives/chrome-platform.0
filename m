Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884860;
	b=AvSmcgr0b8TjNdT+xy4xCtXH+dsB/d+6EcOkPlZBOGc+u3LC5hNJkvpqqlaqpyIIKmB/
	 Re+NYtcUfz9+fygi6a12wCRgaUWBAy4VseVPMwHpefUAcXJkqM7MyDJZYP0ZP8E2o2+bE
	 GLsK4oLbmYsVCleNn+wcuRxdn+HJbJEWpY28xXfW2YnsOJMrrlBcZMYREDB3Z5XON1/ul
	 C7HxgLT1Cf00yhzUUhuNlE0JmCD2ZArTV/VtFdMI1ITNnnX4774gVo02ioH3DOdafmedG
	 I5zJJbFA67s/ViGpwevMzinEFMtsNPODLRaXC5ZhOuCF+MI3MOlwL0N9j++gG036mDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=1hWitpRXSGa3f1x2WsNsj66oTlqZG1AdJZX2odfdwlE=;
	b=wkQxLdmwlUpmoKQQGse8u3gfcp7rCYQVtDDSBIGNU+uI/leBCZ9XxeIoUz4/w5I1Vt3I
	 tj42+qmcCwfmBhp+JwBz0nGs24lrohVNr+8/mMBupC4/59NmOhIw0RZM/K8OzUoeFCYKy
	 MgdTdS4LOgQzu7Iy5g2IZhLT8j9WS9L45fSnGBRkQsmbZ8cvknLmYZGDKjZ3rp/6s9jRD
	 1Vi+g1TqhSOoGNVck5mnpsg3IkLSvJOJt/aak8FsHymE1o7fwYRf+NfaKvwWFycGlvMuP
	 jsvCyRf6n42+llSgKa61DbhlP5fJ7c6ZdJPJSsK/aUHGWlDbyEndUH2LIpXNfBznvKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A+AbkjId;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2135F606A330
	for <chrome-platform@lists.linux.dev>; Thu,  5 Nov 2026 13:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2135F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A+AbkjId
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b203b0c139so715605b3a.2
        for <chrome-platform@lists.linux.dev>; Thu, 05 Nov 2026 05:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793884859; x=1794489659; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1hWitpRXSGa3f1x2WsNsj66oTlqZG1AdJZX2odfdwlE=;
        b=A+AbkjId4p8h7e+kBjGIjxk4jJrko0VZ5UGmcylUJA1SnudSvnopFbtA6riVRKBJkw
         J9HkDCw/0pd5BLICuywtHxnW15mT74aAF30d5YEcErY9td5/749z5jePm4k0bAVUcQFc
         mpFVQsuAaifXmEne0rtGcU0xsPaghP7IZweOiAmUxQMdQkYK0AmwO9kQtOSp7HDqvVBT
         tPiau3Y2DWTKYmu4Nb6DmUvJ6i9v+TZG3yauvFWmyZSiBvqrk5jRsrrFsY1YUQlfk4+I
         flb0/5iflSUq2jDWI6UVbakKzQTHpepurKS7ynqOpWaxh0zjm9LoOFFBE6YhU5DclQcV
         WAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793884859; x=1794489659;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1hWitpRXSGa3f1x2WsNsj66oTlqZG1AdJZX2odfdwlE=;
        b=Pq4iU7EFYLsLiECrF5B/t69wMJSEw1Ttf7LuZdDSmstfYjSXCySMcHUUgDuDqHtgWI
         J4lB/Nv+OmZ++mzrQbDE9Obb5ezlGOR/bmapJ8H5V3lhqxHezF/Eb+j6Qe2amVlll3Ey
         8RCyRtyC7dPWI/l6sd/JxMzLrbpjiWJINB9nestN1+d7VtoV5RgQrYTlLtwJBKvQgtuF
         IOkEyjAL5oyF6U05JhfAXBWY5oWDmO+BwQTo9HXk2UB7Id1FMS5oTYDkBm7hZbXJ9DsP
         Z5BjkRag2wTKI+UBD+XO2gXWGsF3YD2lLnM9M6WOc9xEf/ssfjWe9lU8n6qNJAiEWn9w
         q1/w==
X-Forwarded-Encrypted: i=1; AKwUvBzlliS+AbwIb+zzdTM4+D7OTR4WFVtX9b5gpFz/uR/Vdnu7cEoSshw7TmlXjvi6ztN7flbvlwzKggZaVMOuPiw=@lists.linux.dev
X-Gm-Message-State: APuU4Z/SQOhNXgJTXn/4bDJ+cKzu104fO07HwdgCNv9YqzlhcBLvXz2e
	uE54UGYCiqFUoDVfnHip0XOWTVBbgErsTesKXA7wOYRRwqudVA3ElNTmB98GcBxPKIwyxpuQhWn
	gg2EUayiElPM5EA==
X-Received: from pgme25-n2.prod.google.com ([2002:a05:6a02:6c99:20b0:cd8:c5f8:e73d])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6300:68cb:20b0:3eb:818f:619a with SMTP id adf61e73a8af0-3eb818f7477mr3915541637.33.1793884859215;
 Thu, 05 Nov 2026 05:20:59 -0800 (PST)
Date: Thu,  5 Nov 2026 13:20:57 +0000
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
Message-ID: <20261105132057.2429385-1-sgsatyam@google.com>
Subject: [PATCH v2] iio: cros_ec: Use platform sensor_num to unregister FIFO callback
From: Satyam Gupta <sgsatyam@google.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, "=?UTF-8?q?Nuno=20S=C3=A1?=" <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Enric Balletbo i Serra <eballetbo@kernel.org>, linux-iio@vger.kernel.org, 
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

No in-tree driver changes the field after probe, so mainline is not
known to hit this. The ChromeOS RGB light sensor support does: it
changes the field while a command is in flight, and unbinding the
device then leaves a stale callback. Found by an AI code review agent.

Use the platform data in the cleanup action too, so it always
unregisters the slot that cros_ec_sensors_core_register() registered.

Fixes: aa984f1ba4a4 ("iio: cros_ec: Register to cros_ec_sensorhub when EC supports FIFO")
Signed-off-by: Satyam Gupta <sgsatyam@google.com>
---
Changes in v2:
- Add a Fixes tag (Andy).
- Use a local struct device pointer and name the platform data pdata,
  so the unregister call fits on one line (Andy).
- Say what triggers the problem and how it was found.

v1: https://lore.kernel.org/r/20261105073107.172121-1-sgsatyam@google.com

The patch was drafted with an LLM-based coding assistant (Gemini); I
reviewed and tested it.

Tested on downstream kernels, together with fixes to the out-of-tree
RGB light sensor support: ChromeOS 6.6 (Intel) and Android desktop 6.12
(MediaTek) and 6.18 (Intel). Unbinding and binding the light sensor
while its RGB channel is read in a loop failed within 1 to 46 cycles
without the fixes (the stale callback slot makes the next probe fail
with -EINVAL) and passed 200 cycles with them on all three. On the 6.12
device the accelerometer and gyroscope were also unbound and bound
repeatedly and still streamed FIFO samples. Mainline itself was only
build-tested (W=1 and sparse, x86_64 and arm64).

 .../iio/common/cros_ec_sensors/cros_ec_sensors_core.c  | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
index d03e40c91582..632036eea4f3 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
@@ -214,13 +214,11 @@ EXPORT_SYMBOL_GPL(cros_ec_sensors_push_data);
 static void cros_ec_sensors_core_clean(void *arg)
 {
 	struct platform_device *pdev = (struct platform_device *)arg;
-	struct cros_ec_sensorhub *sensor_hub =
-		dev_get_drvdata(pdev->dev.parent);
-	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
-	struct cros_ec_sensors_core_state *st = iio_priv(indio_dev);
-	u8 sensor_num = st->param.info.sensor_num;
+	struct device *dev = &pdev->dev;
+	struct cros_ec_sensorhub *sensor_hub = dev_get_drvdata(dev->parent);
+	struct cros_ec_sensor_platform *pdata = dev_get_platdata(dev);
 
-	cros_ec_sensorhub_unregister_push_data(sensor_hub, sensor_num);
+	cros_ec_sensorhub_unregister_push_data(sensor_hub, pdata->sensor_num);
 }
 
 /**

base-commit: 1390ca4953a7400ca932cb49635f02c727f885a6
-- 
2.56.0.398.g882cbad275-goog

