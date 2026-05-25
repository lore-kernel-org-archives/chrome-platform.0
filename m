Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84FA262FC1
	for <chrome-platform@lists.linux.dev>; Mon, 25 May 2026 01:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779673201; cv=none; b=qzTj5Tl9jV/OWKg0yVPvCYDHtbEgYWynDM4JCyq/950Z81qkYhhDAu9vw1nQHzqBLRPbUbBS+BVmE/lN8z7n3IlAQ5L7aH2ss/k69F7t/K1LPYD8r10/nC+gI1Ap1SGdZsEjk0pCgTP1WxStsiFNYEsiHZ5vP84t+H2X5Edsx3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779673201; c=relaxed/simple;
	bh=YS6jCjPN/UIoggB95tUfxTv9uEHe7AlMRn11CmiFLdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F+FCeQ1KOXyjNTZsneU6DB54ru7rQHvwo7W+ohUK4lYPfFTUBQYYZ76xyTxRq5SesWQzeh1G1FOWaIV6XZawFPWJ6KrFhDUz8eFvWkeIRHcf1/3GIT0HowjFzq5czeEXyb5G0zAN3f7fHorTcpaEBu+8V0x/tyYujtK4TflCqv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Y3a2dctA; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Y3a2dctA"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7e4de538f83so5186278a34.1
        for <chrome-platform@lists.linux.dev>; Sun, 24 May 2026 18:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779673195; x=1780277995; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9XIM9OnRzGFA/35nH6Wlvv7D5+fTDWpMhEIG9GUqhfM=;
        b=Y3a2dctAUuUhe1KpedMKOnA7kteS6fxJiYoUFsxICquHVnFv2wA+tmxUQp+iILijzw
         J93IR47azONPf07ED/9JuWmyZeD/vRnw1jb7Xyoy4xp41aBTKajlYbUavLSSa7BR9AAB
         X6/ZBLj/6puMTVVFs1ZGoeRO6u7zIr5iX5l7PWUFtqSPWK3LoT4ZbxScq/fplmZx404F
         /ChhAzcuWh3T8AGNS6jbERiGSWYrNue6q4BH7D7QGkETSQOtDJzH+geJaUk72875xcOF
         vzvahYdYWBo5Ow2YikCMIgnbv4QXA6NZPqzwquz0F4suU/S3lN7lwlozSP35LdO+sKeg
         BqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779673195; x=1780277995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9XIM9OnRzGFA/35nH6Wlvv7D5+fTDWpMhEIG9GUqhfM=;
        b=TSOnkPmIKpucnLlRQ2ePW6Pp9WneLbGrNuJ/xnRn/QhyYOJuoj6v1c2ONX7sycwaME
         agcBdUQv/cmO+Lhk82DV6Hd6ieuVDBKXVl3EZsWnkJsBujqvih/aW2pU0IqV9dPg66QR
         IR4dLIOjYh/r1oad//az6NfMS9Y8SPxUxoeAPFe3zweBOcGFQ9WhDia7tqAOrRPk/LWB
         /YfiS+y0ucuWBnW+rIPkFS8BVMyOME56e4rTShyPV7i1oQxYmJReIUY91Qa158a4ya7y
         2BD0pCNfhdj8/cCo9Pv3vRjI02rG2MmGWq5znG2luUmvmyevR3ZStlwd9hkdvr0DKXxB
         4b4w==
X-Forwarded-Encrypted: i=1; AFNElJ/CXHrcd7LOMRe4/XrUTl0wgS3Jl4vOTKeKoCVwQFrPmls0mlj6H3p26bmUwYZ6eo5yYupYMWUkvUShalaaozA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxsND6Kd+25OlCYadAQNuCHIr4QeMO1EPBf0pHCOwi8TC56WzXy
	E+Ki7cswQiO+txiPuRQVkO4gWcCNIG77Yf6S3e/EGi9gWOhWXAy46H2Ebo9kXVKPFVM=
