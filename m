Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2013CCFB8
	for <chrome-platform@lists.linux.dev>; Fri,  3 Jul 2026 11:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783079779; cv=none; b=sTGyse5nY+qpjAJAA0/VmHFw2QNrqDcbRa+ahjM7PVZ+LqwRjB+el9wxKiUhoca6zeW1Dsa1Y4e8tqidcKV3lAiuDZXTaoUGRwDiN4l0YH88qz6fSTuKcQzUxIC2a5aay04IfdLZ7f9tO1F0zRLxFW6XYSSWW3dC4tnNsnLHstA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783079779; c=relaxed/simple;
	bh=V7cOkFeI+SMCrClZ1qRg1vjKvkY61qr7W7O4sv97AZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NouYrAwSHcCkwTNjh0xeI6Tgwa2/NehMUqFtH6lEUVW963ZfJuKRJHzwpIUQmV2CnN6ieOhgXe+ZNRZV9Zf70prhJgh6ZJ98CmwTmTR1Llu4M3zqNLX8EHJ94q2AiYaP5h/IoU2bVje3O0Al2sETYZMmTDYigglRx1TYZ1yNgwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fiyQ9EjD; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fiyQ9EjD"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-847a52edeb2so392987b3a.0
        for <chrome-platform@lists.linux.dev>; Fri, 03 Jul 2026 04:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783079777; x=1783684577; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W1Qi7K0Q2jUkzExsWzvH+ABdRL+B0DFQxVv+X4n7A58=;
        b=fiyQ9EjD0Tnz7wlgI2Vul9/IkM/xqKxcNervP9ZldF02zrI4wf1SRQ868Z1fQLX1ms
         iVGQgO8cwA0u9lo2eFNgENKFR8ZXanCqOiiDTa/IOqI9Q/bXmr1eZj8RsEpyloCcXDab
         K4R3mI+u7AsFKsQ7mxn5HVeMyYgFxQwqWug2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783079777; x=1783684577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W1Qi7K0Q2jUkzExsWzvH+ABdRL+B0DFQxVv+X4n7A58=;
        b=CVfzGtEpZ8IykXzbmrbRVeqlxeWS2rNTEDxa4KECjacJ46qRbsRKbTwewtOfGxdPEN
         yueW7ONMpzgRM+ikHVkkjFmft0901YmBuF1d4hU/y82vd6xI30NA/ImdiDXKp9EYDpt6
         4l/ZrBIBUk7KO4aec+E+SP9mZeRxawuaixq36gELn/pLXI5jdkLrLJSfowHTp9V0iFMR
         aZm7yuPsXAWOjc9az2xj4JadzIi516An1Rq8hlVg3KIRkgW5+vwmRoHWEfrxcTJGIv1V
         w0Q6TAXAnLvutFmOp+WP/LxKljeyB4eMaQ4hcs4yofnUbSQewIaMTjqQ0YkXbtMlwAk9
         pKMQ==
X-Forwarded-Encrypted: i=1; AFNElJ8kYEAn1pnE/YFzHn5b+urumtO/KSTXQy2x+GMcDjN2kX6n8FZ+u7RnapHEbJWQ29esO3KIBeD1N5qgusObdmw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQZUzhNnMtoQ7bSjE15xn5y9rUVEjWTSPSAQUTg17C7+7xaZiX
	PE/h9DwaSXTgSpmEKtlPUTs1RJfFD6j7mUISdvpVZJRK8ZUNqDzuOth6cUU0DSQ1ZQ==
X-Gm-Gg: AfdE7cl8xg68YdUQaoD72Sja1rfT58AM4EZnEakp7ZrzL/ksFhfk5KaKQspJiiMD+RN
	3QC2uP83pwXUt4uF06f/YVhS0ck3yoGewTZV+iYRsWkF6MgigEu3qvbFJZeNM60RKjTssfxI/Fn
	CkY3utzP/f+v2w+3GIJJKK7l4e0Of12LU8w6fxrtp5hHgHdHoxVclIomeLxyTBI3uhjmSMlx52N
	HcAhCDbYhTS1xcOFrcYxkjNtLNoeCyukQv/J95/3Fe1I6q+jKAdJ1JBCqjV/TKp6XS2icsIAYDV
	dP87rKfoScODQx+0r4zBM2ZwzCgEkkAThCBJuvhoDVe4hDfPdrHWWtJka2TY2SHb18MIu2UDdPp
	y/8NtWCKD7GAlIlp9jfshgTnbsCgHkJY1eImjZepA8cAPXKDtJEAknfeclRTpXnhpo4IK895VXq
	jObPrLZFV6jS8xspSZN3XIItFdZ6XzZMPg0WEDtEOp93hsVSl6+1HgsUzYciRPoiHCBo76/I1Bk
	ApZySTL
X-Received: by 2002:a05:6a00:6ca7:b0:845:388b:56f with SMTP id d2e1a72fcca58-847c08956ebmr10321332b3a.40.1783079777502;
        Fri, 03 Jul 2026 04:56:17 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8bd30ca5sm2569540a12.0.2026.07.03.04.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:56:17 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
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
Subject: [PATCH v2 2/7] HID: i2c-hid-of: skip post-power-on delay if already powered on
Date: Fri,  3 Jul 2026 19:55:55 +0800
Message-ID: <20260703115601.1323491-3-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703115601.1323491-1-wenst@chromium.org>
References: <20260703115601.1323491-1-wenst@chromium.org>
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

Instead, check if the regulator supplies are all enabled, and skip
the post-power-on delay if that is the case.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/hid/i2c-hid/i2c-hid-of.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of.c b/drivers/hid/i2c-hid/i2c-hid-of.c
index 59393d71ddb9..70afdfb207ac 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of.c
@@ -29,6 +29,7 @@
 #include <linux/of.h>
 #include <linux/pm.h>
 #include <linux/regulator/consumer.h>
+#include <linux/string_choices.h>
 
 #include "i2c-hid.h"
 
@@ -46,8 +47,12 @@ static int i2c_hid_of_power_up(struct i2chid_ops *ops)
 {
 	struct i2c_hid_of *ihid_of = container_of(ops, struct i2c_hid_of, ops);
 	struct device *dev = &ihid_of->client->dev;
+	bool supply_was_enabled = true;
 	int ret;
 
+	for (unsigned int i = 0; i < ARRAY_SIZE(ihid_of->supplies); i++)
+		supply_was_enabled &= regulator_is_enabled(ihid_of->supplies[i].consumer);
+
 	ret = regulator_bulk_enable(ARRAY_SIZE(ihid_of->supplies),
 				    ihid_of->supplies);
 	if (ret) {
@@ -55,7 +60,8 @@ static int i2c_hid_of_power_up(struct i2chid_ops *ops)
 		return ret;
 	}
 
-	if (ihid_of->post_power_delay_ms)
+	dev_dbg(dev, "supply was %s.\n", str_on_off(supply_was_enabled));
+	if (!supply_was_enabled && ihid_of->post_power_delay_ms)
 		msleep(ihid_of->post_power_delay_ms);
 
 	gpiod_set_value_cansleep(ihid_of->reset_gpio, 0);
-- 
2.55.0.rc0.799.gd6f94ed593-goog

