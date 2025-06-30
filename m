Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D602E28C5CF
	for <chrome-platform@lists.linux.dev>; Mon, 30 Jun 2025 14:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751292778; cv=none; b=gwi7/7VQFUwyNbhVPs6TuWPnETBzN0zykuBZGyXdtBz0kYMn1CvE3AEvv1Eo34oUd+G2Q16P93tjhgCvTUneJcwdiG9fb9HbiHQnyrX+v/vnyXBS5zCbPlqEbVJ6NjAwCimDfbdYVHU8jWQzBL1y2YGGDz7x2jDpEXJzCqvivCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751292778; c=relaxed/simple;
	bh=ytxK9BrkKoT/N8cg9coC0zFOaRK3Cp6/HIU92e99cEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H1vKgEIWPe37bl5WRtQmoKR48/9x+SkBPe8qgMBFuaopDLppGcC9HXrZM4VX0m6ahVcXodj6p2uT3wIY7Nbxl4lgDMmBrGj0fiC8yQ6LqrHKOKa/oaMbtPmybn9YGA5LVpSpDFjD8URXlE8/xI844Xdf9fmnjXbpt60hxS4uQ7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=d1N76KKY; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="d1N76KKY"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so3321743a12.0
        for <chrome-platform@lists.linux.dev>; Mon, 30 Jun 2025 07:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751292775; x=1751897575; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BlOV7R9ML+sYKy5LsxmrHuBwhtr5k9iFt4a13bQXPG8=;
        b=d1N76KKY6IZzCfwy7csq+q98Mr7uT79IjGMD4WYwxsUefCiZ4JEVmjLR4s9jALhlkM
         +nkvOER2B/mRDMgglVoPEKrwrGE8RGio0JBz0x2rY0f4lbTUZ30VBUUA30pyJP/JNjnT
         XEMm1p3p2KdPsJIaHdmRQEg1VxdQzqgqk70fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751292775; x=1751897575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BlOV7R9ML+sYKy5LsxmrHuBwhtr5k9iFt4a13bQXPG8=;
        b=h0sUBzhAZFTWXgXeppOjheyPonY2/N/yX6y2p7OGQ/bZ7ARpepsPLbB9lhvLVh1sF5
         9CrZQEVCtzn9kLfHSiOVjtcK3awjEhTa5lN9TkYtWLHLoEvk9ZJo/xXiXUlILRlDoR81
         u2jOwZ4m52CtJ+GWkSRxHCW2va2AlHX21ZWEfq+9LXUc/nyJswPly/AZWGGOBScAHZ1L
         8AoDte9FPp2+wljuRJUbwfLN2HEeDBwV3L/LB7H2OptIi8g1OY4uKUjbvM8FHAqwQbTD
         0n2cr4vYg6156hQGjQUTHCCME21WwrjbmGZWDhMRkLV5wBNkextnL56U6102JfLrSNHe
         5RaA==
X-Forwarded-Encrypted: i=1; AJvYcCWCQrgY+/7oHTlYm2OIBDqFB/vlqoDenn4caNLpSU16B6uoBiwcjmoVeQBqwhWUMLSXQK4tQuOjuVD5mvUKg80=@lists.linux.dev
X-Gm-Message-State: AOJu0YwtGGVLchHCpCjO2RlIpYaxGv2TXNpVTEWCsB2JUmbewsu7wq8W
	0T7qJyxA5FcpPB5VMaaBEF6ifFvYCKPiE40jq6d/nW6oHNhlSqZrf4+HC25NcQ1b9Q==
X-Gm-Gg: ASbGnctyBmDFkqsEnuDqZ5hzuhJpmZXNurbMiB3aT2tHWEJiqJPX49CF2pB3QhiS+js
	YvZEcvlnoSnZOjvI1C37yHqGpwgVYYKmLAttAnXYTrNqoRI2TYUVSKmoATZuBrfbeJgJ9Dtj5gR
	XKZCyEqtvohGfuk/6JYNG67QH9NPcBq/GNpcCwkoMZa/uVqeAIsOUv+8dEUW5ihoDrSbdJ3mFGU
	OfEVmE8FN86cf90rwKxJvaQJwgWfZ4V89YdTkr5Y94yTLDg3QBj6YgzIhkSxxGf2yrnkucWPAq7
	KF76CAYnzSGi9nARPeYa1gEBOdjjLAi6s9GwMDFcN//tvBx43YMchM3KXO1DJx98/d29GjUkICF
	wN/J36tWx2yzKeTRrKdY6oSRDd9H9f6RJCGyohz3ByKVEA/7zJ/Ng
X-Google-Smtp-Source: AGHT+IH7cGazfkX+Q/r6UXJxDNNrYEeVRMUy3tM0qgcbXb/BVt0v1LwGWdxtyfIaNhvclHwiul1KLA==
X-Received: by 2002:a17:907:e2cd:b0:ae0:7db8:4189 with SMTP id a640c23a62f3a-ae34fd38c3fmr1311198066b.18.1751292775141;
        Mon, 30 Jun 2025 07:12:55 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (72.144.91.34.bc.googleusercontent.com. [34.91.144.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b416sm670643866b.28.2025.06.30.07.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:12:53 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 03/10] usb: typec: ucsi: Set alt_mode_override flag
Date: Mon, 30 Jun 2025 14:12:32 +0000
Message-ID: <20250630141239.3174390-4-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250630141239.3174390-1-akuchynski@chromium.org>
References: <20250630141239.3174390-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This flag indicates that the PPM allows the OPM to change the currently
negotiated alternate mode using the SET_NEW_CAM command.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 01ce858a1a2b..1372becaec82 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1616,6 +1616,8 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 
 	cap->driver_data = con;
 	cap->ops = &ucsi_ops;
+	cap->alt_mode_override =
+		!!(con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE);
 
 	if (ucsi->ops->update_connector)
 		ucsi->ops->update_connector(con);
-- 
2.50.0.727.gbf7dc18ff4-goog

