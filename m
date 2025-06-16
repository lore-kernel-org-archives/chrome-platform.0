Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87012DF3E6
	for <chrome-platform@lists.linux.dev>; Mon, 16 Jun 2025 13:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080803; cv=none; b=bAuUN4SPjHcQE2ePtPZo2YqCX+bdBfJDbbmPgU6N3P1CkEdyHehxtZ2o2EYV3+8ZVDnoJCnuxB6IDUngFtNLhPYg7g3Au0qc0/f2pgt27KsRhR1NaP9rpLW/VOQ3dS4TWaPuALCJVAEQ0/2Z9RKA6m8/VDBnN7H3pl2Cg3s4JMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080803; c=relaxed/simple;
	bh=Qd939gkPb0H61tPk2RIMeLDSe6Zyt59w3Ryj4n49L+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K/hRwriMSfdzSrdz3pHUYieMFUx8HZn9PlZroSaoaQc2UkLxs8Ur/btgxPvRC5V9On5jy7BkMGjjpBJdDoagDu7rRBKXMkhH5enB5wc7B2B6+sBK6UOSlMABy3UD0IP/m34/SaCJP8C6yh6uZdhP+t8H3WBO/gG51rQfGXTxQrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cqaxMi+L; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cqaxMi+L"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6097d144923so497570a12.1
        for <chrome-platform@lists.linux.dev>; Mon, 16 Jun 2025 06:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750080799; x=1750685599; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NxRvpi4mZMXdsuvOPAqvVcquISKrLNsOB6lTKg+yoXc=;
        b=cqaxMi+LwnZnkxDN2SEA2e3UxG/IW8wN6u82OGo+GDwxorpaN6uBIsx7r5pRtX+suy
         4SG6mN7hJlhY+065JapjebfVmSIsMjA8Q2FOFeb4kH5jwhGZeZUOkSRHMvMov0dMdQTz
         ZVVIANQ5aWawf6ntiy/Sn5mq/kPbSBCO0WpwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080799; x=1750685599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NxRvpi4mZMXdsuvOPAqvVcquISKrLNsOB6lTKg+yoXc=;
        b=NW38Zb2Pw0S7GyvNrjffc1XwI7EMaf/5BRL77q7OGgc93B928q4hmlJ8p7eSNJmVFt
         +5AbSi3tE+8q8+Z4lb/mHYbjUZAheY7JWoWqAWuAl8TQuhuFY291KgS93/ODeWGvQPZy
         Mkw2Bp31p72Vkz7nb1n95BHf3y/mGjsLYrFOnVITDkWqH/APN/NBi3G1YFf8azppUoOX
         miuhcR3njSau8t56ktiCEevvUnalElhKIYDQhOn8x7QUbthhiwf3jUCJAuzxBFJoEap4
         C/Z2mHIgozFy8BzHNoKRNGEwhgpqFQFsWFAi+4Ki0BPZGOYdjRcSdW27Q+8yshUpGbXw
         q5Kg==
X-Forwarded-Encrypted: i=1; AJvYcCUyZNoBSpYjSoZgnmLkXkxWcZOQsX5nmq2H4dKkJdGiA3w2GjtI/oo1/+NI4VeleRTdW0RRfnEmjzXie/1nQzg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwzgsFfoPa/nELQk94cY9jeCAKuxoU/wTfsvDViqTiOnzZOygnS
	SkN0X9v5Sj3tC3ZFyZQx5ydNRCF2tD+Ej442i2y7ODsekJHVTvpxCQeGr1jdh8sR3w==
X-Gm-Gg: ASbGncsIFRkjVYwgZxRFyv4+5WsACd6w2t9dlDF0nIyiDKEWnUYKPv+36ve3U+Kw3/u
	+qUVA13+sizKbVw4r+WcIEq4wdKH/W4kZ+XNXQk//sv471eNDgnGn280IA0UOmVnksibsFzWMLu
	6y4UsNgAYxbbwqvh8ZLYIxzWELtx4VRTSosRS1uzOL0qVa0v6/ys00f+XS0YMpYRvaluNf3Fzwn
	wu3W+nIXSRqd6q27s6wYG2vyqS7WJAUrkxQCuv/0kSh+yEzgMLlK7a8RZYH6bdleF0QWdgMBWVx
	Zl8zN37vRCK7KAJGekU5NwlwexeYpD22YEQQEzIC+aBFyhlIgXHv+pX7hNjfrIzI579Hlbv8eqd
	WhxTULCcFnionSaZc3V6+HGmhXoOd/GYGZ+iFVzSVYLe8exEMPP+ZwIqrc1A0xEDGv659
X-Google-Smtp-Source: AGHT+IHXHH/g4hQtpUyXbw2a55jyHtMmZWxsR2Yjrb1ebrbQezAfwXZaOWNhg4NlM54/48a7s2JliA==
X-Received: by 2002:a05:6402:26d0:b0:605:2990:a9e6 with SMTP id 4fb4d7f45d1cf-608c6e16978mr9487904a12.5.1750080799174;
        Mon, 16 Jun 2025 06:33:19 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a94ce7sm6036664a12.58.2025.06.16.06.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:33:18 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	RD Babiera <rdbabiera@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 06/10] Revert "usb: typec: displayport: Receive DP Status Update NAK request exit dp altmode"
Date: Mon, 16 Jun 2025 13:31:43 +0000
Message-ID: <20250616133147.1835939-7-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250616133147.1835939-1-akuchynski@chromium.org>
References: <20250616133147.1835939-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit b4b38ffb38c91afd4dc387608db26f6fc34ed40b.

The commit introduced a deadlock with the cros_ec_typec driver.
The deadlock occurs due to a recursive lock acquisition of
`cros_typec_altmode_work::mutex`.
The call chain is as follows: 
1. cros_typec_altmode_work() acquires the mutex
2. typec_altmode_vdm() -> dp_altmode_vdm() ->
3. typec_altmode_exit() -> cros_typec_altmode_exit()
4. cros_typec_altmode_exit() attempts to acquire the mutex again

This revert is considered safe as no other known driver sends back
DP_CMD_STATUS_UPDATE command with the NAK flag.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/altmodes/displayport.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index b09b58d7311d..ac84a6d64c2f 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -393,10 +393,6 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 		break;
 	case CMDT_RSP_NAK:
 		switch (cmd) {
-		case DP_CMD_STATUS_UPDATE:
-			if (typec_altmode_exit(alt))
-				dev_err(&dp->alt->dev, "Exit Mode Failed!\n");
-			break;
 		case DP_CMD_CONFIGURE:
 			dp->data.conf = 0;
 			ret = dp_altmode_configured(dp);
-- 
2.50.0.rc1.591.g9c95f17f64-goog

