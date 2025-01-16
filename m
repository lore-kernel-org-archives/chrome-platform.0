Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04B01DB548
	for <chrome-platform@lists.linux.dev>; Thu, 16 Jan 2025 22:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737067571; cv=none; b=GxYb0TBkqkEPpECu0WkDSH+GUaIHURUI6LeRGXt73QLJ2u2qnhXT89U45GqPZMJobJHCNLJc/hZauOsavN9DFObv2///sp3+kaMqHjyLMMa4Gq8cVDwhs16nSt2zE4h2/Pz6arPF/WmbMYiCysbih8DTZ4UNWcFU/TKtoRop4rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737067571; c=relaxed/simple;
	bh=c+HBWu687+WEKdvLXDm3514Q8jhP5/R+MI5dYLs7opk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U5yOxdMvx/uu69hf6MTTq6UL4XsSl+WPgE7tBVhuqpCZEV6k+QPRA40/8/VbysvUJF+EWkPAVhiI56VOSNHZIS7AWWFgNkyvLXTEckNNgxNWNCN92JBAtUXurTskW5/aTrp+euI6C3U29BTAG4EDk8tr55IGtofhT6GFRypwyOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aqd3mJNz; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aqd3mJNz"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2162c0f6a39so51036845ad.0
        for <chrome-platform@lists.linux.dev>; Thu, 16 Jan 2025 14:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1737067567; x=1737672367; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vNXzWEgJPL/lLJ3+6ZDIxk33qGNZqwz3zDtaJT4T8wU=;
        b=aqd3mJNzBN0WQ40zrrHizm+h9/NgwSx4qHOHOfH7eLsZmAw5LQk6jBQ/FDUoL5PZXq
         /P2FiHs1pWX8pfrqoYnlSz8c7Z+A7/rm2s41mXohjNja/I+9vj058wiBQH4JMHjix+0M
         ZkZln1CMDoxtvCYNXVurpfnGlYZrL1VlK0VHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737067567; x=1737672367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vNXzWEgJPL/lLJ3+6ZDIxk33qGNZqwz3zDtaJT4T8wU=;
        b=Sk1OK93xFROhxRTQcNZactcmAvde/5fRIvgXg4+xMxTgeVmxm0oejKSPagOlYPhefk
         F5PMydtJyRaJKiC6INaWZ2V5SL6hK3hVPBRkSJX0vzSuYRvj6AUTD7VC4XjYKDF8pnAh
         AnRM18nBZDxiZn/OvELMR7h9SxKtYmnMOxU7RuxkXLiP2dpT72ORFfe5mzh3iHN5cgII
         pz+y8yBx5Hvo5JsRwmZlX+L2Um1slsn5KMGmdwPtkP6twQKYLt+zDagpeGMa2N7QqokZ
         C8Ioq9+Vo7CPlBD+qILntPzJ8qMX4CsFEaKfuzDCsP2Hy6tJYIgbTpJIJ41hwiQYqzYg
         8wGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKeMhTFeiLGVxKWsW2tY2afQQA9k4Jhc90a9IUEVu0zoh1pCDXSmepObJ87Bi8cqmxNcdgJVOfA8gPzotEWng=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxr4xv+NRdu+2Yp6psF2BobJDEh5awrbD9FBK16uwdAzXNA8wdA
	Fz88HvfQ84PMUoeoZYExyTyYGRU2fFCAiQ53SngWLdY2um+Tkqk5t6X7mXih7w==
X-Gm-Gg: ASbGncu1Uipt3eRSFV54HccV0o2pqsOHBvyl5v+PdLRxWmrVabXD2jmg/PfjEX6dkNo
	MVmWTgSCdkGgTBKOVoOLJH1iwJZzU/54mqxLJ1ywwavSQ2oJ5sMVPUp966xNPKAoRKvajRWZr0+
	gbhZrL0t5oqdby/kj4nrjAYqziK02iED3282eqoBTxuEiZl3kizrrs4Wb8W2OTjFFvd3+6ryZfl
	u+IZvQ72AbMwQ3eUyz8929Kq6O41Qf7seROfvpZWTDnSdHw61PVyDiKiMehqjSYNCYClvtBvS3m
	Ecrjumxzfv5ixmXMc1wP1wGQZqNHhCA63w==
