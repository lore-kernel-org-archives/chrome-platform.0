Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF0E3904CB
	for <chrome-platform@lists.linux.dev>; Tue, 13 Jan 2026 13:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768309562; cv=none; b=G1kUKgiFejz6i0aHtF0j8rpRYcn+0LAKxABSddItMFDo5ohroaYAfkI+f5AspSuXW3iSLSjFfQyguy92KWeyCZB/KxFVGUfiApua7GNkoi8xqe2ISKLxVeM/y4s9ShpsIiNFI+uY2+I4YZ4ERPJHYcy3bS47hTwKVYISvM+kyGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768309562; c=relaxed/simple;
	bh=PBxq1XtnNJDHu6QLFTPbS6fcZBdgfVFC9T9kO3oXU8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=efH88XDBwlzWzTuyqwEevNlevqAV6QM6pdtil9pFD9t/0+LjNLyOaUCEmw68lU65FjLxl9sN88zzFa1QFyj7/qDzftaEHOM7BLyyV7h5bjPCPjx0/yer1UrFmYVCL0wiHk7+PM1r5Zl7Hk69wc9+aaXh4iatGkO7x8QDDhsCqqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=R7anlcA6; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R7anlcA6"
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-b87113bd83bso401602566b.1
        for <chrome-platform@lists.linux.dev>; Tue, 13 Jan 2026 05:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768309556; x=1768914356; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JexYB6ufnP2njfyWsSs8jFTtDnvJKYKAr3d1TGCGR/Q=;
        b=R7anlcA6OhfpQS0YKGG37nrf7kbeX7TPpTMFsNDsoxzr5qovQr90AW5TO5+6x6Gx2h
         lpmjkS+f8M6V2LKBBv8B3VOjUwyXDjy1axdPeaKfFQkdQc89/2uWp7+EHwdgGMZBGnht
         +n4gY5FWI3KOtuxaDKNsX29IEYxzcxEPtFV9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768309556; x=1768914356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JexYB6ufnP2njfyWsSs8jFTtDnvJKYKAr3d1TGCGR/Q=;
        b=abKmo/LfQIyd7FNQjoI3z5EFPch6td2qkA87+MfBJRWkCzuEb09OQitJOpE2n9X5yu
         GelPzXJGy2qa4ielX3jLNzHxy7HNEgFHcXtqgAFoROBt7gzGAnedbn05uRdDePeciSNJ
         7Tm0Wom4igfEnvry7DaXmblWB25eUIA55RVx0Eh2+scPNfYmg5qy6cul+0lACnq9hh52
         YCXHckgxFb6lrYJi4s7VJmKtmdY1j3nBgesEm6Px8Z+jpRGNtmJJIGlVz03TFK8mhu7g
         BWpZJ6/q5x70B886A3nNDZ7uy4AAXKet6FvpfDMY8HD54P3hgIiMlDJDo+ICuP+lsn5l
         fCHA==
X-Forwarded-Encrypted: i=1; AJvYcCX60R1SffTm8YKJPL8ibFYwVwrwIpYynrHEdPMIbC3MnICYlnQL3S/I469/uIBxcKhft6lXQJFZJnWXgX0WNYw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxF0IXfo58y7m+gWexvgom3YP3pYUu7dlDyafzLWKiceI7ZfN2M
	IxgcFPXvrEOBtLGS5ecgdX4DYulD5wMpkKGFe0kLxzaXq/9vFrkc8rRoAGZlp7rQtA==
X-Gm-Gg: AY/fxX6Dl9ghifCQdhVytFaZ+oSunE6bqBQEL/IH/u23aO3wJSxYZWuYNPb5LVrHVl1
	EVozpVUaqChIwqWDgALJfRYzEkHTxRxzP82lflsXGHZHu+yBXJqiIvDyju/VVsSuDNuakq78UkU
	tRyJLJwCiEMimwkMdWnd+QGCEhqwwgeDjNyhnGGrKN5o4IUQ4CFFdZDgFCZLmMOtjUtoY5WW4Lm
	sIGjfBaekkdPczQaXnoOEaRqx1TlNizD8is9Qj5q7Th6+T6LMh3UQSF7VakUhkaBuWgrckvNl7R
	qmM3+8wM8ndNAcoEbo1Zqb4RHN4RWEErVe1t8/C1NOBG3ePAjP+Qmc4iJRXNe9srXD7oDKM/kDH
	z3sfFISN9PxtteeUX0lxhLXBEIuv0qBgpzH+M3u6Jy/f+uGT2gNRvBl2uKv2yAh7F4u0/BOJCH5
	DFKLnIRfi6AcaJRQtPWZ9RG/llJuhFb0+jJ9SqepZZXF7YoDgVf15lOpni1e4nq5rOABD3XV97+
	gnGWqJsMhxvu0uMH0U=
