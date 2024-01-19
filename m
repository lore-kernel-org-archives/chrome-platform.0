Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F661DDC3
	for <chrome-platform@lists.linux.dev>; Fri, 19 Jan 2024 08:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705653815; cv=none; b=m9RXDMjBNaFXuTnH+g9GP6ABi7uY3iAhcLDFJ136g4wrxeRZLytdDxtpz1JdRbrDOcVdNDz/5DZw7n3foN65evDJ/vdxQpRluHGY/7OdEBauzk+qkkX2Zif2fveHahDeg9WHhN8y/hrwoXWgYSX1dkjhN2Bls+9FSlek0Jgc2fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705653815; c=relaxed/simple;
	bh=89c/E1WE9Dqz+FNJvgcC0QqVkf88/Uc2d4rfA4sgVJE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nm/80gdpgiLtScIaNGSHOXHyVXf4f87VVrGCYFYu3dWNxbrYXHv/+Bm3S6avNh1WTo3Za8r6Cu7qaUvA4qJRmKyEB7Se5/7AABezv0KeiRp9V7k2EMS7jfHuEtM6ogvJZbrdhahS5+d5uhMFHNs9UpmOl5sQawQ/SeLYRSpjcac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Jjnppm5c; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Jjnppm5c"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2cd33336b32so7252541fa.0
        for <chrome-platform@lists.linux.dev>; Fri, 19 Jan 2024 00:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705653812; x=1706258612; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NipyPWLmE/gRh6MB2S3xsZHlrOKnabjbF4D7HyjLfJo=;
        b=Jjnppm5cTK0j+daAyMs8mcXRiTWu5Z1X4hf64wS5mvLYszHfKrpNXmITHXzAM78Dym
         G0RAuARCO7iTTwmCSz1cmFR+y8EnWeQlqCr1B9etn+QDWePTxHzUGX3VNzab5yphCtfe
         poLRrwIGbpZsqPa6WdPz6OD4VljhvWZCG+zsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705653812; x=1706258612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NipyPWLmE/gRh6MB2S3xsZHlrOKnabjbF4D7HyjLfJo=;
        b=w0jF+flnNJyIcB4KM1/1PKR2iiCuLwuJAjFwtnHv9JQOr+gfz1oO8LxheJHO43q7un
         1XAE4AL9w+UBOKncYiltlVAIY6hFfRn0w/N1AQFz+LBk92tHV/qMlGPBe3ZTLgjuK/AD
         7AuvJMjSH5S9Drvuw7Ln8+FTFGM+JfuckyDUMG9uSiPZRgsiqf53Cd32uzraQg9D/bBo
         tJ0ypmhMGIsOwKjJCM5TAskcTaOBFS4WXv5XxBA7Gvn0DaNGtiTBxiG0x1MDpO9TNb5u
         csJZWU5+2uEyP0BHpxOn4xcWBucBTkGEiKiVFoqsfjIcy9ShHaJGY3txG4AAtg1/DwPm
         BodA==
X-Gm-Message-State: AOJu0Yz5LFKBisW1P+TSLwlVH1Uiacs7wuIVb180+/Q211RdNKoRxBQF
	71Lz9CO8+Zt44XxZp3RXo4mD9KDNR3XTqwEtu507WoLq54tbLeD0NqCcTkFjgg==
X-Google-Smtp-Source: AGHT+IE1FyC3NQ9gESEcnrvEJTYihiwykuX4jenP0Fk3IRgGkqirbCwDO6Yg7zBJ7psoJRM2hI6NmQ==
X-Received: by 2002:ac2:5627:0:b0:50e:7410:d293 with SMTP id b7-20020ac25627000000b0050e7410d293mr463966lff.135.1705653812166;
        Fri, 19 Jan 2024 00:43:32 -0800 (PST)
Received: from cracow.c.googlers.com.com (138.58.228.35.bc.googleusercontent.com. [35.228.58.138])
        by smtp.gmail.com with ESMTPSA id q23-20020ac246f7000000b0050e6aff6630sm905591lfo.152.2024.01.19.00.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 00:43:31 -0800 (PST)
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
Subject: [PATCH v3 0/3] Introduce EC-based watchdog
Date: Fri, 19 Jan 2024 08:43:24 +0000
Message-ID: <20240119084328.3135503-1-lma@chromium.org>
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

The previous version of this patch was sent here:
https://patchwork.kernel.org/project/linux-watchdog/list/?series=817925

Changelog
V2->V3:
* drop "-drv" from driver name
* use format #define<space>NAME<tab>value

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
 drivers/watchdog/cros_ec_wdt.c                | 202 ++++++++++++++++++
 .../linux/platform_data/cros_ec_commands.h    |  78 +++----
 6 files changed, 264 insertions(+), 43 deletions(-)
 create mode 100644 drivers/watchdog/cros_ec_wdt.c

-- 
2.43.0.429.g432eaa2c6b-goog

