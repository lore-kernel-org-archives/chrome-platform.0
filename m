Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEE17C
	for <chrome-platform@lists.linux.dev>; Wed, 15 Jun 2022 05:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 424DDC3411B;
	Wed, 15 Jun 2022 05:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655269991;
	bh=5SLS/K/WO5NPoG6nosQIx5zbsicGDMXiC+LrsQiUdaE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f5sOmv6FSap7n32AGDTO3VcIvuGYBym1VQoFHYYEymvyDUZcEuoWozMtlHsxNhvQD
	 TFAYl9kmtOsBiBeRS6quY6woXPiFPrrrs45zEYpVlqdYI8KeCrCkeyUxbUiCVvePzn
	 IrO/9psvEMHZJmzpNAEwGG04INLPyAlBZPbOOdTROG4ZNgaDOt1r9+PiI+YZca+mlS
	 eL+g8emG9HtHD/YKONkbQSrl5bRWF70qD3m6AHhQr/VXOtdEjLFfWYyx2S24gEeI7n
	 9OvLw0YxluuK5cvfasF2dDzI7KnSos6vlHTCsPDLt/tshK8f3eIt66R8nq9QFAxLA8
	 r/7rddHzXC0Gw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/11] platform/chrome: cros_ec_proto: change Kunit expectation when timed out
Date: Wed, 15 Jun 2022 05:12:43 +0000
Message-Id: <20220615051248.1628156-7-tzungbi@kernel.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220615051248.1628156-1-tzungbi@kernel.org>
References: <20220615051248.1628156-1-tzungbi@kernel.org>
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
2.36.1.476.g0c4daa206d-goog

