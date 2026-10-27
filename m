Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105408;
	b=VgdpLqFEMx23bRfR823InvcV8HH7wtDXoISO4i69vOeBe0Ufz9hldxypuawVMuzbg5+x
	 2JXAha9d9iWDQAwwsxVaj+rtxNNNQ9QSmX5rbZ7Q8qjWYmGprRov/5dHtHQKbeztBRD/q
	 oliUZJ8IM3/ngJMJB1+Tep2dRfAaiGUaUPFqgH2CfLJA8sAAj2a8sdCZa2PyXJr1cz9JT
	 UaIVJb1adYQQBfmjWyPs3cAmKJ1iCw3n3AEdD370o5AwzR1hY2kRO8OOfxQL0eYwOnrhG
	 WAfQP5G5yqE98TUfcm647OUd3bAZQWVpwdULyo6DYAbrSTQi0KQwrN/DAEAMGDDRggA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5maieUrV3gg0OvUYuumtngfF5Rbt74fkE8XBQYCal3Q=;
	b=bOhzi5j5KIbcmpso75UlDrKKTcdHKoLUXTVTpR4YNlivI95mmlqM05eTvntV/Z4zP9ZD
	 ox/ciApgS7OaibawzYfUte2BwHiqgexPVnQJ2KBq9INphNxmoMZfS7/4ZdhSOMZKXC2DD
	 UnoVkckaqRXB5dWANKt5Dg/ff8p3c3fEKA9TndnF25wwqugBd36fqnAOCEo4gLuMYRDqN
	 NANDVwRWyzrM4LKFg/rTZUmUPRZ8+Q1zHnt/JdfQ2ynKetZ0xWwHyh3pmOn1KpPWI6NBr
	 igL5uthxhoD+jB4n4U9hrlVeuEYDjqY1nYpL2WX9iGT6Zttf1H9Z+l5jJMu1or6G4jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=guSeG1HK;
	arc=none smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C7560A2608
	for <chrome-platform@lists.linux.dev>; Tue, 27 Oct 2026 12:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2C7560A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=guSeG1HK
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bcb0f245e0so1495515e87.3
        for <chrome-platform@lists.linux.dev>; Tue, 27 Oct 2026 05:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793105406; x=1793710206; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5maieUrV3gg0OvUYuumtngfF5Rbt74fkE8XBQYCal3Q=;
        b=guSeG1HKMwucdXLBFYjwKw1zxHDez4dA8lacsVfj4qvMAMlmtitshOEwL29W6o4S9x
         i99o9h8/L//EgyA8Z4HtOdOXtliLFzh5wggp1lqjDGWpgGHO3y3gxsMDmeaqIb3PfOE7
         lIaKBRRP4DMpNfAcP2poy3SBeZZ323cUo619+FCxMiBXHOb7EEo3HULTgvRzbX4inQV5
         ZHwySn2eXCZphxrnQ2Ux5R/awLDTkDdOCSGR48RtHbNykr1xmrpcnVAAQw0BlBcfOgAi
         Kmd0dfz4/3nGwlt+yKWmkO4A7AM0IYWXpq6mLLnSJJvcK5Gn/4NGVWWCpdFI05YMaGU7
         2gPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105406; x=1793710206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5maieUrV3gg0OvUYuumtngfF5Rbt74fkE8XBQYCal3Q=;
        b=dL2Vdxd6qLA7U1G8F9TBfLGkfMmgSsSrVIEO/aY5z87cqC+AdKK1Vw574kdkOyaCrc
         XkWH5UgMLrUXjqArpPxTincT7MQJPZHYK4211VOWd8t/11VNWwtmUhZj2YSz2MXiZW5R
         2DdrCoMddVZ5SYVeJOUT6Bg6YgokjawYz6uFK0Ff0GqkRdx8DVS+xmTUSCN5gIv6edIh
         LBHNDeU2tJuIA72KetV53+dMSSr/6Yb77dGpeUV/LAq0JbtcrDdCDsLRfN+67G2cKLQM
         Qn7okl2A4M26HavltrL2sFH0SQhhcxtpaWKLbYamPzuoqoXjA8iXmEgw5T9Yto6jqrdg
         DJpw==
