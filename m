Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F3829ACF6
	for <chrome-platform@lists.linux.dev>; Fri, 12 Dec 2025 02:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765507548; cv=none; b=ny8m4MsqHtJnF0FRbqBI8KtEVbsNYj+L7Y7LET9kMc6O/VKSnV1qPWnG1Pw+qWUimieUow1GDEKB59f7Flv9i6PFtUcjDbt5fHSu3qRTNSqzpEtqNu8r0jd0pXoDU7riG11e84o38b0OhL/cao0QUrxh6xYt3I+uTVotGoe8YP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765507548; c=relaxed/simple;
	bh=q6gZRxmz6cKGnQKSSxqxXmYWJF1PKw60AF3Tc6GXjyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OmcN6IlVjJM+hPjiJy6Qu+zZdCAgplJatWj6ITzWGvfuaUeCnTWogJyc+86BJdOvqC3KF8WmEFBWudT0DWM1wEn6UQp65EvAM/kvEDtfIl7XdnkKmeXHP5fE7z69mb73euPFVjGoVaQMX5hO17yCMp3YB4eCSpgwWoiyCy9TP1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eb/nzAlz; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eb/nzAlz"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-940c539de8fso218764241.0
        for <chrome-platform@lists.linux.dev>; Thu, 11 Dec 2025 18:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765507544; x=1766112344; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2wlEL307B3m+aaEYqQkKNwT5MYGrgAWckQlDU+pQY6Q=;
        b=eb/nzAlzXErZjLhiL2kIjaJhdzTmV37SHOLcCDsZuz7xN79Ti1GLjzr31L26V8VJHM
         J4aByZJ43nJyRfM2fNg2dzcC0plASSBeP/MC5Jd7Pgm+MV3bhO98QrpVsfpP/BTvyEEk
         AWXzLu6Y9mKqHlG/amNqtB5x8EwBrnl2UwU3vhwtPi6WM3IL2ztZFeAyO/tWVqQh7uWm
         yLNVsPC7Ug/zWSU0NFIx1IaITggHTj53Iv9iSKvXpRntWmlhG+FMZ9hcXHxYI2rekbCR
         vWdowY+C8OMnQuilaxHk1USLFDjRwsoFJIqlA/CIBa/lAttkhL2LzSqiJLPgQV0jMNkl
         zC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765507544; x=1766112344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2wlEL307B3m+aaEYqQkKNwT5MYGrgAWckQlDU+pQY6Q=;
        b=JKAX4KwX50B5yU5UxgtLcqCJRGK25bSm8QHtU4Hm6iTPqWARM0tp+2eD9fAcMCxJvw
         ll2Nkg031PUJocgaxXs6W2ypDHoln1l2mK2Ij1MVitpZ1Ngiq5BfR5u1ATWB7sLyGl+d
         5J2p1CDL4KYhtd8F6aEiB6jbtrdiEOu27zPr1qrsy3+Z/lthKmLrg9Ao1ZXzP1sIqGc5
         KboXtjDnUJiYIRy72YhpqWAacuwj85stC1QgTF+8NwuJ8xuZy33i8MdVKa8tp2Spb4NL
         OcsUlYuskJXMtRP+BxDglqnUIajj1YifKCHEUoDzCSi9PFeYdKHSnlnXDyuKJoYIAk4b
         FtGA==
X-Forwarded-Encrypted: i=1; AJvYcCV8D5+9sq1cyDtGZDlmwFeEO1YE1BXhCrGdO2FEveBCh4fiE7uTAmgzuznv0MTa8bTq1uL60x/6+e2+YWc8lLM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyoLVGQi+8s9y48WXg6DI1B61BoKpi3MfzaVYTTJAQJh16hwhT4
	X+h8VG4AP0GVstKGk2H5vNuU8j/HfMvoUgK8g8/lLquPLkBsIB7y3+Ix
X-Gm-Gg: AY/fxX6Jm43J7Q1QpNpjrHhxMmEGdkbtSsXC7ZDuoCx96kv34FU44Cptq1MOtcCNvj4
	FXJAz3c7XWH4POgPTpY4AetfXGpwK4HjvL1q7QJBGBV0auknYEec0g8lU64XW/5bjNxaQvEURMu
	LMyJBbXeNRGcl6tifnbyhlIANTWZ1FAOPOcvqwVFfWojFNbEbro/L9RB+MatJCb75iR9Mo7uAeU
	1POyeyfhfibRCzD8Lu55fOsgTY9YeN5eua8MquoOb0nGCZmuCYhtM+2duSEAjAcdCvtrMnm+zHj
	smZihoWbCf+CRzkv26VLYKZAXZaIacMq90sQ3FxlD+FwCZ2SO6rNi7VUhPYL0mfBn9rK6mElSvb
	9pboHFWSGAqyhYp6ZI2t0bxC/SUE743XXsawSPOTIugAo+NcK+JX6Xx6wnOg0KLTzya2mtiTOkc
	EMP5v5cstQVJHZ0OCWnihRjzw=
