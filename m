Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7057915B137
	for <chrome-platform@lists.linux.dev>; Fri,  7 Jun 2024 08:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717749891; cv=none; b=HBSlLiGhi1nY1l+ZQ9cF7pogsN0PJ7/phVycl5JruSK69iJKFPzAAe9TUtS06oaKux78o80hCHj/HsuenOVsV7QWeLRhj+CdqYymlEYzE66cIG9rtJkQdzERyz0k7qpqbypMcPU8Imi4vev+pg8QuzQ3nxw0OH7KgG6fFzMldTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717749891; c=relaxed/simple;
	bh=wudYmHy3qCSrWLSreH+1TgxgneyUtA3ewiC9lXDQSKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R1ksBUSPj9Wq1lCxaly4j0HAEQfaKPEkbIP1I+z9VrkWjlfS9SXadH4Ky9Ssp4Ft77IWLeJ3V0E3bN1P814QFrB4TfN919cg8WRklOaqL8hCbnbsqwvcvw8J2dSzL1O6jhriSdRkqfXyumKLMNXzBW6M75rM0OUn4ssE9zEQ02g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=e9WLHSVi; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="e9WLHSVi"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42121d27861so18125785e9.0
        for <chrome-platform@lists.linux.dev>; Fri, 07 Jun 2024 01:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717749888; x=1718354688; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FGL8cAEQ0O2enVmYyGVM2Jx+NaXP9rfnR5x0k/WELA=;
        b=e9WLHSViow6Ei38KCV4J0wmTDMwz6ylnnFcFmn4S3Ce9b04BiwefnwXnHRs0DPiyjD
         xgzN8OcWDU6IC8N8WJIUdnwfk/aMEA9SgMZACwf8XPIcsY21ZLwhax/FnNqthfipaGbG
         sm594hP8fksV8ZLIZd+GAOEy88+LYzOxOx71BdHy/Kty7R/uu7/grNOSdKbTcV0eSj/T
         J52yd2zkrSKAqCR1jwwQRN7RSwAl1e8eCB57DjLwi9IS6/EtRMb46a3bLviG0MvOgVJY
         2cHYg1/5wFsoRX7dTX36S++nnvvpuc+V3FTg3QR9C0ZL8MahghmGKwMserF9zDvIxNav
         vWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717749888; x=1718354688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5FGL8cAEQ0O2enVmYyGVM2Jx+NaXP9rfnR5x0k/WELA=;
        b=Ip6sBEjsuDmIcsaPzxbdP+nsgV5iuPNGYT4ZXIEVjYfS/Ax8CGtx5XzBDi9Om4QV+i
         VRQCpx00Rc3fRxZC6Nj3pJW7m9QNj2150T6xsIzePnSG1Xwn8kgbGHUY4JQSypOHaNVb
         aoXu+fk7E4SroiQv9ifJxYOjqeSqgB1+ebqppn4wlnwqFHk/SjZqBCNb8MvuDUqqlK6z
         1Jhft7lMBKUEWW4g15bDqgGpx72LUrsOkPbCd6zM/k2Y5wuYETKJZNwzJwTQDr/wNQH4
         ybUr3oPqjhgXmfHL/F5mPlSQmmLH6YVYGotRbb+IadikKF9cfHTm+LoFu9e9TQFU4m1V
         v2BQ==
X-Forwarded-Encrypted: i=1; AJvYcCWY0jcBc4UPf34zep0Xc0IwwS9a10XBTAZy8U/sjUVQmCBnWjQjjV7fMNBogCYhndi4+NKktiwYAi5tE2JD8JAaV31maLcbgIRJshdDWO05
X-Gm-Message-State: AOJu0Yxe6s/isUnBF6aZO5Ag5m0Of1oObbLlZieoeYhX2i++I5N7k/ct
	wl0m/X7GWBP4/vytIO3Nlm/FeP7/dlpdEPyMB1AlyNhwR2SJy+zKHvR29Cdw6lA=
X-Google-Smtp-Source: AGHT+IH/9XI6ce6wjpuBpjMC8y/GtYJRiFfAam5jHMBp7OViFavLuETNBz3U8/PfPmbAek4vxlG7yA==
X-Received: by 2002:a05:600c:450e:b0:418:5ed2:5aa6 with SMTP id 5b1f17b1804b1-42164a3b0f0mr19195415e9.31.1717749887864;
        Fri, 07 Jun 2024 01:44:47 -0700 (PDT)
