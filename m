Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E0E31D380
	for <chrome-platform@lists.linux.dev>; Tue,  6 Jan 2026 08:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767686846; cv=none; b=FeVrNX5OguL7CzncIoGWImDaeTC1jXeB08i7qacZUcDSqD9On/XkmA4DQnzVHyIipx/BL7xr7B+dDnAVHljpDVK41mQ9s2K4vMzV0WWyST3JGwskcd5zbdEY2xgxPbWhU/qvaLBJCv03QdJScrieM0LpTMAQbJ8dBR8doZhobUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767686846; c=relaxed/simple;
	bh=jST8YWaLnMAtgHk7XAcrnI7kPyw94LuFrxCKSJqYUYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aei5wIYE5K1IS0ZBDxo7M0PMh40JqjXZmUw+Ute+sX5YeMZYOD5uOS5En/yZKgm2MZIGToRdWSXkDwkizr1eaCNvYIJWU7F/FUNkP867V+Sq5MQttMTYKzSfeO7/UnGHuPCrGK5r/apw6yYaAYiRqtjQF2BgRPwEO+f6FcZmO4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N61OTLNC; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N61OTLNC"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5e186858102so245358137.0
        for <chrome-platform@lists.linux.dev>; Tue, 06 Jan 2026 00:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767686844; x=1768291644; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D7qfoHuaDZ50kLfHlMteLMtVw6amwlOWFBtzdbbJ0hA=;
        b=N61OTLNCtj3kbNBgq5M1AERzy0V0y76YVfkP4ORqlHbHPkSqiNLybPfWVkIcbdigtV
         CaM/cS16cqBKreegcGBV3OqU7MJQyjiunkY8jRCMY91+8aRpE3rQvajDyX0R4VQ2bs4w
         H5ttsKdy40r+3GAbryWWekn9VnNYSPhQxpWt6aQ5br2+ICpOPyFGKZUkpX1osiyZUkex
         qqydw2piHehW5qRf17B6Iol2cvnyK/npoTz2DTM7NLUTzXuji80vlO1bIReNqJtJsvDj
         w69hV7Zn0OrrCrWjIsNkBTTrGinJ67Pakhi8aBGYayGIRV2uFM7O04AqAawiFG8CDtUX
         g/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767686844; x=1768291644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D7qfoHuaDZ50kLfHlMteLMtVw6amwlOWFBtzdbbJ0hA=;
        b=WCeq+m7GQJ8An4TOG2DLnNe3OaG275celzVciDSZ9dnJ/5DWO49VRQWc2SU7i/W1Zg
         AeaoK42uszsivMXxNAaWF4gFzqX02DqEE4MuySOS8XYxNJfASZYc/FDs9kdkZOc/Nmm4
         Fu5HkeJPWpyM7/zPTWXxwEY74tePcDfDcR6ZTkR4JVPYZ3iGwvnRAeh5Qu6JpzId5rmZ
         td0ATVy5CEKZTFLWq8GH3AbYiIQqy+7fV/R5tmFsVYYZ4t21V06mtfUJRPFI1gcSXyxD
         kyUfRYggGHuTo02TEIK122U59EeR8zFkol3QZGIUIvm4v+ZQ9SdfRNRgzaqy93LOUD4y
         Jjiw==
X-Forwarded-Encrypted: i=1; AJvYcCUgmdseuxs1aAlcy+IKxWWEDfg2PGcR2Ldg+idDr+vls6PqOVjiiwtNq7yZYTEeE2LQSnH7Zo2og9+ewpALKJc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwznYRnFe6NHNGASHBEvyAVM0PwFnK+gNhe3qEUcNSFV59AAvoe
	ONsbW1oT4hAKij7GgUz5JskpC9QHa+PsGbF6h7uY3xkBd0jx0OxbRq/J
X-Gm-Gg: AY/fxX70ex9xhuLsl4TtADn+ggJyw91VbMocpzv2TWYRE85JBv+uyuuZpSrxMIJFxYc
	9xWz57EltxgT3pvaUKv3Gd/20IL63Dc/Flv/UqXZHuUbR5Bh0eks/D5fqqR2x3a1fGB8y7MRDP+
	1nnIu6vvYHzWdxDsBzr9rOg7A8Gr/MN18gLwK1JoG2wux5d4kuflj3W/2fb90TZe9AUL3jYeQjT
	B/NmtZLopcODwQrjXMNclgG0/Y39VltWSkCRbLzWhFxx5K1C565Vn1lpEJc+26YPWxniowVwnBL
	y8T/yABSu7JYFs1MS/lIqF1hGpfJfpUu6umuIoOcQzjNd85TdkKF76PgJFDNqBH7rcSVPZv687o
	vcir/DIIWckIffKQX8zzRh/MztSmy/6K4A+ujrs9UHUcD76+t3CAHJHhbgNHSSY8YZ4DwwF9Kad
	0NmJt9XYwZrIkl
