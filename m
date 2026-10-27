Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105411;
	b=ylxjaSQ6WgH3utfcTaHn6KZ07GhsNtuwO62qG4FhuURX4M2zr1IR4julqmHL4Qa4xNTm
	 IStIYAAInUAXBbNgjkO9X1PgjY/XoELdlKpVE9DZA/35KtGCC8jZm08o8Wdt9vZoB9q+3
	 pC/lVQ/xTIgf7s5jnEyDhwAFWaghsCVw4drGrvn/BfjieOaD85/+bhAO4AUfkwCg/n7ql
	 KQUX7p6w/ZtnXBqWOAAV1EFyuTLSFkGW9YGLdHDlTtfRLu7U5FVToLW3PW+SobWqO1K9D
	 MhEgfRnKZk/6j0HtM3tXGb+6SZi4qRDmu18k0ps4F2hy15E0fv0jvdiD/vubCXKpDCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IAwqAAQD7kxOT9F2GvcLkLjakYWT0+JOrQ0Pn5dLBYQ=;
	b=LhDUxDqKAj77yGBv7bNXPIRlav2Q2WfovuwAko5O9f4mXwQs+nEwhQD69oC1REiSiM39
	 KxrFAD0sqWbXdBmoY2usCqC6KkHlnnRkknp5ZR7stxQqqR49wV3SHYEFq8ttapl5LrHZ2
	 2i0U52V+8+xIY2nx3OSPwwbhWqaMZUfgRTkghCsYQPXMEMb8THkg6VFyBOL7ecFHdx0wT
	 xDabnzYj/Inaf40S9La5OliD61kd8q9tAkxSeFT/WIDMZVGsb7qMgzBrlAzoqsW0wWJxL
	 4xbPuGfL4gQA7wW4Z+yGdhHDSrn1bOEvMIr9NLbJHPgwiNGsatyVNioCOS5ncryYMcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Up7tEiIQ;
	arc=none smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D8660A262E
	for <chrome-platform@lists.linux.dev>; Tue, 27 Oct 2026 12:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6D8660A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Up7tEiIQ
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ab28f3e4dcso8123421fa.0
        for <chrome-platform@lists.linux.dev>; Tue, 27 Oct 2026 05:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793105409; x=1793710209; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IAwqAAQD7kxOT9F2GvcLkLjakYWT0+JOrQ0Pn5dLBYQ=;
        b=Up7tEiIQnVCCMhlIZlA8LqYstbl7BJeVXQ3uLk7o9KCm1pFk4bEaSmXtx6s7QSFEyN
         k5ILMZtvSH3kPjgPCI5mr+GpZSBoURg/S0atVabEGsxEouNB6qSm5NzXhq7oe1f211n5
         3zmxtPgTwzVwencToM471F5DbNitUvVAvDZKREw8YxtdVapwVqbR+frxnmlsgsNjYwH8
         m+unHXC1TV+cFI+xPrBgYgBBtHXhDA9JdboRYMO86T8K2KG05yVhZyajRvIbapNY8D08
         C/HMEqYuQRIQXMzb6BwJ1kikJQe7cdgvz4pr6t08vY9qjw/zme+T47USm7DiK8oUTqoF
         exIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105409; x=1793710209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IAwqAAQD7kxOT9F2GvcLkLjakYWT0+JOrQ0Pn5dLBYQ=;
        b=UtAt/zbYaL473ORgnQqJWWamUhIUKtO1Khe/H/PR6Wes5I9rfXObQnpyu3rW2lhqej
         olgB0UEF40enReLpdkQeya8w5/VfdAmGigFbflZe7AEVbzffw5zwfEjySgTDh5EE6dXH
         /Yp6bL4gBHvNgDnwKmzfehyKYNdokPJ50pvSkaI3dS8p4rQszsfzjV6h0yJihdt8jmwZ
         PWSN92xL4XUSWuCPicfesDSGmn1dcDNYLDP4wWnHAaRfzWCvJj51DIfOnPcV76Q1jEz6
         poRjWGl4pjo3ykuKbP2fPXgRvgOF4TtobGMlmq53l9bViEheerjmuxNEJ9WqVndjhRZ6
         VMdw==
