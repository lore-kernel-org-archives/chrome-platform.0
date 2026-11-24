Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508494;
	b=Ki+YL7C2HP/T1zcv3tpCXhK55TA2I/+9mqGvO3grlZqaykDA+AMyRifBHSxnoKosWu+S
	 0atcJohWxExWJgDbnmW4v+IJiUcjEX8v1kJTQ3TpWM/4JarbWnSOR8b/DXaZdq/ImxHOy
	 DdIPFdQKyR5yChx1/aKU/KawLeDxKhwxPEFuAhtnl6Xnb63mhAyMJbLggNlCyqos7W+sz
	 fArHd5C0u2Aq9/d33vNIglNsA1wIYodxI5atCAyqRgcUwh3oFYWIXmeGNxR7CFqLrRL6I
	 dtr4bo0PAjZZ7tpolNl/4093yYS0+EA+7Kt0in36WTxU8xTgShHpOFmLGY/lQIYLkyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508494;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=K1G5UCvD9ZpbGgdHWGP8Ponn8HuyrLxBvJjaaevsmrA=;
	b=Eww5+wG0hLBKXYbwsPw+0hJRhBh0Q7D12PczEYVD7Df1N5Wl//ouOKjbfwY2Qzwrhuf5
	 KJ1Hp5Vg1b+frCjIdRYg+Qd4NygCyQB1PE/o1/lvUdc87LDYAYTzMNsp4XiJfcE4ZXang
	 7Axt5m2WA9DSNoAO99rdTfpLkRX3sxGQ5oq5wHSIx48m3ihTD836w2JEZrOqTqUhYvbdr
	 ZJVFbRU/hcYkBgIhU+QUHDjsqUyYqDJJOsr2HyPdLMdlc8ZrG8WbwjbArSoKCZcFiWFDq
	 dIgw5p9mzRavYI7mgCBPcGW1ZVnDTFojHioJXnYbvZYncSzsD0BDcgou0eTLT72tvJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bGm8CT+W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F01606A31E
	for <chrome-platform@lists.linux.dev>; Tue, 24 Nov 2026 08:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bGm8CT+W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ECBD1F000D2;
	Tue, 24 Nov 2026 08:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795508494;
	bh=K1G5UCvD9ZpbGgdHWGP8Ponn8HuyrLxBvJjaaevsmrA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bGm8CT+WYwwz282D6uXkhDcg7FKNIo/gJu5gM/VNNaYgsR3YhSb0syPMeCISOzPFt
	 RFky23gYjKPN+mu2TEB4bSSamnZvuviCtvF/T8Y/HQPWKKNEmso28/Cyjko1k0CQ85
	 JxBZ+1/mCqgaAwZol7854YSOKkf3MvOdkGGUomOthkstJRtrZ2SY0ekbgOqYXJiwrA
	 e/knJFbTXT6DyJl7I6FPpCHEqvmDz7c4XyBrOvpT7trggIf50isqF14WLtDJGHNiFe
	 R0xi+0urvUhql7k77VbSLsCi00hdMQEmsG5K/IPjXm68lrSP1A40TeP7kGu7zkNI7Q
	 9otnkNQCTW41g==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>
Cc: tzungbi@kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH 8/9] platform/chrome: cros_ec_proto: Propagate feature probe errors
Date: Tue, 24 Nov 2026 08:21:11 +0000
Message-ID: <20261124082112.3361229-9-tzungbi@kernel.org>
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

cros_ec_query_all() treats any error when probing MKBP events, host
sleep v1, or the host event wake mask as if the feature were
unsupported.  A transient transport error (such as -EAGAIN) during probe
or a runtime re-query could therefore silently disable MKBP events,
disable host sleep v1, or fall back to the default wake mask.

Map EC_RES_INVALID_PARAM (-EINVAL) from EC_CMD_GET_CMD_VERSIONS to
-EOPNOTSUPP in cros_ec_get_host_command_version_mask() so "unsupported"
is consistently reported as -EOPNOTSUPP across all three feature probes.

