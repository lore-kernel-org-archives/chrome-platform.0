Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508492;
	b=cYkpOFXfLSwqtOuDMDEXCYtvoP4dAJYyabdxuIffB+E7DApFsVbikLTPbxvet5UGbPPJ
	 aW23AmJh3mAFtG4Nt/0K2X6b8SdK+AsDhXWcu1UacbvSuYlx+sdTcct6Otc/rozrOEz58
	 cAHpXgR3tLRk7q4nVCVo66+S/umIKPPF4haae23kh5YT64ZxjyRavvKW409wa7UaRpfi/
	 S1uGkrKkFuFa/yQT2oijhMbJnd/R50JGxtxBuBUstvV90LEoXJD60WiLV+E25bYWYxlrO
	 Jyavb6QTLJlc6tbL/PTViliJOPQYcMoY9PWvO/A8gkGmZr6otgd/Apv90gw8ujeizhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508492;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=3EJXt9rdJB0pGoNEs0TQJpug9eA62iB0IGuq5j3+efQ=;
	b=SnprHAp6BYlcfA3Fu1BSaRO1rAYCIi478h8o6I3hY93LIA0zkqW7z8XkeL5uvTkstnOi
	 6k5zF6M7CQcSDrDwiB7yyyV0PUsEoS6NhaH+SxIihLL6dNx/NAPQqedu+U84sEWN+7fth
	 /UF/v6WTEeZTsYsR+zvOtj5UKgCcl27Ndy5oBQur/A2ws8GReKrboDUAa4cPW1/y5/wjd
	 mvVKG4+Y868FqfgDBg0GLoyj7tAO0mmUi0z6NnrfnWxtWqVJpOJfsBep04nVv7dgcCXoq
	 SAyrSi37HzLcjD35TyAnWXhtuj3mmmadK6pIKoVygPMuSLcz2HT5wikjtTVUKIVJhMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jDGkdkba;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098EA606A31E
	for <chrome-platform@lists.linux.dev>; Tue, 24 Nov 2026 08:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jDGkdkba
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ED811F000D3;
	Tue, 24 Nov 2026 08:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795508491;
	bh=3EJXt9rdJB0pGoNEs0TQJpug9eA62iB0IGuq5j3+efQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jDGkdkbawzBNtW3BHFgH50dM0hiNZ4gVLO2zA4e8A265n3JwhI3EBejtPak/1tcpi
	 bcD09Gvy9bKIdST8vjdKLi3LkVrKgzYvZTpQR5GB5DgKDx8MmfyPScrVkijuoqI99a
	 eis+PHK07mUdK8/XsxqD4aRALy+gC6VB1EEfSN4/2404pQDrRcXgvhyavh0IocobYD
	 wFljZY9nUU5eQitxOMcFZG13x5Ktl95VprAN7aAZDD76ZaBpQ9bzPQPtjso3UXMNcA
	 4IcCU9E9fylelI4n39ToyR46gZbORF6Lg5g7lzTWfMt3XFIWQ2bXRyHD7kIzlFtNiy
	 t2lWcLjala3Nw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>
Cc: tzungbi@kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH 6/9] platform/chrome: KUnit: Update test cases for protocol v2
Date: Tue, 24 Nov 2026 08:21:09 +0000
Message-ID: <20261124082112.3361229-7-tzungbi@kernel.org>
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

cros_ec_query_all() now uses v2 directly when `ec_dev->pkt_xfer` is
NULL.  Update the test cases for protocol v2.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_proto_test.c | 72 ++------------------
 1 file changed, 4 insertions(+), 68 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
index ef94bafe93d8..c31d0ef87fb2 100644
--- a/drivers/platform/chrome/cros_ec_proto_test.c
+++ b/drivers/platform/chrome/cros_ec_proto_test.c
@@ -611,11 +611,7 @@ static void cros_ec_proto_test_query_all_legacy_xfer_error(struct kunit *test)
 	struct ec_xfer_mock *mock;
 	int ret;
 
