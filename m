Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2722310F1
	for <chrome-platform@lists.linux.dev>; Wed, 22 Jun 2022 04:11:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15B34C341C8;
	Wed, 22 Jun 2022 04:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655871074;
	bh=pvLpn6lARkPGtANGQSEUCC7irri5emv/YqQbfk1ZsPA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GL2ekYN4JJVtsu+evDq27xP4O23iiAwyHt3PmeD+Wa+ZA8J5W2N7Qm1G3OKDk3Rai
	 UnkBHnxAilo2q15R3GHlEVNEQLGAGR8S7XEB4lydvjsGK8jmbytt71yLj1SE5GvRxG
	 CIxphyNPqQzZt/h3G/AfiJ6siR1WApEuZoE2LM0adclfPXLe5hLFYM/O5nb9ma3Xyd
	 6Dg0+4eazenvfTXDFt0Os9kMRjFg/6kQxtjLwBK6avgX7ZXHz7PtBxArY4s+224enj
	 cYTJ5K4/hDTZP8Z6KSWQdLTUpifhFUeEOUNnIPHkunD4eH/oGi/0tgvmWPvqCO65oq
	 ZYNi46Dl66IkQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] platform/chrome: cros_ec_proto: add Kunit tests for check_features
Date: Wed, 22 Jun 2022 04:10:38 +0000
Message-Id: <20220622041040.202737-6-tzungbi@kernel.org>
X-Mailer: git-send-email 2.37.0.rc0.104.g0611611a94-goog
In-Reply-To: <20220622041040.202737-1-tzungbi@kernel.org>
References: <20220622041040.202737-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cros_ec_check_features() gets EC features if it hasn't had cache, and
checks whether the given EC_FEATURE_* is supported or not.

Add Kunit tests for cros_ec_check_features().

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_proto_test.c | 77 ++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
index dce9fa3b9c8d..93c1700deaef 100644
--- a/drivers/platform/chrome/cros_ec_proto_test.c
+++ b/drivers/platform/chrome/cros_ec_proto_test.c
@@ -2367,6 +2367,81 @@ static void cros_ec_proto_test_get_host_event_normal(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ret, EC_HOST_EVENT_MASK(EC_HOST_EVENT_RTC));
 }
 
+static void cros_ec_proto_test_check_features_cached(struct kunit *test)
+{
+	int ret, i;
+	struct cros_ec_dev ec;
+
+	ec.features.flags[0] = EC_FEATURE_MASK_0(EC_FEATURE_FINGERPRINT);
+	ec.features.flags[1] = EC_FEATURE_MASK_0(EC_FEATURE_SCP);
+
+	for (i = 0; i < EC_FEATURE_TYPEC_MUX_REQUIRE_AP_ACK; ++i) {
+		ret = cros_ec_check_features(&ec, i);
+		switch (i) {
+		case EC_FEATURE_FINGERPRINT:
+		case EC_FEATURE_SCP:
+			KUNIT_EXPECT_TRUE(test, ret);
+			break;
+		default:
+			KUNIT_EXPECT_FALSE(test, ret);
+			break;
+		}
+	}
+}
+
+static void cros_ec_proto_test_check_features_not_cached(struct kunit *test)
+{
+	struct cros_ec_proto_test_priv *priv = test->priv;
+	struct cros_ec_device *ec_dev = &priv->ec_dev;
+	struct ec_xfer_mock *mock;
+	int ret, i;
+	struct cros_ec_dev ec;
+
+	ec_dev->max_request = 0xff;
+	ec_dev->max_response = 0xee;
+	ec.ec_dev = ec_dev;
+	ec.dev = ec_dev->dev;
+	ec.cmd_offset = 0;
+	ec.features.flags[0] = -1;
+	ec.features.flags[1] = -1;
+
+	/* For EC_CMD_GET_FEATURES. */
+	{
+		struct ec_response_get_features *data;
+
+		mock = cros_kunit_ec_xfer_mock_add(test, sizeof(*data));
+		KUNIT_ASSERT_PTR_NE(test, mock, NULL);
+
+		data = (struct ec_response_get_features *)mock->o_data;
+		data->flags[0] = EC_FEATURE_MASK_0(EC_FEATURE_FINGERPRINT);
+		data->flags[1] = EC_FEATURE_MASK_0(EC_FEATURE_SCP);
+	}
+
+	for (i = 0; i < EC_FEATURE_TYPEC_MUX_REQUIRE_AP_ACK; ++i) {
+		ret = cros_ec_check_features(&ec, i);
+		switch (i) {
+		case EC_FEATURE_FINGERPRINT:
+		case EC_FEATURE_SCP:
+			KUNIT_EXPECT_TRUE(test, ret);
+			break;
+		default:
+			KUNIT_EXPECT_FALSE(test, ret);
+			break;
+		}
+	}
+
+	/* For EC_CMD_GET_FEATURES. */
+	{
+		mock = cros_kunit_ec_xfer_mock_next();
+		KUNIT_EXPECT_PTR_NE(test, mock, NULL);
+
+		KUNIT_EXPECT_EQ(test, mock->msg.version, 0);
+		KUNIT_EXPECT_EQ(test, mock->msg.command, EC_CMD_GET_FEATURES);
+		KUNIT_EXPECT_EQ(test, mock->msg.insize, sizeof(struct ec_response_get_features));
+		KUNIT_EXPECT_EQ(test, mock->msg.outsize, 0);
+	}
+}
+
 static void cros_ec_proto_test_release(struct device *dev)
 {
 }
@@ -2460,6 +2535,8 @@ static struct kunit_case cros_ec_proto_test_cases[] = {
 	KUNIT_CASE(cros_ec_proto_test_get_host_event_not_host_event),
 	KUNIT_CASE(cros_ec_proto_test_get_host_event_wrong_event_size),
 	KUNIT_CASE(cros_ec_proto_test_get_host_event_normal),
+	KUNIT_CASE(cros_ec_proto_test_check_features_cached),
+	KUNIT_CASE(cros_ec_proto_test_check_features_not_cached),
 	{}
 };
 
-- 
2.37.0.rc0.104.g0611611a94-goog

