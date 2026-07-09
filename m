Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCC921CC51
	for <chrome-platform@lists.linux.dev>; Thu,  9 Jul 2026 12:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783601425; cv=none; b=jaAuY46eklrJ++Zq0o2cmX155CGMqTmc34kwlk3rwjjUOgqs0Zbj1hAk6cItejNZAK5gBgn7Xwns87icMetfi6l/Hu3L9nL5cm8PAEpT6fWJdb5ut059vumloyBnZTZ3vxLRElUVjDat5QJPwuC/r4wFVon1znC+TUbeGkX/Tro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783601425; c=relaxed/simple;
	bh=EXfM0v4EhcxQ+tklDnuDMs1Avw18MIFqmglueS1d490=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ek53g4L8O/Te+EttsPfkYmhFYk2+ZpzDcucNVOuU3sukRqHt74Sf5wDZDy3Y+AePSZz9jGV/W6yN8nPqdEpy62GubYYM9h0OgyeamxGwHUEXtHCie2j9WKbv4wnTZgEE633n4qjUMB+pHa3zDrn4CMvrjrB+a8vfGJmzKgqxoYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=YmSKJJGl; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="YmSKJJGl"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso512251f8f.2
        for <chrome-platform@lists.linux.dev>; Thu, 09 Jul 2026 05:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1783601421; x=1784206221; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YwbEF25FIKLXdl4gOi13bRERXBt3gyz2qIndX0FIOYg=;
        b=YmSKJJGlRegk/t0D2SI0U9Dtw7msUQkOQIz5NHMvjcv3V3RQr85mvYL55f1C8gX53L
         AbyfWgeXcV8RVDafqpxHmL3tZ7YwD/jZcFA3AJbDdPk86G98h9DFIYsG3+nNUhBI00Zk
         THuOF9KaqD2gNQs3y5ibgRFAUsUCvAX8UExMyOW9h+FNt5UQyjTRhYGpsDYhUAxWCWI+
         cvL7QWu3QFScp9yjstTQ0N53/2gQJPuKEkOAvgpkZvE76l2US7mbDCButbvN5i5Qcwk7
         ++1d6QI38/ydddEZ0SI10Kk4yvcYw0s0+1BfvsGdwOsBegr4GXaRVnTVmS9kh6qPvEYB
         wL4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783601421; x=1784206221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YwbEF25FIKLXdl4gOi13bRERXBt3gyz2qIndX0FIOYg=;
        b=LUmzUYjlXw2t7yCeI0eDSp5MRt5Uh9yPW3oh1rvIGpMurzocqQ/8VMqBCZKzQwnPn3
         8sOHzjxUWDDA2WbkHSfoA8sCNfLv67Zoh/a3ZKKLfCtpekCzGMXNnq8nr2EU/tyyasVK
         M8CXaidj4IC3lZtiHzO3j8PR1qVxK5qOqBnvAhp/goaII678oRTVAhi2mmxvmzgNrCtx
         Wsx0R8yub9vMAwzd8wHXxJpD0vGmGIjp6x5sI9O4P+thX7PTdAP9myOSt+2aCbZ+8d0n
         6szuEzy16xWWufOau0igyC/xq5dgS6IzKvEg4+T14ztZR311TxQ/VXefqaxakgTu6dpQ
         04Wg==
X-Forwarded-Encrypted: i=1; AHgh+RrJTRzypPR4A3ZCHvikkTI0Gig460D27lopoIo4TMadI4/iB7T0pnh/XMV+INqd2rFBOsf4O1t5L/YboctTKsY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZTgkqH09s82xJvLZZ9xdWwfu34uoVOVzEa0nFEuHnsogvZwjq
	jEJPtdCTxQhllpwunsxo8/zyXeSAo335R3uXiqT/ayMViA2EKgm+/HvqcNQYbsdegQ==
X-Gm-Gg: AfdE7cmdCb7t4t4tF14dnrsD9rXhNmRJrBAdtdKWzPudR0KmUPsgZL2pVThuttd3Vnn
	U4RIkAlFLsqEBTqxIBo7bv5XlyOnlRw61MRaGTG4TVSmv1oX+P4aDMJ5h0AvKeMNQElyHS8kizh
	6q6RuP1nOTrd2kEZ1kK11m1dndCZ9pu/lJ/iWo78xfJ5Gz7H+3W/qNqGujCLgHEIMwjXsDeNI+P
	wFU+qdJPACslD3H79MNf5AMMG8DudMDedgjP6y5SQN1wrBjIvrhyv8lQ+42GoNw0ptawN82uPcA
	/cULC5U9aRiMk+OEyjWNLpXhgedWfbo9T399MssdeRPSKCsBYFr1GnK3uU10OpRhOgIW+Bg3pJP
	vvsAfXQn6NPLAy0eJDinJ4yRZiJKlKU+Rx2W/Fbyl+5I2625afXAA2VGoD3xWm4+uERXVBRDn94
	yL6mOL8MhKyeE6vaWaaZz8kMnEKeBCFkppAN2ErNxGniaRmcrdkPr4Qu20
X-Received: by 2002:a05:6000:4027:b0:47d:e548:9b2 with SMTP id ffacd0b85a97d-47df071b752mr7412876f8f.2.1783601420418;
        Thu, 09 Jul 2026 05:50:20 -0700 (PDT)
Received: from horizon.localdomain ([150.228.38.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f21543sm47589451f8f.35.2026.07.09.05.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:50:20 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: platform-driver-x86@vger.kernel.org
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sean Rhodes <sean@starlabs.systems>,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v2 0/1] coreboot CFR firmware attributes
Date: Thu,  9 Jul 2026 13:50:16 +0100
Message-ID: <cover.1783601414.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This adds a firmware-attributes driver for coreboot CFR tables.

Changes since v1:
- Add explicit includes for the helper APIs used by the driver.
- Use __free(kfree) and no_free_ptr() for EFI name allocation.
- Use isascii() for EFI variable name validation.
- Convert the EFI write path mutex to scoped_guard().
- Rename the label/current-value parser to avoid default-value ambiguity.
- Use devm_kzalloc() and devm_mutex_init() for the driver state.
- Clarify that -EOPNOTSUPP after a successful EFI write is the
  reboot-required path.

Tested on Star Labs Lite GLKR, firmware 26.07, Linux 6.17.0-35-generic:
loaded coreboot_table and coreboot-cfr as test modules, verified
firmware-attributes sysfs exposure, fwupd BIOS settings enumeration, and
the reboot-required write path with debug_level.

Thanks,
Sean

Sean Rhodes (1):
  platform/x86: Add coreboot CFR firmware attributes

 MAINTAINERS                              |   6 +
 drivers/firmware/google/coreboot_table.h |  45 --
 drivers/platform/x86/Kconfig             |  13 +
 drivers/platform/x86/Makefile            |   1 +
 drivers/platform/x86/coreboot-cfr.c      | 986 +++++++++++++++++++++++
 include/linux/coreboot.h                 | 147 ++++
 6 files changed, 1153 insertions(+), 45 deletions(-)
 create mode 100644 drivers/platform/x86/coreboot-cfr.c