In cros_ec_query_all(), only treat -EOPNOTSUPP as unsupported and
propagate all other errors, resetting `ec_dev->proto_version` to
EC_PROTO_VERSION_UNKNOWN so the next transfer re-queries the EC.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_proto.c      | 61 ++++++++++++--------
 drivers/platform/chrome/cros_ec_proto_test.c | 37 ++++++------
 2 files changed, 55 insertions(+), 43 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index d8ab82154c92..823fa8879d92 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -578,6 +578,17 @@ static int cros_ec_get_host_command_version_mask(struct cros_ec_device *ec_dev,
 
 	mapped = cros_ec_map_error(msg->result);
 	if (mapped) {
+		/*
+		 * EC returns EC_RES_INVALID_COMMAND if EC_CMD_GET_CMD_VERSIONS
+		 * isn't implemented.
+		 *
+		 * EC_CMD_GET_CMD_VERSIONS returns EC_RES_INVALID_PARAM if @cmd
+		 * isn't implemented.
+		 *
+		 * Return -EOPNOTSUPP to indicate "unsupported".
+		 */
+		if (mapped == -EINVAL)
+			mapped = -EOPNOTSUPP;
 		ret = mapped;
 		goto exit;
 	}
@@ -640,34 +651,34 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
 		/* pkt_xfer is NULL (v2-only EC); query with v2 directly. */
 		ret = cros_ec_get_proto_info_legacy(ec_dev);
 	}
-	if (ret) {
-		/*
-		 * It's possible for a test to occur too early when
-		 * the EC isn't listening. If this happens, we'll
-		 * test later when the first command is run.
-		 */
-		ec_dev->proto_version = EC_PROTO_VERSION_UNKNOWN;
-		dev_dbg(ec_dev->dev, "EC query failed: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		goto exit;
 
 	/* Probe if MKBP event is supported */
 	ret = cros_ec_get_host_command_version_mask(ec_dev, EC_CMD_GET_NEXT_EVENT, &ver_mask);
-	if (ret < 0 || ver_mask == 0) {
+	if (ret == -EOPNOTSUPP)
 		ec_dev->mkbp_event_supported = 0;
-	} else {
+	else if (ret)
+		goto exit;
+	else
 		ec_dev->mkbp_event_supported = fls(ver_mask);
-
+	if (ec_dev->mkbp_event_supported)
 		dev_dbg(ec_dev->dev, "MKBP support version %u\n", ec_dev->mkbp_event_supported - 1);
-	}
+	else
+		dev_dbg(ec_dev->dev, "MKBP unsupported\n");
 
 	/* Probe if host sleep v1 is supported for S0ix failure detection. */
 	ret = cros_ec_get_host_command_version_mask(ec_dev, EC_CMD_HOST_SLEEP_EVENT, &ver_mask);
-	ec_dev->host_sleep_v1 = (ret == 0 && (ver_mask & EC_VER_MASK(1)));
+	if (ret == -EOPNOTSUPP)
+		ec_dev->host_sleep_v1 = false;
+	else if (ret)
+		goto exit;
+	else
+		ec_dev->host_sleep_v1 = ver_mask & EC_VER_MASK(1);
 
 	/* Get host event wake mask. */
 	ret = cros_ec_get_host_event_wake_mask(ec_dev, &ec_dev->host_event_wake_mask);
-	if (ret < 0) {
+	if (ret == -EOPNOTSUPP) {
 		/*
 		 * If the EC doesn't support EC_CMD_HOST_EVENT_GET_WAKE_MASK,
 		 * use a reasonable default. Note that we ignore various
@@ -685,16 +696,20 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
 			  EC_HOST_EVENT_MASK(EC_HOST_EVENT_BATTERY) |
 			  EC_HOST_EVENT_MASK(EC_HOST_EVENT_PD_MCU) |
 			  EC_HOST_EVENT_MASK(EC_HOST_EVENT_BATTERY_STATUS));
-		/*
-		 * Old ECs may not support this command. Complain about all
-		 * other errors.
-		 */
-		if (ret != -EOPNOTSUPP)
-			dev_err(ec_dev->dev,
-				"failed to retrieve wake mask: %d\n", ret);
+	} else if (ret) {
+		dev_err(ec_dev->dev, "failed to retrieve wake mask: %d\n", ret);
+		goto exit;
 	}
 
 	return 0;
+exit:
+	/*
+	 * Reset `proto_version` so the next transfer retries
+	 * cros_ec_query_all() once the EC is ready.
+	 */
+	ec_dev->proto_version = EC_PROTO_VERSION_UNKNOWN;
+	dev_dbg(ec_dev->dev, "EC query failed: %d\n", ret);
+	return ret;
 }
 EXPORT_SYMBOL(cros_ec_query_all);
 
diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
index 43c0b265db24..92eb09f32a08 100644
--- a/drivers/platform/chrome/cros_ec_proto_test.c
+++ b/drivers/platform/chrome/cros_ec_proto_test.c
@@ -188,6 +188,9 @@ static void cros_ec_proto_test_query_all_pretest(struct kunit *test)
 	 */
 	ec_dev->din = NULL;
 	ec_dev->dout = NULL;
+
+	/* Fallback to -EOPNOTSUPP for all un-specified mocks. */
+	cros_kunit_ec_xfer_mock_default_result = EC_RES_INVALID_COMMAND;
 }
 
 static void cros_ec_proto_test_query_all_normal(struct kunit *test)
@@ -1069,7 +1072,7 @@ static void cros_ec_proto_test_query_all_no_mkbp_return0(struct kunit *test)
 
 	cros_ec_proto_test_query_all_pretest(test);
 	ret = cros_ec_query_all(ec_dev);
-	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, ret, -EPROTO);
 
 	/* For cros_ec_get_proto_info() without passthru. */
 	{
@@ -1113,7 +1116,8 @@ static void cros_ec_proto_test_query_all_no_mkbp_return0(struct kunit *test)
 		data = (struct ec_params_get_cmd_versions *)mock->i_data;
 		KUNIT_EXPECT_EQ(test, data->cmd, EC_CMD_GET_NEXT_EVENT);
 
-		KUNIT_EXPECT_EQ(test, ec_dev->mkbp_event_supported, 0);
+		KUNIT_EXPECT_EQ(test, ec_dev->mkbp_event_supported, 0xbf);
+		KUNIT_EXPECT_EQ(test, ec_dev->proto_version, EC_PROTO_VERSION_UNKNOWN);
 	}
 }
 
