Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A042E3A6F0B
	for <chrome-platform@lists.linux.dev>; Tue, 25 Aug 2026 04:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787632425; cv=none; b=ta7nrkgVddhnv5JBlNwEniqegZyBWTeJBrP7z0ZPjKLlr8aIXbRnF7FaLz7ESuwYK0jMoPB/ELJrsLQ1LCfkMJYYza8ipr4LVJ06ptANLPQ3a9Z3zCap8KjbXH0imAyrxdqSIkBLBBlCC6DyJMMi1tucaZBUx7/5RY57vCMs/VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787632425; c=relaxed/simple;
	bh=Ilgr0c2G4UGsySFV2bD0fiAVVF8lI3iPrBZ7oXN+Wgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZwWNB6cLaVOIfUuE47Dpw7njcCIPWQVRFooo1jZr33e70sULY7k2dWap7S/AZSr4l4ioITiEh1q4D215BKDJ7p8NYNBagGdf9VIIV8Mqd+HTy8U347C10wRgBzLkWfa4tKx+H/WNmvYVVOjUD1HyYbeT7eloCjTEprCdokS9BAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iVDIjl4x; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iVDIjl4x"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso4905685a91.3
        for <chrome-platform@lists.linux.dev>; Mon, 24 Aug 2026 21:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787632422; x=1788237222; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GFuutJe+E+uxqdXe1I5xllbey7G2lsjmwPbc3FHp/cg=;
        b=iVDIjl4xX94TYXV80QiLlP8CsVPPogNyFsm46bGDbPPUMvWGj6BWGWmW4z/b31kvbL
         u/sJ8gL3dyKERF0KGWB491KJdjGXstP1KkY9wI/cAT6TXVFrGxdxSWEo/mboXbb/J7Y4
         Zfqlox+hmPA79sCYVbQTNFLCFXBagHsFJVhsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787632422; x=1788237222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GFuutJe+E+uxqdXe1I5xllbey7G2lsjmwPbc3FHp/cg=;
        b=AS3SRc5o8EUo/wFctrxcdJJi7/bAMQobTdf9SxEPLhkq70TxD46gKt+S/yR9jx7XCM
         /uqBkQncBcmVOaZRg/fawzJiG0BqCvRxZDYlOPs/JMhd/03ngLenzUqCSDgxJzNJJsyC
         ROz2SdeSH7/DLZfMJZRAHHYPatrqZzU3KfBd6wY4jJM6Ppb1uppnzVNQQ//GW7lMAAYS
         VhhHp85I3Bny8eJX8FGEZXs3koApEwtceANasU4mOfGAvznpUaj7Ih+pRGngHU3ITM5M
         IOZjQHFHni/wfryXEGGEijTUaA08uzAVpIKTp9d+gMUEPjRk0KqRkgsimLdtktCrs9It
         J5cw==
X-Forwarded-Encrypted: i=1; AHgh+RqxCy0lBN7nf43U6WwjQKa4wvvVMt1ci8YVsLGa3Xl3tIBdZ7R4nMlXqlPVi3Kur/PN+SGIp9NQvUIdNJVYQBI=@lists.linux.dev
X-Gm-Message-State: AFuF++lHDrnba4eO0VpuM+5va4ZI1XkQq1S6m43JzstemM6veJx3ljOp
	C5oWwuTH7fzTEjSCwgyQgYp5e6wmBp4s9oV7g2UjZQjV2a/Klj7u6/Iyg9pCGSkGtg==
X-Gm-Gg: AR+sD12fZejunVPg2jx8HNm/nm6JlK66uysbYA2afd6kOxQXj38YVBsDljD/hgFKgWt
	udLzInscD24CEPouHHsVWd69p6ToeRM46EZbrMwoJ/9+YAcrvyvW5fZfmCzZ0jeGp6hOJlfWz8k
	D30HYcDKLEuHppqY8XxPJvAImTJdr4t3SQ48vSramaOdbkp8tLg0+6BY0zpmmg0RvVoRz2C2qzW
	XtiSfmdOyE4Ne/oW5d70OWQZelNlfyFu5KGohz3TE0PinPGaBeloLk2hIoH6+JhR9Cn1aWKyvGT
	xbeeRANzvG7wYEG2VKoAKX4vPj+/LKZPONKkIOdwht29gUtHuSgSOpctFmiusi74c4ChHsFjurY
	ngo1BqZxPXj5Oyoh3wBaA3g0JD1Dc8FR86nlWSzxaHiBatE2ETvb7NSz6sAPJU56ufhwdhnTpZ1
	RJP7NzD95mj0PI/EM5IQZcegromSGAFu9LjRZFy2fSOeMuw4nWHvhteciNZQygKo3xt5iw781aq
	ke05ZKZHWberF7F5E3KQkEWJzGaxizsqik7qsuDXaj0efVDeL7hTxVUzw==
X-Received: by 2002:a17:90b:164e:b0:38f:2168:b9cb with SMTP id 98e67ed59e1d1-395c352fa60mr48644179a91.9.1787632422068;
        Mon, 24 Aug 2026 21:33:42 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:a442:9780:24da:cb4e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396458212absm2187823a91.0.2026.08.24.21.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 21:33:41 -0700 (PDT)
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
Subject: [PATCH v5 3/7] HID: i2c-hid-of: skip post-power-on delay if powered on sufficiently long
Date: Tue, 25 Aug 2026 12:16:21 +0800
Message-ID: <20260825041628.988369-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.860.g4b6b3295ed-goog
In-Reply-To: <20260825041628.988369-1-wenst@chromium.org>
References: <20260825041628.988369-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some devices the HID device is powered from an always-on power rail,
or the power rail has been left on by either POR defaults or the
bootloader. By the time the driver probes, the device most certainly
has finished initializing. There is no need for the delay.

In such designs, the system integrators tend to work around the delay
to avoid the boot time penalty by simply omitting it from the device
tree. This is undesired, as the device tree is not fully describing
the hardware.

Switch to the new regulator_bulk_enable_and_wait() function that makes
sure a certain amount of time has passed since the regulator supplies
were actually enabled.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Switched to new regulator_bulk_enable_and_wait() API
---
 drivers/hid/i2c-hid/i2c-hid-of.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of.c b/drivers/hid/i2c-hid/i2c-hid-of.c
index 59393d71ddb9..fdaad451e710 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of.c
@@ -29,6 +29,7 @@
 #include <linux/of.h>
 #include <linux/pm.h>
 #include <linux/regulator/consumer.h>
+#include <linux/time.h>
 
 #include "i2c-hid.h"
 
@@ -48,16 +49,14 @@ static int i2c_hid_of_power_up(struct i2chid_ops *ops)
 	struct device *dev = &ihid_of->client->dev;
 	int ret;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(ihid_of->supplies),
-				    ihid_of->supplies);
+	ret = regulator_bulk_enable_and_wait(ARRAY_SIZE(ihid_of->supplies),
+					     ihid_of->supplies,
+					     ihid_of->post_power_delay_ms * USEC_PER_MSEC);
 	if (ret) {
 		dev_warn(dev, "Failed to enable supplies: %d\n", ret);
 		return ret;
 	}
 
-	if (ihid_of->post_power_delay_ms)
-		msleep(ihid_of->post_power_delay_ms);
-
 	gpiod_set_value_cansleep(ihid_of->reset_gpio, 0);
 	if (ihid_of->post_reset_delay_ms)
 		msleep(ihid_of->post_reset_delay_ms);
-- 
2.55.0.860.g4b6b3295ed-goog

