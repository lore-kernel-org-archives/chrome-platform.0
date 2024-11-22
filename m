Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE46B2582
	for <chrome-platform@lists.linux.dev>; Fri, 22 Nov 2024 03:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732247256; cv=none; b=dttr3XPUyl+a0GWby/q7qDKkH3SdbQ+YPvpxiDRgzFpdYeVc2Krmc5spLWooX50lXAWxojC8hzSLzEI82Za5B1SHN0fyKePe778TLAyBIgN6n/OguiVAIPdTgKuEIjSstvxAWy/1sc2BbA6jUqb+Xcubz0WqEBvbGS+YiMtvC9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732247256; c=relaxed/simple;
	bh=9PRuTzDBqQfJQDriZ1LwQnsJ3pxswr44u/jT5UYum2w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qpcPjiB/hHcui58d9p3o8XsB+f2oljYfcYVVUfxnoGugicDs+g4RKOHxhJQCqq2IHEip7jM8Wz+gi8zEeZ3WK60R+Zxz3i5RT2TedKV2ZPADrQHvXk19JjbMFbbBgYrKlXLVbxIP6Ayio4aO944fZIBvNE+7D5/qo+i77LG7Nn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Azv1qkuo; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Azv1qkuo"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-212884028a3so9599495ad.0
        for <chrome-platform@lists.linux.dev>; Thu, 21 Nov 2024 19:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732247254; x=1732852054; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OUPLabeEhsTuPB6N8IV/JgXFnjKZTiSfXFCFhiuDbdQ=;
        b=Azv1qkuocEBnrkRpSrfs4JXBwtRnQ50IgIVNaX5wZDy7H5ALlL6Rwn9aki+5ZljnDC
         1ynwJijkDzUmRiihSbg70s/l8OXwGtP8kMQmiROgS19LOqQlUP6qTsncMGlHYM5QCnZk
         a2h3oDSrGkleJ4Bfnel86qxI1VO3I9/5UBr88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732247254; x=1732852054;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OUPLabeEhsTuPB6N8IV/JgXFnjKZTiSfXFCFhiuDbdQ=;
        b=X/HqSJBm6vu+CNQLPM1wLxyqfmKlmaZMfiAAce0NYx1XTD0yQVAmwE20wYHahS/QQ8
         yM48LK+tDULJXrnJ1dnhddJQlDnO+tBY4VDt1Y9DZdSLpC/oFr750UkoNXKKQUMyRB0s
         jd56NdBuuiyDytjE1/iRUUd517td+wfM7/MoDqc7JX+e1pUARa5pFb9gSKnk/RScYWGd
         5ddvCNjh+ii1UF9S1KQ5QMOYDCBuvSjTjvUra/nXyDLHuosr8kDCOUXGOqoljBYhrfls
         ylNx6WaINM1WbH0uHw94Mar+/iayBsANCo+jtd55+9Y0/ddxgzj0zuM5fwLZZzP8XbKX
         /c6Q==
X-Gm-Message-State: AOJu0YyANqzqeb+Bp8dNknTLB7mvT93sdVBaXd9CissRzEnSWuEWHqX3
	s/D4rFURCpoJd9I8O7YMxAa+PKodiEtEAeKqkbGIgaH3rhAoK4XFL2g/CY08Ow==
X-Gm-Gg: ASbGncvplKZf/jAbbQHiSDHe+3lp7MchCamrHaBBwsJm4K4DZ6jIvmB6Rbm4E04koAT
	AERPmfudv+RqJU50974Te6KqQNMHbK1SY0E7YO5kyIiat9BGGox18CdYBtxKYcuoctL1+Ws/7vB
	RcU0D/xihvWWWQS11pNhbNG8hk009FnbXL9vI2zfTJaRaCjxIjd90Ol0iKwplcJW+aB3MwO5MbE
	AFh/PloUCwBnK9w+aLvpmOgYi0a7rmgsPMMEG8rVDOXyCeyUqtBGj5yP3pLY7Me+hrqjS8=
X-Google-Smtp-Source: AGHT+IHiALVToYKglGv8HQ4w/4rsnqINW3YG6Y1GRh2tGW268TcBGb5mBkzYGC/fBrRZJ1hQiu3nXA==
X-Received: by 2002:a17:902:e845:b0:20c:e169:eb7b with SMTP id d9443c01a7336-21283c7d68cmr91453535ad.14.1732247254165;
        Thu, 21 Nov 2024 19:47:34 -0800 (PST)
Received: from lschyi-p920.tpe.corp.google.com ([2401:fa00:1:10:533e:26bf:b63:973a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de554b11sm550174b3a.133.2024.11.21.19.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 19:47:33 -0800 (PST)
From: Sung-Chi Li <lschyi@chromium.org>
Subject: [PATCH 0/2] Extend the cros_usbpd-charger to make it a passive
 thermal cooling device
Date: Fri, 22 Nov 2024 11:47:20 +0800
Message-Id: <20241122-extend_power_limit-v1-0-a3ecd87afa76@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMj+P2cC/x3MQQqAIBBA0avErBNyiKKuEhGmYw2UhUoJ0d2Tl
 m/x/wOBPFOAvnjA08WBD5chywL0qtxCgk02YIW1lIiCUiRnpvO4yU8b7xxFgxpNp9RsVQs5PD1
 ZTv90GN/3A9AOCHBkAAAA
To: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: chrome-platform@lists.linux.dev, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sung-Chi Li <lschyi@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732247251; l=964;
 i=lschyi@chromium.org; s=20241113; h=from:subject:message-id;
 bh=9PRuTzDBqQfJQDriZ1LwQnsJ3pxswr44u/jT5UYum2w=;
 b=Zc1RWAqzt3jVrYqd5ASn9V+gjaIAcZeOGISABX0Ac99Xxsn8I3BztCE6a22BtmSCbL3aekvws
 faN/RYixLo6Dxfe7unI1ySbUZo5kTdF4qousRqILdTYvWR2gEqJJnw3
X-Developer-Key: i=lschyi@chromium.org; a=ed25519;
 pk=nE3PJlqSK35GdWfB4oVLOwi4njfaUZRhM66HGos9P6o=

The cros_usbpd-charger already supports limiting input current, so we
can easily extend it as a passive thermal cooling device. By limiting
the current flow into the system, we can reduce the heat generated by
related chips, which results in reserving more thermal budget for the
system.

This series will only works on making it a OF style thermal cooling
device, so related code are guarded by #ifdef macros.

---
Sung-Chi Li (2):
      power: supply: cros_usbpd-charger: extend as a thermal of cooling device
      dt-bindings: mfd: cros-ec: add properties for thermal cooling cells

 .../devicetree/bindings/mfd/google,cros-ec.yaml    |  3 +
 drivers/power/supply/cros_usbpd-charger.c          | 98 ++++++++++++++++++++--
 2 files changed, 96 insertions(+), 5 deletions(-)
---
base-commit: ac24e26aa08fe026804f678599f805eb13374a5d
change-id: 20241122-extend_power_limit-62c2d9aabfa7

Best regards,
-- 
Sung-Chi Li <lschyi@chromium.org>

