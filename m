Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70B446F482
	for <chrome-platform@lists.linux.dev>; Tue,  1 Sep 2026 07:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249000; cv=none; b=Vx1OQ9c1BQvQOFxnFYiaCHlftCPeYJgzT2WYWaPyP95MDjy74eXCmZknALb10RldBUUs4FPT+wJMjXGgo+Q5KYfc2INIfkn5780poqzgiwKhHAOTq4/lR+hn/Elux1rGA76Ct5PYwWdkOUml14+d91ZR8IUWX48p/TOXgVu2+0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249000; c=relaxed/simple;
	bh=rlbm//2B5OdqBjqqr608z7OgF45U9aPq6hwy3/UJHTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XBdE8rHNMH2r5lSAK55T7X2sMMjZsyfIPkwIFoMfV/WUEihOcwCBLJLpaumRXcD8b/h4tKtSqVjogT0vCe1G8Xrg4kk+JVpPT4ZB01ECLff9m+wTbGpvP0DoMQd3X39YUwev0dbZgGWpNdoA7Gc3NVNzkV890VFFq1SgV5xhrj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WL03C1Vg; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WL03C1Vg"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d032846c95so49942985ad.1
        for <chrome-platform@lists.linux.dev>; Tue, 01 Sep 2026 00:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788248998; x=1788853798; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ppTKN+ViX0ps4m1x8WbWgM6kLhXVltmE87oNPgspGL0=;
        b=WL03C1VgMyca2VIowk5PqJyBvOUqKlB4McU4/u6QKGLpAsfjs10JZsyuRsFwyAdXQO
         7aSLCpUMiAJFIlQfDKcssPa2lzg9r6FBNsYPzs6ydWorsRwvho7w5JaXRioPSZB89KqL
         lOH/Liq9UFD0aQhQmSiCSzc6u4iRNxIVJxMkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248998; x=1788853798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ppTKN+ViX0ps4m1x8WbWgM6kLhXVltmE87oNPgspGL0=;
        b=nplgDtG5HrIXc2bYp+dOdwcwErjDROoA+vxjxuc2+CLeBwzNn3LrxWGT+KKE1PwD5m
         joxaaMKAEdasBTp56l5loZ9toqLku4PMuMuapjh1mZJVIblJopBZ81E0rUfGldfnRRA/
         KaNYAslVbzz5a1uJUJY4q+31g+2aljf5S4RNu8GX6sxQubwL/iUMHRT7EOnfXk5VW79E
         7EqgGyTLQe4JIaGkf3C/GoRzaoyssxEWa2tVEs7cF77N6xjhTDOFGKqUEunrm9BLtk2g
         ssTypkV3q+6sQy8vhOf/YFVedzx2gNnmolr0FfIJ0gsH5+6WeYHyM8415XOwUTgpjvaD
         7hRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhMyM+ZbwH0E3B/9Pp2YU1oXvOCfRxd5mJHqCQ+19Ol4Yh4Bl0GvQ7gyYAiSi10T5loncX6EJkyM6IdQbZ83w=@lists.linux.dev
X-Gm-Message-State: AFuF++mtnxcDkGAWPLAoX4FrGA8N0GKDklY8cF56oeDgxMMZ7/HqzvGY
	9G7md9Sn/YHvcYgF7KDWKHsco3NDPcRQAn893JhbsXB5WOmWbuleJan4JwrNQ/Rdyg==
X-Gm-Gg: AYBFou0ZuybKSVER/D24Up5gfGcTdlESH+6v63pq4oC8j3hfdFzRGMkRBNIMq1MEZuV
	Jsi+1cKzDENl3ySdr+vl2SW+Rf9n+2EBbpbVn+7CJCyZwJ7CdRtI/V42e/08BtERTraWra8ZJBO
	GqK8Cmo3fhoZoD4U4edfgidGhBZIqc+lQOb8mNCB7FwbaLeEMlmcXCf9/mPJ2lL3Hst7VsfaIKJ
	pK1R6JztPKirxQV2PEvMtBZNOWidj/rgmerMkBHvpMOmbFKOqkEugoRPcOJ2BfGyvjo7SkflX+D
	/wN38LkYD9UNP17E25msBMLeHxb8LY5ukVksTEV1zrLxlwzIfXk/awYBIR9i4c+fjbD9FLt5Ggv
	WlUsPlUIpgLhG003WLm9H+2akpco8lnIlQDvYhxcjZ+eMC1BpIHJT81Tg2C1j19p0tey/69lCmL
	obf1m5lI6pm1lRmW55aa3NII0P4FVc0SYCSsCDEP5+EU/f7lO1OdDGDYUPEldYPU08JnLVITzxw
	9e4XsWdiFFvQDVIrXz+ORPKtDiS7HHaXx2apQraxWj44ec=
X-Received: by 2002:a17:903:3883:b0:2d9:216a:cdd3 with SMTP id d9443c01a7336-2d94a93609cmr90196685ad.18.1788248997383;
        Tue, 01 Sep 2026 00:49:57 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:8cf:6df0:9c4e:f5e1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988b699sm48142515ad.59.2026.09.01.00.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:49:56 -0700 (PDT)
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
Subject: [PATCH v6 2/8] Input: elan_i2c - Wait for initialization after enabling regulator supply
Date: Tue,  1 Sep 2026 15:49:20 +0800
Message-ID: <20260901074930.764550-3-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
In-Reply-To: <20260901074930.764550-1-wenst@chromium.org>
References: <20260901074930.764550-1-wenst@chromium.org>
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
2.55.0.897.gb25b4bd76c-goog

