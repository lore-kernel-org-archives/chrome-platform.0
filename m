Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A41533343D
	for <chrome-platform@lists.linux.dev>; Sun, 18 Jan 2026 15:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768751094; cv=none; b=Z03bVPu9xBcMHsK4gCoLnGF7QTcGUcax6XxPvOZeGnjzjUCHLK5f8xEbdSnbaQyj/9PscejKBHT03FxWd9mXMlb25pore/TyW6caDTPm20ydtCF3D00fjJ8BhUp9tPjqIcXuvodwtCEdjfIg7caMy8R2Vdf1peNiW1JHPJMDWrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768751094; c=relaxed/simple;
	bh=LxBz3rw07wPHVT3ZcJ+S6GpTBYe4Z0OZ+B7cL6r5Yk0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VzMX0kNJ+zlOl4C40VKKSc7T7qHvckQ7ZT4aF8WPnFL7xEPtfhbMHcucaqvygRPXH4URUdKBmh27h2qM5Rh4HLfmqS+BHzGXXoQkuZ9smq5+KtYKuPIVrq8QmLNve2Qe4e7KSXFqTEIqdgFDsGBNjNSgNuJs1GHt+6RvqzhHSE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJ8MgSl0; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJ8MgSl0"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5eeaae02888so971939137.1
        for <chrome-platform@lists.linux.dev>; Sun, 18 Jan 2026 07:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768751092; x=1769355892; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cx4Lot2Jy8sYT4qX9cxe1NcFvJLaRTnaOofjXfAceL8=;
        b=TJ8MgSl0/zx35BQP161LcpeqS2c/Yz+Myimh8tb1hs0okfNmp0Vx+sLlV4EKOGclSm
         0eyRZog0wEpSzFEcUkgMGlCYX4IQz2mhVyw0oUYx+b9v8HolNo2vtZ42YAB3/DEnV/fT
         dswv5rJCPsMJk5iCyqYygymPdC9qOtRKQ/bYA1kTyqktcpYd9N6R4pAq8Tj2R1w/AsY2
         jbPmhS+ICkykly/xfAAU1xrXlqGjvWAal7fcMZCpHdjJXZ5n2mHIIu1cEWWI2sadUllH
         QwlLysiMV8vjU0+oQxlf4drkspO6lieJTP+Mhgv8j+fO8YZIDATtTwy/yCMC2EDfmZ54
         TCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768751092; x=1769355892;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cx4Lot2Jy8sYT4qX9cxe1NcFvJLaRTnaOofjXfAceL8=;
        b=q1cD+P5WKvQwxejIFc/TLhck3sblnxX49EpFNHmz4L1+464d/6Hj6rI4dXbZBGR2K0
         dwuUUR8iXDrB4FRcqsDedABIByyIm7YBmAyySFxHT1HzEcn1ntoP3kwUcPlL8VhhZeNy
         /kwMd28IDCWwApYyGqt0Ocxiql9YOHKPwa2Wm1x1HQNBW/D29j+oyxaQ/xD7VaLujY4p
         2A2C/pUvvdXSwZuK9VILET/HOe+2FzSVqw1y7WJyoM25W2DrohBIzyXhX6IeGX+Qi6k2
         aY0toirg0PYu8KNHAlcVaflqXH8ge4opuVdYlv/o9Dti1PDhywaLNiaKZQI5V8dlzChP
         ZOxA==
X-Forwarded-Encrypted: i=1; AJvYcCXMQ6wqi6euynOexXbLJRru99QyYZqZmndZ3TrZy6btewd3yqb6iLfPnccgDRmSw9HBQ2+I0+o0hwcdIWey6BA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyjl2QbKUr0LFz7RmTTxB6ofrHkwy/Z5wfIpOiI5Jon/eRdVFnh
	tgUEqeWVkfHWN8ZUOEnE4l9TlzN+J4VBNMkxSQFDa/nBYG/tSINqYiJtHqR4nswM