X-Google-Smtp-Source: AGHT+IEOOxZYpo/K70Y60Wzd+ufz4LlZARi5sg/MPLgZ3kPxbQmLCmg8j1yushcQiANxH1KXvE/Mtg==
X-Received: by 2002:a05:6102:e11:b0:5db:dd12:3d16 with SMTP id ada2fe7eead31-5ec742e6215mr539074137.6.1767686843630;
        Tue, 06 Jan 2026 00:07:23 -0800 (PST)
Received: from [192.168.100.253] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-944124a3386sm457615241.11.2026.01.06.00.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 00:07:23 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Date: Tue, 06 Jan 2026 03:07:01 -0500
Subject: [PATCH v3 6/7] iio: health: max30102: Use IIO cleanup helpers
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-lock-impr-v3-6-1db909b192c0@gmail.com>
References: <20260106-lock-impr-v3-0-1db909b192c0@gmail.com>
In-Reply-To: <20260106-lock-impr-v3-0-1db909b192c0@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Benson Leung <bleung@chromium.org>, 
 Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Gwendal Grignou <gwendal@chromium.org>, 
 Shrikant Raskar <raskar.shree97@gmail.com>, 
 Per-Daniel Olsson <perdaniel.olsson@axis.com>
Cc: David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1990; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=jST8YWaLnMAtgHk7XAcrnI7kPyw94LuFrxCKSJqYUYs=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJkxh1ZF8KX8dd8x4/T6/6t/7hG7qST89XfxOuOYGbJWH
 xgbl0036ShlYRDjYpAVU2RpT1j07VFU3lu/A6H3YeawMoEMYeDiFICJqLAxMrxNuGyn+2CLTUPM
 kaXWVy/N3nVVzsDLa5OCx5tj/44a313M8FfmeOMvphX895Ul1zks7Fj4mHO24y2212yLKp/+mL2
 s8RcbAA==
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Use IIO_DEV_GUARD_CURRENT_MODE() cleanup helper to simplify and drop
busy-waiting code in max30102_read_raw().

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/iio/health/max30102.c | 33 +++++++++------------------------
 1 file changed, 9 insertions(+), 24 deletions(-)

diff --git a/drivers/iio/health/max30102.c b/drivers/iio/health/max30102.c
index 6918fcb5de2b..47da44efd68b 100644
--- a/drivers/iio/health/max30102.c
+++ b/drivers/iio/health/max30102.c
@@ -467,44 +467,29 @@ static int max30102_read_raw(struct iio_dev *indio_dev,
 			     int *val, int *val2, long mask)
 {
 	struct max30102_data *data = iio_priv(indio_dev);
-	int ret = -EINVAL;
+	int ret;
 
 	switch (mask) {
-	case IIO_CHAN_INFO_RAW:
+	case IIO_CHAN_INFO_RAW: {
 		/*
 		 * Temperature reading can only be acquired when not in
 		 * shutdown; leave shutdown briefly when buffer not running
 		 */
-any_mode_retry:
-		if (!iio_device_try_claim_buffer_mode(indio_dev)) {
-			/*
-			 * This one is a *bit* hacky. If we cannot claim buffer
-			 * mode, then try direct mode so that we make sure
-			 * things cannot concurrently change. And we just keep
-			 * trying until we get one of the modes...
-			 */
-			if (!iio_device_claim_direct(indio_dev))
-				goto any_mode_retry;
+		IIO_DEV_GUARD_CURRENT_MODE(indio_dev);
 
-			ret = max30102_get_temp(data, val, true);
-			iio_device_release_direct(indio_dev);
-		} else {
-			ret = max30102_get_temp(data, val, false);
-			iio_device_release_buffer_mode(indio_dev);
-		}
+		ret = max30102_get_temp(data, val, !iio_buffer_enabled(indio_dev));
 		if (ret)
 			return ret;
 
-		ret = IIO_VAL_INT;
-		break;
+		return IIO_VAL_INT;
+	}
 	case IIO_CHAN_INFO_SCALE:
 		*val = 1000;  /* 62.5 */
 		*val2 = 16;
-		ret = IIO_VAL_FRACTIONAL;
-		break;
+		return IIO_VAL_FRACTIONAL;
+	default:
+		return -EINVAL;
 	}
-
-	return ret;
 }
 
 static const struct iio_info max30102_info = {

-- 
2.52.0

