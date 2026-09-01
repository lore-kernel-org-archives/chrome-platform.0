Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA8230E85B
	for <chrome-platform@lists.linux.dev>; Tue,  1 Sep 2026 00:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788223889; cv=none; b=alIrU8FaLIRxEV0w/FdjYVYFfolcjkEN3mAhuvOl+BMx0h3ZeyOgpbFiSCIHNobht25k7GYzIZkRsbNq/I2apLGbG+gZR9z/NRac/Za/6GcCzU28EnqLq8FZbh4tRCjKyqJsb0EzGU+RXGoRiAYsjDKmNRZTztaY/SBxrgo4LCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788223889; c=relaxed/simple;
	bh=sEHl7aUf/ZGWx2/WFt+FKTspaVu4Ji64qoYcp+wBjOc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=M56mIQfdC0F7fGq5p8SOs7iv0dSr8JmBjXONX0otIGL4rP4q2qSZ8q4bdBbWuueAciMHroqweCYKp4zxbYF3rsn6oJBM0OHrVksc+z2uOcKPBKRHMXmBl+fe9Olq33rypKqAKHkR7RCa5YRahE6zxK7IjQszz1vyu4twsBMA9UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--robbarnes.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fEiCq3TR; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--robbarnes.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fEiCq3TR"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so7720229a91.0
        for <chrome-platform@lists.linux.dev>; Mon, 31 Aug 2026 17:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788223887; x=1788828687; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a5KwmvlvBxfFLHfo0JWSgErTakxlty0j7YG0BukEc9w=;
        b=fEiCq3TRRWix7RcP/J/s1Ugs2XXwGIl0ToX7FicF01F6491JfChlGfM3NlV9x6vJZc
         NRkaEoWdhOmYAfuDqHPp52719w0O5yEnaxpW/cZyyPkBvd6FdL4bQ7pmNYCJrd1Hgbtt
         YwgDv3FObY95rHT/Wh547alxUr/d9NxB/ND3ZPW2x2YEQnyB7of/0x9M6qWUQEB59a44
         CO3R9yBBviYwNZNW7ZJ1drJ48Q6eaNCJ+gSNODLRXapprB7q5u4FQmxIWjzHtLLc3bO5
         aZ2A5qwN7Z4df/3SL2+H30DNsmGxGRga0H8Ntacuk53xF9953dXutb8ur84TtZje/cgn
         12ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788223887; x=1788828687;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a5KwmvlvBxfFLHfo0JWSgErTakxlty0j7YG0BukEc9w=;
        b=ibTlf+oiOilDb6RPwzH4o5Hq/hP2VrsfTeW+B1ZFvoIl5NpoWowkSxu96pGMh397b1
         qJyjx2WV1cBfPmi5N+uwkdscM4C/9oq9ytt6M8tuVUgRtprmyNdKw6kutlEMIBt1fv4g
         dftP/AvF6UHqZHCGXVcq30G+msIOAA2LBYyLuny3+74I3GArKe/92VkTuXofobJoSwdq
         KhqPH0n7DJ87J6pglGOtX1Qw4Nlh7M2P78ybzNApG8bIMJ4SzgZoGV4mBjmje7QOJwvH
         1xMMw9Bg2SD5EAC2C+NW4BzBOAGpsl90vMD2eFdqwkOfpKvY3cn9jbjHdhh39AjJ8SXI
         E+lg==
X-Forwarded-Encrypted: i=1; AKwUvBytI/FoLUC5f/kLDDmZ2YCQm6mMAYfBzFZhiz6xAqxPESkfHLjIqP+Il1bkdwpmo26gWkfQJ/WxC+WH3Ox/AaI=@lists.linux.dev
X-Gm-Message-State: AFuF++niARvs2KvqdqVcN5BS32Acx3/T2/jZe7VmD/pxD460eM6RfEFC
	54RX1CAM/E4nGvs/hpLyomU17Q68fV1BAmlu3oN2QqAIiGjdk+mTefjwPOVJmlO8sAwUMWKD749
	7tkR2jR9yfPMIPE6Z0A==
