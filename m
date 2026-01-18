Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9618923EAA5
	for <chrome-platform@lists.linux.dev>; Sun, 18 Jan 2026 15:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768751106; cv=none; b=dgL5RcylNk+D0eEq6YO2g5JOL5CbQB1EMUkysSbey2WN4UuO/aQ6+895hJEoaTwqkJ4wSncp1TGlm8JhMdx4Cv2k015fP8/JLAlRTrMF0r1OI1Ezqy9dDvvL7+tocPrtiirjK4aCe5ySihz+k7bnah58hsYfNgmT0kgQy4U2rZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768751106; c=relaxed/simple;
	bh=3P+X2YeLcPjCXYTP9cibJrgBqh+scSiCbpaQGpGyBmA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RfYTiQK8FElAm71D+ZA2DSRAleV+XA1LzTqAKtp3qaxzvWb61lXRLSztUNXCZUVa4WhmW9guiol/l3qCsTtHZmk9t8vJFn5mdT9fGwFQZi2KYm4MZZ5iWI9NMJnBlBCzr2GMDDY0jiZwUaQbyQ4tdbKHp4UkC2ZYGpcod00Fip0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSM3LBY5; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSM3LBY5"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5efa4229bd2so2409291137.0
        for <chrome-platform@lists.linux.dev>; Sun, 18 Jan 2026 07:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768751103; x=1769355903; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XTnTVRGv/a3yeACWeWEj6KZeE3Y99K4b2EX+Zi7IhJ8=;
        b=DSM3LBY5x/6TIch/1F3pFLHUTTBRNIqcB5wRlLif2OwYD7xxNzHgUMmtgQhqCYHX91
         UOBN83dDwgYYmM/04kJIi2Er5wGcd0RDKLrqnC2QhW5tqc6EEYgtmBgWjA8BuvkgxOtD
         T+3J8YSCjIsOZB2y34SVU062q0H+Z3dbgUIcr5doArxZXiE33E8WxVx4FtwmBcavLUbM
         D6RjOk1k5BQa7Ma0Lbml/oLYfeQW+ZM8ZyN4YjMxHvxRGymSH1Z2hkRox6wbtGL/ziLI
         i7tR88x2htpqChR/TBFeEXsAD1BkUkjLeOcIfFWckG+aggW8rWqJLa3tUkdKqUVoKbfW
         8hyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768751103; x=1769355903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XTnTVRGv/a3yeACWeWEj6KZeE3Y99K4b2EX+Zi7IhJ8=;
        b=v8TOJo//Zi1safsogkuR2O38ByLEOmdr4lW4q4hdeF3aPhQMO3Vz2fMGrRYxz51fDZ
         m0FcXZt9Wf6s5We4uTl4Tzb0SUuAYTxf2j+BAk6pRDhcpxF7X0thzOGjB0VZurlWUWF8
         6Lxb17UV9n1G43RqEdbTbgW53GAyr4UqoIfXLzwsACPlp3jhC93SkK72tHRVATY2jhkW
         NVJnwJ+nzPzxuf3WRZoJUjNsoYzH6rLixS/w2Ls70b60nzsJXa+Hy2lAvXl2jVPdRNz1
         2AB0JBifN1jtvtx/CiyihGSK+RHRfx/BPvqhKHctaEUvMSLHGrcfMYCmC9Bec2+0uXpo
         zIWg==
X-Forwarded-Encrypted: i=1; AJvYcCVsk+8SrAHrdOIijzovR7T7oUS/G3EEcKyUabWm6zlVyXDNN3pLhiOROZNmQhhZNL1WuhrXrbhJtRy/E75sPSc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6hsSicOD5uCuEylfFfBWshU+LcImEiD7uDpROMyPhxjoKQAgK
	ugoRXUVGBK2g6/beEP8exk6JZHsJxTNsbo6nExU9QCs2Ax7gxOoxQCM1+i0lmO4k
X-Gm-Gg: AY/fxX4EgERKp/5CX/VlOJSm/QlqAFCHl+ARjglW9WqcYbDfd4lWtZ1Ved3TcsXKTZ5
	bZS5lm5uuC2iR11Z/re3zJ/pwpVxffL1E9/TWkc+nb4HDUvlPjPlyzvkofCnlVwL9+t6m/KM48K
	tzgDr1sMVPObwibXBQCfHq5B42d4dqGklHNZ1E3DWlKHNH276vRvyZiJHP0a/l6iBqWcrZAmVVt
	V9rEF/w7kAwEl1aHoV59NuWgJxBJHpvBrGeHLHg+gOcXiKoxUbhaXqzHcQ9T8BQGK7n9+ZuX+RV
	VEUwbYnR6JU2/caC8r7v60HreRIrRyloD9LfY757wQQvsiAXGJq0XnCiA+I+5pRiFAT6cJsskXf
	/rOAEEZByUu7/rqU0oAOONoCHm4JSL6xAs41DvOpaGN1dXnspuN4vQcae6gaXODeMKq5ViC+Tdn
	D/KrC5iWS+Odoy
X-Received: by 2002:a05:6102:a48:b0:5db:cfb2:e610 with SMTP id ada2fe7eead31-5f1a55dce21mr3189064137.41.1768751103410;
        Sun, 18 Jan 2026 07:45:03 -0800 (PST)
Received: from [192.168.100.253] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f1a6d3ca2esm2832731137.10.2026.01.18.07.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 07:45:03 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sun, 18 Jan 2026 10:44:32 -0500
Subject: [PATCH v4 5/7] iio: light: vcnl4000: Use IIO cleanup helpers
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260118-lock-impr-v4-5-6c8d0aee8ed2@gmail.com>
References: <20260118-lock-impr-v4-0-6c8d0aee8ed2@gmail.com>
In-Reply-To: <20260118-lock-impr-v4-0-6c8d0aee8ed2@gmail.com>
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
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJk5/z8+iJ4RHnlk3snQuump56fLnmzP+yR1+31BpOonj
 oP5N49ZdZSyMIhxMciKKbK0Jyz69igq763fgdD7MHNYmUCGMHBxCsBENsow/I+9cd2l0P+rrurq
 RW/ydxrGWMhMORSpfOQDu0CYocvuLQcY/opzLnlwkuPZZJakczuqJ/W/OmoQ9l1TeGnI5QPW4gn
 fH7ABAA==
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

