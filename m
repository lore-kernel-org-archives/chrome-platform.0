Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106F4179BF
	for <chrome-platform@lists.linux.dev>; Mon, 25 Nov 2024 08:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732523490; cv=none; b=HtOFXZNbKNbQ4++DtGnLQJnJHmWu13sKlTcSDVEsAXjOTiK1z7v1VUcT5VGiTHbAhAbNKfwi8IHYyhjgw/1IWIHPvGkGvv6KMpByPkvmXHHtTgVZQdPmuO2wPIHQOmfWx3sCVA1dkiv1R6MFc+pCdQquo4OEpb4z5t0BijhcLEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732523490; c=relaxed/simple;
	bh=He1DTAeJIyTPOcYmAq6cC2VSNdhtBdgya1P84hM+ZK8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CDKEd+hokCmucnrhdviGdFPhM32AX0asRAW0B/ycXqlTBulFc00Q0kZ+zuCSvsoXbUsXetfFFPcU0x0En9SqM2ydtRGFDXEvqQGn2z076fO6/hsHLBqtKtebVZs5xbdbb6HalUYvvvEDNiurSy/FoTJYm7jcWogaxuai6d5SZ6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NVsFYG21; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NVsFYG21"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-212884028a3so24953005ad.0
        for <chrome-platform@lists.linux.dev>; Mon, 25 Nov 2024 00:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732523487; x=1733128287; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g/Vcboz9yqJnuOCvwaptZL2oHcohzZsxdO1sPf8vDF8=;
        b=NVsFYG21VXEWOak2JmNLE5xgh6ZZN8tePFfaDIoPPh7pGATcupZO+RZ0S241xUey33
         /UiZZDoB8GRih+TYOvYtf6Jgtu+QURpfMw4J/nGkouu5UDl2PLWgNhDDl3LbHF0ZDD1X
         hr3/0T0Nt0FynMnrPYyOCQTPaA86/KT7bx+10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732523487; x=1733128287;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g/Vcboz9yqJnuOCvwaptZL2oHcohzZsxdO1sPf8vDF8=;
        b=iLWz0lDCf3d8hfOdAnLhfBO2EMkmnsgKtpPKU2rCA7eZIdOzh7nQYXROiFlQgUXTxn
         1zVW6TEF74AkIqpPELvVoes15LMGIuv9AX7Dr2FFRACdTp/XqWutuRfKSYqwo3fOg5QK
         ugTLSnjQxOhE/WXcOtkkKos2tBu6UTJ/uDy9C73j7kEAA/ZjWMpJWBTfwre+UhN6yrUm
         /XX1O1Jq6m82pR1g4FhLCraR0OGQpLA13HsBYxQk/FFgd51fj4WDsi0d0EBNHAOmqdus
         UI02nKx+RguTOnZySN2ub+7UC7mGIM+IcontiFBVFiWrIOX4CoU32AY3ZeCC4c0HyVzZ
         eBJw==
X-Gm-Message-State: AOJu0Yw67C5JeOxa6a8dZsdc/ThPOVP3ZHQRGbpobY2GgojJrTcrnFm4
	BiHvXE0l85J17xgirInkAzDP2ZLHEcwKJjxVq025fGXhUxQbFQrouJiZvMSwRg==
X-Gm-Gg: ASbGncvkz2VTeuXpxqmYecVa4jtYikGugYTdVDNYKxgGydPs/pxOX9IhtM2Co/sVUk6
	Oj/k73ShkkA1LRsurLryBUsGB8MBSEMwsoxhMXp/h4Mt5aTZOUwwAk7xb/9Z0FdbLUmGYJYJ04B
	3tN0EHCz6wUDQ0NQazVD7La5lsXuG2C3l0gymEy3husnHwL7VZN7xSA41ad+zO3Ay3SGqka36fv
	ZA9h6kehcqxGJd6xg7WYq8CWg0CYc0zTb5bLdKns8wrcRsb1yPeMKCcxBBSbz13U9NRe3DM
X-Google-Smtp-Source: AGHT+IHErz94EiqWWoHbBTw76REJa1NEGWWXxWddsah0jH/Nk15nl1D8qZYS9TdahVOTmzplFY3DdQ==
X-Received: by 2002:a17:902:dac4:b0:20b:a41f:6e4d with SMTP id d9443c01a7336-2129fe38e54mr183070215ad.15.1732523487360;
        Mon, 25 Nov 2024 00:31:27 -0800 (PST)
Received: from lschyi-p920.tpe.corp.google.com ([2401:fa00:1:10:66a3:d18f:544f:227a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dbfece2sm59090025ad.157.2024.11.25.00.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 00:31:27 -0800 (PST)
From: Sung-Chi Li <lschyi@chromium.org>
Subject: [PATCH v2 0/2] Extend the cros_usbpd-charger to make it a passive
 thermal cooling device
Date: Mon, 25 Nov 2024 16:31:15 +0800
Message-Id: <20241125-extend_power_limit-v2-0-c3266a86e9b1@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANM1RGcC/32NQQ6CMBBFr0JmbQ0dDagr7mEIqe0Akwgl04oYw
 t2tHMDle8l/f4VAwhTglq0gNHNgPybAQwa2N2NHil1iwBzPWiMqWiKNrpn8m6R58sBRFWjRXY1
 5tKaENJyEWl726L1O3HOIXj77x6x/9m9u1ipX5kTWXUqTkkVle/EDv4ajlw7qbdu+zny85rcAA
 AA=
To: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: chrome-platform@lists.linux.dev, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sung-Chi Li <lschyi@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732523485; l=1270;
 i=lschyi@chromium.org; s=20241113; h=from:subject:message-id;
 bh=He1DTAeJIyTPOcYmAq6cC2VSNdhtBdgya1P84hM+ZK8=;
 b=OLCwUcBUsou2+ABwP0UXSKV7vUZPaomRddZGrl+h86RNJ+x71QSs7oiW+L7DP3Q1wvzytKfKH
 4ENfVmX64huAdUGwGKP6ecaGmBEYsfU1426QNSxPlqFMMjHCDNGYxz5
X-Developer-Key: i=lschyi@chromium.org; a=ed25519;
 pk=nE3PJlqSK35GdWfB4oVLOwi4njfaUZRhM66HGos9P6o=

The cros_usbpd-charger already supports limiting input current, so we
can easily extend it as a passive thermal cooling device. By limiting
the current flow into the system, we can reduce the heat generated by
related chips, which results in reserving more thermal budget for the
system.

This series will only works on making it a OF style thermal cooling
device, so related code are guarded by #ifdef macros.

---
Changes in v2:
- Revise commit message for including the reason of change for this
  series.
- Remove uses of `ifdef CONFIG_THERMAL_OF`, and use
  `IS_ENABLED(CONFIG_THERMAL_OF)` when needed.
- Does not failing the driver probing if failed to register the usbpd
  device as a cooling device.

---
Sung-Chi Li (2):
      power: supply: cros_usbpd-charger: extend as a thermal of cooling device
      dt-bindings: mfd: cros-ec: add properties for thermal cooling cells

 .../devicetree/bindings/mfd/google,cros-ec.yaml    |  3 +
 drivers/power/supply/cros_usbpd-charger.c          | 84 +++++++++++++++++++++-
 2 files changed, 85 insertions(+), 2 deletions(-)
---
base-commit: ac24e26aa08fe026804f678599f805eb13374a5d
change-id: 20241122-extend_power_limit-62c2d9aabfa7

Best regards,
-- 
Sung-Chi Li <lschyi@chromium.org>

