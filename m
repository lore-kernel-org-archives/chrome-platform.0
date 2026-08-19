Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D3D378822
	for <chrome-platform@lists.linux.dev>; Wed, 19 Aug 2026 21:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787174294; cv=pass; b=AwjoiMdZH6Cp75bRhdEBWeOwxu16bgVT1C56hG2Rg65aES9EeRUhnTEKeKVnfZZeI3mav0dIIs5gUGIb33bJ+SKeSjXhBYxKPm+05kenkYhAnU8E/YYj/vLlVg1yMCvmlDIRE0uFV2Bf8I+C0ejSM4gCjAo8qB5ftiFxlrIpxwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787174294; c=relaxed/simple;
	bh=hXSgcgDZEv2kIoxvxHt6gmONMXSDzPHmMPMUoMed8Cg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=kI0hml++ul52w+w1H7aWTwAnszrPUDEZSm6Tfl/yG0Z/bzt/nxdUXD2sRAClVw/vIyNPbhlS4BnzQIiBz6sDtE9Szs7eDWSxjnk2yjAaoHwxvqwvuZlO7cl3RyTBQJ5CCO3RQ0JmfthfCKH7zlVaySPSRTKcB8AQ6MY2rJn/+Ks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ah1kAAM4; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ah1kAAM4"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-81ea0b7d137so16035517b3.2
        for <chrome-platform@lists.linux.dev>; Wed, 19 Aug 2026 14:18:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787174290; cv=none;
        d=google.com; s=arc-20260327;
        b=i4eWdaG9ThuwYjDkSHpfeo4CTBfGAxF+K4DXOFL0hsjG9gEiCD6hp59LU07rSnxOqz
         pJ7I7409aJ9JckVdM6y00vLxpwxY2p3FwtH7Wasw29TdcqI+m/NHhL0xaSwReduunS4U
         RjUX9VaLjUNFipu5mhpu1YcKi+DgowmT9tQCsGCHArAWMTW8prgg/vt6PI9o2y4HYPm2
         qjPkogAs5cZLxGICjYVZDm0bVV+mL9iJcEFfem+6JMZ6W7EiKJLDSKzleoKTvEQDN2C5
         8lXjX5o8gso9Xtx5afB88d/O49oIUFbCZGhc3EthgTWCamMr86niserST/tHEPPao3M5
         dipg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=d5/gucuNn2go6xU3ZfzWk7p0n8GXQyENd162Oletwcs=;
        fh=PxOzvvyqtqM/MSTETquRi3bzDMncGIVdZEoZUTw0PuU=;
        b=nC+aAYm7oczoxZ/wr++zyqBFNpghA7WGS1LV6LaEsYLMftANumknSbOkNTTqtA2ALB
         ks1F4j+V50RiWXUZdQyb5xz6QTHawJfm3YljFsE+bC2fj9iH/kTVtvFm672AeP3Zk6Ie
         iUiSI1itDWOnmbnQ4yFNkHx4J3mGc8+u6pbrp73h7B6q5s9eEMUInvCQ3JAp8O5mpQQR
         EQlaP+TjNPRTBwtCxAs5eRUWn0QvXWgb5JxfbPQ6COZQpMdJABr6uQEHXQP8OBsRcnWN
         Mz6iwzVLt7u79KBiFX7GwBeUSgEkWR53qY3t23J7Z4TIt9tl8UF01RU4VjdfYks9C5zP
         1ElQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787174290; x=1787779090; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d5/gucuNn2go6xU3ZfzWk7p0n8GXQyENd162Oletwcs=;
        b=Ah1kAAM4ABx53uuP669NsOXrTVp+ilte7CuwXC0UNd7PqxywbjbNCzJTMBEj+oy5s3
         ZAQC17Qvdpx4H0AZqhlXII2RS+4HFdgeazufShkzCyHip7V17JV5Qpx2HGYd/18by9vn
         oMrCWgwJg7LT4xNV0JmQHp0RPCWJZAtamaANPp8eppTJ7g/IlvKGGiv+m+VfeeRfromp
         MRcI+EwcxMPrkRoFSmdxoAZZ30WtsWfznAW8N49XquRWaefZbdC1rkw5605Sk8q3eF6Y
         1qtdQaOe+hCjBOWWWyvqPZqQmnT2yVp9wUiALxjTUf4tbs2hy+cA/c5qQe76QnPGjShj
         50LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787174290; x=1787779090;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d5/gucuNn2go6xU3ZfzWk7p0n8GXQyENd162Oletwcs=;
        b=OF02YcV27Xiept7/thil6NSt0fnrcqZtoqhDKatVzvIlNLe0fQPpj1fuvprJp2W/V5
         FswWoilKm8i+WDp/hb+LfwBmVgmkok5OdAcJBo2sIeD9iasHzxIaUAlcb3jb+cFkYluM
         m2/QGU7BzaaCF/KaasBvWa2/EQ+qAg2BiPaPkgRzq//2yJzr6cb1+/Sez3KZV1/KX9tl
         qtE/M5qkNVezPrYgzx0bepzuqJH45r4M7djXgJ5qkgay52f19XX3ypG08iFaTpbf6jwn
         pFL9gxG1lh9ijRkcRUm12UJU8EvmhPmdiXHtEYZ6JfW2HMLjfol9AF5qTkCdv8yGqmwj
         NGfw==
