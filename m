Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5D214D431
	for <chrome-platform@lists.linux.dev>; Tue,  4 Jun 2024 23:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717542541; cv=none; b=ejp5wOX2AhYw14MQllG9BCoxDsq03UYlHZ8LHGiItJ8JeHG99/5Hk8za5QBmkGerOIJrSgEARB/J3tTDR9d5nYg9Syd7Rduq3ifXDQd96gHAtJvityjeqyAZgc/8FrSTkk8D7/47lItE2L1XZwy3zu7OprDEjUNVdmSWq7NOoV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717542541; c=relaxed/simple;
	bh=jItJlnuHB35DpaKJ0dIjWrJnF2d/a8eObJOjomO7Ihs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ItMRronml6t8iSDV0ng9WLeJOCMHFNgNEx5teghEo+xh0BA93hPibyFw7Cs41pjfNnKOLEC+iS1A4KfLNHianyAgti1fNH4i0h+NgMP6eMLmusbjoXAdc0NqE/YD9/0wEgTrSBAfhpkcFWcV22I5g0nkZlJwWmpZS9lhVsTRKXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JorSny6s; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JorSny6s"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1f6559668e1so26937245ad.3
        for <chrome-platform@lists.linux.dev>; Tue, 04 Jun 2024 16:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717542539; x=1718147339; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRNOn6MGKklcZNQlL7ZC6Enr9RIVqAlFFrQl6ERFrf0=;
        b=JorSny6scR6v+OKiSsFmnxWpIeZOzBNyZ0qUZoHO6LbsBirZG/ENKVy00Gl0OEWvdi
         dB2z9aQhpetQ27sAid+IpubkkiAc+3Z1mC/Ply6NR+bdFA/KRYRwaW3dn4AaFGildk+S
         9Tsn97Z8pxjsSKaZxPyPad9o7j3CgfvzrSYAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717542539; x=1718147339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RRNOn6MGKklcZNQlL7ZC6Enr9RIVqAlFFrQl6ERFrf0=;
        b=ANBo/niiTLux7PPrYJHfWKXXAqgZ3JQOVg53W1RoYHAmKsmtKo5r5qCs6SISdG7ASh
         pnrXRRgD9XQpWPYTjlOqwZaINihmsIQi8r5vM+/g9wEOWLUIlPlS28C1dbDvLZRjHUpI
         rCYqG53ekbvA10nlUps6REbrF1EO+/gjPNoNtwccdOlD3RwFUYhY+d7vFX0EqL7HGyyz
         10QadWM36r+UP2T5gZo/MIs0d+cxR1zcCsJZ8VZ7ks//EOavtJ9Wx51o2EaJq+HGUrSL
         obGiekQqjm6WPjxxKROZuqINOMBOUwNTrNuBYoplhb5CS9DpEZRk4+tyWVh7yfKGNk6y
         9INA==
X-Forwarded-Encrypted: i=1; AJvYcCVzMBsDOCv9+P7uL/Lj5TwfBH1siv3GyDY3lOl7GXiDGNSSYXsEZxPGOzz5r03f3BldbpZJE1w2nV39eUx1V5fSGVO9mqz6YFh4Dsg3ekWQ
X-Gm-Message-State: AOJu0YwJpQrQmKzqG68Yuf1sjeGm5mCgZ+oJDB770st+plEo9H+mRH0e
	5gilSvVLk2iJ3CY+YbgN+3BX8XlZ3dbRup5l2adnKwR8/a6Ef4KwDACRv+GcmA==
X-Google-Smtp-Source: AGHT+IHd9kPwzkTcMHbBZ3TM0b2pWCt7CfkhLEnlAVIFo84Z+1RxCEljWuBq/pMKidPurCPWslr2FA==
X-Received: by 2002:a17:902:edd7:b0:1f6:9010:1cb8 with SMTP id d9443c01a7336-1f6a5a849cbmr8629555ad.65.1717542538979;
        Tue, 04 Jun 2024 16:08:58 -0700 (PDT)
Received: from pc98uv11.mtv.corp.google.com ([2620:15c:9d:2:c108:1a83:e639:e62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63232e0ddsm88931015ad.51.2024.06.04.16.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 16:08:58 -0700 (PDT)
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
Subject: [PATCH 2/3] platform/chrome: cros_ec_proto: Upgrade get_next_event to v3
Date: Tue,  4 Jun 2024 16:08:25 -0700
Message-ID: <20240604230837.2878737-1-dnojiri@chromium.org>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
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
Change-Id: I3af4912c4f7bfdb24445dbbff5f1c6b7a4453de4
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
2.45.1.288.g0e0cd299f1-goog

