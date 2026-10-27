Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105407;
	b=O7ONyxpsyBQz2/Z16wpFSmU9Tn9kc5tlADHyPt8JzWmJpVLgUATXRiECdx2/DMn5Ft89
	 ZLu6cNHDi9CItWxVM22iy/DWf+RhwLJdvj/e5UgQCx9pfNic5MDEZrERtrBJK+SUs5NMb
	 xEjFIueeQD+S3TgD19t0cq3c4Z0LEG7jb/DZu+YpzNBx0mgBF3zYxTf2V+WQ/Z3AzrdZC
	 /lnfPeWKenLHnSWiWXRuMm6tcNHu7ry4sHQJgKggzZX7G0PqV7Bdw/Ym3B006mIwq2jHE
	 yzMH1VT0+eW4hIWzTdwmhoT23Is3ACX36f2yukuvFnQ2TYlL7eR2fSVXKH+NDPwq8UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EOmMLjMAFJxyM/LPyWQT2i9O3ojzkNgFK3nKjeDrayg=;
	b=FDslD4/R5XLfMUGXRDBUx2K/hb+9zFgjj3/29PTq9GE3k3ORRgWjBIfS/I6IamVO/hpy
	 TmNKQqn+dkbs5yhSvuV4j0v7MqbqB36C0hJDu0h2xCoXSHrvHejnFCexUHs/OJWtAvLdA
	 lpTGTm2nzE/PIHREZsHTt2OKtD1AAAqh/ns+eAqjSHNsVTiSRD66YEDat1woDZT6YRBUd
	 Q/pnkTUErior/O7rDEzC3dlt96v+UGZTAnd0JDc2iYL1ed2/hCyOG/hh5AM7E/ztYX1Yb
	 0+Dsld9hBUViDcpHf8YYACounnOH7Zp9kNu5N6RbSAEyqZov12T6hw0YOWKPle3NP5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b7+EUg2h;
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F830606A323
	for <chrome-platform@lists.linux.dev>; Tue, 27 Oct 2026 12:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F830606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b7+EUg2h
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ab3b29a210so9634241fa.0
        for <chrome-platform@lists.linux.dev>; Tue, 27 Oct 2026 05:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793105405; x=1793710205; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EOmMLjMAFJxyM/LPyWQT2i9O3ojzkNgFK3nKjeDrayg=;
        b=b7+EUg2hQ23B94rsvFUUuvPBpGsYGSRbaz2/p47bb5ucB53MnJJn6JjlLtlrfqbvMc
         phXYiNvSpcKgz59CEjvRGwVnwrrL6QQfTMxE2n7Qz8cLey+3ODNrJnnCsMCOmEqZXW+C
         0wSRLyGCMZ7FkkG+3Y2BfTybfTNkJ6geqfPAtTVLIo8YY9H6mxYjmUVX0N3Stmi9vSy3
         Vl01YJ9XL+WuVhkvjvB5bx5nKhIwEEq+5X1lwm8RK19XOqeQGGFB/wrYAlzmke03FUpF
         zSnTY6c3Bb1pIewc2PSLRYtRq6J/gQB66NpdONMtsBsUyhMzZlLaWf+/fhVURtwr3ryU
         SabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105405; x=1793710205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EOmMLjMAFJxyM/LPyWQT2i9O3ojzkNgFK3nKjeDrayg=;
        b=L9QW9Ca33hUVefVSgjSZ2zJ2MihLIQ0f3m1rddSEMCnq4Y+WfKBfJCUT1IJjRDiUlu
         vHMfZMjcdSjvXvYdIHK5HXbrbQ3UR6GaWxtOR3zrv1t8ONuWu9DFwghTQbKcmX8P1VZR
         No+u/HChE9pSFv8u2SifYtDwgH78vAGgDs9FPwQf7jd7AsRgTesHrIcZy7G+ql3kSDcX
         CyGUGbs0Iu9w+i97vkNwzG5xbLg2Y9+zvdwByXMlup3oDpjGyqxoBtp2aol7qwaZ6RZs
         88F1VbFCIGklyEDkCV1tsF+jskMWMjvmvANARFDoBD66oRJDTzav1uaA8dG9eQYelwFL
         Oiqg==
