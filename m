Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680673;
	b=y+15VgSURZu/R19Svx1LLWa8e86XZd5hrF3Y431tESWjTWsPLoSde8YzsGGMOEogqb6U
	 YrWlUz5ArM1G7uvOgI2ulo72VKr4LTUAOGZnKP7KestmWRUt45AUcTAysE7XjmgDvt+xM
	 01asOhnE7p4Dfawo0g96xniLlQrwtMLleBsJw99KLcwE+i8ueY/+25BRJOwpttVwvQ90l
	 0yGGqYjzuR8OnhwXtvb9ne6uNhtBB0ISDyCSelctga/2bT5+1UIr/BAqBRAitptmYYpLC
	 QZAsKPqhpZGGxqk8lUZs95WeZ2Vmwm6M6GHrp7HiCyTSOKzFP0uGa66dfh/r5fMUZmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ggqaj3bggsrUOqnPqyXrXYqxV+UfImDX5TnRZxULpTQ=;
	b=ihKFbJzl2MF9VlBvPYZNnfyfRHaxGwUPL0bUGr8+5A1hamvzgkwlcDPdw6kSDarHYioq
	 zab3cVtr4UN5DyIkMVV/tvKiOBL/rCcpheSwXOGqYzRdD75vxUs0t+ekMON9cP+TGMqaj
	 z5DgnNGNpfT2w4MYej0eX6/FboJ2FoLgYZpioN9vRZhQgWjsnHIyCAy1YjlRKhdAAF1iI
	 5S/SQL2snH7qLHhh3+vhHwImloAHRn5MMK5b2wPNaWZznkbSUyrZA9/ugHkfKXeQimI/G
	 7hLESM4mMBw2wV8yJPVMPXnUDjLmJ6F5Q77u0U6BDRfKD/O3w43mU3NHTCzcWiwOECQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=N7SDM8+D;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F186606A32E
	for <chrome-platform@lists.linux.dev>; Tue,  3 Nov 2026 04:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F186606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=N7SDM8+D
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so3142091a91.0
        for <chrome-platform@lists.linux.dev>; Mon, 02 Nov 2026 20:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793680672; x=1794285472; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ggqaj3bggsrUOqnPqyXrXYqxV+UfImDX5TnRZxULpTQ=;
        b=N7SDM8+D0uj8KvO4YeY2smGxsN4m23nilYfTm1FsOw/ETBjGC7RwCVDM0NrT/Dmw+/
         nEroMbLRt8M1/2f2COmx++H/o66Pa4f9nQ7WJBpjT17S0VaQowHyMvkHYCmKeOR4diSq
         kyF/ZQIEgQrN8KqiPnQUds+R8TKMteZ7CBq0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680672; x=1794285472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ggqaj3bggsrUOqnPqyXrXYqxV+UfImDX5TnRZxULpTQ=;
        b=km3iw7DZz+17Zuc+Hhdl3mJ5u9jhrvc+0Q+q84rB+tamDB0Xgxgsd1PgHNuZbnpEv2
         6mJ/oTO77CD+7BdoFspK/k1cMoEcmeb9VyZfbUOr2it9fKCFNQ3gDsrY8hlvabUYx1VK
         5KZezHrlNvcn8u6EygCn2pAKJCmgUrDvSj6TxRdELm6MU47Ve3rPr63jxt/y/k5vAfQK
         mbiNcjF6NRyjcm9TEe4aNfCWjzYzQaH8b055eIkWOrFOh6eUpujnUapVFVP/DYLMi6iE
         ULdeXWpgImYuPet9uRNnNw1BiCRzeboYgkc/LoDifeLKLCvZZyZS2WOoIRKCPy7S48Bg
         fdGQ==
X-Forwarded-Encrypted: i=1; AKwUvByW8ysQdekKrj+oPYqHLFJHjSSPDvPMS7is7PWS56Q+5UJudbi8Cw5IDzkfDzZIsLcQvV34eelcnRkiNZ5bqRw=@lists.linux.dev
X-Gm-Message-State: APuU4Z9BJZ9Eq+Mdd8JZ/NO0/zh/GzkAJM417UQHeSFYIr1xxpHLcDkk
	Wh6/3BN4mfoZDElaQ7AiG30mczr+kQQ/G/R5R9dT5TBlSvxjW4j6gvdkA+Y7hKBYeg==
