Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C8421506D
	for <chrome-platform@lists.linux.dev>; Fri,  6 Dec 2024 23:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733528336; cv=none; b=HXYtqZmuUKGHmt/P2qeNYug1jYyla0byHuVNWX/LFpNvky5A7qELQcvZkB0eGMDv/NQN1OLeatDcSgWSV79gOlCHNBZW7l8TAe0KDVcwYtRllOY5R4ySdwHknIxq6W90a1rl5J4vYHCYVpHerxdkLrtMCjCN6GTiIsvarli9Dy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733528336; c=relaxed/simple;
	bh=Ulzg2xjkFRD+wiTK/aYzwa6zKISjF0fC6sX0+p179fU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IGQIq8HDIbKG8tL091fuwcc/c2yeHEzXuM7TlzVoQQR+RyulZQB/JrU10CCrELDjZTuSL/UQLrVmNQ0CPP7wZjYSB+enw0HTVzWt8DobuQ09iAZ3gmW9SXYzqP/LEIjV72neCUlr9uFkSepeC1iHHnvG3kZDiCuN1xW6byA/eRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DaUeTDGR; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DaUeTDGR"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7fd17f231a7so1766319a12.0
        for <chrome-platform@lists.linux.dev>; Fri, 06 Dec 2024 15:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733528333; x=1734133133; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M7ywRolWY01/rWUFSkYNRJ4dfXAYAQRxZrdC+AkeGz8=;
        b=DaUeTDGRGe0yRKyiOHZgRL6peqwOhLZqnWcDyHlXdr6HitJmC9l58UXakQ8eYeXGpN
         nOICODG5HVOpyqY2+CTGuYOizYQoCJG4MlXioRFdTocN+v1tA48x+Hv98c185lSntVSk
         eUJHMfwfD7zI06079YZJxpdxnvqVkgCwQPOso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733528333; x=1734133133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M7ywRolWY01/rWUFSkYNRJ4dfXAYAQRxZrdC+AkeGz8=;
        b=mSBTNqTLogSgMxXp/amwYYhplFDjNT6kruXSg1fvlpma1I0Chsf1XOjBStT9Mz+HTV
         1PPt2SygFSFYUu0v90QLk4Peux8UjXTLas39h7mntLR1tkJcnUa/Sj/7e0KMdm5I/Wu7
         J5QeNHlBf6snOnlHdxpas3uV4hU0MD5MCi9Xg3g38y0ZS+4UN273mTfNJcExtAQojxp7
         kXQYFOg/9uETAxloMGW4bfLr9UdExzqigA7uveAvHg8VwlaJ8oDODhMkS9Txz0vgJlBA
         5QCCtO2cXFaTgYjmb2rlMoveGt4GpevONAXdYlJb4Tqnyki0VnGCH8z9/dfV4g7kuQB4
         8vsA==
X-Forwarded-Encrypted: i=1; AJvYcCVenZxQ5Q57J/tyFTpt0kJSGI9jmsZ/FpXyKxjU6+5kelQLS+Rlw/FtvsDoW3r4V+mvi5Azy7Ty42whzOR/edo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQio+s2fCYn/RhKLh314Qb2jCd4JNpE6UVS1npy8mMeLsTT49J
	4jSYxhAlNIKCGw2ShMlPwKbVMEMC3eJYPddzR04w/xkROgHsctGo9JnLcB2Mug==
X-Gm-Gg: ASbGncueq5+Xwa6oQ00F1m8G7CeGCoUD8P4tUExxpi8Cbotl8Kw5gpRvvtimg2Og7HW
	YKuPEuSKbHR1ecWff6FLqfRIcvXhcfYioYn+rpgYIbj5wcdiFZG5s7q3V/UiGKHXQrGf5l5YemS
	oCNr68Ye+4L6CmXHL/T8NtrW1pqAuRfGTgGr9pPnW2b/qeHa1NeB1QOxpHHK68lov/W8Ha+UllU
	QRPpKjfYKPPpY0JbTCqn5wa4U3hP6jGTwasf/488IL8xKSxH2oR9EC7/cUuX3lkn/QENnsP0mPz
	msJjNtBwD8bgwNzXDCiTn867
X-Google-Smtp-Source: AGHT+IE2pYezOEFHi20tWshTX8jQdgxLAviowJebOf0BsxXK7byF4aVYK7F4ypRAUugG9hj/xkBzoA==
X-Received: by 2002:a17:90a:d445:b0:2eb:140d:f6df with SMTP id 98e67ed59e1d1-2ef693676demr7738327a91.1.1733528332939;
        Fri, 06 Dec 2024 15:38:52 -0800 (PST)
Received: from localhost (227.180.227.35.bc.googleusercontent.com. [35.227.180.227])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2ef4600ead7sm3702702a91.53.2024.12.06.15.38.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 15:38:52 -0800 (PST)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: akuchynski@google.com,
	pmalani@chromium.org,
	jthies@google.com,
	dmitry.baryshkov@linaro.org,
	badhri@google.com,
	rdbabiera@google.com,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 7/7] platform/chrome: cros_ec_typec: Disable tbt on port
Date: Fri,  6 Dec 2024 15:38:18 -0800
Message-ID: <20241206153813.v4.7.Ic14738918e3d026fa2d85e95fb68f8e07a0828d0@changeid>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241206233830.2401638-1-abhishekpandit@chromium.org>
References: <20241206233830.2401638-1-abhishekpandit@chromium.org>
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

(no changes since v3)

Changes in v3:
- Set port.inactive = true instead of auto-enter.

Changes in v2:
- Only disable auto-enter for Thunderbolt
- Update commit message to clearly indicate the need for userspace
  intervention to enter TBT mode

 drivers/platform/chrome/cros_ec_typec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 0b87be52e1db..743cb5a9fe51 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -311,6 +311,7 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
 		memset(&desc, 0, sizeof(desc));
 		desc.svid = USB_TYPEC_TBT_SID;
 		desc.mode = TBT_MODE;
+		desc.inactive = true;
 		amode = cros_typec_register_thunderbolt(port, &desc);
 		if (IS_ERR(amode))
 			return PTR_ERR(amode);
-- 
2.47.0.338.g60cca15819-goog