X-Gm-Message-State: AFq9FYJXmZ0illqZZ1XpkBGGRilYF3ZYksr8jUyjqf5C9fHxjsa4LsGk
	FfnmPw4RzRIry2aUb4H7eRh/4KWFgCxlYLbMJ0N4NsExELG+OGRYLBto
X-Gm-Gg: AYBFou07r4en3QnmJ3/d/VdcXkOnQYFYYR6kBQo/VC2HrnABo6jSk43fWLerRancNz+
	ug1eRpws+CpR7lNtBKfFYRqDgLCzW0KcmJtY2II6+XecaWEkjOPHdQKiPkj/zKS9hN6yB9dkvZS
	Ugn7OrhC+aZh9MK9iniILntYVsRovxAh4bfpyDg50aBKL7/K/8N6IiLrmpAdFswoxd9RSyS7ErZ
	lyPWCWeG9RrPpn2lq+vchi5YYKyOGBEDZMoeLjcWecq54X4CozO3eAcaqgO7O9BMwJuek8t4ada
	UnB4oN6ZuqesC0kIsOXG72ENTl3WpURmosSbE/OwSVqwHkkjar932O7Ae01OHdeVlmV9FYbPLOR
	Rt62Y9aZZIHCiM7Eiv/e6nN9oLQU6+pYxUEeUpownrBUA8SCGJG75MA0snDb8FKKAos7L1yAqiC
	hEXG5/6p243xr6nDpRMRNDte51lY1QW8p86jw8rDSzrqLoCZjAUv/ehxWIj7Ge25Bo4mi78CA75
	Z269xvqQ2vzUN1WNQLKiRyMFsKrzSQVAWpwCyMkWqXU2DQW9RqBVW52XcrZNt5Bt5rxgTbhwQtY
	yqpO5O+ufTBL6ST/mbfG2pXjGlKNIJJ577HB8ofZn77TbXQ4Qq1RN5/+xpW0TYML
X-Received: by 2002:a2e:a883:0:b0:3a9:7c85:a16d with SMTP id 38308e7fff4ca-3ac908e3716mr5518161fa.5.1793105404928;
        Tue, 27 Oct 2026 05:50:04 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:04 -0700 (PDT)
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
Subject: [PATCH v4 2/9] iio: core: annotate the conditional mode claims
Date: Tue, 27 Oct 2026 14:49:47 +0200
Message-ID: <20261027124954.110697-3-zoone.rupert@gmail.com>
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

iio_device_claim_direct() and iio_device_try_claim_buffer_mode() hold
the mode lock only when they return true, but carry no annotation. With
context analysis on, each caller that releases the claim is reported
for releasing a lock it never took.

Mark both __cond_acquires(true, indio_dev), the token that
__iio_dev_mode_lock() acquires. Sparse no longer reads these
annotations, so drop the comment about it.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>

 include/linux/iio/iio.h | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index 9b63785d5aec..ca91f5a64626 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -707,13 +707,6 @@ int iio_push_event(struct iio_dev *indio_dev, u64 ev_code, s64 timestamp);
 void __iio_dev_mode_lock(struct iio_dev *indio_dev) __acquires(indio_dev);
 void __iio_dev_mode_unlock(struct iio_dev *indio_dev) __releases(indio_dev);
 
-/*
- * Helper functions that allow claim and release of direct mode
- * in a fashion that doesn't generate many false positives from sparse.
- * Note this must remain static inline in the header so that sparse
- * can see the __acquires() and __releases() annotations.
- */
-
 /**
  * iio_device_claim_direct() - Keep device in direct mode
  * @indio_dev:	the iio_dev associated with the device
@@ -726,6 +719,7 @@ void __iio_dev_mode_unlock(struct iio_dev *indio_dev) __releases(indio_dev);
  * Returns: true on success, false on failure.
  */
 static inline bool iio_device_claim_direct(struct iio_dev *indio_dev)
+	__cond_acquires(true, indio_dev)
 {
 	__iio_dev_mode_lock(indio_dev);
 
@@ -760,6 +754,7 @@ static inline bool iio_device_claim_direct(struct iio_dev *indio_dev)
  * Returns: true on success, false on failure.
  */
 static inline bool iio_device_try_claim_buffer_mode(struct iio_dev *indio_dev)
+	__cond_acquires(true, indio_dev)
 {
 	__iio_dev_mode_lock(indio_dev);
 
-- 
2.43.0

