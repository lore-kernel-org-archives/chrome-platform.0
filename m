Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361113D62
	for <chrome-platform@lists.linux.dev>; Tue,  4 Jun 2024 00:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717462480; cv=none; b=RdJRgF3JElrtPaDN0siL1OXNk4jywLWDPcSgokfdCn/y5o9fqczbxuYzxEZaxGmqnA1ESoai7yBha90qxNRdsQp/4otVzteL9W7Bf0wuZJhCdp16VPGu/RMh8bEm1iBc2HwkCQqaDvw55pBnAD8fnkw7g/j7gxSzj9sS07Sw1h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717462480; c=relaxed/simple;
	bh=vwe4UNLQlE+V4/kFm4358dnZSLKWNZbkK+8ijy6vxPg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sCu7f41QfTJrs3zGagcABHn77w1YFTLD0Vd5LgHSyZOieW9tZjy5XZN3kPKD44jNVxkrch7CSu+cimRXOlyxZZZh3qQ0WVjbDrPDJqbug5mIrplhYPN2T8Li6uxo4ad1kE9P6nvZa3zurTmh0wl3dRn+GjpfsiOzy3TqMtkKM7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NTlbGXZz; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NTlbGXZz"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2bda9105902so2878143a91.0
        for <chrome-platform@lists.linux.dev>; Mon, 03 Jun 2024 17:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717462478; x=1718067278; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O6pZSOQaJynPue3j5KZHyGZp5eOmX4YwNkAxybNbnGY=;
        b=NTlbGXZzAQWYlPFTBuWh7+gQNm8VHC7aMU2egAUVWpwDEpaUvWW/Ddqi9cDNqdBA7v
         GBc7MYiEMIxWEvR1aG8vTYuuE27f7yCo2EuIeMWjd0IlLsJmjdg+zyJjV3+a1M+rr4bY
         Y/VwMzX2y8wT6059MqPR1+9G9SfwWcC3ZPh+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717462478; x=1718067278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O6pZSOQaJynPue3j5KZHyGZp5eOmX4YwNkAxybNbnGY=;
        b=GNCduijKxfHsaism7Hh1JJyTcbhg9p5UJhhE0trbOvb39uSATy65MLQVsvL1hL/Tif
         8KlPQjJp4oPV57qrA0cpOR3IhzJ+c9RdYc1Beh33KOBF1dM8fxnB3F0ph1BbVDDCIf2H
         KzaBoPC9RpiGjadwAqqh7XLcGr958JR5eg8gFQk+9X/b8Jw1hXoLQQAeS+S4Yywh6YvH
         nzxrASgO26zOlOCtBhTrQvd4VEiKI61XS8BQO8oPT434VLRumXP8XiXmxiBdQc66jVLp
         RTUtUop3udzuP+is2oWdur66356SCzm1mfCHLMOgxLj1HfWEw49DSMcfOgD5HGdSeTLi
         d5OA==
X-Forwarded-Encrypted: i=1; AJvYcCWQHpro9mYe4jkGh7GV2VMS4B3ABJ0ZWAeQztjzM/cnkh28WYqSpI7d7t/tW5RtEZF3hB+wVqg/iJioKDAXmX/Lc5OydD8B21rRRvpjFm+b
X-Gm-Message-State: AOJu0Yy4G/pmQw6jqG6MTLcyUcp85UsVKAyyXadm+y9+lNCUBfsUs5is
	Mu1DdS12d/e4RG/+ZmY6ZVcODULTlOJ0TrXdHRjgX5/UTUCgy9EQ88nfIdNMcQ==
X-Google-Smtp-Source: AGHT+IHJTl9ktjtYvH+c00K3O1DHZx4eScG7agvwHy0DCMK1K8EDwOPfdaVkTFnP0Gy5RK4I3rTH+w==
X-Received: by 2002:a17:90b:19d2:b0:2c1:948b:6f2e with SMTP id 98e67ed59e1d1-2c1dc5d5698mr8621759a91.44.1717462478455;
        Mon, 03 Jun 2024 17:54:38 -0700 (PDT)
