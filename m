Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2BE2E6CB8
	for <chrome-platform@lists.linux.dev>; Tue, 18 Aug 2026 18:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787078148; cv=pass; b=jlxRWXnVidKx+Mbk0yNLleUScUpyscxRQitfTUG4Unzd0OEy1PuSuHSrkpjLX7krvnE7+DID2GRPgerDMkhtwxYcX+O4m4X0ow8gSWoTJMp29sMVof0zq9hdSF2qz/0WvGFSEeuGwI+SJRnm0PUbY9/bm/pSdVBOyfxMiEi7UOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787078148; c=relaxed/simple;
	bh=A1yyP9A4zwfGLEXavIciHyLnRumXPrvtuxIjZzkVrC4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=d/ypw7jpOh6D/5qMv5naJwENz3waccS2y70212EUno+Doy6oabsmaZOxpsoWXIFW//8/7YF1q8+O1D9LZq0UQXIQqLwviNQhb4KPq4Q7o9nOEDYy/xuFxDwIbaVU3sww+q1Vvf90q5vgTvqygnFwZmkPsJyj95GF5Q5oEy+6MQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bdGI7va3; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bdGI7va3"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-836eac5682bso2013867b3.0
        for <chrome-platform@lists.linux.dev>; Tue, 18 Aug 2026 11:35:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787078145; cv=none;
        d=google.com; s=arc-20260327;
        b=qurbF+rvEJU5iQ80SmKqzjMoPY7ovsJLJJjC7kdbd50WqvSLDcQR5gkQhMj7WjiY8K
         VZGw13U3XjfpIs6OxliWM3999ssIVuEvVXtqW63vBJO6M6wy+yxjUEq7jehML+ElgsQp
         yRNMYqPRQIgj71F2FtDkEDktDikJVddDsvyeGo6t1b8YqZsDBtd30xtXbj6uSdv9WpeB
         c52NZAHys2tFNkN60yc2kHkRBEmizYUy0HXpALfQCDrN0rNAI4WxDAo9ERIFiGcEK5TJ
         ytsB1cMSpGLvNI6oqYi5IQQ2fj5quHXPuVYVTPa4uuPq6F7dqEDABiU5q78CDdbDfkj8
         0UqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=2u4tdIKzC37JyKgL3r09DYb0EDB1017msPeshMsdXcc=;
        fh=ADS8mSNrfZgS11l62RmuOkD30TzpOX2EE7CoZewL244=;
        b=ZetSOYx5QVqRj7csbKtzZYbrJZsMva5O9UNp6xYyIma9uLBzcNue9ic5VgrDUf4UHq
         P8ccoyyAp76sT9AQdYV9//WGZYkaEsaQL4eLFST8YmPbzMcqJLMpeb2ukiPOU6d6/862
         /RjIeelR49cwBbJJksRUGAJr1t8D6b+r+XvRMVDwTm+Fg7MGR2dAy3VyHBW5AuavLxWB
         yUpXvSpDCq9FXorHjbjYmBj8F91slqHf2OT1VLnfJqF0UUtPvZ3asNey2z/v1YOVeNLh
         3Embj68+eyAMAaLqIjXWoz05uq2GQoClyJ/rdQ6R1CHLvviECjIv2OlrGBwBuJ84Zssm
         U/fw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787078145; x=1787682945; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2u4tdIKzC37JyKgL3r09DYb0EDB1017msPeshMsdXcc=;
        b=bdGI7va3FFxeusFClSz8sCZgbpIJgKrvpGQw8y7hYFYDHubKhA+kbPHoM2+S53tlGP
         NEEpNjtzq/4LL9dkjp10HTHst6eoe20sa4fcCKtriuZX2bbqZ+G5b8X8q1xrd+u9rA1L
         qrpqh9XdL610giLIeF0Ag/VXNVl6+6oLyKQ2mS4yXXSGLaXj85EBtjs1sbyS+zJvrLD2
         7E8+rWcTGAwejKrZY5hbabvg/mr33y6hJJxDNQ5kfu9Yaja/+EoZC0KL2o3M07E1y9m/
         86uK6MvlFoVBoIzpj+wi5mH504vR6PMWyenGGWVWPmN8O9mIFiM41UU9dFwtze6jb5YP
         nsHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787078145; x=1787682945;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2u4tdIKzC37JyKgL3r09DYb0EDB1017msPeshMsdXcc=;
        b=Izuju/EHBnskTf+tVsYZkjP70ZbtpYgIvJ4xDalOHXyqpuJoKmSrTai7jmsW8F+BjK
         eTaDbvREbtz+MR5R2O57iVMF13/VXVW6cnT1geA3VgWe8RT0vNPF5BQr2+dprP1DKv5x
         wVrUI0f9vd/eBRCxwUqwxTE+g5RHTPoC4mBbokVC+OK4p73/bCc1TyIYDSMblobwRMS5
         0HvVaBLE0Xz21rXfCCGfM2fGW/hNSc6/w5XfMWXcV+X+CnxzMWWJgBzo5A688NADdgg8
         gFr2JPKJDNmVvm0kCPxBrlFlW33XOA1PlurpTiZh1XFcRJdkybyUEx8eAwiXsjsmiB/8
         tyuQ==
