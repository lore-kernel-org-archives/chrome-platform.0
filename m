Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7326F22AE45
	for <chrome-platform@lists.linux.dev>; Mon, 10 Mar 2025 12:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741610440; cv=none; b=LoiKJBl1C1kJY4NvPmUOuXOA3skNg/wppRzK6jDP5N5Skhmke/0IGNsDBhBnmw3YAPXaQJbpgRjLhvYZ2aQsd97KMVtYPAQ7zkiMzzv0r58CINxaVSbxadEuw+bq83Dxh/was70f87Svu6ebRQbSpfVFrYJJr29ZQMIDH5DS/bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741610440; c=relaxed/simple;
	bh=Kv/7elvPz7wpCf0sc36wWWllkZ3u/gWWhEHO2uWiT08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GE8H2FqaZoqA12UbO/Hxg86csAXZ5pERI54sW/jHgHHshWKkKrSbjo4bkmRZWuzI51zGcdV1wyCra41+x7mHcAVVV4M38t9ZCbptV6jh3YqnAn9wePUKfgt9O0atKQnhvvxEV0QHNqxm9lw12SCMKInJJ6mDaMzSRARVZ63vbVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=f85fkzeV; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="f85fkzeV"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3912c09be7dso2224882f8f.1
        for <chrome-platform@lists.linux.dev>; Mon, 10 Mar 2025 05:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741610437; x=1742215237; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lszqES9j7F2LGVMtpNUOeVD26d+lln3GvRS538XWj0g=;
        b=f85fkzeVL/zgHcwThm2KU/yg2VeQ6y0dgsXQjshCB0SbPOADmE0emdPy8rdgzYhh73
         D9Po2QHcOzbOJsjYBB2wvzZd/ZJuqn3WtNkHSS1xTVuywRnseuCA+z5TPR5EVfZXGVtE
         BFNTv/KzmF0AK4wt/RYSCb/2i3RpP0/z3g2VUJhWr/VNs4SzhroXMID6sZkDUi1FCfMT
         0OtlvGZty5hIqvCzi8LWegoWPY4sT7qceAijjeFCco6yLCpsrWWIBuOMv9BXy1Xt4m+/
         /1bjCjCNXp5KKPLAxeneek+Rrl7Xq5O63at4fMKHiziipAilO767CeiSq+k0t/KxYMyK
         YV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741610437; x=1742215237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lszqES9j7F2LGVMtpNUOeVD26d+lln3GvRS538XWj0g=;
        b=GY6bJugXC1JoAXtbYN0DFEa6Wi1x0WdtKg+ck3hAeVgv84O8X8UNF9ZOjJFOzNBwK/
         Aoz/vyrr6zWiAEOm+6K612YwR0ZSuRTyK89CsfntDileG1UncfxtV16GtLlWEF4I8nnU
         1r6yGw4jm7o71Bsx/Za0ehjK9ZcdeH5C3I6aSI5wDIKA+7WjAVBOWLXkKH+I0CUjaG8v
         9Tt7MUL8R9YcqHQAcvjPQSnK4nNXUzhAy+bPeJ4gyR6+U7gqJp8OAFzYCVGjh/bMPCJv
         3JNzhUmxcNVPhJKS/zD7NnMvmgV3EXqjwUWXlSNEWDjXghibdBv9TS47p2F2uYmF9z/D
         VLiA==
X-Forwarded-Encrypted: i=1; AJvYcCWxwGLBtSXn9zg1CSr6xmBW0UN97SIijRCgGpODqrXYLvZf9H7YDpHVvVOpr/+SjEVA4Mjw69T/Zq4KkbvLnEs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwL4dNJsTQr59WypiGeT4h6efYr+jS/M0wiRi4QMSGZukgyd0Hr
	B5YlX15OH3ceZoYdRpQzmXP0LHJVpkeLk2eUaLtVbu5xRpjNjEsg36b2t+/uonY=
X-Gm-Gg: ASbGncs13CbwvGHBIuyGZVGEWtLVGxmgU3rr7CVnO4Wl7O5PjhD9wtWBhgNnud6YB/f
	u0q6HndWFrTIyUZMt30S9M4jDPP6gkXtPs5ooGq1689hkVhYJsPs9qDJZXIkN3SpcSSfIX4pVhW
	HfU68ysmyWebx3ERLdynWYFDIDzHFXi9B8yfcy0nO0lutiazEnLRKYL3ZcATpAWTSAis7KOzzf7
	flazrWehE7gJhyhOupuAhhxPlWLz8v5Af/TPkQEkL3F1jMh9dsy1ehrgnBm8opypWeaJ499gA79
	8TlV4q6PudAWiA7Iyzv6JeB3WtGxApXIHU/VvQ==