@@ -1151,7 +1155,7 @@ static void cros_ec_proto_test_query_all_no_host_sleep(struct kunit *test)
 
 	/* For cros_ec_get_host_command_version_mask() for MKBP. */
 	{
-		mock = cros_kunit_ec_xfer_mock_add(test, 0);
+		mock = cros_kunit_ec_xfer_mock_addx(test, 0, EC_RES_INVALID_COMMAND, 0);
 		KUNIT_ASSERT_PTR_NE(test, mock, NULL);
 	}
 
@@ -1275,7 +1279,7 @@ static void cros_ec_proto_test_query_all_no_host_sleep_return0(struct kunit *tes
 
 	cros_ec_proto_test_query_all_pretest(test);
 	ret = cros_ec_query_all(ec_dev);
-	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, ret, -EPROTO);
 
 	/* For cros_ec_get_proto_info() without passthru. */
 	{
@@ -1326,7 +1330,8 @@ static void cros_ec_proto_test_query_all_no_host_sleep_return0(struct kunit *tes
 				sizeof(struct ec_response_get_cmd_versions));
 		KUNIT_EXPECT_EQ(test, mock->msg.outsize, sizeof(struct ec_params_get_cmd_versions));
 
-		KUNIT_EXPECT_FALSE(test, ec_dev->host_sleep_v1);
+		KUNIT_EXPECT_TRUE(test, ec_dev->host_sleep_v1);
+		KUNIT_EXPECT_EQ(test, ec_dev->proto_version, EC_PROTO_VERSION_UNKNOWN);
 	}
 }
 