X-Received: from dlae16.prod.google.com ([2002:a05:701b:2310:b0:13b:9a32:b2d])
 (user=robbarnes job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1a85:b0:398:a2ed:7b5c with SMTP id 98e67ed59e1d1-39907f04d76mr4587104a91.24.1788223886704;
 Mon, 31 Aug 2026 17:51:26 -0700 (PDT)
Date: Mon, 31 Aug 2026 18:51:26 -0600
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260901005126.3344929-1-robbarnes@google.com>
Subject: [PATCH v5] platform/chrome: cros_ec_proto: Fix deferred response
From: Rob Barnes <robbarnes@google.com>
To: bleung@chromium.org, tzungbi@kernel.org
Cc: tomhughes@chromium.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Rob Barnes <robbarnes@google.com>
Content-Type: text/plain; charset="UTF-8"

When cros_ec_wait_until_complete() succeeds after an
EC_RES_IN_PROGRESS status, it previously returned the 4-byte
transfer size of EC_CMD_GET_COMMS_STATUS. For 0-byte payload
commands (such as EC_CMD_FLASH_ERASE), userspace received 4
bytes instead of 0, causing response size validation errors.
For commands expecting non-zero response payloads, the kernel
exited without issuing EC_CMD_RESEND_RESPONSE, leaving response
buffers uninitialized.

Refactor cros_ec_wait_until_complete() to pass orig_msg, issue
EC_CMD_RESEND_RESPONSE into orig_msg->data when insize > 0, and
return 0 for 0-byte response commands.

Signed-off-by: Rob Barnes <robbarnes@google.com>
---
v5:
- In KUnit tests, set ec_dev->max_response before transfer and drop msg->outsize in payload_4bytes test (Tzung-Bi).

v4:
- Rebase against upstream chrome-platform/for-next branch (Tzung-Bi).
- Send patch using git-send-email via Google Mail Relay to prevent MTA line-wrapping (Tzung-Bi).

v3:
- Rebase against upstream chrome-platform tree (Tzung-Bi).

v2:
- Drop redundant commit description sentences (Tzung-Bi).
- Align function signature parameters to open parenthesis (Tzung-Bi).
- Check orig_msg->insize == 0 and add comments explaining the logic (Tzung-Bi / Rob).
- Use u32 instead of uint32_t (Tzung-Bi).
- Rename 0bytes test to 0byte (Tzung-Bi).
- Check header immutability for insize in test cases (Tzung-Bi).
---
 drivers/platform/chrome/cros_ec_proto.c      |  32 +++-
 drivers/platform/chrome/cros_ec_proto_test.c | 158 ++++++++++++++++++-
 2 files changed, 183 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 1d8d9168ec1a..6d7c57e381e5 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -138,7 +138,8 @@ static int cros_ec_xfer_command(struct cros_ec_device *ec_dev, struct cros_ec_co
 	return ret;
 }
 
-static int cros_ec_wait_until_complete(struct cros_ec_device *ec_dev, uint32_t *result)
+static int cros_ec_wait_until_complete(struct cros_ec_device *ec_dev,
+				       struct cros_ec_command *orig_msg)
 {
 	DEFINE_RAW_FLEX(struct cros_ec_command, msg, data,
 			sizeof(struct ec_response_get_comms_status));
@@ -161,7 +162,7 @@ static int cros_ec_wait_until_complete(struct cros_ec_device *ec_dev, uint32_t *
 		if (ret < 0)
 			return ret;
 
-		*result = msg->result;
+		orig_msg->result = msg->result;
 		if (msg->result != EC_RES_SUCCESS)
 			return ret;
 
@@ -170,8 +171,31 @@ static int cros_ec_wait_until_complete(struct cros_ec_device *ec_dev, uint32_t *
 			break;
 		}
 
-		if (!(status->flags & EC_COMMS_STATUS_PROCESSING))
+		if (!(status->flags & EC_COMMS_STATUS_PROCESSING)) {
+			u32 orig_cmd, orig_outsize, orig_version;
+
+			/* If no response payload is expected, return 0. */
+			if (orig_msg->insize == 0)
+				return 0;
+
+			/*
+			 * Request the response using EC_CMD_RESEND_RESPONSE.
+			 * Restore the original message fields so it appears
+			 * to be a direct response to the original command.
+			 */
+			orig_cmd = orig_msg->command;
+			orig_outsize = orig_msg->outsize;
+			orig_version = orig_msg->version;
+
+			orig_msg->command = EC_CMD_RESEND_RESPONSE;
+			orig_msg->outsize = 0;
+			orig_msg->version = 0;
+			ret = cros_ec_xfer_command(ec_dev, orig_msg);
+			orig_msg->command = orig_cmd;
+			orig_msg->outsize = orig_outsize;
+			orig_msg->version = orig_version;
 			return ret;
+		}
 	}
 
 	if (i >= EC_COMMAND_RETRIES)
@@ -185,7 +209,7 @@ static int cros_ec_send_command(struct cros_ec_device *ec_dev, struct cros_ec_co
 	int ret = cros_ec_xfer_command(ec_dev, msg);
 
 	if (msg->result == EC_RES_IN_PROGRESS)
-		ret = cros_ec_wait_until_complete(ec_dev, &msg->result);
+		ret = cros_ec_wait_until_complete(ec_dev, msg);
 
 	return ret;
 }
diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
index 3f281996a686..cbaaf98d6877 100644
--- a/drivers/platform/chrome/cros_ec_proto_test.c
+++ b/drivers/platform/chrome/cros_ec_proto_test.c
@@ -1744,7 +1744,7 @@ static void cros_ec_proto_test_cmd_xfer_protocol_v2_no_op(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ret, -EIO);
 }
 
-static void cros_ec_proto_test_cmd_xfer_in_progress_normal(struct kunit *test)
+static void cros_ec_proto_test_cmd_xfer_in_progress_payload_0byte(struct kunit *test)
 {
 	struct cros_ec_proto_test_priv *priv = test->priv;
 	struct cros_ec_device *ec_dev = &priv->ec_dev;
@@ -1774,7 +1774,7 @@ static void cros_ec_proto_test_cmd_xfer_in_progress_normal(struct kunit *test)
 	}
 
 	ret = cros_ec_cmd_xfer(ec_dev, &msg);
-	KUNIT_EXPECT_EQ(test, ret, sizeof(struct ec_response_get_comms_status));
+	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	KUNIT_EXPECT_EQ(test, msg.result, EC_RES_SUCCESS);
 
@@ -1799,6 +1799,156 @@ static void cros_ec_proto_test_cmd_xfer_in_progress_normal(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, cros_kunit_ec_pkt_xfer_mock_called, 2);
 }
 