X-Google-Smtp-Source: AGHT+IFIKTdvrT9rBxnloV/WH4GBRL2hNbvpU0mO2aDX4msbqMvDFziuFm/yW5Rx83HoXIc3L3rZxg==
X-Received: by 2002:a05:6000:4718:b0:390:e8d4:6517 with SMTP id ffacd0b85a97d-39132d29464mr10567991f8f.21.1741610436840;
        Mon, 10 Mar 2025 05:40:36 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2711:39c0:fb51:b639])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfdc5sm14535865f8f.25.2025.03.10.05.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:40:36 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Mar 2025 13:40:24 +0100
Subject: [PATCH 10/15] gpio: creg-snps: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-gpiochip-set-conversion-v1-10-03798bb833eb@linaro.org>
References: <20250310-gpiochip-set-conversion-v1-0-03798bb833eb@linaro.org>
In-Reply-To: <20250310-gpiochip-set-conversion-v1-0-03798bb833eb@linaro.org>
To: Ray Jui <rjui@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, Michael Buesch <m@bues.ch>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Support Opensource <support.opensource@diasemi.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, chrome-platform@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1706;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=llaZ30RngMZ4hu72W9cDZbmKLpvm45e47QNDgX4Bmas=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnzt2342XxLoazV/RExABESNHdJVSqRH9mIAfVE
 p7pYx1x29GJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ87dtwAKCRARpy6gFHHX
 cu0MEACQ8tL6aVapLyTQEwFqjreDlxNROdSCQo+C3oRhmbbkE/uoDoxskjkhrVYFEi6n2T2oLys
 Y/RHzOxzpaozZfCy5EUdCtacbm/QhbOH5Fg8c5/glh0OmpSItGWOw3rBzWnxZvaK9RKRIEZgTrT
 B1W/+BIZEw3g96FxSLhNYETRaex19ereZa1W4zGFoRW1cCnvoBF4pF67Px+bw3T9uYUCaG22T0O
 mF3RbIXD+MeLxxt64hhq0DOX2q+ZARAPHizmwInBi13eoRQgI2rur7EhMDMXZy6+h0GgXky2gtF
 vctwPAZTCQzNE6n/YvPdpxqNAEcNu2wRMZvUAPblu1xj8lh4Fyb6RKYz3PU+pnnmti/idoggjtf
 KlWzCylLKzNgNDS0WwtJyblV3v6JqvonW5VRxQ+wPs53WmMjHsxiRw/Ch3pSS5d/2/THxp8QUUU
 yjmfqTUlJdFMMTgqH8uCJFUTGO8P+AXeOcMGt0x92x/trFuD+WsKj0z8WrdLURDn5ggZ5tv67Y6
 pZ0krVxl7FK9I9gzJL7jPKfBGdh7kQuHqi98RW3ALxwc9+bU2g664PBqp+fFAbGILCZbGQ7d/sY
 92PVM2E4SwzZo8diOmLdcVIKFdQrmOgJeoC+kve93HJMBY9mPtUh76lZiW+HWBO4i3iu5/gv+jG
 k/gHlYC7FMga7Qw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-creg-snps.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-creg-snps.c b/drivers/gpio/gpio-creg-snps.c
index 4968232f70f2..8b49f02c7896 100644
--- a/drivers/gpio/gpio-creg-snps.c
+++ b/drivers/gpio/gpio-creg-snps.c
@@ -27,7 +27,7 @@ struct creg_gpio {
 	const struct creg_layout *layout;
 };
 
-static void creg_gpio_set(struct gpio_chip *gc, unsigned int offset, int val)
+static int creg_gpio_set(struct gpio_chip *gc, unsigned int offset, int val)
 {
 	struct creg_gpio *hcg = gpiochip_get_data(gc);
 	const struct creg_layout *layout = hcg->layout;
@@ -47,13 +47,13 @@ static void creg_gpio_set(struct gpio_chip *gc, unsigned int offset, int val)
 	reg |=  (value << reg_shift);
 	writel(reg, hcg->regs);
 	spin_unlock_irqrestore(&hcg->lock, flags);
+
+	return 0;
 }
 
 static int creg_gpio_dir_out(struct gpio_chip *gc, unsigned int offset, int val)
 {
-	creg_gpio_set(gc, offset, val);
-
-	return 0;
+	return creg_gpio_set(gc, offset, val);
 }
 
 static int creg_gpio_validate_pg(struct device *dev, struct creg_gpio *hcg,
@@ -167,7 +167,7 @@ static int creg_gpio_probe(struct platform_device *pdev)
 	hcg->gc.label = dev_name(dev);
 	hcg->gc.base = -1;
 	hcg->gc.ngpio = ngpios;
-	hcg->gc.set = creg_gpio_set;
+	hcg->gc.set_rv = creg_gpio_set;
 	hcg->gc.direction_output = creg_gpio_dir_out;
 
 	ret = devm_gpiochip_add_data(dev, &hcg->gc, hcg);

-- 
2.45.2

