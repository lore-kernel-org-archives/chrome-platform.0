Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B10F442FD4
	for <chrome-platform@lists.linux.dev>; Tue, 11 Aug 2026 12:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786450849; cv=none; b=jmlQx2O1RUpQUA4M43OG39fsECKvdYN+88h0d736Xj/AjKSFkXB1hf4VwXx/14y3hCkWa5LDwnHe7YzBSdychIGysq2AR5oY/Sd9azYEuo7ZSF8LHsIgVyZFygZb+CUwzbI8K8TI4Onn4Aav48seS6iBIWX7SlURG+HTRogyne4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786450849; c=relaxed/simple;
	bh=tRbezXAeChB8yAzXWfWX++wNhT7E8rc/SaVPrOaXwTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OqOTaeLmhVpPr2cwHod7lFMdR3/Mw0eMOIvh3lMMw1+6+ImgbsjFe+egbp2coLDjBEFa3+UBjMon+DiaNOkmJN0tndI8Gi8zZ8CPfgDtl/M+T9WjgDZdTFltX1NcnnBxZWR+b1mLgfn1ZmAdnDF3f6DuRAsTgQolf8rWyFoSFxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=B35agMWM; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B35agMWM"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbb7926836eso2121732a12.3
        for <chrome-platform@lists.linux.dev>; Tue, 11 Aug 2026 05:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786450847; x=1787055647; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7AY/BjzRkfyU3t+6SOkz7/qVT24RkrhiWULr6d4aAG4=;
        b=B35agMWMFbfywJo1NsD6CdZYNqKIb4rF4FlydqhHm/dnCLsc4QUmNoMzgUIdljosGz
         MlxnOF8CwGj2Rt3HHzGaBwR53OYsZyC7COzw5o1D/WooFWJdSCVp/RujtlhvrbTptVCc
         E7uulmFsLu2H8PXINkqWRB9BBJ8mV1shnWRVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450847; x=1787055647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7AY/BjzRkfyU3t+6SOkz7/qVT24RkrhiWULr6d4aAG4=;
        b=RF0pyqusZwT9IsQdWXf+IEY+O2/UC8YhUEWCaBrhwMhWgOdrjnzdPH/WkkIGzEgZd5
         +9wX+pxnf1pQBFl0R6mdK/Iti2BJdoSAtU8ofQHVpZIqhnSnZYM/ZW86olSSEVQYrPHu
         ShstmDo6dSij3nrJoC5BeINKM2wkqeZW0LBKcgNouTKSgjzTqmLWHoKE7f0xN67otOoQ
         SXl/lSQspcwPENj3t3s90G2Ven3qNEc7dmjwNAMD5ofz3N2iBxk9ofkAaKPqfPzuQoXK
         kUCXGc0W2YzeQfDVivIs/9N1ry30kRSW7uoqm6xSDqBbFE4BTumFY9iAPj6MtRSXQsPd
         uB0Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro0R/4S1Cw9A0xtgPsl5vkmqNLke7pVQXe4IRuGhy0OrRIwVjeHkRimMth/C4Xvda3Jx4QQ/4BI0LHc7wDPUdM=@lists.linux.dev
X-Gm-Message-State: AOJu0YydWuf3I+OdfNb36g0Xfdw3qNjhSSHakZiyjiMFGWGBmSLj4OOi
	VDA1QmQ1fa3qQHq4yZrSvTie2h+AvqHiU8KRtH3zYiQtVb52meCmaNDWjL4zYNUl4w==
X-Gm-Gg: AR+sD11lHrV/J8hHG9ecM4L2JzfimQDkoCNPZAL5h6aYXIa0aHG8NVn1A3ov9y7GyJY
	aqOzeB1yQ/KRcgFP1WTpN4C8LWrzcP1ugtME219SgQkzXukTN6vV/qzcjQprVGp0T+JOo/+ByCB
	f3GsqhfgOYZlEYRUgJgBPaog+YOBpede1ZkZnSIAwvHMTVQRVi4pd8RWIZtECqIfmYq8H5P3h1T
	mPI8ZQjZ4f14xShqzuywr+7o1eqoJLy3OjQwDAjoLNY9yf7Ni/i8Rnjbr7GnbC0o1azJZEyMIh2
	FiTD/91AoDNc8fW29EUzL6Vf7Y/1qGQyIgh9qe2fFWb4/HfEqBD169/nv9W4l9KJds/EkPxW3vY
	n8OMRhPEHkZ+4S32y1iA0kV3FZyJD3bulWe68RxLBIs1uMCeJQiXxoHwA0Z4qkygiNnuOq1NnYB
	fBcEgv+E40r17iTfjb15lvtTPhi0Q7Gze4ggNG0SnqLKCXPKe0ZeHcuVulZ/FkIR3LcjWQqtdr0
	IgpnUswJShg4BrolELso2pTnJudC6jLOLckEJcLqlHFsA==
X-Received: by 2002:a05:6a00:6ca1:b0:84e:89a:b8ec with SMTP id d2e1a72fcca58-84fa86ab177mr2896532b3a.11.1786450847047;
        Tue, 11 Aug 2026 05:20:47 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:12e1:df26:6add:1ea7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa9574e9dsm662454b3a.54.2026.08.11.05.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:20:45 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/9] Input: elan_i2c - Wait for initialization after enabling regulator supply
Date: Tue, 11 Aug 2026 20:20:03 +0800
Message-ID: <20260811122011.3539250-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
In-Reply-To: <20260811122011.3539250-1-wenst@chromium.org>
References: <20260811122011.3539250-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
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
Link: https://lore.kernel.org/all/20241001093815.2481899-1-wenst@chromium.org/
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
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
index 9f024a435dbf..77885930bf9e 100644
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
@@ -1250,7 +1253,7 @@ static int elan_probe(struct i2c_client *client)
 	if (IS_ERR(data->vcc))
 		return dev_err_probe(dev, PTR_ERR(data->vcc), "Failed to get 'vcc' regulator\n");
 
-	error = regulator_enable(data->vcc);
+	error = regulator_enable_and_wait(data->vcc, ETP_POWER_ON_DELAY_US);
 	if (error) {
 		dev_err(dev, "Failed to enable regulator: %d\n", error);
 		return error;
@@ -1406,7 +1409,7 @@ static int elan_resume(struct device *dev)
 	int error;
 
 	if (!device_may_wakeup(dev)) {
-		error = regulator_enable(data->vcc);
+		error = regulator_enable_and_wait(data->vcc, ETP_POWER_ON_DELAY_US);
 		if (error) {
 			dev_err(dev, "error %d enabling regulator\n", error);
 			goto err;
-- 
2.55.0.679.g6767b8d81c-goog