+static void cros_ec_proto_test_cmd_xfer_in_progress_payload_4bytes(struct kunit *test)
+{
+	struct cros_ec_proto_test_priv *priv = test->priv;
+	struct cros_ec_device *ec_dev = &priv->ec_dev;
+	struct ec_xfer_mock *mock;
+	u8 resp_data[4] = {0x11, 0x22, 0x33, 0x44};
+	struct {
+		struct cros_ec_command msg;
+		u8 data[4];
+	} buf;
+	struct cros_ec_command *msg = &buf.msg;
+	int ret;
+
+	memset(&buf, 0, sizeof(buf));
+	msg->version = 1;
+	msg->command = 0x1234;
+	msg->insize = sizeof(buf.data);
+
+	ec_dev->max_response = sizeof(buf.data);
+	ec_dev->pkt_xfer = cros_kunit_ec_pkt_xfer_mock;
+
+	/* For initial command returning EC_RES_IN_PROGRESS. */
+	{
+		mock = cros_kunit_ec_xfer_mock_addx(test, 0, EC_RES_IN_PROGRESS, 0);
+		KUNIT_ASSERT_PTR_NE(test, mock, NULL);
+	}
+
+	/* For EC_CMD_GET_COMMS_STATUS status polling. */
+	{
+		struct ec_response_get_comms_status *data;
+
+		mock = cros_kunit_ec_xfer_mock_add(test, sizeof(*data));
+		KUNIT_ASSERT_PTR_NE(test, mock, NULL);
+
+		data = (struct ec_response_get_comms_status *)mock->o_data;
+		data->flags = 0;
+	}
+
+	/* For EC_CMD_RESEND_RESPONSE returning 4 bytes payload. */
+	{
+		mock = cros_kunit_ec_xfer_mock_add(test, sizeof(resp_data));
+		KUNIT_ASSERT_PTR_NE(test, mock, NULL);
+		memcpy(mock->o_data, resp_data, sizeof(resp_data));
+	}
+
+	ret = cros_ec_cmd_xfer(ec_dev, msg);
+	KUNIT_EXPECT_EQ(test, ret, 4);
+	KUNIT_EXPECT_EQ(test, msg->result, EC_RES_SUCCESS);
+	KUNIT_EXPECT_EQ(test, msg->command, 0x1234);
+	KUNIT_EXPECT_EQ(test, msg->insize, sizeof(buf.data));
+	KUNIT_EXPECT_EQ(test, msg->version, 1);
+	KUNIT_EXPECT_EQ(test, memcmp(msg->data, resp_data, sizeof(resp_data)), 0);
+
+	/* Verify mock sequence */
+	{
+		mock = cros_kunit_ec_xfer_mock_next();
+		KUNIT_EXPECT_PTR_NE(test, mock, NULL);
+
+		mock = cros_kunit_ec_xfer_mock_next();
+		KUNIT_EXPECT_PTR_NE(test, mock, NULL);
+		KUNIT_EXPECT_EQ(test, mock->msg.command, EC_CMD_GET_COMMS_STATUS);
+
+		mock = cros_kunit_ec_xfer_mock_next();
+		KUNIT_EXPECT_PTR_NE(test, mock, NULL);
+		KUNIT_EXPECT_EQ(test, mock->msg.command, EC_CMD_RESEND_RESPONSE);
+		KUNIT_EXPECT_EQ(test, mock->msg.outsize, 0);
+		KUNIT_EXPECT_EQ(test, mock->msg.version, 0);
+		KUNIT_EXPECT_EQ(test, mock->msg.insize, 4);
+	}
+
+	KUNIT_EXPECT_EQ(test, cros_kunit_ec_pkt_xfer_mock_called, 3);
+}
+
+static void cros_ec_proto_test_cmd_xfer_in_progress_payload_gt4bytes(struct kunit *test)
+{
+	struct cros_ec_proto_test_priv *priv = test->priv;
+	struct cros_ec_device *ec_dev = &priv->ec_dev;
+	struct ec_xfer_mock *mock;
+	u8 resp_data[16];
+	struct {
+		struct cros_ec_command msg;
+		u8 data[16];
+	} buf;
+	struct cros_ec_command *msg = &buf.msg;
+	int ret, i;
+
+	for (i = 0; i < sizeof(resp_data); ++i)
+		resp_data[i] = (u8)(i + 1);
+
+	memset(&buf, 0, sizeof(buf));
+	msg->version = 0;
+	msg->command = 0x5678;
+	msg->insize = sizeof(buf.data);
+
+	ec_dev->max_response = sizeof(buf.data);
+	ec_dev->pkt_xfer = cros_kunit_ec_pkt_xfer_mock;
+
+	/* For initial command returning EC_RES_IN_PROGRESS. */
+	{
+		mock = cros_kunit_ec_xfer_mock_addx(test, 0, EC_RES_IN_PROGRESS, 0);
+		KUNIT_ASSERT_PTR_NE(test, mock, NULL);
+	}
+
+	/* For EC_CMD_GET_COMMS_STATUS status polling. */
+	{
+		struct ec_response_get_comms_status *data;
+
+		mock = cros_kunit_ec_xfer_mock_add(test, sizeof(*data));
+		KUNIT_ASSERT_PTR_NE(test, mock, NULL);
+
+		data = (struct ec_response_get_comms_status *)mock->o_data;
+		data->flags = 0;
+	}
+
+	/* For EC_CMD_RESEND_RESPONSE returning 16 bytes payload. */
+	{
+		mock = cros_kunit_ec_xfer_mock_add(test, sizeof(resp_data));
+		KUNIT_ASSERT_PTR_NE(test, mock, NULL);
+		memcpy(mock->o_data, resp_data, sizeof(resp_data));
+	}
+
+	ret = cros_ec_cmd_xfer(ec_dev, msg);
+	KUNIT_EXPECT_EQ(test, ret, 16);
+	KUNIT_EXPECT_EQ(test, msg->result, EC_RES_SUCCESS);
+	KUNIT_EXPECT_EQ(test, msg->command, 0x5678);
+	KUNIT_EXPECT_EQ(test, msg->outsize, 0);
+	KUNIT_EXPECT_EQ(test, msg->insize, sizeof(buf.data));
+	KUNIT_EXPECT_EQ(test, msg->version, 0);
+	KUNIT_EXPECT_EQ(test, memcmp(msg->data, resp_data, sizeof(resp_data)), 0);
+
+	/* Verify mock sequence */
+	{
+		mock = cros_kunit_ec_xfer_mock_next();
+		KUNIT_EXPECT_PTR_NE(test, mock, NULL);
+
+		mock = cros_kunit_ec_xfer_mock_next();
+		KUNIT_EXPECT_PTR_NE(test, mock, NULL);
+		KUNIT_EXPECT_EQ(test, mock->msg.command, EC_CMD_GET_COMMS_STATUS);
+
+		mock = cros_kunit_ec_xfer_mock_next();
+		KUNIT_EXPECT_PTR_NE(test, mock, NULL);
+		KUNIT_EXPECT_EQ(test, mock->msg.command, EC_CMD_RESEND_RESPONSE);
+		KUNIT_EXPECT_EQ(test, mock->msg.outsize, 0);
+		KUNIT_EXPECT_EQ(test, mock->msg.version, 0);
+		KUNIT_EXPECT_EQ(test, mock->msg.insize, 16);
+	}
+
+	KUNIT_EXPECT_EQ(test, cros_kunit_ec_pkt_xfer_mock_called, 3);
+}
+
 static void cros_ec_proto_test_cmd_xfer_in_progress_retries_eagain(struct kunit *test)
 {
 	struct cros_ec_proto_test_priv *priv = test->priv;
@@ -2703,7 +2853,9 @@ static struct kunit_case cros_ec_proto_test_cases[] = {
 	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_protocol_v3_no_op),
 	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_protocol_v2_normal),
 	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_protocol_v2_no_op),
-	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_normal),
+	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_payload_0byte),
+	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_payload_4bytes),
+	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_payload_gt4bytes),
 	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_retries_eagain),
 	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_retries_status_processing),
 	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_xfer_error),
-- 
2.55.0.966.g6673acef38-goog

