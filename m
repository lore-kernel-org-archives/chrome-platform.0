Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793949547;
	b=koeig0gs0PlWYtzzTgJvAXRYehVqU44D0TN7lUQqpUAoAduJ1mRth1nyWLWwzgoKpHbD
	 0VIvJwTQw0D8ONUgXjpwsWp5fAwbmec02xpEujZZGYSOAQ/baOTIwsWCuUZmWl9zYJKqa
	 3SYCgv+BvhI7YGqCOit1lx6Z7PC9Jbflysh+2mhmvkSHcg+JjuE3qkdRkJWvOLTHO0/pr
	 VuTQja5x9V++//rkHb6i5GkgnRniNhW8n/aFV9dskaxDgzq6SzhflZOkgcncgtkwnrtuR
	 YRyDaYwyN6kX/TplgIU1voueCjIdhOvDsbJTEczpqcaU+Hul6PkKeg4IWarGrmVHiPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793949547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=pIjZ/Y8hQqw73CpdFq92aAVG0/oq5u/tSDIP7hM67k8=;
	b=INmYGDLhtucL3XF/4LiqdM7VOIosCXnmv5FWUEqoMx/vmzg3nANSZTIfy7fT7jW0gQ+x
	 kw8VCETXMZOqVwxzAnWMG3tk59TWHt4GIQ7TBDkbkn8sgl3s1MKqnXHE1NN645Rxo3Wqv
	 5GZJoNO/5S5vwogsqXdh7UuHCXkoJhmYShbii2TBa1a2uEoPDW88AlWtPCrmLrRUdN12w
	 tDJt6tfYxNTygzXYG+cZnqdY5cLBE35s+SHjhZgFJj+0MqFxxqGnj/c7pITheqGdtIDsd
	 X2qS+sFOdHNvUeMqUL9RvnAdjEJCBmm/RM2uC437wpe8YNg3O7tAAcNJimEzFnaoXgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=J2dME2xo;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D476606A32C
	for <chrome-platform@lists.linux.dev>; Fri,  6 Nov 2026 07:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D476606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=J2dME2xo
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a065d0e9deso467577b3a.0
        for <chrome-platform@lists.linux.dev>; Thu, 05 Nov 2026 23:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793949547; x=1794554347; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pIjZ/Y8hQqw73CpdFq92aAVG0/oq5u/tSDIP7hM67k8=;
        b=J2dME2xoBFABYZl9XjPZfzFMv7KIKwT2/3abdfy887c/61EF4RwfOiWYyDUk+21ZFo
         UMKv79xwPk6eOLyAWT6+4JC9UsWRiWS366IlR2ijbTUmGwpIQZPAVPwUyc8SQhl0lFsy
         3cJql6RUtVJmRrPLFpPXO8Q1h4fbjcf3z/iPDVqhnrTzllA0jws5Rs0H5J52W+Y4WkGn
         vo2ajwtGh7yNP2d/F4M28CytQfcq6yGyesGQo4lySQ7DTRweD9+ar/vsbj/1vpPzHlSJ
         AyCyKryUx8u6G/cs6dm/dqVgPu5EVwybpxdAbr/RKgR55xPM90Zdc2RSDrtRU8/q3AyO
         WcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793949547; x=1794554347;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pIjZ/Y8hQqw73CpdFq92aAVG0/oq5u/tSDIP7hM67k8=;
        b=O9JN1ktxoqZk9Z27WCe10wFMvrf+76Cex9k5zZycrPGyOk0t2mZsr5BLfi4dRr1Nqs
         sb7Y7vankLqkfcUOVURYRvO9TSqXna3dVRCn0iRAFQpqGB6x7FmOrpze5UCDQg6SBhl8
         +ZM0CI+dA8XmmGEiuzIp+tMemaMdH+LZE6Z8gToM05Lvd1t+gfcWjWWNuI5FzOvhRgs+
         xj8j28C6eSsCVHVJmLv8X7EuJL0H9V9A1JbJaylwJs01nfddLxamyB7yB/mw2ep3TqIm
         utLj4oDYd5ySzjwsrgzNf2fM7aCjOjIy+7XhIk0dV/KxRCplDE5fr+0AizErOU0RnIPF
         +I/A==
X-Forwarded-Encrypted: i=1; AKwUvBx3p8HZ1nua+tSGYIpHQ6x43gbQzAWJr9sPiu177m5OiACvJHVV2DHFqxCsTfphvumpW+cSbLukX7raGebm5L4=@lists.linux.dev
X-Gm-Message-State: APuU4Z/BADkqRhJy/eBDZE2El04gDozx+nhm8VzYmLwe1TvIHBytYX3E
	abVAwZlawm/eXeWL9/Yrb9N6IMeaIGhef+KCkUTiT6S51Sm9VLIYwFLWkDKlaNfF9e1NUYiHVYS
	YsD7h4jyowOJBiQ==
