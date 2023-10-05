Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B28730CEA
	for <chrome-platform@lists.linux.dev>; Thu,  5 Oct 2023 16:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=howett.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=howett-net.20230601.gappssmtp.com header.i=@howett-net.20230601.gappssmtp.com header.b="hRRbDvkc"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-65b0216b067so18467216d6.1
        for <chrome-platform@lists.linux.dev>; Thu, 05 Oct 2023 09:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=howett-net.20230601.gappssmtp.com; s=20230601; t=1696522036; x=1697126836; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=81IG7ZEskGFoc51KTLqrlJ7eH2Un7ZFIsL+Wn+Mh6ak=;
        b=hRRbDvkc+YT+WHp5D8qpvUP8IG4kXzjFtF29+DE1N9U8pLDRM7S/m7L/mpwpre1CxT
         SSfvIje/6vjV9MJRiibVE/ytAVpAqRO+ktEJB2SVtU30BhX3fpKFLANWet1BIoYy9mx3
         F2X8awgWFtXnl68upQH4CdFAQU3V7QhqWuogA7K9sN/gXt13J4QHq/92W3a6XB/Z0yxT
         x+eskyojvh7VK+C6TGhVsyzTnoIOUrkFQl6T7ayxuj947MVTGkMBao9v3KohXFw3PCoy
         K6VhGwmX1IASjtzaJ/0CNAGkO/v3kObypU4YxMZDZUhy/LpDcAPLks0mDgdFMxVVwsMf
         gy2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696522036; x=1697126836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=81IG7ZEskGFoc51KTLqrlJ7eH2Un7ZFIsL+Wn+Mh6ak=;
        b=WrewTqc25i+UMB8vCn8zoX3PL/g5c7rkRahluekWCVyNHBhwOdg9dApY0zfsFq5/e1
         rEJrD8syBZOuqL1bG/DPWGZD+jNBmVXln1XAzbtFnLB09O6NGEUPHjWvqMkJ6Td1ahbH
         ONXOn9vRFXCExznrYblppg7FARmhXolqAbZhQ17O02gRqXNU0Ng08smZMUJQumfol6B4
         +FRfHLefDq65UUga02OsO84a0aXzOZieGi1nVjYRbqpNcz8uk7ca2o7yPB00AiZYfIJN
         pmI9Cr7rrcVJsB5WzGLjlicw+QDY4G9InFyDtMPSS9oaaBhcQIvT8klypWRl+lOCDd+Q
         K3pQ==
X-Gm-Message-State: AOJu0Yw1By4ioNKvckgu+3KyiW3I3/Xg0aORW4uDAqosUeFYMLveiAWl
	QDDe1E1GzXhElOUr/O2KgVndSA==
X-Google-Smtp-Source: AGHT+IEaED9toVf87gs9iKi+fbTYXnqed7TnF+r0DnTp2cAXFt1bO/HYayZaYFqVdQEpvIA+7HeKRQ==
X-Received: by 2002:a0c:f211:0:b0:656:33c7:dfff with SMTP id h17-20020a0cf211000000b0065633c7dfffmr4883901qvk.10.1696522036361;
        Thu, 05 Oct 2023 09:07:16 -0700 (PDT)
Received: from tycho.delfino.n.howett.net (99-107-94-179.lightspeed.stlsmo.sbcglobal.net. [99.107.94.179])
        by smtp.googlemail.com with ESMTPSA id k3-20020a0cabc3000000b0063d5d173a51sm611422qvb.50.2023.10.05.09.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 09:07:15 -0700 (PDT)
From: "Dustin L. Howett" <dustin@howett.net>
To: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	Kieran Levin <ktl@frame.work>,
	Mario Limonciello <Mario.Limonciello@amd.com>
Cc: "Dustin L. Howett" <dustin@howett.net>
Subject: [PATCH v1 0/4] cros_ec: add support for newer versions of the Framework Laptop
Date: Thu,  5 Oct 2023 11:06:57 -0500
Message-ID: <20231005160701.19987-1-dustin@howett.net>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for newer models of the Framework Laptop (both
13" and 16").

Currently-shipping models of the Framework Laptop use a Microchip embedded
controller that conforms to the MEC EC protocol -- that is, data and host
command exchanges occur on I/O ports 0x800 to 0x807 (inclusive). Newer models
have switched to an NPCX embedded controller, which uses the original Chrome EC
"Linear" memory-mapped I/O model.

However, those devices move the MMIO region for EC memory from the original
Chrome EC port range of 0x900-0x9FF to 0xE00-0xEFF. In addition, the ACPI node
for the EC device on these laptops indicates an I/O resource spanning 0x800 to
0x8FE when in truth, the device supports communication all the way through
0x8FF. 

To address these differences without impacting cros_ec_lpcs' compatibility with
Chromebook/Chromebox devices, this patch series adds DMI-match-specific driver
data through which we can detect per-machine "quirks". Quirks indicate changes
in behavior from cros_ec_lpcs' expectation, such as remapping the memory MMIO
window and handling I/O reservation windows differently.

Dustin L. Howett (4):
  cros_ec_lpc: introduce lpc_driver_data, a priv struct for the lpc
    device
  cros_ec_lpc: pass driver_data from DMI down to the device
  cros_ec_lpc: add a quirks system, and propagate quirks from DMI
  cros_ec_lpc: add quirks for the Framework Laptop

 drivers/platform/chrome/cros_ec_lpc.c | 61 ++++++++++++++++++++++++---
 1 file changed, 55 insertions(+), 6 deletions(-)

-- 
2.42.0

