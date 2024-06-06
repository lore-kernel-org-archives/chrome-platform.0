Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9372E19597A
	for <chrome-platform@lists.linux.dev>; Thu,  6 Jun 2024 17:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717695353; cv=none; b=WotMfa9dBY9CHum5Kxe9pd5NZEXcZtGgTxqdjY4lHixOI4tUsFuyXY8Nwaah63AOlzdJqaww4WAwzFVYchoLnqLQ6Y10IRAGL86z6yXOFPJsCh1IYemU0dvbMmlR93flGxjgHpFMwews9It8rzx8BN0nZ7J4PYSMVCh36ZtlAz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717695353; c=relaxed/simple;
	bh=qQ216A7Cu3X95KjC96oChuTYwL6nPl5HT7+Ubx2VE4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MKc/WKVM4eM4xnW8c8Ft+afqlNNHeAkbM5rAtaCwjxWEn897XLhAXkHaAA/s6zmEKsobGWfbSezMcZH3FqQsnzNYUlNSQImmuKkfCVBQmTbiYmfv7PYcCe1Ez7oo9W/E3eh27t6naAeCc1jay3FbhSKqa6Z+WWAfGp349TMSd2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kRbl1ec6; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kRbl1ec6"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-702555eb23bso1038943b3a.1
        for <chrome-platform@lists.linux.dev>; Thu, 06 Jun 2024 10:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717695351; x=1718300151; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbUvxHBzQ3FTw0LHwYR3I6ZzDjqDjsM/1Nz1IUatQIk=;
        b=kRbl1ec6UsjJUv1laa74pbnq9KNHPFhyNc0rzOdDhLSbLAoD06nyeVPyFzcgH0Gu/K
         N2bnxzp7j/ahx0+7ec5BPy8UJnJkL/s3nuJLFXPoLGW2EehySoEpmvugSHLPVGyUn/LR
         5t94kYhcwuk0Pg3zXD8H2W/Wc56fOef1dC9MY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717695351; x=1718300151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jbUvxHBzQ3FTw0LHwYR3I6ZzDjqDjsM/1Nz1IUatQIk=;
        b=CDUt9YvOA71D7UtjhEAux2rL/6nY/FiGUmbgM/G/pPnm/s9livE/BV+vMIme8pu2gy
         a/6uzVgstVeaQlEl/nui3/xGEQOVi03zXQdoAxr8ZMCFbz2vu7/QWJt0t0c8X/Z67XV4
         FA/GSSw1v6OJLFR7a/WC4SL88Ee5kkk7yAvGYb/kWY2fEv0LYjPh43ygVJXimgHltlHV
         0R5QXpl1AXBm6Q7mwRShExwsWK/NhpCgezBn++oMXcL8QgdXqq8CDsLKmmPjUvUB8/bM
         o2TChZMEmPFdxaI6JuMf84aTwgpX2Xu5vrnpKIkqd3abMTcZCSrvPboqQBaFGDQ0kyw8
         2iCg==
X-Forwarded-Encrypted: i=1; AJvYcCVZAhkpTwcR5M+Yl3NEmsmeqj/6lcD0P9XZGBN22PkipHclC024yo3NOvYJ/HvAJCQG87ySvs7zXgIMPJO1VKBVXnViQMJHZ7A8fJbYNroa
X-Gm-Message-State: AOJu0Yw/FodfXk9q1PD2EywKNO9Z3wsKVf3Ja8A8tzxFPCcEqKxBZbQD
	ZQzTj6JF3hGYvWXP6Q0L2pFpDx6Cw4iq0XRQMtteyLaNVtVJ1K3nhyG9kzqbmw==
X-Google-Smtp-Source: AGHT+IEtOrPb4+1UjzrSVqS0irLPa19FnZHz7O6ML/YLqJhzc7RglwIlsVafldvdolZroniQNOeNxQ==
X-Received: by 2002:a05:6a00:218f:b0:6f8:f020:af02 with SMTP id d2e1a72fcca58-7040c749e6emr122067b3a.34.1717695350886;
        Thu, 06 Jun 2024 10:35:50 -0700 (PDT)
Received: from pc98uv11.mtv.corp.google.com ([2620:15c:9d:2:3fe9:f321:712c:442f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703fd375503sm1334904b3a.42.2024.06.06.10.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 10:35:50 -0700 (PDT)
From: Daisuke Nojiri <dnojiri@chromium.org>
To: 
Cc: Daisuke Nojiri <dnojiri@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3 v4] platform/chrome: cros_ec_proto: Upgrade get_next_event to v3
Date: Thu,  6 Jun 2024 10:34:29 -0700
Message-ID: <20240606173509.243739-3-dnojiri@chromium.org>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
In-Reply-To: <20240606173509.243739-1-dnojiri@chromium.org>
References: <20240604005354.2294468-1-dnojiri@chromium.org>
 <20240606173509.243739-1-dnojiri@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upgrade EC_CMD_GET_NEXT_EVENT to version 3.

The max supported version will be v3. So, we speak v3 even if the EC
says it supports v4+.

Signed-off-by: Daisuke Nojiri <dnojiri@chromium.org>
---
 drivers/platform/chrome/cros_ec_proto.c     | 27 ++++++++++++++-------
 include/linux/platform_data/cros_ec_proto.h |  2 +-
 2 files changed, 19 insertions(+), 10 deletions(-)

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
2.45.2.505.gda0bf45e8d-goog

