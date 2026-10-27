Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105412;
	b=sYewDmxHKpeZ9wrw6m0TSGvRg/jvzonlXzYY+DpkHvvMpSWupOMRXUts+bM7pu76y+21
	 0AkYlNct/znyUBg2A0Fe3rnD6eriW/X6jtkHY1YDCG8O1v4SI2R9YTcQutNbp5UFvyOsi
	 2RxydMhvIIiGnfHVNoQ6evCVUT51X8ZRmLafLQTYSUOgTJsg13Jm5SIKDXe+C2RNBNQqB
	 kT+dhUJdHKSAdgxdcdwHw9Qmy/nlHIkhKVHpTPDFtdW8AUir7qYmhjzWw/tGAkXfsq8oH
	 KXKomYzJ4C1PmeM318z79twaD25AdH2vC4jPNEv4J+zTim9fVEEcLvCUKgUgCJUfFJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sODvYeqV5gDMhpF3/tE93N3B3mOo+hnfsfgEpH0noQs=;
	b=ex9JtYwT8kiFYjtisUdvvws4GlhQ5OlXuzvpSShnNVVz/ki/H5RY8YR/rdlX8J83fEqv
	 5L33vVrU3FDwdZI9Ab2HD4t0qJF7RJccKkXr6XxKKDcg/QByrg49VvB+Lq+YpVYFiEQK8
	 pP+1UI8+XlfllS2aX2IK+GmWYF8WDOaBMcAAxjh3GLu/0Nbz2roo8ah+kbwsjGu5WNnUf
	 JI3C2ktcAiqBkpM9zksonxJpvyCk7Ur+blGwbS/Wxms/RQ32wZIzFobBAPIk2c8UkytP4
	 uBwtCPk1OjY4vKahRLr/8UmNRznqVa5Pdsa7YkM8Le58nl52cwjjOHkTlMbUvdOpQkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=joo+3GXN;
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2A760A3819
	for <chrome-platform@lists.linux.dev>; Tue, 27 Oct 2026 12:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A2A760A3819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=joo+3GXN
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be42ae8eadso1348478e87.3
        for <chrome-platform@lists.linux.dev>; Tue, 27 Oct 2026 05:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793105411; x=1793710211; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sODvYeqV5gDMhpF3/tE93N3B3mOo+hnfsfgEpH0noQs=;
        b=joo+3GXN3fPdIDOS2+tFQS+ktUwEBKiU7u4oFs63Z/rF0YschLyjmTmDS0gCjfCYui
         HELJ8N0Jr5z4G2X6HJu5ujaDMxSF30evrbTB9HxQ6ij9IEns8idj8atWTKyyJMUc9nWj
         6mbCiyiEs5xVHPofxkxNgknHw8tME2KqWn77YvWipAxHoiRTs0F4WwygnVV8S0PGfvA3
         gtJ0eveLeGGsNjh+9QP80cYOrQ62cByWDB66vN4/SbcsPeCP1QQlx6X4UzIjkIS/wlW8
         lEjKFPpwyvvtch2W+b8DihTqGh02IAIEVuCwRxjJ31J6yaYxCaoBdptoEzlQwc/wo+sD
         HQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105411; x=1793710211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sODvYeqV5gDMhpF3/tE93N3B3mOo+hnfsfgEpH0noQs=;
        b=anAR3oAvXxHZer26oYjnOzqfI7QrT38zC8UD/bnq9lviRFsmFwfivvMSrIBrl99ulp
         /VCVCtMamz+RcM4RBzvtbZeo7MMT/U14XjejL+yrYEBpbWfSbbckBQ/PWTmF7dLCWAUF
         FjFEb+6/AqXyCCuTmkTKhZfaSTA3ZJjzIXCDjIQLqECioQLQpI8mXX0YPDq4ygy3mHym
         kY+JQb/4uLZfxdLOGAtaBSGyigeJDe+Tfmj+SwX2eqKzME5hAwTCKt//+M2l56MTETw1
         ATLdJ/5n+JCtYaH0QG7CTPJBLdJNwCckICUmGSYv+/FfV3yffdyXShxEg8IDYQqFzpXP
         A7XQ==
