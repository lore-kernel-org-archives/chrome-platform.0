Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AE66138
	for <chrome-platform@lists.linux.dev>; Tue, 30 Aug 2022 22:58:37 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id x23so12511205pll.7
        for <chrome-platform@lists.linux.dev>; Tue, 30 Aug 2022 15:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=9i6pUjJNJbv0URDTN17d2CcuUvvkFRJoPPsB0ChrC84=;
        b=K2J5xRAk/tKVnjvdGCtwzZC/znuGdEUztUB2UHn4wXft/46xq8gyf0Ddl57gL2NETG
         M0vOBzYECWvKK4hidx1uBJNXH2NsR9pGU3zcm1+sXOa9rrbJrvaKTah1s9gjtU1As/XQ
         +GhjBJOLmxYXJbLlpGP3ExvkBiOw6dPva01r4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=9i6pUjJNJbv0URDTN17d2CcuUvvkFRJoPPsB0ChrC84=;
        b=B6b3LFZuLy3kshMt6D08XlFxW8R1gyKmXeTYqyEdmKanDUFzPIjj7CKqMZo66RFPRG
         UEMi3KTuI6ECbMOyZakRWfxR+x1Cl1K7U/G1KetaC2RUpWZ9A7Hyg9DX3C9fm+TL8AY4
         6j6RWiQ+qsZFo4D7Q1M7Z6dUmu0MCTzSxryLQX/STwEG+vBU/M9+EngHEgw5VjmFCffF
         acEQPgVsMe64q1jh+khtQ3ztBWPPyCBS9gVtnZ9uaDgPCJGWtmAP39pqcsSwzUXTE8OI
         ZLo+ATHjWw/nNjLrbIMHRLx1duyvOW9X4jHw/jBlg/wxgFcEvfeurLoEVhXnbeyzhf2e
         PcXw==
X-Gm-Message-State: ACgBeo1Edvb10nPnnjyqvRBdHGe1O5s8pq3bBKIUBslh0nvgOIgB4EFn
	AyZAh4PWkRxQkgWPo3IP+DkRRw==
X-Google-Smtp-Source: AA6agR6wm6nWs+6nAf9TZDvola8E8ygfG4X7jJS1hsOIaTMHd8b0kiBAbmAJLdFsGBuzT3sT26/VrA==
X-Received: by 2002:a17:90b:4d8f:b0:1fc:314a:17e7 with SMTP id oj15-20020a17090b4d8f00b001fc314a17e7mr284377pjb.194.1661900317130;
        Tue, 30 Aug 2022 15:58:37 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:5f34:2f6:2856:188e])
        by smtp.gmail.com with ESMTPSA id bf3-20020a170902b90300b001743be790b4sm10083539plb.215.2022.08.30.15.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 15:58:36 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	chrome-platform@lists.linux.dev,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH 4/4] platform/chrome: cros_typec_switch: Inline DRV_NAME
Date: Tue, 30 Aug 2022 15:58:31 -0700
Message-Id: <20220830225831.2362403-5-swboyd@chromium.org>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
In-Reply-To: <20220830225831.2362403-1-swboyd@chromium.org>
References: <20220830225831.2362403-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This macro is only used one place, let's inline it instead to save a
line or two.

Cc: Prashant Malani <pmalani@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/platform/chrome/cros_typec_switch.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_typec_switch.c b/drivers/platform/chrome/cros_typec_switch.c
index 09ad0d268f4b..a26219e97c93 100644
--- a/drivers/platform/chrome/cros_typec_switch.c
+++ b/drivers/platform/chrome/cros_typec_switch.c
@@ -18,8 +18,6 @@
 #include <linux/usb/typec_mux.h>
 #include <linux/usb/typec_retimer.h>
 
-#define DRV_NAME "cros-typec-switch"
-
 /* Handles and other relevant data required for each port's switches. */
 struct cros_typec_port {
 	int port_num;
@@ -309,7 +307,7 @@ MODULE_DEVICE_TABLE(acpi, cros_typec_switch_acpi_id);
 
 static struct platform_driver cros_typec_switch_driver = {
 	.driver	= {
-		.name = DRV_NAME,
+		.name = "cros-typec-switch",
 		.acpi_match_table = ACPI_PTR(cros_typec_switch_acpi_id),
 	},
 	.probe = cros_typec_switch_probe,
-- 
https://chromeos.dev