X-Forwarded-Encrypted: i=1; AHgh+RqX2yPI7fMjFBiyhuef9S0fKWmmArwmMqK2GYrTcyeeBN+2C+4uublwQ6kuv+GywZWcoVbwPxZ0WeLjd8Rv6kc=@lists.linux.dev
X-Gm-Message-State: AFuF++nH6NGLRbQVBbcX2lia3+lqbV4xkkk0x1f4eGZjpmz2uCraisZP
	+9Xk5MG7oy7+k+RoG1/LTchFko3YSYNSCnxYt/mUGoa2OF7L/6k4Z2dqj6t03EaHokWDGHYzXhS
	h/cSDiepdEcjSnitvVnOjinm0Tsb2eizsjOLe2zO4
X-Gm-Gg: AR+sD12Ww8My9906JCI9uB2pzJXbd601pnwQzpOmV1MTWAwRWTrb+fnScRx7mplHcK3
	PRDH2y6Ddt39xnbGP/1HH6ZP7BdzF+QGpQyBpFugruO93nHO29umg8UBKpE/ywbXS+u7zB67+WP
	QbjPil2WL4iQISNqhKHcTiOxuHwOIOMU3jmJv6H/6VflYBHjSiGsFHYtgNZyzsDIH2534dJSGTQ
	3X1+GknhPIMNuR3oJgqqqtfJrrU7PhhgmtAFX2u+xoXJ3CgsLfl2oO/UyNLByPCcrMtFo9f142c
	0leWnB47WujZ3LXE3MrX+vw6/OsiCrqRUZXeJdkEy3q+Qq4jSdVQ73T2/i1iFrar4NbzjOD0B+a
	mPqcuDd/T4QISy9isiwTiM2bxSCg5
X-Received: by 2002:a05:690c:7107:b0:80c:5cfa:34bc with SMTP id
 00721157ae682-844dff16360mr36206207b3.11.1787174288732; Wed, 19 Aug 2026
 14:18:08 -0700 (PDT)
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 19 Aug 2026 14:18:07 -0700
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 19 Aug 2026 14:18:07 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Rob Barnes <robbarnes@google.com>
Date: Wed, 19 Aug 2026 14:18:07 -0700
X-Gm-Features: AcwNN1VmKNEcux0JFgEK3kh9naLcr-GDtwD2UA9toUWhBvGm0Img9SdPjFMqptM
Message-ID: <CA+Dqm33C4x5jkDGzxwy-Poz-u135AJEh9PKCgBRvFMSz=M2AJg@mail.gmail.com>
Subject: [PATCH v3] platform/chrome: cros_ec_proto: Fix deferred response
To: bleung@chromium.org, tzungbi@kernel.org
Cc: tomhughes@chromium.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
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
v3:
- Rebase against upstream chrome-platform/for-firmware-next tree (Tzung-Bi).
- Fix MIME/email transport line-wrapping and formatting issues (Tzung-Bi).

