Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BD523E32D
	for <chrome-platform@lists.linux.dev>; Thu, 14 Aug 2025 18:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755197107; cv=none; b=SWOTtdK8Rrq9TTwhhp3nbSZFYfY+yWQFaKW7sE32c2aEsU/7ysraM3lsBF8t9YAJpdoDjdv1Bj8Fm6eKqILowJ5ZFpcjTlojXsWxI7TkQWUN2XOWRBw/gyqRnKRGuksawdM6/DrQt+xNDfFUF28PYeqU3X2d87lqEj4ms/68i9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755197107; c=relaxed/simple;
	bh=IIWLTCm4iM4o2ycYzWp3RSfJLjwCX7bGklc9T/Y3Grk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pfPQmKv+G2ITg5n4Q28ANLPvs6mM1ncuatT/iFDC1UFIYbZxvc9mIh+IXHYsWeOZF22BN/drtseTM/ATAQhY80kuXHue/0EFaA/W0+s77zVltYVIPFfj2Ysz2Kz1CFX4T/UdwAHm3gf9LmANgQM+JTICTuQj+gOMM7QT05ZboEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YZnQT31O; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YZnQT31O"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afcb73621fcso174597666b.0
        for <chrome-platform@lists.linux.dev>; Thu, 14 Aug 2025 11:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755197104; x=1755801904; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgWNu/lsijOtg6th5ui9qnvyOY7w+iUxq5UAg/411GA=;
        b=YZnQT31OzNuyjvLECgnLtaaiLV4Bb8cB4Kje/6+RQxCwoxDRYQxEkbsY7Uso7CV7Yr
         g5rSX/BDZnWZkZWHcH5BmIv2vqN1Wl12aOsnYy93vKgPSTh3uom0qBVarM9jiWHZH6jj
         UKbsbV12HX92ZFeZsW8Eqoesh3qu7ESA16XuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755197104; x=1755801904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sgWNu/lsijOtg6th5ui9qnvyOY7w+iUxq5UAg/411GA=;
        b=rTkFLXXBlhkKZ2wZpQRUKI5hzMjfCCRkckiBbAOEi6a57WvPb8Zd53W/rIuA82qm6E
         qMQFrNaIupivT3pWUIlgUhsversHiXPo76IQxBjcY6K1OR9Xm+1IwTw0IEK4XJqne8my
         8TtIOEiI33owNfhfN5z93qPwAcPC3zdOGHOFM9IOrkNYc9Y5oxGAvo6Zt/GaTROrOqBi
         eO70tUA07lA5dOFQXnvYylKbV5UXZGg33Wlj7r++GRLf6RjOYsOi8T4rNRNHbsb0ZXb5
         xpiR20AG+/2XgZ1FnVmIs+GXCzo19g2V7ny6RvdDLH+R4X8P+pfabCR8f3U0IbgnTMYt
         6S6w==
X-Forwarded-Encrypted: i=1; AJvYcCXBmbclcnd7stNXLtQeKeWe+Jsz0kHkub9fpxIhZZtLTh4n8oRYuyNxPYtr49d+nd+tEig9bbL/G6JRp/U9S6w=@lists.linux.dev
X-Gm-Message-State: AOJu0YxKd0ij0imJ0HUnqFxHkR+f/ydiiAUoOMDDy/Lj9GN+slVihLiR
	sOwOfS9ZkyvBxYlkDG4v08DYdzT0lnuq1xIop8VJ6+CxgJBN8WrJtfesvx07LMcdCQ==
X-Gm-Gg: ASbGncuIqdh8fga/fvpO3oiXCQGaSINdKJAGTNZwAlcbNGHSjj+HVdzzeGGzFMbjYuI
	M+/vs7j1Ozi5jnH29Fp5TtTJfCSa/auKKwNBbxAAMwq3g5rop97atqTt4H1ZOHv+nKQPz0iNuSm
	M4kgO+qM+7ArdfsvdKWgw8eujJcUM/ouT5XP+bqBdtzCv6scPA+VdUuBvll/6S+TphKoOZmMKjZ
	lYZrEDF0lOQgJ/sTnSQB2yGEzqG4wOesftYrUmQvlD/hRHLixBw6yyL0POHkoKjKrRmXb4KCq1o
	ZGInNu090Tyg1bJ7ftMB5EGUbuSszKSFEV57GcTBJMd9e3yjVKbcoPAF+GV9wq+7uOJvOnVG4rS
	rp/Op5QgJwFnT56DqDo0/5tq/hYTFoj7cDQfOO1asbTH0Ds+Xi65xr3JXJ2xI0Q2WAFuY8ok0NQ
	tNe/VGnfQ3kE0a
X-Google-Smtp-Source: AGHT+IG7W1HQOHW0+HQd1j2RDcUydykQcA+021giU1BAHPPN8iXToIIj0I2at9PJj19MrWet4LHEkA==
X-Received: by 2002:a17:906:7308:b0:ad8:a935:b908 with SMTP id a640c23a62f3a-afcb996e8d9mr387128866b.30.1755197104266;
        Thu, 14 Aug 2025 11:45:04 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (37.247.91.34.bc.googleusercontent.com. [34.91.247.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0f4sm2614772466b.106.2025.08.14.11.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 11:45:03 -0700 (PDT)
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
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v1 3/5] usb: typec: ucsi: Set alt_mode_override flag
Date: Thu, 14 Aug 2025 18:44:53 +0000
Message-ID: <20250814184455.723170-4-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.rc1.163.g2494970778-goog
In-Reply-To: <20250814184455.723170-1-akuchynski@chromium.org>
References: <20250814184455.723170-1-akuchynski@chromium.org>
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
index 5739ea2abdd1..5ba8b1bc874b 100644
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
2.51.0.rc0.215.g125493bb4a-goog