X-Gm-Gg: AY/fxX6o3H0sps/OXrsNvcpYSAv6r2+Agzs3WUrxMDtv2pbupyyrq3MhEzDNSyGu/L4
	zy/iScx8p+3rj7hn4Afs+LYOKgC7WWyeb+QR3BOaglJO7rQls2s9etZzE2LwhEpkFTwx80U2V0t
	FiWQQyCUcsxtzyUtWQZrHmeQ6aMY5Jp8jimUrlBFu5LQ7yQTEhKatyF5h0JoLxKJDjnRWXE+PAp
	i1guUGYAXluiKlC+CDWF0dPlq1YFRyKUTaDaNvbmZyEloKgil1219ms1fcJnvZxieD7YUKcSG/n
	VPnImAUogJCkj5Bs1gTY8d4koCgXDlTrIheJOr3LFNM063Z+st60WRMgeA9yuQrZESMFB5QyMo3
	ktked3lw8GwbqkNKCguj4jL/2zX/Bypo8zr0D1wboG80d91sTqBbDfmlhCgc15OVULtyyEsU2L1
	Q54Rhk++m1Gr3oEE0IAl1l3c8=
X-Received: by 2002:a05:6102:f10:b0:5ee:a309:6684 with SMTP id ada2fe7eead31-5f1a4dc26femr2529217137.10.1768751091838;
        Sun, 18 Jan 2026 07:44:51 -0800 (PST)
Received: from [192.168.100.253] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f1a6d3ca2esm2832731137.10.2026.01.18.07.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 07:44:51 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v4 0/7] iio: core: Introduce cleanup.h support for mode
 locks
Date: Sun, 18 Jan 2026 10:44:27 -0500
Message-Id: <20260118-lock-impr-v4-0-6c8d0aee8ed2@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13MTQ6DIBCG4asY1qVhBkTtqvdougAEJfUv2Jg2x
 rsXbZqQLr/JPO9KZhu8ncklW0mwi5/9OMQhThkxrRoaS30dN0GGOQBntBvNg/p+ClQ6xEKUBnJ
 bkvg/Bev862jd7nG3fn6O4X2kF9iv3woynlQWoIxqocDVklcC+bXple/OZuzJXlkwkQCpxCil0
 6LQtVIOxb/kPykZMJlKHiXUumKVhgoNS+W2bR8dbUzuFgEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5229; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=LxBz3rw07wPHVT3ZcJ+S6GpTBYe4Z0OZ+B7cL6r5Yk0=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJk5/5+bKbQtdK+s60jTOhXAldVYeKXi+SH3GsOXi/QPa
 Gk/ORvZUcrCIMbFICumyNKesOjbo6i8t34HQu/DzGFlAhnCwMUpABP5qszIsInxjtOS9nDxg1qZ
 27tXez5tbiyY2pRlce7KM70tN766fmNk+JjcKbXr9PfimV3ZLiEb7cobM469uvaxXELnVYt4jc9
 2BgA=
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
v4:

  - Replace "," with ";" in __iio_dev_mode_lock() docs.

  - Fix "bellow" -> "below" typo.

  - Drop first example in IIO_DEV_ACQUIRE_DIRECT_MODE() docs.

  - Match variable names in kernel-doc and definitions.

  - Replace "markings" with "annotations" in the "static inline" remark

  - Replace "claim_ptr" with "claim" in IIO_DEV_ACQUIRE_FAILED() and get
    the pointer inside.

v3: https://lore.kernel.org/r/20260106-lock-impr-v3-0-1db909b192c0@gmail.com

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
 drivers/iio/industrialio-core.c                    |  86 +++----------
 drivers/iio/light/opt4060.c                        |  52 +++-----
 drivers/iio/light/vcnl4000.c                       |  49 +++-----
 include/linux/iio/iio.h                            | 139 +++++++++++++++++++--
 8 files changed, 190 insertions(+), 184 deletions(-)
---
base-commit: c30e80d68a7afb334fde7147ee0106f25dd58d3a
change-id: 20251130-lock-impr-6f22748c15e8

-- 
 ~ Kurt

