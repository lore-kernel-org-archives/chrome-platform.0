Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105409;
	b=cy+kMM2P/BbOJu2jDSew+Acoj1mTObdHMjZBZjgXokFP7VUTldPeecr+bGp/sYSq26T0
	 Ik4je5nScqW77y7y2Qn1PWmSWzWKtQ5ZYBz2GlmZtAX1/3vIcQUedb+P6dtA22nLFWJXz
	 qSvAeIQUQLnFGC21vEgbHLRnRJGX+rSkzonBob9CMv8mx+lx8RMRPp1K0h48dYFMPf9Er
	 ozTfa2IIUR8yNsnidHobjn2ByZ1TiJKwDoAz/uls7U3I+OKc56H5L+XD6pJSbUJoWIYLI
	 3TnFD3te+BrJnx6cc5J6YQoYey89phCPh1A5A/0y4LGLAsorkSOpM7JGqhMl2S0iJng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=w9bm/VqfouJwe/E4PVyOUQraLP3MHwcXiPF4bxf1G7Y=;
	b=KXahyWazhi43FXVHBPhPE3uGHkQ0TH9BeLJdPxu0TetJnHChjKWdiwg+Rn/KbMO0ODzE
	 4Pgmv/QsAjc/aLIrWiuH2iqwLvHjpDIYANUAPx8ChacWPPR5eU4S5nZvE0ZepYTSsCCzM
	 77OIit2LZROuNkq53qEEwfSM0+lRZCtert3k7YX/gnZOt+4AIHG6zKO40zI+WJJeygGai
	 XnNzA6V5768Tu2WXt6hNWFvw4J8oPE4FZlFn0rUiT7MwjZY/cNR+iWwyou9sERHMY0R+y
	 5c+T5cfc9zu6ns4ZfffXLk0pbPWyt4h0I+XjLPEFdc86c1+Yi/GcGMaZc2LrHumLXmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="jA/eGs7U";
	arc=none smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EBC60A262A
	for <chrome-platform@lists.linux.dev>; Tue, 27 Oct 2026 12:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99EBC60A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jA/eGs7U
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ac8c03cea4so13738981fa.2
        for <chrome-platform@lists.linux.dev>; Tue, 27 Oct 2026 05:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793105408; x=1793710208; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w9bm/VqfouJwe/E4PVyOUQraLP3MHwcXiPF4bxf1G7Y=;
        b=jA/eGs7UFvmpAusddpr/BePY46oxrc+snI3VYIJeI/NvBj4nAtr2S9Nl/F4LKHqFVA
         LKNLsfdRa4pdmDQ8OpN/k9OMZdBCtz2Soz+hdFljFxNz2TIyCWgmdok0NjEmrsyHrC2u
         mrvFnW74epCNE+JAFglHhryTT2dGpCKe+iT82h0oFkSYneY0swwsswhFTlbc5nkPma31
         Ku1tVjamdVkQ38ay3dfbQuSoVjcV74uJp3MFVHRQCVT/VA7R0CdUNCAPgbEnY/buMyeS
         ejGgYFUtZlB4Q6UlWd1Kh4NVmuJS06q15FKBqV5Ze+ldqbiJN/Z58ZwuyfZLf0S+iFOo
         ZGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105408; x=1793710208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w9bm/VqfouJwe/E4PVyOUQraLP3MHwcXiPF4bxf1G7Y=;
        b=Lebn9ZhegEA+1AiaSUHGfUp9aLrJACkfEECZ1D9LyLkT1L2g4NeqaV/Xu2ENKuKr8v
         CZO6LAXlW0XhZsUL9pLnrcIjzMhZq5avWOyI2+6eys2Vn9tN/YMgEIjjP6MR6kdOSGq+
         zFBHEPHrlRSnNGDgOQokmvlFzl9QE3d3UQS5jC2/c6K15hkLoUPfwL1UW1hHtqydwFiD
         UYY7XBFNcH9ilLRuR7895JUym+M4tRqSKY5jA6pvxNbn2rXw/oXOXGWtsIiseSFDLju9
         GPVFKvg9wuy8CEYlIEARnuSDjWxAw9RHsCm4eXKyCrgWunMkEfGX9KUjkkbDhb5+6foz
         +GnQ==
