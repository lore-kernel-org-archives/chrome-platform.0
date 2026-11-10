Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347773;
	b=M6tDwGFWWlzARgjDQpZcV67KaPJWHfyv70wuOnMUsJJuzBwrRMEG6PzluYQnIRssjRlj
	 /QsP4+3OpcMQ3BusBaA2x0mK1rai1uG3OgcBLqF7UK2hm6CEedIHDEVpZhALpiHB7sRSe
	 qK+HHmuyKbTkT+a3Ox5am7zptpNzFRHejLgTAmW5Jl4BCboqa2cy8dF40QIWmLOSK6LS2
	 eA6SkLVlo8TRoxwc6X1YV+ijNUHrfRpCjQu/84A1lN9fei2iktyHKtk5bv2NKXiY/1aKH
	 rmnyxUjjPoII6YT0uS6kPAPxUcN/P3jeGXTZiVwA+9wfGdNrAkamiAmYx6MRpyHsS8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=/bU06E1dTu7o82eVh0tv/62NUVUAMqK4tBifVC8vTig=;
	b=i5TNlDmzr5i3bVzpfZ/pEKdteOHlS3wJdCIA0dN38D7OYHOBUxSYBJ4LD4eeC+WzdCIh
	 qlofEHzT6NXqX4uQTx25BcR8Q2yfOM6TpEHWCaPRgXkq/Z8DoeNWzc5vWgXyYLqStnICK
	 7zaJL1y88q4kH+1ps2FPk8xlWj1Y/7BNZcssTUslSiq5nclfuXmRXEVGaXLQkhVAPRM0S
	 TnFCRHwNeEUI1nRuz7pmdKcbEY/xDXmuNAOWe/tN2R0qxAExKg7qe6TKyekMGM4XMdAGr
	 ULrZPHdcdQTeVIZGoGuy7BVt09nmsxvOEg/yRIdCE63JuVM7/UGqqHnoA3ywwr7IFuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=V2sEgv9w;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D44E60A3837
	for <chrome-platform@lists.linux.dev>; Tue, 10 Nov 2026 21:56:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D44E60A3837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=V2sEgv9w
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so1701966f8f.3
        for <chrome-platform@lists.linux.dev>; Tue, 10 Nov 2026 13:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347771; x=1794952571; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/bU06E1dTu7o82eVh0tv/62NUVUAMqK4tBifVC8vTig=;
        b=V2sEgv9wTxipZf+QaCyXcLsbX/fSlRDy0gTRwWBLhb+Mh/mHaHh3pc5dSznM8gbFuE
         9L00rZWzaEdBtq2C7l+Kh4UOF+Azl9sWX0i2CC96Y+/Q0E4zJA/Xhe2FdJPbKyGEmgvE
         DZ7Auy+qTa0H2FGrkXoJIYFiPLZWT/bKxC4HJ6d+3OsMEyjIZ24wKS2VhdhWNS1pbwS1
         5PiBQP9ZeZbK7MWV7YwYgD1iWDUINQMP4yTXociaizu4vkugkzTMvx9FWPatuw8R+b6X
         6UBdytDK7V7TlKezaW4XAUQTTO2KkMH4ns6f8ewysXKxNzoqu58zImKwOeBunOeLdy/D
         mFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347771; x=1794952571;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/bU06E1dTu7o82eVh0tv/62NUVUAMqK4tBifVC8vTig=;
        b=FGl/xt+gQ+NmpVdeqEWvTQCV8+qVlIzjkySiEgT20liSmY3E1Ry6DMmyl/1jeGJSeb
         EVVRLqNDGmcv0TGQ5d8Aibp5zIafQeWYf0QKY0xWtPx4JGToWZhJT4LIWEII/jbdpTCP
         GWCfG2xc/E+6EN9eijU7W1GtyTNFWarHhYkI9Qu+eC/pu7t4wFN1PXGx1Zq3pt7n2LeE
         BYRGVefM8O8KQLwKhVEeQCU8/ITRyCksU6+O9PC4MIElrO6Ojq7C/Cp1HshyxrD2a3M7
         fTZwBIFZXwI7vz9rzxfE5LGo1dqDYOZgcXaSFj4lcp+yhqsbcDu1OlA+hnkD+F990qqh
         uR1w==
