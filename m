Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3B3307AD9
	for <chrome-platform@lists.linux.dev>; Wed,  3 Dec 2025 19:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764789578; cv=none; b=Ar3x+XhhkyaWmEQyKjH+UyrN7ahQISeF4MSwunPGCoMang/xJCRD3Jwz6fAb0cCnClGq9NE30fV19zuforLCt0+w/ejw3YutXdit/tIqzdcn2tGn3fZ+fKt14nT8YnfDFMnfEdmU9MkwuyXMypuVYlObQo1w5yQtKKrVyMVKoR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764789578; c=relaxed/simple;
	bh=2Ews3nCp5RcsOWe3/ZSjBTP5CQV+y44P8Wfs0s+BuQA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KC0DHeQkKWzXX/12WCzU2a5EkAMDXxXXAuVW0EACmFG8e0sYmsRQb1ZI8hZaudBty1xlxpw3zKhpw+LyTq9sReY1n4YntcCZfo9UrZ2e9i+SdhLbHn6meC78+WCa32YvhT+9hgRs70TlF/EaCCDtWO7KYLclu+73RD5b/irVGXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JsNbvWo9; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JsNbvWo9"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5598b58d816so66504e0c.3
        for <chrome-platform@lists.linux.dev>; Wed, 03 Dec 2025 11:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764789576; x=1765394376; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FsWm84k2qtEC6zCHV3II8eQa45w/fBWOUPbdCR/O5So=;
        b=JsNbvWo9cgwCHg27+EmiwIHx4A4CFVevch5xDN/MayW89sxzaKYh/tAYeikydYUIl2
         AV1G5rNqeuEteH6iQ50zoPtnF63fdLmtcHbvF9GoDtZGr9CDFtGf7A5FbQ2Ujb3RU1Mw
         BrnYpf+EYLosO+H4XVcQ25WMmQYE0nTd9nzQxJl72gUgFlayZJqi4sIrDAgJi6kKcCDd
         uGJ5AVZQaxnAT616aWISzEurzuxxnoxcdQYraycHq79LnM/aCCTorhgo9WeVFcuQhS5E
         gQCeQdwGU4jl9lRcMWHqYVprY9SuO0QUvgW16guddpPJE/Re0EyaFe3Bdd0vRHwKF14y
         35Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764789576; x=1765394376;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FsWm84k2qtEC6zCHV3II8eQa45w/fBWOUPbdCR/O5So=;
        b=lLV7Nx0xYoVvWTtgxPSvZ4p+X++KJPANLm7iByJh/WvspN9y6Nv7xfX1+jqMDTRQeJ
         Y6fPLwyfA3FXlznaviWCs+9vuwnaGhmndfHBhJ1Ehe3YBh2XJzwfiZAnuth//HkpIQDt
         ULGcr3OxSN3Zgk0ifnmOer3UuSOMf7FFvrBX0b1ZFmUoMppV1w0UHCNO6E24wfm4WWQP
         2nejtohsrZEjK9IJnqUHQ+JsB7sOntOEf3lsQNup6zAuEOoKoy9aWyxwP+Bh3nE5pMLJ
         Z8NjstQigCB/Lg/5mcgQBM7KYeBajO+CaSNUrJJY7nXnf83KOuVWxoiZrNzhfvx3uQpI
         UXmg==
X-Forwarded-Encrypted: i=1; AJvYcCXuT1otcddugir67J8V16xvW3/CuMRb3oZf9wSvthV4P1JfCRXZxykXPRiXWcPcXVCv3nTHSHBDbGpEpzQkD8c=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFcr4O1OWBU0q582YynglclgfFev8Gr5kNqgQJBixSw6iqwKQa
	5NizYp+FUKN1LZhnhJJR1CgvHoIkUJFfOV7uwtmT8kqlx9ahMd3r+eAA
