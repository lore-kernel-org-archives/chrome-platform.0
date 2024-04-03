Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00672153583
	for <chrome-platform@lists.linux.dev>; Wed,  3 Apr 2024 18:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712167526; cv=none; b=R8c50Fi68MLhzeg/l4PDNiVjWkLxzI+XfN8oLUDwiUyTnjUfbFJWORyA+9Z0maXqj4BCR6ZCgU0syhhE7mzRAPXq6LL3dkNWfZnvyGgGGg51///sSUsBmZd6Zq/RwoIUezMrhVLHWNERFxP7DwxkBKIPvb5lxYR5SuC1IuZlODU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712167526; c=relaxed/simple;
	bh=KHbE4qgF9Pb8RzBagVrV0DIGGkTehwaPNOTTLF55LQM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=D30hMc03f3dcDzKMEmeBQ7lwoa1prTapFLWPhn8N/FoLpZiIX//oUXqu5MOht52lEJN5II0V9e9XzwvvJVZM3pl99KKIODFISol/rDxNQOAgnuCPpKick+Vko1Xks8CNfj+Jf+xNwkprD2fVdb+vzhmpAb6iDot/n40pZKqUQSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NStskRZ+; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NStskRZ+"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6eaf1005fcaso49024b3a.3
        for <chrome-platform@lists.linux.dev>; Wed, 03 Apr 2024 11:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712167524; x=1712772324; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=73jxnSRwixN39ko5uxG2odEHWmCrsBBH9PbGB0SZNXo=;
        b=NStskRZ+dwaYCHHsbyUxwFhtsn0oE8LBEBXNvLIE+t0vFnn6MtTRaMf5VQMvqnVhiu
         h11pna7f0wYVxYxDsxlTzjQzqDDXZ1uePOoAvtD19D6Wb/5dQyrPNd85tjDDTM+11bw4
         Eotcbsr+jgrYySe3FhS9WH3i2xRKa1WB7EkqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712167524; x=1712772324;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=73jxnSRwixN39ko5uxG2odEHWmCrsBBH9PbGB0SZNXo=;
        b=D5lr3U8+Hf9I/Tr/ZMrjYRN2RU/gMA794Md18SedhX0s1tbaqtSS1baFvdzVUQj/1d
         KAGyB5oG0nDoOvSCQxzTWtCHYvsTaeGgheWy+Y+N7GXgud7D3AZVECxcyV/5c9K5kHSf
         m+UMJGGYsQ9zuiDFxz92qIgzJlQTC1xPfo50tdL04VMNWwMWzwwXrJmkEa2axX2BsYgG
         Ry9tooyoMV7oMr0EcTGdCyKK5wv3XT3NpYDOFHGLIIn6GRpionVps4E3EtxH3uhKY8es
         gBbSQfrEZ0XzLZIiQN3rMKkvRTM51mNrn5eHox8HI2t/mAm0e3FES6KImhF+8/yK+/2E
         vEtA==
X-Forwarded-Encrypted: i=1; AJvYcCV7ZkJ4/TSZS9zN8oJkf77QsyEsdfXCqe6cY/QcQgNmxEYu/r9UWD09niJHCokw2ItvX6LDacL6RyaBd/Od6kocnVnsLqRBhYgeBWQ5phAJ
X-Gm-Message-State: AOJu0YzCb4h1FdniKDbmdgi2W0sBEJbd38Z6ani2UtAdphyacYVsxGDa
	F/6fQpji2d1eNX3+nMX8Gz0WrhSyxMCWyc9r2DDNIIXCAEowbAv6kn4jkHxSVmjr708YHtNUnVc
	=
X-Google-Smtp-Source: AGHT+IFhHOx2SSYuRWdbtlNPDL2p7UNMawQSaLN6WdK2MAd2O6Z8hzrzzTKXzbOLl8iJ9hjBhYqUcQ==
X-Received: by 2002:a05:6a00:1a93:b0:6ea:ab08:683c with SMTP id e19-20020a056a001a9300b006eaab08683cmr290050pfv.1.1712167524078;
        Wed, 03 Apr 2024 11:05:24 -0700 (PDT)
Received: from pholla1.c.googlers.com (210.73.125.34.bc.googleusercontent.com. [34.125.73.210])
        by smtp.gmail.com with ESMTPSA id n16-20020aa79850000000b006e64ddfa71asm12359162pfq.170.2024.04.03.11.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 11:05:23 -0700 (PDT)
From: Pavan Holla <pholla@chromium.org>
Subject: [PATCH v3 0/2] usb: typec: Implement UCSI driver for ChromeOS
Date: Wed, 03 Apr 2024 18:05:20 +0000
Message-Id: <20240403-public-ucsi-h-v3-0-f848e18c8ed2@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGCaDWYC/33MQQ6CMBCF4auQrq1pC5TqynsYF2UY6SRCSSuNh
 nB3C0sTXf4ved/CIgbCyM7FwgImiuTHHOWhYODs2COnLjdTQlWiVDWf5vZBwGeIxB0vERArKbS
 tDcufKeCdXrt3veV2FJ8+vHc+yW39JSXJBW+gQWMMdiDsBVzwA83D0YeebVhSfwGVAau7RuqTN
 m0rv4B1XT9lsBgm7gAAAA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Guenter Roeck <groeck@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
 chrome-platform@lists.linux.dev, Pavan Holla <pholla@chromium.org>
X-Mailer: b4 0.12.4

This series implements a UCSI ChromeOS EC transport driver.
The ChromeOS EC is expected to implement a UCSI PPM.

Signed-off-by: Pavan Holla <pholla@chromium.org>
---
Changes in v3:
- Moved driver from platform/chrome to usb/typec/ucsi.
- Used id_table instead of MODULE_ALIAS.
- Split EC header changes into seperate commit.
- Fixes from additional internal reviews and kernel bot warnings.
- Link to v2: https://lore.kernel.org/r/20240325-public-ucsi-h-v2-0-a6d716968bb1@chromium.org

Changes in v2:
- No code or commit message changes.
- Added drivers/platform/chrome maintainers for review.
- Link to v1: https://lore.kernel.org/r/20240325-public-ucsi-h-v1-0-7c7e888edc0a@chromium.org

---
Pavan Holla (2):
      platform/chrome: Update ChromeOS EC header for UCSI
      usb: typec: ucsi: Implement ChromeOS UCSI driver

 drivers/usb/typec/ucsi/Kconfig                 |  13 ++
 drivers/usb/typec/ucsi/Makefile                |   1 +
 drivers/usb/typec/ucsi/cros_ec_ucsi.c          | 245 +++++++++++++++++++++++++
 include/linux/platform_data/cros_ec_commands.h |  20 ++
 4 files changed, 279 insertions(+)
---
base-commit: 4cece764965020c22cff7665b18a012006359095
change-id: 20240325-public-ucsi-h-3ecee4106a58

Best regards,
-- 
Pavan Holla <pholla@chromium.org>

