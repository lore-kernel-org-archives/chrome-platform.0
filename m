Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508493;
	b=aQ4EWRMb//lhAWSHN6r1W/0fwI6w9jPFak6srjGK8fuGyQ/kG9bEFTT+9gg1JTRe67ys
	 AkXoiV6mSxsNaJq90VCoA2lt10lbt5yCh5b+0RshGK2St4dCaiYs2pxjKpH2Kg1K2tddz
	 47gmkZcT0RWwypRTIIWFEZDP8gcHW/zgLdDn5GgI7vkOPgaLd6YC5c2PZkOrvtWaGCAc5
	 dhbzZmArF51H4g/Uz5mjEy/EbA0FXlVUdZt25ypnwQeOPjyp1ZVsKlfnYEoww7KOHEfA1
	 vtqm4T1Ne2McfLsjWctqdRtOYedmW+vc0/lUb+OMJZjbpP3WC73mFwDiNVJe1RQmw1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508493;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=jV6b7nZhXkDD2PhCntdD5duQ4NXfjEl1f2CRBN6oOoQ=;
	b=yrRfM5xmaW/JxoNNcxw1byJUiK4XP2jQkEzX8y6oUNX5wY3B/09xSzDnUNUcJdvqIVCt
	 dvEBxJzfb/T+UlRAAOtIECJv9gzkNcLbWUsFwP5RpP3Y/y39G+Ed1TfHXKvKi5pjoJZnQ
	 vWGZpU6xDb3iFO1XEyUJfkkYYRY9gcm81zNi/yhZ4XaQKSSc4iFtU01OwlAfZ47YnF88g
	 nKMrtuCSgg4G0ZytofAESNcxGSPuB42ArUCG49dwj1J3kBbgwV4N2MCWK89nRbd01nZ+1
	 AikHT47u30V7Pf6HpmCbBhl9Tg7vFZHUYKIl4dW3WnRZxUHi2Rd7A93CR+gsfuyOiiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EPU3pYLv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBCF606A31E
	for <chrome-platform@lists.linux.dev>; Tue, 24 Nov 2026 08:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EPU3pYLv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26EF01F000D8;
	Tue, 24 Nov 2026 08:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795508492;
	bh=jV6b7nZhXkDD2PhCntdD5duQ4NXfjEl1f2CRBN6oOoQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EPU3pYLvPxoacx1PhaEcV3u2YihTzGdUtO1bDCMo1vHBsI760+7WhQoRhbQRYKMqx
	 F8U6NZHqQ07DtcbmXPZxT52cEQ1kmOFPEvbcBurC0sPmba3P6GCStJ+5rZH3Ok/N7r
	 XLA0ns/b5VIzbzJ417l3GPAIvvYLKF/nsNKM2QWjLffiMBTXQp+T2iyXF9MbPeo7xt
	 cP8GRvCFyFMdNRxVCZExh0+GIbOUkGBIJBT4zSKXPxUqBtut1vSH3O+PPJsKkkHI22
	 WM70tzXP5MjrQFaGdxwa1C2SwErS8K8eclRV4hYFoW2UD8nommzz9lVqAhlrjPIL9Y
	 eOuG6zAZsltfQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>
Cc: tzungbi@kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH 7/9] platform/chrome: KUnit: Add test cases for protocol fallback
Date: Tue, 24 Nov 2026 08:21:10 +0000
Message-ID: <20261124082112.3361229-8-tzungbi@kernel.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
In-Reply-To: <20261124082112.3361229-1-tzungbi@kernel.org>
References: <20261124082112.3361229-1-tzungbi@kernel.org>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add new test cases verifying cros_ec_query_all() does not fall back to
protocol v2 when:
- The device is already registered with `pkt_xfer` (known v3+ EC).
- `ec_dev->cmd_xfer` is not supported (doesn't support v2).
- The v3 query failed with a transient error (-ENOMEM or -EAGAIN).

Also rename the existing protocol v3-to-v2 fallback tests to
cros_ec_proto_test_query_all_fallback_v3_* for clarity.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_proto_test.c | 123 ++++++++++++++++++-
 1 file changed, 119 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
index c31d0ef87fb2..43c0b265db24 100644
--- a/drivers/platform/chrome/cros_ec_proto_test.c
+++ b/drivers/platform/chrome/cros_ec_proto_test.c
@@ -474,7 +474,7 @@ static void cros_ec_proto_test_query_all_no_pd_return0(struct kunit *test)
 	}
 }
 