Received: from pc98uv11.mtv.corp.google.com ([2620:15c:9d:2:6203:d1ca:c560:52f1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1c284250asm7344826a91.50.2024.06.03.17.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 17:54:38 -0700 (PDT)
From: Daisuke Nojiri <dnojiri@chromium.org>
To: 
Cc: Daisuke Nojiri <dnojiri@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Reka Norman <rekanorman@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@google.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Ching-Kang Yen <chingkang@chromium.org>,
	Lukasz Majczak <lma@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] platform/chrome: cros_ec_proto: Upgrade get_next_event to v3
Date: Mon,  3 Jun 2024 17:53:12 -0700
Message-ID: <20240604005354.2294468-1-dnojiri@chromium.org>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This CL upgrades get_next_event to version 3.

The max supported version will be v3. So, we speak v3 even if the EC
says it supports v4+.

BUG=b:331761304
TEST=Type keys on Kyogre.

Signed-off-by: Daisuke Nojiri <dnojiri@chromium.org>
---
 drivers/platform/chrome/cros_ec_proto.c       | 27 ++++++++++-----
 .../linux/platform_data/cros_ec_commands.h    | 34 +++++++++++++++++++
 include/linux/platform_data/cros_ec_proto.h   |  2 +-
 3 files changed, 53 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 945b1b15a04c..df257ab12968 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -686,7 +686,7 @@ EXPORT_SYMBOL(cros_ec_cmd_xfer_status);
 
 static int get_next_event_xfer(struct cros_ec_device *ec_dev,
 			       struct cros_ec_command *msg,
-			       struct ec_response_get_next_event_v1 *event,
+			       struct ec_response_get_next_event_v3 *event,
 			       int version, uint32_t size)
 {
 	int ret;
@@ -709,11 +709,12 @@ static int get_next_event(struct cros_ec_device *ec_dev)
 {
 	struct {
 		struct cros_ec_command msg;
-		struct ec_response_get_next_event_v1 event;
+		struct ec_response_get_next_event_v3 event;
 	} __packed buf;
 	struct cros_ec_command *msg = &buf.msg;
-	struct ec_response_get_next_event_v1 *event = &buf.event;
-	const int cmd_version = ec_dev->mkbp_event_supported - 1;
+	struct ec_response_get_next_event_v3 *event = &buf.event;
+	int cmd_version = ec_dev->mkbp_event_supported - 1;
+	uint32_t size;
 
 	memset(msg, 0, sizeof(*msg));
 	if (ec_dev->suspended) {
@@ -721,12 +722,20 @@ static int get_next_event(struct cros_ec_device *ec_dev)
 		return -EHOSTDOWN;
 	}
 
-	if (cmd_version == 0)
-		return get_next_event_xfer(ec_dev, msg, event, 0,
-				  sizeof(struct ec_response_get_next_event));
+	if (cmd_version == 0) {
+		size = sizeof(struct ec_response_get_next_event);
+	} else if (cmd_version < 3) {
+		size = sizeof(struct ec_response_get_next_event_v1);
+	} else {
+		/*
+		 * The max version we support is v3. So, we speak v3 even if the
+		 * EC says it supports v4+.
+		 */
+		cmd_version = 3;
+		size = sizeof(struct ec_response_get_next_event_v3);
+	}
 
-	return get_next_event_xfer(ec_dev, msg, event, cmd_version,
-				sizeof(struct ec_response_get_next_event_v1));
+	return get_next_event_xfer(ec_dev, msg, event, cmd_version, size);
 }
 
 static int get_keyboard_state_event(struct cros_ec_device *ec_dev)
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
diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
index 8865e350c12a..dbfd38b3becd 100644
--- a/include/linux/platform_data/cros_ec_proto.h
+++ b/include/linux/platform_data/cros_ec_proto.h
@@ -185,7 +185,7 @@ struct cros_ec_device {
 	bool host_sleep_v1;
 	struct blocking_notifier_head event_notifier;
 
-	struct ec_response_get_next_event_v1 event_data;
+	struct ec_response_get_next_event_v3 event_data;
 	int event_size;
 	u32 host_event_wake_mask;
 	u32 last_resume_result;
-- 
2.45.1.288.g0e0cd299f1-goog

