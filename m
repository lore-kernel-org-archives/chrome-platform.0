Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F891373
	for <chrome-platform@lists.linux.dev>; Thu,  6 Jun 2024 01:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717636042; cv=none; b=aS6CUsA25zKPAiVpgtFRJaahlrtLVIfAvElBLWJehN0m0Grit5MWWXJcxY8dUqtXmJHODgdQvz+kGR1xxNlV88rBQZS6ziG4mFfYlYxqPjwmkiJb0rh7t6Q5j3grxOD2iYr2BykrvvGpWXBYleGZIuZucnS5bMIzNmk3M0hC0Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717636042; c=relaxed/simple;
	bh=gFn5wwu4bMNpLGJMXipsrkFzI3buH1deDAdkAU5DByc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KXRgiPyaBy2BT/DNLEssq/awt0GkdiEKE63sbdGHl4r/n2X9VNcLkyh3AW4VXQBbx87L91APcSV3Mj0HTmpQnM6b/H+aA5GIcA9jXZgc+BCL6dhdDGhHBvQJLD7OM3Qb8v0RXvvBF7KrOdwUDHVbAs8lQdbp9Kwz8EBS2n45IgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gR52Pody; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gR52Pody"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-25111b428adso194476fac.3
        for <chrome-platform@lists.linux.dev>; Wed, 05 Jun 2024 18:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717636040; x=1718240840; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GHJWUhGCM31EHb8N/3uQR4RdhPKST7fahqcoh/PkOfA=;
        b=gR52PodyZihFjrxjx397xnIb60o+eRlcP4cQsSleUsq18w9sfuLXbTBVZhNFq22lpd
         K96fAUlibhJR+wHCnmpRmLJ8rkm6NwnqoxrdDhVqSUxJ3mNhux4xuU64SetXGpda41my
         YyyWDEXQvqn7YT8ca89iX+sC10gIre/TssInA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717636040; x=1718240840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GHJWUhGCM31EHb8N/3uQR4RdhPKST7fahqcoh/PkOfA=;
        b=OKLRqxEjcsU8J+MRVp8ozk+jU4Sj3HsTtPgPY+kIOemgERdmoeWtXTGhlXEN/mBHLd
         fPAnb6bIu6MJUM5N6wwb0Z9jdbzmgsCz7nfJ7Irbiv7TM3QbIFoAHh4/HE3E7NyLaF5z
         xVnqK/dNKrXmjgLH8ZsCz1IiH2z3hXCJFypN7k9WLeWrl6kv37FaiXf9DpjUDdEu0zyK
         fHFqsNfAX1wla14vr2NDfm+DNoEdVWbFDXUX5/jU+EyiGvX+P0Bk+et0SwUZ6UqhDBUV
         QY68AR3JM4Isn9COJ09Pk3ZI8IR+fesDwsAXbgxeWhth5gqNp87y4Yox+4/klE+rcIte
         ZDrA==
X-Forwarded-Encrypted: i=1; AJvYcCWVQrFCLTC0wqVV60pYmXM4B+tWH2jMCDlAO9UVdYkZidEOlHqBl4sJ4gUWwySkW9V+NOrN+kZ3yDnQxyme1og/dUZwXLZRsaMk52unSnFb
X-Gm-Message-State: AOJu0YwOFmQjQItKG7bf3jZdAbVRb+e9918MbFO2ZJD2JAPHuiFamvvC
	+K8vDJfMrsBsgLs6DFAmX81c8aznIFLpBKLmrva3cJzhPayq39Jtth4cwCwhrA==
X-Google-Smtp-Source: AGHT+IHmH0jI7w3IKJ+BmIm+75hSNR0Qkc6y3LcT1Z1xvmyEHLSV/NA5M/qYahJWCyXzuwoUttfvMw==
X-Received: by 2002:a05:6870:d890:b0:24f:cabc:4f6b with SMTP id 586e51a60fabf-25121c94350mr4957202fac.8.1717636039994;
        Wed, 05 Jun 2024 18:07:19 -0700 (PDT)
Received: from pc98uv11.mtv.corp.google.com ([2620:15c:9d:2:3fe9:f321:712c:442f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703fd4950dfsm114252b3a.133.2024.06.05.18.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 18:07:19 -0700 (PDT)
From: Daisuke Nojiri <dnojiri@chromium.org>
To: 
Cc: Daisuke Nojiri <dnojiri@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] platform/chrome: cros_ec_proto: Upgrade get_next_event to v3
Date: Wed,  5 Jun 2024 18:07:00 -0700
Message-ID: <20240606010713.25275-1-dnojiri@chromium.org>
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
2.45.1.467.gbab1589fc0-goog

