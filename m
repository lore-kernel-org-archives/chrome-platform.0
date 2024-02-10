Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB147376FD
	for <chrome-platform@lists.linux.dev>; Sat, 10 Feb 2024 07:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707548998; cv=none; b=ImyBPLjEV+rMx9qavdsx30Uou1ETKHGx/m1bLz9w4O4acn4k7u3s6aLUGarG3D0I1IVoD4Bcb57ZmqrCsOdB1oMc6yrIXM020Fpvnmz7o5/2WggcH1tNxShLPDZVveWcxQHfxbHBkOSSSz+tA/FLUReskt4wzE0viDbFwiW09xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707548998; c=relaxed/simple;
	bh=Z2VNjfcE3E5eWdhGG5oCDx/zw3CYXQmcbgOU3PEqB0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YWm1ZIZHFxYW1T1PhQib0TwvVaDjrTl49pvfQX0Wd+1wGKpoTs+58Mdqiw7OvnClL9zdCXgK/iPARzaqDStqMjc6hlMKvsx9WkrGrlFRViR0fqKpSu3fxrzpTRQpknfNYVSJwcfzCFNEQekPtidSHR/CVWasRnFgORmaF3b4NXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JAJ+eq4+; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JAJ+eq4+"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-296717ccc2aso2000384a91.1
        for <chrome-platform@lists.linux.dev>; Fri, 09 Feb 2024 23:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707548995; x=1708153795; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/bbTxm+QSm0yQFEh/0bzSR3JAbVtUoJm+LTlB5jixM=;
        b=JAJ+eq4+PomWqBi15KnOrBkZmAy30cYcCFB5ivNNxjxxOZMm8o48QBZsUbpC5HrTAZ
         57PKzIrylZY10wWPfieEc6V9jGW1ADQavZEdllbv3h8XTQt8ytnh73O94NJScQsWD7GA
         RX/SLIniwahDyL++X1YPRGpr92msofrzfW8sQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707548995; x=1708153795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z/bbTxm+QSm0yQFEh/0bzSR3JAbVtUoJm+LTlB5jixM=;
        b=g0aJkDPdVTUU3dGgpjct2/zVbgxkajwdnffnEXL5YcG7HQQbKkeltzQpYpRXB4kilY
         BsBBCj16GmVj58C19Wtii/Wd35IoBQbuppyWDnzUYeGQgY2dhynAr2KeHDgtSTXaMJ9O
         M6SGcZys//AEatiH4ifi7MtfVucaR1f0mGNOR6eaxYF7RUuEVzu2hhPe1urKhdSs5lPF
         AuMyaEGUEI18T3p8m2uNiU2llneLu0N1jHkXDl95fW9AUU/8yfqEE1PDvYgV7FfLFDK9
         IyopWDszj1NFGrHL924w2bWWRbbNFIt9jHyFrn5n8V6SJQv3HP1sOhi5YuLyIWr0MnqS
         OMeQ==
X-Gm-Message-State: AOJu0YwO/FohMV9zcUP3nQVq+piptl7FKU57Ff1Tst/CeK5JwIKLVW/L
	RKGIoEs5ostacu67KM+5rLTPdXgUQD35dpVc/OK5CALockMmlMHqDAsO8c/Oc8kryXXpCeb2sB8
	=
X-Google-Smtp-Source: AGHT+IHMkhHNa0ZG+OIplO1cmtR6bvKFs84rw5E2biQpiJzOSRE7LnelgiFtjJYp99/EbnlOI57YdQ==
X-Received: by 2002:a17:90a:b881:b0:296:1dcf:c297 with SMTP id o1-20020a17090ab88100b002961dcfc297mr2038905pjr.7.1707548995258;
        Fri, 09 Feb 2024 23:09:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWMBbmOEi0xo6ox6Wu38zgJl1YBIA9riNYFCafGlKAAN8+ZPlZ1F0jEvy+MUZ3tc1A0V3HjPW8DiWhK+yVH42jv2NvxaLqGPMd2bVdadwnobW/q9lAIQrHQdK5F03bwogZKK+ILzFmzkzfbRQlWt1ARp3meQ8e0OfIPHFbh8QM6uYJRAebiYG85x9mDSD6CEM52nrEQP9skTJpBxSYPbOVns1y1hktPql80CxyEL0isVwWU9NpD0jozK5EGEvhh7wxGC6ot7Rn3wf9s9Gu3/9tp65gjUDuFteXi2cfKL+FyWQtRPF1PyUNDInAIns030RQCnsYv6BEto50mq4NYzAIYIn7qZrHlMK/Y35iJoLfYGbiLAe9eWA==
Received: from localhost (175.199.125.34.bc.googleusercontent.com. [34.125.199.175])
        by smtp.gmail.com with UTF8SMTPSA id ip3-20020a17090b314300b00296fd5e0de1sm2828227pjb.34.2024.02.09.23.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 23:09:54 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: chrome-platform@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH 09/22] platform/chrome: cros_typec_switch: Use read_poll_timeout helper
Date: Fri,  9 Feb 2024 23:09:20 -0800
Message-ID: <20240210070934.2549994-10-swboyd@chromium.org>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
In-Reply-To: <20240210070934.2549994-1-swboyd@chromium.org>
References: <20240210070934.2549994-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's possible for this polling loop to get scheduled away for a long
time right after checking the status on the EC. If that happens, we will
never try to check the status at least one more time before giving up
and saying that it timed out. Let's use the read_poll_timeout() macro to
construct the loop with a proper timeout mechanism and the ability to
check that the condition is true once more when the timeout hits.

Cc: Prashant Malani <pmalani@chromium.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/platform/chrome/cros_typec_switch.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/chrome/cros_typec_switch.c b/drivers/platform/chrome/cros_typec_switch.c
index 07a19386dc4e..a23fe80d9d4b 100644
--- a/drivers/platform/chrome/cros_typec_switch.c
+++ b/drivers/platform/chrome/cros_typec_switch.c
@@ -8,7 +8,7 @@
 
 #include <linux/acpi.h>
 #include <linux/delay.h>
-#include <linux/jiffies.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_ec_proto.h>
@@ -108,7 +108,6 @@ static bool cros_typec_check_event(struct cros_typec_switch_data *sdata, int por
 static int cros_typec_configure_mux(struct cros_typec_switch_data *sdata, int port_num, int index,
 				    unsigned long mode, struct typec_altmode *alt)
 {
-	unsigned long end;
 	u32 event_mask;
 	u8 mux_state;
 	int ret;
@@ -134,18 +133,14 @@ static int cros_typec_configure_mux(struct cros_typec_switch_data *sdata, int po
 		return ret;
 
 	/* Check for the mux set done event. */
-	end = jiffies + msecs_to_jiffies(1000);
-	do {
-		if (cros_typec_check_event(sdata, port_num, event_mask))
-			return 0;
+	if (read_poll_timeout(cros_typec_check_event, ret, ret == 0, 1000,
+			      1000 * 1000UL, false, sdata, port_num, event_mask)) {
+		dev_err(sdata->dev, "Timed out waiting for mux set done on index: %d, state: %d\n",
+			index, mux_state);
+		return -ETIMEDOUT;
+	}
 
-		usleep_range(500, 1000);
-	} while (time_before(jiffies, end));
-
-	dev_err(sdata->dev, "Timed out waiting for mux set done on index: %d, state: %d\n",
-		index, mux_state);
-
-	return -ETIMEDOUT;
+	return 0;
 }
 
 static int cros_typec_mode_switch_set(struct typec_mux_dev *mode_switch,
-- 
https://chromeos.dev

