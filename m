Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3774C367F3C
	for <chrome-platform@lists.linux.dev>; Wed, 15 Apr 2026 17:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776275843; cv=none; b=maiRbpFp2uNiUNC9orEmMHacp0ZsI2QQTsEGejQMD+MjxMrYocgrtwQlI4K5+KYEn++0AmjxuhnQKjpqtb1kH6yqLCwXXq0dRWp+dJAxiJYrEJMke4AMAWPjhaeuzeEkMTRSuqWX19Pt+0GYxectf0PqYUM5INmhBfWN5H65XxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776275843; c=relaxed/simple;
	bh=zYEZtG3CNWlhxk5TCgfhLdH0TQVOB7keHngYJTHByUw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TLV17hMh/3X5j6mVgivPQjD8zXo/LGdNeTESuvRENES1WnmUn33iY0KNtN4QVyYe42N9IU0up1UK3vsUGCLzEggbn+zAs26edGY9eGTpXozsbvuhQUsx0mygfnN0dWvZHOjUMtgd8EspmyYAAkTv4krev2GxP4LrLS6P6crD53c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iEK7Iqhy; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iEK7Iqhy"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-35fb16e56efso2597658a91.2
        for <chrome-platform@lists.linux.dev>; Wed, 15 Apr 2026 10:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776275841; x=1776880641; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LVK8DHikQoX7A6e7OIrQHyMcwBuwukNQmr1sdoA8uRw=;
        b=iEK7IqhypfqNljEsfHsUzUzMz3Z+a9DXiMqbxM7k9yCuR43FsS3bkIF3rd3vmjyrXZ
         SSGuOj+zEI5tB8+j5c34qlEKYbDMlX39ld4RtlC5n5hajzCWBj3hzQnaOrBgntURTFJM
         5C4SCO/w55c1B6wYSx1B2HAs+P9YT/GuyZILH9jDVHLghkrEUn0f8hVIxlJiItGOB9pi
         XBGgioaI/Lz81G2bSg5/Ao1Vd/uqW4I1P8+uIvs6VrAWhs3GWTvjxRaf1nyTCqjpO0mL
         1gSah3cqrMS0nt4zmX+3+FOj2s9swB7YvUloOckgc0O1UXTDaZVUbp2pNPxGecIMDbHy
         pXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776275841; x=1776880641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVK8DHikQoX7A6e7OIrQHyMcwBuwukNQmr1sdoA8uRw=;
        b=f4pI3HX8BbTPNwq9SQ6QYavuahQKIiRJOgrGc7zxoCJX/dZ0NcLCS8ZVy+Tgz9VETh
         EWMd7ldPcAHSIC3aNMYNrPzxXjoLaxzAWH0mTV1OQIah4YiIhuHPPpHhNEs+QsMUu2WE
         dyWUkjEJ6QUwgOYTe0t8/MtJkH84zMi954kpSydHFC9MHjdVVl5IJSznBHHowgpuTACh
         0XmvTI1aECdi5fd52ywdqtn+zFs35vS1rpzEz0INTMykvYrIKh057mM7lco4P5mBej/D
         7k/tFvlChCq2pCv+jkXBeawnfgs4qCVjOpv2Rv3bffX3LTKv0sRA5aIBo8qIUiOk+wSW
         Jw8g==
X-Forwarded-Encrypted: i=1; AFNElJ/zb8SVl1dt5C/Xsmc8PRSm46UOMqy8T+z9nJzeBgkD/J5hNf+dlR9vhPcZnfHZdysMrIId4aHruiyQGzuXgnA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLisez75Ua7f3qwyw4TEEkIVM/oGXLTkyD/l3vnW3kI4zs75nz
	480RHRlgP3Ig92kk40dx9L5S7ZlqFTb9M6IDYSgE2L6IOnOUUuY6Chob
X-Gm-Gg: AeBDietTqjsuhuBeY27GEwMbyurmJI6GUl6R3ciGqB4BfpWFwn2NNvtfBHCvRMuHFIH
	BCtDgk3al2AomKLQgJ21VNmSsnkRj2uVKIR884oibbBiLtPjMq9PnJLrcP93MzvvxP8AMTb1G8Z
	6ySG2EbBjwQdW0VjuEbU7RQPvXlrTI0sgUDIeIfueqn3c/nQcU1DyO6764c9X9Dif4STPKXnMfh
	8Di58vEtcXO99TyZhmp33VhTV3sUazxHE0TkxN/QnMwr4+SDQVWfu7ifBnq/vuKtC2gT3MUDbn+
	UTSiXDlUVpxHesyQtdpL+eY4ncVtAXQeXQdFFfr6TND5lyrbFnlSn3i7UZ8rG8/29GtrfZbAeoG
	14QVvuTLCyyk5jJR0rb/ys2wXoulWrNDFx4pTUwFXGvSR/yauMl9wykYsm90Vjkqq+vSbBOj9+g
	8+bLs9iAWber+m1WkFo20m7L+GyvQkOqD8vuObzw4YkuYpfI8=
X-Received: by 2002:a17:90b:4b46:b0:35f:b3fe:18e9 with SMTP id 98e67ed59e1d1-35fb3fe1caamr14818307a91.16.1776275841534;
        Wed, 15 Apr 2026 10:57:21 -0700 (PDT)
Received: from lgs.. ([2409:893d:1171:10e2:48dd:8f21:beaa:cec8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b4782cf2aesm29261815ad.83.2026.04.15.10.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 10:57:21 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Thierry Escande <thierry.escande@collabora.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] platform/chrome: cros_ec_lpc: fix reference leak on failed device registration
Date: Thu, 16 Apr 2026 01:57:07 +0800
Message-ID: <20260415175707.3640225-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When platform_device_register() fails in cros_ec_lpc_init(), the
embedded struct device in cros_ec_lpc_device has already been
initialized by device_initialize(), but the failure path only reports
the error and unregisters the platform driver without dropping the
device reference for the current platform device:

  cros_ec_lpc_init()
    -> platform_device_register(&cros_ec_lpc_device)
       -> device_initialize(&cros_ec_lpc_device.dev)
       -> setup_pdev_dma_masks(&cros_ec_lpc_device)
       -> platform_device_add(&cros_ec_lpc_device)

This leads to a reference leak when platform_device_register() fails.
Fix this by calling platform_device_put() before unregistering the
platform driver.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: 5f454bdf63536 ("platform/chrome: cros_ec_lpc: Register the driver if ACPI entry is missing.")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/platform/chrome/cros_ec_lpc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 78cfff80cdea..cb3ff76d29e9 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -892,6 +892,7 @@ static int __init cros_ec_lpc_init(void)
 		ret = platform_device_register(&cros_ec_lpc_device);
 		if (ret) {
 			pr_err(DRV_NAME ": can't register device: %d\n", ret);
+			platform_device_put(&cros_ec_lpc_device);
 			platform_driver_unregister(&cros_ec_lpc_driver);
 		}
 	}
-- 
2.43.0

