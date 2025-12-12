Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB154594A
	for <chrome-platform@lists.linux.dev>; Fri, 12 Dec 2025 02:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765507535; cv=none; b=tz96+U9yXG8vEaBQQbTKfIA6OcqyqHwcsrnRdIZJA18wRDjNafUAbcJAM0sJi2aysEVCjsLGil/lLSLZW9MFOwLZQqlA+ZbVpLNMkjQaKpaFDCq/AQYwUBFeDHJw0OwJgyQDPnt8CcXh3scUGMgrhvyOZtS+H2K6nI8j0TpcJq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765507535; c=relaxed/simple;
	bh=YXFW98NZuFLnBMTCpnnslVJ6bxatDBadAJ6ohMCZDqU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Rlwlp3upLGoFOYwlCCgixoOi8cEgMU2VTRw+39dDGcA8c3lRSZUMTZVqXX0p2tI6AoInBo0Do8Fs1NzkN+kdKTTPFZVYfPZ0LgR0yd52AlO2ofpSm/bvEs6Z8TQFqoOV6dziQx7cO3urep/JgoZ5Sq7YCUW5tqsrQ3hRU+SIffQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ys/Ncw3Z; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ys/Ncw3Z"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-93f542917eeso238712241.2
        for <chrome-platform@lists.linux.dev>; Thu, 11 Dec 2025 18:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765507532; x=1766112332; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Xe+z35nDcGCHFcLb8uQ0wiLcWmhROk2HZ283Q91bZE=;
        b=Ys/Ncw3ZvsKmN/0zzij14gamnPPhWDEbgCWRjXmtc4Vp24S5ZQ9CERsQRbHy3V16gh
         hk9D9pQ5fwaGcXmEnN3d9fcl3FucFDkW2ZuLnKJ0lhh2Ci5S3QQsx3ZcXhKMeGG/jQrU
         wCQqBvfApRkUTA4LpplUaoqoXDtayto4XFXXYSRYtMCKHW+NojEbwWXOkQ3mgpReUbXB
         Pk2AuyOS6njI4LuFZeG46LtpyEtYc9fGjLiIFN4fkhzJzdZGv1taJO5D8HF2psj9+wi3
         NtmBZgwQwTdBKqMWLg0ODF5e9E8TLL0zshVCAn28gVEibecYTW2JDH0h2e+JZ9vEGjbc
         KPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765507532; x=1766112332;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Xe+z35nDcGCHFcLb8uQ0wiLcWmhROk2HZ283Q91bZE=;
        b=c8k+FsQyJ0Upb40Dc34U5vt96IRPSdc0I+eLNURdL9BpeEJrxYiB+BO0+a0PZMDkaQ
         1SsHX9lZTKFJmSYObndxT541llzVpL36CL25LUzKhCj/5vk0Vuh5Jp7z4FBaQ1ATD9t4
         OfcyIj9EDo7Oknan8aFMC77NIuqQYw3BkgTfyNupQ5HNYHLihHGU6Q3t6tzIpzOGzg16
         l4J4+nCvkoA3LWt74pg9nLYznQp/UGlOSNOgNB6NzC1IqZXWKuqzkkLn08ZtCRV+8JDu
         V75yJriWIDL0X5PRp8pqXpistL9iAZsIE5WuOLw+OlHlzFQA/FRdx7+cIIppRVHFMofd
         G7WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaOF+K3RYKAhnoZX173inpT16UZK9sqV/YVEHs0fMyB6KR0NESTGXxqm35izhJ52//E7iupX7Nw7aExfO7nMU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1WU5hjEm/klnh00kOtlU3qQQ7M/hMoyQQBcqNZy47y/rzO0HP
	ReakUHtCDMPGJDtbOSqlcNsXqwijw9QTh9S3u+BCnlsJdAWpvCUIJjdP