X-Google-Smtp-Source: AGHT+IFTvE3kPXoaMFaHVoxvyk8+opt2tAgG+Q3yLoEc+MEmRNu8mDVwkVmFMuobpUoOnxGKBIsrcQ==
X-Received: by 2002:a17:907:702:b0:b80:3846:d46 with SMTP id a640c23a62f3a-b8444caab67mr2155678166b.20.1768309555953;
        Tue, 13 Jan 2026 05:05:55 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b871b5e60dasm586217266b.63.2026.01.13.05.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 05:05:55 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v4 6/8] usb: typec: Introduce mode_selection bit
Date: Tue, 13 Jan 2026 13:05:34 +0000
Message-ID: <20260113130536.3068311-7-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260113130536.3068311-1-akuchynski@chromium.org>
References: <20260113130536.3068311-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The port driver sets this bit for an alternate mode description to indicate
support for the mode selection feature. Once set, individual Alt Mode
drivers will no longer attempt to activate their respective modes within
their probe functions. This prevents race conditions and non-prioritized
activation.
The bit is not set by default. If left unset, the system retains the
current behavior where Alt Mode drivers manage their own activation logic.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/altmodes/displayport.c | 6 ++++--
 drivers/usb/typec/altmodes/thunderbolt.c | 2 +-
 drivers/usb/typec/class.c                | 1 +
 include/linux/usb/typec.h                | 1 +
 include/linux/usb/typec_altmode.h        | 1 +
 5 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index d96ab106a980b..d185688a16b13 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -804,8 +804,10 @@ int dp_altmode_probe(struct typec_altmode *alt)
 	if (plug)
 		typec_altmode_set_drvdata(plug, dp);
 
-	dp->state = plug ? DP_STATE_ENTER_PRIME : DP_STATE_ENTER;
-	schedule_work(&dp->work);
+	if (!alt->mode_selection) {
+		dp->state = plug ? DP_STATE_ENTER_PRIME : DP_STATE_ENTER;
+		schedule_work(&dp->work);
+	}
 
 	return 0;
 }
diff --git a/drivers/usb/typec/altmodes/thunderbolt.c b/drivers/usb/typec/altmodes/thunderbolt.c
index 6eadf7835f8f6..c4c5da6154da9 100644
--- a/drivers/usb/typec/altmodes/thunderbolt.c
+++ b/drivers/usb/typec/altmodes/thunderbolt.c
@@ -307,7 +307,7 @@ static int tbt_altmode_probe(struct typec_altmode *alt)
 	typec_altmode_set_drvdata(alt, tbt);
 	typec_altmode_set_ops(alt, &tbt_altmode_ops);
 
-	if (tbt_ready(alt)) {
+	if (!alt->mode_selection && tbt_ready(alt)) {
 		if (tbt->plug[TYPEC_PLUG_SOP_P])
 			tbt->state = TBT_STATE_SOP_P_ENTER;
 		else if (tbt->plug[TYPEC_PLUG_SOP_PP])
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 1fb5450c0a2f2..9b9254350733d 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -655,6 +655,7 @@ typec_register_altmode(struct device *parent,
 	alt->adev.svid = desc->svid;
 	alt->adev.mode = desc->mode;
 	alt->adev.vdo = desc->vdo;
+	alt->adev.mode_selection = desc->mode_selection;
 	alt->roles = desc->roles;
 	alt->id = id;
 
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index dbb259d885266..d61ec38216fa9 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -155,6 +155,7 @@ struct typec_altmode_desc {
 	/* Only used with ports */
 	enum typec_port_data	roles;
 	bool			inactive;
+	bool			mode_selection;
 };
 
 void typec_partner_set_pd_revision(struct typec_partner *partner, u16 pd_revision);
diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index 89b285a4ee7e6..4bde80e4c9b0b 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -37,6 +37,7 @@ struct typec_altmode {
 	u32				vdo;
 	unsigned int			active:1;
 	u8				priority;
+	bool			mode_selection;
 
 	char				*desc;
 	const struct typec_altmode_ops	*ops;
-- 
2.52.0.457.g6b5491de43-goog

