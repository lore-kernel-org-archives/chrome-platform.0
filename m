Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B18517BDF
	for <chrome-platform@lists.linux.dev>; Tue, 13 Oct 2026 15:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904539; cv=none; b=mKHlWbedo6dDI4NAdSo5uhcA+N7bVcn8EXNuGaTV3EuFXgkeLSVl5XfG/CMbX3UtiRh5oWlGkCDpakjPOyoAJKWiAd2jc+WYIE5FrYZ5IBgwulRw4VYbEFfek6DstqjHuHiTwX9fw0Ya6YlDuj7b4/l5Opast5kq3y782H/kfJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904539; c=relaxed/simple;
	bh=wOidxVLM17lR1bDj1xmePaeabjfnEZRB6ayeFW+JFtY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eAMXn7G2zyrLVT3LDw3YCydn42SgiXLijEVayjs0Kxibv33tRNJLo03CT0KU5K8d2EKSUvnJr7ZXWreFsmF5FGWq1tp+hhOcUBzJV8sGyaIXsLrXOVZIxa41tRYHO/kOVsvaOHXS9n4ir2hxP7GNMp3nEaTNzGFwfGWdjx3MD4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=wdrxmD6q; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="wdrxmD6q"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso864664eec.0
        for <chrome-platform@lists.linux.dev>; Tue, 13 Oct 2026 08:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1791904537; x=1792509337; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6cn15OBuDdPhmTCMVKwa2oTSO6nmWiZTOYVWRAj9v6k=;
        b=wdrxmD6qDKoOPhFImEjuWazwxp9fPJMBZ5P++saDf98QJgRPsIwWWm8NQx1MXIfBK7
         RTmkogOKjLlHgP/F260KlxRnFTBFr7VlYDM9dY4l8Dv2TQLHyXQQzVy1mV3esm0YW0ZH
         CIhFYPVBj/VUapMve3vG0wwQYbI67ZW7H9fsq02PLmJ8OzHsnP8KYJ1if0dHzX/BxBK1
         zVx8wCGOs6jxNCDBKUXqCsXXdxIzaMehSI1NgL4vdjVI0IJglasyFwXYYdDMTlAPuyJn
         ugz7hH1xCUwyhs3yTKCIc9DPPIjQMtHPZoLcfcbbo7izgRdDbJN7Y5rldF1Jniwh6jbn
         HWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904537; x=1792509337;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6cn15OBuDdPhmTCMVKwa2oTSO6nmWiZTOYVWRAj9v6k=;
        b=abpl+oNcAfRx55ceKZjMl8qvdbYcDw+pyXmsC41yCzP240UTvXbXy2UA8qDbk/5NYO
         1Bpo6eC/EvUjQqdeQskuHcbawFzqcQd3cyyfvJT82FoQ3PTZuZ+q8P/fIB5I5AfRoeJE
         rQHuTkwzuOl0PbfUghchIxNrd1ZOhoQ7BK88fkuYj47hqVeN2cX/tq6Rjj5JtWzM4LiX
         3wU9CmkfNVeDuizd+NcklM0F65xNveuhi5T9PWsnAyhZtPnZKRikN9vAqu5kR4EeEAqY
         BbJdOSyaKpbu4+0b7i1yRybgVhhpyxX+AwBOJdSLiWkzUNJJJuh7y7+siR87EyW2Sz19
         1VNA==
X-Forwarded-Encrypted: i=1; AKwUvBxQPVQBekFSEoHJQKhnM4qqSgb2JvjsYoJ8HK98uguYtnEU4EuP1ChwXiGu4LH9ByV0u610bUBm03+x4KDxpRo=@lists.linux.dev
X-Gm-Message-State: AFq9FYJXerTaWLarqwFGpPXLVCqaK+DU4pcTxWm4KqvXJJhrgZQJ9dGn
	b6MexilDMT5JmMtQg9hc7S/N0losdt5iL8hGKvYJUCys66lbk0Omom74CAGkT5EeWsU=
X-Gm-Gg: AYBFou0NLLs9qG4S1OH5b3JZd7hKmQTILICsz2MFM+Xn6KnMdCiwuke7x75qjStIyKI
	KDIpK7QijuN0/ihTyXuu4vheFrHnNpW+Vs8pSKZWxot27LT7fd57pxfxjc6tEtdeVPASybcKEQH
	ngfrH46sSNYJtK8yU74ESqDGYGF8aGGNaxFM65TuQWOXa3vvYIIiR/Vz8vikCMgwWKFPgCC5hDq
	uJBK9d0Q0Nwrj4udbjibUxsWZOLHRUH7ys/IPoZD22P3jMnJRHYSCVaB8I6ZyUw8xgYCZsvqEl5
	lVE+BqF2InUTvmu6CFMDkQPZnDrqeOJpEyiSouy3JufnHFqD5r1wyQb0o/6jcUE8odRtfrMElaB
	tGGK0c8i11LdErwhFmvEMMgxTbuve8Etko3IoD8TI0TBJ0Qf3B/DBLvLb1Zn3S4Kk6qNCLRs0wv
	JHF9pyr0CywnOT6ufAGPv076veaEtX08wxEzPaTsyZ4bLMA29d9LXOfkZw9kSJQxVAvAqPQARQX
	lmvQhqixgmTDd0=