X-Gm-Gg: AY/fxX597Rfx+EVojEoRQYVy3y5UmHjwHs4l5rqy7qtNOUF57+zXCLBA0K3yajhqlY2
	BYzLyN70Guz3+kba9Pk5/ryHciy+GveCTmJbL0FevKzqH51L1aIlNag661KvPh8/hxg544Z2JUL
	o6k45BoBXpFVvanKPwYg5T58XiZVP6gXQl/brhy4MI8u8Zt2AGOz3Oc6HLqxGpSaaTrJ0xtRxS9
	ZrQnS8XE1U/R3zzdqJEenM+ms99GQldVwsq+h3rfuNRrSujw1lTyB10qrjYMr8KdgY6shMv5jJw
	y6AXa6sCxYZ2p8z8gRgH53MObDDs1xinPrqmQXSkKrcLS19MTlFeBM0b9sFnzkpmbcCizITsV6r
	0XsmO2nqACLgDfuphGP++OiMpB8Zu4jdi9XO/whftQrVWBDWgEEvMDRgUQdIKrmaOqEeNSNkNkG
	lDgQq/0jsobx3L3DvIVDJu378=
X-Google-Smtp-Source: AGHT+IHgSIn4ixGPWXBwjfI8XHiT+6Ui1NjpsiknsBJPTXrBKLciTSKicuXK96UUqpbjjZ8A0vOXRg==
X-Received: by 2002:a05:6102:3a0d:b0:5db:47c2:f926 with SMTP id ada2fe7eead31-5e82768c16amr112709137.15.1765507532442;
        Thu, 11 Dec 2025 18:45:32 -0800 (PST)
Received: from [192.168.100.70] ([2800:bf0:82:3d2:875c:6c76:e06b:3095])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e7d0f25ce2sm1693762137.8.2025.12.11.18.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 18:45:31 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v2 0/7] iio: core: Introduce cleanup.h support for mode
 locks
Date: Thu, 11 Dec 2025 21:45:18 -0500
Message-Id: <20251211-lock-impr-v2-0-6fb47bdaaf24@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL6BO2kC/03MQQ7CIBCF4as0sxYDA63VlfcwXSCFdmJbGjBE0
 3B3sW5c/i8v3wbRBrIRLtUGwSaK5JcSeKjAjHoZLKO+NCDHWgjJ2eTNg9G8BtY4xJNqjahtC+W
 /BuvotVu3rvRI8enDe6eT+K4/Bbn8U5JgnN2VFq5v5FmhvA6zpulo/AxdzvkDJiMda6IAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3337; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=YXFW98NZuFLnBMTCpnnslVJ6bxatDBadAJ6ohMCZDqU=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJnWjQdnbf26SVlpovfDjofh3b6zOl98v7ffWuAYc1IBF
 4vQMxujjlIWBjEuBlkxRZb2hEXfHkXlvfU7EHofZg4rE8gQBi5OAZjI3UsM/8xYM/wO/K3syZxg
 zh0kYr7jePOtRVE2n7b+j1l5QFuy7Bojw5xNNgeypnhWzdbZvVJ8StoPRsupy+oaF2vf5u08Zl/
 9hQMA
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

Let me know what you think and thanks for taking a look! The RFC
discussion was a bit long so apologies if I overlooked some comment.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
v2:
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
  - Link to v1: https://lore.kernel.org/r/20251203-lock-impr-v1-0-b4a1fd639423@gmail.com

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
 drivers/iio/health/max30100.c                      |   2 +-
 drivers/iio/health/max30102.c                      |  33 ++---
 drivers/iio/industrialio-core.c                    |  86 ++---------
 drivers/iio/light/opt4060.c                        |  52 +++----
 drivers/iio/light/vcnl4000.c                       |  49 +++----
 include/linux/iio/iio.h                            | 162 +++++++++++++++++++--
 8 files changed, 210 insertions(+), 181 deletions(-)
---
base-commit: daea3a394a8b425a2dd206ab09eb37f0d1087d35
change-id: 20251130-lock-impr-6f22748c15e8

-- 
 ~ Kurt

