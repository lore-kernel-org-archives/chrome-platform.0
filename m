Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D6C392C39
	for <chrome-platform@lists.linux.dev>; Mon,  4 May 2026 10:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777889340; cv=none; b=UnfZSIOuZT6rbDwPyEJVPYiptPZ/0tGm9uzyx1aKq8k4f3Lf7MxILBXCSXlUMFjteUbluSp9Km2ww/RGLoEZZqlF/51ClVFgrxvA4Xsx25CAXCoJqTQAAbbS+fQGWn8IRO26YJkeAHMcWLxiZa7q0egn32HkJ1TMpGdVrN+rZDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777889340; c=relaxed/simple;
	bh=Cy4wsn1PZK5S/bvm2NwxmGupgmnGnk0WNR3lAlPVFs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z3nMO6qCWuJlNneEelVNR7Q2l6yYFodI1OzU15KWleftJiG2wvrBbiegYDSNSjmHnc0UIf8OL+SizxwXXSQUuwakmVN//E48DEh5MJn7d7zhiQnzgIEi+CK0jenKM46fUjW30KV7BpDKTi08REzKfsZzTe1ojeE4HLj6fL1t6hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rq3V6WZJ; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rq3V6WZJ"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a62f43b76aso3404834e87.3
        for <chrome-platform@lists.linux.dev>; Mon, 04 May 2026 03:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777889333; x=1778494133; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NFXtpfnoiIuj26mCFxMjJStgQUFP3eBujw2rICs2aY=;
        b=Rq3V6WZJlGTNpfV8KRUeaIKdSKN65uAA7HpRMwTkqF4DPyG97bkuANdsYwOPHxjWoz
         EoyRcx+t/QFAXDttYa371CXWxp+Gqf0SY74IMzpSzcrlDi5KR8NsLl+DXAmy+U2gI2Ay
         VYUcEI/Gmirw5TA6QHimfvvOpeOAtaAtCkZMm9KCTV4Jfg/cmX+Z4QB7LwmQ/9Qu8uqe
         JIXOAJC9kH+JDI5zHlqbovV1Xf0HkUXqvjBJjBwa/2Cu/THWbhTtsyNeZo8qgoVC4K6X
         6pxc41bgFNOdBThRZDKvXnuO7TKrCobFncDq6XtKyAnXqpjWGT8qS+3UYTX8UpihTn94
         +ZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777889333; x=1778494133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/NFXtpfnoiIuj26mCFxMjJStgQUFP3eBujw2rICs2aY=;
        b=q0ZsUwxPvcd/2mr4dUvR49Yu2Yw0seeMcSS56SoD4khM15ZpSmsIB1Iyve2lubG26m
         svMmRcuw/L9C+0tLR35X7PBAnfZN1rj2HzSu/eNlsfN+Xi9mqQLCBgEvAqWEIK7DmIbS
         8DLeemNPkedqwYjzfyHdAzLrp50WHemUgE8sp7AJbvf2qreEh4hBaM4ggrOHwRmKftvU
         gUudszAVRzCQyvK4A+j8PhtlcnHQq3WEcj1TnXnqKlak+K+Q7NbJuezNdXQUgqU4+WLx
         vADK5zHnmf2BWsaUliHu14zA7fHBQ28ZtisCiA+g9GWgFOsnsXTIkvknkMqKMVjE9+cb
         sYeQ==
X-Forwarded-Encrypted: i=1; AFNElJ/hbxCZ+jBP8bCtIac0Uwl1Jg9+tFuBOVgrETkJkOt3aC5NZDucXVplCtCVZPMXQzeOYO+CEv15wZMY92Zb0DE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8F75B+HQ4pWoc9TXv4HAIMz/H3z5ccygGZpm0rGzVDmPacJto
	XLeryo16/fxV89b3CTiPXVSkCJTTiXj9WRWtj2z7Ny45Fp3YDeFRfZMV
X-Gm-Gg: AeBDievkknCfvxV5RtASZgjX3hbeCY8WPGwk/2c7Q3jRqBSSm8L27Fx3eVGrCPehk2n
	sQVYkW33EbSCUR5y6h7AoAcwIxVajZ/4h50d5vn8zwHcFQVtK/a9s/k9kuLOxwp/6Qm2GG0v2kU
	zywKS3IW56UpT4pD86/LuUDD5qhOyeHErZNmiugMbtgXhsdl5AClVorQsWR7TPDA7mnrmJy3eCU
	gM6rbr4Ds6zTpt/jUF9NGEc3VSwEwMomw8Qyh0jZFEKaLlEHUq9AzeD2sJ3/jZcnD/8i4odvP71
	EhR3dL81mAyVAIvLY16w4XpZjEKg8BHb0WCY8Ok1ngQM7blEF5N19X35wi+NjJzvJD/gu1J0Bpy
	JZI039TUo2xZSmOlru5iHb9TYLelFvBqvB5/HBVyU3NUrCdgIT3kHOU7UfrmWyn/EQoP7J/akFZ
	hEsf1MSmtQQaIDI4+axCKqyBT7VvnJeHASnLqrxqsg7iKB3fNyHnyCH/1RCdjq/6AD3nRRNKiIS
	KssXwCigA==
X-Received: by 2002:a05:6512:31cf:b0:5a2:bf50:763d with SMTP id 2adb3069b0e04-5a8631c8222mr3274301e87.38.1777889332874;
        Mon, 04 May 2026 03:08:52 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a86645ae7csm1979099e87.79.2026.05.04.03.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:08:52 -0700 (PDT)
From: Vastargazing <vebohr@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Vastargazing <vebohr@gmail.com>,
	stable@vger.kernel.org,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Gwendal Grignou <gwendal@chromium.org>,
	Thierry Escande <thierry.escande@collabora.com>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	chrome-platform@lists.linux.dev
Subject: [PATCH 2/5] platform/chrome: cros_ec_lpc: fix reference leak on failed device registration
Date: Mon,  4 May 2026 13:08:44 +0300
Message-ID: <990a6407ff9b143bde6ea2bd8b32e9346ab756c1.1777889235.git.vebohr@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1777889235.git.vebohr@gmail.com>
References: <cover.1777889235.git.vebohr@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When platform_device_register() fails in cros_ec_lpc_init(), the embedded
struct device has already been initialized by device_initialize() inside
platform_device_register(). The error path unregisters the driver but
returns without dropping the device reference:

  cros_ec_lpc_init()
    -> platform_device_register(&cros_ec_lpc_device)
       -> device_initialize(&cros_ec_lpc_device.dev)   /* kref = 1 */
       -> platform_device_add(&cros_ec_lpc_device)     /* fails */
    <- platform_driver_unregister() called, but kref still 1

Per platform_device_register() kernel-doc:

  NOTE: _Never_ directly free @pdev after calling this function, even if
  it returned an error! Always use platform_device_put() to give up the
  reference initialised in this function instead.

Fix this by calling platform_device_put() before unregistering the driver.

Fixes: 5f454bdf6353 ("platform/chrome: cros_ec_lpc: Register the driver if ACPI entry is missing.")
Cc: stable@vger.kernel.org
Assisted-by: GitHub Copilot (Claude Sonnet 4.5)
Signed-off-by: Vastargazing <vebohr@gmail.com>
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
2.51.0

