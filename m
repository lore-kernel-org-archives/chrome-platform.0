Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680691;
	b=R3+8UVU3HDJpw8GogTO+wRpdD9VChDSH+h8OiKnKhXAl8Qish9UGVgsP3ESMLRRDKHjD
	 AjBEW/V8cyjujxiCvRF0B9zOcW4N+dgq4SXeiD/MPjaGBtjo/JqQD8gyHBXc+NTyfONam
	 zKxyUi69Q4jG7YZfQ8TcgFaXsWPT5lbXyI4AppbCCmOoG1kslSH/kSb+HWuYSYSotXwlb
	 3DWwSfThiXwt53gek6QcmMsw7vTL0mNS3kkErbh8wTi/ndfqGrs/OoyJm+oP5aUo5QrXX
	 76x3RoqWpXfMjcsrGW9uw7tiQr+JUHJXVOAkQpivxK1FqxlQnKdomkT9s5W842BR7Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MIuVuN5S3A1ntm2yRRAwtrIs+TTbfraz8EmH2Z12duY=;
	b=arvL1rqrVybMTOjNwH0rUqMAPCzJTiFU7M3mpurqS2exNboo18IZQBw/6zPcTkAKUM1W
	 69d2BPJsLpdEAcTGHv4/adxqFlimQGkKNei97tMiuO7vrKPU8IzMPNkO7kSS3fN/wIs/K
	 zhk1W8OZE4Z3JO/9SdnqjAko8JHguqH3zpd9lxW9jRyxY/oyXEy/62ZCgz0vxlxbVtjHz
	 TpILsMkj7qcGaELLRvDuAaYzulh+coyk5WE78UKkHPVW6y7UajFMz5D+0GyTjQP8uRRkc
	 VQ5mK1wc67BP+6Ra4v6SfcOmxjJZDlb0ioAhZIRV1WEwtW3uw37DcPLtfxi2R0+aNrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=P0YR4swB;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB71C606A326
	for <chrome-platform@lists.linux.dev>; Tue,  3 Nov 2026 04:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB71C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=P0YR4swB
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e987a2ba0cso21421625ad.3
        for <chrome-platform@lists.linux.dev>; Mon, 02 Nov 2026 20:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793680690; x=1794285490; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MIuVuN5S3A1ntm2yRRAwtrIs+TTbfraz8EmH2Z12duY=;
        b=P0YR4swBogEdFYAKnc5Tk5zPPM+z+SmOeGRO029hVsDlp76sPC9lhpqDgYnJ0j69qW
         YVYttgnZX7sVxvNyW/VdXGLuoxP6YuFd5N9JmBjC0CNEh6waiDB4mzU9gU8n3BKiLKqq
         xL8l+bGRrPGk9694s0b7qvL7dbmMRA/BAlnCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680690; x=1794285490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MIuVuN5S3A1ntm2yRRAwtrIs+TTbfraz8EmH2Z12duY=;
        b=na05DbnwqhyVg2IyiLnazo8pxP+EiVeZMlR+m2WUecwRnf25ltjlLoBKv0X9hhEKw6
         k0qK3/LPXgBN6iv/P9pt1oqDaTpmw7IxzIyHhoVjkJcDxW1OWhi1kuwytX66zXaeKYOG
         2Mbuqzlvj7w63sIsbY5C9N4uMdRx64BhTEnKLnOaGCPeSR8TM7ICkcb9FCM0flu18sCn
         ej8Ds6TUlt1XcnKpFruSBeXXzdeEiZp22cxgCHD+tGC4P0W2XgCfxyD+bDhV19OVF6Bd
         Rj3S33KN2eScJhjl8DRFjaHILbTAPgdsIoouhYfysK7em4mmntf4YcE7dyuJ32wdZbwP
         SKMA==
X-Forwarded-Encrypted: i=1; AKwUvBxgA29TZtrJKaI25uPO/Ru+ZFBjN/LvqAZNRwtM27UT0bNm9uEYumbx3ycxW1OBQ7gESXKQKhoK6iHrI2kH7N4=@lists.linux.dev
X-Gm-Message-State: APuU4Z91QaqyWqlHfXhIB1moJDTA9GInIFRyzvDuCSH+SK+botWCUTIm
	X+0lEwE9Aw6r8V1foS63GwzHF0qEGLC10iSN/zBFNZ8LE3Jmul06FRDNwgnbD7F08sR1RGU8tOv
	D0Po=
