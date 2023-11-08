Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A81C36AE6
	for <chrome-platform@lists.linux.dev>; Wed,  8 Nov 2023 18:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZqEl8ud1"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40836ea8cbaso50523295e9.0
        for <chrome-platform@lists.linux.dev>; Wed, 08 Nov 2023 10:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699467999; x=1700072799; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l1kERn6BqrTYSq/wcLvk2u9/EuVMFvU8+Uv0uPnlNwM=;
        b=ZqEl8ud1BRV0qVWA33aBjvwKu6tk4eYku0uCIQS82KyddU3LXMzmfuHo9gncndldGT
         bdW/KNDMyPPx2+WAohjH1drBeV+a/JQAPnEErmz0TdQg6BQpSOQ2RKeXAG8plrh6lq1s
         KKAszGZNBhw9wtUiDg9YOkqtV3oeYJpYVorkJYg8bbo75sKWd65a9OY3pGNrCtDayH2J
         onLEmVotdDH2jKtYWrHeNF8xe4AlIvZyGSEcBude1xllDkuMHE9EgwPt8eP2Fz5yYBSB
         pS47DxRuDRJBE34ix4WtE09QwYaVwYp0xBg7bNe9rD4ZSVM9dMFEq+N27McNAIDogH/8
         2JIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699467999; x=1700072799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l1kERn6BqrTYSq/wcLvk2u9/EuVMFvU8+Uv0uPnlNwM=;
        b=wFoez+P6CiE/EiKS5OE0lz5DF7brlxN63hMO3FKVRKgRgw+yBvWz62rrR+3klJTccm
         0myO84gJKWMdbbdzPiAzWWaxMLPrb3S8iFIGSp+oeNSEJ/uqymsHCfWGQ49nvw9ViOr4
         lcIsJGEXKEu4PcSJv7eys+64E+bFnym/zH5RCMcRefNpo6VCYzQoVLU07qce8tHW8AOR
         CRuthWILQpWWVWMh2zpOVpMFM0QETxI6nmkrXAQUA+Zc7xlj9ilEi3VGSYwvhB+NbP1l
         JgMfdqiLs4kwMZDh6Mub9ksGqai6ECWI07uI5JYfl1Dp8Pukbg37ImpZGrNB7IMV9p/m
         VXAw==
X-Gm-Message-State: AOJu0YyU9uyZwXt7iuOYyOTo2taKTAZKWneMM0dSr9KEkQ4wD1Zm2XOr
	++GJXbmnaiUlWxVxnsNkM1M=
X-Google-Smtp-Source: AGHT+IHgXWrzbdDq4xZ1jianfBnc7JjgrzvZzvkwkFcw3xZB1748V+kWLOAfOqeV34xJCJ56Am7bTg==
X-Received: by 2002:a5d:6d8a:0:b0:32f:9511:9795 with SMTP id l10-20020a5d6d8a000000b0032f95119795mr2190812wrs.11.1699467998439;
        Wed, 08 Nov 2023 10:26:38 -0800 (PST)
Received: from ALPER-PC.. ([178.233.24.52])
        by smtp.gmail.com with ESMTPSA id v5-20020adfa1c5000000b0032d81837433sm5542596wrv.30.2023.11.08.10.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 10:26:37 -0800 (PST)
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
To: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: chrome-platform@lists.linux.dev,
	Patrick Georgi <pgeorgi@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	coreboot@coreboot.org,
	Brian Norris <briannorris@chromium.org>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>
Subject: [PATCH] firmware: coreboot: framebuffer: Avoid invalid zero physical address
Date: Wed,  8 Nov 2023 21:25:13 +0300
Message-ID: <20231108182625.46563-1-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On ARM64 systems coreboot defers framebuffer allocation to its payload,
to be done by a libpayload function call. In this case, coreboot tables
still include a framebuffer entry with display format details, but the
physical address field is set to zero (as in [1], for example).

Unfortunately, this field is not automatically updated when the
framebuffer is initialized through libpayload, citing that doing so
would invalidate checksums over the entire coreboot table [2].

This can be observed on ARM64 Chromebooks with stock firmware. On a
Google Kevin (RK3399), trying to use coreboot framebuffer driver as
built-in to the kernel results in a benign error. But on Google Hana
(MT8173) and Google Cozmo (MT8183) it causes a hang.

When the framebuffer physical address field in the coreboot table is
zero, we have no idea where coreboot initialized a framebuffer, or even
if it did. Instead of trying to set up a framebuffer located at zero,
return ENODEV to indicate that there isn't one.

[1] https://review.coreboot.org/c/coreboot/+/17109
[2] https://review.coreboot.org/c/coreboot/+/8797

Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---
(I was previously told on #coreboot IRC that I could add coreboot
mailing list to CC for kernel patches related to coreboot.)

 drivers/firmware/google/framebuffer-coreboot.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/google/framebuffer-coreboot.c b/drivers/firmware/google/framebuffer-coreboot.c
index c323a818805c..5c84bbebfef8 100644
--- a/drivers/firmware/google/framebuffer-coreboot.c
+++ b/drivers/firmware/google/framebuffer-coreboot.c
@@ -36,6 +36,9 @@ static int framebuffer_probe(struct coreboot_device *dev)
 		.format = NULL,
 	};
 
+	if (!fb->physical_address)
+		return -ENODEV;
+
 	for (i = 0; i < ARRAY_SIZE(formats); ++i) {
 		if (fb->bits_per_pixel     == formats[i].bits_per_pixel &&
 		    fb->red_mask_pos       == formats[i].red.offset &&

base-commit: 2220f68f4504aa1ccce0fac721ccdb301e9da32f
-- 
2.42.0

