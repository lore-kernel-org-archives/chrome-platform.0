Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C56A1993A4
	for <chrome-platform@lists.linux.dev>; Tue, 30 Jul 2024 10:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722336271; cv=none; b=pXyeHGteJdcz6bgs59n4/p1zoe2oNujElPVXKaU3V6RJQ14eQ9ifuyFUV28o2UntZxKbYgL4OshTaABGf8GJM7osbUOjqqqoIF6rtd3asc2k0xp6i2EWwVtMcJhhwqxY8YAlNqw4CpPpZ8W5veK7yW0gTPyZxHaI3p2X3NsLj8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722336271; c=relaxed/simple;
	bh=fK1eD6ZgZaJCFWg7plGuYvU5/18MRafwTZqCt2QDch8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Jie/178Q616LS3qacLAEBzs7uJGdcLjvmJvXEUkHTIQ0ubQerBeuDIFB3LON/jznneEVwDQVebZ3cWwshkhSmWUDMv+Dht7tWPKe+Gt54s/HwxpNA+pvHzv7hl4tKhpeRCbgXpYLFeWjL1RgUPYL51TK6oCb74sIXW1stHCybRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--patrykd.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QgRh6FVB; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--patrykd.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QgRh6FVB"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e03a694ba5aso6063179276.3
        for <chrome-platform@lists.linux.dev>; Tue, 30 Jul 2024 03:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722336269; x=1722941069; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/Ju3CEnm/75GdSSu7/W/MwAhJEZT9eFBSL3oOgUpEoo=;
        b=QgRh6FVBDLDhUOLKuyS7MHWZLlbQxqriQRvF1EpsuXhhyPmh/diIo15yF9FqU/H7K6
         zlW5KeC08Tr+N3VhcuXWzFfdDEvaFkgmiroFW/4tHaoavORzhTM0AANPVCjLCAOQuGD6
         cd/Ot1isz1fnLnme0d76p0BP9fGzR7h6PhmrtX7akic6VYGxgVRmO/KxPsDk+VBYDBxd
         eijTzhZe+tnkWKXAwx3d7wE/3EX6qsuzRjHX7c4PcpNjeFnc8ni6OilgwBSrOBsalGUg
         KfF0EuFrlOpobPHd83MmHcofXSlTsirfBVbrbypspUdbghgoK2BGLWpI6jAasWl/k1qN
         G/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722336269; x=1722941069;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Ju3CEnm/75GdSSu7/W/MwAhJEZT9eFBSL3oOgUpEoo=;
        b=UEs7/vqMFU5WlZs5BnRiOHokoP/kJwnf9Lj05ZP4fsLfU/MP40nbr7QfcvGPTyO1Qo
         mZbQWULCFT7+8Jro9nOmmOxu6qGtAPJSvHnsH2wjIb/j7pdC2xIP35ZAWrdLnGwYlPMI
         qvD5EWn+8o/iTEa5rW9/MQV0ViOiwdGeCY+9D49iOyV0OvvJG5ti99muTNFWlyGa7tC0
         M4D+Wm0dgSQOUhh5ROsklvo5m5ab4XzyPwKjcMOpQa3PQqqcGkaB74aTuTyE4Qkr+hWK
         NdkpqnzXa72tAO3Dl/EYIL4SoEFcuo2qzv9kypg0Qf8BtyYkOjZv6qF+FeEhkClJgNJF
         Uhag==
X-Gm-Message-State: AOJu0YyCh8ftmhcF3J74kCRDKItH8fZetMW20Z+admvHER+/QtCg6kIu
	Msvx/A8aZCdVd/R84KJ1CF2/8qkyoEIUzDjJLU3TMVrvWxFHOHpJoFx9annJK2ZWOwda+qHF5QJ
	x4EnotA==
X-Google-Smtp-Source: AGHT+IHazDOvazf0vrwZ1/mMamY8v4MleZ3SzQ8ocVwM20wVxRY/0nX3NuXnnpuypD/FCNGXHB2hSQb62xSJ
X-Received: from lysy.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:de4])
 (user=patrykd job=sendgmr) by 2002:a05:6902:2b85:b0:e0b:1407:e341 with SMTP
 id 3f1490d57ef6-e0b543c0bf3mr19416276.1.1722336268990; Tue, 30 Jul 2024
 03:44:28 -0700 (PDT)
Date: Tue, 30 Jul 2024 10:44:25 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240730104425.607083-1-patrykd@google.com>
Subject: [PATCH v3] platform/chrome: cros_ec_proto: Lock device when updating
 MKBP version
From: Patryk Duda <patrykd@google.com>
To: Guenter Roeck <groeck@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Benson Leung <bleung@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chromeos-krk-upstreaming@google.com, Patryk Duda <patrykd@google.com>
Content-Type: text/plain; charset="UTF-8"

The cros_ec_get_host_command_version_mask() function requires that the
caller must have ec_dev->lock mutex before calling it. This requirement
was not met and as a result it was possible that two commands were sent
to the device at the same time.

The problem was observed while using UART backend which doesn't use any
additional locks, unlike SPI backend which locks the controller until
response is received.

Fixes: f74c7557ed0d ("platform/chrome: cros_ec_proto: Update version on GET_NEXT_EVENT failure")
Cc: stable@vger.kernel.org
Signed-off-by: Patryk Duda <patrykd@google.com>
---
The f74c7557ed0d patch was tested with Fingerprint MCU (FPMCU) that uses
SPI to communicate with chipset. At that time, UART FPMCU had the same
version of GET_NEXT_EVENT command in RO and RW, so the MKBP version was
never updated in this case.

Version 3 of GET_NEXT_EVENT command was recently added to CrosEC. As a
result MKBP version is also updated when UART FPMCU is used which
exposed this problem.

Best regards,
Patryk

V1 -> V2
- Added missing mutex_unlock() on
  cros_ec_get_host_command_version_mask() failure.

V2 -> V3
- Moved call to mutex_unlock() below call to
  cros_ec_get_host_command_version_mask().

 drivers/platform/chrome/cros_ec_proto.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index f776fd42244f..73f75958e15c 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -813,9 +813,11 @@ int cros_ec_get_next_event(struct cros_ec_device *ec_dev,
 	if (ret == -ENOPROTOOPT) {
 		dev_dbg(ec_dev->dev,
 			"GET_NEXT_EVENT returned invalid version error.\n");
+		mutex_lock(&ec_dev->lock);
 		ret = cros_ec_get_host_command_version_mask(ec_dev,
 							EC_CMD_GET_NEXT_EVENT,
 							&ver_mask);
+		mutex_unlock(&ec_dev->lock);
 		if (ret < 0 || ver_mask == 0)
 			/*
 			 * Do not change the MKBP supported version if we can't
-- 
2.46.0.rc1.232.g9752f9e123-goog

