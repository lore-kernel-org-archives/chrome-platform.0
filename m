Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BE43793D3
	for <chrome-platform@lists.linux.dev>; Tue, 20 Jan 2026 06:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768890085; cv=none; b=sOPVVYoNwuPKbziLg9iq7WTFg8YmqR113JDcW6JxGpiwMttkCBCX6PXPwGo3hCGeQRxM8j8m1IaoufnIEFnmD8kPbxBPZbk+DQhEPRZX9CTHt7wj/UEOJ3jhxN6WCts7xRewUpVJbWefMHpXhw3bZYM7cNthIfWZjnrcs2XVGo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768890085; c=relaxed/simple;
	bh=3P+X2YeLcPjCXYTP9cibJrgBqh+scSiCbpaQGpGyBmA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WT3/9VWcllPBtWJAPyWG+nOM4HHMl3z5ICsjvrhDHvnZLghCPzRbupHtIiKrAa1LPHbEaFg7VJf0Q4vNjnXBLD2KppPJH3T7us+sdcRKR95GZ9xIkiiCS9j/2BcrSLSvf2kb8SdbTzBwo6gjTnqqze6BQXzjz/CBRRS3iUwOvDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3r9YfOu; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3r9YfOu"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-93f573ba819so1853053241.1
        for <chrome-platform@lists.linux.dev>; Mon, 19 Jan 2026 22:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768890082; x=1769494882; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XTnTVRGv/a3yeACWeWEj6KZeE3Y99K4b2EX+Zi7IhJ8=;
        b=b3r9YfOuUDkozFHRyomIQT00hBawz5gn1iMNFOxierBgeBzui/b1igCasi3bRcR257
         VqzhcKaONDzvLqCoqKSnFt3RRfrUcDUKGld23nBxjqqB95Ziw9zNowNEZXDGwEwPpiy1
         CxuT7jHfbBDnU5EAq2OkvK3bullm2cHHYuFr0lppRtCrN2zQ3x/jIoR8pM+I+zK4NOpF
         VHAlR5v5hTy7TJD4njPQOyydRnuUYMQY/7Op+xM/Y/fUeuByTZIc3n1Jodrz4Wxl5UEn
         eEeEP4QbcQZ8tLv/mCmoRSnJqG3UaUWHbCu9mQE6tUj7XoJM7t+hIuz+Hl+CnPaeXcEx
         wfTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768890082; x=1769494882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XTnTVRGv/a3yeACWeWEj6KZeE3Y99K4b2EX+Zi7IhJ8=;
        b=nF40oU8UMx1fU7yAdIEpqK7gdEfe+NIixYfFrouUR4Y9cEcJecAaM6PyciNV0LubIz
         67xrQ8pxmn82P0P+9ZqgSAnAcqtW9w/OS1bnW3Snxu6C+5931g9c7Fx2STFh5DAQEa4S
         Na7Z3kwG7C1lHZMnyYIAqXxYnTvqL2A1VsDkgbcbLauRSThQpYSDRoAl/SNl15rPONHH
         S3V9boyRu8YfTA2v/PCPN1tbsvtsjr4z7fP++8AgVvvd7dMR4skmlfOnl7/snL46BPQm
         pzupyDUhRokYNKso8Q1vR7aKfgL9DaInmZWi8cGIUNvJZ2uA8hiBFTKUkPuNpyjNO/RG
         8Acg==
X-Forwarded-Encrypted: i=1; AJvYcCWAV0cZMW0RbJgpfejg592cEsCEIvMj6Vz9dT0tVjuwrrh+cbTK9bjY+ynucTkZaSjvzlxTGkjU188ku3IIC8w=@lists.linux.dev
X-Gm-Message-State: AOJu0YyPEyXHwNeJtDGHKzG++Kd4muPhS/ltTmvZGro3sSdBpMnO1hEN
	pX3S6yy6qmOCGWErvAoy9nhKfuhVcraktICukTt2mlTh+RCRaNyhFa8pqH5qNvnl
X-Gm-Gg: AZuq6aKG9AqBtYpOGgaURNkBQcFB5vGcAO7kTGJ+6Susa5QtHMRE/q4H+fpbdMBbtV0
	RAz19+EXOBNURIhskr/1eB3g8sgFQqSgAzeO9xPahD4IIpiB8MRVOoa96+PKOdmyTMkp1OkN9e7
	zmP4CE/KY1rpCya86146TQjs938O2VmIuLOm4NQrxCm4EtDsv6ihjFbDV+fQ5/SXSdoZ4HLkFlV
	K0LMwi3fzjdlryKXm168tFoZZvrFD4pNI1UFLGwC7Vi8Sp6t3346GJw6Z/FHFp+NiBdgZG6Gw4w
	elqxau4yA5NLFXeWTASI/sRTGip5o5gc3IVdblM92qe6U0SYqydkM3OekwCJhTSCXxARfY4aesx
	SE4GpPyMy23WfnupOhbW6P2+5nJ1uZh7tMFbx+vY9j4XUdLAT+Rqxk0S9wm4V3ime1qw1kQu+FC
	MT2Yc4KrjwACcJ
X-Received: by 2002:a05:6102:c94:b0:5db:3cda:cc3b with SMTP id ada2fe7eead31-5f1a55a2fddmr4131102137.34.1768890082354;
        Mon, 19 Jan 2026 22:21:22 -0800 (PST)
Received: from [192.168.100.253] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f1a6900c1esm4057944137.3.2026.01.19.22.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:21:22 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Date: Tue, 20 Jan 2026 01:20:45 -0500
Subject: [PATCH v5 5/7] iio: light: vcnl4000: Use IIO cleanup helpers
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260120-lock-impr-v5-5-d4d22347041f@gmail.com>
References: <20260120-lock-impr-v5-0-d4d22347041f@gmail.com>
In-Reply-To: <20260120-lock-impr-v5-0-d4d22347041f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3136; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=3P+X2YeLcPjCXYTP9cibJrgBqh+scSiCbpaQGpGyBmA=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJn5cpcjX77/P+Ht9JK3564ce7SMe8Lsi0pHqwPPnlObq
 T2hfbLQwY5SFgYxLgZZMUWW9oRF3x5F5b31OxB6H2YOKxPIEAYuTgGYSMZJRobuqjUF4rn7DC7P
 CjnyrLTDRX3vzVluW1fdeMXzP5qTUdSVkeFtxctSkflfmh1+PTm1+ExoaSrn3e2fs6fKu3Px555
 Jj2ACAA==
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Use IIO_DEV_ACQUIRE_DIRECT_MODE() helper to automatically release direct
mode.

Reviewed-by: David Lechner <dlechner@baylibre.com>
Reviewed-by: Nuno Sá <nuno.sa@analog.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/iio/light/vcnl4000.c | 49 ++++++++++++++++----------------------------
 1 file changed, 18 insertions(+), 31 deletions(-)

diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
index 4dbb2294a843..a36c23813679 100644
--- a/drivers/iio/light/vcnl4000.c
+++ b/drivers/iio/light/vcnl4000.c
@@ -1078,20 +1078,17 @@ static int vcnl4010_read_raw(struct iio_dev *indio_dev,
 
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
-	case IIO_CHAN_INFO_SCALE:
-		if (!iio_device_claim_direct(indio_dev))
+	case IIO_CHAN_INFO_SCALE: {
+		IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
+		if (IIO_DEV_ACQUIRE_FAILED(claim))
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
+	if (IIO_DEV_ACQUIRE_FAILED(claim))
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
+		if (IIO_DEV_ACQUIRE_FAILED(claim))
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

