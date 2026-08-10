Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73439264614
	for <chrome-platform@lists.linux.dev>; Mon, 10 Aug 2026 21:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786398214; cv=pass; b=vAjOjG1aZXYiU/K7ArlSGM1A9T7NEtDUNfS78Nd6HQ9KdjCZC83VB+B2bDcjVf37RX9ArtOsBeov4ljueqGrrC6J13C+EiOtbhWc3oS7Sksig2gFN3qqP4eITGcAODN9X8qyP7FSeu0DK+uKt8xFVs6wvQ9tUI4kdLw8YQQuSx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786398214; c=relaxed/simple;
	bh=iqjKdojbjbodxxgb+n9rGN+o3qDP32daF85ZK8aHiuc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=H7ZhcA7M5wSdFAkOApT/vY915YGhPezgvUR9mn7AgAeL/RUyGj0ynYWxgiGIARU3JZkAGoX3Kufa7IdNXPGIqiv3cNnxOvvEtXObAQcTZQHBr/PdC0UClMVdwErVkeGxVAKEvjhmfwtjd62wD07Y8xZzhNzCpOoUm5oWWWilN98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Nyjdio0h; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Nyjdio0h"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8200ca16f26so3169187b3.3
        for <chrome-platform@lists.linux.dev>; Mon, 10 Aug 2026 14:43:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786398211; cv=none;
        d=google.com; s=arc-20260327;
        b=f583tr3+JSetS/YTZYWMkqyXHy/BzZ+mqsVlBKu+eYLed8knt45CUMvMcTuo1mDfWC
         Y33NJPf0s4oKsrmtuhl/ktoAizSmNBONczDpyn/T+aVS4WaC4YNKHkm41j688VmxIghZ
         Qnp7gC49lG6ihf7iN5WrtkNVA0suoSMCPn/5H/oFEUnByst3EuHK6B1H5CbIKHK0GEMu
         cbZg/dBJSIjkrVaqpfkiocGsOVi4TZrEbA3Bc71Fk2P9cocYfjEGRPR1lc8cxT8Ct/5T
         wbI0ti3z5OoCPyUGBAbCkT+p5seCl7ma9GcuajVrhctvX3XUslp3UAg644PvDfNCd5uD
         9Ewg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=vfZgMXf01YyWza/w6XDTTEtLAovPsjMZYssSpcNLn4E=;
        fh=HLmfswzN2r30q+fLMZr+0DA8Ofpn+Cgw5/9KhAMnM8E=;
        b=dw+ZDueDjlc70wHMQ2MdZ6dPGBLJh0pwBEvj3yUHkH4xZqQQxoYoebxA1iw01wRdZU
         sAK0C2Q+4YGL4hoz+lRhdaPKZpZ3YPOIxC9LsMuL/Ag4ImE5AZLYK0L9LT+Iqx29C/k4
         wNBEEy2mD4wz68/qVkPx55ycu+T1E54C5bzkMakf4kHOOkMNp8ube4GwFr4L3XqLCOL2
         nnWr3xLd1f9grvTkFfrHBp6E2iCr96KmwlkDxJU0T8CRDBqu8A9S+iGCj0xqPNrzc+XS
         WtLGiiODLceyqBxPu4jljoVzykqBE4QL/JyJOGw/Lq4U+kPOcCiFO9XDLrRiXFxURN9l
         KBvA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786398211; x=1787003011; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vfZgMXf01YyWza/w6XDTTEtLAovPsjMZYssSpcNLn4E=;
        b=Nyjdio0huDpp90OwHxTF5jcSxYtZni5imqUSUF/3m4SdrGu8ZngF5Fm+0HX+ePkD/m
         jX613qbgCO3OrHtKJR7Q5Vx+3KV0u7C7Hov7l8Zos5f2vyf3KzCSjEbJ0G8TW4YrjyXf
         hD8qHIsDfGUipw8vOc2vUgPVGgP+LkPxwrgzdp3SSe/OfyaIHX1pJlzHOoctUQ3e7n4M
         i4trb5cx9myIIviNok5NKt5gUTVfJvKo1e1iItKgltdNG02g3Cp7YVm8bmCsXalCw47z
         PdBc1PhQwHL+t3jlf05OE8zr9he8260YujYQzjw/3nrQ92tp+B7Q1ftzQ+0ZavMdgxRc
         2i4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786398211; x=1787003011;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vfZgMXf01YyWza/w6XDTTEtLAovPsjMZYssSpcNLn4E=;
        b=TL1mNZVnzLL+3mcLF48r86iaxLo4dmXKM/2S6MXJBKfBrBgZ1zsIgnyGV4yAqvNNhB
         21JSqxaCXfN0s8XM0NU+fjJtXfO/rPeM0EjwaV21TLX+fpmpNZhKkOLy36xztSFVYgfj
         kpeXaC5ztu2riY5C72/sQdQAwEzLb7KrCKAXEajEfLAlFzLpqMB1SIMEbAxyiJO1ZxXn
         rCqwsDcliWJ7fPZ4/B8+2A+FaqDADIsN/ZuERTLTtkmZlctXPWo5lnXDWWJJ8owgVAy0
         GLZRrk/Fu1DB7ZKwPYdh7RyzBHvxwk0nBdbQiMOFrekIRXkIocN+2M2GCZAB4VL9U/K1
         ILwQ==