X-Gm-Message-State: AFq9FYKlpQqImsmsru9l8QwRqYvOFJfwtFCvVJyokdx4T7oBYl59rqyl
	QynD/h8R+5IitndSOL4EM/hJWYfdaiD89FDPatYHzumWjCHjAhsfYwjI
X-Gm-Gg: AYBFou24k0a/8vtbY8Yihe35wV4JJfVv/GS8nhKEnZLxZy0kDpClKysinp5QWbiqrg5
	kI7qfgRdjtNGCEW1C62hd0ziBybUXODk7PRks2ZvLy28aZt6DFI8ciBd8JW/aLqwRXZcNglSpJQ
	ku+fpwdUsMyF3B0Mf792F41yGpf3lQn6nRdP6SgMiL202mIcAp5heJNsoH6bnuyy4J9OrW7J/GT
	PnVEL0MDfpvrlsvRRQ1Z3cJxwqFry04HZncJESiombakYgn/zp7VkcPfhlayujaKygweY/E5CFa
	tlqWLIHnxFpkAepuftdQYfgQqZs7iOm5orxa3rNIKwOgAnWjF+Mreq4esHe5OxrrLNVVWdb3uvR
	61DNNpL7ZVkJLIutk5sHRUpV7CO8I0MGNY9tcj2l0G8wcx5aCwFEvRf1z+HU1+vUtcBtmrOE+H6
	6QQqHzN/1Bk2shsbWHiE6S7b3pUwl4mQ09O9675aizpH7rBxAmusjCs39DLyHT6sBt2bcaFpZWl
	N2wPXORyjkMd/QX4MJo/RuFKpUhhxysa8dA/veYXfEi8e9UQWmV7rTu1GXsaOYBKTSOuUDmEj5N
	hszA4BGXnIcHPCaJDCkalTmCL9nexCWHru4L/HH3RboMOfffiunHg113meZY0DGN
X-Received: by 2002:a05:6512:3409:b0:5bf:b963:70fa with SMTP id 2adb3069b0e04-5bfb96372f8mr3300311e87.48.1793105410585;
        Tue, 27 Oct 2026 05:50:10 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:10 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Alex Lanzano <lanzano.alex@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	David Lechner <dlechner@baylibre.com>,
	Guenter Roeck <groeck@chromium.org>,
	Jagath Jog J <jagathjog1996@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Jinseob Kim <kimjinseob88@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Remi Buisson <remi.buisson@tdk.com>
Cc: chrome-platform@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	Marco Elver <elver@google.com>,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH v4 8/9] iio: light: veml6031x00: annotate the event enable helpers
Date: Tue, 27 Oct 2026 14:49:53 +0200
Message-ID: <20261027124954.110697-9-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027124954.110697-1-zoone.rupert@gmail.com>
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

veml6031x00_event_enable() and veml6031x00_event_disable() call
veml6031x00_set_interrupt(), which needs irq_lock held. Their only
caller holds it, so mark both __must_hold(&data->irq_lock).

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>

 drivers/iio/light/veml6031x00.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml6031x00.c
index f6308498e422..476ac3717f8e 100644
--- a/drivers/iio/light/veml6031x00.c
+++ b/drivers/iio/light/veml6031x00.c
@@ -784,6 +784,7 @@ static int veml6031x00_read_event_config(struct iio_dev *iio,
 }
 
 static int veml6031x00_event_enable(struct veml6031x00_data *data)
+	__must_hold(&data->irq_lock)
 {
 	struct device *dev = regmap_get_device(data->regmap);
 	int ret;
@@ -804,6 +805,7 @@ static int veml6031x00_event_enable(struct veml6031x00_data *data)
 }
 
 static int veml6031x00_event_disable(struct veml6031x00_data *data)
+	__must_hold(&data->irq_lock)
 {
 	struct device *dev = regmap_get_device(data->regmap);
 	int ret;
-- 
2.43.0

