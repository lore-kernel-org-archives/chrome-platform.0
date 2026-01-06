Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A1323EA86
	for <chrome-platform@lists.linux.dev>; Tue,  6 Jan 2026 08:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767686833; cv=none; b=anAxu4apbnMYk9G9iYZldyox93c5s7fMhue014gHsmy9NKjNmVJImjg/t3HpmQccoPTHjyK/PIv5dpRPuuxnGXkzUQIypjvWstHmjI1gte8EqfSwMGwMZbmbFnBVmKi9NuCOOThlWC1DzVryZqrhTD8x4Xd4INSvTkLGy+Sk/0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767686833; c=relaxed/simple;
	bh=H51AqsAvN4LukC4x3boJnwjsgg1viNsO8J1scP7xvlY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LWJQPJeD93xZa2VKl6vwVIh48+A5Z16rnp4TqKy57SdH1lpkiu9bN+lrAOHiz7wSAxqv3+Ts3IWKOulO6A40yyVuT5mAYjXp5ZbKvFzMmcZuD95+ukQ0B8bDuKAoOsHG7bejZpa4gCUvMPHGyQa2iYX5yHmDPhbfP9IZDqywjLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NRwdoLyp; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NRwdoLyp"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5dbcd54d2d8so521101137.2
        for <chrome-platform@lists.linux.dev>; Tue, 06 Jan 2026 00:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767686829; x=1768291629; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=biXuMr/nGp2EvgJ6L44BwMP+XXmVCC/TEkgK6E6Xo3I=;
        b=NRwdoLypvpNFjTMoGxB2huXvnW/WqNOmrLPJNt4iQEPxzlBLKvedWWm/tUyNGhJEZI
         olLA3oSywK8rH6GA4L2uJ6hoJL/d1/989N7glHr+wcY9GAr3h/H+7AtnaJSAdqdOqL8l
         Lyqjxj2x9IR8ENAa/RHZQ5W6+TE+VPPXqayzaC9WYc/Ls4H6YB32Y4cCQBig84al18qH
         SJnRZQWplnYWHyevW1QhKi4keauMEdaf9xO5IRZ8lcgQfEFUCP5tG4cXY2z5+R5NQGhk
         5qzjT8fzd0ulsaWRKpsUoJwsmMrIPpawrXHcvg+VW7/oRjHkMYCTGUIGBMyK1lH+Uu3Z
         Lklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767686829; x=1768291629;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=biXuMr/nGp2EvgJ6L44BwMP+XXmVCC/TEkgK6E6Xo3I=;
        b=WIdArbfHkVZZlST11RNcvweT5ynWmWCSnweBI2Xzy6Qtrx2X0ZAHIUFNyzO+FvrrlC
         Mh0YrFGS28WN++ocpqhwe9JaAJlLudxS2McDNnz22td6HpAqyIVIc0VnqNhJd9h5kX/P
         qUkoGn8rMQm4XiUL65npjCzVFsxk3dYT1xeObIdotVoC2RTRXLcN4BOp6aEdx5FY+9ja
         H9bdlQIY7fpcMexY5c5rrstFG1r9JsMt8d6QCZzWYFsemSOtBUrR+b5sYXmiN+o7bNaf
         GTM9FoDvC/IoljtuNeMgGyzYwMeolfBNct5mrBJfNwFGnBoy/DgGPagHugzer4fPjoVq
         FQzg==
X-Forwarded-Encrypted: i=1; AJvYcCX5K/7wyPJgzN61F/M6zs74Nucw/fkBeeLTwLBXuTo0S9uyko+hyfJDb/LwTCd83/F2mRYvyUndOZIJElsJwHg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxlJFlwa2DaBXBq/1Vl1jRJkOvNtnQPpHuhtncKR/lj2vG/pRpD
	TC6kZdqB1TAmFvc2MCmeT55OHrh2NHdmqr5IxDFrjGZGPU4ppJ29BIvG