X-Forwarded-Encrypted: i=1; AHgh+Rob7IM0QNIcRg+0941MDhyUDZDo4x0lnm/uChY5QwF8GJDhBlZCQbSddiZ++E5IZ7zGhpwgys4IwPGZoJBXr/M=@lists.linux.dev
X-Gm-Message-State: AOJu0YyIZTvPFEjcvc3QWYAoDwU7HXRHhR/5Rx1qvAsqw2V/yQ3eTa+i
	ddigw6HndgfoQGftOLSaw4zq+qfPxuyDccIcvQy/qqRw9JkzZxP2dqm+gree4/vpImi/0wJjxuN
	m2zfkxtYg0cj0YIYkWJCFCxvsT1VMOJEhHjrkmBfX
X-Gm-Gg: AR+sD12qGLuO0RMNmc2PNlnB84WdBoLGWnOmbzqInS4T7oZ02v3yAX4L69oNMNUetF5
	lPdjm22amqZxXNMlMkH+l9jOxrJAaojby4LET868h22AepuNO8WSzCjP7eGv9QDT5AOPIQpdQjQ
	eKQCQysRMUkNioZbSnyvryMlIndT0YBrFfbBtck6H1ak0U/0tiXot//LqGBZh9Plv51UTjp9j4a
	vVZZfefdl4NmIsDjgntukxrzVTQeBOa88SBaPpwtDkAUzs60Q0OJpiZePmuj7Mit+nkHlhMH9OR
	zt3pT24e9VxtTH1nZYlmwG6Sl+Xl1t9j0PqYdoPm8GiQIXEtOa6Avv2KcrSlOAzYrnRkfkP4CDX
	BFynePydnuT58yuTGflXX2BVYDSGx
X-Received: by 2002:a05:690c:9208:b0:825:6420:565d with SMTP id
 00721157ae682-8256420a92bmr123908127b3.18.1786398210569; Mon, 10 Aug 2026
 14:43:30 -0700 (PDT)
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 14:43:29 -0700
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 14:43:29 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Rob Barnes <robbarnes@google.com>
Date: Mon, 10 Aug 2026 14:43:29 -0700
X-Gm-Features: AUfX_mzWWrmycO0IHK1zFyBoKOAF2yQMJEyY9CyRSxFy2vi73KL7wLiw91oAfHc
Message-ID: <CA+Dqm33ZN1aaL8ZH4SkbOhhmzGEbKSYwcSxEnS4ByiOt7uVN=w@mail.gmail.com>
Subject: [PATCH] platform/chrome: cros_ec_proto: Fix deferred response payload handling
To: bleung@chromium.org, tzungbi@kernel.org
Cc: tomhughes@chromium.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Rob Barnes <robbarnes@google.com>
Subject: [PATCH] platform/chrome: cros_ec_proto: Fix deferred response
payload handling

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
return 0 for 0-byte response commands. Save and restore orig_msg
fields (command, outsize, version) around the resend request to
prevent unintended caller struct mutations. Update existing KUnit
tests and add test cases for 4-byte and 16-byte response
payloads.

Signed-off-by: Rob Barnes <robbarnes@google.com>
---
 drivers/platform/chrome/cros_ec_proto.c      |  25 ++-
 drivers/platform/chrome/cros_ec_proto_test.c | 151 +++++++++++++++++-
 2 files changed, 168 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c
b/drivers/platform/chrome/cros_ec_proto.c
index a655322b599e..45d6e9bce746 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -147,7 +147,7 @@ static int prepare_tx_legacy(struct cros_ec_device *ec_dev,
 	return EC_MSG_TX_PROTO_BYTES + msg->outsize;
 }