X-Gm-Gg: AYBFou2xnKeDtOSjk4W+nBlXqZSaUjhUOUeuRCWBKDNRaurFJoYO7viLqMDJPEXeBaI
	jPEf/mTnQVLfS9wZg6mePNiwlsvq7yWaa9a9oYzLU9j4Xv6wyW47T1Aejl2ZII+sDI3mjbPpSmH
	575fZV1nRA6hRr5oic+V6tEi6HobJ89XajM2QCESc3zsEgWo7uYg1cT9eYqyAkzY6stuPgevmmg
	ANpVFtLnLTjcE81E3lb8dYcaBlb9CoSNK6W+/CO/ptCrV6p+BDw2Rvzszwyy3Ej034PQT6pZXWi
	NI4kdFJ75kmBsSKOVqBEu8Nh+dZaAMEszdqhK/j3joyemvdPgbyuKPrLMC4RXx9oi/NpzMFCkNg
	+VfLcHV+21qkxD8HFjtblCsuLOn/sto37/odt4YxAsoAJ62yDenVTTP1h03U5yAvq8gtM5zMzvq
	JM+3K5wi3YWddeYckY2BARqeCzj+gLqyLLID9iMYbGIw3Jwq3dz/QwKDvUqddINdDJhNH6RIVME
	czPxWODlKhWSIi8VjIa8RcsrzQOPorpTjpF5HHazHaDNLNEZA/YFOR68BbxYbAy93/UCGbq17Dl
	frKV+M932N9hEgXKqmwWQoUvVkJI/gRtI2kg937UaZ3xKzwxjt+iXK2HEKyLriUTFg+iA/4bpw6
	BrdUELUEioIgu
X-Received: by 2002:a17:90a:5d17:b0:3ae:898e:a123 with SMTP id 98e67ed59e1d1-3ae898ea1b4mr7369616a91.14.1793680690189;
        Mon, 02 Nov 2026 20:38:10 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm2072761a91.16.2026.11.02.20.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:38:09 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 6/8] i2c: of-prober: Defer regulator_disable() on successful probe in simple helper
Date: Tue,  3 Nov 2026 12:37:30 +0800
Message-ID: <20261103043734.2179858-7-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103043734.2179858-1-wenst@chromium.org>
References: <20261103043734.2179858-1-wenst@chromium.org>
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

When a I2C component is found, its device node is immediately enabled.
This triggers device creation and driver binding. The prober will hold
the regulator enable reference across this part. If the driver probes
synchronously, then it happens within this window. On the other hand,
if the driver probes asynchronously, there is a high chance that it
happens after the prober's cleanup function was called, in which case
the regulator would have been disabled when the driver's probe function
is called. This would then require the driver to wait 100 ms for the
hardware to reinitialize, even if the probe function was just a split
second late and the regulator was disabled a few milliseconds ago.

Recently, some of the drivers for the components that are targeted by the
I2C OF component prober gained the ability to skip waiting for hardware
initialization if the regulator was left enabled. This happens when the
PMIC has them on by default, or if the component prober left them on
after probing the component.

Tests on the Hana Chromebook showed that if the prober and trackpad
drivers are both builtin, then the time between the prober enabling the
device node and the trackpad driver asynchronously probing is between
5 ms and 30 ms, though sometimes there are outliers exceeding 100 ms.

Wait 100 ms before dropping the enable refcount on our end so that the
actual driver has the opportunity to catch and increase the refcount on
their end.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v6:
- Fixed typo in commit message
Changes since v5:
- Only defer regulator disable if a device was found
Changes since v3:
- Added commit message section showing average delay needed
---
 drivers/i2c/i2c-core-of-prober.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index 97ef58bb4c04..f52ab3f54933 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -238,11 +238,23 @@ static int i2c_of_probe_simple_enable_regulator(struct device *dev, struct i2c_o
 	return 0;
 }
 
-static void i2c_of_probe_simple_disable_regulator(struct device *dev, struct i2c_of_probe_simple_ctx *ctx)
+static void i2c_of_probe_simple_disable_regulator(struct device *dev,
+						  struct i2c_of_probe_simple_ctx *ctx,
+						  bool defer_disable)
 {
 	if (!ctx->supply)
 		return;
 
+	/*
+	 * Wait a bit of time for async drivers to probe and increase the
+	 * regulator enable count. This allows the drivers to check and
+	 * skip waiting for re-initialization.
+	 */
+	if (defer_disable) {
+		dev_dbg(dev, "Deferring regulator disable\n");
+		msleep(100);
+	}
+
 	dev_dbg(dev, "Disabling regulator supply \"%s\"\n", ctx->opts->supply_name);
 
 	regulator_disable(ctx->supply);
@@ -359,7 +371,7 @@ int i2c_of_probe_simple_enable(struct device *dev, struct device_node *bus_node,
 	return 0;
 
 out_disable_regulator:
-	i2c_of_probe_simple_disable_regulator(dev, ctx);
+	i2c_of_probe_simple_disable_regulator(dev, ctx, false);
 out_put_gpiod:
 	i2c_of_probe_simple_put_gpiod(ctx);
 out_put_supply:
@@ -405,7 +417,8 @@ void i2c_of_probe_simple_cleanup(struct device *dev, void *data, bool device_ena
 	i2c_of_probe_simple_disable_gpio(dev, ctx);
 	i2c_of_probe_simple_put_gpiod(ctx);
 
-	i2c_of_probe_simple_disable_regulator(dev, ctx);
+	/* defer regulator disable if another device driver could enable it in time */
+	i2c_of_probe_simple_disable_regulator(dev, ctx, device_enabled);
 	i2c_of_probe_simple_put_supply(ctx);
 }
 EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_cleanup, "I2C_OF_PROBER");
-- 
2.56.0.385.gac671c819a-goog