X-Gm-Message-State: AFq9FYI7CZeaHWrwDVSqXjQKagjL1tQOKIpkKhuIyhvnbGNbLqTal3Hc
	4BI3QLoFe2bgLQLMXqSaE/ldUvgyF8DfPwug+UVo4eVEZNgQXJChHLb8
X-Gm-Gg: AYBFou0QMAhaziOhwZucQDFTNuQJsP/ubg6ojMAcY9ZS3JncQTXKfbCxjR/OKPyBpBK
	NsN/ug5GEFIWhUFcgk31cvXEAoH7B0+tDmNrjn38nPzXuznBCvqCK54UuryZo4c1+Rr8dcuMVpp
	QCI4BmhlA/sB+ugSOMhj0nveMM6aUkIerrIFHAsjaJxvRW/P+y2ZAkAvzdaaWeom07Lg8zD/8Ji
	oGXwMQa2M2nEnzaE47fuz0Ok+qGz3MwOGWL0nQtBSqzY3Yh5SLrTpc+4Edx6f1ymT4lKh6W5m+T
	KW6nUdBkx7djY1eRdTB0XbEEbGJmvidd36ZFdiPqcXtU2MSugMfKeIE1frQR6I7TwC2dLb6FPR2
	p9NCFpax8XdpPJz4NVqcWowMufOlkH5Z3I9wzUMyDcRoghBzxe1UHBW7pL6ydjeoU51osVhx/cO
	U4bcQzUGfxxm12VIyd3RxTGr2/fu+W1gWMizWgG7KgOtb6r6Ub6DiGDm0oWwwNa0yL47m5LJwQq
	md7JDdx9rNRX5SNbWiG92Tjed065kyXyYPlKWKU1ee4pgl54OE2WZ5pn27rTSz6LQj1BMJmHyxB
	kCBMqms1meUd1wU09uoMgcFFH00D2YRpT4j4xNQWpsO1sT8CZUwL9E5RFnBfYJlb
X-Received: by 2002:ac2:4c47:0:b0:5bc:b15d:beb9 with SMTP id 2adb3069b0e04-5bfb71c6b52mr3628166e87.29.1793105405831;
        Tue, 27 Oct 2026 05:50:05 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:05 -0700 (PDT)
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
Subject: [PATCH v4 3/9] iio: core: mark the mode lock helpers __context_unsafe
Date: Tue, 27 Oct 2026 14:49:48 +0200
Message-ID: <20261027124954.110697-4-zoone.rupert@gmail.com>
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

__iio_dev_mode_lock() and __iio_dev_mode_unlock() are declared to take
and release indio_dev, a token for the mode lock, because the mutex
itself is private to the core. Their bodies take and release the mutex
instead, which context analysis reports once it is on for the core.
Mark both definitions __context_unsafe().

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>

 drivers/iio/industrialio-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
index d73f2541375f..e9a5d1d905c1 100644
--- a/drivers/iio/industrialio-core.c
+++ b/drivers/iio/industrialio-core.c
@@ -2252,6 +2252,7 @@ EXPORT_SYMBOL_GPL(__devm_iio_device_register);
  * iio_device_try_claim_buffer_mode() pairs or related helpers instead.
  */
 void __iio_dev_mode_lock(struct iio_dev *indio_dev)
+	__context_unsafe(/* returns with mlock held */)
 {
 	mutex_lock(&to_iio_dev_opaque(indio_dev)->mlock);
 }
@@ -2262,6 +2263,7 @@ EXPORT_SYMBOL_GPL(__iio_dev_mode_lock);
  * @indio_dev: the iio_dev associated with the device
  */
 void __iio_dev_mode_unlock(struct iio_dev *indio_dev)
+	__context_unsafe(/* releases mlock */)
 {
 	mutex_unlock(&to_iio_dev_opaque(indio_dev)->mlock);
 }
-- 
2.43.0

