Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105406;
	b=WkIS1n6p0htnH/hf5pMdG2aMHODl2bw1lcPFWfsWFDhclDOQE7OskAhHlCUnirFq0Jtv
	 UbiZwE17gd03pa/F/LNlmoFjmiMlHrjyUN/tAYPLoUVVxbFKKXPY+MBifEn/s/qNwOu17
	 x2jguRult1z3IJ4tKXQe0mfigt5dW44URB1Y8NIr46F8QmvOZClZuCqPb3TwKuOmzNBiT
	 /Gn8O/EREuA3dtBPyC80pIxk2f85YNox9aEtpJrtzcIS3AhKwRFBgbYGo3bnojhCDlemy
	 48MdztePwg1kQ9MZFNYcyTmwpR3Arq6WZXD8n+2ZVxLaMPcn85ALk1mgsHGLAgsaxWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pkcAkMdCRwIuT9szM2gCVVjCSXFflqIHrQQCvrEeeZg=;
	b=U6eulDQaDJIlRlbj7nLnOSM5YecMuY6PP3Htfks44bMupGA4h/IrOyaGMcjW6NLuvLol
	 zBlvWO/LxPCwzjqYRrk7Bksau/FpAK0nOZeRQzOjASmpUTTklLPk+E0wafthdKPLHeWDf
	 tDzwEXAK0syJT5aDzxc1GxL5OcGis13/EaDqkl5+DYkuSk7bd5U7C4T/Eghuvp9MNM7eD
	 pexTKl+hlj0AHWQukmAW6v0pKV4I0y83wP0qsUV9Jy6Z3tbOqszPpVju66f1CeBxY46o9
	 b0ZgMJDv/ZPBG2o1uNEKE9AXOebuyGB+kBc2+REW9h88x1goHxN+kb3lsVBskV/uTMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dayZoHYo;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32CA606A322
	for <chrome-platform@lists.linux.dev>; Tue, 27 Oct 2026 12:50:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C32CA606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dayZoHYo
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be416e603cso2452893e87.2
        for <chrome-platform@lists.linux.dev>; Tue, 27 Oct 2026 05:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793105404; x=1793710204; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pkcAkMdCRwIuT9szM2gCVVjCSXFflqIHrQQCvrEeeZg=;
        b=dayZoHYoR3jMasJfz1Xv3yx21cp2Zox/aMH7AAonsoHy7w2gAbD70dIszmXrwWfHSe
         5ziVRNs6GvDibpED29IKBBspomDB9pcBekIMf441ai+c3ctEqMPrNaSSAIQ512Vp3K+S
         qt+tlqy6khFKGXkVqk4KL0II26wkc12xHkOp8vGP3jlQVWa6/v5i3Du6Gq6lNbn5magj
         XnF1XNsce9TGx8QLocHkdQADeJG7Z4NnbcFhKlikDn3y9BAk7RTg7XkTA7tLB+4QHphe
         MxAZdUfOTjBjXgnhCrX+FFET7wiiYQaLfPHAbUY8ujLQen93vw5D2yhJ2I84mfw3rwt8
         LvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105404; x=1793710204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pkcAkMdCRwIuT9szM2gCVVjCSXFflqIHrQQCvrEeeZg=;
        b=2cKusyLaIR6YvQL5t+3SBa0GhFAvAMSAze2UsfeINM1n2r4wREjG/UEpvTIkTX4mvc
         TVtBMi9ODNQ7+zjGQ1aQOxz9qB4Xq/MNzy6g/u2JW6qRB4WiHdqK6DFx4f6i9aZRacd1
         YPhFpSn8sgpzq2E+8QGxDOqoH2qbw8dqMpwK2Le0iWhuCjh239mgChgX2pMBarlza2xl
         zJqIfsWXpO2hHhNRkd6UQKgJaY9iDWr63Kf5cBLLLTPVXrMzeQo9tVrcTjX8bG2x8ZIH
         lllgEAx587FMse9y/EGQWvd/yKythJ9h2FTG7Ai3msNV/M0gtsjz9oFz3A98oGska7IP
         YcsA==
X-Gm-Message-State: AFq9FYKao7uvtVxWMAcfRy04DNmHm6fPO5GZQx5Dzm+/l5p3YMXG3w94
	HO8Jt+TVL9+hUO96ipHe2ZRqsdDY0ieOckKcmWteZ3iFeACk2/JXkwp2
