Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4341B62B
	for <chrome-platform@lists.linux.dev>; Wed,  8 Mar 2023 03:13:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41E2BC433EF;
	Wed,  8 Mar 2023 03:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678245180;
	bh=YRujz2XTRtxSclCtWQUb7eS1y7RV6DbJrRvWi4MHMsE=;
	h=From:To:Cc:Subject:Date:From;
	b=EW1g7WriA6+7X9LvCLbjoqKhA6hq5wsjC/qVjRUeWyl3k/WEnNPbtO04EEZ/fkuZ9
	 WukmutG2/Bj3Sy90JFBBNMdBrsQqkgAPYKvvA+/PH/igtmXZunSXbaNzNkmEHeJn39
	 f00vb1B9CAWtsJPV6IVWZ2uNAhxWFPmEXka29SzOdkxRqLi0qAuk4gyga/xvvTZO2e
	 hRe6q3b0/mX6Bo/zqU5mnS41whRSWwRbXAzoFu3mW6OGkoJnvupgbq4btk/a1t2c9E
	 IoP4IU6DkHjLaMrgpN4c1RAMBXZUGntz3NlIAssWjDUsHC2QipRHAOseqcwymH/7pH
	 6SgaFvb/3vvmQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org
Subject: [PATCH] platform/chrome: cros_ec: remove unneeded label and if-condition
Date: Wed,  8 Mar 2023 11:12:47 +0800
Message-Id: <20230308031247.2866401-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both `ec_dev->ec` and `ec_dev->pd` are initialized to NULL at the
beginning of cros_ec_register().  Also, platform_device_unregister()
takes care if the given platform_device is NULL.

Remove the unneeded goto-label and if-condition.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index b895c8130bba..8b7949220382 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -206,7 +206,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 	err = cros_ec_query_all(ec_dev);
 	if (err) {
 		dev_err(dev, "Cannot identify the EC: error %d\n", err);
-		goto destroy_mutex;
+		goto exit;
 	}
 
 	if (ec_dev->irq > 0) {
@@ -218,7 +218,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 		if (err) {
 			dev_err(dev, "Failed to request IRQ %d: %d\n",
 				ec_dev->irq, err);
-			goto destroy_mutex;
+			goto exit;
 		}
 	}
 
@@ -230,7 +230,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 		dev_err(ec_dev->dev,
 			"Failed to create CrOS EC platform device\n");
 		err = PTR_ERR(ec_dev->ec);
-		goto destroy_mutex;
+		goto exit;
 	}
 
 	if (ec_dev->max_passthru) {
@@ -296,7 +296,6 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 exit:
 	platform_device_unregister(ec_dev->ec);
 	platform_device_unregister(ec_dev->pd);
-destroy_mutex:
 	mutex_destroy(&ec_dev->lock);
 	lockdep_unregister_key(&ec_dev->lockdep_key);
 	return err;
@@ -313,8 +312,7 @@ EXPORT_SYMBOL(cros_ec_register);
  */
 void cros_ec_unregister(struct cros_ec_device *ec_dev)
 {
-	if (ec_dev->pd)
-		platform_device_unregister(ec_dev->pd);
+	platform_device_unregister(ec_dev->pd);
 	platform_device_unregister(ec_dev->ec);
 	mutex_destroy(&ec_dev->lock);
 	lockdep_unregister_key(&ec_dev->lockdep_key);
-- 
2.40.0.rc1.284.g88254d51c5-goog

