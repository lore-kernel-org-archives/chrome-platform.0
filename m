Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037B01F4611
	for <chrome-platform@lists.linux.dev>; Mon, 25 May 2026 01:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779673188; cv=none; b=orOknm2Hi05mNmGkCgM24LWCQaBWbi6Kh7aM2tUYhGgwqDv7EarxdBi9PZjJvuDLEK7NEV+uBFGIp7eIaGVoFNgiIceGtHHpyEnUTJ4odG6TgiiSyAMu83yRXCPpyyg0005r/V79dLZojBh7FfIu0Wx5C3Jnw1Dogc2/T9s8yXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779673188; c=relaxed/simple;
	bh=SuM+0HC7hGWwJTXikbJW5wAJ2RsorksevrifGcg2M1E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kDGlT1aXg0wFJJYdD9iiVOKTJW12ry3v2f2xFyyI0XXij1wfK/ae/NTRyveeNMofo+egUWpwDWuvrpi1MMKal8/SWKWk1HCB04evMYzaTcFGau2dxMEkQPotzN2l1e7O3G4+KGkxF+3SZm+FQSlJBCVAojdWkPGzJz51DaYtg58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=enUe4yOv; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="enUe4yOv"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4854d5cc708so2091900b6e.2
        for <chrome-platform@lists.linux.dev>; Sun, 24 May 2026 18:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779673185; x=1780277985; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ugzb2uhvCgbHvggVe5Xy5Mt/HBvzlMq1ELLD59c9p5s=;
        b=enUe4yOvPzf4Q8I2vK+aZtrOuyup8e44ixuq6EX6qq5SppJaDeMo6ReTa398wXasG3
         J86kL6HRtFTMt+x2aUMb4q+JC+TkhrqrOY3sZp5+QqKdqrZCz6SQ0JwcM3oO/bU2mWku
         eONFRI9KUIncNJJZjHmrm/6aC9iIUCYQxEVqPnVGJ9O0FRtGxcgL9islOKtt0MA0BSsP
         9X6XQA6tkUQHeD8TTQnKSNkw69wuQrurD1bVeyaCkFdBkC5jY4M7EYFnP8B66sk+d53R
         7awEKth1oWgGdY5/yrkOchf09CXG6PI5vWaDb0DOg1gSU0+Lv5qso6UsV6lqa3BYao2Q
         DgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779673185; x=1780277985;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ugzb2uhvCgbHvggVe5Xy5Mt/HBvzlMq1ELLD59c9p5s=;
        b=gNa0Bq74Mcimi4EJDQkowFA31wchpF7HFOPiEFdKurLlTS8219V7z9PK4I8Fhfxa7M
         VWLgM4n/h5JGadCiLVPE13KKYurbr58CRL0NiY1VZ3dAnMjntG9nY4A3OPO7FX86KBSe
         Y9sWc52WJ35oVOcACseTvvnqn8Z1ORiUE1EiajxedvACh7QJ9XNbu7XiWqQbumq0gZh3
         Bcm4hNUYQLVEE9xVkb44srnNUeCgDg5Js3iYizKOaLdOthRsREufXI2Z4vG0EFgDNBK8
         B+mHorv89D3pwjB2OaLjsfGMNjsbBaQ6j3Ijounc/8Z29YdjZZUgRVJpwKtEiyzfZMWQ
         ox0w==
X-Forwarded-Encrypted: i=1; AFNElJ/pPK8wPqDcmQkZ32x+cKuVpCjHvE3pWNCD8bzpFnvljgwMhFuaHesuNE+jNZJOEbrWteJAFyOoJEqRhegtWb4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzKo6nLbRCvJ5MvwdZC2D6m9GGakC8EaMbctriCHhdk62nCTS9l
	HlD6eRnKb4Ba5h2iM+3ApOYkHh6SpwFjvct8IkOS/+bncb5J4P0+aRd0KMuQvLHtnNQ=
X-Gm-Gg: Acq92OHTrwhH9vj5A6wx0nMfbWRwja7HTYA2ac+/Z6SN1bJwJxadYac7fjZ1wn3IC/z
	rh0QzWUB7kT6XzYNuX5k6xrNCYV9zs1zeVzr0QGjKi4+7HyDx0hi7f4Eg+TPrqqcESjfCPmcDT7
	aW6cwwCU1f89q1PMfrepVb5gYEwbYXBZO72fpW+P1ZZuLN7A3YsbkPONTmtX6jfApUPStwODNJW
	AwscpigWaxc589S5tpV46u0eUycaKQ1tauKkoOLMkZ+3yW3tbWGcg6oYVP4V/9w/1FAY93TEeSH
	FdA6pI+e7A7VSaxe9yIjnrqc28aq+6bj5LgJFSJ1qzepOqKfhsRMmFQuQchiCNl4aBxsEkE7WUv
	YG71sHtRadf6xT8Fo72QC8c6/26zfRDvPbwgOABSlYU5WeSxaln5M67uYlwfVOvD2B1Ve00TCbn
	STWPQYt+fqHjwLYjNLT8poMAfS/fSRAcFts9a4HCM=