X-Gm-Gg: AYBFou2KOVIwB2vegSNgz5Nbgo78vgyTAwZlQDn4eDPTXte/un6l5TTjFOSt2ASNXQ2
	FD8iug7RtPR+XRUER3vc+2xOKciEbLD8tjdZBFcKFbazmlwgLIEb2GoAcAK0NIojDcc7TIRFKWQ
	wSDXP1UUPWLsyRSqB9f/9F2NZgEfpH4gj3X5caTIYP2b84HDNqa0xVN97VY1UZ0GXuiKn914DZm
	TfbacbI/+shJCbR8NTUvBOOlSZaXf5UCFffaYuqBwqB99kKjZKyupDMIkcl+GEIHkj8IDLhmiiO
	17HbhLhvWp6rhDTBvJIz54Ic3ELNvsBtJnz4f49Ywp5WGNhhec2x+HpXb9Hqe2ZO610GNe1KTCD
	S9XDkW0mw4lSGwj43dZ7tg9AcDiTdUzuQvse6WyDyuiCD6PT/RlEOcQXI/glqjt/yEZr+AxQAuh
	vcyjiZOFviW10/COJ3VQQzP+bL7pXM5cqcANKZMyHdec3hmJPg2NZeNNRluLKJtHoIV5929jS6R
	lYtgpML9jZEQTQHdGRaFI4ZheAa5Mj7ijRQRuEodxkLqXHcvWsbWE0NTJQAdd2EPTFIx8Hxhl9f
	3ywWxbuIASqQ744sQq5A+ENsCvyiz+dEhYJ0w1ZNyQkYy8mKb++Q5Wrp24JBe0Ix//koYte/SbO
	XblbB+fZHZA==
X-Received: by 2002:a05:6512:1047:b0:5bc:d9de:d75c with SMTP id 2adb3069b0e04-5bfb71e3343mr3417911e87.47.1793105403789;
        Tue, 27 Oct 2026 05:50:03 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:03 -0700 (PDT)
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
	Bart Van Assche <bvanassche@acm.org>,
	Marco Elver <elver@google.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH v4 1/9] iio: adc: qcom-spmi-adc5-gen3: fix lock annotations on mutex helpers
Date: Tue, 27 Oct 2026 14:49:46 +0200
Message-ID: <20261027124954.110697-2-zoone.rupert@gmail.com>
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

Since commit 5b63d0ae94cc ("compiler-context-analysis: Remove Sparse
support"), __acquires() and __releases() only feed context analysis.
Their argument is parsed before the function body, where only dev is in
scope, so with analysis enabled for this file the build fails:

  error: use of undeclared identifier 'adc'

Name the lock through dev, the same way the bodies find it. The analysis
then also checks that the helpers really take and drop it.

Suggested-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>
Cc: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

v4: name the lock through dev instead of __context_unsafe() (Bart),
    now the first patch of the series that enables the analysis (Jonathan)
v3: drop Fixes tag (Jonathan), trailer cleanup (Andy)
    https://lore.kernel.org/linux-iio/20261025191510.22261-1-zoone.rupert@gmail.com/
v2: __context_unsafe() explained in commit message (Andy)
    https://lore.kernel.org/linux-iio/20261021052435.112686-1-zoone.rupert@gmail.com/
v1: https://lore.kernel.org/linux-iio/20261003214516.128573-1-zoone.rupert@gmail.com/

 drivers/iio/adc/qcom-spmi-adc5-gen3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/qcom-spmi-adc5-gen3.c b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
index c68c6c5f6aca..09013c6e44a0 100644
--- a/drivers/iio/adc/qcom-spmi-adc5-gen3.c
+++ b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
@@ -663,7 +663,7 @@ static int adc5_gen3_add_aux_tm_device(struct adc5_chip *adc)
 }
 
 void adc5_gen3_mutex_lock(struct device *dev)
-	__acquires(&adc->lock)
+	__acquires(&((struct adc5_chip *)iio_priv(dev_get_drvdata(dev->parent)))->lock)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev->parent);
 	struct adc5_chip *adc = iio_priv(indio_dev);
@@ -673,7 +673,7 @@ void adc5_gen3_mutex_lock(struct device *dev)
 EXPORT_SYMBOL_NS_GPL(adc5_gen3_mutex_lock, "QCOM_SPMI_ADC5_GEN3");
 
 void adc5_gen3_mutex_unlock(struct device *dev)
-	__releases(&adc->lock)
+	__releases(&((struct adc5_chip *)iio_priv(dev_get_drvdata(dev->parent)))->lock)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev->parent);
 	struct adc5_chip *adc = iio_priv(indio_dev);
-- 
2.43.0

