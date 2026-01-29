Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF3C1DDC1D
	for <chrome-platform@lists.linux.dev>; Thu, 29 Jan 2026 13:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769692779; cv=none; b=OU1m7K1TmU5GpVjcabg4vrkV+DM1rCGTWO4JxQnyxnUa2N63fosBH5yvPLrhH08tvHK0P+hfxJo/nnWqxYJIZUrU6rMpM5UjMNRdepHxUrfGMVX3gtytn6Avr9heyQeas558YYHfv18DlRz9+n+J2HrtB40Gh4Ae4k0glAb/vDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769692779; c=relaxed/simple;
	bh=Rt7oqf4nLVnHhwzd4aacoigz4YCbsGX4tp95FrniHnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R42qlPfAESql0tA6NeBmsJZiQxmhF8KdP9L/PzUNYsA6ogfGwEyylXvV1NSms8pJJT5kUNwOZTX8kh/v9nbtVBExHjAfnz8ROZdViZH9Y/xvHArarJs+OewD1xChvW/aEQWSgyFE8CFIZsPdFW0R5nqfkP3HKDvQl4l7K3uCzoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KdDC7Z34; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KdDC7Z34"
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-b8845cb5862so147677766b.3
        for <chrome-platform@lists.linux.dev>; Thu, 29 Jan 2026 05:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1769692776; x=1770297576; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQZC8UCrEj4+vjvd4YboeC/yI3stsoKr6nmv+kw+WfY=;
        b=KdDC7Z34wLJu2N4vYCxLANgaUHzXwfU9eGbqqbvurwtQCrCWhvYhH/OEYvTIlmK2w5
         7qdSslSuOWn4RsmccYWL0q70Dx0sDBZGOylPLN9Y2SPtO8vzqGUFiRNn9p7Tk3BGz19H
         vLbb6VnSEL7Ac9uZ/VYlqu7wukVllOL2DP30A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769692776; x=1770297576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oQZC8UCrEj4+vjvd4YboeC/yI3stsoKr6nmv+kw+WfY=;
        b=trtg/X+F5BWSZWmDzUYh5c76OHO2AVsFFHXDe43YjPV9qt+EnpXNvn7iXTYh7Vus5x
         AzWQQ9wacDobSBQibKH0asmEbh7xCxKLChw1sMJYtPl9yPl4cfW6bDeddlKx2yByoKUL
         83bVO5E7/geyTTXA1/HRbvfTjkYo7sQOJAI6VhGbJ4l1zkh4Ti74xd0LGvG3NKVPFT5y
         d2GCnVeluKkkUeE/TdNLiMO6Q1YjoLjVuK9fYjqhEdKGVbpuJgz0Dyt7kJh5UXaGB4Ws
         V4UDTdNOHvdXakV4aF17jgLGjbGBVGjzC1H22hX6rbmQ8/wE3GbzHtQnEc5jePJ+I045
         Lc8Q==
X-Gm-Message-State: AOJu0YxHlYiIlf7HnmoRoyas5AT55+vul2gGehQxM/dlaO55AXLFxd5f
	+VN8fwIJzauZYCvi+WrIE5MbdbY08+pXieEAPuonTNCmIhbkVQN6jwgprdcxUH8ChA==
X-Gm-Gg: AZuq6aIli8xQOZj1TfGrxWygpLXJQ19EbiFrwqQopffyDe3sGCNMKQybqZNjSG8bg3j
	3AsDfEgWLsTsDJTrPOQCUhKNSu5ZosXW2VbUgG1wMZ6Hb9pl4rsYdfxRWU7jWkMHRAPVRD9Q/vE
	qQSLfwWeHB+zMQKx3Q1UkOUeERUkmeqXUhLH4qsY+M0g6GoXYSWWqwSOzb3RziwRGeAXV84LqRw
	siWuSHCPBzmF1kdv3E3hZwrfagpGlqpsxNwLla0JuvtJIiA4L5IZxobXR88Ao6T3D2XFX9Tpewj
	4jJuTtIO0O4QdOsOuvn3jxxPMSGf3IM2ABk5+klyQpUyK8/r2x3cQDtrawFbUGoqXVm6Lx8a8hZ
	rnkJG6l97r4FQd8phjMMZdglUanDyXxYByurh1Net1Wlbm6GQh+hlKeuOBSjZ+5Zlj0e99geIw2
	Wvc8ue4t9ht8tNu6sj4PWAJ/+efwYNRawiT8lBNtZbiDtaH7YnWUr/KOPyJON08tYgfVDHYR7Hh
	xtSNXRY
X-Received: by 2002:a17:907:1b24:b0:b88:716a:e4ae with SMTP id a640c23a62f3a-b8dab40f422mr631442966b.61.1769692776141;
        Thu, 29 Jan 2026 05:19:36 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1baa42sm262666666b.46.2026.01.29.05.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 05:19:35 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 2/2] platform/chrome: cros_ec_typec: Reorder altmode registration
Date: Thu, 29 Jan 2026 13:19:28 +0000
Message-ID: <20260129131928.794768-2-akuchynski@chromium.org>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
In-Reply-To: <20260129131928.794768-1-akuchynski@chromium.org>
References: <20260129131928.794768-1-akuchynski@chromium.org>
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
index d14bc90a62e6b..05d802c92075f 100644
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
2.53.0.rc1.217.geba53bf80e-goog

