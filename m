Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3AB29AAFD
	for <chrome-platform@lists.linux.dev>; Fri, 12 Dec 2025 02:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765507553; cv=none; b=mgkkDRBpe2tdJPTEsct87l6maK+Hr0BQpdQ/vDNi1AOsRdQVnQb3gayLidwSc6MXVQzfkkzbOZpP222RR+iuhrz6uFrsYty8z3BxpTYwJ1Ehorea1Kl9zGHwiIT3Rq6KCVSPvAbf4Vg6kqpm8jCMyoNqwj8Q1aD6jfOJBMEjgV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765507553; c=relaxed/simple;
	bh=ROdGE9UYn9t3GKB795F+w4NovlxCcnGyj52uJR8yT5g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZV9fQ5hxUsZPW3/MHBE1UmbP9byT4sUA2873MNib2U+4lXSW2wGavCvjB7iGQ9zuVkgtZk0TA8NBpGxgZkugJbTSfu0keFIk8dE+XBJO08nx9t6F1z8Rci4Gqe0YiQ4Yob6XenSpLh7ZIq714GKKIiVc+09rmDWVyiZFRjPtM9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AqPw0bok; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AqPw0bok"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-55b1dde0961so494802e0c.2
        for <chrome-platform@lists.linux.dev>; Thu, 11 Dec 2025 18:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765507548; x=1766112348; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iYZRIuaNXC2L9F0wrej4K4cGwCXMfBa56Esw3K/nF6w=;
        b=AqPw0bokbWdUKlzn6r5ntZXHse4JhWaF8VkFU63YoXs6YMvRJfisBQW0ROcbudDtgW
         AGZ4yDIBg7kgtmZJWp8pZeOHHJ+KjC3oanO51g6gMoMrsU2ULBc+5mhR89OFquDbwL/C
         phbDDg7aGU6bwDXn5PATKjkgO5LiMH81yG4js9jlTrGMl8QGoU6/CV53ny5pEJN6Tkwb
         VP1e6PQIYQK/TUDoas6aC3v96sYJPtclLi5+xxNoCIjYharOm8+RPe1JfOlaVxG6/vyw
         AKo3ZEH68HO7N6utxeToNg3vpuAIrWHEhiL8ixlJ0tID9xO5z1vVgqmfQ07Otz/oGchL
         9AkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765507548; x=1766112348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iYZRIuaNXC2L9F0wrej4K4cGwCXMfBa56Esw3K/nF6w=;
        b=iF3F0TTtz3WTNoj1OVNShLwXN3FM9YSH55klUI5Ri79uPl9Sa5woN3NDRtYzwtq8Jr
         s+8nR7zs8iOKQNpGEpR+eHStUaEHoJOAIBSba1aKlDQy3cD23+BLxULslhfkQErMikkx
         HfhbeV6yyhlLdt3uxk4BU/K5mLaXkkuG2zzogs5kxlavozUIOZv6FZcMZhveV9Azvxjr
         9S8OqEhPtCkT0Cwq1KYf7ttECxmKiYCyyPEktxySmijaKxqIr+j3n/hd/qt+v1WNkEk5
         Ed2xeaeLtZFBewRlxcFIz5iXpN8TkAgRS46P5UN4d8qCt7vzb41ACl2Qcg98gGnNl/vp
         hNVA==
X-Forwarded-Encrypted: i=1; AJvYcCUQFRte2wWHS4mMnaxd78deQxMtns+6wnZUsV0urGuiq6qlYT9pIiaNmF8PRBwL1cx0cNaUEtwM9iYhpxP1KZw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1x7BY//xaFL5RuUUT8CKkfFi7HxPzK4ObsMgofk1cDsPG9icx
	l1j7kNrkEFCM7djxyzIIC8nV8YcQRSj3+iwmCSSuWuskp7f2qpTNW+n7
X-Gm-Gg: AY/fxX7U7h7Et/Kj6rQUmDxNUbKSdA203lVM+hRJiwfSz35sww5Zp3r/kLLfgNQlucG
	8imPVTxUTKTgBJjDJjjXHNQae6mfnenyqWP8HJn7pLFRMyA7+manchgOUun2XSo4cQM4qDI0+w9
	cPAewIVJ0jpCOKw6s67AqhpFfOxQiPVoogqVujsVi93+EyTJZ6WyiF20LXuuxRk8pZHnw7n2w5S
	ZcvdWKZ3SgQvVPuq2qwFw1qhuYD8npcpPJePqQqWTWYlsqBRMzNSSEiJlF+bO6IERLE2fMmtnHu
	FHbyY40PIkSrilWMzTUHpDl8f8vCZ3bXEaLm6WJn4hIG9fbRvtVi3Ic9FDa2lpZNRHJYD5UPGa/
	ueOL7h6P0IdFdvszeRTHwyEfLaeAC9VL684T68CNSrqrwwwxz3E6RwQo11lAYOxr0QdZogzvRNt
	oY3A2dlMtfB3bz7g8EXJAA10g=
