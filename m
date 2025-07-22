Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8DF2EA737
	for <chrome-platform@lists.linux.dev>; Tue, 22 Jul 2025 13:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753190913; cv=none; b=csjNsXKcPSQaZ3fT9wJZWAsaLDSuDnlc55io/EudN5GIOtrMAk2I3epin9/u62xQMmn2aLpwOmEvzv48iDOSv3P8h1wF5wxZhUiIqzk7CuW2a/hWn7cQrl4nOUDq3YGrZuQY/ZXopnb121HNnLTkXWGbc5Q38U+jyKYzUyap/rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753190913; c=relaxed/simple;
	bh=lZfuCpsNtCDFtD2mIkqfNGc6k19kTKUYwNokWS/5tAM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=KEtzQsv9Jz9NjoOEJEjUbENYnD7ps1NKOA96xzaxnbPS2XoEFfjdt4juZtJo32mNDCCiWfi+H7mxgdiP2TqGwc60mubwbWuTGew8YHZPmvAhLOCa3qEEnhtDXL0laoJxzPZFiAu6W0YHVaIvo1VdFHuxYKOatpJkX3UaP+nC4BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tmichalec.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W12V/RRr; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tmichalec.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W12V/RRr"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-607c239c7f0so5182302a12.3
        for <chrome-platform@lists.linux.dev>; Tue, 22 Jul 2025 06:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753190910; x=1753795710; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y2ZdCOMadLYtwQ17YQBl/MkVa95WXMm29CGtxSF5vMk=;
        b=W12V/RRrEDfHFvK0yiLuDxZeF7RQq5rbMsshiBgr+3EsGQjZCeFFJGEvALfVVxeGBf
         B5qNXM5I0iuBi2uPBfXa/ED6fTDJeP3p4R2B5yTeMRbjpWXiK7aevKCXDKx7Bbbga0Dk
         pCQIO6u9faWYyOy20dyQQADigY8Y91oHoLPRcYnY/e57NEOMkDQHzr9w4wQoiHCO+G/5
         HFbPcYz7Yvw6bjE2ffEEYzBl++WAYhPQFr51IMxAZbxOMudsGo4UTOJ2fjrPmWQQZLsk
         pwO394/t5AZFi4r/HSq0zudXcZKxYK6o0/2p6nghEL1TP9GW/oRsT6sM4SawgUfg2nf5
         pvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753190910; x=1753795710;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y2ZdCOMadLYtwQ17YQBl/MkVa95WXMm29CGtxSF5vMk=;
        b=gXRdIFrJJuF9ONsJFw4jYxmpxPMuxHZ8Auc7OqccsMXST6eaRKyo+7C1h6/sO51hZ2
         CTwT04PWbvY31kG2ndPVeZHY9JMdSChKu0PcAieALzFHcOb4LTQd08nFYHP6St+axDmv
         rWvUNwh57S6OJuZXcpJ9qvD3yQBgg4Yt+qA+2PlunNsBCkMo8/4RN8fh9IsRkdweO3DG
         EZ/VxvjA+VtWp1s0DVpbm3ncWFziGPky1FhCyjdT76o4PaDUa3gaoqsV+oFVLXD2+ZcR
         Al19dq/Hi7nErLnAD6YoVGr6EwYXuSDbkrgPVTd/avC8NFGLvdI4cnwAOufU+XxWIFOj
         Oh5w==
X-Forwarded-Encrypted: i=1; AJvYcCXmRT8j04KPkNMp5Hg2wOKO57x7/ZzQsN/auGwSm6weY7ldTWGi7DCquI+DVPVF2z/PKUx3H3vMMLHEovDfDCA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwzIlwJ6RnSzx25psLzkBxJZmLvdEdYcGsBGSMVqZJRkWOmDaV2
	5zks6cQWXc/+EkpQdvXCbniEAnDt3KNMbss442NPFfs4wsoGNsMSjABQSnoEAwAkz7JL88pMwm2
	i8MVqUksSiSNiI1Gv1Q==
X-Google-Smtp-Source: AGHT+IHhABfNDI6aFdSjh37rLs3eT9u7XfYoSpwrqg3BaY2FdWTG8XAloBBVS7kg58Tqg+LF5DEduLfWGJgT9C8=
X-Received: from edys5.prod.google.com ([2002:a05:6402:17c5:b0:607:3229:efd5])
 (user=tmichalec job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:270b:b0:612:c928:ead0 with SMTP id 4fb4d7f45d1cf-612c9292d12mr15692866a12.19.1753190910362;
 Tue, 22 Jul 2025 06:28:30 -0700 (PDT)
Date: Tue, 22 Jul 2025 15:28:26 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250722132826.707087-1-tmichalec@google.com>
Subject: [PATCH] platform/chrome: cros_ec_typec: Check ec platform device pointer
From: Tomasz Michalec <tmichalec@google.com>
To: Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Andrei Kuchynski <akuchynski@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>, Konrad Adamczyk <konrada@google.com>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chromeos-krk-upstreaming@google.com, Tomasz Michalec <tmichalec@google.com>
Content-Type: text/plain; charset="UTF-8"

It is possible that parent device for cros_ec_typec device is already
available, but ec pointer in parent driver data isn't populated yet. It
may happen when cros_typec_probe is running in parallel with
cros_ec_register. This leads to NULL pointer dereference when
cros_typec_probe tries to get driver data from typec->ec->ec->dev.

Check if typec->ec->ec is set before using it in cros_typec_probe.

Signed-off-by: Tomasz Michalec <tmichalec@google.com>
---
 drivers/platform/chrome/cros_ec_typec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 7678e3d05fd3..1ef181614d4a 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -1271,7 +1271,7 @@ static int cros_typec_probe(struct platform_device *pdev)
 	typec->dev = dev;
 
 	typec->ec = dev_get_drvdata(pdev->dev.parent);
-	if (!typec->ec) {
+	if (!typec->ec || !typec->ec->ec) {
 		dev_err(dev, "couldn't find parent EC device\n");
 		return -ENODEV;
 	}
-- 
2.50.0.727.gbf7dc18ff4-goog

