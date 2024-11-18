Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7699B192D9C
	for <chrome-platform@lists.linux.dev>; Mon, 18 Nov 2024 09:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731922452; cv=none; b=R0ITRjiioBPwGCBG7E4aIf2f/JW9jmynNaTS7BMD8XRWuuRWi+VdcnD5om2TdgdyT9HPtpEAXRCikiQOgbX9ko0mkUiIME/omR3wXB8yrGhaBQ0QF3FUDUBSRn8PMsyOelFolOWbdL+Xt/YEE7LhLxW7vm6YVTbg6e30Dp/Fvvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731922452; c=relaxed/simple;
	bh=uAG+q77If4uu42qh15gAWVauifcVeZPLI5R8Z0hp1us=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MN29G0JxbwpKsWV7F7CvROdomeT5v0i4608jbomCPBsk28CTApfvbQydUmk9s8E+Mt3pfmkzas4toJ4kUiuNWSx3HAaEOVuwf14RV4P9vT9jdrRXU5hrco+3S4L3VnrhhniI/5OK7XWM4bmEzcXbWHeJNyQiiOGodbg7MUv7xYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YAVmSwKk; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YAVmSwKk"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ea1e5fc65bso1126310a91.3
        for <chrome-platform@lists.linux.dev>; Mon, 18 Nov 2024 01:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731922451; x=1732527251; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B1gi99T1COw3fo/A7RXmsrRNqipSiwXe7IPFAyxh3nQ=;
        b=YAVmSwKkfNy2/ioYXBym1WIgdfd24AiQs9TQ2YkPDutYrFIfAc2EOxPkbmvBwBW3K6
         2s9xM0i7g4T6SmVs/oO0K3xl2iy8f74hD7us4iKDlK055wapd+PwFTPS4wL8+SHwdk2L
         g31gXaJqmxK/hNz7uwOPUGFbhXwVCHcHeQ/CQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731922451; x=1732527251;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B1gi99T1COw3fo/A7RXmsrRNqipSiwXe7IPFAyxh3nQ=;
        b=oDdozq3gLhyDDi3i/v9Dytp/hZeMh5tZ3vwTFR4vUuFLdwNhTrJQzzcA2q4tLfrOd4
         eJaRPsmMmK2jFE8uZh30vhPTnizUu69WRNHG02ZacTX/J0GoJXp7uUfiVrat1+gCgsS7
         BYWqUR2WsN64e0QJd3vO8cxwATtWxjGwA/DtF+aBqaEA25dv5RhotdVxma/1zgudZqJo
         wcUQgS/bsN/hFEEk/L3dds7xiGOkyV4vPwQzqo0lW7AAtYh0ewYuF6j5jLIwNKTMCi9B
         9Z4zXdu9iJs7Vmf+KaSoNns9Ve5ElRye+gRztZAbbc0UTV1nYPgdssFxQHZhqm4Cddz0
         qyEg==
X-Forwarded-Encrypted: i=1; AJvYcCUQzKbnkFd01xjH/3d4nYkFEpfRrgRDRY/U9aqNDy2vpS/oehyUhgRG2/WhwwPfgS6oltNtC8cp6Tk4ZY2kmHs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw60ooXDDgosVY/AHhlaHZoT9TTlCim6MyK+QHu4zT0CyXpnX8w
	nFiwd2RBtCSA0U6ARboDqRIQmokFNZRghTMnP2Qu8YqftsZheuDOXZBVeBGIpA==
X-Google-Smtp-Source: AGHT+IGXhjKQWR0KaYkQWRGmrJux1znHSMqcGsFKjVw/B9Ofkc26uXXYB4L/tgF/ZNdQ+bFvpHZU2w==
X-Received: by 2002:a17:90b:3a91:b0:2ea:7cd5:4ade with SMTP id 98e67ed59e1d1-2ea7cd54b4cmr2877384a91.30.1731922450867;
        Mon, 18 Nov 2024 01:34:10 -0800 (PST)
Received: from lschyi-p920.tpe.corp.google.com ([2401:fa00:1:10:e40d:fa29:75db:2caa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9f1e24ce4sm8333500a91.0.2024.11.18.01.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 01:34:10 -0800 (PST)
From: "Sung-Chi, Li" <lschyi@chromium.org>
Date: Mon, 18 Nov 2024 17:33:48 +0800
Subject: [PATCH 3/3] mfd: cros_ec: Add charge state control cell
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241118-add_charger_state-v1-3-94997079f35a@chromium.org>
References: <20241118-add_charger_state-v1-0-94997079f35a@chromium.org>
In-Reply-To: <20241118-add_charger_state-v1-0-94997079f35a@chromium.org>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Guenter Roeck <groeck@chromium.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731922439; l=1453;
 i=lschyi@chromium.org; s=20241113; h=from:subject:message-id;
 bh=uAG+q77If4uu42qh15gAWVauifcVeZPLI5R8Z0hp1us=;
 b=w4UcQxVgEZXHMCl9ZfUByBz4hpcE6oLHmGnYGMAyCfy29Q31/pkyHjtwS/WdcFDy/n4DbMxgt
 UgelA/S3WGbAYMdCVwNS8dtLFkYxQjx3GC2nRh8IwDJIXPMf5LFCzXB
X-Developer-Key: i=lschyi@chromium.org; a=ed25519;
 pk=nE3PJlqSK35GdWfB4oVLOwi4njfaUZRhM66HGos9P6o=

The driver of controlling the charge chip connected on the ChromeOS
Embedded Controller (EC) is added in the commit "platform/chrome:
cros_ec_charge_state: add new driver to control charge". To register
the charge state sub-devices, add mfd cells in the cros-ec-dev mfd
driver, and register charge state sub-devices based on whether the EC
supports battery feature.

Signed-off-by: Sung-Chi, Li <lschyi@chromium.org>
---
 drivers/mfd/cros_ec_dev.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 9f84a52b48d6..fcb4deac3bf3 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -112,6 +112,10 @@ static const struct mfd_cell cros_ec_ucsi_cells[] = {
 	{ .name = "cros_ec_ucsi", },
 };
 
+static const struct mfd_cell cros_ec_charge_state_cells[] = {
+	{ .name = "cros-ec-charge-state", },
+};
+
 static const struct cros_feature_to_cells cros_subdevices[] = {
 	{
 		.id		= EC_FEATURE_CEC,
@@ -148,6 +152,11 @@ static const struct cros_feature_to_cells cros_subdevices[] = {
 		.mfd_cells	= cros_ec_keyboard_leds_cells,
 		.num_cells	= ARRAY_SIZE(cros_ec_keyboard_leds_cells),
 	},
+	{
+		.id		= EC_FEATURE_BATTERY,
+		.mfd_cells	= cros_ec_charge_state_cells,
+		.num_cells	= ARRAY_SIZE(cros_ec_charge_state_cells),
+	},
 };
 
 static const struct mfd_cell cros_ec_platform_cells[] = {

-- 
2.47.0.338.g60cca15819-goog