X-Google-Smtp-Source: AGHT+IG0wdLgjzf9Ktth3/5kZmD0HDcUqwfLcmvB1VHLyGx97sarm2rz4f/F64/HbgrAXqumKQeOKg==
X-Received: by 2002:a05:6102:945:b0:5db:f615:1821 with SMTP id ada2fe7eead31-5e8276b6fecmr140118137.10.1765507543991;
        Thu, 11 Dec 2025 18:45:43 -0800 (PST)
Received: from [192.168.100.70] ([2800:bf0:82:3d2:875c:6c76:e06b:3095])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e7d0f25ce2sm1693762137.8.2025.12.11.18.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 18:45:43 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Date: Thu, 11 Dec 2025 21:45:23 -0500
Subject: [PATCH v2 5/7] iio: light: vcnl4000: Use IIO cleanup helpers
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-lock-impr-v2-5-6fb47bdaaf24@gmail.com>
References: <20251211-lock-impr-v2-0-6fb47bdaaf24@gmail.com>
In-Reply-To: <20251211-lock-impr-v2-0-6fb47bdaaf24@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3034; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=q6gZRxmz6cKGnQKSSxqxXmYWJF1PKw60AF3Tc6GXjyU=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJnWjSdTFecdzhNMZ5e0WlEw07Hnq8fE7OMHH9+5uOVkb
 czi+ZMkOkpZGMS4GGTFFFnaExZ9exSV99bvQOh9mDmsTCBDGLg4BWAi9xoZGS4HJzyYUb40KfdQ
 0MacMHGmjX8yPY2vWaXsTn6bldDZ/Jbhr/Cx/rqAJafilN97XlsRo+Wy3PizUvI+2e3PNbVTz9x
 05wEA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Use IIO_DEV_ACQUIRE_DIRECT_MODE() helper to automatically release direct
mode.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/iio/light/vcnl4000.c | 49 ++++++++++++++++----------------------------
 1 file changed, 18 insertions(+), 31 deletions(-)

diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
index 4dbb2294a843..4184104ac8f2 100644
--- a/drivers/iio/light/vcnl4000.c
+++ b/drivers/iio/light/vcnl4000.c
@@ -1078,20 +1078,17 @@ static int vcnl4010_read_raw(struct iio_dev *indio_dev,
 
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
-	case IIO_CHAN_INFO_SCALE:
-		if (!iio_device_claim_direct(indio_dev))
+	case IIO_CHAN_INFO_SCALE: {
+		IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
+		if (IIO_DEV_ACQUIRE_ERR(&claim))
 			return -EBUSY;
 
 		/* Protect against event capture. */
-		if (vcnl4010_is_in_periodic_mode(data)) {
-			ret = -EBUSY;
-		} else {
-			ret = vcnl4000_read_raw(indio_dev, chan, val, val2,
-						mask);
-		}
+		if (vcnl4010_is_in_periodic_mode(data))
+			return -EBUSY;
 
-		iio_device_release_direct(indio_dev);
-		return ret;
+		return vcnl4000_read_raw(indio_dev, chan, val, val2, mask);
+	}
 	case IIO_CHAN_INFO_SAMP_FREQ:
 		switch (chan->type) {
 		case IIO_PROXIMITY:
@@ -1148,36 +1145,27 @@ static int vcnl4010_write_raw(struct iio_dev *indio_dev,
 			      struct iio_chan_spec const *chan,
 			      int val, int val2, long mask)
 {
-	int ret;
 	struct vcnl4000_data *data = iio_priv(indio_dev);
 
-	if (!iio_device_claim_direct(indio_dev))
+	IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
+	if (IIO_DEV_ACQUIRE_ERR(&claim))
 		return -EBUSY;
 
 	/* Protect against event capture. */
-	if (vcnl4010_is_in_periodic_mode(data)) {
-		ret = -EBUSY;
-		goto end;
-	}
+	if (vcnl4010_is_in_periodic_mode(data))
+		return -EBUSY;
 
 	switch (mask) {
 	case IIO_CHAN_INFO_SAMP_FREQ:
 		switch (chan->type) {
 		case IIO_PROXIMITY:
-			ret = vcnl4010_write_proxy_samp_freq(data, val, val2);
-			goto end;
+			return vcnl4010_write_proxy_samp_freq(data, val, val2);
 		default:
-			ret = -EINVAL;
-			goto end;
+			return -EINVAL;
 		}
 	default:
-		ret = -EINVAL;
-		goto end;
+		return -EINVAL;
 	}
-
-end:
-	iio_device_release_direct(indio_dev);
-	return ret;
 }
 
 static int vcnl4010_read_event(struct iio_dev *indio_dev,
@@ -1438,14 +1426,13 @@ static int vcnl4010_config_threshold_disable(struct vcnl4000_data *data)
 static int vcnl4010_config_threshold(struct iio_dev *indio_dev, bool state)
 {
 	struct vcnl4000_data *data = iio_priv(indio_dev);
-	int ret;
 
 	if (state) {
-		if (!iio_device_claim_direct(indio_dev))
+		IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
+		if (IIO_DEV_ACQUIRE_ERR(&claim))
 			return -EBUSY;
-		ret = vcnl4010_config_threshold_enable(data);
-		iio_device_release_direct(indio_dev);
-		return ret;
+
+		return vcnl4010_config_threshold_enable(data);
 	} else {
 		return vcnl4010_config_threshold_disable(data);
 	}

-- 
2.52.0