X-Gm-Message-State: AFq9FYJwMFdn79+nRuY+p2OzdMjhZSwEJDRwp/QqT20keb5pVskxJ7pH
	bSpizi1ZEpbrmsYLfYlNzduuEpSJht6vZdOuPDvNwURxZllUgCAMhTt9
X-Gm-Gg: AYBFou2fhUEPkGojzfyIV9ODgKiMNH/ecZsKRcNXiFQPSeIFLrD8z5yUQnIQ3clyU1G
	llKPDJbcd4itox2JJzsOA1I2Y8C+TUQ6WdFo1vCkdZWQ/8/KNmYCg2hwUom/9+Jp7K0uyXLVSPI
	dJzXoLpLEYyl9QGGuBCLquz8haOrd5xqFvPr3j6o7lEW08YiivEz5tK3/U0FrYwjv7p+PWTjozH
	vsRrngFpdj5MnIeHnQSd3wKhNwD+WmEAFn6Dap//1VlJaoyCBb74o9oCXvlpXLVYrkISeNBQkjJ
	QqMMK7SUVHyb/rBhhEKST068I8w4g3nmp+Z5c1AFu4RuN+oS3KzU5AlMIBTYimckWga4FeWrM5r
	WAqdK7JHcFa5cT+2El7u8K7AEFFXqZsHkgAcXOHISm6WmwTCgrQlZ5KVravHIXlPPKCDzvAh2r0
	k93BVf5iW/rV8r26/YPjA5cVVPNNPpnguesoMmAFpLTY39XgbYC/EIe6oJv5hVAV/w92XOB5Idm
	0gupWBMvswn3AqALN6jUMNfjAspSy3omQxHUi0Lao9zHk8nViXU9ojXVBnUt0a3jDyLhpaxbHGy
	rZzNLiq4vJ/u30A2YugBk+77ilI9pChBBpY1CIm9RgUssfH4eC9OGr/nHlMv0mJ1P+ji0/uJ6F/
	sgSGUmlNcrg==
X-Received: by 2002:a05:651c:a331:b0:3a6:622a:2cad with SMTP id 38308e7fff4ca-3ac6fd0c2efmr24122901fa.10.1793105407711;
        Tue, 27 Oct 2026 05:50:07 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:07 -0700 (PDT)
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
Subject: [PATCH v4 5/9] iio: adc: meson_saradc: annotate the lock helpers
Date: Tue, 27 Oct 2026 14:49:50 +0200
Message-ID: <20261027124954.110697-6-zoone.rupert@gmail.com>
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

meson_sar_adc_lock() returns 0 with priv->lock held, and
meson_sar_adc_unlock() releases it. Annotate both so context analysis
follows the lock into the callers. Only indio_dev is in scope in the
annotation, so the lock is reached through iio_priv().

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>

 drivers/iio/adc/meson_saradc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 2b003fd5afeb..3c1bc2274129 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -578,6 +578,7 @@ static void meson_sar_adc_stop_sample_engine(struct iio_dev *indio_dev)
 }
 
 static int meson_sar_adc_lock(struct iio_dev *indio_dev)
+	__cond_acquires(0, &((struct meson_sar_adc_priv *)iio_priv(indio_dev))->lock)
 {
 	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
 	int val, ret;
@@ -608,6 +609,7 @@ static int meson_sar_adc_lock(struct iio_dev *indio_dev)
 }
 
 static void meson_sar_adc_unlock(struct iio_dev *indio_dev)
+	__releases(&((struct meson_sar_adc_priv *)iio_priv(indio_dev))->lock)
 {
 	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
 
-- 
2.43.0

