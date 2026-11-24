Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508487;
	b=T1N3nQUYXISVfXaNQfrje8NROdy3RxQw0fd4o72PKCxe38enCpsO7LaN2w5H/beNZOlf
	 r1qOjriYv/FYxByNrRcuamGblQzNSACLjJftCMSBRRV0uxhGheOyyP7YaCxBlAiJrfifx
	 y4W+Ure8B+ZSCw3pi+E9RGxaVNft50y38JO8PBZHjJbZnXEVUCls9pYIDXZvEEKUMx6Kn
	 A77cVOmeqCBvwlyl8uYBFqio88nlgjgoJbnQ370HP39cCcJl1lHhSubr7U6++zDDcC+JN
	 JSE3OkvFOUo6TXgoWal2UDFY261JuwVEnYg9R8K4gMEpAgn7dCDiM1ULWhjCI/IstFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508487;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=V6NTsuEkbMsN4dXoYw2vTUBKcpKCzy2+Gh/zFuyLLLw=;
	b=ol7B5lF27AeDi7JglelQvZe2FrdLa6tFbqzwit4Sh/RbOpA/6uLp1P0IEclDH3oyJO4l
	 XAusp+DxeiUy0QMtRx0LhdthNa8fjuDJwbptBaJ9llZiiXIdr+eZOx5xhqZjhCeGf6xaW
	 I/a2I22uEq3zGyZw6T9ZYb5Cej/jr8TdwTYLz6X4+7Xx3NkBTg0NpprSqKDLwSRDfVFvo
	 awXCGDBe0DWjP0jXvi6dSVavBir129oV2GlrTzghu0EO0HSqj4oihovAHiqOtAwoVrt26
	 MCm6YrMIisEB2111mf/oN9vskWv4022zfZSHEeOGj8PYXfReUhcJ21g6GVDxYB1pinQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E0+NG5o3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF07606A334
	for <chrome-platform@lists.linux.dev>; Tue, 24 Nov 2026 08:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E0+NG5o3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7615B1F000EC;
	Tue, 24 Nov 2026 08:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795508487;
	bh=V6NTsuEkbMsN4dXoYw2vTUBKcpKCzy2+Gh/zFuyLLLw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=E0+NG5o3BUrK8dAye13ZWfZYlyd69dHQMy9cH7WqStIrp8l/wByResV4kal8bIa79
	 t/sorWLxjJD5m6ErgUw4c8gpNQSdeUp8tIb2axU0/70LtFozhJVKZwp0lqUPQqq3vQ
	 x7CDBbxnxf7eIu17VU93Idmvaynb/R9NgPGGVI93lN5dPxHG6bZ/kam9l4X3tZdHzd
	 xUPlrWFLIcvcfJgjbVRPjVXSa0iuIOgm5Tf6qNQuE7mrh0S0WmpjgOQ5cdwmWAoINg
	 kLFMoOjjL6ekGSTRYF59U48tZt0dma4Or+5Ss1k39NsPTdy5Xs/5Fm+rBdwjIbloiK
	 TSDVsheICSjRA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>
Cc: tzungbi@kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH 3/9] platform/chrome: KUnit: Add tests for retrying commands on -EAGAIN
Date: Tue, 24 Nov 2026 08:21:06 +0000
Message-ID: <20261124082112.3361229-4-tzungbi@kernel.org>
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

Add KUnit test cases to verify cros_ec_send_command() retries when the
underlying transport returns -EAGAIN.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_proto_test.c | 42 ++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
index cbaaf98d6877..ef94bafe93d8 100644
--- a/drivers/platform/chrome/cros_ec_proto_test.c
+++ b/drivers/platform/chrome/cros_ec_proto_test.c
@@ -1744,6 +1744,46 @@ static void cros_ec_proto_test_cmd_xfer_protocol_v2_no_op(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ret, -EIO);
 }
 
+static void cros_ec_proto_test_cmd_xfer_eagain_once(struct kunit *test)
+{
+	struct cros_ec_proto_test_priv *priv = test->priv;
+	struct cros_ec_device *ec_dev = &priv->ec_dev;
+	struct ec_xfer_mock *mock;
+	struct cros_ec_command msg;
+	int ret;
+
+	ec_dev->pkt_xfer = cros_kunit_ec_pkt_xfer_mock;
+	memset(&msg, 0, sizeof(msg));
+
+	{
+		mock = cros_kunit_ec_xfer_mock_addx(test, -EAGAIN, EC_RES_SUCCESS, 0);
+		KUNIT_ASSERT_PTR_NE(test, mock, NULL);
+	}
+
+	ret = cros_ec_cmd_xfer(ec_dev, &msg);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_EQ(test, cros_kunit_ec_pkt_xfer_mock_called, 2);
+}
+
+static void cros_ec_proto_test_cmd_xfer_eagain_exhausted(struct kunit *test)
+{
+	struct cros_ec_proto_test_priv *priv = test->priv;
+	struct cros_ec_device *ec_dev = &priv->ec_dev;
+	struct cros_ec_command msg;
+	int ret;
+
+	ec_dev->pkt_xfer = cros_kunit_ec_pkt_xfer_mock;
+	memset(&msg, 0, sizeof(msg));
+
+	cros_kunit_ec_xfer_mock_default_ret = -EAGAIN;
+
+	ret = cros_ec_cmd_xfer(ec_dev, &msg);
+	KUNIT_EXPECT_EQ(test, ret, -EAGAIN);
+
+	KUNIT_EXPECT_EQ(test, cros_kunit_ec_pkt_xfer_mock_called, 6);
+}
+
 static void cros_ec_proto_test_cmd_xfer_in_progress_payload_0byte(struct kunit *test)
 {
 	struct cros_ec_proto_test_priv *priv = test->priv;
@@ -2853,6 +2893,8 @@ static struct kunit_case cros_ec_proto_test_cases[] = {
 	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_protocol_v3_no_op),
 	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_protocol_v2_normal),
 	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_protocol_v2_no_op),
+	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_eagain_once),
+	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_eagain_exhausted),
 	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_payload_0byte),
 	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_payload_4bytes),
 	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_payload_gt4bytes),
-- 
2.56.1.831.g720f3f5937-goog

