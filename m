Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9173F9D5
	for <chrome-platform@lists.linux.dev>; Wed, 18 Dec 2024 01:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734487096; cv=none; b=iB2S6Lpv5oS5dWbUo7VbqHJuu7q2836tEtkwEI5+d3c3AhTN31hJgeo4CVXeXdS/0CTZuQKc3dxfD+O3fsAgCku8KUVEmBRJ1If/Z6RX31MUTQdrdZi+aEBrqj0r9fCO3Wf99QTDOUlCPzKFedTAcsMruTgDAI9Jc+0CBB4zfuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734487096; c=relaxed/simple;
	bh=BENOydFBcsvElpsve8XNmKaW1hEgQWwrmiaAlYXCQuw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=XLSn6YFpqu8bEEH7rUpgPaTrYC8kJe1GQ1XWvoQ1oE2VJj70m//Mvc9sCEAvE9Lmlh69a7vpG9yT3v8TEy0prstAYgnTiD9G7n6tN/Y5dN7UqY95LM5POOyqZczQi5vXD+E63gZ5aPgpy3H/mRXRsHCrVbJkn6IZBxZyfmwFotE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--robbarnes.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XMvTQJ4S; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--robbarnes.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XMvTQJ4S"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7289afa200aso7689634b3a.0
        for <chrome-platform@lists.linux.dev>; Tue, 17 Dec 2024 17:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734487094; x=1735091894; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1QUWFEMVgJcNYDWFP2lpTlp76cDDudW+fhyyQmylIMw=;
        b=XMvTQJ4SbwbCKqv3Br1nvcLXb2k5bjUaXPc9bZzY4KKYZF2tbayx3qfoKf3p0WQdH7
         dMldeBDIBijrm5YSKUSU0Pdq3ZAp7p60ZCcKn16Pnj+AiAiDPiw+7/GoDimXOqflYgp+
         yg4jaWa/bLKbjuBbZpVcMAG95rZ9nEE6swJPCmXtZHVP7nHtK6zG+YZo5ruyklzIuuaC
         kIvFcPwNyZYqssuFuGCnV862109XnkfTDPMdH2/wNcuECT06l9ciAb0vPCtY2rR1my3P
         iyAZ58/nVL6ZCGR3i8COoFGwqkRd0u1j5aduOlRJK8Nvf04PPnSnBrFx5XhUqUOR+SHi
         gJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734487094; x=1735091894;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1QUWFEMVgJcNYDWFP2lpTlp76cDDudW+fhyyQmylIMw=;
        b=fyV4kBFQhoi9uwI18zCOm+JZNqqwwmjBtH9+zjUHMinjjE5h0fMcFZQ98kv1JU3GFV
         Ewe13CnKo+DxYvE9MMTrRlG0FwZuraXhix9ubSUM+QiKwaaffZykH+XgHCyCU4w9TZ64
         TMe91zoSFjJOP0HLghEAGbDRaMxGUMD8R6Uo09AIHnaHQTwRZaKxorG+Ol1PV85U8uK+
         WUUo3KzGc2ZtXijehTgzuibrmGP+6BnI9+E46Gfe2jnalqFEuYbzneS8IwRjEGUSxmMy
         6pQTd+xoZwI3a5EpFF/Z1gbnSVA4boSeDZ7lSAuyPSz+tl1axXB87Z+8XenZ2D8Ko7l+
         GrjQ==
X-Gm-Message-State: AOJu0YwdpjgHzM338qUgAsESqxwqNypNE5vlWRJyW2EP9iWlLlQIaNVB
	BGXD5cVjmiYKOvemYJbC/BP363dQ/Aoi2ea/PBUPYCXBo6WLlUnldXCJeWsBvtkfaYJju7Q3o24
	gIfXoxu/3kUChPA==
X-Google-Smtp-Source: AGHT+IHFeeowND6LmGF2oVcLp4eMKmIWd77UcaNbjhbW5nDWoyJeA8jXH+pR1K02sQZwcqZqcgusw/9Wyr1BATQ=
X-Received: from pfnc17.prod.google.com ([2002:aa7:81d1:0:b0:725:dd0a:6e99])
 (user=robbarnes job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3cd0:b0:728:e182:a8b with SMTP id d2e1a72fcca58-72a8d226adbmr2022308b3a.9.1734487094452;
 Tue, 17 Dec 2024 17:58:14 -0800 (PST)
Date: Wed, 18 Dec 2024 01:57:59 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241218015759.3558830-1-robbarnes@google.com>
Subject: [PATCH] platform/chrome: cros_ec_lpc: Only check for events on MKBP notifies
From: Rob Barnes <robbarnes@google.com>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Daisuke Nojiri <dnojiri@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Rob Barnes <robbarnes@google.com>
Content-Type: text/plain; charset="UTF-8"

Only check EC for MKBP events when the ACPI notify value indicates the
notify is due to an MKBP host event. This reduces unnecessary queries to
the EC.

Notify value 0x80 is reserved for devices specific notifies. It is used
by many devices to indicate various events. It's only used by cros_ec
for MKBP events.

Signed-off-by: Rob Barnes <robbarnes@google.com>
---
 drivers/platform/chrome/cros_ec_lpc.c       | 2 +-
 include/linux/platform_data/cros_ec_proto.h | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index c784119ab5dc0..5405762ea5558 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -419,7 +419,7 @@ static void cros_ec_lpc_acpi_notify(acpi_handle device, u32 value, void *data)
 		return;
 	}
 
-	if (ec_dev->mkbp_event_supported)
+	if (value == ACPI_NOTIFY_CROS_EC_MKBP && ec_dev->mkbp_event_supported)
 		do {
 			ret = cros_ec_get_next_event(ec_dev, NULL,
 						     &ec_has_more_events);
diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
index b34ed0cc1f8dc..7d5b8a6bba3cc 100644
--- a/include/linux/platform_data/cros_ec_proto.h
+++ b/include/linux/platform_data/cros_ec_proto.h
@@ -48,6 +48,11 @@
  */
 #define ACPI_NOTIFY_CROS_EC_PANIC 0xB0
 
+/*
+ * ACPI notify value for MKBP host event.
+ */
+#define ACPI_NOTIFY_CROS_EC_MKBP 0x80
+
 /*
  * Command interface between EC and AP, for LPC, I2C and SPI interfaces.
  */
-- 
2.47.1.613.gc27f4b7a9f-goog

