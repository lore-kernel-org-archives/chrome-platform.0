Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5672368266
	for <chrome-platform@lists.linux.dev>; Mon, 19 Jan 2026 13:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768828739; cv=none; b=DvV5KhWvzjoMe293NBTvB4wkZdspFy23bdkC/OJFEDFzDK46iyfShmYETWCsLr0wvqG45mpHIbu3Fa6skhCJKfwlXmSybsOWtmSIAOLyXBhGWEu04uYRvChMd0QV6Za23po7NSjoI+OcIhhpGCQHM2xECMAaOfT3TqBHOezMyQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768828739; c=relaxed/simple;
	bh=PvMl78Egz6bmb1PsfFjOs6AkxoGFu1IQkxwSzJj0RZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Khp1AF8mPcvtkJNUkY8EsrNb9Z4fUM5D57HEvsIZTj+KRf84xGq+tG+iQjphz+oNPmDU1xYTjbn/nSTabVfmBTpW7AzXGij9YRYMG1GOGTbicjpUGshGBzWJ1cmPP+OQCW97Mcl6OQkomyp03QIrapZf9zsEdk/JeMK0jR0CGLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OZEjjby5; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OZEjjby5"
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-655ae329d6bso5706383a12.0
        for <chrome-platform@lists.linux.dev>; Mon, 19 Jan 2026 05:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768828732; x=1769433532; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDnniPjMK/sJQN7VPW7dqxpb712evvAY2y6naw6LGNE=;
        b=OZEjjby5+xINKwTMUqyWRHA7+dQPDtr9OM0KJUSshDtQ9Y2A3Ma75rIj/Z5sJDzFH3
         cLaLwVVI8VR+8jlk42Ky8EWkT887DOhegUiGfol36DMsPu1OcsCSbZWbuj1Q2wGay4FC
         /FShYWZojapHvM9pHad/TI2pgYbfB40LLjJjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768828732; x=1769433532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dDnniPjMK/sJQN7VPW7dqxpb712evvAY2y6naw6LGNE=;
        b=DcxYvjyiDD6tE/FeEOmNrXKsiviaO5V78xADeKLw3UeMAStmmn7dliuuaxMdMTluRX
         Pvg8Rj/0DN4rK+BBJCF629ns8dNugZ7mwpR9Zgbr7qNZ6RXlHKaA4sAaFt6uUB1xkGjd
         DaHPWE8ybQlj8UkmZKcPcIZiCmX/2LGWalU7/yDb/qMcRVXU7R5++G1QNcNNadVCa0eB
         OhDXzbdcvLECu1QfqFozZ/mVkHX5Solg9gsaw7+yWE/sh+H1m4pWAXxbgQbcKUHs82Ig
         n7z2a9mkdzil9AE1Xb1hWLVplsvL3SsFvaGXC+8xltDua1Cj9iCUj36isCBPFqRthCb3
         mFZg==
X-Forwarded-Encrypted: i=1; AJvYcCVUbfcOFAhU6V8bO4DjsYUE/lUqGiRZKL/LzSxa50u0TkvtjZonFyb9/+wkNH4rRG2i4o8PeyH5knMlpW+4zDU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxbLxAptjTlQCTIk/FDdnASruSK5obfXX/r7HizM3S9utKB/beD
	ghFOFo368lV7elXT3trL+T9NvLeoQ2CoCY01ilAS/dfiNCrcVBdvtjkJ14VLIsENrg==
X-Gm-Gg: AY/fxX7yadrdU02foJAgLqgUePbUn8HPScRpCOGw9tlmH7rIq+QHZsU4rpt1Jgtnoe9
	uyyXWPGuVnrkGEgIu0kxQccnEZ/OlJyxcgnIzHgX5iarXTCsvtCxNa1s93+71a1qdiz0unbdPi3
	f1Bbbtcu8FlUFkTLQN4jJ4PTHIFyijdv1dX4zlfUnQTnizYTk+S6BazcfXrTyDSGYf0259Lw+6Y
	vjUL0GTrQXak/EvbmWNS3+6h/+ymoTpF95mCKsjH0hxDpdle2+P8ZVs8US61rquUeKiZDTdu8nT
	1+XJuwFn7UyZKUxvNmhIIPXPPkzTBWalHKvrPObMw4rCiamxbocTW1O+tzjHhz00tOtx/0/IXUM
	yoJ/8XsQUGwU+Db1fKBCNafqN8ncR1SUiQJTYi6m75TbEupMiBPsWDD8ZY50mZmFsvFpT2WBCIt
	Fpr7nhOBfUgyykeO/TUtSNihIAl5JN9AVzAWQmB/ACkuFwgBsIw7ImIRDhChaD5nnZnh20yiTcV
	+SalIIq
X-Received: by 2002:a17:907:d1f:b0:b77:2269:8df0 with SMTP id a640c23a62f3a-b8796a5a491mr862916266b.28.1768828731903;
        Mon, 19 Jan 2026 05:18:51 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9a14sm1078801866b.45.2026.01.19.05.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 05:18:51 -0800 (PST)
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
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v5 5/7] usb: typec: Introduce mode_selection bit
Date: Mon, 19 Jan 2026 13:18:22 +0000
Message-ID: <20260119131824.2529334-6-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260119131824.2529334-1-akuchynski@chromium.org>
References: <20260119131824.2529334-1-akuchynski@chromium.org>
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
index a48c447125184..dbba53f024977 100644
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
index 70026f5f8f997..0513d333b7977 100644
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