X-Google-Smtp-Source: AGHT+IH5i7dtBfVcr5pIDPh38IKpcxO7iBsFvqjyiDMjJP75f9PBiuTE5pSrUZG3ggjTiJvDMCDRxw==
X-Received: by 2002:a05:6102:54a2:b0:5dd:c568:d30d with SMTP id ada2fe7eead31-5e82783585dmr129533137.30.1765507548500;
        Thu, 11 Dec 2025 18:45:48 -0800 (PST)
Received: from [192.168.100.70] ([2800:bf0:82:3d2:875c:6c76:e06b:3095])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e7d0f25ce2sm1693762137.8.2025.12.11.18.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 18:45:48 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Date: Thu, 11 Dec 2025 21:45:25 -0500
Subject: [PATCH v2 7/7] iio: light: opt4060: Use IIO cleanup helpers
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-lock-impr-v2-7-6fb47bdaaf24@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2580; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=ROdGE9UYn9t3GKB795F+w4NovlxCcnGyj52uJR8yT5g=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJnWjSeZoj/PfmBy4cD3SRt/BpS75GZkG51a/1Wv7M4Rx
 w1behXWdJSyMIhxMciKKbK0Jyz69igq763fgdD7MHNYmUCGMHBxCsBEXrYyMrSsPeb+OkilQE3R
 dts/rp81J080b85Kv6J0cPaRT25H7jYxMiysck6yNzwq+1b2Vs9Snvy5DCqSH+etDbdJ+12cmu8
 wiwMA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Use IIO_DEV_GUARD_ANY_MODE() cleanup helper to simplify and drop
busy-waiting code in opt4060_set_driver_state().

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/iio/light/opt4060.c | 52 +++++++++++++++------------------------------
 1 file changed, 17 insertions(+), 35 deletions(-)

diff --git a/drivers/iio/light/opt4060.c b/drivers/iio/light/opt4060.c
index 8cb3fa38077e..943e5963d568 100644
--- a/drivers/iio/light/opt4060.c
+++ b/drivers/iio/light/opt4060.c
@@ -302,41 +302,23 @@ static int opt4060_set_driver_state(struct iio_dev *indio_dev,
 				    bool continuous_irq)
 {
 	struct opt4060_chip *chip = iio_priv(indio_dev);
-	int ret = 0;
-any_mode_retry:
-	if (!iio_device_claim_buffer_mode(indio_dev)) {
-		/*
-		 * This one is a *bit* hacky. If we cannot claim buffer mode,
-		 * then try direct mode so that we make sure things cannot
-		 * concurrently change. And we just keep trying until we get one
-		 * of the modes...
-		 */
-		if (!iio_device_claim_direct(indio_dev))
-			goto any_mode_retry;
-		/*
-		 * This path means that we managed to claim direct mode. In
-		 * this case the buffer isn't enabled and it's okay to leave
-		 * continuous mode for sampling and/or irq.
-		 */
-		ret = opt4060_set_state_common(chip, continuous_sampling,
-					       continuous_irq);
-		iio_device_release_direct(indio_dev);
-		return ret;
-	} else {
-		/*
-		 * This path means that we managed to claim buffer mode. In
-		 * this case the buffer is enabled and irq and sampling must go
-		 * to or remain continuous, but only if the trigger is from this
-		 * device.
-		 */
-		if (!iio_trigger_validate_own_device(indio_dev->trig, indio_dev))
-			ret = opt4060_set_state_common(chip, true, true);
-		else
-			ret = opt4060_set_state_common(chip, continuous_sampling,
-						       continuous_irq);
-		iio_device_release_buffer_mode(indio_dev);
-	}
-	return ret;
+
+	IIO_DEV_GUARD_ANY_MODE(indio_dev);
+
+	/*
+	 * If we manage to claim buffer mode and we are using our own trigger,
+	 * IRQ and sampling must go to or remain continuous.
+	 */
+	if (iio_buffer_enabled(indio_dev) &&
+	    iio_trigger_validate_own_device(indio_dev->trig, indio_dev))
+		return opt4060_set_state_common(chip, true, true);
+
+	/*
+	 * This path means that we managed to claim direct mode. In this case
+	 * the buffer isn't enabled and it's okay to leave continuous mode for
+	 * sampling and/or irq.
+	 */
+	return opt4060_set_state_common(chip, continuous_sampling, continuous_irq);
 }
 
 /*

-- 
2.52.0

