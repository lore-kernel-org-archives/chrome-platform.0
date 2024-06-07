Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0368D15B145
	for <chrome-platform@lists.linux.dev>; Fri,  7 Jun 2024 08:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717749892; cv=none; b=iS6nPE+SA5Z4pzpaod1VOwl/02emhthf6p/SAnGaY92s/eXGJGWXOvxGjl4xUQfWylaFYPA9Ym2CsYgn8HGoxi3MM2NvowGJGRhl8GyUOZ1BxhvSk4vl7Ak4z3tEcup5cXqybbmmuqOJtFaDcQvZ9lxK+JorVwX72x65Vs2m4xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717749892; c=relaxed/simple;
	bh=14XoLLXGkugteQS++IsQ79UO0X3PLB2TkFVDwv7Adjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lJVV0HfFvMBLj58ZMwCYwu1DD2F9Ix7d6+WAx3AHfx6qAW2OuomDLEzbqpjiUEkPQlMPN0Idjr+7SjLzxrqq+U81yR0UGRAReVIRj9DJyeOmY2/yLJWAGOuLiozvI87p5mURlilbHpzeax8nwPrcEwRzOfpLcM/5lMKOmpmR01o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=IZiyeRvU; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="IZiyeRvU"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4214aa43a66so18851525e9.1
        for <chrome-platform@lists.linux.dev>; Fri, 07 Jun 2024 01:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717749889; x=1718354689; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7q7foaTfDqbpSuC9Ibq8n6gkjkleMa3J/+6fe0Py97k=;
        b=IZiyeRvUNv5Zi/XtmqR74DntoLtZcE/EWr/BUNizcQC4eLR40M8Ym7qQzkey3qo29i
         YCYS4fpOaaaEEMMjQzX+1DIyI/Lm3GhM5VLaJXPPCcl3Clv3kiC/xmjTVU9hm7Huph+e
         z7tzmb7vXXCEZbOSD3M3eUONRuC5PTQkvgeBUGvL6cMRb4DNH7MqwyqD8hnxWcoX4die
         3qhgpkCXB9HGaqcsJg3ocFmKOD0QbbpooPH2l8EAktg8d4AYSlBvGsGY1TNCwhl0dhxp
         623dCXz7WBU8WeA3xkpGX4fjNgtXcKZsAxIYKEGzKAEKv5PKufYGH8r8sHcvi/tgaFgo
         Dz+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717749889; x=1718354689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7q7foaTfDqbpSuC9Ibq8n6gkjkleMa3J/+6fe0Py97k=;
        b=DGNjQBqIn/VrroJzwNIIZVoilL645HflW2Bn6TR+9iBEbh7aagLz58ItjOc4UdSRqI
         qaUxebChi4jE5A/d/BM4hAIXzutT2suhe0LVEK55HtIzpHYOcQMIEIAmNkusGC2cJuYa
         JxbCl49Vf7m9ZS8wAJOfziADh0w88SevhMu2U6MFypXam76SITR7ThQTULeUxKcrqOPX
         oSybf1FeZpwNvgPbLAbNbFO45msgB+y3QmkmHWO+WrV8gAbqn0Yt6fWK1M7IBdqBMh7S
         m3/+wKnYixqrWucXyIiDgqnO8RFHG6SdRZIAIcAD1J3PYrxO+cPer0i2lkw89UKO5YZa
         02Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUWxVguGyFuQiYtPD7gLCoQe8OxDHzb6wwDSbSLPHnXhL+KkeEaqVZ9iiPcqKJHx8iERGyAsYT6xzRtlKyvc9Ooxye+gnywvHgHPKhrHPR5
X-Gm-Message-State: AOJu0YzxoecFCTqHW6nY/ovEsW2qheS+lhl0RTLFd7t3q9CnatVRVf1Y
	I6UESEZoxcnKWE+Ip/9Frtm3gxtVAzrO7o4TJfELe6CZ2eUeh+hf5itZKjeKynCTJj6R0PpRZlU
	unMU=
X-Google-Smtp-Source: AGHT+IEe9+phwxQEu9tnnrIDg4Ni5d7woZbFCLHmXdNQycBCcnpUZYZxG6+gFl3WGlfM7NT25DpIMw==
X-Received: by 2002:a05:600c:3aca:b0:41b:f788:8ca6 with SMTP id 5b1f17b1804b1-421649ea031mr16250575e9.8.1717749889331;
        Fri, 07 Jun 2024 01:44:49 -0700 (PDT)
