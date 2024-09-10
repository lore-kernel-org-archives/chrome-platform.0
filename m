Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4D118CC17
	for <chrome-platform@lists.linux.dev>; Tue, 10 Sep 2024 10:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725963347; cv=none; b=CtFdvpkFahGp60YeyHJ79ei7iap7+ZB9FMrB/uExYSs19buog8lUkGHwkFS+PGbu8E0JFEWJjWPDJMsuVmVWkKg8CyIvavqsb5lcu9jUbVgQWAsrToj5CDB6Z2InUDd4+l1WAQcLhn1IGtGYxKwRdiu5ObUyvqb4C4Tk2MLiyXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725963347; c=relaxed/simple;
	bh=YD468ry7hUMKcsYIUjPS512IHcVzElRgJKXYwiiKeKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ivL9AkOHhgTYRB+CgT5Ahs4jsPnD9DfuIgU62R0yHsfidffIvhgnQazpqf3aPypBSAUFgcuIxTWpQXgTbjIpoowxbBrljv7iRut19M32T53jjZ5jVRNH45q1jRwC2eMCfR6+YoC60TUFpI4U63goqErRIDTsoFItTpHpjKxOgsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=i3p2lkUT; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i3p2lkUT"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5c241feb80dso12183902a12.0
        for <chrome-platform@lists.linux.dev>; Tue, 10 Sep 2024 03:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725963344; x=1726568144; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FeqFZCtBiSpM67nMSPMG8nnVJnw0zyk4FGk4Kpm9II8=;
        b=i3p2lkUTX/wamyksS4/jueezFYXF3eIchptqPtzLvWh//ZJ69Lz/vrolbWIxySpPfP
         4Ucrda+vJFCqS99c/Bue5NgRfa3G1s7X9+gPNhWOM9Ct1EcacYoJv81WBfsaSUA6kd/4
         v0XCoTr75qh4Gb94J3ALomA11rY652NjxIKIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725963344; x=1726568144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FeqFZCtBiSpM67nMSPMG8nnVJnw0zyk4FGk4Kpm9II8=;
        b=qCsVevkqrHEaWcsGlylnQOczOaFqIRHCgP266cjaTf3fOlm9DKs3sDQqnMSWIwKKjm
         lYv2ODtTCfMLcASfKr27N0pGnLjRGubJJ2Fe7jqlpEyuSTsVi7nyuqVMfogLAazI6M34
         FM1D+pD7gJbsWbdhlmVr8+Ezu8Kwy8Drta+ClaerqXN5ZSglfr0y3QYnPzPvJYINRImT
         UO1SFgpyWRclI/OfFFJmTtVr0CTXSb0meq52cefRH1UGcxOMh3lK1Oc3AcJI7YTVW3N5
         M06e7+5poAkVDt04JdIzPlGYE0mSqSHFgFumVy0wCu5a1t0nJUO24y5HyLqdNkkzSDiE
         Yleg==
X-Forwarded-Encrypted: i=1; AJvYcCXO+9Yf+z0lCZwqg6uf8JTqvvrlJrUcjMzIeLpkOjTZTus6puxPECDvtDHL7x8K1Fdq/TfyukQeFIaoVH0Ad5I=@lists.linux.dev
X-Gm-Message-State: AOJu0YyU11C/WP7fcIYbRwE4uaLvMmRXvoGkoSZKvyhwr+h9e3QNhHX2
	yQsh7YXmqS23IypyNcyExdk6F5la2M4jz2hIaQhwb6WvHq8NEMliHCtGmd80
X-Google-Smtp-Source: AGHT+IFMu22ltsq0YAzHIeMzdsOV+gf/uOgHmWy5zGWIum1KNPXBI5poW2rPcZak4GbDH82Fy3I0TQ==
X-Received: by 2002:a05:6402:51cb:b0:5c2:7009:b223 with SMTP id 4fb4d7f45d1cf-5c4015ce1bemr2907203a12.1.1725963343031;
        Tue, 10 Sep 2024 03:15:43 -0700 (PDT)
Received: from ukaszb-ng.c.googlers.com.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd424f0sm4075401a12.7.2024.09.10.03.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 03:15:42 -0700 (PDT)
From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v6 7/8] mfd: cros_ec: Load cros_ec_ucsi on supported ECs
Date: Tue, 10 Sep 2024 10:15:26 +0000
Message-ID: <20240910101527.603452-8-ukaszb@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240910101527.603452-1-ukaszb@chromium.org>
References: <20240910101527.603452-1-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pavan Holla <pholla@chromium.org>

Load cros_ec_ucsi driver if the ChromeOS EC implements
UCSI Platform Policy Manager (PPM).

Signed-off-by: Pavan Holla <pholla@chromium.org>
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
 drivers/mfd/cros_ec_dev.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index e2aae8918679..d5d63df7fcbd 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -108,6 +108,10 @@ static const struct mfd_cell cros_ec_keyboard_leds_cells[] = {
 	{ .name = "cros-keyboard-leds", },
 };
 
+static const struct mfd_cell cros_ec_ucsi_cells[] = {
+	{ .name = "cros_ec_ucsi", },
+};
+
 static const struct cros_feature_to_cells cros_subdevices[] = {
 	{
 		.id		= EC_FEATURE_CEC,
@@ -124,6 +128,11 @@ static const struct cros_feature_to_cells cros_subdevices[] = {
 		.mfd_cells	= cros_ec_rtc_cells,
 		.num_cells	= ARRAY_SIZE(cros_ec_rtc_cells),
 	},
+	{
+		.id		= EC_FEATURE_UCSI_PPM,
+		.mfd_cells	= cros_ec_ucsi_cells,
+		.num_cells	= ARRAY_SIZE(cros_ec_ucsi_cells),
+	},
 	{
 		.id		= EC_FEATURE_USB_PD,
 		.mfd_cells	= cros_usbpd_charger_cells,
-- 
2.46.0.598.g6f2099f65c-goog

