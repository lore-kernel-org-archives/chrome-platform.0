Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6594A7C84
	for <chrome-platform@lists.linux.dev>; Thu,  8 Oct 2026 13:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791466871; cv=none; b=jRvHO7ubVzksdvMqdW9/WaYFUwRGb8RD58uyQxTe2jMrZJZipGyexyIRDIP2eKW6edUo75llSOooau9OLr5eDd7qZB/31K39/5wi70eD4s4ansUW3LRoMz7ABEgj2eoMrEVwe7n3v3Ic+JwS3QDqd/uy7yfBl/doLdfu9BWFhGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791466871; c=relaxed/simple;
	bh=zgp1/gGuTnwMghqlYV38OJy5VaKD7f7ReNmuyf/5cew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i7UjWuLllbJAvclGG8Xpbkq8EZr02r+y7XcLcr/TdLuH1bnqkqQPJf4wYth8pOpOVfCvzrIYHuyNXQhxrsMrjYisVTyd13OC5nDoykEt3zre7DoYpHBhg69GDuIafQt+FkYmXilxNIvgY6K+90YhQXbMNmmT9UF9RL1FYatISok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jpxaqUvk; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jpxaqUvk"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a601ba6870so8920325a12.0
        for <chrome-platform@lists.linux.dev>; Thu, 08 Oct 2026 06:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791466868; x=1792071668; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2l0t7dKLgwExUCHyyv4eA7VEw6sBlfJKEK03HM38Su0=;
        b=jpxaqUvkIkeX3FLSRrwVNqX7KvR8fXgoOi+3mV6A5ezJiG+CtIBry59kmnuksYCDYX
         pBDIs3SljbAkgDa2Kbl32z0hAgd9Ld5BO0R9j51VcwRgh4lz4rsd0HL2rSRx+vCadnv4
         rYgK7Cc7qfQWxGr8wHc/9mT3t1nM1kBm0GGLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791466868; x=1792071668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2l0t7dKLgwExUCHyyv4eA7VEw6sBlfJKEK03HM38Su0=;
        b=QfVJgSQWQwsmz+QiPWmjzpOe4UiKbSjP2ovN/7JH5q4EpC7nwxwQuuxBwTaIZhiGN0
         RMKsNwZuRBxEH1v30mIxw3We8XZFQndYNRADikZ+aZbHH5/rh60M7gWXhxxgB10gZxjU
         MQX03b75bYi3OqpM6F9UC7GjrzKkNR3GJOePCm2+mDq9iXKaXXVOQIuUy+/RmJqXPjaL
         Ly4XTZki8vgdYxd+YgdC1aVNJRjgxYTml0CdJ42d5RSjJviS8Vgmc3NXoylV0WwxDe5X
         4EXoHV4JWVZEsa5Rva8OOQNfEzTd9qk6AL2EKgxuduEe+vfciWvWT2RXJZtyS5i18vYi
         +XhA==
X-Gm-Message-State: AFq9FYKlyQhZuyvcSHHJEdO3ELJ2X4iBUIAktyXQ6g2DhL423JDwprjH
	rx9WpPoGG1U70gSwxStkCAH5p2sI6gQO7Kq5XJTKH0x8kA/WWAHliR91onrPScyklw==
X-Gm-Gg: AYBFou2AwGK5LK1xXU5gp5wdT1hrvBhWLYqp8iDooVBzAk5t2T+I/I1y0GKB29Rs5aH
	B+CMdhiQizkN4FNInVcQJqo2xEXh4xdnn3Cn7qnF9Wg6Um1jz+Sd9paokG6AsbkriKQqEik6zHM
	PjEuJ3E/bY5xa+NL5k464wC0NEgNQ1FEWL5cp0KT0BM7mfmv0kK75pPhYLcaYfM7n1LThW7T8l3
	xfhNtM0QAJUEvFjVGeJMwlCHu48YSJ5cdfqcu+E39WowWe4Kju8R4028fJstC2zZwJdoafajgjc
	T2zLu/yFZgb3uctnJioscen2KF4EDyLMOedgNdYOjyXLGrYZOIETh/QkRXANhhrd2JkeA6Kbg9p
	k03vrn2hoyMRrqaPToW3DCrQmu8cZEAgfY2uiv5mi/QZ43SlSj+2SMEeX6Tuy8O+FORZzMgPUZC
	DVmaEqqRBW73/vfN6ATgz12z5imCdxjLRK4fYdhBDLZmVJE2jxsthWfWBCa0YtQk/Y4XAkdwQgf
	XmRh/BJOae3cFdO/0YqC2FAPDrADNF93nji4IBENw==
X-Received: by 2002:a05:6402:27d1:b0:6ac:8dce:5a8a with SMTP id 4fb4d7f45d1cf-6aff397d37amr5410511a12.9.1791466867601;
        Thu, 08 Oct 2026 06:41:07 -0700 (PDT)
Received: from localhost (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6b00a921c67sm1407491a12.21.2026.10.08.06.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 06:41:07 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 2/2] platform/chrome: cros_ec_typec: Reorder altmode registration
Date: Thu,  8 Oct 2026 13:40:56 +0000
Message-ID: <20261008134056.3816556-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.56.0.360.g66cac248cb-goog
In-Reply-To: <20261008134056.3816556-1-akuchynski@chromium.org>
References: <20261008134056.3816556-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By default, alternate mode priorities are set in registration order, with
the last mode registered taking precedence. Changing the registration order
of alternate modes prioritizes DisplayPort over Thunderbolt.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 718d06fa24132..b1bcf2ffb4176 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -406,17 +406,6 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
 	struct typec_altmode_desc desc;
 	struct typec_altmode *amode;
 
-	/* All PD capable CrOS devices are assumed to support DP altmode. */
-	memset(&desc, 0, sizeof(desc));
-	desc.svid = USB_TYPEC_DP_SID;
-	desc.mode = USB_TYPEC_DP_MODE;
-	desc.vdo = DP_PORT_VDO;
-	amode = cros_typec_register_displayport(port, &desc,
-						typec->ap_driven_altmode);
-	if (IS_ERR(amode))
-		return PTR_ERR(amode);
-	port->port_altmode[CROS_EC_ALTMODE_DP] = amode;
-
 	/*
 	 * Register TBT compatibility alt mode. The EC will not enter the mode
 	 * if it doesn't support it and it will not enter automatically by
@@ -433,6 +422,17 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
 		port->port_altmode[CROS_EC_ALTMODE_TBT] = amode;
 	}
 
+	/* All PD capable CrOS devices are assumed to support DP altmode. */
+	memset(&desc, 0, sizeof(desc));
+	desc.svid = USB_TYPEC_DP_SID;
+	desc.mode = USB_TYPEC_DP_MODE;
+	desc.vdo = DP_PORT_VDO;
+	amode = cros_typec_register_displayport(port, &desc,
+						typec->ap_driven_altmode);
+	if (IS_ERR(amode))
+		return PTR_ERR(amode);
+	port->port_altmode[CROS_EC_ALTMODE_DP] = amode;
+
 	port->state.alt = NULL;
 	port->state.mode = TYPEC_STATE_USB;
 	port->state.data = NULL;
-- 
2.56.0.360.g66cac248cb-goog

