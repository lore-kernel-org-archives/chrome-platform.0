Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A141625B087
	for <chrome-platform@lists.linux.dev>; Mon, 25 May 2026 01:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779673194; cv=none; b=chL0JWP1iDa5ICZKoLhVvYSfDYHpHitCK1Pcx20EmG/PDddU6iBti0ZJ4/3c4OuGM49SQqpCE4aIfvPMtdqaNamp/GP8dhhGBonNPHDvDaHmAfxnlB/VD2Br4JclumPWQhUjApNMG5I4kl7Ffblav46u4Xj/gCyjesOUJJGdDsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779673194; c=relaxed/simple;
	bh=au3KpLqYbepgVrQAt2RX8cSSLgzx8HL8SFAfmcOoutc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DqxnElcGerKM3P7FdJG04kR7nLuu6IyuanXn+3A4vK6Liapi/K0S7981jVFjApE7O83ia4gXcfNis7HMU+4REKsmxI6wvbyAutiilGQJuurd+LojFsS/X9ifUA8fyR6D9fjMi5zObzfCnTVc9eddTCF6CB8lqJd3waJuPUJSyaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=X57Xb6MU; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="X57Xb6MU"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7e61da76fd9so1073278a34.0
        for <chrome-platform@lists.linux.dev>; Sun, 24 May 2026 18:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779673189; x=1780277989; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OMUE3/7kINiPQNa3IbX9MLqOrJoUgIbbeots1aiBMpQ=;
        b=X57Xb6MUrm7kVw6oYp+f3Gq44Hc8m9jcC13ZGJG55TUOka45iQ4q2lTj2iRvL5qBOE
         7nbKUTQXBs1DCvvx2ff9vV+yTOZ6G8lofWkeBB7eKuVJ8zlPQw4bGV7qRuXN1lEcWc0z
         v9jIjw1GEXbudHGZS9zxoIv7gb+FWOzWrnFqWTEyzCSWXkFQ/1T8+n++wcTdc+5ZJMKS
         kFhUsAFAR0cUDwoxZQInnmzMcCfoQ51wkDBvz9lOv1XGtflQ4877OfPeg/bH2Cpr9C7l
         D+m9XNejOgcK2q635UR7w8sOomdndpaede+KF8esJNo9M5YDhgXlKWN9ouOb0atxlR0F
         G6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779673189; x=1780277989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OMUE3/7kINiPQNa3IbX9MLqOrJoUgIbbeots1aiBMpQ=;
        b=kHl+C4iOby+irGtPpLZF2BSkJ4FVONMpUeLRFs7NhFix372rye+tLKOLdyBDWevAdG
         1O90IHlSHaIMAgdrUTKdEV+e1naCUvU61TWsxiIK4SanvTENUtVkLvfrp+cHxsNmK9WV
         mn/kmSYSudJ7Pp1c9lPUvs/fFJQVB5PTGHprYq+oTE1EeYOcn1jCHkTNoLq1r49ODnzp
         Jt0gSacJ0K3NM3IADjrnVciHb3su7YOD5wBtD2HIRO+acKvPGgDcs3OqZjFD/KJzR4uT
         h2sbnVagd87ev12/abUWEtw3CgQsbVGVx6r1X9xJ0KCPQAtxGz03kJF9Oe6ppHSVVRsX
         HCcw==
X-Forwarded-Encrypted: i=1; AFNElJ/tded/qCkCNgVf0QqxlgXAC7NeCWw9Ke0kN7Y2weFjciyHmpSHMJ31uoTEiMz3ayESQq0PnXXFjxtk+jVROlY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyMnnmg87uMLn8vsYN4oiyAKPmsAYmjAK/wfoApZDxJELRy+O8d
	toGQPMbBur0MBiHkAFDKM05CEXXyujeQh9X1LiqD5lwcPXZ6DD5ClCrF+HxrCHTvTNI=
X-Gm-Gg: Acq92OFglXBb7siwSu6tmEFtvj8BQWiD/ea6zIm5kVcAyVqVNOiJdbWo7Io6KtgmL1/
	PrGpboe+IPeGsGXvHw7f8p/b0EbDcjpms4W98QQ9wkfY3wuZVy5s0bCwIgmprbiIjXQY6qZoyp9
	lNHE8WJ+6ZBa0IsfbZOMmdwuGzXRDX3vxyU3S96DiC2shLrRSTei1jkJjhk7dM3v2/Y4DK1ZpjO
	w3TdnbY66lqGkK6HjxtKkapDvBrYCj9VnByJhpM6rZfAsiRwbTyQKrjIfvb8W08LlgBKcxdXuXl
	erTREkQ7kU6otrgDlLoHcJVMuouXefs6fSpQN10PYHjQo0Zt1vGXFyTUUS+rLtXuxsTA6Oh4oMK
	FYMBTqWT46Ztsul8mWh8rmHgUH4gtuASzEUrRidPvAS9f50npvDeK5E2JLnAlx/UvpRicAHzYFl
	tz9QKJBZAl8VYFeSsVNHjM5Dj+Ztn2DwIZcpS3M8HA8Q9d2RAV1Q==
