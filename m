Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5BC4C8B
	for <chrome-platform@lists.linux.dev>; Wed,  3 Apr 2024 00:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712105251; cv=none; b=MYpJXZA+oNTNFNjkSb5cTN6Cj6QxhHLM4g7DXsoy9NVrhVAp6B4MqEedLwQ76zaR+f3eMfvrPkaXpdfahj9fOj57L83DZbvtiVEApRgHYRKLuqaQHdLUB/5kv7cX4G4qEl9XqckLz82UNQzH8HDW8Ld3r/bPdCxC1QBcsFbbQ3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712105251; c=relaxed/simple;
	bh=HFfiX5jrII8c6AY2ezwGfd4xanc1dfWfsuOXstwwS0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PmCNutrWfD7AJ8Vne/pi2neZMAHS9p8R/uwboFBxTHjbLxf+0d8rz6tpmctbSmPiUMRbfCh1H90U8qYYcOrltoMZy5SxEEVfnKxN65q01O68qSa0WpTy86Rw3qgnxvl/dFmoFTQ2i6Tjby0L6hSo9dR6lkBsW/PH0CVXIhZtZYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net; spf=none smtp.mailfrom=howett.net; dkim=pass (2048-bit key) header.d=howett-net.20230601.gappssmtp.com header.i=@howett-net.20230601.gappssmtp.com header.b=pkoRLyXa; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=howett.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=howett-net.20230601.gappssmtp.com header.i=@howett-net.20230601.gappssmtp.com header.b="pkoRLyXa"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-789dbd9a6f1so410093585a.1
        for <chrome-platform@lists.linux.dev>; Tue, 02 Apr 2024 17:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=howett-net.20230601.gappssmtp.com; s=20230601; t=1712105248; x=1712710048; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQDHfqOUffuHGzun0ffcPtb7VDjmih5bQQDGKgfETyw=;
        b=pkoRLyXaSQo1xyzJJt2RlCeIY+KThXndsO8MM93o4NxQyu9vQkflLicsLYaWZJWXaJ
         XlQulAlx4L2P+Oxq6iE7C/Fniw4nvzyO8DLDuep5/r9gKeTpaMF46IIk4Q9NMwQfQs2k
         UrhhIeLnr4LnfC+l43wObdmjLkL6ZvGH2CXhwB4s5MopwjjaUjMzPm+U5vgtDoR+vumC
         bGazjZPNopUPWAv/qSFmmarTOTL8TEFjPujYoyWHHW7PREINHPjM+QEG8q8RZJbeWTMh
         +3sVU6YCKSGh5M3/UL9+rZhE9JP8qY5rYNQ9ZuOH8wjNfZRu00+nE8q/yxpBfh0q0mRF
         fYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712105248; x=1712710048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQDHfqOUffuHGzun0ffcPtb7VDjmih5bQQDGKgfETyw=;
        b=qoc4JeueeUm3BuVf/ia3XJ4/L5cAxuQxI32aFvq+JMObW/qEbOkv4tlAuV9UBV1brl
         0PUb4M/Y+kZP7OgAmTXQ8eYMqNUssTATLCH1q7Inbi3AwEQNbAyBTWeAAWJHSC/Sw2BU
         l6htA9Gj0pWL1eEA9xO8VW/DPqB+HxwS8OUvNlTKveXxhNzkfp+ozgmyeU2nLZ/ngIxn
         5TaUCl5MubSKI7GA+3mUsbtI9X1X3+0Y/r6FRTKW2YmYqOqRgdQwU2qCwlaAIm4BCWCI
         WyiAOONE0HHqtYDTMlzjQVnNyWf07ihDmk2nMgLf8mgFNpKo21lZorSG6oRnY8uTbC6F
         BvxA==
X-Forwarded-Encrypted: i=1; AJvYcCWUYa1I6uXrnv7MHwuR8hkzQz923ZFnS/l0b6WqebFBnxRRVRXuBsQkhULYcnW7kreNDCKOhhnzRdj4nknQKaxPER7ePjilmWhQdstMe8mn
X-Gm-Message-State: AOJu0YzaWRizGR6uApQW40Pn/qibRhaMBjGinkXNHvkkFsoaSPJx1qYY
	fm+/WsiLqnG1oztdDlWvMoIAKfcmZcAugQuYcoiqdSzjHiLKJJfI0k8TCjtF4A==
X-Google-Smtp-Source: AGHT+IGx95xug0QXqELScyNR+hPhUysVr1qSgppQw/vZ1Ih3TZwAIIVdr0FICusifogPl4cDS/E0wg==
X-Received: by 2002:a05:620a:4da:b0:789:ee7a:154a with SMTP id 26-20020a05620a04da00b00789ee7a154amr15669166qks.3.1712105248315;
        Tue, 02 Apr 2024 17:47:28 -0700 (PDT)
Received: from tycho.delfino.n.howett.net (99-107-94-179.lightspeed.stlsmo.sbcglobal.net. [99.107.94.179])
        by smtp.googlemail.com with ESMTPSA id h15-20020a05620a13ef00b00789effdd500sm4700834qkl.76.2024.04.02.17.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 17:47:27 -0700 (PDT)
From: "Dustin L. Howett" <dustin@howett.net>
To: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev
Cc: "Dustin L. Howett" <dustin@howett.net>
Subject: [PATCH v3 0/4] platform/chrome: cros_ec_lpc: add support for AMD Framework Laptops
Date: Tue,  2 Apr 2024 19:47:09 -0500
Message-ID: <20240403004713.130365-1-dustin@howett.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231126192452.97824-1-dustin@howett.net>
References: <20231126192452.97824-1-dustin@howett.net>
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
[0x900, 0x9FF], they map it to ports [0xE00, 0xEFF].

To address this difference without impacting cros_ec_lpcs' compatibility
with Chromebook/Chromebox devices or the existing Framework Laptop
platform, these patches add DMI match-specific driver data through which
we can detect per-machine "quirks".

Quirks toggle changes in cros_ec_lpcs' behavior, such as remapping the
memory MMIO window.

Changes in v2:
* Separated Framework Laptop (Intel) and Framework Laptop (AMD)
* dev_warn has been demoted to dev_info
* Style fixes
* Reworded the individual patch bodies for clarity and style

Changes in v3:
* Addressed dev_warn feedback from Thomas Weissschuh
* Removed the host command region quirk; Framework Computer is slated to
  release a firmware update that addresses the I/O region issue from
  this series' v1 and v2. This leaves just one quirk, with the potential
  for future quirks (e.g. changes required to reduce EC bus contention
  on the Intel Framework Laptops)


Dustin L. Howett (4):
  platform/chrome: cros_ec_lpc: introduce a priv struct for the lpc
    device
  platform/chrome: cros_ec_lpc: pass driver_data from DMI to the device
  platform/chrome: cros_ec_lpc: add a "quirks" system
  platform/chrome: cros_ec_lpc: add quirks for the Framework Laptop
    (AMD)

 drivers/platform/chrome/cros_ec_lpc.c | 81 ++++++++++++++++++++++++---
 1 file changed, 74 insertions(+), 7 deletions(-)

-- 
2.43.0

