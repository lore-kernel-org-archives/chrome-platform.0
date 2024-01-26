Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D18133CD1
	for <chrome-platform@lists.linux.dev>; Fri, 26 Jan 2024 09:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706263050; cv=none; b=SggnNqard35iIadN917qndIe2jWWvoVHVVd9EKOjL3mYPYscW9nX8Dfa1fB0X3InT2ZziJvo5AdvBHEOycPIOa7wMtKAcqSb7kfLUaeNkVbG3d3nGL4gLRDSnypx5rbiBbMp4RvfvQS+iSbktGPaTAzVZiJ1S9BPwZIi0v0IaPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706263050; c=relaxed/simple;
	bh=9X0YCXiCPSl+U1uwYM6fyvbzMxsAt15eysC37h6GhWk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VuACw2Luu1Bjj41xTCKn394GG5IRK7n3PdDpUGAIEFxZED+3oUsOWC++G8jZkXmV5pmv0XSy1XOvgwlgzvmLYRxdSUwL5ROLB5fsLfFB9CuRsUIrRAJNrZqJ7b1MMM6j4MrPx1ZvqGMftgesMG/0Nlu2e4cRj5olsyZX7FlQ6R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EX83kRvM; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EX83kRvM"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-51029606a93so131628e87.0
        for <chrome-platform@lists.linux.dev>; Fri, 26 Jan 2024 01:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706263046; x=1706867846; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ewTLwyANv9bkJgZe1agECghfnILfAveBkd1fZ/yoRfs=;
        b=EX83kRvM/ze5p8sNwgsOAzMDKZOio4yHQhU2/kwIs6Kg81ShZaRiC5p4yqACfkLb+F
         /bfTV7ka1FnqyvVGVHyWyksniEgRp0HvA7RLdCFhg6LstOJ+OkzRu4u4D/GRtICIDAHe
         L8Csa5p5dsj7VbOcJxe8kExBpckHcMdu6RKpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706263046; x=1706867846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ewTLwyANv9bkJgZe1agECghfnILfAveBkd1fZ/yoRfs=;
        b=e2cLZdzL0glhnMjiHRawJh6M0u0JNAwxScaOyJAq38HxDW9kNhQUK0Qt/5icWfqQum
         yypqn8vDVF3fVBYmpLANcfeXKTfraSksPX6PpJSQVqFiInYAfcaUo+/Ai+qgPaPkmLWB
         eKO7hOtykwWLtRm9F216nfJX5u5sE1sov9lVrlVf56seJbIe9Y+E1OQBnnteBb19sdL9
         JE7UOF3DiXD9wNRGgTDvmcvJ20Wyq4hQsU5bs0ORsiNcxi8xxqf9tFsbCWpcUNADu8hn
         oY9wotFbq0ECvu6AMkTxU3e27yix5953CSWlz6N4W1TnjdJZuMG5CX8Q5eoTxKFNB408
         u99g==
X-Gm-Message-State: AOJu0YzsYJiSjyj3jz906uoOuS972r+Qw99IEstoHAYz1oaaZy4MBPoL
	dP4BTr04XX+HYIY0Z1xhfcEhj86rw310vXG0u7Pb79xge6HRTkGI0GZXIFM8MQ==
X-Google-Smtp-Source: AGHT+IGxDw13YunS794kdvqn7kp/gxJfjNaXPluRmSKwsiMmWp8vJ8G3bPl5Vc09lK6yGBVnIzVzLQ==
X-Received: by 2002:ac2:59c9:0:b0:510:1567:daa8 with SMTP id x9-20020ac259c9000000b005101567daa8mr554200lfn.106.1706263045738;
        Fri, 26 Jan 2024 01:57:25 -0800 (PST)
Received: from cracow.c.googlers.com.com (138.58.228.35.bc.googleusercontent.com. [35.228.58.138])
        by smtp.gmail.com with ESMTPSA id b16-20020a056512071000b0050ecae41c51sm129041lfs.135.2024.01.26.01.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 01:57:25 -0800 (PST)
From: Lukasz Majczak <lma@chromium.org>
To: Gwendal Grignou <gwendal@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Radoslaw Biernacki <biernacki@google.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Lee Jones <lee@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Lukasz Majczak <lma@chromium.org>
Subject: [PATCH v4 0/3] Introduce EC-based watchdog
Date: Fri, 26 Jan 2024 09:57:18 +0000
Message-ID: <20240126095721.782782-1-lma@chromium.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Chromeos devices are equipped with the embedded controller (EC)
that can be used as a watchdog. The following patches
updates the structures and definitions required to
communicate with EC-based watchdog and implements the
driver itself.

V1:https://patchwork.kernel.org/project/linux-watchdog/patch/20240117102450.4080839-1-lma@chromium.org/
V2:https://patchwork.kernel.org/project/linux-watchdog/list/?series=817925
V3:https://patchwork.kernel.org/project/linux-watchdog/list/?series=818036

Changelog
V3->V4:
* updated sizeof() argument with pointer dereference
* added cros_ec_wdt_id to the driver structure
* "mfd: cros_ec: Register EC-based watchdog subdevice"
  has been already applied to the for-mfd-next
V2->V3:
* drop "-drv" from driver name
* use format #define<space>NAME<tab>value
V1->V2:
* Split into three patches
* Supplement the watchdog configuration with min/max timeouts
* Removed struct cros_ec_wdt_data  and get aligned to watchdog framework
* Simplified suspend/resume callbacks
* Removed excessive log messages
* Reworked cros_ec_wdt_send_hang_detect() function to be more generic
* Usage of devm_* allowed to delete .remove module callback
* Changed MODULE_ALIAS to MODULE_DEVICE_TABLE
* Moved clearing bootstatus (on EC) to probe() and thanks to that
  got rid of .shutdown() module callback
* Fixed/removed comments, removed unused includes and general cleanup

Best regards,
Lukasz

Lukasz Majczak (3):
  platform/chrome: Update binary interface for EC-based watchdog
  watchdog: Add ChromeOS EC-based watchdog driver
  mfd: cros_ec: Register EC-based watchdog subdevice

 MAINTAINERS                                   |   6 +
 drivers/mfd/cros_ec_dev.c                     |   9 +
 drivers/watchdog/Kconfig                      |  11 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/cros_ec_wdt.c                | 204 ++++++++++++++++++
 .../linux/platform_data/cros_ec_commands.h    |  78 +++----
 6 files changed, 266 insertions(+), 43 deletions(-)
 create mode 100644 drivers/watchdog/cros_ec_wdt.c

-- 
2.43.0.429.g432eaa2c6b-goog