-	/* For cros_ec_get_proto_info() without passthru. */
-	{
-		mock = cros_kunit_ec_xfer_mock_addx(test, 0, EC_RES_INVALID_COMMAND, 0);
-		KUNIT_ASSERT_PTR_NE(test, mock, NULL);
-	}
+	ec_dev->pkt_xfer = NULL;
 
 	/* For cros_ec_get_proto_info_legacy(). */
 	{
@@ -628,18 +624,6 @@ static void cros_ec_proto_test_query_all_legacy_xfer_error(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ret, -EIO);
 	KUNIT_EXPECT_EQ(test, ec_dev->proto_version, EC_PROTO_VERSION_UNKNOWN);
 
-	/* For cros_ec_get_proto_info() without passthru. */
-	{
-		mock = cros_kunit_ec_xfer_mock_next();
-		KUNIT_EXPECT_PTR_NE(test, mock, NULL);
-
-		KUNIT_EXPECT_EQ(test, mock->msg.version, 0);
-		KUNIT_EXPECT_EQ(test, mock->msg.command, EC_CMD_GET_PROTOCOL_INFO);
-		KUNIT_EXPECT_EQ(test, mock->msg.insize,
-				sizeof(struct ec_response_get_protocol_info));
-		KUNIT_EXPECT_EQ(test, mock->msg.outsize, 0);
-	}
-
 	/* For cros_ec_get_proto_info_legacy(). */
 	{
 		mock = cros_kunit_ec_xfer_mock_next();
@@ -659,11 +643,7 @@ static void cros_ec_proto_test_query_all_legacy_return_error(struct kunit *test)
 	struct ec_xfer_mock *mock;
 	int ret;
 
-	/* For cros_ec_get_proto_info() without passthru. */
-	{
-		mock = cros_kunit_ec_xfer_mock_addx(test, 0, EC_RES_INVALID_COMMAND, 0);
-		KUNIT_ASSERT_PTR_NE(test, mock, NULL);
-	}
+	ec_dev->pkt_xfer = NULL;
 
 	/* For cros_ec_get_proto_info_legacy(). */
 	{
@@ -676,18 +656,6 @@ static void cros_ec_proto_test_query_all_legacy_return_error(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ret, -EOPNOTSUPP);
 	KUNIT_EXPECT_EQ(test, ec_dev->proto_version, EC_PROTO_VERSION_UNKNOWN);
 
-	/* For cros_ec_get_proto_info() without passthru. */
-	{
-		mock = cros_kunit_ec_xfer_mock_next();
-		KUNIT_EXPECT_PTR_NE(test, mock, NULL);
-
-		KUNIT_EXPECT_EQ(test, mock->msg.version, 0);
-		KUNIT_EXPECT_EQ(test, mock->msg.command, EC_CMD_GET_PROTOCOL_INFO);
-		KUNIT_EXPECT_EQ(test, mock->msg.insize,
-				sizeof(struct ec_response_get_protocol_info));
-		KUNIT_EXPECT_EQ(test, mock->msg.outsize, 0);
-	}
-
 	/* For cros_ec_get_proto_info_legacy(). */
 	{
 		mock = cros_kunit_ec_xfer_mock_next();
@@ -707,11 +675,7 @@ static void cros_ec_proto_test_query_all_legacy_data_error(struct kunit *test)
 	struct ec_xfer_mock *mock;
 	int ret;
 
-	/* For cros_ec_get_proto_info() without passthru. */
-	{
-		mock = cros_kunit_ec_xfer_mock_addx(test, 0, EC_RES_INVALID_COMMAND, 0);
-		KUNIT_ASSERT_PTR_NE(test, mock, NULL);
-	}
+	ec_dev->pkt_xfer = NULL;
 
 	/* For cros_ec_get_proto_info_legacy(). */
 	{
@@ -729,18 +693,6 @@ static void cros_ec_proto_test_query_all_legacy_data_error(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ret, -EBADMSG);
 	KUNIT_EXPECT_EQ(test, ec_dev->proto_version, EC_PROTO_VERSION_UNKNOWN);
 
-	/* For cros_ec_get_proto_info() without passthru. */
-	{
-		mock = cros_kunit_ec_xfer_mock_next();
-		KUNIT_EXPECT_PTR_NE(test, mock, NULL);
-
-		KUNIT_EXPECT_EQ(test, mock->msg.version, 0);
-		KUNIT_EXPECT_EQ(test, mock->msg.command, EC_CMD_GET_PROTOCOL_INFO);
-		KUNIT_EXPECT_EQ(test, mock->msg.insize,
-				sizeof(struct ec_response_get_protocol_info));
-		KUNIT_EXPECT_EQ(test, mock->msg.outsize, 0);
-	}
-
 	/* For cros_ec_get_proto_info_legacy(). */
 	{
 		mock = cros_kunit_ec_xfer_mock_next();
@@ -760,11 +712,7 @@ static void cros_ec_proto_test_query_all_legacy_return0(struct kunit *test)
 	struct ec_xfer_mock *mock;
 	int ret;
 
-	/* For cros_ec_get_proto_info() without passthru. */
-	{
-		mock = cros_kunit_ec_xfer_mock_addx(test, 0, EC_RES_INVALID_COMMAND, 0);
-		KUNIT_ASSERT_PTR_NE(test, mock, NULL);
-	}
+	ec_dev->pkt_xfer = NULL;
 
 	/* For cros_ec_get_proto_info_legacy(). */
 	{
@@ -777,18 +725,6 @@ static void cros_ec_proto_test_query_all_legacy_return0(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ret, -EPROTO);
 	KUNIT_EXPECT_EQ(test, ec_dev->proto_version, EC_PROTO_VERSION_UNKNOWN);
 
-	/* For cros_ec_get_proto_info() without passthru. */
-	{
-		mock = cros_kunit_ec_xfer_mock_next();
-		KUNIT_EXPECT_PTR_NE(test, mock, NULL);
-
-		KUNIT_EXPECT_EQ(test, mock->msg.version, 0);
-		KUNIT_EXPECT_EQ(test, mock->msg.command, EC_CMD_GET_PROTOCOL_INFO);
-		KUNIT_EXPECT_EQ(test, mock->msg.insize,
-				sizeof(struct ec_response_get_protocol_info));
-		KUNIT_EXPECT_EQ(test, mock->msg.outsize, 0);
-	}
-
 	/* For cros_ec_get_proto_info_legacy(). */
 	{
 		mock = cros_kunit_ec_xfer_mock_next();
-- 
2.56.1.831.g720f3f5937-goog