X-Gm-Gg: ASbGncsH3cdU0xYYzEtSNjM3pP4fXqYSnLWjoM/MMMLAX5ty2xS4JkpAa6Xj0iyeTXa
	d2Eaw3sbW/GBU1aarGGNKvxN4JdZ5eCTmnloVz7L0TGubc9FrZ2vq85Gx+pxs2AJUPkWCpLlPTk
	vKp0kLKAM+r9D9IDKP8a0ZwjDX/kWHm6t3beyHMQunvDAcYsu2jeHkz9WzzewCgXab6SJHuOqhO
	VfIc4BBhS1rrxRAjiJ0xFIZy+F/foLmvhx0IcjltjZmt19RmgXyGHbIwrL0P1jYkvKVKqjJhuCi
	jHoPJyyxF13SAxOrP+gNjiok/SgsNCielMIcPbRhoFq2mJg1ud9kw2/jvErB39wBtfFDEUor/iE
	LJSdbwGwLrY34hChxea01rgNZMK1Zjd+O7vh3ywwOMVrmj1G8qQZHxogSHh84gOp196iyvPcFR3
	M0SahMtgK+aZiy
X-Google-Smtp-Source: AGHT+IFawNilC7IYRWjKVXVVeZWmWiJzDYwMx1u5PNwmhAzymV5Livw2jtngj7e3+W9FLy7L6P6jMw==
X-Received: by 2002:a05:6122:2516:b0:55b:305b:4e29 with SMTP id 71dfb90a1353d-55e5bfe64c5mr1532422e0c.21.1764789575866;
        Wed, 03 Dec 2025 11:19:35 -0800 (PST)
Received: from [192.168.100.70] ([2800:bf0:82:3d2:875c:6c76:e06b:3095])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55cf4e1d56asm8121346e0c.4.2025.12.03.11.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 11:19:35 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH RFC 0/6] iio: core: Introduce cleanup.h support for mode
 locks
Date: Wed, 03 Dec 2025 14:18:14 -0500
Message-Id: <20251203-lock-impr-v1-0-b4a1fd639423@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPaMMGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQ2MD3Zz85GzdzNyCIl2zNCMjcxOLZEPTVAsloPqCotS0zAqwWdFKQW7
 OSrG1tQAFzaXRYAAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1948; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=2Ews3nCp5RcsOWe3/ZSjBTP5CQV+y44P8Wfs0s+BuQA=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJkGvRp1XLc4OYPm/FDJq/q6YFfM4W8frz1/z/hnyvo7n
 YpChbemdZSyMIhxMciKKbK0Jyz69igq763fgdD7MHNYmUCGMHBxCsBE7Kcz/M+0N9Kq/3vA1m/v
 lO3LGR2755830pTXPnL0nPCf5B+rNkxkZJilu5BxSXHHZoUT0b//7gt6w7TBiZO3MvtMyx3xYiN
 bBh4A
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Hi,

In a recent driver review discussion [1], Andy Shevchenko suggested we
add cleanup.h support for the lock API:

	iio_device_claim_{direct,buffer_mode}().

Which would allow some nice code simplification* in many places. Some
examples are given as patches, but the last two are the biggest
differences.

Although I was never entirely sure if Andy meant cleanup classes for
locks or for iio_trigger_notify_done(), I still think this is a great
addition to the API :).

Thanks for taking a look!

* It's important to mention that David Lechner expressed some concerns
  about this [2], hence why this is an RFC series.

[1] https://lore.kernel.org/linux-iio/aSsBdJZDWcadxEHC@smile.fi.intel.com/
[2] https://lore.kernel.org/linux-iio/248b009e-0401-4531-b9f0-56771e16bdef@baylibre.com/

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
Kurt Borja (6):
      iio: core: Match iio_device_claim_*() return semantics
      iio: core: Match iio_device_claim_*() naming
      iio: core: Add cleanup.h support for iio_device_claim_*()
      iio: light: vcnl4000: Use cleanup.h for IIO locks
      iio: health: max30102: Use cleanup.h for IIO locks
      iio: light: opt4060: Use cleanup.h for IIO locks

 drivers/iio/adc/ade9000.c                          |  4 +-
 .../common/cros_ec_sensors/cros_ec_sensors_core.c  |  7 +--
 drivers/iio/health/max30100.c                      |  4 +-
 drivers/iio/health/max30102.c                      | 24 +++-------
 drivers/iio/industrialio-core.c                    | 34 +++++++++-----
 drivers/iio/light/opt4060.c                        | 52 +++++++---------------
 drivers/iio/light/vcnl4000.c                       | 24 ++++------
 include/linux/iio/iio.h                            | 24 +++++++++-
 8 files changed, 83 insertions(+), 90 deletions(-)
---
base-commit: f9e05791642810a0cf6237d39fafd6fec5e0b4bb
change-id: 20251130-lock-impr-6f22748c15e8

-- 
 ~ Kurt

