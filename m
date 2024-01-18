Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F122E651
	for <chrome-platform@lists.linux.dev>; Thu, 18 Jan 2024 19:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705607613; cv=none; b=GS4NesC8jvfvERBB3FyRo8IY67j03lQEYkKlIRrJz5K1e4+pXAV5GaPzTgu7uoJvBM2LgiUpvAj5olFTQVSbehxy+Mxpuk+cyn5wPg8KB+Q4EQGNDgM+BkEtxtvqzyuvVbTOzATrbwKP9PyT2qfTggd7BvkR+tVrG/S12QyjH1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705607613; c=relaxed/simple;
	bh=3H0/PUm19INCLpIv8lZ7mMSa24z+/2A2899KRBqjzRs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=spsCCX80VtXhtzuzvFsexiUh435TrDIljAtaQVuGE2oX0IuAMbx5aipIDJ7Vhk8M6V3tMI1wjqGiacCk+yLjIJ3frBU7LKVl1bBy3RtK+/QaUR42foWlzSVuoGKRrVRQtn3rrvgM0m3tP48PqMafSbVDFmpqRMkpeJj7tKCWcik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GUThKXBz; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GUThKXBz"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2cd0f4797aaso623521fa.0
        for <chrome-platform@lists.linux.dev>; Thu, 18 Jan 2024 11:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705607610; x=1706212410; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3aPW495Dn9XKu9eq4/g3SllgOOtpizGjdMGk5c2KiHI=;
        b=GUThKXBzrrHXEgxw8eGT1H3++aQwInXo9PR0fVTxogYxwiTM6zO5QqpRrsP7s4rTJZ
         dxmRGLnpiomm7E8rx5BPtmFbqRxscQhtpxCW+F8uxdv/g+Fq9sGlG8tlEaqLF/HsfEa0
         yJXuxYcExzHdWlLEve6qdFhu4726QTHx1R81s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705607610; x=1706212410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3aPW495Dn9XKu9eq4/g3SllgOOtpizGjdMGk5c2KiHI=;
        b=lnWDrbCUJLyhpPPfc4adf193icU9Ca6d3+QznJZ1l/kNQLMHxJFdgKoZGuzmuHua1I
         S9ZNT++xCBsjdt9oChHCju1UDXccN1GUbXpqTBOW6qF226ADgTvqkzfc3W163qEw28M1
         dqrghbWB/d19qpa0ElQfBAG2XHVdv+lbWhYYth0IAV+7BZR07DoHHOXiWZYiXz+VqWnW
         e6v5OhloRS0yfSxVzmRkg81ty3PM3FrU+qjsuO0TSrRcJhFqg0mM+YjVNm/3sTAl2Z2Q
         UoLW/jyEU1mIIbjR5arJ07sL7xK2qFMpx2J85v9GnwpN6Gwp8POKqlv1PT/LiovFBI0B
         ywjA==
X-Gm-Message-State: AOJu0YxJaU2948b0wKxAI2VI8lOg4GLLtGU/UnbBL3VFX/aO9ts0hTqX
	O2wzlWhYddSXQsQ78nKBe1wGKL5S0ywHt7LCALwyTpjhutZEeLuXXriMr0txWA==
X-Google-Smtp-Source: AGHT+IEQUXVT5KEHfXYHFybVLkF/rXq4pvbsHcbBHj4RJlJoq000BasTt83sR+KbR0Z2WXwNkpVTEw==
X-Received: by 2002:a2e:9d9a:0:b0:2cc:db7e:aac2 with SMTP id c26-20020a2e9d9a000000b002ccdb7eaac2mr836985ljj.58.1705607609722;
        Thu, 18 Jan 2024 11:53:29 -0800 (PST)
Received: from cracow.c.googlers.com.com (138.58.228.35.bc.googleusercontent.com. [35.228.58.138])
        by smtp.gmail.com with ESMTPSA id 2-20020a05651c00c200b002ccd3e8a59esm2333345ljr.121.2024.01.18.11.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 11:53:29 -0800 (PST)
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
Subject: [PATCH v2 0/3] Introduce EC-based watchdog
Date: Thu, 18 Jan 2024 19:53:21 +0000
Message-ID: <20240118195325.2964918-1-lma@chromium.org>
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

The first version of this patch was sent here:
https://patchwork.kernel.org/project/linux-watchdog/patch/20240117102450.4080839-1-lma@chromium.org/

Changelog
V1->V2:
* Splitted into three patches
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
 drivers/watchdog/cros_ec_wdt.c                | 202 ++++++++++++++++++
 .../linux/platform_data/cros_ec_commands.h    |  78 +++----
 6 files changed, 264 insertions(+), 43 deletions(-)
 create mode 100644 drivers/watchdog/cros_ec_wdt.c

-- 
2.43.0.429.g432eaa2c6b-goog