X-Forwarded-Encrypted: i=1; AL+hErFfc7z8xvL7MAxeV7d+be4nCsHqFAVBXOy9J0KMSKPd0jTEw3UzaUFXOW/wLt3lwhoJ/lNgLqtFTYKieu0lppU=@lists.linux.dev
X-Gm-Message-State: APuU4Z9XWhkBID6u1MBtEZY+8ae/5KNtz8DrufMwYEKNseNRgiCoB6OU
	rydviJRWHg8Qc/mGta2YQSggTSrdWWN5MLokmz+q6M7wq/LeW07SmRr+36+5Rdi5Uj9yRM2UEup
	2BAvh5bg=
X-Gm-Gg: AYBFou3P2k+QAEvbvehFHYFQU4O3dkMwkUoH6+/KgeMUUoZF/ZDemO4pV+kwDGjErQz
	ZSWnKzW6wOmFlx80BFBonn4zJcpoLpoVcEBz1jpAFwYfl8TNRry+g2cW4cTkB2ZgfxFm4a7bc1p
	1GKTcy/L0e6zPs2Q/HAMqE2/rvKG7uRZ8MSnV2TjApKB6ZuoU9zB3Sv4h2rZxKwc7sREEDQcl2a
	khvgx+4S2P6T2iGKrwimmGuwxaJDCTFRfDfSXTJIuIOuaQ7E9gWsIKTCR8I2vG1L8KSO5OQcae6
	vuLNbNuK+Ve6QohoixRiT7ikJseSBQnIsQqqb8aIkJFH1uBJK5N9Q66a80yPE6+tQOCXdT6gOTG
	C/FUa2TuxtWWSBDG4KIQvQbau1jSVa8hlrKmQsmvHnKO4n3eKwOJTeLxkQ5QaumlB69M/RCPgW4
	45Lv8gISDC6bDnoTh/e4R0YMikk8Ps5Q9SpI86+LyqRvXp+QonaW95zK/pHnB0RTESzO/evNXHX
	fXCpZq4W/n4uk6pGFkp3qoRvD4rOnY6e68GlxX1c55lu+YjRZw3Hb1a88Pz377wkNEscvG9EJM0
	d2+QOdEEwgtCMSOp9Om3IF6zuJ8jHNr/PQ==
X-Received: by 2002:a5d:64ed:0:b0:48e:6f76:dea2 with SMTP id ffacd0b85a97d-499c69cb701mr366245f8f.38.1794347771565;
        Tue, 10 Nov 2026 13:56:11 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49835858f26sm7338595f8f.18.2026.11.10.13.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:56:10 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mfd@lists.linux.dev,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 09/20] mfd: Drop unused assignment of platform_device_id driver data
Date: Tue, 10 Nov 2026 22:54:34 +0100
Message-ID:  <9bf8e674ac935547639dc6f89fc0aab5ac826db9.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1410; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=2UUtn/8z9q5Vil/qWmXv1wRJuUXUGptLBomjMZQsNCo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq85K0kB+I64ERD0hCsZyM86WO9lk/0iKPumZ0d RCE1dtnaRSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOStAAKCRCPgPtYfRL+ TsofCAC0U2NJpKBqUl4okY4yooT3RlrkPcLeu3peOyFH4ZcFWAIRXbvvYK1Rm8+rb2RqhkOd8A1 sc0aSu4sqf/Uwz35Y7wKCOWUS7OFm3VoUfj77VKhXpSUf0LOXB9IZN0tf4CLIZunj4gS8e0YU/Y 736EXRz5MHk6g+CxnOLM/4N1iIVK31WRGBx2V2XY41wue/5cWWHY/TSL7lyU0Q9y1YPbKnd3kz4 yuJYdJAnaJtqydkGzFGZmtJeTHZauzOGUevEieD/vdxCKTlYsIBIfOqgOTr+AWvxgcAcQw+pNue UyErdr8iUXRmfPkuz0yG6yHCdwBgMmipkoax9/lKTDAr76TH
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The drivers explicitly set the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop these
unused assignments

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/cros_ec_dev.c | 2 +-
 drivers/mfd/mt6397-core.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 529a23b804f7..96aac158fd8b 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -379,7 +379,7 @@ static void ec_device_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_ec_id[] = {
-	{ DRV_NAME, 0 },
+	{ DRV_NAME },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_id);
diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 5d5f816492aa..e74936ac206f 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -435,7 +435,7 @@ static const struct of_device_id mt6397_of_match[] = {
 MODULE_DEVICE_TABLE(of, mt6397_of_match);
 
 static const struct platform_device_id mt6397_id[] = {
-	{ "mt6397", 0 },
+	{ "mt6397" },
 	{ },
 };
 MODULE_DEVICE_TABLE(platform, mt6397_id);
-- 
2.56.0.rc1

