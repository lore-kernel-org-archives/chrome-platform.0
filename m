Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6271C6FF0
	for <chrome-platform@lists.linux.dev>; Thu, 20 Feb 2025 02:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740018905; cv=none; b=ioIRxaqJc9fILS04rYtiSBxYqqdNvsTDsluLrdiv3bid0ZCLGgpWJem+OjNb2sZ8E6ixtOyUPMvAcYE8zku8iFiNzJZSxPvfssGTLkzx8tW4eOc/PyaX7FxBW4HMLwBbb0u8TJrvstcKt0iz70expIZcf5ZTKX0bcMCtHOVUTmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740018905; c=relaxed/simple;
	bh=0lAPPlSBVIwJnvXF/A2OEnxoxnKrozCepUERFWvpEOM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qBnEq/Fa8g724hQaWGezRyJXcURJpoaCcAMC61zQ0gSL+TaGi9ef0UWKmse/ohFacC9n0lDzjq5nocdCrn2vVBFwK2/vL+3hcqxGy94i/iSAScX8FnJ60cFsJfut2uKLXjLKOHeW81QmEf038lmzSnDR4V/LmwdCbLWkCG4s/us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=frame.work; spf=pass smtp.mailfrom=frame.work; dkim=pass (2048-bit key) header.d=frame.work header.i=@frame.work header.b=CdA6Z0Lq; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=frame.work
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=frame.work
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frame.work header.i=@frame.work header.b="CdA6Z0Lq"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-220c665ef4cso5710365ad.3
        for <chrome-platform@lists.linux.dev>; Wed, 19 Feb 2025 18:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=frame.work; s=google; t=1740018903; x=1740623703; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VzLpRUwhPOXU/4Y3T0uzSoEa0lP2i058G8IZtd586cI=;
        b=CdA6Z0LqfCPzQlR+hKsoPOWNAJMTNQ0t4A8Ze23IJ2TZbtsJQRAlvvzrynllRRYLg1
         7hzuHj2F4xfcpcojAzX5u3QJ0jovVWDeyPdCMUydn8Y3obHndgjdMyT7JoizxjUCR8Sa
         dfvwjVo+32ZXw42yj7C5Lc8+aJ/itcpjHn0Krk04kmweQaXYMPkhdTQ5Ys/dQ7DqWLvX
         dYBmzv+tfpNcz7vWwpnRARlO06vyxe4d9ZNK9BNXsXpREgkG94aK45KH8cRLAqwNLg0x
         v7Y7T+RyM2wnzxd1XbmLHkh6HgF5kKEPigvy6SzG4wQP2IoFiMJmkWGPFA4PDUrlPuIv
         8qZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740018903; x=1740623703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VzLpRUwhPOXU/4Y3T0uzSoEa0lP2i058G8IZtd586cI=;
        b=OB0klmWGcZ4D0DeAcB5PYYVKrd8Bfvkfu1S+VwoXa1t/Nk4Mr5Xa3NYu+wvLIAJL8P
         ARBpz8Vq90BFgQG9RFLmHzfjS332U11qAaPCjFLknAfiSTpzTVpBXymqmXbu6wpj1rjq
         jxC3DkqdgDinPQMKeIKeAUOOL1rY0iEk/+Sbva4M1oVT7eASis+RZjSPzqGQy/Kso7QR
         +bmH5LY9QhCnyPbvu7qP1pvI+G3U5SXZO4pQNFUTKOculd1yh0H5mrfYhLuiEdd002TM
         mgTdg2pn1Yl+xjzN8AVGVLrkEhC7FBkGasejznPvvJiZkRHFQRz02c5bnM/x69mn+zyL
         AJcg==
X-Gm-Message-State: AOJu0YzyzOyLYCelPIjzc771oepBvoTxLZuvKV3sIz/i6XIpitFs2Reb
	hBqHJ0mDGX8CxyHUFqQPrqPDcdJMrfAC2C0kWsLw08j+w8qdtuXQAhxfveZYvz/6JcaTCKdAUmc
	9
X-Gm-Gg: ASbGncs56gWJdozLtKEBF47jiu+8Cd57fB3+9EFPUV/TctjdlfOS8V4CVklqYLbMeeb
	yHt/jufvA44A4Nyd5l1MQgI17KcJzmdCH42ctHP/A0zwm6CGAM57I3l0yYyIkaazFXdV70CUudM
	uKYBRhJTm2/DQrAp5s5hnFwNpE8L9G+QtAELek9f4d/8hShU5u5UswwMJ/JZ62vDthrCSSQO1cR
	Hp3/dO3Jp+7T+pODyfpFFZcel2jJzS2rvh5CO0sKNuJjBYZXenn8HT7AL5OU6nyngTctNNWm7vZ
	cKBmpgBYtPEpR6V2AJU5TqLBEQkrpW558mp88nSRAK35X5INpFoMNuKe
X-Google-Smtp-Source: AGHT+IEz/Np9bBWhKN10JqyayECPifIFMy3wj0aW0TkGKhp5vvpfKVVsKxZg2hJOxMo/O6h6MwcpHw==
X-Received: by 2002:a05:6a21:493:b0:1ee:e08b:4318 with SMTP id adf61e73a8af0-1eee5c9a63bmr1753301637.25.1740018902755;
        Wed, 19 Feb 2025 18:35:02 -0800 (PST)
Received: from pop-os.localdomain (61-228-247-181.dynamic-ip.hinet.net. [61.228.247.181])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7324256aa53sm13163049b3a.50.2025.02.19.18.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 18:35:02 -0800 (PST)
From: Daniel Schaefer <dhs@frame.work>
To: chrome-platform@lists.linux.dev
Cc: Daniel Schaefer <dhs@frame.work>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	"Dustin L . Howett" <dustin@howett.net>,
	linux@frame.work
Subject: [PATCH] platform/chrome: cros_usbpd_logger: fail probe if HC not supported
Date: Thu, 20 Feb 2025 10:34:41 +0800
Message-Id: <20250220023441.158615-1-dhs@frame.work>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the EC_CMD_PD_GET_LOG_ENTRY does not exist, the driver does not need
to stay active.

Framework Computer systems don't use the PD infrastructure in the chrome
EC firmware, so it does not support this host command.

Previously the driver probe would always succeed and periodically keep
trying to use this host command, resulting in unnecessary EC traffic and
EC log error messages.

Cc: Benson Leung <bleung@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Dustin L. Howett <dustin@howett.net>
Cc: <linux@frame.work>
Signed-off-by: Daniel Schaefer <dhs@frame.work>
---

With this patch the following dmesg log appears on Framework systems.
[   25.171086] cros-usbpd-logger cros-usbpd-logger.8.auto: host command not supported.

 drivers/platform/chrome/cros_usbpd_logger.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/chrome/cros_usbpd_logger.c b/drivers/platform/chrome/cros_usbpd_logger.c
index 7ce75e2e039e..df6b1d97589a 100644
--- a/drivers/platform/chrome/cros_usbpd_logger.c
+++ b/drivers/platform/chrome/cros_usbpd_logger.c
@@ -207,6 +207,11 @@ static int cros_usbpd_logger_probe(struct platform_device *pd)
 	logger->dev = dev;
 	logger->ec_dev = ec_dev;
 
+	if (-EOPNOTSUPP == PTR_ERR(ec_get_log_entry(logger))) {
+		dev_info(dev, "host command not supported.\n");
+		return -ENODEV;
+	}
+
 	platform_set_drvdata(pd, logger);
 
 	/* Retrieve PD event logs periodically */
-- 
2.34.1

