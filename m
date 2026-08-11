Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA29443E5D
	for <chrome-platform@lists.linux.dev>; Tue, 11 Aug 2026 12:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786450858; cv=none; b=skAsrfJlCgsuOyP0pfTXr+LiavT4eBHukvGxRZoyVTL7LZaIcP5OEvf+DT4uxPWznOgpGfnKpPHqRnS2JnP5QKUHx7TlVmslzJMXUk8FhbCCPHgDc66MWg5O6NkKt8VUrquNQZ8j+s2dcSryUzeVfcAPtBeegzVH1jx2dLOc8fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786450858; c=relaxed/simple;
	bh=eYYAZt1D/azsw9KiyzJSs5x1E12lPK58GJkuELjCTl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aKbzjDJK506O7yeyrC8Iv5qiNrMeM/4ej0nC1JPqZYNSx+dilQawlLO7IuYaoCxpzUAz1UarerkaxZvLdIoKon9mfwUk1PxR6xbs0XfLNiUXzpGTy6jC/QVcvqd09Zg9yikBvBtdYsK/mN7afa11tUOLK5xHicb13HZfqHJ2VlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MhywAOY2; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MhywAOY2"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8485b358552so469788b3a.2
        for <chrome-platform@lists.linux.dev>; Tue, 11 Aug 2026 05:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786450857; x=1787055657; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W0rjMz7r89FDG00LgKpSG7rJxKNH2nfPyMU32ONUt3s=;
        b=MhywAOY2nfaTpSyIvuSnjmXSSvTL8E2xVGBJKX4qQJO90OXk2jZpgRmZRXXQiVlc5k
         sEbzSM+taRp0vIPv0DlRPBVNBrc5MiRFujXhhMq/GpziYUqtSVc9wwqJm7PeRu0+aO3X
         WF2Lk+F1HVhgBp99AXv65JV4AtsvQsT05exQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450857; x=1787055657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W0rjMz7r89FDG00LgKpSG7rJxKNH2nfPyMU32ONUt3s=;
        b=B1I3udeN2v8mBgPJvb9KSRhzRVNRy6tMjHGIcKWgzTRBdutQaA8oQa4A1nIjBoixjy
         pLjij65/+6RyAYsl6RUeIznK+7dJXDcXKxrko5aDt3ROoW5rvk7/Y1g+GSSPcdlVGbzx
         DEk74ECROg5zvw0ApMA70GLSE6d5ge1ThfZcCTk9lvXjIepv15V8rM7SgGtV9NCk8vTo
         TN3g28ZIrwLpC4BznBWUTZ4g+SCcx0dY8bHbuq0dYLjO338vpuiKaDu2bx++rNKrZCqy
         7DAqMhMAtnGGrQGxin9SOYGa2XRtsYCwmQgDjsReshrAcYZ0DH70qcAHDFC4U1ZGlOpU
         +7rA==
X-Forwarded-Encrypted: i=1; AHgh+RqUGz0Skg1Id9dQpV13thWnayh8SiL+cbRefpbEAYyYaX9X/97fzazvgnw8XFe+EXGlEkjxDI2j7CRHYbPeu7I=@lists.linux.dev
X-Gm-Message-State: AOJu0YwaGoZCotikXTZuQAw8vrXd6JiVfH32+m00H3zLYWEQOZAmeGLJ
	O6UFroPKSwjTHWu4jKIi4zCwGT35zNmS4foGQzVfSF3q+a7B7oMxAKPNfoAnhnLrlw==
X-Gm-Gg: AR+sD10BtDSLgU/7RhGYJyKAD0Cc+xJ4tRuPGVgNlQUmAz9bvbBWoZACLg2FhGv5y+f
	H7WoE5eD23KAcCyXVF2u1EuI83/5pVbTdyC9NIe6Rqu01GsxT5CuvjsNurx1O3tmHiW158awXVW
	IaucYOjzlemFSvMUdfsJMm0wCRh3SP0c8iTXV76Ghxn04Mvou2mUyzxOYmuHcX00bkuQpXB5lKZ
	JIUdt/7kFgXC3Bs1La4mPgffVmZZUS2rLxRsGjNYnm8T+/eBzAlPgNEE4dM4fmAoM+J8pyJwx4u
	LInd3XSLmcrRo/9Ag0erpxhyPCbsE9+UviBGM0vzxeuTziP0QUnYcHSQjckLvxgHje+MIbCe14F
	69mG5UvVTiHaUKjCjg6vGzCYWer1KPFkTnMArU76tgUgorLqgNVhBXCj8FrWiLNhwZ46Jh+yTs4
	xAbAa1rqJRHdD7/aNProOyUipjmAi0s4j6ZjissmPKqr8bFGqCUZbcm8d+tOIed+eIhjv91XwdR
	DByH/DQolR5ZmPHdMihmsRZUf0CKY+Ax4Y38TE47Jcj7w==
X-Received: by 2002:a05:6a00:32c3:b0:845:40d1:87fa with SMTP id d2e1a72fcca58-84fa873632emr3028343b3a.25.1786450856753;
        Tue, 11 Aug 2026 05:20:56 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:12e1:df26:6add:1ea7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa9574e9dsm662454b3a.54.2026.08.11.05.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:20:54 -0700 (PDT)
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
Subject: [PATCH v4 5/9] i2c: of-prober: skip post-power-on delay if powered on sufficiently long
Date: Tue, 11 Aug 2026 20:20:05 +0800
Message-ID: <20260811122011.3539250-6-wenst@chromium.org>
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

On some devices the I2C component is powered from an always-on power
rail, or the power rail has been left on by either POR defaults or
the bootloader. By the time the prober probes the device, the device
most certainly has finished initializing and can respond. There is no
need for the delay.

In such designs, the system integrators tend to work around the delay
to avoid the boot time penalty by simply omitting it from the device
tree and the component prober. This is undesired, as the device tree
is not fully describing the hardware.

Switch to the new regulator_enable_and_wait() function that makes sure
a certain amount of time has passed since the regulator supply was
actually enabled.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Switched to new regulator_enable_and_wait() API
---
 drivers/i2c/i2c-core-of-prober.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index 6a82b03809d4..f9f3c0ef93ff 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -18,6 +18,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/stddef.h>
+#include <linux/time.h>
 
 /*
  * Some devices, such as Google Hana Chromebooks, are produced by multiple
@@ -226,13 +227,11 @@ static int i2c_of_probe_simple_enable_regulator(struct device *dev, struct i2c_o
 
 	dev_dbg(dev, "Enabling regulator supply \"%s\"\n", ctx->opts->supply_name);
 
-	ret = regulator_enable(ctx->supply);
+	ret = regulator_enable_and_wait(ctx->supply,
+					ctx->opts->post_power_on_delay_ms * USEC_PER_MSEC);
 	if (ret)
 		return ret;
 
-	if (ctx->opts->post_power_on_delay_ms)
-		msleep(ctx->opts->post_power_on_delay_ms);
-
 	return 0;
 }
 
-- 
2.55.0.679.g6767b8d81c-goog