X-Received: from pfem17.prod.google.com ([2002:a05:6a00:c091:b0:89b:34dc:b094])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:188e:b0:89f:2b65:2ad with SMTP id d2e1a72fcca58-8b1e5967803mr3971036b3a.27.1793949546203;
 Thu, 05 Nov 2026 23:19:06 -0800 (PST)
Date: Fri,  6 Nov 2026 07:19:04 +0000
In-Reply-To: <au1FF5K9EALuqnNR@google.com>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <au1FF5K9EALuqnNR@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106071904.142937-1-sgsatyam@google.com>
Subject: [PATCH v3] iio: cros_ec: Use platform sensor_num to unregister FIFO callback
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

Use the platform data in the cleanup action too, and pass the struct
device pointer directly to devm_add_action_or_reset(), so it always
unregisters the slot that cros_ec_sensors_core_register() registered.

Fixes: aa984f1ba4a4 ("iio: cros_ec: Register to cros_ec_sensorhub when EC supports FIFO")
Signed-off-by: Satyam Gupta <sgsatyam@google.com>
---
Changes in v3:
- Pass dev instead of pdev to devm_add_action_or_reset() and drop the
  unused pdev local variable (Tzung-Bi).
- Move the note about out-of-tree triggers and how the issue was found
  below '---' (Tzung-Bi).

Changes in v2:
- Add a Fixes tag (Andy).
- Use a local struct device pointer and name the platform data pdata,
  so the unregister call fits on one line (Andy).
- Say what triggers the problem and how it was found.

v2: https://lore.kernel.org/r/20261105132057.2429385-1-sgsatyam@google.com
v1: https://lore.kernel.org/r/20261105073107.172121-1-sgsatyam@google.com

No in-tree driver changes st->param.info.sensor_num after probe, so
mainline is not known to hit this. The ChromeOS out-of-tree RGB light
sensor support does: it changes the field while a command is in flight,
and unbinding the device then leaves a stale callback. Found by an AI
code review agent.

The patch was drafted with an LLM-based coding assistant (Gemini); I
reviewed and tested it.

Tested on downstream kernels, together with fixes to the out-of-tree
RGB light sensor support: ChromeOS 6.6 (Intel) and 5.10 (MediaTek), and
Android desktop 6.12 (MediaTek) and 6.18 (Intel). Unbinding and binding
the light sensor while its RGB channel is read in a loop failed within
1 to 46 cycles without the fixes (the stale callback slot makes the
next probe fail with -EINVAL) and passed 200 cycles with them on all
four. On the 6.12 device the accelerometer and gyroscope were also
unbound and bound repeatedly and still streamed FIFO samples. Mainline
itself was only build-tested (W=1 and sparse, x86_64 and arm64).

 .../common/cros_ec_sensors/cros_ec_sensors_core.c  | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
index d03e40c91582..67fb53071684 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
@@ -213,14 +213,11 @@ EXPORT_SYMBOL_GPL(cros_ec_sensors_push_data);
 
 static void cros_ec_sensors_core_clean(void *arg)
 {
-	struct platform_device *pdev = (struct platform_device *)arg;
-	struct cros_ec_sensorhub *sensor_hub =
-		dev_get_drvdata(pdev->dev.parent);
-	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
-	struct cros_ec_sensors_core_state *st = iio_priv(indio_dev);
-	u8 sensor_num = st->param.info.sensor_num;
+	struct device *dev = arg;
+	struct cros_ec_sensorhub *sensor_hub = dev_get_drvdata(dev->parent);
+	struct cros_ec_sensor_platform *pdata = dev_get_platdata(dev);
 
-	cros_ec_sensorhub_unregister_push_data(sensor_hub, sensor_num);
+	cros_ec_sensorhub_unregister_push_data(sensor_hub, pdata->sensor_num);
 }
 
 /**
@@ -372,7 +369,6 @@ int cros_ec_sensors_core_register(struct device *dev,
 {
 	struct cros_ec_sensor_platform *sensor_platform = dev_get_platdata(dev);
 	struct cros_ec_sensorhub *sensor_hub = dev_get_drvdata(dev->parent);
-	struct platform_device *pdev = to_platform_device(dev);
 	struct cros_ec_dev *ec = sensor_hub->ec;
 	int ret;
 
@@ -391,7 +387,7 @@ int cros_ec_sensors_core_register(struct device *dev,
 		return ret;
 
 	return devm_add_action_or_reset(
-			dev, cros_ec_sensors_core_clean, pdev);
+			dev, cros_ec_sensors_core_clean, dev);
 }
 EXPORT_SYMBOL_GPL(cros_ec_sensors_core_register);
 

base-commit: 1390ca4953a7400ca932cb49635f02c727f885a6
-- 
2.56.0.455.g6c5a503b38-goog