X-Forwarded-Encrypted: i=1; AHgh+RqVDz0WioVYFSNgmEEOKGIIe5wK2/gHVOmXswG9dGzYyFf/01NYmh2/yzUQ/lNg4m30I4zf2MX7zTZf7YOd3sk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwT3MY1BxdLSgwqCpORZRJkNaKbWGhxlN+dxuWTcyD+Wjj2H7jl
	3eyMBGa+UCTbceCWulnRsTZ64+SCQ91ZtFRw9m9wONQkmzZsZwuqof6CJZ0bmzFmbe1Ei9zDDwy
	TrvGAY32XnpUOZNH/1FRPtyx/hdtjHEEghcMH+j8y
X-Gm-Gg: AR+sD12yWpwr0xPimwMfw4nYMQu437xGu16F5HWY4n04GaT0vuy8di8HtUESRaPttMs
	ygRFsqdF1SKcGPgxanHUqaGn6DXPJ7ZDMQFifyMBSHLI0IQClyiTeJwIfYZnMW4uHgXInc7G5gA
	ebl5ZV3aJQtVIupp/qygkVF7zrOFcQrOpgt6KBsTjExnlHYW2MmnsqpfwyqAEzVyho0TKmsN9ID
	TViwdXymZT9pz5d+C/+dtf8N/P3kR7pN6Wlod5ETZEmE609iTBuIQhU/Ame/6E1YDfJ9240ucq7
	x9zC/VzgGIJ0GwhBttdJFVS7nh4/8rxz7mVKXGgIHT6E1tH8KLDWif1db9oNhIL1D6cAILY6USl
	Pj/fzW7zdGyjWpQJ2MDA4acLQ5zLY
X-Received: by 2002:a05:690c:e157:20b0:820:10f1:d501 with SMTP id
 00721157ae682-8419f90b6ddmr28781547b3.6.1787078144681; Tue, 18 Aug 2026
 11:35:44 -0700 (PDT)
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 18 Aug 2026 14:35:43 -0400
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 18 Aug 2026 14:31:10 -0400
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Rob Barnes <robbarnes@google.com>
Date: Tue, 18 Aug 2026 14:35:43 -0400
X-Gm-Features: AcwNN1XPvn83tO3L9oxsCN7qhvnedbMPaOL-lf8LyIIgUJBBqsF5g-lUW7RI1nU
Message-ID: <CA+Dqm338B_5unrSnb2ztcuA2xakNj_Lp76mEXQpwmOCEXm7cYw@mail.gmail.com>
Subject: [PATCH v2] platform/chrome: cros_ec_proto: Fix deferred response
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
v2:
- Drop redundant commit description sentences (Tzung-Bi).
- Align function signature parameters to open parenthesis (Tzung-Bi).
- Check orig_msg->insize == 0 and add comments explaining the logic
(Tzung-Bi / Rob).
- Use u32 instead of uint32_t (Tzung-Bi).
- Rename 0bytes test to 0byte (Tzung-Bi).
- Check header immutability for insize in test cases (Tzung-Bi).
---
 drivers/platform/chrome/cros_ec_proto.c      |  31 ++++-
 drivers/platform/chrome/cros_ec_proto_test.c | 158 ++++++++++++++++++-
 2 files changed, 181 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c
b/drivers/platform/chrome/cros_ec_proto.c
index a655322b599e..1fa6336c1998 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -137,7 +137,7 @@ static int cros_ec_xfer_command(struct
cros_ec_device *ec_dev, struct cros_ec_co
 }

 static int cros_ec_wait_until_complete(struct cros_ec_device *ec_dev,
-					struct cros_ec_command *orig_msg)
+				       struct cros_ec_command *orig_msg)
 {
 	struct {
 		struct cros_ec_command msg;
@@ -171,8 +171,31 @@ static int cros_ec_wait_until_complete(struct
cros_ec_device *ec_dev,
 			break;
 		}

-		if (!(status->flags & EC_COMMS_STATUS_PROCESSING))
-			return ret;
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
+			return ret;
+		}
 	}

 	if (i >= EC_COMMAND_RETRIES)
@@ -185,7 +213,7 @@ static int cros_ec_send_command(struct
cros_ec_device *ec_dev, struct cros_ec_co
 	int ret = cros_ec_xfer_command(ec_dev, msg);

 	if (msg->result == EC_RES_IN_PROGRESS)
-		ret = cros_ec_wait_until_complete(ec_dev, &msg->result);
+		ret = cros_ec_wait_until_complete(ec_dev, msg);

 	return ret;
 }
diff --git a/drivers/platform/chrome/cros_ec_proto_test.c
b/drivers/platform/chrome/cros_ec_proto_test.c
index 63e38671e95a..be3a61d83ade 100644
--- a/drivers/platform/chrome/cros_ec_proto_test.c
+++ b/drivers/platform/chrome/cros_ec_proto_test.c
@@ -1756,7 +1756,7 @@ static void
cros_ec_proto_test_cmd_xfer_protocol_v2_no_op(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ret, -EIO);
 }

-static void cros_ec_proto_test_cmd_xfer_in_progress_normal(struct kunit *test)
+static void cros_ec_proto_test_cmd_xfer_in_progress_payload_0byte(struct
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

@@ -1811,6 +1811,156 @@ static void
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
@@ -2858,7 +3008,7 @@ static struct kunit_case cros_ec_proto_test_cases[] = {
 	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_protocol_v3_no_op),
 	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_protocol_v2_normal),
 	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_protocol_v2_no_op),
-	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_normal),
+	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_payload_0byte),
 	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_payload_4bytes),
 	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_payload_gt4bytes),
 	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_retries_eagain),