X-Gm-Gg: AYBFou0Asew//GdUbkqsZaA7f5bX84nLdSa53fKAZunG8Iy+39HSemgbuwUnoUUP+SC
	oOWighhCFH7Zcr3EG6Lzfv6DuKEdYfMPDF8aWbBCohPizsjZLBwAlZUJoIzsjO8ccwYJCVlKQcX
	RIDvk2damnrjCH3n6TqDO4Jxya4ToJif9S0S0esDIdxJZ7IUYXtSNIo9s8XiC1l6ccOOHRPDMAC
	jVcRufaJnMqDJB/8WW/sXycZkGIhgdCMw7buaqA8a6Tn/N2JdyZ1qgtUoishaBxmuwyD8dOzwNZ
	Oh1ose0ZwrPMapNNZibtU/0BL4toGfY9gb7f0ADRVLiHvVECCXr8+P7S4VQ6FRx0UsnB8Qr4I+0
	MtZ8MquiMNGNdzgwgWDM1UHTg/fZFYHOHIXaCv27doYJyT7n6JIe0rK5VCEez0mdyahSA7pVdvb
	VXY3sm8IgLxHwjimzQieExLZf1aBNfAteQqP0cZDDWh7hwrJhQWoGv0RgmBGMJOmIVv681iIhUx
	WLK+Fr9MJzoNhoyiERmAvNXu3Cqz7LGSo4ac3TobtHOvgUC1OeEhvZyNbgwW31LhNt/bH1HgUPA
	T0tep1YoSelw5yVdN08iPobGXkYDb0JXkBPmgt1Ol1713TZo/YsZWVpva0VX9QjbE4pz5Lgj5Y8
	did7hw8QjKpXu
X-Received: by 2002:a17:90b:562d:b0:3ac:8527:3fcd with SMTP id 98e67ed59e1d1-3ae898385a1mr9902090a91.39.1793680672423;
        Mon, 02 Nov 2026 20:37:52 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm2072761a91.16.2026.11.02.20.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:37:51 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: [PATCH v7 2/8] Input: elan_i2c - Wait for initialization after enabling regulator supply
Date: Tue,  3 Nov 2026 12:37:26 +0800
Message-ID: <20261103043734.2179858-3-wenst@chromium.org>
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

Elan trackpad controllers require some delay after enabling power to
the controller for the hardware and firmware to initialize:

  - 2ms for hardware initialization
  - 100ms for firmware initialization

Until then, the hardware will not respond to I2C transfers. This was
observed on the MT8173 Chromebooks after the regulator supply for the
trackpad was changed to "not always on".

Switch to the new regulator_enable_and_wait(). This makes sure that
enough time has passed since the regulator was first enabled, satisfying
the power sequencing delay requirement. This allows the delay to be
skipped if the regulator supply was already enabled by some other part
of the kernel, such as the I2C OF component prober.

Fixes: 6696777c6506 ("Input: add driver for Elan I2C/SMbus touchpad")
Cc: <stable+noautosel@kernel.org> # needs new regulator API
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v5:
- Added noautosel tag

Changes since v2:
- Switched to new regulator_enable_and_wait() API

Changes since v1:
- Delay only if the regulator was previously disabled / turned off
- Link to v1
  https://lore.kernel.org/all/20241001093815.2481899-1-wenst@chromium.org/
---
 drivers/input/mouse/elan_i2c_core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index f5e505edbc33..4bbc6cef8be6 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -36,6 +36,7 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/string_choices.h>
+#include <linux/time.h>
 #include <linux/uaccess.h>
 #include <linux/unaligned.h>
 
@@ -47,6 +48,8 @@
 #define ETP_FWIDTH_REDUCE	90
 #define ETP_FINGER_WIDTH	15
 #define ETP_RETRY_COUNT		3
+/* H/W init 2 ms + F/W init 100 ms w/ round up */
+#define ETP_POWER_ON_DELAY_US	(110 * USEC_PER_MSEC)
 
 /* quirks to control the device */
 #define ETP_QUIRK_QUICK_WAKEUP	BIT(0)
@@ -1260,7 +1263,7 @@ static int elan_probe(struct i2c_client *client)
 	if (IS_ERR(data->vcc))
 		return dev_err_probe(dev, PTR_ERR(data->vcc), "Failed to get 'vcc' regulator\n");
 
-	error = regulator_enable(data->vcc);
+	error = regulator_enable_and_wait(data->vcc, ETP_POWER_ON_DELAY_US);
 	if (error) {
 		dev_err(dev, "Failed to enable regulator: %d\n", error);
 		return error;
@@ -1416,7 +1419,7 @@ static int elan_resume(struct device *dev)
 	int error;
 
 	if (!device_may_wakeup(dev)) {
-		error = regulator_enable(data->vcc);
+		error = regulator_enable_and_wait(data->vcc, ETP_POWER_ON_DELAY_US);
 		if (error) {
 			dev_err(dev, "error %d enabling regulator\n", error);
 			goto err;
-- 
2.56.0.385.gac671c819a-goog