-static void cros_ec_proto_test_query_all_legacy_normal_v3_return_error(struct kunit *test)
+static void cros_ec_proto_test_query_all_fallback_v3_return_error(struct kunit *test)
 {
 	struct cros_ec_proto_test_priv *priv = test->priv;
 	struct cros_ec_device *ec_dev = &priv->ec_dev;
@@ -539,7 +539,7 @@ static void cros_ec_proto_test_query_all_legacy_normal_v3_return_error(struct ku
 	}
 }
 
-static void cros_ec_proto_test_query_all_legacy_normal_v3_return0(struct kunit *test)
+static void cros_ec_proto_test_query_all_fallback_v3_return0(struct kunit *test)
 {
 	struct cros_ec_proto_test_priv *priv = test->priv;
 	struct cros_ec_device *ec_dev = &priv->ec_dev;
@@ -604,6 +604,117 @@ static void cros_ec_proto_test_query_all_legacy_normal_v3_return0(struct kunit *
 	}
 }
 
+static void cros_ec_proto_test_query_all_no_fallback_registered(struct kunit *test)
+{
+	struct cros_ec_proto_test_priv *priv = test->priv;
+	struct cros_ec_device *ec_dev = &priv->ec_dev;
+	struct ec_xfer_mock *mock;
+	int ret;
+
+	ec_dev->pkt_xfer = cros_kunit_ec_pkt_xfer_mock;
+	ec_dev->cmd_xfer = cros_kunit_ec_cmd_xfer_mock;
+	ec_dev->registered = true;
+
+	/* For cros_ec_get_proto_info() without passthru. */
+	{
+		mock = cros_kunit_ec_xfer_mock_add(test, 0);
+		KUNIT_ASSERT_PTR_NE(test, mock, NULL);
+	}
+
+	cros_ec_proto_test_query_all_pretest(test);
+	ret = cros_ec_query_all(ec_dev);
+	KUNIT_EXPECT_EQ(test, ret, -EPROTO);
+	KUNIT_EXPECT_EQ(test, ec_dev->proto_version, EC_PROTO_VERSION_UNKNOWN);
+	KUNIT_EXPECT_EQ(test, cros_kunit_ec_pkt_xfer_mock_called, 1);
+	KUNIT_EXPECT_EQ(test, cros_kunit_ec_cmd_xfer_mock_called, 0);
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
+}
+
+static void cros_ec_proto_test_query_all_no_fallback_no_cmd_xfer(struct kunit *test)
+{
+	struct cros_ec_proto_test_priv *priv = test->priv;
+	struct cros_ec_device *ec_dev = &priv->ec_dev;
+	struct ec_xfer_mock *mock;
+	int ret;
+
+	ec_dev->pkt_xfer = cros_kunit_ec_pkt_xfer_mock;
+	ec_dev->cmd_xfer = NULL;
+
+	/* For cros_ec_get_proto_info() without passthru. */
+	{
+		mock = cros_kunit_ec_xfer_mock_add(test, 0);
+		KUNIT_ASSERT_PTR_NE(test, mock, NULL);
+	}
+
+	cros_ec_proto_test_query_all_pretest(test);
+	ret = cros_ec_query_all(ec_dev);
+	KUNIT_EXPECT_EQ(test, ret, -EPROTO);
+	KUNIT_EXPECT_EQ(test, ec_dev->proto_version, EC_PROTO_VERSION_UNKNOWN);
+	KUNIT_EXPECT_EQ(test, cros_kunit_ec_pkt_xfer_mock_called, 1);
+	KUNIT_EXPECT_EQ(test, cros_kunit_ec_cmd_xfer_mock_called, 0);
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
+}
+
+static void cros_ec_proto_test_query_all_no_fallback_eagain(struct kunit *test)
+{
+	struct cros_ec_proto_test_priv *priv = test->priv;
+	struct cros_ec_device *ec_dev = &priv->ec_dev;
+	int ret;
+
+	ec_dev->pkt_xfer = cros_kunit_ec_pkt_xfer_mock;
+	ec_dev->cmd_xfer = cros_kunit_ec_cmd_xfer_mock;
+
+	cros_kunit_ec_xfer_mock_default_ret = -EAGAIN;
+
+	cros_ec_proto_test_query_all_pretest(test);
+	ret = cros_ec_query_all(ec_dev);
+	KUNIT_EXPECT_EQ(test, ret, -EAGAIN);
+	KUNIT_EXPECT_EQ(test, ec_dev->proto_version, EC_PROTO_VERSION_UNKNOWN);
+	KUNIT_EXPECT_EQ(test, cros_kunit_ec_pkt_xfer_mock_called, 6);
+	KUNIT_EXPECT_EQ(test, cros_kunit_ec_cmd_xfer_mock_called, 0);
+}
+
+static void cros_ec_proto_test_query_all_no_fallback_enomem(struct kunit *test)
+{
+	struct cros_ec_proto_test_priv *priv = test->priv;
+	struct cros_ec_device *ec_dev = &priv->ec_dev;
+	int ret;
+
+	ec_dev->pkt_xfer = cros_kunit_ec_pkt_xfer_mock;
+	ec_dev->cmd_xfer = cros_kunit_ec_cmd_xfer_mock;
+
+	cros_kunit_ec_xfer_mock_default_ret = -ENOMEM;
+
+	cros_ec_proto_test_query_all_pretest(test);
+	ret = cros_ec_query_all(ec_dev);
+	KUNIT_EXPECT_EQ(test, ret, -ENOMEM);
+	KUNIT_EXPECT_EQ(test, ec_dev->proto_version, EC_PROTO_VERSION_UNKNOWN);
+	KUNIT_EXPECT_EQ(test, cros_kunit_ec_pkt_xfer_mock_called, 1);
+	KUNIT_EXPECT_EQ(test, cros_kunit_ec_cmd_xfer_mock_called, 0);
+}
+
 static void cros_ec_proto_test_query_all_legacy_xfer_error(struct kunit *test)
 {
 	struct cros_ec_proto_test_priv *priv = test->priv;
@@ -2808,8 +2919,12 @@ static struct kunit_case cros_ec_proto_test_cases[] = {
 	KUNIT_CASE(cros_ec_proto_test_query_all_normal),
 	KUNIT_CASE(cros_ec_proto_test_query_all_no_pd_return_error),
 	KUNIT_CASE(cros_ec_proto_test_query_all_no_pd_return0),
-	KUNIT_CASE(cros_ec_proto_test_query_all_legacy_normal_v3_return_error),
-	KUNIT_CASE(cros_ec_proto_test_query_all_legacy_normal_v3_return0),
+	KUNIT_CASE(cros_ec_proto_test_query_all_fallback_v3_return_error),
+	KUNIT_CASE(cros_ec_proto_test_query_all_fallback_v3_return0),
+	KUNIT_CASE(cros_ec_proto_test_query_all_no_fallback_registered),
+	KUNIT_CASE(cros_ec_proto_test_query_all_no_fallback_no_cmd_xfer),
+	KUNIT_CASE(cros_ec_proto_test_query_all_no_fallback_eagain),
+	KUNIT_CASE(cros_ec_proto_test_query_all_no_fallback_enomem),
 	KUNIT_CASE(cros_ec_proto_test_query_all_legacy_xfer_error),
 	KUNIT_CASE(cros_ec_proto_test_query_all_legacy_return_error),
 	KUNIT_CASE(cros_ec_proto_test_query_all_legacy_data_error),
-- 
2.56.1.831.g720f3f5937-goog

