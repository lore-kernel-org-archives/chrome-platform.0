Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F14A122AC
	for <chrome-platform@lists.linux.dev>; Fri, 28 Oct 2022 21:14:54 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id f140so5827935pfa.1
        for <chrome-platform@lists.linux.dev>; Fri, 28 Oct 2022 14:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M+RiQTpwuN97JRf0F9V4tVIm2v8ZxHlLZa7P/ilnDGY=;
        b=Yj9XXzuUNOrCtA5zzryZJ10G9E2xQzsOg4wGDQ7XvEREUd7J5u5VTSx/QNQIdwbo24
         Q594O7/zX76xEh9Gc0iNGrU4TqZtcazJZ2+Pt0GrlTPqOU1rG0zSAjw8Ls7Qt1TBcVFR
         Wjei+HXIwy07bZT+qPsUiKi1PlGLFN8O2EUOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M+RiQTpwuN97JRf0F9V4tVIm2v8ZxHlLZa7P/ilnDGY=;
        b=ZkZoC5qFlHtzm+aKDqVE7iEll2bbSxSkr6g2OcMCjs1vH9AuYKoNhahZ1GlOulSUBM
         3Gu7dhyuGIemfI7CFK2iuPbR514nQacf/RCQU96CB8Wp8Zdyrusy5+hmPGZ4FCmsCKAb
         KgIPi4bjQqutGmCQ7s2Wmp1xS2iaq3/TM4jgZOzx978nDISFTrGfqUTiPFWjLa18gLEj
         N14+7bgtcxldVtFJM+QkuDCOk2Vbtl2eM1+jshhUJT7thqu4rkVhrKKANTNuQNDqxX9G
         RrYe1iNmD/s8Hh6uOwlDGZHMayibaTeFN32lD4LuXZ9Wl1Ym+jgb2VkX/275xlkFwaxz
         bZjg==
X-Gm-Message-State: ACrzQf3thzteNeuo21Abg0/a6+erR2Dw82j0zF1uQGbx2aw6mC12Mciq
	AS3A56JnQMHtmsie1CRyAZieJw==
X-Google-Smtp-Source: AMsMyM5dm4sViGbezswQdxIY0IxcARdKyR1X9ojMOI/nshFvgxzed7XYfToVM/XmU7i9nWrlmuElEQ==
X-Received: by 2002:a63:6f8a:0:b0:439:36bc:89f9 with SMTP id k132-20020a636f8a000000b0043936bc89f9mr1288835pgc.100.1666991694115;
        Fri, 28 Oct 2022 14:14:54 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:65f9:c180:249c:190f])
        by smtp.gmail.com with UTF8SMTPSA id e11-20020a170902784b00b001730a1af0fbsm3488563pln.23.2022.10.28.14.14.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 14:14:53 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 1/5] platform/chrome: cros_ec_lpc: Move mec_init/destroy to device probe/remove
Date: Fri, 28 Oct 2022 14:14:45 -0700
Message-Id: <20221028141411.1.I0728421299079b104710c202d5d7095b2674fd8c@changeid>
X-Mailer: git-send-email 2.38.1.273.g43a17bfeac-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Disregarding the weird global state hiding in this cros_ec_lpc_mec_*()
stuff, it belongs in device probe/remove. We shouldn't assume we can
access hardware resources when the device isn't attached to the driver.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/platform/chrome/cros_ec_lpc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 7677ab3c0ead..0b6c7c912ec7 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -354,6 +354,9 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 		return -EBUSY;
 	}
 
+	cros_ec_lpc_mec_init(EC_HOST_CMD_REGION0,
+			     EC_LPC_ADDR_MEMMAP + EC_MEMMAP_SIZE);
+
 	/*
 	 * Read the mapped ID twice, the first one is assuming the
 	 * EC is a Microchip Embedded Controller (MEC) variant, if the
@@ -456,6 +459,8 @@ static int cros_ec_lpc_remove(struct platform_device *pdev)
 
 	cros_ec_unregister(ec_dev);
 
+	cros_ec_lpc_mec_destroy();
+
 	return 0;
 }
 
@@ -586,9 +591,6 @@ static int __init cros_ec_lpc_init(void)
 		return -ENODEV;
 	}
 
-	cros_ec_lpc_mec_init(EC_HOST_CMD_REGION0,
-			     EC_LPC_ADDR_MEMMAP + EC_MEMMAP_SIZE);
-
 	/* Register the driver */
 	ret = platform_driver_register(&cros_ec_lpc_driver);
 	if (ret) {
@@ -615,7 +617,6 @@ static void __exit cros_ec_lpc_exit(void)
 	if (!cros_ec_lpc_acpi_device_found)
 		platform_device_unregister(&cros_ec_lpc_device);
 	platform_driver_unregister(&cros_ec_lpc_driver);
-	cros_ec_lpc_mec_destroy();
 }
 
 module_init(cros_ec_lpc_init);
-- 
2.38.1.273.g43a17bfeac-goog

