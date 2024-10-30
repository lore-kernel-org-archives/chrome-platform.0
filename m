Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71AC21895D
	for <chrome-platform@lists.linux.dev>; Wed, 30 Oct 2024 21:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730323758; cv=none; b=Hq5vu7lb+y0PKduiEcHlvOOeWOS2oLK70Z8FivzJ3sM2t7z11q20f4HjxDIvOAX/BZyGQUAcQDZJG1tGA/DVLleMD8h6KU6wT6OE9o2lst+5RFIxbccOm+1bZzAzDPkURNcYS/x9H9AniOMGwuxGT2po/lp4z5lMn2qPFzjzZdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730323758; c=relaxed/simple;
	bh=hAp/Wgn9qETJ9JtmrJOl57caWyJEtC39CrlS/6VnGMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eFUqfpe5c0heRnhEavLyTARgpnoem/dPVMGxOUvnxSZykNVwT6GvYxuYFgU2h2zIJLW3F+LbfAg7oxThC8fx+Z8pqWm0PPBHyqFBr0QLX96pALisLBmshxZwRk+TxtzGJ5BlIYnHHTQ6w0J9dZUi72//cSTQUlKIwiLdhPdd3SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=j1e90j8e; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j1e90j8e"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20cb7139d9dso3187025ad.1
        for <chrome-platform@lists.linux.dev>; Wed, 30 Oct 2024 14:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730323756; x=1730928556; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1LFW748m48R3d4nGBRyW7y9JsiXUpIXaqKR2jh3vhg=;
        b=j1e90j8eOw5hPt41dqjtnbs7Ty4rf1o8ai4XbiwgWBp2W91ozcl64B333pk4VETBRy
         Ex4sTl4fXZMtHYrZssiMTBbWCXVSQkJlDXKNRjjXA3Jkl/oZbf9zJRWh91cX68k7zonm
         Gg0TPdpWBKfkYpb63KT+qdryJ1XWt43AKSfJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730323756; x=1730928556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p1LFW748m48R3d4nGBRyW7y9JsiXUpIXaqKR2jh3vhg=;
        b=izZsFx3Vkcr9vyFZRCGNFoXqJSqZYFsBmwhptIPmemxEqeAIjcvp3Jb/85IG58B/3j
         Krb8HCk2yPfWJFZIchxqWU8CvgxAOahc56B3ojuH/KZg+8pGCNjnc8tJBqmJ8valkVpK
         DU+5qKJQM8A/zcm0VjHOto2epmh4VKNzF6L8LnMF20bYFXrDCgv+Qnz0GdotMmkFKQwJ
         7mWhvUGz5sSrcfuRsqsA2nmSMTaBrmF92ljsOKUZdYQaxoiPB46Lny+kxV1qj6qe4SYx
         pFiyFro0MtNcWjsCF0Qu4f90uIjTEyNpvhn5hE/KNpCMuBU6rLbL1+nGUssHVEt3F2ac
         8EMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUydxLjTiyXln5hitLHPCpTZk5qJXpZ0jjrXBM5t0atxir4+fnu8s/g+iiMpzmd3MESnG5AftS+3Z/zDlUDeP4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMf/vGV49qZXxS+k/OyxwCz6KKZDOtwV4rFXiYNqBm/Znx8pXn
	V7uL8HTO70hSRsOmSX10IlVYMnT3RQxh6ajPpcbirubR+tpTo8pl95Q4ZoHBvA==
X-Google-Smtp-Source: AGHT+IH/KrpwE9PQHVPUqWJzTKYOAjHoclvbrW0UAtqgCiIc5SyQ/Ee9JadYFBZqNKDKLFyOZzsbDA==
X-Received: by 2002:a17:902:d544:b0:20c:7181:51c7 with SMTP id d9443c01a7336-210c6c8ff93mr235487335ad.52.1730323756367;
        Wed, 30 Oct 2024 14:29:16 -0700 (PDT)
Received: from localhost (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-211057d833fsm335115ad.261.2024.10.30.14.29.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 14:29:16 -0700 (PDT)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: dmitry.baryshkov@linaro.org,
	jthies@google.com,
	akuchynski@google.com,
	pmalani@chromium.org,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] platform/chrome: cros_ec_typec: Disable tbt auto_enter
Date: Wed, 30 Oct 2024 14:28:38 -0700
Message-ID: <20241030142833.v2.7.Ic14738918e3d026fa2d85e95fb68f8e07a0828d0@changeid>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241030212854.998318-1-abhishekpandit@chromium.org>
References: <20241030212854.998318-1-abhishekpandit@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Altmodes with cros_ec are either automatically entered by the EC or
entered by the AP if TBT or USB4 are supported on the system. Due to the
security risk of PCIe tunneling, TBT modes should not be auto entered by
the kernel at this time and will require user intervention.

With this change, a userspace program will need to explicitly activate
the thunderbolt mode on the partner in order to enter the mode and the
thunderbolt driver will not automatically enter when a partner is
connected.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

Changes in v2:
- Only disable auto-enter for Thunderbolt
- Update commit message to clearly indicate the need for userspace
  intervention to enter TBT mode

 drivers/platform/chrome/cros_ec_typec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 3e043b1c1cc8..aadd2704e445 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -313,7 +313,8 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
 	if (typec->ap_driven_altmode) {
 		memset(&desc, 0, sizeof(desc));
 		desc.svid = USB_TYPEC_TBT_SID;
-		desc.mode = TYPEC_ANY_MODE;
+		desc.mode = USB_TYPEC_TBT_MODE;
+		desc.no_auto_enter = true;
 		amode = cros_typec_register_thunderbolt(port, &desc);
 		if (IS_ERR(amode))
 			return PTR_ERR(amode);
-- 
2.47.0.163.g1226f6d8fa-goog

