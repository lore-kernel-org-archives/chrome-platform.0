Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3396410F1
	for <chrome-platform@lists.linux.dev>; Wed, 22 Jun 2022 04:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 092DBC341C7;
	Wed, 22 Jun 2022 04:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655871068;
	bh=BPBbPOWl5lRcZ9Td52m9VqZiWRAAcWD6l1XSzcwrars=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e4wOYmJBkkj0NZ6W1qi45WWm0hwaTCcOpoJazgjemuTksxzm4zdeXx75ZkHAFYHCA
	 izY/Eo13XqGi33/yLvWpywfHJ+nFRZJVlPt+Q0j3UTQXAaON9G6BxrFTVQxghjBcrP
	 KuYWz32j2qC/3HqLhfs5iWByXOtwKdc4RykjtDVVSdQ8vbUvw68oZ3YTkarH3KmGZZ
	 A3HEL80WFMQ7ISWj69ELI9USkPJK0DBr8x1/uyZWDzVCweWdfawgfgo2kH+mPovcJs
	 bvAa7Ix8XDngU4/ixdTqWmNYty4BgO6X3pJNTgRoKHoEH/xkvLnSrhdkc2HJlax+VK
	 rCre4J4snCuNQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] platform/chrome: cros_ec_proto: add Kunit tests for cmd_xfer_status
Date: Wed, 22 Jun 2022 04:10:34 +0000
Message-Id: <20220622041040.202737-2-tzungbi@kernel.org>
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

cros_ec_cmd_xfer_status() calls cros_ec_cmd_xfer() and cros_ec_map_error().

Given that there are already test cases for cros_ec_cmd_xfer(), only add
basic Kunit tests for cros_ec_cmd_xfer_status().

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_proto_test.c | 42 ++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
index 7d45e5022221..6464f6101fd3 100644
--- a/drivers/platform/chrome/cros_ec_proto_test.c
+++ b/drivers/platform/chrome/cros_ec_proto_test.c
@@ -1964,6 +1964,46 @@ static void cros_ec_proto_test_cmd_xfer_in_progress_return0(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, cros_kunit_ec_pkt_xfer_mock_called, 2);
 }
 
+static void cros_ec_proto_test_cmd_xfer_status_normal(struct kunit *test)
+{
+	struct cros_ec_proto_test_priv *priv = test->priv;
+	struct cros_ec_device *ec_dev = &priv->ec_dev;
+	struct ec_xfer_mock *mock;
+	int ret;
+	struct cros_ec_command msg;
+
+	memset(&msg, 0, sizeof(msg));
+
+	/* For cros_ec_cmd_xfer(). */
+	{
+		mock = cros_kunit_ec_xfer_mock_add(test, 0);
+		KUNIT_ASSERT_PTR_NE(test, mock, NULL);
+	}
+
+	ret = cros_ec_cmd_xfer_status(ec_dev, &msg);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+}
+
+static void cros_ec_proto_test_cmd_xfer_status_xfer_error(struct kunit *test)
+{
+	struct cros_ec_proto_test_priv *priv = test->priv;
+	struct cros_ec_device *ec_dev = &priv->ec_dev;
+	struct ec_xfer_mock *mock;
+	int ret;
+	struct cros_ec_command msg;
+
+	memset(&msg, 0, sizeof(msg));
+
+	/* For cros_ec_cmd_xfer(). */
+	{
+		mock = cros_kunit_ec_xfer_mock_addx(test, -EPROTO, EC_RES_SUCCESS, 0);
+		KUNIT_ASSERT_PTR_NE(test, mock, NULL);
+	}
+
+	ret = cros_ec_cmd_xfer_status(ec_dev, &msg);
+	KUNIT_EXPECT_EQ(test, ret, -EPROTO);
+}
+
 static void cros_ec_proto_test_release(struct device *dev)
 {
 }
@@ -2044,6 +2084,8 @@ static struct kunit_case cros_ec_proto_test_cases[] = {
 	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_xfer_error),
 	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_return_error),
 	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_return0),
+	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_status_normal),
+	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_status_xfer_error),
 	{}
 };
 
-- 
2.37.0.rc0.104.g0611611a94-goog

