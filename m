Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53C311C93
	for <chrome-platform@lists.linux.dev>; Sun, 26 Nov 2023 19:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=howett.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=howett-net.20230601.gappssmtp.com header.i=@howett-net.20230601.gappssmtp.com header.b="x/Zb4LRA"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7789a4c01easo208868785a.0
        for <chrome-platform@lists.linux.dev>; Sun, 26 Nov 2023 11:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=howett-net.20230601.gappssmtp.com; s=20230601; t=1701026720; x=1701631520; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PuNnWDc3vc7XjTlwIk8wpdZzwKGuqjUJefFTfPAUlco=;
        b=x/Zb4LRAeR0BIK4ImLbRNKJ0ldMc6hMwHMSEI2NbfQVERFcmQ5w5Lpl1yqCYcUygJS
         g8vPyayk6KspKNk8nqtdAVFOEp0e1ew4ICxAl8XJs1lY6iH+DnD2P6CCc08V1qpWmFS1
         AUmBxOuyedt17BFORtYqVy97LcMhLXhPv+l1S0EeHhGd7U2buaZN9PuAfz3c10SzACjj
         ylur312suw+1UAqn2IxWW0dMK+uiepuSXHifB/mlqJaP/tknCvfxwGJFtI/uKIOwZlox
         P7+l4E/kJj6XH/ueWoFxOz4U8DYr6mjpfPjpW65SkQFgItyNRRWP2xQwJLbarD98Luo1
         zEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701026720; x=1701631520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PuNnWDc3vc7XjTlwIk8wpdZzwKGuqjUJefFTfPAUlco=;
        b=dJwjwAY5T7MKwPw8M9D697IMnY4rcuCLz11yh8m/CqTW6YSPenl43PYspHx5laTHmL
         l/DlIwFvuGEXwNaCPkWboITLzq3qlGN3TJfDZsLkY4iHPQc0+F94OZKhMX2waj5RrVUQ
         gHTdq0rU5jKnWd/pD13gmDquufZJM721ez5SoOUfA0LEVr2lI/RRDoXSoonI3DEg/ekh
         rzx5QZBot4tOVEhUoCmt/jNBh8SCnS5p9/5Q6ww7+q9zvaY37x+8vRURSGEz0eUJa0fT
         MztCan8vNbEnm8eivCzF+Hc24/LZWMcmQXQ3IpipGRj2e6erhlxvhAOCYf1olWBeDQiF
         VjgQ==
X-Gm-Message-State: AOJu0YzX93IO2dsCSpS5FQTb93aEF5iarMfVcOrGedmwTH0wgxOCDuNA
	rbw7umoCvnsPULHV5cMNZo4wtQ==
X-Google-Smtp-Source: AGHT+IExuPNkr8xuU7RfSX22JaKanMCR9ujEFxD2U79NaiFxaRdZgCDroaKhqR+Yj+NsiqG7Q4NWwg==
X-Received: by 2002:a05:620a:8d81:b0:775:93aa:cb91 with SMTP id rc1-20020a05620a8d8100b0077593aacb91mr8774463qkn.35.1701026720742;
        Sun, 26 Nov 2023 11:25:20 -0800 (PST)
Received: from localhost.localdomain ([184.169.45.4])
        by smtp.googlemail.com with ESMTPSA id tx10-20020a05620a3f0a00b0076f1d8b1c2dsm3099040qkn.12.2023.11.26.11.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 11:25:20 -0800 (PST)
From: "Dustin L. Howett" <dustin@howett.net>
To: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev
Cc: "Dustin L. Howett" <dustin@howett.net>
Subject: [PATCH v2 0/4] platform/chrome: cros_ec_lpc: add support for AMD Framework Laptops
Date: Sun, 26 Nov 2023 13:24:48 -0600
Message-ID: <20231126192452.97824-1-dustin@howett.net>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231005160701.19987-1-dustin@howett.net>
References: <20231005160701.19987-1-dustin@howett.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the AMD models of the Framework
Laptop (both 13" and 16").

These models of Framework Laptop have switched to an NPCX embedded
controller, which uses the original Chrome EC linear memory-mapped I/O
model.

However, these devices are not configured in a way that is compatible
with the cros_ec driver. Instead of mapping EC memory to I/O ports
[0x900, 0x9FF], they map it to ports [0xE00, 0xEFF]. Furthermore, the
ACPI node for the embedded controller incorrectly indicates that it does
not use port 0x8FF for host commands. It does use port 0x8FF.

To address these issues without impacting cros_ec_lpcs' compatibility
with Chromebook/Chromebox devices or the existing Framework Laptop
platform, these patches add DMI match-specific driver data through
which we can detect per-machine "quirks".

Quirks toggle changes in cros_ec_lpcs' behavior, such as remapping the
memory MMIO window and reserving I/O ports differently.

Changes in v2:
* Separated Framework Laptop (Intel) and Framework Laptop (AMD)
* dev_warn has been demoted to dev_info
* Style fixes
* Reworded the individual patch bodies for clarity and style

Dustin L. Howett (4):
  platform/chrome: cros_ec_lpc: introduce a priv struct for the lpc
    device
  platform/chrome: cros_ec_lpc: pass driver_data from DMI to the device
  platform/chrome: cros_ec_lpc: add a "quirks" system
  platform/chrome: cros_ec_lpc: add quirks for the Framework Laptop
    (AMD)

 drivers/platform/chrome/cros_ec_lpc.c | 94 ++++++++++++++++++++++++---
 1 file changed, 86 insertions(+), 8 deletions(-)

-- 
2.42.0

