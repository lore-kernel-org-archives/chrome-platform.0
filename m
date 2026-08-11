Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40E64457D5
	for <chrome-platform@lists.linux.dev>; Tue, 11 Aug 2026 12:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786450868; cv=none; b=lLVByL/Us1ULyR4r2/Gw1TuSO2uaGCmEBbdHK99Y4GJzdwCp/bYF6Bu2kP9wq/tSubj5uaIVJwbtZKDL1xiJyxIvYyQHwgKjO/TqzGnzpCrPf8JTV1qWV8fyJr6w6wBZa29DsikR35qMBDNunEngl+AKncV5RvXoDtW0UwKKErg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786450868; c=relaxed/simple;
	bh=uwYCui3c4XPv1rsWnK/RPsaDrOamMJWwHcg3hSpC47c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SWSXRB892BJunKSPg73z+Cx1LHZ/BcH6Qo318SC9s5hzaLfmbU4dRvmQo1RdZNBPWvvITUptToAMYRAqCUNh314m0xmQ5W5PJ6mvG3dCI1y+JsMZ1Si+Sblz5ysxfY6Z2fB6sJvK3nVY0ExlXJyK0pXg27Huv1sq0yT2h6Z8UA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=godRB6I+; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="godRB6I+"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84e3007a2b7so2737698b3a.0
        for <chrome-platform@lists.linux.dev>; Tue, 11 Aug 2026 05:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786450866; x=1787055666; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dA0DiMJYo6Co7ip9aLY71U3LlTdqy5LziCnokKFtcGE=;
        b=godRB6I+7TLAOcKgOe0kuxuesXooA7mFkdNlo76KyZoSm405R5EoKfvI8QXkG7Pd/k
         X6H2Sm31jpMgrzQsuXQsG5R5pjiH/wF4u62Qhrc7reRSbvyI17c9Ti53m1DLzSUHuBLM
         CesaokNZ2TeUK5zDIH4Iz9DZFvQSkPDnAGvwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450866; x=1787055666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dA0DiMJYo6Co7ip9aLY71U3LlTdqy5LziCnokKFtcGE=;
        b=OJqEe3EOxfp47oTjB984FrGFaZtLcOR2OUBWGkUncONiTNGEZLx7VcmXcF8ibzH5rN
         MtBU0kBRuFmno5ynD7pMWhviw/8qc6EuOkqDcHXqoyE9ushdZpX5dyM5p82y5eKux4Vm
         TgREXiZlPSFbyouIyQ4OgzwE2OtGUzT2CUFu4KM5qrZBREDpapTcOzKDcZH3KKa3jbKm
         B2rRWeUjYSQseGgicw51EtVb5GeCw3D0BoycfSkwtMhM2SahRM6luHnMkHBytTlqiaiJ
         ineoA88HIML1qG9iMwpYmnZwjXO3iVbI1omdunUO0GbpHPNKwBdh0gcmF3Mrs5KfH4Dt
         6dkg==
X-Forwarded-Encrypted: i=1; AHgh+RoyzBRrby/BBeIOE52vV336cINJBrXovUGUWLIfzfJqwtx6X5q7aPoAj1uSvZjL4djIOAGbBAutHY9KQGgRVyc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxVLfn99gNKzgwb3f+WOqNgBti7ce6rKilBe/tcewWmLdDcVfIP
	ramwHCl17zAALZ3u7R7mUVnPSOUgA/eq9m5jetaheg51yi6P6M8Jb89IiYSKAVoZBg==
X-Gm-Gg: AR+sD11D8Oa6cH6VBIgrQteOFVfSirMw82edsXEshAtdb4c/z+nOYRJakFxPF6HTE6e
	xVBCfQ3MXipL4jekIsW0kK7LoXy3UHdIkSJEyqciZ3h/M9DrIhSGHopITWmUNY7ZvwdGi2eDcwp
	u/YhPJSnHntyGg/omS4D85POJfovVWhKIlCHdPR/l2p57mVVye/3F/2bVKpmc5BR4Szn8VEhgZz
	XHZf6BJRGzeMZfLaZ2/d0KzXvynPc2R8p4BZNvigYkGbnxYy865/HQD0pDAaWclw8R6UvaSrx1v
	2yLc1OMvDAL+BrLIATtCt+DgmpwZOH+hcTzEBKNEWPGxnf2YmQtmsBpEdmoqonUN8TK0nTh0KWn
	wcesy/RXMNp0HGIOga/0uPZinXbloOh5ZDEaNHr6Zlg0gKd4tOTqI9uX+G69TIvjjIGFsuNGGNN
	CuuceWjwX2MkbV+gXNisgdnOYGxQ1c2NF4Yc1EsRrEZRAbx2Oo993/CBG+r101TDrtNmrjWWEuf
	1d5nrhdlAIqYnrZBdJDrnOYp17srrMmfndZDSbajFo6yw==
X-Received: by 2002:a05:6a00:181b:b0:847:8504:9946 with SMTP id d2e1a72fcca58-84fa882d05emr2571459b3a.25.1786450866341;
        Tue, 11 Aug 2026 05:21:06 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:12e1:df26:6add:1ea7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa9574e9dsm662454b3a.54.2026.08.11.05.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:21:05 -0700 (PDT)
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
Subject: [PATCH v4 7/9] platform/chrome: of_hw_prober: Add delay for hana trackpads
Date: Tue, 11 Aug 2026 20:20:07 +0800
Message-ID: <20260811122011.3539250-8-wenst@chromium.org>
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

Up until now, the MT8173 elm/hana device tree has set the dedicated
regulator supplying the trackpad as always-on, simply because the Elan
driver was missing proper delays. As a result the delay for the
Synaptics trackpad was also omitted, as it was not strictly required
under such a model and delayed the availability of the trackpad to the
user.

The Elan driver recently gained proper delays after power-up, with
adaptive skipping of the delay if the regulator was originally
on. The I2C HID driver and I2C OF component prober library gained
similar adaptive delay skipping. The device tree will be fixed to have
the regulator not be always on, and proper post-power-on delay time
added to the I2C HID device.

Also add the post-power-on delay to the ChromeOS OF component prober,
so that if the regulator is off at the time of probing, the prober knows
to wait for the hardware to initialize.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/platform/chrome/chromeos_of_hw_prober.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/platform/chrome/chromeos_of_hw_prober.c
index 8562a0e89dc6..54d8941617e2 100644
--- a/drivers/platform/chrome/chromeos_of_hw_prober.c
+++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
@@ -70,10 +70,8 @@ static const struct chromeos_i2c_probe_data chromeos_i2c_probe_hana_trackpad = {
 		/*
 		 * ELAN trackpad needs 2 ms for H/W init and 100 ms for F/W init.
 		 * Synaptics trackpad needs 100 ms.
-		 * However, the regulator is set to "always-on", presumably to
-		 * avoid this delay. The ELAN driver is also missing delays.
 		 */
-		.post_power_on_delay_ms = 0,
+		.post_power_on_delay_ms = 110,
 	},
 };
 
-- 
2.55.0.679.g6767b8d81c-goog

