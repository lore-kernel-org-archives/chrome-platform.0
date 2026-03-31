Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA682F0C45
	for <chrome-platform@lists.linux.dev>; Tue, 31 Mar 2026 01:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774919456; cv=none; b=pyvCHBcPNZ6nWMS6+GqkRKvcN7oaz1tPDJcU7y8Sg7I0f8dflBW2Eo7LOg/SNipQpVLG0hCowkhIMe0keXaYN1InYA5dJLEsMmPVUbdFeo0cDtceGq4qAh0GFcPiZqp5dATe9kIMBWzzAIQ8iceedmKlJhzSybifDl/A464UXLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774919456; c=relaxed/simple;
	bh=FuX25xNL0PUqr7LAkLMc8I3ooUWu4T1/p1Js+Bv/oWs=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=LdfA07qh6mNZJ4U8c0zw5t5/RMvIShUtRbd9CDyuBk6OgOggIp5mvXHHJ40UaHIggAZokpZbNtnqmTNo8KwZiZUQ/I1n/FYqinPIErloOe3dDoy/qcKoI2epnNVry3imsjOSB3DqPpskBQ8ke7K38jnrCNNQrrVMyucOeHdfxpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=XIms3KJG; arc=none smtp.client-ip=162.62.57.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="XIms3KJG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774919450; bh=M9wVVGMzkLVv9834LPttMH9JojoamoWbBgAOVtYWWgk=;
	h=From:To:Cc:Subject:Date;
	b=XIms3KJGeGUA4CZQqOT7yf1SDM8+TtGAol9LqLtykxKmG44E++sbXW6GJIej5yTt2
	 bL805a2FAdO5Rzuihuy//CwWeaiHBQOAErW/Pn2o6qG0IN/ItdoWxxl+VCSR/VBFgE
	 pQ4eI+bIew6iP4nl9RfuDuefAwLzoqTGStxo97jE=
Received: from June.localdomain ([123.121.145.35])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 2AF0D463; Tue, 31 Mar 2026 09:10:47 +0800
X-QQ-mid: xmsmtpt1774919447tzh4grodw
Message-ID: <tencent_B1B3C1F57C046AEC80A8218FE8AC43FD590A@qq.com>
X-QQ-XMAILINFO: MS1AjjpKGz7zNHqTf1KJq6hjHnXLzC8vvxwl+SUKG16DiN624R628krFfSP7Y4
	 PQyXHUCmXzQ4rWVp+Qsvx3vAO6mwB3HvAbWQkK9EJy6VHpsBxSaONkrYSqiAbBHi+oYksar4PhD/
	 SAzHi0i9MCP/dpRXO9R85Qybzb/Ji56FD9QIlYqzFRanR64+A7CfDPUjjaU64ItYRLOREaJsxE3h
	 rX0vrM9VzrgpR0qx95+xOTodg07+UrhpceCYVKpcGZd1BuGL7nB+oV1rAx3EfBdC/RtBNOmaCKvB
	 xSOD1AN8Rm/wUPQ8boiNNSYQi8E59UmNJ4Qy4EKMncA1fi9We4mryJ19pkpl46AsNyt4hJGlM36t
	 XtgWFWlZGbmB0qBauikDMCfUNxCinj1NSOGg4X8HXTSbv+oSRUp+GSfNa4YOOf3JALppjAH+D3V7
	 6uGay3hoGptnRf+vGRMGTsnJOuqJrv7ERBY2YmZeKi/7UXWFC7ztmRegYJwy9O5f3EfDooKC//OV
	 6oY2jy3KfmUN+M1gIPDWZ4CzXtx9EoEI52fmen+S0CP1/PZhLjxa7cQCPDZRzg1wpN+AAw4Aums5
	 LpxGrJ/mQFB5ycYP8CmQfhHZ21Q+rpjXYpGyzWCA9tzPGKDVNiVbKihtkhjOqg0NnMhNwfkPHjao
	 wCW/uYYXpmv0QugcKVEPFfev/PI8shDFRJEVMKBnbb39mCZZJhq96ofIIHjdcVlIWzFOT0kLc7R1
	 GFbUvpx/u4dCr/yvOwMc49rHVUpyIiboEyawrDx+HBRFnT3sNib3fhBZAzHug66AmknIDM8azj8G
	 TjYc45qi3BD7af1tgjHPF9zcbZOYCjPcS5lbofWrCCUp+A5eXYKoJeJ8j6UFLOWZCF2m4N7xTeml
	 q72bQVQvlf0r5j56pZfYRXJROaBJ/4dCohULHfmiQXgh/tjL/HZnlbv2/wVOFfQaFAoSrmefVLpZ
	 NAaxdOsYRnT5dk43lcCsDeZ0AompefNhE8zvb+23GQRkOsVc9l++x46NsCLVITICUsmghBwS6L3Z
	 UUnM0TE1jmtG/lF5j6zHPq66RJHmgAYWq+XbO/tWnL8OFUmMjo
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Wang Jun <1742789905@qq.com>
To: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Jameson Thies <jthies@google.com>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	gszhai@bjtu.edu.cn,
	25125332@bjtu.edu.cn,
	25125283@bjtu.edu.cn,
	23120469@bjtu.edu.cn,
	Wang Jun <1742789905@qq.com>,
	stable@vger.kernel.org
Subject: [PATCH] platform/chrome: cros_usbpd_notify: Add NULL pointer check for ACPI companion
Date: Tue, 31 Mar 2026 09:10:44 +0800
X-OQ-MSGID: <20260331011044.72087-1-1742789905@qq.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In cros_usbpd_notify_remove_acpi(), ACPI_COMPANION() may return NULL
in certain scenarios. Directly dereferencing adev->handle without
checking could lead to a kernel oops.

Add a NULL check and emit a warning when no ACPI companion is found,
then skip the notify handler removal to ensure safety.

Cc: stable@vger.kernel.org
Fixes: 7e91e1ac60bb ("platform/chrome: cros_usbpd_notify: Amend ACPI driver to plat")
Signed-off-by: Wang Jun <1742789905@qq.com>
---
 drivers/platform/chrome/cros_usbpd_notify.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/chrome/cros_usbpd_notify.c b/drivers/platform/chrome/cros_usbpd_notify.c
index c90174360004..cb3e59eada9e 100644
--- a/drivers/platform/chrome/cros_usbpd_notify.c
+++ b/drivers/platform/chrome/cros_usbpd_notify.c
@@ -153,6 +153,10 @@ static void cros_usbpd_notify_remove_acpi(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct acpi_device *adev = ACPI_COMPANION(dev);
 
+	if (!adev) {
+		dev_warn(dev, "No ACPI companion found\n");
+		return;
+	}
 	acpi_remove_notify_handler(adev->handle, ACPI_ALL_NOTIFY,
 				   cros_usbpd_notify_acpi);
 }
-- 
2.43.0