X-Gm-Message-State: AFq9FYJ9IZXEXVFJmOMA5hiwXlG7kP7LtMlXw8R6ghxWw5YjNLQJUqKs
	7UQLGC6WauJwVc3++u03XYO44+cfA6lqs4wSEp1kbxXjNwDj8TQif49X
X-Gm-Gg: AYBFou1nSKEsE+XcGF9LclKrB4jFEvjCs74/NMmPE3TXspZzq9ncQXxnaAfpf1v9LR6
	kj0f3N7OCyxsoOfepzTXe5BmY8ZEbJXb2ZhOGwJ5OoU2qQw+NSgvmMDJLigzsLtu9jugE46piI0
	QAbivTCnIV/sNiGkHMZ1MJZznvmt41q0GYKdGVa7+xvhJqwr8rY67ttiZSjpW53/dRFfyiM4VJg
	W6ei7LbQVyrA2mMY9XtCVahEX79tMfoJz78JD9o3nn/nCmiblxQYdML1/XjVsCujLhRRGUJeRBY
	gxA61DPVTL+ZZbR8hUU1AjO8H7hKfPFm6oTQRS5FDac3vpJLSfcECSmWP7p+PEDH8Pvsp5p17sS
	xzo0yxsfewsk8gmrjkyv1vFFLcSvMp+gJm0xRibYlKjklGZYruXItlGY8n0L45Nud4tVvIMxTAe
	fVLWnIj2+7cMGIpOfoXuUdwsvIoRxDntz+WkhPheNHTIfT9Svn7d90xUA1PXck3/WVXPyiHu046
	VNAid4Jll8crb/NNNChYpN0AnXvMqUtGd5Sv7xxFRDp6M08uBiGLNAYZX5FToulZdGffN7k3HXx
	5LXuvF0TvpViQQveTJvm+cdUBclyoXOd3BwBi9Xa3u13SlUlz62/S3YoEjREG8YwAA2AXmy6OQn
	5JBv9bO0PVQ==
X-Received: by 2002:a05:6512:3981:b0:5b8:f430:b617 with SMTP id 2adb3069b0e04-5bfc618c82bmr832927e87.45.1793105408719;
        Tue, 27 Oct 2026 05:50:08 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:08 -0700 (PDT)
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
Subject: [PATCH v4 6/9] iio: buffer-dma: annotate the queue lock helpers
Date: Tue, 27 Oct 2026 14:49:51 +0200
Message-ID: <20261027124954.110697-7-zoone.rupert@gmail.com>
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

iio_dma_buffer_lock_queue() and iio_dma_buffer_unlock_queue() take and
release the queue lock for the core. Annotate them with that lock so
context analysis checks them.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>

 drivers/iio/buffer/industrialio-buffer-dma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/buffer/industrialio-buffer-dma.c b/drivers/iio/buffer/industrialio-buffer-dma.c
index 1daac23087a7..b42b70e9b06d 100644
--- a/drivers/iio/buffer/industrialio-buffer-dma.c
+++ b/drivers/iio/buffer/industrialio-buffer-dma.c
@@ -763,6 +763,7 @@ struct device *iio_dma_buffer_get_dma_dev(struct iio_buffer *buffer)
 EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_get_dma_dev, "IIO_DMA_BUFFER");
 
 void iio_dma_buffer_lock_queue(struct iio_buffer *buffer)
+	__acquires(&iio_buffer_to_queue(buffer)->lock)
 {
 	struct iio_dma_buffer_queue *queue = iio_buffer_to_queue(buffer);
 
@@ -771,6 +772,7 @@ void iio_dma_buffer_lock_queue(struct iio_buffer *buffer)
 EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_lock_queue, "IIO_DMA_BUFFER");
 
 void iio_dma_buffer_unlock_queue(struct iio_buffer *buffer)
+	__releases(&iio_buffer_to_queue(buffer)->lock)
 {
 	struct iio_dma_buffer_queue *queue = iio_buffer_to_queue(buffer);
 
-- 
2.43.0

