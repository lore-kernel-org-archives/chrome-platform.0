Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692DE13D503
	for <chrome-platform@lists.linux.dev>; Fri, 12 Dec 2025 02:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765507549; cv=none; b=E3HNinAsTCd/woAqhhrijy/zC0IgnZdf6s43u5BGQ4QeLiCYH9oME9UWp0KNrnSKuodqtUzZhWV4hNe4gseU2epcP6WxWQIDT+prTBMpUnar2WH7aKyEFGgnFDNhedXBnWQeDNmB+CUyRk+QF/QOV7FFIK5GtOfdDFdw1EcTB9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765507549; c=relaxed/simple;
	bh=m4docKzSN6U3IisnQGU0vDNlqcdF+sgdQ/746l+2whQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hrOvTR7LyKydzTZRnGBwYk0WLoUMgTgoeUVATZWxqFzh2bfeGGnE3EpBmZFggGt3tJ9O1uFLbHup3jAMfQQ1VrswZGUf5McLhCifckf7lu1qFN1DlNxqJfEyRM0OD9PV3HKRcxQLP2RRjYw7L9VRFCNvihvQrjYC0RE2Z0QRHPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GgNHWa+c; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GgNHWa+c"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5e1fde1f014so256026137.0
        for <chrome-platform@lists.linux.dev>; Thu, 11 Dec 2025 18:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765507546; x=1766112346; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SZxE86UOpBkEr43S5oO3m/muydq3y/4ppHxIwZHfNzc=;
        b=GgNHWa+cT2kEiBYXA19Ae8uMHRd3KE95n2GylgeH8T9kQ9IkliJgQ89jYoScu9OhyC
         Q1wpih23/CtqlEflrpVS17etgry6Wl9D0at8+4EumGQWQs0BsureUSabWPxR0MssIxeN
         Tym1gryZ0fkOiPb0ZjmXzMycwgyswsvWyVo97cmfb7v8KPUBdOfi8W9MUR2Db6y4qf1j
         NvE1T+oxixjKkvta/WXBRDQckbBJSysQAONdnpaTwwQ+6Awl4YMOL9ZSBxfVfxGZl1N0
         f6KuP1lHeJFktTKJ5fCSbpNyLnOP6u1N4783z5UBikyx19An10xgzw2WV21IdSI9L25B
         hLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765507546; x=1766112346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SZxE86UOpBkEr43S5oO3m/muydq3y/4ppHxIwZHfNzc=;
        b=a4pXgb+n6pzqlBFUhocTePQfcanreCxi+i3QGEhtPLDDVLz1N6rmi9plf7+9+aBMss
         lG1OhZlKE055YYG9Pc351cb/6xS+Xn8UJEaMPjOeRQ/UigrB7xvmgwzAVfkh7ZIaBLYJ
         LIYRhqceTjeQXqi3f4mxxwnLIXqi5SlMe4YiQ0l+5sd24LQYEyoAbqmM3VoVenINoasD
         zjbZDS4ei5icA0c96xjLggNLEl236ZvFgykQZJS9ZEGEw94SctN7U/XYWYKlZyWklYYI
         o2oBW6uB0oiMmjUDfb25OWhxOF68JEhN7Ln67SkMY390r5w9Nx9Ls2tlp5mzTVPnyMNJ
         vVhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXG1ErjoXq3D4ZeFXIdjD5wOUXvmbYlbXyW9r41npNwkv+gI703YJLHY4fwlk7ZLozprF/uKgZcfF3KbWT3tBo=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywtijr7a/4jQLU+46fDjXAwN70P6EIpQrhjKElL2DMZC+jZqRsu
	MTMugWo5TeGdW/Uih0k7CpZ1jUt49FBkl0+JYu6D6KZm7Z2o2yuyI8C/6xUNCA==
X-Gm-Gg: AY/fxX6yU9AGSJckF0nsXUV7JYQUGopyXaiY+CFnJVCP0B1lVWNLbdlvS85hmktN3fv
	2HoK6PMZMLnbOct/nZm4Fl+Ucn9g8Uqq9dZImtNc7UQ1FdmGZXNJH6nO3f8rNHnIiAT7nhW1wPr
	HbjKX6MAyL0ilabQbiGCO7aG9uB6q+TUaRW/D4kqr+fwu0FdZp29hMf7VmHn8HZ+nXAvTiR4gu/
	sj7j20rPok4wFm2bOxiNJVnlxIeEKP/ehve/WBpYNzrAf8NQg5uQcTth8362uL02v254AZy3MRx
	795CF8qvitcHiJVSjcCdD8xCr3MK43gNrIgwSyrG8mr0QGBXZ31FRD7r6+qCZfyosjZdnn8Fdns
	KCe8Nao6YU+9V1Em+lZbSvMlwzsyhswRVKxBjvSWtszRdE4z/DPMs+ri+IXbC1CqtdKW0tehEUF
	0zf/4+AKT1A6Oh
X-Google-Smtp-Source: AGHT+IE6R1SPTPYAVrVVaJYQAbRBZp7N0gNjOqqIWn71FlnxAZHPp5xMi1+R7KzVuAZ/J+ZqU/BtQg==
X-Received: by 2002:a05:6102:5a9a:b0:5dd:84f1:b51a with SMTP id ada2fe7eead31-5e82788200bmr94910137.43.1765507546232;
        Thu, 11 Dec 2025 18:45:46 -0800 (PST)
Received: from [192.168.100.70] ([2800:bf0:82:3d2:875c:6c76:e06b:3095])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e7d0f25ce2sm1693762137.8.2025.12.11.18.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 18:45:45 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Date: Thu, 11 Dec 2025 21:45:24 -0500
Subject: [PATCH v2 6/7] iio: health: max30102: Use IIO cleanup helpers
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-lock-impr-v2-6-6fb47bdaaf24@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1978; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=m4docKzSN6U3IisnQGU0vDNlqcdF+sgdQ/746l+2whQ=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJnWjSf782TM12mtP8/XLVE3/SujM+vX+E7D3v0PsgoT4
 7rSlvN2lLIwiHExyIopsrQnLPr2KCrvrd+B0Pswc1iZQIYwcHEKwEQO8TEyXOz/F91xtu8Zq0IN
 k7oqW+9J0QJmwWzmaWVZK+Sm75UqYmSYWfog54KZl+KBeV8agr+f2KM/yclxx5tNi3Y3TJomx2f
 MBQA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Use IIO_DEV_GUARD_ANY_MODE() cleanup helper to simplify and drop
busy-waiting code in max30102_read_raw().

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/iio/health/max30102.c | 33 +++++++++------------------------
 1 file changed, 9 insertions(+), 24 deletions(-)

diff --git a/drivers/iio/health/max30102.c b/drivers/iio/health/max30102.c
index 288c2f37a4a2..94e15598ffe7 100644
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
-		if (!iio_device_claim_buffer_mode(indio_dev)) {
-			/*
-			 * This one is a *bit* hacky. If we cannot claim buffer
-			 * mode, then try direct mode so that we make sure
-			 * things cannot concurrently change. And we just keep
-			 * trying until we get one of the modes...
-			 */
-			if (!iio_device_claim_direct(indio_dev))
-				goto any_mode_retry;
+		IIO_DEV_GUARD_ANY_MODE(indio_dev);
 
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