X-Received: by 2002:a05:6808:6d91:b0:482:6617:d48c with SMTP id 5614622812f47-4854a3fa3ecmr7151437b6e.25.1779673184828;
        Sun, 24 May 2026 18:39:44 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:713b:3006:84c3:c1bb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6060b2dffsm6250206a34.0.2026.05.24.18.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 18:39:44 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH v2 0/9] iio: timestamp declaration cleanup
Date: Sun, 24 May 2026 20:38:32 -0500
Message-Id: <20260524-iio-timestamp-cleanup-v2-0-c37c9408b7f7@baylibre.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7ZhOEwFdeQ/Doq2DjAFK2kIkh
 LsLeACXL3n//QUiB+EIt2yBwJNE8f0G+pSBa0z/YpTnxqCVztWFChTxmKTjmEw3oGvZ9OOAxFz
 qWpVkCgXbdghcy+foPqofx9G+2aU9thuNxOTDfBxPtHv/PiZChTnV9qpKR+SKuzVzKzbw2fkOq
 nVdvxzXaOTPAAAA
X-Change-ID: 20260517-iio-timestamp-cleanup-1ee82f081a70
To: Jyoti Bhayana <jbhayana@google.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, 
 David Lechner <dlechner@baylibre.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2400; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=SuM+0HC7hGWwJTXikbJW5wAJ2RsorksevrifGcg2M1E=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqE6gdwg4bNuqtGlue/M8kGDelpLpEt8ocyZess
 h3XIm/Xy7KJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCahOoHQAKCRDCzCAB/wGP
 wCjwB/0d574jaJgFsVylSeUV+cUbUscg33m5FcKKHwaNx155nm1c9St0Sx1qnegu8MScNk7qlwA
 IZrN6rt/OLuCilqv0tZ+d1G6OCOddqTXnSLNEqVwi2QcSqspOnK3p8s4LEmU2hfDTma2HoLK07a
 8uSQMkAKzKpihnbPSkv3DYVtXrwxkJS+s07b+b5m6RHgvNbI9hkAvvuSQ7yMGTv4bIiqSAjKf3W
 qEkUeE59f1oEoAAMCxzXop6HfJqY98nUdiw/+3H4Fiyw4fLZjpNQio3yNnqF29RH6WhY9cmozex
 MpuyplJC3Mf1xx9foHj3P6/L2IeIXEPXOysM7TmEc4r56XXQ
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

While looking around the code, I noticed that there are a lot of places
were we are manually filling all of the fields of an IIO timestamp.

This is error-prone (as seen in the first patch) and more verbose than
it needs to be.

Thanks to Andy's patch, we can just make the macro a compound literal
so it can be used directly in assignments and initializers.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
Changes in v2:
- Include Andy's compound literal patch.
- Drop explicity compound literal in later patches.
- Link to v1: https://patch.msgid.link/20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com

---
Andy Shevchenko (1):
      iio: Convert IIO_CHAN_SOFT_TIMESTAMP() to be compound literal

David Lechner (8):
      iio: common: scmi_sensors: simplify timestamp channel definition
      iio: adc: dln2-adc: simplify timestamp channel definition
      iio: adc: at91_adc: simplify timestamp channel definition
      iio: adc: cc10001_adc: simplify timestamp channel definition
      iio: adc: stm32-adc: simplify timestamp channel definition
      iio: common: cros_ec_sensors: simplify timestamp channel definition
      iio: light: cros_ec_light_prox: simplify timestamp channel definition
      iio: pressure: cros_ec_baro: simplify timestamp channel definition

 drivers/iio/adc/ad7606.c                              |  2 +-
 drivers/iio/adc/at91_adc.c                            | 12 +++---------
 drivers/iio/adc/cc10001_adc.c                         | 10 ++--------
 drivers/iio/adc/dln2-adc.c                            | 12 +-----------
 drivers/iio/adc/max11410.c                            |  2 +-
 drivers/iio/adc/stm32-adc.c                           | 10 +---------
 drivers/iio/common/cros_ec_sensors/cros_ec_activity.c |  8 +-------
 drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c  |  8 +-------
 drivers/iio/common/scmi_sensors/scmi_iio.c            | 13 +------------
 drivers/iio/light/cros_ec_light_prox.c                |  8 +-------
 drivers/iio/pressure/cros_ec_baro.c                   |  8 +-------
 include/linux/iio/iio.h                               |  6 +++---
 12 files changed, 17 insertions(+), 82 deletions(-)
---
base-commit: e1a29334a9c043defe7a9363fa76d399d3fdfbec
change-id: 20260517-iio-timestamp-cleanup-1ee82f081a70

Best regards,
--  
David Lechner <dlechner@baylibre.com>

