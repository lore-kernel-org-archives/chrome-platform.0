Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC560368
	for <chrome-platform@lists.linux.dev>; Tue, 28 Jun 2022 02:49:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C931FC341CE;
	Tue, 28 Jun 2022 02:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656384579;
	bh=zGk3NdtsCMsFxVCICZyhbXYWgZgrCoRU5D4V1L9Q1rw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sr+SxODcFiYmahDdpnMlMDN+y60Li7+aDagwpBtY1Pxcu4sjDbwUcpwkAe6LSCSE/
	 z39uki/0RaDplB0pI2UY7/cs98kNYxfvmLwdj+qh66CZ7vxCNqf719GbjECTmT4WsX
	 ZuUKuiV90GFkrd9GRpwwsEXncpK2Z0700JisuVPtcs+CupoP9W9M03bL6JzSObnjWH
	 S0ZoqCDCCXvUN4W1O6iH7RUZAsLFnKpf+8luvYXDB3Pg2ogc5tVUmK8hCXTYImkAgn
	 blrmI9nYoHynvtlqvI5h/IG9wEX2U4ijTybiOGMWYs0sWp7OPIk9flBSGu6BAXoCNt
	 Myxazg/uzpiOw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 06/11] platform/chrome: cros_ec_proto: change Kunit expectation when timed out
Date: Tue, 28 Jun 2022 02:49:08 +0000
Message-Id: <20220628024913.1755292-7-tzungbi@kernel.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220628024913.1755292-1-tzungbi@kernel.org>
References: <20220628024913.1755292-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While EC_COMMS_STATUS_PROCESSING flag is still on after it tries
EC_COMMAND_RETRIES times for sending EC_CMD_GET_COMMS_STATUS,
cros_ec_wait_until_complete() doesn't return an error code.

Change the expectation to an error code.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_proto_test.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
index 64100fd81c6a..fbb872040711 100644
--- a/drivers/platform/chrome/cros_ec_proto_test.c
+++ b/drivers/platform/chrome/cros_ec_proto_test.c
@@ -1870,9 +1870,7 @@ static void cros_ec_proto_test_cmd_xfer_in_progress_retries_status_processing(st
 	}
 
 	ret = cros_ec_cmd_xfer(ec_dev, &msg);
-	KUNIT_EXPECT_EQ(test, ret, sizeof(struct ec_response_get_comms_status));
-
-	KUNIT_EXPECT_EQ(test, msg.result, EC_RES_SUCCESS);
+	KUNIT_EXPECT_EQ(test, ret, -EAGAIN);
 
 	/* For EC_CMD_GET_COMMS_STATUS EC_COMMAND_RETRIES times. */
 	KUNIT_EXPECT_EQ(test, cros_kunit_ec_pkt_xfer_mock_called, 51);
-- 
2.37.0.rc0.161.g10f37bed90-goog

