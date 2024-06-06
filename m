Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A20A749A
	for <chrome-platform@lists.linux.dev>; Thu,  6 Jun 2024 01:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717636010; cv=none; b=Z5Sy1OfsVCLg9se3Pu5FHRPaCf+SArngsNZ/xgEhMVfy/mI+aBUBSHMotZpY0IiUZYEF1H57Asd2cmKkux1ug9wWzcDYWB54RBRn4RFgSsB4yQNqUOwjnNIWP/L3gIZnjc3zaFr7NzsfSKMWA7S/zzkeO6hyXCpCsvhmO9lrkA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717636010; c=relaxed/simple;
	bh=++WJqqND1ZBOGt6/Onp3wurt4JaeFMyxGGslVsp1Zgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J3lo7bQmJzF1WgLa5J7JD8/I23iawsH9lwjWVSguFyHoNTZZXamE8aIjzY6sjfxaqALXLjm2MNFV1PuQtOns5laeSYfrnSczq4V0H+rXaCMHBXrw1KjFq0Pcixn502JeJgmexpm9OEriOhDu6pGELIX4WWb25yWBT5GVHXs4Y7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Lm9mnHCR; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Lm9mnHCR"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-70249faa853so328177b3a.3
        for <chrome-platform@lists.linux.dev>; Wed, 05 Jun 2024 18:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717636009; x=1718240809; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZAPtVWkfmldUTyM5Hk8/0Btwi/UZMj5h/uZteLACq0o=;
        b=Lm9mnHCR85PZCW36dysbDnOcN8wcOCXlf/VVSbR9U9A5iNb8Y+XyqPbqOR0AOERgTG
         n9PavOz7ksO1WQq9Tmnt/Oq/PgmKap1iCkZyBmPFxGPa2mDhjuutN/0BBxtbhQ2i+FTw
         tFwAMNm+k9nb/dusaAsQ/1NWohCEhW4oRMSeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717636009; x=1718240809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZAPtVWkfmldUTyM5Hk8/0Btwi/UZMj5h/uZteLACq0o=;
        b=fFJ7F31hEpql/fprL3acTA23Cjo/TmhF8JLJzEKMr45ILSTYTqlF3rJDuVG9P6DIz8
         jgB2BnORXTvsT7SpndjlG69OPTaMC1Bee8LNfa8sa66ZJZyCzmAOJBsn6/gvEsmvzV/h
         6f1rKNu6OZX9+VgNYbPVRe2IIb38YEtymBmDrPnUtkM2ouTzC62vv6E4UR5MfCJQN3ZY
         Y7pMb71UQWyerlvOfBPzZUxwHX2k7ptw3DacgTr3CAIQ87GNiVKu6XXxqGhVoOj33UbD
         KpHw3YGZSj/KbS1yuBpEjUuUB2+kRIhQZvKaLRQUldwue/gUekot8ahRHYz/wQ9qhdpC
         jMZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0Hm8PD5OoDzfidykgVr61chvBdiaRy3JAj31Rb81ZnCwCNPWWFOM/xIa5C2pvpR/wjV1YauwCmoy0zrn5/dX3lYKq3RhQIrnesy+gRJzj
X-Gm-Message-State: AOJu0Yx+RGtq1nOqC8t0mFnWUiPE6KEPXS4TEe4OnrwNwTpQajBJ+ZV9
	Q6lc411VcXob4Yoplg7yXYWmoTOoID1aTiG15bQowV2HZdCcrCi9Voizet3L/g==
X-Google-Smtp-Source: AGHT+IHQV1kfgZV3G6K5sktJH/jDVBDRoR3swfw8i+wl5vd2Br20L4UfMz635guhJ5oPDUP07aLGwQ==
X-Received: by 2002:a05:6a00:130f:b0:6f4:56d1:2fbe with SMTP id d2e1a72fcca58-703e594acffmr4302257b3a.11.1717636008266;
        Wed, 05 Jun 2024 18:06:48 -0700 (PDT)
Received: from pc98uv11.mtv.corp.google.com ([2620:15c:9d:2:3fe9:f321:712c:442f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703fd372dbfsm121871b3a.38.2024.06.05.18.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 18:06:47 -0700 (PDT)
From: Daisuke Nojiri <dnojiri@chromium.org>
To: 
Cc: Daisuke Nojiri <dnojiri@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Reka Norman <rekanorman@chromium.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Tzung-Bi Shih <tzungbi@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@google.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Lukasz Majczak <lma@chromium.org>,
	Ching-Kang Yen <chingkang@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] platform/chrome: Add struct ec_response_get_next_event_v3
Date: Wed,  5 Jun 2024 18:06:26 -0700
Message-ID: <20240606010639.25074-1-dnojiri@chromium.org>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
In-Reply-To: <20240604005354.2294468-1-dnojiri@chromium.org>
References: <20240604005354.2294468-1-dnojiri@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add struct ec_response_get_next_event_v3 to upgrade
EC_CMD_GET_NEXT_EVENT to version 3.

Signed-off-by: Daisuke Nojiri <dnojiri@chromium.org>
---
 .../linux/platform_data/cros_ec_commands.h    | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 070e49c5381e..fff191a8d413 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -3527,6 +3527,34 @@ union __ec_align_offset1 ec_response_get_next_data_v1 {
 };
 BUILD_ASSERT(sizeof(union ec_response_get_next_data_v1) == 16);
 
+union __ec_align_offset1 ec_response_get_next_data_v3 {
+	uint8_t key_matrix[18];
+
+	/* Unaligned */
+	uint32_t host_event;
+	uint64_t host_event64;
+
+	struct __ec_todo_unpacked {
+		/* For aligning the fifo_info */
+		uint8_t reserved[3];
+		struct ec_response_motion_sense_fifo_info info;
+	} sensor_fifo;
+
+	uint32_t buttons;
+
+	uint32_t switches;
+
+	uint32_t fp_events;
+
+	uint32_t sysrq;
+
+	/* CEC events from enum mkbp_cec_event */
+	uint32_t cec_events;
+
+	uint8_t cec_message[16];
+};
+BUILD_ASSERT(sizeof(union ec_response_get_next_data_v3) == 18);
+
 struct ec_response_get_next_event {
 	uint8_t event_type;
 	/* Followed by event data if any */
@@ -3539,6 +3567,12 @@ struct ec_response_get_next_event_v1 {
 	union ec_response_get_next_data_v1 data;
 } __ec_align1;
 
+struct ec_response_get_next_event_v3 {
+	uint8_t event_type;
+	/* Followed by event data if any */
+	union ec_response_get_next_data_v3 data;
+} __ec_align1;
+
 /* Bit indices for buttons and switches.*/
 /* Buttons */
 #define EC_MKBP_POWER_BUTTON	0
-- 
2.45.1.467.gbab1589fc0-goog