X-Google-Smtp-Source: AGHT+IEEcYdDNcwVDoUsZ04wTmaoY1a9RQqIAv+Dv/a9lgAS+MG7jy1BOJNtfWL+Yj7Uawd1h3v+9w==
X-Received: by 2002:a05:6a00:1d12:b0:728:15fd:dabb with SMTP id d2e1a72fcca58-72db1c5d820mr509975b3a.8.1737067567088;
        Thu, 16 Jan 2025 14:46:07 -0800 (PST)
Received: from localhost (129.135.125.34.bc.googleusercontent.com. [34.125.135.129])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72dab7f07b9sm536780b3a.3.2025.01.16.14.46.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 14:46:06 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	chrome-platform@lists.linux.dev,
	linux-watchdog@vger.kernel.org,
	Lukasz Majczak <lma@chromium.org>,
	Benson Leung <bleung@chromium.org>
Subject: [PATCH] watchdog: cros-ec: Add newlines to printks
Date: Thu, 16 Jan 2025 14:46:04 -0800
Message-ID: <20250116224605.110870-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add newlines to printk messages so that the next record is more easily
readable.

Cc: Lukasz Majczak <lma@chromium.org>
Cc: Benson Leung <bleung@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/watchdog/cros_ec_wdt.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/cros_ec_wdt.c b/drivers/watchdog/cros_ec_wdt.c
index ba045e29f9a5..716c23f4388c 100644
--- a/drivers/watchdog/cros_ec_wdt.c
+++ b/drivers/watchdog/cros_ec_wdt.c
@@ -58,7 +58,7 @@ static int cros_ec_wdt_ping(struct watchdog_device *wdd)
 	arg.req.command = EC_HANG_DETECT_CMD_RELOAD;
 	ret = cros_ec_wdt_send_cmd(cros_ec, &arg);
 	if (ret < 0)
-		dev_dbg(wdd->parent, "Failed to ping watchdog (%d)", ret);
+		dev_dbg(wdd->parent, "Failed to ping watchdog (%d)\n", ret);
 
 	return ret;
 }
@@ -74,7 +74,7 @@ static int cros_ec_wdt_start(struct watchdog_device *wdd)
 	arg.req.reboot_timeout_sec = wdd->timeout;
 	ret = cros_ec_wdt_send_cmd(cros_ec, &arg);
 	if (ret < 0)
-		dev_dbg(wdd->parent, "Failed to start watchdog (%d)", ret);
+		dev_dbg(wdd->parent, "Failed to start watchdog (%d)\n", ret);
 
 	return ret;
 }
@@ -88,7 +88,7 @@ static int cros_ec_wdt_stop(struct watchdog_device *wdd)
 	arg.req.command = EC_HANG_DETECT_CMD_CANCEL;
 	ret = cros_ec_wdt_send_cmd(cros_ec, &arg);
 	if (ret < 0)
-		dev_dbg(wdd->parent, "Failed to stop watchdog (%d)", ret);
+		dev_dbg(wdd->parent, "Failed to stop watchdog (%d)\n", ret);
 
 	return ret;
 }
@@ -136,7 +136,7 @@ static int cros_ec_wdt_probe(struct platform_device *pdev)
 	arg.req.command = EC_HANG_DETECT_CMD_GET_STATUS;
 	ret = cros_ec_wdt_send_cmd(cros_ec, &arg);
 	if (ret < 0)
-		return dev_err_probe(dev, ret, "Failed to get watchdog bootstatus");
+		return dev_err_probe(dev, ret, "Failed to get watchdog bootstatus\n");
 
 	wdd->parent = &pdev->dev;
 	wdd->info = &cros_ec_wdt_ident;
@@ -150,7 +150,7 @@ static int cros_ec_wdt_probe(struct platform_device *pdev)
 	arg.req.command = EC_HANG_DETECT_CMD_CLEAR_STATUS;
 	ret = cros_ec_wdt_send_cmd(cros_ec, &arg);
 	if (ret < 0)
-		return dev_err_probe(dev, ret, "Failed to clear watchdog bootstatus");
+		return dev_err_probe(dev, ret, "Failed to clear watchdog bootstatus\n");
 
 	watchdog_stop_on_reboot(wdd);
 	watchdog_stop_on_unregister(wdd);

base-commit: 5bc55a333a2f7316b58edc7573e8e893f7acb532
-- 
https://chromeos.dev

