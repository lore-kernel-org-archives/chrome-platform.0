Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80323218302
	for <chrome-platform@lists.linux.dev>; Thu,  7 Nov 2024 19:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731007914; cv=none; b=maq4sGzKvCdXIpbJ2of+CskrBy7oM9sxwzCn7/rbc5g/sKNiUAqjZ+JltKhUnIcBVL8Gj6QUlJxN5TlDvgdWR8ak8HA+0e1/uo2SXMPiWjOJfqwbM4+w6EyWEkyOIwrm6aofhVzD3R0xCQsUfdohmXtkxkJusHUnCYix6WsDbUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731007914; c=relaxed/simple;
	bh=WCQG+4mTAioC2RRhlKrzuWizF30INk2UWBFKj8OUk3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n2dcWaHWRJQRCo7RjHdzFjLfcp5P0iRoHOKEz6/1vcSn6cIm6ydGOQnaMovXqUCkj7R8D3Iy/lEqDiGgIj4WRXSWp8if2T5qO36J4taq3FmJPqypP9wYH20Zn1cVDp+uHx7/qyqEt36XRgRVHTHA+oQBDT2/mzkjDpoxcwEJ3PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ScNUYfd+; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ScNUYfd+"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-723f37dd76cso1342046b3a.0
        for <chrome-platform@lists.linux.dev>; Thu, 07 Nov 2024 11:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731007912; x=1731612712; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qB0OiXmaVUdpADLZ0hMEUy5iSBeICNTxG7bvkK2xwhA=;
        b=ScNUYfd+gpV6vywmc0QCuTV2l18jiFMQX12bCXjLHf3XHGvni/ysosHgbgHy07TtGY
         dd2wrIcc7QfEBLVLrIAkBLBB9DaKNHt21rWlHCENoAwZrtAFxowpldJ4Np9xdEtsnR8p
         Si6W5898HlVwwDfUNk0TO/2tSrTcv1Ihm//D4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731007912; x=1731612712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qB0OiXmaVUdpADLZ0hMEUy5iSBeICNTxG7bvkK2xwhA=;
        b=ss+3iPXmc3dEDssmSMwI7KiKiy+GeiGkYhgrjdpgNexkLl5UL3HD/3JEQ+VyjrdxfJ
         mVLIRoL/lwL24FNipsBy5oSSEkFi5io8Itup5BCNlTt6v+sLIiCjj19R20mh5rP0JUKU
         EkueWcqXQIlOgvtMVCLTlLdyen90yG1wBuYbZ4adNILJgBUyrqQjCpvIK6ZJGjbAHFTD
         r7JcOylNoEkmCtwczxrqQVFV/TZVLaiRUTkYEjKvelzpp4mgjcJTDgJ+05GNCr14TRlg
         XntfocCJL4yDPl54AczLeQ7P0x1CIJup3OvpSv4A+hHX+dnSjq/QEJQW1+LJ07yDck82
         PGXA==
X-Forwarded-Encrypted: i=1; AJvYcCXmAA8nIagW7+X8wxTCrZ/Slnb23VSpn2orZkAv5kNHBIpnWl2uGMHTtqcE6MaeVLj/XIPH0xAih8tCgflPhF8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCIl+srh6hhQCmMNRQknxmzF0STjX05g4sEDcMsYT3UX1CoiiC
	fRUhcUVa5iUfYPz7Chm3mjII0J2LmLQ7G6SQm3HHMpW2zo7ht1bAVKb+tqfC9w==
X-Google-Smtp-Source: AGHT+IF2ok0t254IPtGqAU7UW2SbCfuqikNyMbjEWny3NohvrWFkb+GFcVlJONRZBGlNxqHJEomkEQ==
X-Received: by 2002:a05:6a00:a1d:b0:71e:693c:107c with SMTP id d2e1a72fcca58-724132c15a3mr347895b3a.11.1731007911958;
        Thu, 07 Nov 2024 11:31:51 -0800 (PST)
Received: from localhost (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72407a1fd2bsm1984909b3a.167.2024.11.07.11.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 11:31:51 -0800 (PST)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: jthies@google.com,
	akuchynski@google.com,
	pmalani@chromium.org,
	dmitry.baryshkov@linaro.org,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/7] platform/chrome: cros_ec_typec: Disable tbt on port
Date: Thu,  7 Nov 2024 11:30:00 -0800
Message-ID: <20241107112955.v3.7.Ic14738918e3d026fa2d85e95fb68f8e07a0828d0@changeid>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
In-Reply-To: <20241107193021.2690050-1-abhishekpandit@chromium.org>
References: <20241107193021.2690050-1-abhishekpandit@chromium.org>
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
the thunderbolt mode on the port and partner in order to enter the mode
and the thunderbolt driver will not automatically enter when a partner
is connected.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

Changes in v3:
- Set port.inactive = true instead of auto-enter.

Changes in v2:
- Only disable auto-enter for Thunderbolt
- Update commit message to clearly indicate the need for userspace
  intervention to enter TBT mode

 drivers/platform/chrome/cros_ec_typec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 558b618df63c..b01efe82fb1e 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -310,6 +310,7 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
 		memset(&desc, 0, sizeof(desc));
 		desc.svid = USB_TYPEC_TBT_SID;
 		desc.mode = TBT_MODE;
+		desc.inactive = true;
 		amode = cros_typec_register_thunderbolt(port, &desc);
 		if (IS_ERR(amode))
 			return PTR_ERR(amode);
-- 
2.47.0.277.g8800431eea-goog

