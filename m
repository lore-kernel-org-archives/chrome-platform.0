Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF640368
	for <chrome-platform@lists.linux.dev>; Tue, 28 Jun 2022 02:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE526C341CB;
	Tue, 28 Jun 2022 02:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656384584;
	bh=FGTtufHlSSn22mtv5KHuJ8CCy43ei44B5IZOaQE6nj0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hoRudwxAbT4YXEPpp4wlMC5u1bDx62NHBReqZD7kRJLlyLDzCkIHpTMDYSnkrPPU0
	 mYN9Lj6xMdwm5FIshXQvluB+l9rSKlcwVIEmW8zw9+WC8fQZpk2ftqRG3aLE+mcVZr
	 YGF+XEyCwhzN4c6DPgoWDxBbJ0F2OpxBIcthWbwl/wJwOdMtWgd2m+1EBhHCp8vGZe
	 a91W+qrxOz5Cn6nkC77jwKXQefHohOLrulW5R3iJs8J7BvrjJY2qNPWl0V1C2KSlAO
	 ZvtnBxn74MlHUjB/KIAVoyW0W57dbxrklY+5TaPunAwp+TfTtW/AXYfKdMLaEaRCW4
	 gHygqWepTh6Wg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 10/11] platform/chrome: cros_ec_proto: add Kunit test for empty payload
Date: Tue, 28 Jun 2022 02:49:12 +0000
Message-Id: <20220628024913.1755292-11-tzungbi@kernel.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220628024913.1755292-1-tzungbi@kernel.org>
References: <20220628024913.1755292-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cros_ec_wait_until_complete() sends EC_CMD_GET_COMMS_STATUS which expects
to receive sizeof(struct ec_response_get_comms_status) from
cros_ec_xfer_command().

Add Kunit test and expect to receive an error code when
cros_ec_xfer_command() returns 0.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_proto_test.c | 31 ++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
index 2a6b099fbfd9..7d45e5022221 100644
--- a/drivers/platform/chrome/cros_ec_proto_test.c
+++ b/drivers/platform/chrome/cros_ec_proto_test.c
@@ -1934,6 +1934,36 @@ static void cros_ec_proto_test_cmd_xfer_in_progress_return_error(struct kunit *t
 	KUNIT_EXPECT_EQ(test, cros_kunit_ec_pkt_xfer_mock_called, 2);
 }
 
+static void cros_ec_proto_test_cmd_xfer_in_progress_return0(struct kunit *test)
+{
+	struct cros_ec_proto_test_priv *priv = test->priv;
+	struct cros_ec_device *ec_dev = &priv->ec_dev;
+	struct ec_xfer_mock *mock;
+	int ret;
+	struct cros_ec_command msg;
+
+	memset(&msg, 0, sizeof(msg));
+
+	ec_dev->pkt_xfer = cros_kunit_ec_pkt_xfer_mock;
+
+	/* For the first host command to return EC_RES_IN_PROGRESS. */
+	{
+		mock = cros_kunit_ec_xfer_mock_addx(test, 0, EC_RES_IN_PROGRESS, 0);
+		KUNIT_ASSERT_PTR_NE(test, mock, NULL);
+	}
+
+	/* For EC_CMD_GET_COMMS_STATUS. */
+	{
+		mock = cros_kunit_ec_xfer_mock_add(test, 0);
+		KUNIT_ASSERT_PTR_NE(test, mock, NULL);
+	}
+
+	ret = cros_ec_cmd_xfer(ec_dev, &msg);
+	KUNIT_EXPECT_EQ(test, ret, -EPROTO);
+
+	KUNIT_EXPECT_EQ(test, cros_kunit_ec_pkt_xfer_mock_called, 2);
+}
+
 static void cros_ec_proto_test_release(struct device *dev)
 {
 }
@@ -2013,6 +2043,7 @@ static struct kunit_case cros_ec_proto_test_cases[] = {
 	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_retries_status_processing),
 	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_xfer_error),
 	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_return_error),
+	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_return0),
 	{}
 };
 
-- 
2.37.0.rc0.161.g10f37bed90-goog

