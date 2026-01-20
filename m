Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D064836BCE2
	for <chrome-platform@lists.linux.dev>; Tue, 20 Jan 2026 06:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768890073; cv=none; b=BWM0zDvCXnAqzCp2+i9KSzl0Gt2hQ70o10cd71Qe7UYw6UbOzKP8qpQaXJxQGNj8do0dQNLNh/7HHOBScJh1QeZlXVoVHxqfxNSb6jQb1erzbnsmxv4BxC8cW+v72jHuPnIwFlPTaWIFXFNeJrWNqcnJOsx8GA7eQS7NoSD5TmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768890073; c=relaxed/simple;
	bh=8ACIUTMxM/zKXo7x/eO1abUeDEvW7CEDgGcDZxCz8g4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SjRJCZzifGdmMlgHxOSU13hOrLKezTnI5kJ5sXDsWMqUq6TcL2glcRMdlV5ng7vXut7ISpqRXSDLgo+sV2YkldAqy9CNNhKG6ua0FnaTM+CM5jWkyzKq92TAH8ECaJ4KSiZejn6v5gaetvqK5fs4Np2BrUA4O0u51/h9mYiDSHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jG2yMD0J; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jG2yMD0J"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-93f573ba819so1852990241.1
        for <chrome-platform@lists.linux.dev>; Mon, 19 Jan 2026 22:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768890071; x=1769494871; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b/He2bNX5Xacc5gQDOXo1/F0LSaAQyrezJ+tls86n2g=;
        b=jG2yMD0JjIwhMdu5/57V1vbSAyU95UajnvwoPTFpuOiRUAUCzpgv66kAnQIy6Rtbri
         +N829RJKr6vE2dbN0iIIj6PThjGueR+xY2UQF7XdXpiecmbGGAq9mFsfqo0p0DQTLI+K
         LZUYiU/GJqwbDfdWEfI/fTHLC6vuMKLFSS50TOflDCJkXBz1mEz680ERceykpOj2YHQ7
         zY1aQXkYBInnMbjAE9QW9C090JhyZIu6rV0xIN0pla9JhCOuXEsmgmcKWy1ex917DsUL
         DEQbdYF69pjSIQTwl9wirhiu8eJNCJJEXCQZjEfe/S4govY08IJP4Qqot0E3IVhQqSss
         Sj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768890071; x=1769494871;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/He2bNX5Xacc5gQDOXo1/F0LSaAQyrezJ+tls86n2g=;
        b=KrNJBTugEQZ5v9EUTQg8pdId2McJMJHWl814RincYfC2nqebl7s6KkuF4w4Nxrsq3U
         xtccYPAfWwBP3oo2lIL1vesPEfzWMn4dDop62JYBxqEXGQtVq5gwNwK812mJRAuxe59t
         hSlK2A5+Pn2cJIfirAxLTztmj0WgJcd6nYQ43yqAKWoQYNREbXi4pJsMQE34Rd9wJLIx
         R0K6HoiNjozZKDCnoqnG0Xd1bMfQ2wPZ0XqCunk+hyuiMcxPIfDE+Eqib9D34V2QazVV
         o6GwaAlQyjtu1jAk5gfRhr3CT500nn2tTIKG7DnvUSr/ffKlMgMAlE6w44gWJ5rIkagm
         eMGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe9PYtoyRfJ403YEFKBeVwzFxhNXAqQ0JXQv5Nhp6KqCd7yIHtdMXKF+cMXFYcUDpx6UYPKOLxpW+6wT+6Lfs=@lists.linux.dev
X-Gm-Message-State: AOJu0YztJkk6t9CHCRZtSsboRr705zzcbN24isKQnmGuZH6U8reD+3dN
	kDF0ypytahEyx4prplYXdKK/iqH8eZsq2+PPOVUMX6mHor1feR8n5FLm
X-Gm-Gg: AZuq6aLRhMalko5YUVHGZn5U5TwBWFObl8WqSW9LTxhWhqii9bb29rCqIlNdx2/YGUN
	GRuyF7JqsxESdyYOSJ4fTgsNpu0dLO+xb/TcB5z4XACaaqpGpETUtgK7v9BNgKXM++BdZOfLPmn
	OtFq8u3LViUENCBHiCohoS5impoxRkvGnybDirTghkmnuW9Vr1q5zmtKNRHmgFBHAwtrrFZgePa
	tVtYklkX5/oDrQ8+jUivP47MdEM6zZGHYQnJKd3AX8aC1EIaZn4Nl9HTjYY/sz4vl0+V9FIovl0
	WX3NuGROq9YUVcCUeqRXJloFIa8dtwbDC8C/hLV7CbosGHIV0CBeoTcGxVCAPMV8OUkH7frKy0R
	sJ0vU1JHQ1RpANuM5bZcPcG0l83evT+VhXYOwS0HnYetdZFWDEva4E3qiw9BOQlkvnIxhLrBz5O
	SYQjXgQDpMOl65jZj4t80XLBM=
X-Received: by 2002:a05:6102:54a2:b0:5f1:555e:a0b4 with SMTP id ada2fe7eead31-5f1a557be80mr4122229137.32.1768890070503;
        Mon, 19 Jan 2026 22:21:10 -0800 (PST)
Received: from [192.168.100.253] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f1a6900c1esm4057944137.3.2026.01.19.22.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:21:10 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v5 0/7] iio: core: Introduce cleanup.h support for mode
 locks
Date: Tue, 20 Jan 2026 01:20:40 -0500
Message-Id: <20260120-lock-impr-v5-0-d4d22347041f@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13N3YrCMBCG4VuRHG9kZpLG1CPvQ/YgPxMNa62kU
 lyk976pixA8/IY8b55i4pJ5EvvNUxSe85THax3d10aEs7ueWOZYtyCgDlGBvIzhR+bhVqRJRDt
 tA3ZsRX1/K5zy49U6ftd9ztN9LL+v9Izr9b9CoJrKjBKk1w5TNKrXpA6nweXLNoyDWCszNRKxl
 VSlSV7vfHQukf6U6i0NIJhWqiox+h56jz0F+JS6kWhbqdc/g43gmC1HauWyLH8gbIziUAEAAA=
 =
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5359; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=8ACIUTMxM/zKXo7x/eO1abUeDEvW7CEDgGcDZxCz8g4=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJn5cod0J6aIdx5/dN+NVfVqrafgcbNel3P9xk1nFLzeT
 1x9OjOjo5SFQYyLQVZMkaU9YdG3R1F5b/0OhN6HmcPKBDKEgYtTACayay3DP5Uk72ZOiRtVGrud
 D7adSX7z7uLB/dtnBSzb4+80nynjyidGhmPqtyNLWAxzHl/WZ7Rc/9+J5fBpmy27fpjHJ82/PkN
 wEjcA
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
v5:

  - Fix all function/macro names in kernel-doc

v4: https://lore.kernel.org/r/20260118-lock-impr-v4-0-6c8d0aee8ed2@gmail.com

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
base-commit: eab91f819af428173f7e0aa1c80b3e561c3707bb
change-id: 20251130-lock-impr-6f22748c15e8

-- 
 ~ Kurt

