Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E52123D2
	for <chrome-platform@lists.linux.dev>; Tue, 11 Jun 2024 03:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718076685; cv=none; b=QJPNgxaHI1ZeITztZEBHR3401N4JcQMIYqr/WzYH4cWuqUzmDUs8o2jieFMgJAA3/5kb0+hcJB+bViL8a9zWuQ0jBwwYKguRckh0izEX+u+TlaV4nnQRbgGldD37WR6vtxf2HcJWDpaVVJM4PvL2iu65CsIgDSXanXAG3g9BiLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718076685; c=relaxed/simple;
	bh=BVuczrcC4H9+Pyv+F4nsnkRmpwh9ouOIx7xSk+oMSws=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QTaHRZTw1AwfDvPvpJck8+Lppiq8hDhXhc/PspXd/6sB1QvG1RaUJN/ENN9F3gqklzQdYtE3tDEtsiOY2fhbAocfmqKjdbFwQ4kfeEBtHim8CqeFF2E6ANr6CtKzL2SrP7t2fmHQ2NzDrysLbHWUQIkINXcTWWPG6mI+jrrgOlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFTkH98F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFTkH98F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DA04C2BBFC;
	Tue, 11 Jun 2024 03:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718076685;
	bh=BVuczrcC4H9+Pyv+F4nsnkRmpwh9ouOIx7xSk+oMSws=;
	h=From:To:Cc:Subject:Date:From;
	b=FFTkH98FYt9meLYPVGv8Q3g7yv1wtnieUT76vHDc0nwzdAtfeQZCLVbCF5RO+f6ve
	 +3cTz/IoH6UclOQyH+SJCN31WXZ+dhKtR/J8lJwF+/4eOEceELNOgtIStBmxJBshVp
	 IMJJatK++vnGAaTY0TozgSs4VaPbgQVmFJ5rOJAN96pBxRGGS9Dv4sdgSK8+ZtRaHd
	 grR8P00tI5X0Git9tl1JqhthISXVPSTwjFyxxQqYPs6bpxo6jhDeTT/i8BuDg8M+Tn
	 NYTmn5yr3mloCxuN1sDY/hIb7RfNbTCv4cVFDaVKUqLkpjhyfVUvJkgW3o3RFRbmtF
	 s4DWBjs4xytzA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: tzungbi@kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH] platform/chrome: cros_ec_proto: update Kunit test for get_next_data_v3
Date: Tue, 11 Jun 2024 03:31:13 +0000
Message-ID: <20240611033113.4154548-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 106d67398233 ("platform/chrome: cros_ec_proto: Upgrade
get_next_event to v3"), (struct cros_ec_device *)->event_data becomes
struct ec_response_get_next_event_v3.

Update the Kunit test for fixing the following error:
> Expected mock->msg.insize == sizeof(union ec_response_get_next_data_v1), but
>     mock->msg.insize == 18 (0x12)
>     sizeof(union ec_response_get_next_data_v1) == 16 (0x10)

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_proto_test.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
index 3960f7c16eb0..7ca9895a0065 100644
--- a/drivers/platform/chrome/cros_ec_proto_test.c
+++ b/drivers/platform/chrome/cros_ec_proto_test.c
@@ -2060,17 +2060,17 @@ static void cros_ec_proto_test_get_next_event_no_mkbp_event(struct kunit *test)
 
 	/* For get_keyboard_state_event(). */
 	{
-		union ec_response_get_next_data_v1 *data;
+		union ec_response_get_next_data_v3 *data;
 
 		mock = cros_kunit_ec_xfer_mock_add(test, sizeof(*data));
 		KUNIT_ASSERT_PTR_NE(test, mock, NULL);
 
-		data = (union ec_response_get_next_data_v1 *)mock->o_data;
+		data = (union ec_response_get_next_data_v3 *)mock->o_data;
 		data->host_event = 0xbeef;
 	}
 
 	ret = cros_ec_get_next_event(ec_dev, &wake_event, &more_events);
-	KUNIT_EXPECT_EQ(test, ret, sizeof(union ec_response_get_next_data_v1));
+	KUNIT_EXPECT_EQ(test, ret, sizeof(union ec_response_get_next_data_v3));
 
 	KUNIT_EXPECT_EQ(test, ec_dev->event_data.event_type, EC_MKBP_EVENT_KEY_MATRIX);
 	KUNIT_EXPECT_EQ(test, ec_dev->event_data.data.host_event, 0xbeef);
@@ -2085,7 +2085,7 @@ static void cros_ec_proto_test_get_next_event_no_mkbp_event(struct kunit *test)
 
 		KUNIT_EXPECT_EQ(test, mock->msg.version, 0);
 		KUNIT_EXPECT_EQ(test, mock->msg.command, EC_CMD_MKBP_STATE);
-		KUNIT_EXPECT_EQ(test, mock->msg.insize, sizeof(union ec_response_get_next_data_v1));
+		KUNIT_EXPECT_EQ(test, mock->msg.insize, sizeof(union ec_response_get_next_data_v3));
 		KUNIT_EXPECT_EQ(test, mock->msg.outsize, 0);
 	}
 }
-- 
2.45.2.505.gda0bf45e8d-goog

