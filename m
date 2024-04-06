Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A460D4D9E5
	for <chrome-platform@lists.linux.dev>; Sat,  6 Apr 2024 19:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712431064; cv=none; b=dGZSR+zlfZRx7DTmwJfjEaVATnptUPQz8Cn0pJV8kDwSDqOVpwRewzsS3ja3MRXwdQLPdCDbCIGVjUI5QpPhgzfOwB6gdI+5JxGraOXFIMWrIF/j0NKV+IgOFA7wmNZEgbLSOu0/JTdiwc+VfEoq/IfLwleVQlblC+2OoQXJ8MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712431064; c=relaxed/simple;
	bh=hxjHXQSirYnMZcw6VLQSEFFq2ZmH/RXdVjyUtQzyBPE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eSKx0FbzrJI0BGqvF+Cprhw9Bkqt/gKNcNK7a1/wVPLhjGDePDWzjThoocJ+VlEe5KaHKHwCk3jIo5pyplQP8Cnmm8oOH1jiUnMMGDLJCwV4iBVBDEnlLwxPK31yjb1Lu3sv4iosYoehoGN/PEzIzQvFDa1m+/rNxh2b0grnYqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CO7sjazn; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CO7sjazn"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3c38396c965so2801287b6e.1
        for <chrome-platform@lists.linux.dev>; Sat, 06 Apr 2024 12:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712431062; x=1713035862; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=74L3Kh0F38La798159Il7YMYXwftdxT955aZ6Xjyni4=;
        b=CO7sjaznut2hcCUJdVe3SBaF0/dZ7XYcaM56OqkR91TlMQ8VoGcuebgVXx/XzvLM7M
         0LiUs268AN572l+18DDU5g72sjhD8R+IenJWwxW9FcCKm2VnAKrS5z/wFhUnsFN0EofP
         fitmVGyJrMTZeIAzjw42m4GY1XtLj1qs4mfhP8KdWkjkEmhYS7akRnQ6wKXadiOK3keY
         FOT/FPxvILrIGl/JyyLrgSkBe6BhXvhQDvAP7HRRegTnuuDog1bniE830eo7ajrLlC8X
         cXrwQkIPPDGtkiaBaaQnTUsHU4nApYESqPphRj7D/ZjbyeEsfTkAgM/QTBER6mNyZVHs
         /07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712431062; x=1713035862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=74L3Kh0F38La798159Il7YMYXwftdxT955aZ6Xjyni4=;
        b=qpUiy+936fdmxdkJSHwlvGG5dpUKCVS4ybDHMHV52Sx9WtCygRD9vM9KMCkoSuPPep
         Q2c9Zon+X8/2YRLritfSB9c5vQsP7pt7WRCnozC0wxOw3kSqBybihsA5y9DaokMy8sTY
         mxE9bcxQVu7IBorlNfrPWfLA59GF4cLZYvUJRhMze/WzazceUPiXuli8xjHxIr4hhPWx
         VEYki6A0TUWc6ZmCfl/syOxodDNbdBBS6+X3n/K4bLCYsWirA4v54a+sffLsTcnleA4o
         vGj1fi0v0/vvcagmMioMnboi2q+iH9xoOzIjaFZ+240FyWA414eHWC19qJCv1EDYN7GF
         SqwQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3qyhjNtdVECMB2F9E3u5m4FC30bw+f7cFj3NpyzhYb2EHLD0LzjIEoLj0q376btxDpY6vYRNc4xk3vADTGi8oIioiOGkwjo2YgyylVVQg
X-Gm-Message-State: AOJu0YxJDeSPjol9t+1wvol3+cCbxJGA0BctfyKIkpW2bthj/iypYyMq
	VCzqYbtD+vXJDkoj+rmf8cHnoHcQI8A+6jJzq4BGlsmYwbVWqF5i
X-Google-Smtp-Source: AGHT+IGG+WwFL2S7fm6wtnkR5YXyHqvB4Vy36JpCHCzAbmBZXdr883PCOo+EVr6ms9A8AgtJrDwxbw==
X-Received: by 2002:a05:6808:1b28:b0:3c5:ef95:16b2 with SMTP id bx40-20020a0568081b2800b003c5ef9516b2mr35052oib.19.1712431061661;
        Sat, 06 Apr 2024 12:17:41 -0700 (PDT)
Received: from fedora.work ([2600:1700:70:f701:902c:1d74:b5f5:5fae])
        by smtp.gmail.com with ESMTPSA id 124-20020a4a1582000000b005a46d5bd558sm892318oon.45.2024.04.06.12.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Apr 2024 12:17:41 -0700 (PDT)
From: Mario Limonciello <superm1@gmail.com>
To: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Sebastian Reichel <sre@kernel.org>,
	chrome-platform@lists.linux.dev (open list:CHROMEOS EC SUBDRIVERS),
	linux-pm@vger.kernel.org (open list:POWER SUPPLY CLASS/SUBSYSTEM and DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	"Dustin L . Howett" <dustin@howett.net>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH] power: supply: cros_usbpd: Don't show messages for no charging ports found
Date: Sat,  6 Apr 2024 14:17:34 -0500
Message-ID: <20240406191734.137797-1-superm1@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

Framework 13 and 16 don't use cros_usbpd but do use cros_ec. The following
sequence of messages is totally unnecessary.

[    5.545352] cros-usbpd-charger cros-usbpd-charger.4.auto: No USB PD
charging ports found
[    5.546722] cros-usbpd-charger cros-usbpd-charger.4.auto: Unexpected
number of charge port count
[    5.546730] cros-usbpd-charger cros-usbpd-charger.4.auto: Failing
probe (err:0xffffffb9)
[    5.546735] cros-usbpd-charger cros-usbpd-charger.4.auto: probe with
driver cros-usbpd-charger failed with error -71

Link: https://lore.kernel.org/chrome-platform/20240403004713.130365-1-dustin@howett.net/
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/power/supply/cros_usbpd-charger.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/power/supply/cros_usbpd-charger.c b/drivers/power/supply/cros_usbpd-charger.c
index b6c96376776a..4e69da2cce7b 100644
--- a/drivers/power/supply/cros_usbpd-charger.c
+++ b/drivers/power/supply/cros_usbpd-charger.c
@@ -570,7 +570,8 @@ static int cros_usbpd_charger_probe(struct platform_device *pd)
 		 * This can happen on a system that doesn't support USB PD.
 		 * Log a message, but no need to warn.
 		 */
-		dev_info(dev, "No USB PD charging ports found\n");
+		dev_dbg(dev, "No USB PD charging ports found\n");
+		return -ENODEV;
 	}
 
 	charger->num_charger_ports = cros_usbpd_charger_get_num_ports(charger);
-- 
2.34.1

