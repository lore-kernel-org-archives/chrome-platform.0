Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386C27E
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jun 2022 14:12:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB15C34115;
	Mon,  6 Jun 2022 14:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654524731;
	bh=Yjcb3OtJcORaaknCRkodg9aE4+gNM5Rv2TFudD30oJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BkROBVw41E47C3tHROfSq601AFrmhE5NsUfe/c1T8qpIwkKTfxkJm2BYyd7lalQID
	 s05OYxFC/Kpn1hVVBxon4Vk8MX1CMD3RGe0+srhAl57ZmEnYQsDdr3JJvkl9dHrsAu
	 LkmvrZjnvwO3dUjERP2HgUg86d6qtfOHA8bn9yBRWB63bVS4tYVaOUzMXOOBiWyOBa
	 B+QEFufytkTZR92FBiWvfnVln4qKC/74mAuiQcz6XtunTOcuDuRYZo0lXQDKbttuZ6
	 I5hfTCtjFOpKMGnPK6wt6wmk+ly7CImbzKN4VWCBqt5izL2qK64xMl4OnwvOv2Qc46
	 YJDSrHAPzbO2Q==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/13] platform/chrome: cros_ec_proto: arrange get_host_event_wake_mask()
Date: Mon,  6 Jun 2022 14:10:50 +0000
Message-Id: <20220606141051.285823-13-tzungbi@kernel.org>
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

- cros_ec_get_host_event_wake_mask() is a private (static) function.
  Rename it to get_host_event_wake_mask().

- Join multiple lines into one if it can fit in 100 columns.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_proto.c      | 9 ++++-----
 drivers/platform/chrome/cros_ec_proto_test.c | 8 ++++----
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 91c945c9911f..1622e24747c9 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -230,7 +230,7 @@ int cros_ec_check_result(struct cros_ec_device *ec_dev,
 EXPORT_SYMBOL(cros_ec_check_result);
 
 /*
- * cros_ec_get_host_event_wake_mask
+ * get_host_event_wake_mask
  *
  * Get the mask of host events that cause wake from suspend.
  *
@@ -242,7 +242,7 @@ EXPORT_SYMBOL(cros_ec_check_result);
  * the caller has ec_dev->lock mutex, or the caller knows there is
  * no other command in progress.
  */
-static int cros_ec_get_host_event_wake_mask(struct cros_ec_device *ec_dev, uint32_t *mask)
+static int get_host_event_wake_mask(struct cros_ec_device *ec_dev, uint32_t *mask)
 {
 	struct cros_ec_command *msg;
 	struct ec_response_host_event_mask *r;
@@ -498,7 +498,7 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
 	ec_dev->host_sleep_v1 = (ret > 0 && (ver_mask & EC_VER_MASK(1)));
 
 	/* Get host event wake mask. */
-	ret = cros_ec_get_host_event_wake_mask(ec_dev, &ec_dev->host_event_wake_mask);
+	ret = get_host_event_wake_mask(ec_dev, &ec_dev->host_event_wake_mask);
 	if (ret < 0) {
 		/*
 		 * If the EC doesn't support EC_CMD_HOST_EVENT_GET_WAKE_MASK,
@@ -522,8 +522,7 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
 		 * other errors.
 		 */
 		if (ret != -EOPNOTSUPP)
-			dev_err(ec_dev->dev,
-				"failed to retrieve wake mask: %d\n", ret);
+			dev_err(ec_dev->dev, "failed to retrieve wake mask: %d\n", ret);
 	}
 
 	return 0;
diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
index 7d73aeb99d1d..f63196289f54 100644
--- a/drivers/platform/chrome/cros_ec_proto_test.c
+++ b/drivers/platform/chrome/cros_ec_proto_test.c
@@ -239,7 +239,7 @@ static void cros_ec_proto_test_query_all_normal(struct kunit *test)
 		data->version_mask = BIT(1);
 	}
 
-	/* For cros_ec_get_host_event_wake_mask(). */
+	/* For get_host_event_wake_mask(). */
 	{
 		struct ec_response_host_event_mask *data;
 
@@ -326,7 +326,7 @@ static void cros_ec_proto_test_query_all_normal(struct kunit *test)
 		KUNIT_EXPECT_TRUE(test, ec_dev->host_sleep_v1);
 	}
 
-	/* For cros_ec_get_host_event_wake_mask(). */
+	/* For get_host_event_wake_mask(). */
 	{
 		mock = cros_kunit_ec_xfer_mock_next();
 		KUNIT_EXPECT_PTR_NE(test, mock, NULL);
@@ -915,7 +915,7 @@ static void cros_ec_proto_test_query_all_default_wake_mask(struct kunit *test)
 		KUNIT_ASSERT_PTR_NE(test, mock, NULL);
 	}
 
-	/* For cros_ec_get_host_event_wake_mask(). */
+	/* For get_host_event_wake_mask(). */
 	{
 		mock = cros_kunit_ec_xfer_mock_addx(test, 0, EC_RES_INVALID_COMMAND,
 						    sizeof(struct ec_response_host_event_mask));
@@ -976,7 +976,7 @@ static void cros_ec_proto_test_query_all_default_wake_mask(struct kunit *test)
 		KUNIT_EXPECT_EQ(test, mock->msg.outsize, sizeof(struct ec_params_get_cmd_versions));
 	}
 
-	/* For cros_ec_get_host_event_wake_mask(). */
+	/* For get_host_event_wake_mask(). */
 	{
 		u32 mask;
 
-- 
2.36.1.255.ge46751e96f-goog

