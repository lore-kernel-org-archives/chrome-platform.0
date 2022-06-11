Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF7D7C
	for <chrome-platform@lists.linux.dev>; Sat, 11 Jun 2022 06:18:27 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id f9so1000463plg.0
        for <chrome-platform@lists.linux.dev>; Fri, 10 Jun 2022 23:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JjSO35OW5CDyi5f0VovxlwBR50P/ZvPzlljHQHI8So0=;
        b=ZPAiaJFvNbYdlJoRy4T8pSPsPpq/FRlPdSQfmDA5IEGB15SEODi9bn3BE18cEysmFt
         BOUoC+/Axw6q+d9JOFh2AC6eZ39mfVa8i3bIA+jxC1z259lqn/i6HarZlqxVLUrltRTf
         DgjZDNAkDDcHpD9qY/aggBsWayTAQWM2iXQUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JjSO35OW5CDyi5f0VovxlwBR50P/ZvPzlljHQHI8So0=;
        b=QvQ6FVc/+ZleUSBgEmXMaXP6xp5I+kAnd/W/eo+o4yC7C8mT/ajYeeORGJQDcDHyvH
         7qBxQxuXwxmGZcYW3H2vdrRr3AFeERZGrg1CV1KqGlEG0G/bKm+u17k89Edlbtc+0DDK
         JjaGo9zFiKa9BJTLAGHgL0nqQ7GyVMGc6gODZtRupb9XGHvsBIL2TmLKMUUCsm+jRimy
         NQ4p6mq83nBWFm2gSt9s8Y871ZaqT8XIPCM13iwrOAJz+jR2hUsoMcUgjCCwfWGP+jrC
         EVworvL9aLmKE6updAn4wNen9DE2TdK6t1/TKsZ/xo0lsh1yP9ItfkTqJXgguetk9aSk
         qM4w==
X-Gm-Message-State: AOAM533uFsLFZFT2luyybwvkY9rjlhtvGmUzcjMzTGBDxZEbQXBSBp2H
	M0Vyv1s0DwgMQ5kDki8LDDe9DA==
X-Google-Smtp-Source: ABdhPJyJ7PXl3jPaHrDrOXLCuufFhhVFFeO5wLSbUu5ZQzB+zSUBmZZZ2gl0gCCqR/rK42pNBQGtQA==
X-Received: by 2002:a17:90a:bf02:b0:1e2:fadf:3f15 with SMTP id c2-20020a17090abf0200b001e2fadf3f15mr3554441pjs.91.1654928307162;
        Fri, 10 Jun 2022 23:18:27 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:290:ebca:2e9e:1570])
        by smtp.gmail.com with ESMTPSA id p10-20020a62b80a000000b0050dc76281aasm634824pfe.132.2022.06.10.23.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 23:18:26 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Benson Leung <bleung@chromium.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	Evan Green <evgreen@chromium.org>,
	Rajat Jain <rajatja@chromium.org>,
	Matthias Kaehlcke <mka@chromium.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH v2] platform/chrome: cros_ec: Always expose last resume result
Date: Fri, 10 Jun 2022 23:18:25 -0700
Message-Id: <20220611061825.4119270-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The last resume result exposing logic in cros_ec_sleep_event()
incorrectly requires S0ix support, which doesn't work on ARM based
systems where S0ix doesn't exist. That's because cros_ec_sleep_event()
only reports the last resume result when the EC indicates the last sleep
event was an S0ix resume. On ARM systems, the last sleep event is always
S3 resume, but the EC can still detect sleep hang events in case some
other part of the AP is blocking sleep.

Always expose the last resume result if the EC supports it so that this
works on all devices regardless of S0ix support. This fixes sleep hang
detection on ARM based chromebooks like Trogdor.

Cc: Evan Green <evgreen@chromium.org>
Cc: Rajat Jain <rajatja@chromium.org>
Cc: Matthias Kaehlcke <mka@chromium.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>
Fixes: 7235560ac77a ("platform/chrome: Add support for v1 of host sleep event")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Changes from v1 (https://lore.kernel.org/r/20220610223703.3387691-1-swboyd@chromium.org):
 * Fixed typo

 drivers/platform/chrome/cros_ec.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index b3e94cdf7d1a..3abef9747482 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -135,10 +135,10 @@ static int cros_ec_sleep_event(struct cros_ec_device *ec_dev, u8 sleep_event)
 	buf.msg.command = EC_CMD_HOST_SLEEP_EVENT;
 
 	ret = cros_ec_cmd_xfer_status(ec_dev, &buf.msg);
-
-	/* For now, report failure to transition to S0ix with a warning. */
+	/* Report failure to transition to system wide suspend with a warning. */
 	if (ret >= 0 && ec_dev->host_sleep_v1 &&
-	    (sleep_event == HOST_SLEEP_EVENT_S0IX_RESUME)) {
+	    (sleep_event == HOST_SLEEP_EVENT_S0IX_RESUME ||
+	     sleep_event == HOST_SLEEP_EVENT_S3_RESUME)) {
 		ec_dev->last_resume_result =
 			buf.u.resp1.resume_response.sleep_transitions;
 

base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
https://chromeos.dev

