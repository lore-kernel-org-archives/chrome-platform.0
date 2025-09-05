Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AB136CDE8
	for <chrome-platform@lists.linux.dev>; Fri,  5 Sep 2025 14:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757082141; cv=none; b=eAMXo1R1xdbP44PpG8fxbnL0e9FLIfN8T/rSe1xLVPS512sriL1TBGYBMcYW4PApYkqj+7Hja/piQVGQhf1uk0k7+gSs39whR9r9yTOePFbgUOzlmh5ReSc4JNZ7g8Xfa4ekngX6JXhcDIuglmZ2DmsDvpLnfXrUz2mIpqyEdgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757082141; c=relaxed/simple;
	bh=7dk81Au3j1iQk6yPR3k0+dfNeO3eOhLC3P47r/ZLlaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ktaT99K6Is93M36nZrbXg8vlfs9OGiSobCmQKccZzYBI4fNoIFMZQgsUw+9kvOkMBVduT1aIVlxEoPu8oOYUwa3X2sGkw8H31Ye7uUv27ZEefmkyoQmNfFx2e5L6eKRmEsKunuIobffOMt4ktn2tSckBRUKuJ46dlWTimqs/lqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Fk0oLsYa; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Fk0oLsYa"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b042cc39551so397791366b.0
        for <chrome-platform@lists.linux.dev>; Fri, 05 Sep 2025 07:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757082137; x=1757686937; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNdygYENTLEaOX1N0zFeQLg29SgfHGJhm074WNrdLtw=;
        b=Fk0oLsYaSBNsR432RhNOvBl1ytDAb/n5JOQN0vMu3+CcLacyO1EOt2rkvmuqQhsWIO
         w2Zjw+jyvX/k3gnoUt5Zywxc1z0exO3tgODWmTwnej2wXbU7lYWA8mevdDZ4lvNU32xG
         vHrhjd67x/iDsGcJJqF5pO5+W86W+GDgaey30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757082137; x=1757686937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eNdygYENTLEaOX1N0zFeQLg29SgfHGJhm074WNrdLtw=;
        b=uCxddsFIMwXW008ze9Hcw3f5OmaCw2TZs8+BeYOdNcEj2wtoc2cvGSxMisGekHG2zF
         Dusi2GgfkqfORRI8E16+aMLiuoJPriFotbaLWi/t2s/cgSnGvw5BLDPZ36ld+yEyLQBO
         n50rHSNVlPBEKh6BMmftffpaBy7Z3BQc2+RTPtYK//dZOmIFfCWI+B+hmmvi7iW5kEd4
         lKo4yr1nuPuQIOajcaOLhF1jYjLrDLyC7Wuohv9l89/fPm0E24civO5bOO1vAmJfT4SA
         FMqqfumQ4HIIcyqDsP863zer3zdg/VaFlI/ruC2Z87qA5f+USFd7Ov54X+5+BaKBP8OG
         scbw==
X-Forwarded-Encrypted: i=1; AJvYcCVqmie46dm63Ez+x/49JtLi0lNqC5y3eUgZAE5LZygtd7K30i1yYk+L6cAx41lkChSHMBmqt94cGybrMeN4748=@lists.linux.dev
X-Gm-Message-State: AOJu0YzclPYaHzrtMU4su9Ch1tAVxb3ZFfbSTkHtV0mQdpcw7YFAkTNb
	PsIiaFIbuL8WctpMFusijpl5yxJ9APJY0j7eVzEHdXYZISro6R+R1IFmtjquzQOz1Q==
X-Gm-Gg: ASbGncvKSTxzcNDNoylA64JbULEZ/yQn8ENG7TwcEvQI9RiGSfeEMK7wjztE4MOQXpJ
	elOVVgQvsICTxyboUP9HZm6maZ8kl7JDWgCRiUlDQMUDoppsm2X55fNEpjioqVBg3foa+O7a+fc
	Nj7ZdaYq6WlwW6YfKj1D5/MFmTPhwUd+dwZfNidCRaQmqqbparnicooc6Ma8b8T6s6bdl5m8zcE
	BZgGhD0jys+mqE1SXdKL6byh4u1oIiYDyGbDcXc8XyB8QNQ7OEozYlcWTFgYFrqhWiX7InYMOpK
	q+6wKjEKabvln7kEbeH/iW++fqshdGeWVALCe6CCr7bpSlCA0ffzTKsqw6MfZT8vJG8IJaxkGrk
	jT/RdL0hgiPdZCfJOSsbC7wYHGf/ASXhKz2tpbsq9x+wSGe38tNU3nXqDf+4D81JvKOhl/EBsJj
	p+ftyQQGR9SBOCZEU=
X-Google-Smtp-Source: AGHT+IF1G3sXay2HMrNzwLZtA3zxVhb7Dzgn8IIvQwuekRHg2fNC6grbFYHUf3CV1eWA30lQkiz/Lw==
X-Received: by 2002:a17:907:1b22:b0:aff:16eb:8b09 with SMTP id a640c23a62f3a-b01d8a2639dmr2066545166b.5.1757082136974;
        Fri, 05 Sep 2025 07:22:16 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (240.225.32.34.bc.googleusercontent.com. [34.32.225.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0476e0d61esm502141066b.53.2025.09.05.07.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 07:22:16 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v3 2/5] platform/chrome: cros_ec_typec: Set no_mode_control flag
Date: Fri,  5 Sep 2025 14:22:03 +0000
Message-ID: <20250905142206.4105351-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
In-Reply-To: <20250905142206.4105351-1-akuchynski@chromium.org>
References: <20250905142206.4105351-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This flag specifies that the Embedded Controller (EC) must receive explicit
approval from the Application Processor (AP) before initiating Type-C
alternate modes or USB4 mode.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/platform/chrome/cros_ec_typec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index b712bcff6fb2..c0806c562bb9 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -491,6 +491,7 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 
 		cap->driver_data = cros_port;
 		cap->ops = &cros_typec_usb_mode_ops;
+		cap->no_mode_control = !typec->ap_driven_altmode;
 
 		cros_port->port = typec_register_port(dev, cap);
 		if (IS_ERR(cros_port->port)) {
-- 
2.51.0.355.g5224444f11-goog

