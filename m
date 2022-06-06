Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D53E7E
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jun 2022 14:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70288C341C4;
	Mon,  6 Jun 2022 14:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654524727;
	bh=IDJd2ngMfd4ziS/HQIuZWqAxD2Z0NWrPdYp/crTIQBI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tnck8GKIA4z72tw7EOxg2TJ9dtdwIWJEU6+HnqP9ucMo1TS8yNF84quIk2hiSNEVy
	 8M7yaBeMySkSmJcn8vEoglnoIXe5SJbbVBp+Vl1iDgG4q/bZO/igKqD+d3TxP7+pXi
	 V9FnMKqlOtQ3l1IAUhQWeXQVsnQ4Dqejvv4p73k6UF6zzY0fA/7CCJNcvnuQxQo1rE
	 LRt8rAhPXietqhyRYLI5j4Tl26RlqJ6D6qk6VUOsXbDV5s0OnVV6IUWoSm4v1RnLhV
	 8ecX8vTQkuTAuOCHsVWI/BR+zCG0pOASJ8HhZ5eo1SlEye4+O6QL1XZJMimx4qw+iL
	 8DA74tJjeM9qw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/13] platform/chrome: cros_ec_proto: use devm_krealloc()
Date: Mon,  6 Jun 2022 14:10:47 +0000
Message-Id: <20220606141051.285823-10-tzungbi@kernel.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220606141051.285823-1-tzungbi@kernel.org>
References: <20220606141051.285823-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_krealloc() to re-allocate `din` and `dout`.

Also remove the unneeded devm_kfree() in error handling path as they are
device managed memory.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_proto.c      | 25 ++++++--------------
 drivers/platform/chrome/cros_ec_proto_test.c |  3 +--
 2 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index abb30a685567..5f4414f05d66 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -479,21 +479,13 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
 		}
 	}
 
-	devm_kfree(dev, ec_dev->din);
-	devm_kfree(dev, ec_dev->dout);
-
-	ec_dev->din = devm_kzalloc(dev, ec_dev->din_size, GFP_KERNEL);
-	if (!ec_dev->din) {
-		ret = -ENOMEM;
-		goto exit;
-	}
+	ec_dev->din = devm_krealloc(dev, ec_dev->din, ec_dev->din_size, GFP_KERNEL | __GFP_ZERO);
+	if (!ec_dev->din)
+		return -ENOMEM;
 
-	ec_dev->dout = devm_kzalloc(dev, ec_dev->dout_size, GFP_KERNEL);
-	if (!ec_dev->dout) {
-		devm_kfree(dev, ec_dev->din);
-		ret = -ENOMEM;
-		goto exit;
-	}
+	ec_dev->dout = devm_krealloc(dev, ec_dev->dout, ec_dev->dout_size, GFP_KERNEL | __GFP_ZERO);
+	if (!ec_dev->dout)
+		return -ENOMEM;
 
 	/* Probe if MKBP event is supported */
 	ret = cros_ec_get_host_command_version_mask(ec_dev,
@@ -542,10 +534,7 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
 				"failed to retrieve wake mask: %d\n", ret);
 	}
 
-	ret = 0;
-
-exit:
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL(cros_ec_query_all);
 
diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
index 79150bf511fb..22f9322787f4 100644
--- a/drivers/platform/chrome/cros_ec_proto_test.c
+++ b/drivers/platform/chrome/cros_ec_proto_test.c
@@ -180,8 +180,7 @@ static void cros_ec_proto_test_query_all_pretest(struct kunit *test)
 
 	/*
 	 * cros_ec_query_all() will free din and dout and allocate them again to fit the usage by
-	 * calling devm_kfree() and devm_kzalloc().  Set them to NULL as they aren't managed by
-	 * ec_dev->dev.
+	 * calling devm_krealloc().  Set them to NULL as they aren't managed by ec_dev->dev.
 	 */
 	ec_dev->din = NULL;
 	ec_dev->dout = NULL;
-- 
2.36.1.255.ge46751e96f-goog