Received: from localhost (p509153eb.dip0.t-ipconnect.de. [80.145.83.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215814e7bfsm80098415e9.40.2024.06.07.01.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 01:44:47 -0700 (PDT)
From: "=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <ukleinek@baylibre.com>
X-Google-Original-From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>,
	linux-pwm@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] pwm: cros-ec: Don't care about consumers in .get_state()
Date: Fri,  7 Jun 2024 10:44:15 +0200
Message-ID: <20240607084416.897777-6-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240607084416.897777-5-u.kleine-koenig@baylibre.com>
References: <20240607084416.897777-5-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3061; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=wudYmHy3qCSrWLSreH+1TgxgneyUtA3ewiC9lXDQSKs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmYshl2TygktlmNS6vtWgQA7+2Bnh2F7OPpd1Z2 OFVxplP1LiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZmLIZQAKCRCPgPtYfRL+ TjbTCACR1DiLfufuRbJltZvAy1vOOWnfILZW6Txf383BpkW755Jry1cQfC4l0KE2mqgXI9FRLmk +YL7nbP+5arxci4Hq8p1PEv1B5C9BUP7z1Xq1mk0ZlpLbBm+jGk2D9gZR71WquJp1KJfonHDd0l mGksY7Bl6kwFNrhtqRdy+JuNMQLpb7yHspr+Afm08DNYqlL8ncrTPkN+X8yiuOs9z7ZsMbt8P+1 HoHxCaKPXTW1XBXckJzT6Bpt/FaiyedOk8g/cWakA2TSctd540/d3pfiQZj6X+vspclmmkde34s z/77KO/ajGmZUu9utoA/V8bGYdIurzFPY5AUGuuRXUVu4fNB
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The get_state() callback is never called (in a visible way) after there
is a consumer for a pwm device. The core handles loosing the information
about duty_cycle just fine.

Simplify the driver accordingly.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-cros-ec.c | 33 +--------------------------------
 1 file changed, 1 insertion(+), 32 deletions(-)

diff --git a/drivers/pwm/pwm-cros-ec.c b/drivers/pwm/pwm-cros-ec.c
index 606ccfdaf4cc..ba4ee0b507b7 100644
--- a/drivers/pwm/pwm-cros-ec.c
+++ b/drivers/pwm/pwm-cros-ec.c
@@ -25,15 +25,6 @@
 struct cros_ec_pwm_device {
 	struct cros_ec_device *ec;
 	bool use_pwm_type;
-	struct cros_ec_pwm *channel;
-};
-
-/**
- * struct cros_ec_pwm - per-PWM driver data
- * @duty_cycle: cached duty cycle
- */
-struct cros_ec_pwm {
-	u16 duty_cycle;
 };
 
 static inline struct cros_ec_pwm_device *pwm_to_cros_ec_pwm(struct pwm_chip *chip)
@@ -135,7 +126,6 @@ static int cros_ec_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 			     const struct pwm_state *state)
 {
 	struct cros_ec_pwm_device *ec_pwm = pwm_to_cros_ec_pwm(chip);
-	struct cros_ec_pwm *channel = &ec_pwm->channel[pwm->hwpwm];
 	u16 duty_cycle;
 	int ret;
 
@@ -156,8 +146,6 @@ static int cros_ec_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	if (ret < 0)
 		return ret;
 
-	channel->duty_cycle = state->duty_cycle;
-
 	return 0;
 }
 
@@ -165,7 +153,6 @@ static int cros_ec_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 				 struct pwm_state *state)
 {
 	struct cros_ec_pwm_device *ec_pwm = pwm_to_cros_ec_pwm(chip);
-	struct cros_ec_pwm *channel = &ec_pwm->channel[pwm->hwpwm];
 	int ret;
 
 	ret = cros_ec_pwm_get_duty(ec_pwm->ec, ec_pwm->use_pwm_type, pwm->hwpwm);
@@ -175,23 +162,10 @@ static int cros_ec_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	}
 
 	state->enabled = (ret > 0);
+	state->duty_cycle = ret;
 	state->period = EC_PWM_MAX_DUTY;
 	state->polarity = PWM_POLARITY_NORMAL;
 
-	/*
-	 * Note that "disabled" and "duty cycle == 0" are treated the same. If
-	 * the cached duty cycle is not zero, used the cached duty cycle. This
-	 * ensures that the configured duty cycle is kept across a disable and
-	 * enable operation and avoids potentially confusing consumers.
-	 *
-	 * For the case of the initial hardware readout, channel->duty_cycle
-	 * will be 0 and the actual duty cycle read from the EC is used.
-	 */
-	if (ret == 0 && channel->duty_cycle > 0)
-		state->duty_cycle = channel->duty_cycle;
-	else
-		state->duty_cycle = ret;
-
 	return 0;
 }
 
@@ -291,11 +265,6 @@ static int cros_ec_pwm_probe(struct platform_device *pdev)
 	chip->ops = &cros_ec_pwm_ops;
 	chip->of_xlate = cros_ec_pwm_xlate;
 
-	ec_pwm->channel = devm_kcalloc(dev, chip->npwm, sizeof(*ec_pwm->channel),
-					GFP_KERNEL);
-	if (!ec_pwm->channel)
-		return -ENOMEM;
-
 	dev_dbg(dev, "Probed %u PWMs\n", chip->npwm);
 
 	ret = devm_pwmchip_add(dev, chip);
-- 
2.43.0