v2:
- Drop redundant commit description sentences (Tzung-Bi).
- Align function signature parameters to open parenthesis (Tzung-Bi).
- Check orig_msg->insize == 0 and add comments explaining the logic
(Tzung-Bi / Rob).
- Use u32 instead of uint32_t (Tzung-Bi).
- Rename 0bytes test to 0byte (Tzung-Bi).
- Check header immutability for insize in test cases (Tzung-Bi).
---
 drivers/platform/chrome/cros_ec_proto.c      |  32 +++-
 drivers/platform/chrome/cros_ec_proto_test.c | 158 ++++++++++++++++++-
 2 files changed, 183 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c
b/drivers/platform/chrome/cros_ec_proto.c
index 1d8d9168ec1a..6d7c57e381e5 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -138,7 +138,8 @@ static int cros_ec_xfer_command(struct
cros_ec_device *ec_dev, struct cros_ec_co
 	return ret;
 }

-static int cros_ec_wait_until_complete(struct cros_ec_device *ec_dev,
uint32_t *result)
+static int cros_ec_wait_until_complete(struct cros_ec_device *ec_dev,
+				       struct cros_ec_command *orig_msg)
 {
 	DEFINE_RAW_FLEX(struct cros_ec_command, msg, data,
 			sizeof(struct ec_response_get_comms_status));
@@ -161,7 +162,7 @@ static int cros_ec_wait_until_complete(struct
cros_ec_device *ec_dev, uint32_t *
 		if (ret < 0)
 			return ret;

-		*result = msg->result;
+		orig_msg->result = msg->result;
 		if (msg->result != EC_RES_SUCCESS)
 			return ret;

@@ -170,8 +171,31 @@ static int cros_ec_wait_until_complete(struct
cros_ec_device *ec_dev, uint32_t *
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
@@ -185,7 +209,7 @@ static int cros_ec_send_command(struct
cros_ec_device *ec_dev, struct cros_ec_co
 	int ret = cros_ec_xfer_command(ec_dev, msg);

 	if (msg->result == EC_RES_IN_PROGRESS)
-		ret = cros_ec_wait_until_complete(ec_dev, &msg->result);
+		ret = cros_ec_wait_until_complete(ec_dev, msg);

 	return ret;
 }
diff --git a/drivers/platform/chrome/cros_ec_proto_test.c
b/drivers/platform/chrome/cros_ec_proto_test.c
index 3f281996a686..a7b1d64f78ce 100644
--- a/drivers/platform/chrome/cros_ec_proto_test.c
+++ b/drivers/platform/chrome/cros_ec_proto_test.c
@@ -1744,7 +1744,7 @@ static void
cros_ec_proto_test_cmd_xfer_protocol_v2_no_op(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ret, -EIO);
 }

-static void cros_ec_proto_test_cmd_xfer_in_progress_normal(struct kunit *test)
+static void cros_ec_proto_test_cmd_xfer_in_progress_payload_0byte(struct
kunit *test)
 {
 	struct cros_ec_proto_test_priv *priv = test->priv;
 	struct cros_ec_device *ec_dev = &priv->ec_dev;
@@ -1774,7 +1774,7 @@ static void
cros_ec_proto_test_cmd_xfer_in_progress_normal(struct kunit *test)
 	}

 	ret = cros_ec_cmd_xfer(ec_dev, &msg);
-	KUNIT_EXPECT_EQ(test, ret, sizeof(struct ec_response_get_comms_status));
+	KUNIT_EXPECT_EQ(test, ret, 0);

 	KUNIT_EXPECT_EQ(test, msg.result, EC_RES_SUCCESS);

@@ -1799,6 +1799,156 @@ static void
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
 static void cros_ec_proto_test_cmd_xfer_in_progress_retries_eagain(struct
kunit *test)
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