X-Gm-Gg: Acq92OGIMiGsjc0ldWOGDEmPv+7VQn5NXGksEdAJnk5qp8D8ymHKLyPzSa8vO9EtQY7
	/6Lw/fGqMaZM2hFJG7HG6VmD9tATivg+caUloIA6yb25pEmb/JMqp7UlhnaDN3NNmGcyJUbrRn2
	rqG1LLwc3Ys3fDhwWfw/IwiL2nSvGlqgn7DFAcy3V11w+LEz/jrJ6ZrNgpW2vgtUpH/s1WGlGZF
	vpK+cVB2UWkiPjnb8l5FwmRRa/1Zx6Wx1++mwx7KRnV9ZY/WV3RE9nVkltONPAhk+i7oTD8CsAl
	jB1laqtT7QGoHqYCiZdVn6whLq5Hv5L8uxeB7PZLxpZP82bgV2eA0/D0PaXr921now1s8n2l8oM
	PrnYIcCe3ns2kK42dRkPF1IrnjLOBODcEo2rlQEhcBMiVAdybFejAJiMrxjUZDGLXozwII/VNa/
	ZEA8VD/oZvhvsBxcD3uzFrg3xR5NDG
X-Received: by 2002:a05:6830:2b28:b0:7e5:68ca:8856 with SMTP id 46e09a7af769-7e5ff0cd9a8mr7659996a34.26.1779673195498;
        Sun, 24 May 2026 18:39:55 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:713b:3006:84c3:c1bb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6060b2dffsm6250206a34.0.2026.05.24.18.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 18:39:54 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 24 May 2026 20:38:38 -0500
Subject: [PATCH v2 6/9] iio: adc: stm32-adc: simplify timestamp channel
 definition
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-iio-timestamp-cleanup-v2-6-c37c9408b7f7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1071; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=YS6jCjPN/UIoggB95tUfxTv9uEHe7AlMRn11CmiFLdc=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqE6hFHAQyCONXja9H0qJtqJqKBq0yFqO1V5bYl
 UUyScLbRw+JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCahOoRQAKCRDCzCAB/wGP
 wErzB/wMCUV6Kulh51VMVLYxbDxRqv2BQZyM4BEr7RGpkMe/7Sr5HhXXNKGKeXJlc5yf57l7AsA
 vEsbN8YovaCmH8igLt9085Ee1QmvXe7rqmLPxILVsisABoUotxEWojib1VpHUyh0y+5oKbvCkFI
 un9trVfnhd2Fkr/rMxT6n347Q6AgHgxxzlckMEsMl8COcXXQGhHNuk+yxIcrU3Pom7uFoleeXXb
 ZLcYLd8BJMp+OBmBH0kreyAOK7vuqjllPoTjNkQnZRLUYY/HtjMCQGYwC6UZm4XYtO1aP9kGOyK
 JJaCG5ByQgdUjZh0Z6DER1eRR/h5VNepua6TfjsZTrje3fw8
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
manually filling in the struct iio_chan_spec fields. This makes the code
less verbose and mistake-prone.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/stm32-adc.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index 46106200bb86..5c5170b19b56 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -2443,15 +2443,7 @@ static int stm32_adc_chan_fw_init(struct iio_dev *indio_dev, bool timestamping)
 	scan_index = ret;
 
 	if (timestamping) {
-		struct iio_chan_spec *timestamp = &channels[scan_index];
-
-		timestamp->type = IIO_TIMESTAMP;
-		timestamp->channel = -1;
-		timestamp->scan_index = scan_index;
-		timestamp->scan_type.sign = 's';
-		timestamp->scan_type.realbits = 64;
-		timestamp->scan_type.storagebits = 64;
-
+		channels[scan_index] = IIO_CHAN_SOFT_TIMESTAMP(scan_index);
 		scan_index++;
 	}
 

-- 
2.43.0