@@ -1364,13 +1369,13 @@ static void cros_ec_proto_test_query_all_default_wake_mask_return_error(struct k
 
 	/* For cros_ec_get_host_command_version_mask() for MKBP. */
 	{
-		mock = cros_kunit_ec_xfer_mock_add(test, 0);
+		mock = cros_kunit_ec_xfer_mock_addx(test, 0, EC_RES_INVALID_COMMAND, 0);
 		KUNIT_ASSERT_PTR_NE(test, mock, NULL);
 	}
 
 	/* For cros_ec_get_host_command_version_mask() for host sleep v1. */
 	{
-		mock = cros_kunit_ec_xfer_mock_add(test, 0);
+		mock = cros_kunit_ec_xfer_mock_addx(test, 0, EC_RES_INVALID_COMMAND, 0);
 		KUNIT_ASSERT_PTR_NE(test, mock, NULL);
 	}
 
@@ -1491,13 +1496,13 @@ static void cros_ec_proto_test_query_all_default_wake_mask_return0(struct kunit
 
 	/* For cros_ec_get_host_command_version_mask() for MKBP. */
 	{
-		mock = cros_kunit_ec_xfer_mock_add(test, 0);
+		mock = cros_kunit_ec_xfer_mock_addx(test, 0, EC_RES_INVALID_COMMAND, 0);
 		KUNIT_ASSERT_PTR_NE(test, mock, NULL);
 	}
 
 	/* For cros_ec_get_host_command_version_mask() for host sleep v1. */
 	{
-		mock = cros_kunit_ec_xfer_mock_add(test, 0);
+		mock = cros_kunit_ec_xfer_mock_addx(test, 0, EC_RES_INVALID_COMMAND, 0);
 		KUNIT_ASSERT_PTR_NE(test, mock, NULL);
 	}
 
@@ -1509,7 +1514,7 @@ static void cros_ec_proto_test_query_all_default_wake_mask_return0(struct kunit
 
 	cros_ec_proto_test_query_all_pretest(test);
 	ret = cros_ec_query_all(ec_dev);
-	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, ret, -EPROTO);
 
 	/* For cros_ec_get_proto_info() without passthru. */
 	{
@@ -1563,8 +1568,6 @@ static void cros_ec_proto_test_query_all_default_wake_mask_return0(struct kunit
 
 	/* For get_host_event_wake_mask(). */
 	{
-		u32 mask;
-
 		mock = cros_kunit_ec_xfer_mock_next();
 		KUNIT_EXPECT_PTR_NE(test, mock, NULL);
 
@@ -1573,14 +1576,8 @@ static void cros_ec_proto_test_query_all_default_wake_mask_return0(struct kunit
 		KUNIT_EXPECT_EQ(test, mock->msg.insize, sizeof(struct ec_response_host_event_mask));
 		KUNIT_EXPECT_EQ(test, mock->msg.outsize, 0);
 
-		mask = ec_dev->host_event_wake_mask;
-		KUNIT_EXPECT_EQ(test, mask & EC_HOST_EVENT_MASK(EC_HOST_EVENT_LID_CLOSED), 0);
-		KUNIT_EXPECT_EQ(test, mask & EC_HOST_EVENT_MASK(EC_HOST_EVENT_AC_DISCONNECTED), 0);
-		KUNIT_EXPECT_EQ(test, mask & EC_HOST_EVENT_MASK(EC_HOST_EVENT_BATTERY_LOW), 0);
-		KUNIT_EXPECT_EQ(test, mask & EC_HOST_EVENT_MASK(EC_HOST_EVENT_BATTERY_CRITICAL), 0);
-		KUNIT_EXPECT_EQ(test, mask & EC_HOST_EVENT_MASK(EC_HOST_EVENT_BATTERY), 0);
-		KUNIT_EXPECT_EQ(test, mask & EC_HOST_EVENT_MASK(EC_HOST_EVENT_PD_MCU), 0);
-		KUNIT_EXPECT_EQ(test, mask & EC_HOST_EVENT_MASK(EC_HOST_EVENT_BATTERY_STATUS), 0);
+		KUNIT_EXPECT_EQ(test, ec_dev->host_event_wake_mask, U32_MAX);
+		KUNIT_EXPECT_EQ(test, ec_dev->proto_version, EC_PROTO_VERSION_UNKNOWN);
 	}
 }
 
-- 
2.56.1.831.g720f3f5937-goog

