Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BEA53E16
	for <chrome-platform@lists.linux.dev>; Mon, 19 Feb 2024 20:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708374214; cv=none; b=rmP0ix0grK8YreZ6ljE8hrkHyueHneBHe0Q+ifyhBkWi8F+nh2Rpo6kqrWO8V4BqdH3soy3Y1pj+6Abf9xNx49AEfWJiCOQseBalbbaU1sd+N5dpOyXeyFuDHbLbxoTNAXa3V14mVhkT2aXY/X4KaONWjkyIaII5eHwSFpG+2pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708374214; c=relaxed/simple;
	bh=1LpOcOPE8NF67KY2Om+0rc+yLxqoD9d+aNt1OJgcsWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VO4oBSAD0cePSSAcqfRE8RVltapFDOVBdk3izsRSz+GaxYlPqeuDgheHgD7PCi10ApocdX+Y6UwP3AjryYZPeIjGchASxS8d+iLUlRx0FwmfbsqYJlDMUJMG3NCDzXSfPJob4DW0pvTR5omszD68BObczgkIrAoMDbvQTeED1Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Z7+pLTf0; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z7+pLTf0"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-299846d6ccfso797296a91.0
        for <chrome-platform@lists.linux.dev>; Mon, 19 Feb 2024 12:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708374212; x=1708979012; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GaHCMRLTHpVjbQpn0nm8Soa0CT5I0pTuDvK1Y4TvoOs=;
        b=Z7+pLTf0rKydqKbUEnAvXuz41DgwS+JxpWkB+VnATJnKQn85JCLMmYE5CgvVwDipBu
         0S2oKXJHwmG8n+pv65t0IbEHLJwjnFxVgAbmGZEh2YDu6n5qloswH+C5piN4PkDpTFlA
         ua3URxhCdtUqotDrnP6NbHUuN9mkEjNAepcoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708374212; x=1708979012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GaHCMRLTHpVjbQpn0nm8Soa0CT5I0pTuDvK1Y4TvoOs=;
        b=VxH5kawTaR2EU1Tt/rrPtWHwccoGfxyer7UD2ph0qv4L9mP+xkpq7kyOJK7jKCLtbB
         oMijexhqH6QeDpT9YLbmrg9FWw2UmGIpQwT9PdEmJqgf1CnT6q3tvEuaJMXyAlEf8yhU
         MQKQlwiRbRUQXeeEBenUxVtIpSEBClPFzTg0rLE0alP9co7A/ZSA8QYcDSHcQFp/CpBd
         I8If3q3UtXOsJ5jcP8b6WO63Cu/pYDKC/K+ogMTE4UgzqhAbQgWP/FLn/ZMHreJB5Nrt
         wNrgn3Nd5MckkJA6SWJa8VsLdCGl3bfKwcLKgX2d/E4s/2SFcu0jvVpnkHklnaMYTh7o
         UujQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDS7aVFLHl8ZwAYqesgH/RrB1v1QL+G52dUp4yfCIkKlc/oKidO5MXN9Yzgb2bptp9sQ4GnILXpcNUYr8+GFxS1wJni4kEfC7qmrIRd8ua
X-Gm-Message-State: AOJu0Yy0UmEY8mA2XIl/K1YdhPwZgnpH2bb9/RKClI/xQG4hSSmkZh2b
	b8gax/JGNEaJRVaOfY+Tq8I0EWqtedC2kIah6uCkMmpGM1LpItrWA2wzz1pfTg==
X-Google-Smtp-Source: AGHT+IEAUG2tvGVJGd+hj3U8ybO/DpLRVg66FdpMvbg2eIV6gnVcioXBOcc/U9zxzq4OgB0t7uZbUg==
X-Received: by 2002:a17:90a:b382:b0:299:3e54:83f3 with SMTP id e2-20020a17090ab38200b002993e5483f3mr6532900pjr.38.1708374212270;
        Mon, 19 Feb 2024 12:23:32 -0800 (PST)
Received: from localhost (175.199.125.34.bc.googleusercontent.com. [34.125.199.175])
        by smtp.gmail.com with UTF8SMTPSA id e21-20020a17090ac21500b00298dd684b8csm5810598pjt.32.2024.02.19.12.23.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 12:23:31 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Douglas Anderson <dianders@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Subject: [PATCH 2/2] mfd: cros_ec_dev: Add gpio device if feature present on EC
Date: Mon, 19 Feb 2024 12:23:24 -0800
Message-ID: <20240219202325.4095816-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
In-Reply-To: <20240219202325.4095816-1-swboyd@chromium.org>
References: <20240219202325.4095816-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ChromeOS embedded controller (EC) supports setting the state of
GPIOs when the system is unlocked, and getting the state of GPIOs in all
cases. Check for the feature support by checking for the GPIO feature
and then populate a sub-device for the gpio hardware on the EC.

Cc: Lee Jones <lee@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/mfd/cros_ec_dev.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 603b1cd52785..9c3f8488b416 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -74,6 +74,10 @@ static const struct mfd_cell cros_ec_cec_cells[] = {
 	{ .name = "cros-ec-cec", },
 };
 
+static const struct mfd_cell cros_ec_gpio_cells[] = {
+	{ .name = "cros-ec-gpio", },
+};
+
 static const struct mfd_cell cros_ec_rtc_cells[] = {
 	{ .name = "cros-ec-rtc", },
 };
@@ -97,6 +101,11 @@ static const struct cros_feature_to_cells cros_subdevices[] = {
 		.mfd_cells	= cros_ec_cec_cells,
 		.num_cells	= ARRAY_SIZE(cros_ec_cec_cells),
 	},
+	{
+		.id		= EC_FEATURE_GPIO,
+		.mfd_cells	= cros_ec_gpio_cells,
+		.num_cells	= ARRAY_SIZE(cros_ec_gpio_cells),
+	},
 	{
 		.id		= EC_FEATURE_RTC,
 		.mfd_cells	= cros_ec_rtc_cells,
-- 
https://chromeos.dev

