Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680679;
	b=tpAUfa7ZB6ya80RtLoGTJSf2CG9XhxDzCgGvYU3/dpXITYFQ/kp9vvyxeMKeej8I5kR5
	 kT8mAM9K/Rv3rrEZjeBHBOLJQ55HfT+z7nwBNkB3ZCg0mmOPQr/VWXHkg++RqjUVHY7N7
	 IOQICsCDu78JR8Ka/9UHjmbsztQjVt63eiKxwb/RaDHk1Hnq2BpPsFukv97SfGIsqL7VC
	 siCvUkiTU7dPbldr2NR5Rr1bhdOREEeX5lzVfjxS5mKbq+0t65TXEsevkbXLoqgyyivjU
	 y9cmPHShgQNZzACNPs6GU8H6tDyd3MxQB+0K36r1YAAMkz1oyfHZQFqKADdCk10pQsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+m0KRotnRI6Y4M0Q7c+lnB20WP0kpPO3hQuPyKu7qTg=;
	b=fpEoUx1LfkPeUWxH+SQ8Vhtmq3gy3twszbVci6CAoJtjFNKt7dQ52Ws9aC2JylOwCj9c
	 8IjhLk3JJJeSjK0R3+i7wsv9VA7jfunLRsMTxOYqT0IOBk+0BmLrC4e4NJG7oXVJRxcpD
	 99rS5tMxW12zEcvAcM5GjjxiM8SiqsuPxzIyE3gOi63zEIXeUH/+J4ipnxLZqwI9qJzTs
	 LdQw99RB8Nkcol6Ld0U8gGL1pmP54O+2+LR/kUO87NK24fqlyICimBSxYCnoXKbzGtZOb
	 8tr1mD08sbNS6axMoHjlnSWFm/UvV1/QSWnhXfkpAOKqtV0LR2BNmcqkMdRvm/kLekg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=edyc19nP;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131B1606A329
	for <chrome-platform@lists.linux.dev>; Tue,  3 Nov 2026 04:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 131B1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=edyc19nP
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc4dbda1e5dso1237199a12.2
        for <chrome-platform@lists.linux.dev>; Mon, 02 Nov 2026 20:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793680677; x=1794285477; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+m0KRotnRI6Y4M0Q7c+lnB20WP0kpPO3hQuPyKu7qTg=;
        b=edyc19nP3JYNumDuygu0vgPzW7ETyF4cefya8tgBtTPrlSvVqn6s2AbdxaYYRcw6kS
         jjoWOak038D5OSspPna9s2RkF9nmIIsDzopfnzGzg2N51Saj009mFg+MufAc2Bz8yq6D
         THaYD/mo9Q+NcJe9SAdSAA8Th/5pbSOK+3LU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680677; x=1794285477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+m0KRotnRI6Y4M0Q7c+lnB20WP0kpPO3hQuPyKu7qTg=;
        b=erE0D3zwYiKPS8ymGqyuBasuDvwc4BMLQaiW9H/n5KCTUMw8Fi8XRgiajDttCthdW9
         y2dRi9ZKMnRc5enRv0ZihUELDEJBgrsMtUKuHdSf1bZmaA/Ot1ScF9UABmaUkjXf8Gcy
         IWrNPDHB8dR0hqTKMiZSb1yzJFR5V1iIqcU9aNsrGA1YvWrsb4o+fgSk075L2gEuugUk
         221/H/tYs49tqFYE8nreu9vKhlL+yu6q3JL+owiI6TX/Rzvu9sFUWN08om8FBTseBn5L
         Nx7xah6wMQll8REQVSpN8u4VAar2iVBEj3OXjtMgmutmmgPUAIRiNS5bART1qwZo02bE
         OuQA==
X-Forwarded-Encrypted: i=1; AKwUvBzIV9nNmYAn7nomVB5WAR5/vruCVhcwBUsVIVDV8R3NOPC5JS+CmR/J3znvmgYgWEmJTGEWO1ckrPgItrrvv8I=@lists.linux.dev
X-Gm-Message-State: APuU4Z9BbMIqgetn7NfWG/PDxHKCpTWqB/RHgrbx0b+ywYgOylPp6Eyi
	8Ik+wvbFk69N91vhCjS3OkiwYWi+TVEED6UMQOEkvIJT0DwKeZVxc2XfUbQKBIuehA==
X-Gm-Gg: AYBFou1FUiMJi8qiSPFR6ekQ+jc9cjrqeAFfw5NaD0Zi+e1abEm2MySKrMwTM9BVl9c
	7+MFl0vzDyxca3uS5CUKsatcbCr/tiPepmHrtM6RZ3iGwz4TvO8d1NJYhinYYVHJrHBOSsHuvp7
	edr0bN42Nx6IyT2vZsLifrl3z0KXh9JsWo9iiZn+azmQ15xd+8wQs+tEXNxH/YvzslXqBdozJ89
	Ma4kI6KnBnY4Zm4kEw8hTuEdsneDw/fJzdWfXRxIaqBT7M2YmYTc89KhykZ7qjCxTP7Mgix+0dm
	l1Jeqm60xltXnLijWOcILZ9b/OrZ41CmidNtgI/SDLoNg9w/5wE2NK/Nmbn0/ZML6k1bSHvc/Yk
	gfZECBgabyQaXkraq3lHsEIwhSQa9g9p9LeD29TGxv9x085+jckX5IWuc8dM+YKKbrMkwOB+a39
	/nmoFKXZ8jVoB/euV689GUvf/K/Fk7S0WcoJV5juIPQ2jpz3DkSg5QpFbuWjzNOPJpc0RKOs73E
	ZQR/khGwiV65jRtTl8af95wqonDRoNNbEhnzsYZEv8G0AlEfHhs1ZtaTZ1AqwnZ+Je8ZSvmmoYR
	vJ5EJP/ububHIbqGplbmQHOWNmW6hiPk0Dk0GL/pgjFu7usWKEJALzPQAPQ/8asC2KhXXuW7Ga7
	Gj8MQZ9w7Cys6
X-Received: by 2002:a17:90b:3b51:b0:3a0:cbe2:9e0c with SMTP id 98e67ed59e1d1-3ae897c8800mr10534419a91.63.1793680677425;
        Mon, 02 Nov 2026 20:37:57 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm2072761a91.16.2026.11.02.20.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:37:56 -0800 (PST)
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
Subject: [PATCH v7 3/8] HID: i2c-hid-of: skip post-power-on delay if powered on sufficiently long
Date: Tue,  3 Nov 2026 12:37:27 +0800
Message-ID: <20261103043734.2179858-4-wenst@chromium.org>
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
2.56.0.385.gac671c819a-goog