X-Gm-Gg: AY/fxX7fZTFbSTrl1q56arLW1snTb8n7FxN4CuuSGMpYQiKO6s2ByOgeBYlzliocxn6
	cZ6J9xhcuV94FEwjG9OTPErJlioVk0r+ekIUcmfdT/x5R34QNR7KkeMgjzzY65VCA8WKWzR/Cv7
	Kw+7R07iB84VRILeVLT6x3SmMxC895cQZuKMfiqiKFxtgOnUk8bUOV1OTaR7+uTjSeXYyhTFlns
	3JOeutX3QSwg11AWuEZLRXMElmIIeVG8lSNUZIvvzhlwtTH9PXMS11hQAHXr5UlREbBCxIveYrU
	obXW5DCwrFlOZ6y7yHd+b/G5JL4A8eAoy3qmPPMNG+vr7Q2a9bKZsQd8uGGJspfqC8SecBCSVLS
	XOTm3DRc8KTsqq9UpkeF+LvwlX25DOzVcKQuFio/M5mgiKlwe3CijZXNEKdbO2t/ZgQ5y66tXtD
	NUoJmC1K5ddSjf
X-Google-Smtp-Source: AGHT+IHmioVFP08GI01Nc8JhNekoVnKFd9MQD7ix0v/GYc8lCbyEExeYdsvPZdDGlSjsB6ThnUchRw==
X-Received: by 2002:a05:6102:dce:b0:5db:e6fa:f7fe with SMTP id ada2fe7eead31-5ec74524ed7mr596607137.24.1767686829463;
        Tue, 06 Jan 2026 00:07:09 -0800 (PST)
Received: from [192.168.100.253] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-944124a3386sm457615241.11.2026.01.06.00.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 00:07:08 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v3 0/7] iio: core: Introduce cleanup.h support for mode
 locks
Date: Tue, 06 Jan 2026 03:06:55 -0500
Message-Id: <20260106-lock-impr-v3-0-1db909b192c0@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ/CXGkC/02Myw6CMBBFf4V0bU1nWh668j+Mi1JamCiUFNNoC
 P9uwU2X5+aes7LFBrILuxYrCzbSQn5KIE8FM4OeesupS8xQYAkgBX958+Q0zoFXDrFWjYHSNiz
 952AdfY7W/ZF4oOXtw/dIR9jXfwWFzCoRuOCt0uC6Sl4Uyls/anqdjR/ZXomYmQC5icmsXKvqt
 tPaocrNbdt+tewNetwAAAA=
X-Change-ID: 20251130-lock-impr-6f22748c15e8
To: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Benson Leung <bleung@chromium.org>, 
 Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Gwendal Grignou <gwendal@chromium.org>, 
 Shrikant Raskar <raskar.shree97@gmail.com>, 
 Per-Daniel Olsson <perdaniel.olsson@axis.com>
Cc: David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4751; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=H51AqsAvN4LukC4x3boJnwjsgg1viNsO8J1scP7xvlY=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJkxhxZnfoperHj45eOGr9cmuvieSehmvyio5+Y49YBY3
 xH3TXZKHaUsDGJcDLJiiiztCYu+PYrKe+t3IPQ+zBxWJpAhDFycAjCRxbsZGebdUggRE2vbtWvB
 udAJ37894Xn6WurLf7nlXT/2Jjp/rIhh+B+1y4bH6a00w6PsyqlJJ+aoBydNn6T1xfErhwJrR1K
 QPysA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Hi,

In a recent driver review discussion [1], Andy Shevchenko suggested we
add cleanup.h support for the lock API:

	iio_device_claim_{direct,buffer_mode}().

Which would allow some nice code simplification in many places. Some
examples are given as patches, but the last two are the biggest
differences.

In this version I dropped the RFC tag, as the general feeling is to go
through with this after some modifications. Main one is the addition of
IIO_DEV_ACQUIRE_{BUFFER,CLAIM}_MODE() wrappers to avoid drivers using
the guard classes directly. I also added comments on the forbidden ways
to use this API but I definitely still take suggestions on this.

For now I dropped iio_device_claim_buffer_mode() rename, as this point
is still being discussed. My suggestion based on the RFC discussion is
to do it, but in a separate patch (using coccinelle) and while we're at
it rename the whole API like this:

	iio_dev_mode_lock()
	iio_dev_mode_direct_trylock()
	iio_dev_mode_buffer_trylock()
	iio_dev_mode_unlock()

