Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793178585;
	b=koqfdZojVHQ9iUBpYC+IcfVs20dll+fyI9YltseqEgN1br+GuBc6fwp2fTQFkx0ujife
	 w32vY2cYl0/aaIWgAaj12w3JgHjE0ZHJBio3DOJDqZ5VyMufURh5eefjewzyt5ToSQSxv
	 eUP4AX/MhCTplairAlnkO4SbuJukX3xauMiAq4SJLgBMG+Srm85CpSHAyOtENH1WDnor/
	 jm+uTkcINAiC8yFb3vrJx5KwYhIO+WktQ4bFq5dnbQQG+pxKi6anpAeWcWt8hSjlpFWmn
	 3ExWYmBLAxQN/1rDysZvh399AOkwjT0j7Ffdo7sGOrT0uCNMLwZH6hI/zkrQFbiInnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793178585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=X5gxbQQkcGFQMG1g4awPky4j5Q7AWCJEpP8DpLUAuiI=;
	b=MzUdR5uPvb/sqFKBZhqx26lzNbc0kHFc5lZ/X/psX9Ziv8UmK2eY0hmUEJAYziT4FLbk
	 botB9/BMH0B//OOTOqG4lrZ/h//J7G8bsT+6MN1sG4Qq/hS+pb11YagHn+XkdmPnKyQVk
	 6HcRdDJPpPRkUgx+FhNlHHMjq6azQN2H2lnqSKIGi56W/XY0joM8l+5dyS/AEeDVX38I1
	 2Ke2Ym05Pu2B/U+hnd81cfrdv+0VbSrRpV6XbeSED/Yn3RgfAPbPgteRsEmNoOL9TwHxX
	 jkTIcKpTQelkyFb1egiYgNKoNnJsbxwcvlCY4rpYyuoZa++zID6CyJ8KpXCzkH9N/6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Eg4lzdWn;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851F3606A33D
	for <chrome-platform@lists.linux.dev>; Wed, 28 Oct 2026 09:09:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 851F3606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Eg4lzdWn
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c169ae1cb26so281341666b.1
        for <chrome-platform@lists.linux.dev>; Wed, 28 Oct 2026 02:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793178583; x=1793783383; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X5gxbQQkcGFQMG1g4awPky4j5Q7AWCJEpP8DpLUAuiI=;
        b=Eg4lzdWnSc99kClNUsRzmY84NnszaW4lCW0eQ0nGSs26mDbvz05E9BayCMzcoow565
         /NvY83j/kOQCn5YDSeegqvxhLdsATzQuM2W0Y6iQ5F1IgdlwMflOneqLqMYXbPNBUztq
         a9694b6xJCbUT+iszn+g/4Q4lrCDAT6MCfsVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793178583; x=1793783383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X5gxbQQkcGFQMG1g4awPky4j5Q7AWCJEpP8DpLUAuiI=;
        b=GS+V9fn3prWwdJuyNfO2auw2CBKHXgffuUXAc7QocW38/olQnQOG5czq3Gn7Oii0lv
         4gyz+nBJK6rxRU1lf78Wtrj5SEtfI/2NiPTQLynxiIaoEviv1qqyTFYoiVlMv4NKf8kN
         37HR0a8RNLU6pIQBEfYmP2ntBzAXbWOc4LCmGezCcD7sjmzjNO/nlOUnN6c93rjVC2pA
         QFU7RY9fYN+ufIJbHOqxL6J5SNl8Hqy50JVqBiJq/pNDI4Msgi21A1YkNLC/0sOWgY+F
         ti2odYhXjSYOZDm3Im6wMj3ihddMpEMlrviw1YhFCuCj9K37KpWyanlA7JuW7Qouq/ew
         JyBw==
X-Forwarded-Encrypted: i=1; AKwUvBwt5gaVdggfRcG5GBQY+biPJClNUJlciJAYHWPOPkiLnMOWz5yIWcx8JmFjB76u3ZYyB0y4M7kYOOsmEbeoxVA=@lists.linux.dev
X-Gm-Message-State: AFq9FYJhHrn4E7xDpuj6jSbk+NmcDjrUj9E51l7ayWKMp4l9DHwfqexD
	hLCpZZUQmYK+cAlBFLsS44WB6H4Gnn9JLar6LcQ89V7bB8JLjoyNdps8X5jaPy2V4Q==
X-Gm-Gg: AYBFou3ffVpiRC2N8J3HGkh5HWhRdJ/2xxhuoASe4CXDO/TpC9AXEUW3X4P0MymX+Cv
	FtUhQWPhJfJYkL1IL6NzEXP2CTFatKY6IONjgPd1C3+Dr2+ImueCPsf4JEsGroVgZOcco2bVjBL
	0WTKjv9Rb1sxzAaJ3uFsOFDmcAO7p+M5faTYf8obZUCFxgIpe1pGvOCoxfA/3bakQE2nisiywBN
	qKAqplgTiYKXBP/CzNcROVoDBtoaX030ryxGMCFjlGsl1mE3W4KDcaUMLxZa6uJfYqj2LfaCmwr
	d6Z0j7EOAIW/XvDk1EdND+t8hdh2+wy4VmGgEXD+Zd+iaiNv7jAVIxqVdjzMNeUjYeG30dkV4Uf
	f6NcMn5INrdBdVQbh9iokx8VYtMMYJoMeQ7vJq0Cy+yD7w/cUwc3sFl1wioTyZrBp9ox3Sn4tHV
	kUb2YXCZVrGvPADN4OsFRZDC1AEP84Bup9tRL7I4Lx7Hns2M+RliZWvZfuOjNOQxVfsfvxzrmWN
	DqYNDndmUnFIz7x5naF0cvSSLJujrJ6YNArv+QakV1UCVpukX3W5XHYe+8abETnLLlnZrf/TrXM
	DJhWBDSxB+VOpgQ9n4wibCpNVZ62c6Hn5wxrNHjepcB2+A6andbB5xOplZRGGCOn7qxpsHDu
X-Received: by 2002:a17:906:9fce:b0:c32:465f:826d with SMTP id a640c23a62f3a-c49c63455d4mr65200366b.17.1793178582975;
        Wed, 28 Oct 2026 02:09:42 -0700 (PDT)
Received: from localhost (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-c49a530f520sm255582266b.23.2026.10.28.02.09.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 02:09:42 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v3 2/2] platform/chrome: cros_ec_typec: Reorder altmode registration
Date: Wed, 28 Oct 2026 09:09:32 +0000
Message-ID: <20261028090932.27053-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261028090932.27053-1-akuchynski@chromium.org>
References: <20261028090932.27053-1-akuchynski@chromium.org>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By default, alternate mode priorities are set in registration order, with
the last mode registered taking precedence. Changing the registration order
of alternate modes prioritizes DisplayPort over Thunderbolt.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 89d29ef040879..11d9589422eeb 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -406,16 +406,10 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
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
+	/*
+	 * Alternate modes registered later take precedence. Register DisplayPort
+	 * after Thunderbolt to prioritize DisplayPort over Thunderbolt.
+	 */
 
 	/*
 	 * Register TBT compatibility alt mode. The EC will not enter the mode
@@ -433,6 +427,17 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
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
2.56.0.385.gac671c819a-goog