X-Received: by 2002:a05:6830:438e:b0:7dc:db3c:1d63 with SMTP id 46e09a7af769-7e5fef8778bmr7211293a34.24.1779673189590;
        Sun, 24 May 2026 18:39:49 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:713b:3006:84c3:c1bb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6060b2dffsm6250206a34.0.2026.05.24.18.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 18:39:49 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 24 May 2026 20:38:35 -0500
Subject: [PATCH v2 3/9] iio: adc: dln2-adc: simplify timestamp channel
 definition
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-iio-timestamp-cleanup-v2-3-c37c9408b7f7@baylibre.com>
References: <20260524-iio-timestamp-cleanup-v2-0-c37c9408b7f7@baylibre.com>
In-Reply-To: <20260524-iio-timestamp-cleanup-v2-0-c37c9408b7f7@baylibre.com>
To: Jyoti Bhayana <jbhayana@google.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1457; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=au3KpLqYbepgVrQAt2RX8cSSLgzx8HL8SFAfmcOoutc=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqE6gxGpINpNsbfXFkHrF+BjDlueBxKNBZdolVS
 wzGu4LBeumJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCahOoMQAKCRDCzCAB/wGP
 wLvKCACg/4GawBxVUGhqi1U/lCBImoTuAHgKA58qiBGlLscoWThFgoEqehSdU1vluTATvJPVJ/K
 NVMe+3HlBGTZh6GZAkNWuxDKm9UU3/i7rMdPqRprTryF7XmJRy7erIWRS18FKuuH28SSwe5PqTH
 pI1+U6/YZwgRhnxI0QItWzNlicfPd++Q4bY0+NYUpeiUw6X1UI5+4c5Nk1+nOen0W9Dp02eJN86
 1ZFb3HpwxHPCUDld5p/mxWNeOgNQ2WqmCRdbUW1LsUBwRtXoVdrvXl7Dp3gGzlrDoEZpQXG+06a
 Mj8/bPi9uEawWuM+whYNIKUpoNvmPLjYStWdmvzai+z5laQk
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
manually filling in the struct iio_chan_spec fields. This makes the code
less verbose and mistake-prone.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/dln2-adc.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/iio/adc/dln2-adc.c b/drivers/iio/adc/dln2-adc.c
index eb902a946efe..b01c6f5a73b1 100644
--- a/drivers/iio/adc/dln2-adc.c
+++ b/drivers/iio/adc/dln2-adc.c
@@ -444,16 +444,6 @@ static int dln2_update_scan_mode(struct iio_dev *indio_dev,
 	lval.scan_type.endianness = IIO_LE;				\
 }
 
-/* Assignment version of IIO_CHAN_SOFT_TIMESTAMP */
-#define IIO_CHAN_SOFT_TIMESTAMP_ASSIGN(lval, _si) {	\
-	lval.type = IIO_TIMESTAMP;			\
-	lval.channel = -1;				\
-	lval.scan_index = _si;				\
-	lval.scan_type.sign = 's';			\
-	lval.scan_type.realbits = 64;			\
-	lval.scan_type.storagebits = 64;		\
-}
-
 static const struct iio_info dln2_adc_info = {
 	.read_raw = dln2_adc_read_raw,
 	.write_raw = dln2_adc_write_raw,
@@ -614,7 +604,7 @@ static int dln2_adc_probe(struct platform_device *pdev)
 
 	for (i = 0; i < chans; ++i)
 		DLN2_ADC_CHAN(dln2->iio_channels[i], i)
-	IIO_CHAN_SOFT_TIMESTAMP_ASSIGN(dln2->iio_channels[i], i);
+	dln2->iio_channels[i] = IIO_CHAN_SOFT_TIMESTAMP(i);
 
 	indio_dev->name = DLN2_ADC_MOD_NAME;
 	indio_dev->info = &dln2_adc_info;

-- 
2.43.0

