Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A377D33290F
	for <chrome-platform@lists.linux.dev>; Wed,  3 Dec 2025 19:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764789588; cv=none; b=sUKBok/G6YG06dTIjCO/kHYlkycqJJRodYisf8Fxdm6hioyufraoc3gIaBUocvIxy8dTYM3Zlmz/dYtXFNqPgaWLaDN+bYckatfNCrVzmecmg4j4tQsJxT4rhPt4D5hj9lo5OEp50tnEli5q/3o/BKtCdhw2+YlCwQrEwQ055R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764789588; c=relaxed/simple;
	bh=ucvYi/fPnZwmSrVe8f+rF/TKmEyH9GUn56ivSGU8fjY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IlKBovAtwTrV/CwSIogi6/GSsxbV0nVGNsMTAqQJO2vSDdNwebMPSfickgz0bDm9Yn9r4pBcMJj3+XQS6AWhTAHe1VtPR0kIYMiKLV/vl+LXX9nyXvdHkEeeBqUuXw/pFtMB+QMvnteiVqmVLHqd5aM+85ycmvrgvAD8MHthxD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lkEXyNLW; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lkEXyNLW"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-55cb8cabb4bso33115e0c.1
        for <chrome-platform@lists.linux.dev>; Wed, 03 Dec 2025 11:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764789585; x=1765394385; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dM4HPdX4dOmyhruohtElWZ1/XJUUUMG2tu2VLn0sUYA=;
        b=lkEXyNLWUWczoNINPzoNYYf9gYGmKXPc29wYSBisajhRXQT3dplN1PabpDaNdnYJ2E
         rVBkib+lD8MlSKKeGM1xivyP6P7GydS3Y+ue3oUquvJ5ycx/+1sOwTXJONIL30VvzJ92
         cxVet5lH5cuFN38bTWoD8oZk/JWzR8Qkz6y/9BrnD5/YRzWIcEdTsdsHKnz2PN5za08c
         Age//1Nuo9PE8faeOAz64+Vy44pbw7z1HWCdWbnhA0qtwixXc3yazSJCYrQPROA7oMvo
         TdFy7SK0HEurS5Xih47cdt/j22y/j7ByRYILVMmyNaW44AqjFhlqZLf/9Q2dw76UYkKx
         g6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764789585; x=1765394385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dM4HPdX4dOmyhruohtElWZ1/XJUUUMG2tu2VLn0sUYA=;
        b=cjACzGA0U30gPmBQgJ/Xbwj6HQod6sxybqV7KrfyKFNVmSVsaBmCr0SVRpv0b1242c
         kz+xSnMYLpdEGVJ0TQaIYmMb/xMc03Ma5ZXhIS18q3g1cMPu9hLo5nVU9/CXiwexFk0b
         TNHo4CoeyON7Bv8ROJbR0AgErpPELUTq3EafyMo7HoXHWoTHXIakxEp+CryYX20DMAAX
         iK1W+u+qFDEv6wG9x03Yj9KJVUqlzZ+sTgR/5PxUaiWaGlNIBu6y4juvSNHtWbDzx1X4
         hstXJ94ss5VtJZGvG57ujp2kb2LwmwojFw5VwGljRdb/OkVcJsNCaQuofsJJ31TsEcsG
         G9xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHg5TAuxV8nKDv/8liRTH8qVL7MKfxz9UxMxDdp2LCJx4Asv8mnX5Z0x1FGBE/rDIthHIdre0oQLAiOcQuruo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmWx8/dpSocAFjHl4WLOWA/oB1WzF6Zy8emrIbHwcgb8h7J8AY
	3s63iz4ZmNGjGOnGXyVRJjvUt/HXZe/FY8LKhomjZ2nbHP91PjaUHlge
X-Gm-Gg: ASbGncvChsi9e2qdLlJRZ3NHVpt2qmCdoeoYcClV03iu1ZKlEqNDpH+XHSX+3/h0pie
	a7YJrKOuc4xj5G+T48SlL7oiVZGk24u5WIcHzuEjExjRSKoEA8rPrN8HHEjvjoHKj45KDR9H0L2
	B3argnXnwij3KZc0DWY4oKzPIhQnTWVgMG9YIcMhDEgFtBQaY2M1vTYzXu4lhAP99l05r1XY01x
	UbIG+s+6sRAg4UWXa9XVHVCH8ADXu2aphfUvS3E6/MMteGboL2pJ86e9hY6b45YgLtZLGhtb+nq
	i0Nmaa9COoVV2YChuFukIrB43hjFWZ7aj2LxNQTV4H2RT2YVte0NyXlVYox8RoJaQyqzb7fQuBf
	hF0LM2epCdjm/wh9JfanfoVBFkfH6LHdys8nKuuOnEEo7t3TMnSmzW/JrdENXJxngw+7UGuzg0x
	/ORbZJKjS0y/tN
X-Google-Smtp-Source: AGHT+IH7tjt+w/bV9ZILans2knWsfwOh1Xdu6i3tY896xYt5Nr83RI3AyyRrteVbVislKJyjm479Pg==
X-Received: by 2002:a05:6122:7cb:b0:55b:305b:488d with SMTP id 71dfb90a1353d-55e5c057c49mr1365135e0c.19.1764789585458;
        Wed, 03 Dec 2025 11:19:45 -0800 (PST)
Received: from [192.168.100.70] ([2800:bf0:82:3d2:875c:6c76:e06b:3095])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55cf4e1d56asm8121346e0c.4.2025.12.03.11.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 11:19:45 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Date: Wed, 03 Dec 2025 14:18:18 -0500
Subject: [PATCH RFC 4/6] iio: light: vcnl4000: Use cleanup.h for IIO locks
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-lock-impr-v1-4-b4a1fd639423@gmail.com>
References: <20251203-lock-impr-v1-0-b4a1fd639423@gmail.com>
In-Reply-To: <20251203-lock-impr-v1-0-b4a1fd639423@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1735; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=ucvYi/fPnZwmSrVe8f+rF/TKmEyH9GUn56ivSGU8fjY=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJkGva72pnZq05I+sjGcXON864Fc5oxsptcTKzWTLX4f3
 bdA5WNbRykLgxgXg6yYIkt7wqJvj6Ly3vodCL0PM4eVCWQIAxenAEyk4AAjw/MCfY695/fWnr/+
 Zhv7NDHvSuMgW+PPl2b7Rfn4nKqMVWBkeCpgEyckpW5Wuj6dWyv2kPFtma+qqceYOn6eF6l/Ufi
 dCQA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Use ACQUIRE() for iio_device_claim_direct().

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/iio/light/vcnl4000.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
index 4dbb2294a843..55e5060ce337 100644
--- a/drivers/iio/light/vcnl4000.c
+++ b/drivers/iio/light/vcnl4000.c
@@ -25,6 +25,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/interrupt.h>
 #include <linux/units.h>
+#include <linux/cleanup.h>
 
 #include <linux/iio/buffer.h>
 #include <linux/iio/events.h>
@@ -1148,36 +1149,27 @@ static int vcnl4010_write_raw(struct iio_dev *indio_dev,
 			      struct iio_chan_spec const *chan,
 			      int val, int val2, long mask)
 {
-	int ret;
 	struct vcnl4000_data *data = iio_priv(indio_dev);
 
-	if (!iio_device_claim_direct(indio_dev))
+	ACQUIRE(iio_device_claim_direct, busy)(indio_dev);
+	if (ACQUIRE_ERR(iio_device_claim_direct, &busy))
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

-- 
2.52.0

