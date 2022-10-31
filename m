Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D97360
	for <chrome-platform@lists.linux.dev>; Mon, 31 Oct 2022 05:07:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 935F0C433D6;
	Mon, 31 Oct 2022 05:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667192830;
	bh=g4+ZlptgHZ4VlrsvMEreg6U7v0q+Eafj4ie2PanIveA=;
	h=From:To:Cc:Subject:Date:From;
	b=HI3s7d/eGhEzDFpWj/KkJLWPdWDpJWPJMktMcfOyTM60n0KBFTNZa+CaSq+FR//FC
	 +bmD4pySvCSvWJf3EELcVJ+tqHHJOeIs77lHU6KvJPluXXu/5q6wP9CYByLUcG8Y70
	 uk4gNn0UK34rV8pMTUWFsnPMxPxtighAGHomjD5ud15JVQ5vLv4JKjd/dF9Pb5fM81
	 jWXlRBR9n1SOI3yY8iOl3brV3ddLYilFpKD+bF4b9v3OTz4eIXGgI9OuvIILzOdLlf
	 wGodQERpbwtdtHRvyu/NG1cdU0KeE2BFWabHFwDYSLcnv/u1bl+TrlIZVK5D9zt4Jt
	 BD5LZZWVtJKsw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	briannorris@chromium.org,
	tzungbi@kernel.org
Subject: [PATCH] platform/chrome: cros_ec_lpc_mec: remove cros_ec_lpc_mec_destroy()
Date: Mon, 31 Oct 2022 13:06:57 +0800
Message-Id: <20221031050657.3899359-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.38.1.273.g43a17bfeac-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's pointless (and invalid) to destroy a statically allocated mutex in
cros_ec_lpc_mec_destroy().

Let's remove it.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
A follow up from https://patchwork.kernel.org/project/chrome-platform/patch/20221028141411.1.I0728421299079b104710c202d5d7095b2674fd8c@changeid/.

 drivers/platform/chrome/cros_ec_lpc.c     | 3 ---
 drivers/platform/chrome/cros_ec_lpc_mec.c | 6 ------
 drivers/platform/chrome/cros_ec_lpc_mec.h | 7 -------
 drivers/platform/chrome/wilco_ec/core.c   | 5 -----
 4 files changed, 21 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 7677ab3c0ead..6ef5e5d40ba4 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -593,7 +593,6 @@ static int __init cros_ec_lpc_init(void)
 	ret = platform_driver_register(&cros_ec_lpc_driver);
 	if (ret) {
 		pr_err(DRV_NAME ": can't register driver: %d\n", ret);
-		cros_ec_lpc_mec_destroy();
 		return ret;
 	}
 
@@ -603,7 +602,6 @@ static int __init cros_ec_lpc_init(void)
 		if (ret) {
 			pr_err(DRV_NAME ": can't register device: %d\n", ret);
 			platform_driver_unregister(&cros_ec_lpc_driver);
-			cros_ec_lpc_mec_destroy();
 		}
 	}
 
@@ -615,7 +613,6 @@ static void __exit cros_ec_lpc_exit(void)
 	if (!cros_ec_lpc_acpi_device_found)
 		platform_device_unregister(&cros_ec_lpc_device);
 	platform_driver_unregister(&cros_ec_lpc_driver);
-	cros_ec_lpc_mec_destroy();
 }
 
 module_init(cros_ec_lpc_init);
diff --git a/drivers/platform/chrome/cros_ec_lpc_mec.c b/drivers/platform/chrome/cros_ec_lpc_mec.c
index bbc2884f5e2f..0d9c79b270ce 100644
--- a/drivers/platform/chrome/cros_ec_lpc_mec.c
+++ b/drivers/platform/chrome/cros_ec_lpc_mec.c
@@ -146,9 +146,3 @@ void cros_ec_lpc_mec_init(unsigned int base, unsigned int end)
 	mec_emi_end = end;
 }
 EXPORT_SYMBOL(cros_ec_lpc_mec_init);
-
-void cros_ec_lpc_mec_destroy(void)
-{
-	mutex_destroy(&io_mutex);
-}
-EXPORT_SYMBOL(cros_ec_lpc_mec_destroy);
diff --git a/drivers/platform/chrome/cros_ec_lpc_mec.h b/drivers/platform/chrome/cros_ec_lpc_mec.h
index aa1018f6b0f2..9d0521b23e8a 100644
--- a/drivers/platform/chrome/cros_ec_lpc_mec.h
+++ b/drivers/platform/chrome/cros_ec_lpc_mec.h
@@ -45,13 +45,6 @@ enum cros_ec_lpc_mec_io_type {
  */
 void cros_ec_lpc_mec_init(unsigned int base, unsigned int end);
 
-/*
- * cros_ec_lpc_mec_destroy
- *
- * Cleanup MEC I/O.
- */
-void cros_ec_lpc_mec_destroy(void);
-
 /**
  * cros_ec_lpc_mec_in_range() - Determine if addresses are in MEC EMI range.
  *
diff --git a/drivers/platform/chrome/wilco_ec/core.c b/drivers/platform/chrome/wilco_ec/core.c
index 5b42992bff38..d6a994bdc182 100644
--- a/drivers/platform/chrome/wilco_ec/core.c
+++ b/drivers/platform/chrome/wilco_ec/core.c
@@ -129,7 +129,6 @@ static int wilco_ec_probe(struct platform_device *pdev)
 unregister_debugfs:
 	if (ec->debugfs_pdev)
 		platform_device_unregister(ec->debugfs_pdev);
-	cros_ec_lpc_mec_destroy();
 	return ret;
 }
 
@@ -143,10 +142,6 @@ static int wilco_ec_remove(struct platform_device *pdev)
 	platform_device_unregister(ec->rtc_pdev);
 	if (ec->debugfs_pdev)
 		platform_device_unregister(ec->debugfs_pdev);
-
-	/* Teardown cros_ec interface */
-	cros_ec_lpc_mec_destroy();
-
 	return 0;
 }
 
-- 
2.38.1.273.g43a17bfeac-goog