Let me know what you think and thanks for taking a look!

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
v3:

  - Reword commit message of patch 1: infallible -> unconditional.

  - Drop "*strongly*" in __iio_dev_mode_lock() kernel-doc and be a bit
    more clear on the function's intention.

  - Keep comment about inline functions and sparse markings, but drop
    the __cond_acquires() part, as the new implementation makes it
    unnecessary.

  - Implement iio_device_release_*() as macros around
    __iio_dev_mode_unlock().

  - Rename iio_device_claim_buffer_mode() ->
    iio_device_try_claim_buffer_mode() to avoid silently breaking
    out-of-tree drivers.

  - Drop the `_` argument prefix in new macros, as there are no name
    conflicts.

  - Drop "dummy" from IIO_DEV_ACQUIRE_DIRECT_MODE kernel-doc, as the
    `claim` variable does store the error value.

  - Drop IIO_DEV_ACQUIRE_BUFFER_MODE() until a driver actually needs it.

  - Rename IIO_DEV_ACQUIRE_ERR() -> IIO_DEV_ACQUIRE_FAILED() to make the
    name more clear.

  - Rename IIO_DEV_GUARD_ANY_MODE() -> IIO_DEV_GUARD_CURRENT_MODE() to
    make the name more clear.

  - Add missing . in iio_device_release_direct() kernel-doc.

  NOTE: Andy suggested __iio_dev_mode_*() be exported into the IIO_CORE
        namespace. However, this cannot be done because these functions
	need to be called inline, so Sparse can see the __acquires() and
	__releases() tags.

  Happy new year to everyone :)

v2: https://lore.kernel.org/r/20251211-lock-impr-v2-0-6fb47bdaaf24@gmail.com

  - Add __iio_dev_mode_lock() (formerly iio_device_claim()) in the first
    patch.

  - Added comments to make sure __iio_dev_mode_lock() is not used by
    drivers to protect internal state, or in general.

  - Add patch which re-implements iio_device_claim_direct() using
    __iio_dev_mode_lock().

  - Match iio_device_claim_buffer_mode() semantics by reimplementing it
    in the same way as iio_device_claim_direct().

  - Guard classes now are prefixed with __priv__ to make sure drivers
    don't use them directly.

  - Add IIO_DEV_ACQUIRE_{BUFFER,DIRECT}_MODE() documented wrappers

  - Avoid any function renames (for now).

  - Rename dummy variable `claim` instead of `busy` on vcnl4000 patch.

  - Avoid scoped guard in max30102.

  - Keep using iio_trigger_validate_own_device() insted of
    iio_trigger_using_own() in opt4060.

v1: https://lore.kernel.org/r/20251203-lock-impr-v1-0-b4a1fd639423@gmail.com

---
Kurt Borja (7):
      iio: core: Add and export __iio_dev_mode_lock()
      iio: core: Refactor iio_device_claim_direct() implementation
      iio: core: Match iio_device_claim_*() semantics and implementation
      iio: core: Add cleanup.h support for iio_device_claim_*()
      iio: light: vcnl4000: Use IIO cleanup helpers
      iio: health: max30102: Use IIO cleanup helpers
      iio: light: opt4060: Use IIO cleanup helpers

 drivers/iio/adc/ade9000.c                          |   2 +-
 .../common/cros_ec_sensors/cros_ec_sensors_core.c  |   5 +-
 drivers/iio/health/max30100.c                      |   8 +-
 drivers/iio/health/max30102.c                      |  33 ++---
 drivers/iio/industrialio-core.c                    |  86 +++---------
 drivers/iio/light/opt4060.c                        |  52 +++-----
 drivers/iio/light/vcnl4000.c                       |  49 +++----
 include/linux/iio/iio.h                            | 145 +++++++++++++++++++--
 8 files changed, 196 insertions(+), 184 deletions(-)
---
base-commit: fb2f4eb29a258145b0336601f00509cab6e93e7c
change-id: 20251130-lock-impr-6f22748c15e8

-- 
 ~ Kurt

