Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A94A47
	for <chrome-platform@lists.linux.dev>; Mon, 18 Jul 2022 05:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48F18C341D1;
	Mon, 18 Jul 2022 05:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658121018;
	bh=nL2IFLAzOr5cOIj07ugBl3ewpUMw1jlbJK1RtoAjFDw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lktgRo7eQNyC4UwmJk5XSoMvnxr7xre/aGqRb7+a/s5yY9DXhwARmCr7k2ws8B3Xx
	 D2y2ZNm5o+gu8VUJ43FNZCP3Ant0KW07e9hbJjzQWQc2sx7Zg7MyUQN+5pijJbCsHt
	 t/C1v6hbMH8KNJwhiCiaBUkmf4y7CCk2e/WFEnEwkceniDgZC6V2PZjBY0+z9OWNZG
	 8pWaPBk+WQtoKVyPhyWq5ValdZf50v+23AjQeYMzemyVzFtNoDhgQF8md6CgdlalC3
	 P8nGf/G3exGA12CrOPGoeY1lRSg1FjAEy/30wO7xfPJnsmsPoWmDsicsx0XPE/JOZk
	 X0PdazoAcBY1Q==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/10] platform/chrome: cros_ec_proto: add Kunit test for empty payload
Date: Mon, 18 Jul 2022 05:09:13 +0000
Message-Id: <20220718050914.2267370-10-tzungbi@kernel.org>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
In-Reply-To: <20220718050914.2267370-1-tzungbi@kernel.org>
References: <20220718050914.2267370-1-tzungbi@kernel.org>
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
No changes from v1.

 drivers/platform/chrome/cros_ec_proto_test.c | 31 ++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
index fbb872040711..d76e09b8a36a 100644
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
2.37.0.170.g444d1eabd0-goog

