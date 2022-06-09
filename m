Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CB8210D
	for <chrome-platform@lists.linux.dev>; Thu,  9 Jun 2022 08:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C45C34114;
	Thu,  9 Jun 2022 08:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654764627;
	bh=2gdFBqKLJNRIYd2oIDEi1sQydP61hfqpk73r+DEhJx0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J18H0C5zWO2JhmqCUSA7oT9XRwJRc6f/+MOCez+6Ny7OyI6jA9+Be5vT7LdJNMmjz
	 uRVokqX9UTkd2jbsMF6FRTWO1//YrxDiWTkfYbtZuMOrPuwDXbTfpb/iAIlEh0NFQM
	 +g8Q98X2l6MUbXgovP5LQ8RAViEDV8p6iM4K569qdYBI936xZR0wjtOKGS4nZe0tFi
	 jrxzfOSmWrXDWtIGWNVyKiRE/pfVAAr+ggv+Snkq6GI/x6FdvRy6NlF6F5Tg1uAAIf
	 a8UoDxM4mh+LybaeiYGKsTZhPjAHyeXdo54dTHlsV5qd0xT4n2xR45+5ZXkuFsJFiW
	 xSiHLwl+gMOFA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 11/21] platform/chrome: cros_ec_proto: add Kunit test for getting legacy info
Date: Thu,  9 Jun 2022 08:49:47 +0000
Message-Id: <20220609084957.3684698-12-tzungbi@kernel.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220609084957.3684698-1-tzungbi@kernel.org>
References: <20220609084957.3684698-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cros_ec_get_proto_info_legacy() expects to receive
sizeof(struct ec_response_hello) from send_command().  The payload is
valid only if the return value is positive.

Add a Kunit test for returning 0 from send_command() in
cros_ec_get_proto_info_legacy().

Reviewed-by: Guenter Roeck <groeck@chromium.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
Changes from v3:
- Add R-b tag.

 drivers/platform/chrome/cros_ec_proto_test.c | 49 ++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
index 8e47cb70dc8b..63071af81c94 100644
--- a/drivers/platform/chrome/cros_ec_proto_test.c
+++ b/drivers/platform/chrome/cros_ec_proto_test.c
@@ -751,6 +751,54 @@ static void cros_ec_proto_test_query_all_legacy_data_error(struct kunit *test)
 	}
 }
 
+static void cros_ec_proto_test_query_all_legacy_return0(struct kunit *test)
+{
+	struct cros_ec_proto_test_priv *priv = test->priv;
+	struct cros_ec_device *ec_dev = &priv->ec_dev;
+	struct ec_xfer_mock *mock;
+	int ret;
+
+	/* For cros_ec_get_proto_info() without passthru. */
+	{
+		mock = cros_kunit_ec_xfer_mock_addx(test, 0, EC_RES_INVALID_COMMAND, 0);
+		KUNIT_ASSERT_PTR_NE(test, mock, NULL);
+	}
+
+	/* For cros_ec_get_proto_info_legacy(). */
+	{
+		mock = cros_kunit_ec_xfer_mock_add(test, 0);
+		KUNIT_ASSERT_PTR_NE(test, mock, NULL);
+	}
+
+	cros_ec_proto_test_query_all_pretest(test);
+	ret = cros_ec_query_all(ec_dev);
+	KUNIT_EXPECT_EQ(test, ret, -EPROTO);
+	KUNIT_EXPECT_EQ(test, ec_dev->proto_version, EC_PROTO_VERSION_UNKNOWN);
+
+	/* For cros_ec_get_proto_info() without passthru. */
+	{
+		mock = cros_kunit_ec_xfer_mock_next();
+		KUNIT_EXPECT_PTR_NE(test, mock, NULL);
+
+		KUNIT_EXPECT_EQ(test, mock->msg.version, 0);
+		KUNIT_EXPECT_EQ(test, mock->msg.command, EC_CMD_GET_PROTOCOL_INFO);
+		KUNIT_EXPECT_EQ(test, mock->msg.insize,
+				sizeof(struct ec_response_get_protocol_info));
+		KUNIT_EXPECT_EQ(test, mock->msg.outsize, 0);
+	}
+
+	/* For cros_ec_get_proto_info_legacy(). */
+	{
+		mock = cros_kunit_ec_xfer_mock_next();
+		KUNIT_EXPECT_PTR_NE(test, mock, NULL);
+
+		KUNIT_EXPECT_EQ(test, mock->msg.version, 0);
+		KUNIT_EXPECT_EQ(test, mock->msg.command, EC_CMD_HELLO);
+		KUNIT_EXPECT_EQ(test, mock->msg.insize, sizeof(struct ec_response_hello));
+		KUNIT_EXPECT_EQ(test, mock->msg.outsize, sizeof(struct ec_params_hello));
+	}
+}
+
 static void cros_ec_proto_test_query_all_no_mkbp(struct kunit *test)
 {
 	struct cros_ec_proto_test_priv *priv = test->priv;
@@ -1135,6 +1183,7 @@ static struct kunit_case cros_ec_proto_test_cases[] = {
 	KUNIT_CASE(cros_ec_proto_test_query_all_legacy_xfer_error),
 	KUNIT_CASE(cros_ec_proto_test_query_all_legacy_return_error),
 	KUNIT_CASE(cros_ec_proto_test_query_all_legacy_data_error),
+	KUNIT_CASE(cros_ec_proto_test_query_all_legacy_return0),
 	KUNIT_CASE(cros_ec_proto_test_query_all_no_mkbp),
 	KUNIT_CASE(cros_ec_proto_test_query_all_no_host_sleep),
 	KUNIT_CASE(cros_ec_proto_test_query_all_default_wake_mask_return_error),
-- 
2.36.1.255.ge46751e96f-goog

