Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A5621ABC1
	for <chrome-platform@lists.linux.dev>; Sun, 18 Jan 2026 15:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768751119; cv=none; b=ZGSRM2c5wD6KRPxKKy7dmNdBCKaaR705s3Y6Y4sD+4L4e8goGX5uMB+YePzB1KgIoxJQbWMI0X2xX98J6BoJasSozEp6yTM6g0qPCbqivk83Enj9k1W5XSEzaaTebEQUdanz/2b94eSeVloIcx+yT9m4ghKgWa0cEUKKsS8yF50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768751119; c=relaxed/simple;
	bh=K/GzZXmVDH5d3ajOh9Vses0jzRTbszvo9JEIlad+htc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DrGZH3HbZiZ9k0BjHzkgQiu5MuNLHrmROgp0rQPelIXHHKtPhfoSxRcM3Ik4vwy+jbS1+rlU+v5UltWOQmMrlErnecGwqqmQTgUINQUy0S0R2Wz1ca+xPFAapoDU9Mfa9zM4nbaQBC5EOCjC+mOELE9inIs12yLjUW4UAgP74BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k6jG9f9r; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k6jG9f9r"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-93a9f6efe8bso908762241.0
        for <chrome-platform@lists.linux.dev>; Sun, 18 Jan 2026 07:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768751108; x=1769355908; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SUuEqo1bBPTtYvx/6MqHHwRERlW4p1/ugxXmq/ssirA=;
        b=k6jG9f9rYKUSXu3jIpC4UW0gbyfhR9919/He93i6ERe2LQApPTrB62TJDuTVzsR4H9
         VagpG7ok9YA28G+qAjoEhK4TXksA7D8ahPgTpyPKquFy9FE2AJ5Xj9ouE38oU1ELwlk2
         fTUViCsNDkLyf4+7fJEiQvzFuSfhtx+kIrQipeBY/BoZnOv7ILyY3bOdbH13Dyk5F2vl
         QAIQYZ7GNlIzM7+Mbn3/8XnFZCG04fInxAlJ+KHZb0n3JfTRbJctVO1dvdRKQC6Qmdbn
         ibMbkEy48FtfnF/XOWqMBOBbDUhpxhWeQgw8Xn+7Fpw7A3imBjrzMU3L4+CfaINJZn/c
         Ij7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768751108; x=1769355908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SUuEqo1bBPTtYvx/6MqHHwRERlW4p1/ugxXmq/ssirA=;
        b=DFO586sIXfTktuZeuaRn/RCGWAWondL6IAjvKHMwtRdKN3gVlpkwLAgLzmfpApY7D5
         A0jZjZSKEnOdLNaNa3Tyu+g1n1rUolNDupbq3PjzofYXLW1pcA/mlCXIeHemvNGdKju3
         44YyDevRAetlOvwPQNVXC2zz274regedHO0lBX+nNUIqf384wBWfhVcR4Ru0zggGO3QT
         HakYLRNbDb45uD56dVBd1taKkxfGS/tGPCF5zMef4PonY2pn8aaezym0uqnRrE7BLWtH
         q9JbKpbAT9yKV8xm9gFNBgw08WyLY9us7d/IKzioHDG4avfzrHCu6xpFjdfocjnzuzDB
         zLQw==
X-Forwarded-Encrypted: i=1; AJvYcCUsI7zSDKZfh7qUWu6SGlRsBVf9LGcdeYsbsitDg3zW+iRhu3e5+SL1ukZgBiQgHO6B+dB95ikgJ5kMN36WxzI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5FV/UZgXf3l7N2JQYxYUQsZpKT4dA1OMVJbewmMI1nS3epBXR
	pn761qSAPj+KK2Ug3VJzEfsVyG5RTRsGWudPF9i00J/OGom0SrNVIdEOFo7KG/rC
X-Gm-Gg: AY/fxX6+2wxZFuTaj2JkZmdJVcJxaKNE5PWcHPq+eRACun9zLck+TRXA7zhLN2UVQrw
	cjLWQDcOBhBKEe1CGrE8Sz2BWzuYRa2CM/9MHJRbuzTy4aBBZQbhVNz9UULGkn0z3lYP8C7S7MS
	5+IoF1q87PWSmSU5QfRJNQbQdCkv2/G5PXP9E//pCn+ejeY147o4Z/NjNn9ZOnVoVUK/NWsWa/+
	6v1W7E7RIabT3NCLajaA43K4OqNyaTEXPcY1pqkXPyAMhKuyLuDvVHpaD6Rcmiyb/kSMypIqmMT
	XW/1diTnNHay8qSRILNPasZsNm7oCCmJSf0QjhNdzaqqGtY4LlE6pMCBt1WG+aR0ESu3DhfQYbb
	1iLBhGscDxDDNp5s4EOLoHyPjMGFp2Yk1df67Sm4l5faXkyHTby6oX37t9O5njxV6pOBu1gXXyW
	Szg7IdCbcthNeL
X-Received: by 2002:a05:6102:38c9:b0:5db:d60a:6b24 with SMTP id ada2fe7eead31-5f1a5527da2mr2484137137.22.1768751107999;
        Sun, 18 Jan 2026 07:45:07 -0800 (PST)
Received: from [192.168.100.253] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f1a6d3ca2esm2832731137.10.2026.01.18.07.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 07:45:07 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sun, 18 Jan 2026 10:44:34 -0500
Subject: [PATCH v4 7/7] iio: light: opt4060: Use IIO cleanup helpers
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260118-lock-impr-v4-7-6c8d0aee8ed2@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2688; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=K/GzZXmVDH5d3ajOh9Vses0jzRTbszvo9JEIlad+htc=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJk5/z9efWr+Xjwq72RES8m2CyrWnD3Hl+pwmrgYfxLYr
 ZO1amNlRykLgxgXg6yYIkt7wqJvj6Ly3vodCL0PM4eVCWQIAxenAExEQ4WR4V1Q1p3SkOX1NZxR
 6XZG2W/4HgQtZT74dGqV7PYjx4+9SWP4w8lyUSt/QbZJTPfrdVk19xOLD16O6vD6OcNm6lEdPt0
 HjAA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Use IIO_DEV_GUARD_CURRENT_MODE() cleanup helper to simplify and drop
busy-waiting code in opt4060_set_driver_state().

Reviewed-by: David Lechner <dlechner@baylibre.com>
Reviewed-by: Nuno Sá <nuno.sa@analog.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/iio/light/opt4060.c | 52 +++++++++++++++------------------------------
 1 file changed, 17 insertions(+), 35 deletions(-)

diff --git a/drivers/iio/light/opt4060.c b/drivers/iio/light/opt4060.c
index 8c4a1f562a83..d6e915ab355d 100644
--- a/drivers/iio/light/opt4060.c
+++ b/drivers/iio/light/opt4060.c
@@ -302,41 +302,23 @@ static int opt4060_set_driver_state(struct iio_dev *indio_dev,
 				    bool continuous_irq)
 {
 	struct opt4060_chip *chip = iio_priv(indio_dev);
-	int ret = 0;
-any_mode_retry:
-	if (!iio_device_try_claim_buffer_mode(indio_dev)) {
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
+	IIO_DEV_GUARD_CURRENT_MODE(indio_dev);
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