Received: from localhost (p509153eb.dip0.t-ipconnect.de. [80.145.83.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42158f30b6fsm74942805e9.10.2024.06.07.01.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 01:44:48 -0700 (PDT)
From: "=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <ukleinek@baylibre.com>
X-Google-Original-From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>,
	linux-pwm@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] pwm: cros-ec: Simplify device tree xlation
Date: Fri,  7 Jun 2024 10:44:16 +0200
Message-ID: <20240607084416.897777-7-u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2725; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=14XoLLXGkugteQS++IsQ79UO0X3PLB2TkFVDwv7Adjs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmYshp7ZopTDwjLkhREFWcoeKD2bW+iMngzrmDw 7XS7XCoSPyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZmLIaQAKCRCPgPtYfRL+ TrqVCACZrlNisihbk7HuvKGftuT5C8DHUxuMDxsWqdZ37JAzsXeI4P21QvllL2Zu1Rs2hkrGhCs QFvS6CnGHJkmyCV9sqjx+6TXtSBR4jurcDqtRxfspMVNdrQK8PRgy0scPY/W8nsDLDamXpOjgeJ DT1x7ZVAl0Mux5twaab9SrRPt3F8lxSg6Reb9twrcRTs53C7nEA7W4rvN6VpRzL/OWttBdcxOfc RS9nHVSagx8nOB8PR0Ex+t9KyKCZ/gJ7EmVFxomvzbFQApkv6gV7C2o1YZ9jW8ih64/r4Xyyo15 q8VeUfZnwM1y4mE8l8mIcT1kGNtafUpXLfXrMq8Ve7HJsUuF
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The cros-ec device tree binding only uses #pwm-cells = <1>, and so there
is no period provided in the device tree. Up to now this was handled by
hardcoding the period to the only supported value in the custom xlate
callback. Apart from that, the default xlate callback (i.e.
of_pwm_xlate_with_flags()) handles this just fine (and better, e.g. by
checking args->args_count >= 1 before accessing args->args[0]).

To simplify make use of of_pwm_xlate_with_flags(), drop the custom
callback and provide the default period in .probe() already.

Apart from simplifying the driver this also drops the last non-core user
of pwm_request_from_chip() and so makes further simplifications
possible.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-cros-ec.c | 32 ++++++++++++--------------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/drivers/pwm/pwm-cros-ec.c b/drivers/pwm/pwm-cros-ec.c
index ba4ee0b507b7..fcc33a2cb878 100644
--- a/drivers/pwm/pwm-cros-ec.c
+++ b/drivers/pwm/pwm-cros-ec.c
@@ -169,24 +169,6 @@ static int cros_ec_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	return 0;
 }
 
-static struct pwm_device *
-cros_ec_pwm_xlate(struct pwm_chip *chip, const struct of_phandle_args *args)
-{
-	struct pwm_device *pwm;
-
-	if (args->args[0] >= chip->npwm)
-		return ERR_PTR(-EINVAL);
-
-	pwm = pwm_request_from_chip(chip, args->args[0], NULL);
-	if (IS_ERR(pwm))
-		return pwm;
-
-	/* The EC won't let us change the period */
-	pwm->args.period = EC_PWM_MAX_DUTY;
-
-	return pwm;
-}
-
 static const struct pwm_ops cros_ec_pwm_ops = {
 	.get_state	= cros_ec_pwm_get_state,
 	.apply		= cros_ec_pwm_apply,
@@ -237,7 +219,7 @@ static int cros_ec_pwm_probe(struct platform_device *pdev)
 	struct cros_ec_pwm_device *ec_pwm;
 	struct pwm_chip *chip;
 	bool use_pwm_type = false;
-	unsigned int npwm;
+	unsigned int i, npwm;
 	int ret;
 
 	if (!ec)
@@ -263,7 +245,17 @@ static int cros_ec_pwm_probe(struct platform_device *pdev)
 
 	/* PWM chip */
 	chip->ops = &cros_ec_pwm_ops;
-	chip->of_xlate = cros_ec_pwm_xlate;
+
+	/*
+	 * The device tree binding for this device is special as it only uses a
+	 * single cell (for the hwid) and so doesn't provide a default period.
+	 * This isn't a big problem though as the hardware only supports a
+	 * single period length, it's just a bit ugly to make this fit into the
+	 * pwm core abstractions. So initialize the period here, as
+	 * of_pwm_xlate_with_flags() won't do that for us.
+	 */
+	for (i = 0; i < npwm; ++i)
+		chip->pwms[i].args.period = EC_PWM_MAX_DUTY;
 
 	dev_dbg(dev, "Probed %u PWMs\n", chip->npwm);
 
-- 
2.43.0