X-Received: by 2002:a05:693c:4159:20b0:34c:8c69:529d with SMTP id 5a478bee46e88-3537e0a9695mr19398687eec.26.1791904536420;
        Tue, 13 Oct 2026 08:15:36 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:49b8:4c98:b3d1:72aa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358de54fe47sm30691751eec.31.2026.10.13.08.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:15:34 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Subject: [PATCH 0/4] Input: use designated initializers for acpi_device_id
Date: Tue, 13 Oct 2026 16:15:21 +0100
Message-Id: <20261013-acpi-input-v1-0-53ad09ba82b7@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqAIBBA4avErBPUJKKrRIvSqaaFiT8RSHfPa
 vkt3ssQ0BMG6KsMHk8KdNgCUVegt8muyMgUg+SyFVw0bNKOGFmXIpNopDJdq5TgUALncaHrmw3
 j75DmHXV8D3DfD3ssq+ZuAAAA
X-Change-ID: 20261013-acpi-input-2ed24d864410
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Nick Dyer <nick@shmanahar.org>, Hans de Goede <hansg@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791904532; l=3150;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=wOidxVLM17lR1bDj1xmePaeabjfnEZRB6ayeFW+JFtY=;
 b=3nBJ7LuFCwN0BxizqOoBp4bXcaIg1JOxRLLNOjgImEEFpTUGRJj9GgEbTgxtJDNlq8bnneSjj
 d99NFSj62JuCotFSi+uU6I3ZgrlwgwKTTqUE5MdgnHyI2NX9zANx80j
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

This series is converting lists that contain the acpi_device_id struct,
which is defined in the include/linux/device-id/acpi.h to make use of named
initializers (which they do not use currently). This work is part of the on
going effort in the kernel associated with device-ids [1]

The plan is to convert acpi_device_id::driver_data to have an anonymous
union, similarly to what was introduced for PCI and I2C device ID tables.
The goal is to increase type-safety (most of the existing casts are gone),
to improve readability and to make use intent a bit more clear:

```
union {
	kernel_ulong_t driver_data;
	const void *driver_data_ptr;
}
```

But for that to work all lists containing the structs need to use named
initializers first to avoid triggering -Wmissing-braces. I already have
patches that implement this and touching a lot of kernel subsystmes that
use the acpi_device_id struct and that list keeps on growing. Therefore,
I have decided to split the series per every subsystem into:
- pre-clean-ups that convert the lists to use named initializers
  (which is this series)
- actual implementations that make some of the modules use the new
  driver_data_ptr member

That way the task can be fragmented into manageable and independent chunks
of work and makes this effort easier to review.

Tested builds on x86-64 and a64 in Yocto using 7.3-rc7.

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
Pawel Zalewski (4):
      Input: keyboard: use named initializers for acpi_device_id
      Input: misc: use named initializers for acpi_device_id
      Input: mouse: cyapa: use named initializers for acpi_device_id
      Input: touchscreen: use named initializers for acpi_device_id

 drivers/input/keyboard/applespi.c           |  2 +-
 drivers/input/keyboard/cros_ec_keyb.c       |  2 +-
 drivers/input/keyboard/goldfish_events.c    |  4 ++--
 drivers/input/misc/atlas_btns.c             |  4 ++--
 drivers/input/misc/drv260x.c                |  2 +-
 drivers/input/misc/soc_button_array.c       | 12 ++++++------
 drivers/input/mouse/cyapa.c                 |  6 +++---
 drivers/input/touchscreen/atmel_mxt_ts.c    |  4 ++--
 drivers/input/touchscreen/chipone_icn8505.c |  2 +-
 drivers/input/touchscreen/elants_i2c.c      |  8 ++++----
 drivers/input/touchscreen/exc3000.c         |  2 +-
 drivers/input/touchscreen/goodix.c          |  8 ++++----
 drivers/input/touchscreen/hideep.c          |  2 +-
 drivers/input/touchscreen/ilitek_ts_i2c.c   |  4 ++--
 drivers/input/touchscreen/melfas_mip4.c     |  4 ++--
 drivers/input/touchscreen/raydium_i2c_ts.c  |  4 ++--
 drivers/input/touchscreen/silead.c          | 18 +++++++++---------
 drivers/input/touchscreen/surface3_spi.c    |  2 +-
 drivers/input/touchscreen/wdt87xx_i2c.c     |  2 +-
 19 files changed, 46 insertions(+), 46 deletions(-)
---
base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
change-id: 20261013-acpi-input-2ed24d864410

Best regards,
--  
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