-static int cros_ec_wait_until_complete(struct cros_ec_device *ec_dev,
uint32_t *result)
+static int cros_ec_wait_until_complete(struct cros_ec_device *ec_dev,
+					struct cros_ec_command *orig_msg)
 {
 	struct {
 		struct cros_ec_command msg;
@@ -162,7 +162,7 @@ static int cros_ec_wait_until_complete(struct
cros_ec_device *ec_dev, uint32_t *
 		if (ret < 0)
 			return ret;

-		*result = msg->result;
+		orig_msg->result = msg->result;
 		if (msg->result != EC_RES_SUCCESS)
 			return ret;

@@ -170,8 +170,28 @@ static int cros_ec_wait_until_complete(struct
cros_ec_device *ec_dev, uint32_t *
 			break;
 		}

-		if (!(status->flags & EC_COMMS_STATUS_PROCESSING))
-			return ret;
+		if (!(status->flags & EC_COMMS_STATUS_PROCESSING)) {
+			/*
+			 * If original command requested response payload, retrieve it via
+			 * EC_CMD_RESEND_RESPONSE into orig_msg->data. Otherwise return 0
+			 * for zero-payload commands.
+			 */
+			if (orig_msg->insize > 0) {
+				uint32_t orig_cmd = orig_msg->command;
+				uint32_t orig_outsize = orig_msg->outsize;
+				uint32_t orig_version = orig_msg->version;
+
+				orig_msg->command = EC_CMD_RESEND_RESPONSE;
+				orig_msg->outsize = 0;
+				orig_msg->version = 0;
+				ret = cros_ec_xfer_command(ec_dev, orig_msg);
+				orig_msg->command = orig_cmd;
+				orig_msg->outsize = orig_outsize;
+				orig_msg->version = orig_version;
+				return ret;
+			}
+			return 0;
+		}
 	}

 	if (i >= EC_COMMAND_RETRIES)
@@ -185,7 +205,7 @@ static int cros_ec_send_command(struct
cros_ec_device *ec_dev, struct cros_ec_co
 	int ret = cros_ec_xfer_command(ec_dev, msg);

 	if (msg->result == EC_RES_IN_PROGRESS)
-		ret = cros_ec_wait_until_complete(ec_dev, &msg->result);
+		ret = cros_ec_wait_until_complete(ec_dev, msg);

 	return ret;
 }
diff --git a/drivers/platform/chrome/cros_ec_proto_test.c
b/drivers/platform/chrome/cros_ec_proto_test.c
index 63e38671e95a..609ac8c5108f 100644
--- a/drivers/platform/chrome/cros_ec_proto_test.c
+++ b/drivers/platform/chrome/cros_ec_proto_test.c
@@ -1756,7 +1756,7 @@ static void
cros_ec_proto_test_cmd_xfer_protocol_v2_no_op(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ret, -EIO);
 }

-static void cros_ec_proto_test_cmd_xfer_in_progress_normal(struct kunit *test)
+static void cros_ec_proto_test_cmd_xfer_in_progress_payload_0bytes(struct
kunit *test)
 {
 	struct cros_ec_proto_test_priv *priv = test->priv;
 	struct cros_ec_device *ec_dev = &priv->ec_dev;
@@ -1786,7 +1786,7 @@ static void
cros_ec_proto_test_cmd_xfer_in_progress_normal(struct kunit *test)
 	}

 	ret = cros_ec_cmd_xfer(ec_dev, &msg);
-	KUNIT_EXPECT_EQ(test, ret, sizeof(struct ec_response_get_comms_status));
+	KUNIT_EXPECT_EQ(test, ret, 0);

 	KUNIT_EXPECT_EQ(test, msg.result, EC_RES_SUCCESS);

@@ -1811,6 +1811,149 @@ static void
cros_ec_proto_test_cmd_xfer_in_progress_normal(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, cros_kunit_ec_pkt_xfer_mock_called, 2);
 }

+static void cros_ec_proto_test_cmd_xfer_in_progress_payload_4bytes(struct
kunit *test)
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
+	msg->outsize = 2;
+	msg->insize = sizeof(buf.data);
+
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
+	KUNIT_EXPECT_EQ(test, msg->outsize, 2);
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
+static void cros_ec_proto_test_cmd_xfer_in_progress_payload_gt4bytes(struct
kunit *test)
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
+		KUNIT_EXPECT_EQ(test, mock->msg.insize, 16);
+	}
+
+	KUNIT_EXPECT_EQ(test, cros_kunit_ec_pkt_xfer_mock_called, 3);
+}
+
 static void cros_ec_proto_test_cmd_xfer_in_progress_retries_eagain(struct
kunit *test)
 {
 	struct cros_ec_proto_test_priv *priv = test->priv;
@@ -2715,7 +2858,9 @@ static struct kunit_case cros_ec_proto_test_cases[] = {
 	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_protocol_v3_no_op),
 	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_protocol_v2_normal),
 	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_protocol_v2_no_op),
-	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_normal),
+	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_payload_0bytes),
+	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_payload_4bytes),
+	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_payload_gt4bytes),
 	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_retries_eagain),
 	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_retries_status_processing),
 	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_xfer_error),
-- 
2.45.0
