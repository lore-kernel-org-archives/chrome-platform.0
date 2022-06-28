Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6147D368
	for <chrome-platform@lists.linux.dev>; Tue, 28 Jun 2022 02:49:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52CD0C341CF;
	Tue, 28 Jun 2022 02:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656384582;
	bh=MY2CsMAMjNg3ebYD8mcpnnStMEQdNHHn6XyNk73BJns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cyj0asfmbcWRj+P0vYwcNJAQzXxyVEwl1Fqu+MX2+CSbO56uL+eFaZ/wf/fHF5s1y
	 AYnj+ClwJrZg21B3BGFIo7V6QVPzLuBWhYy/ATo2FehHCJE3kmP3BHFwbeDEaXV507
	 ytgaFg5DJewASj3L4o277RpAQ8m8UmMaqYBpf6Lf7KoHfyP037RelpfVPp6CKPuPv4
	 WqKYF8lzaTEpClxmNfAiDaGNwDL1yo2pVaJj1OJrjOzHDBvzqcjMsPAmbrhdua0GAn
	 9MYHnRr7LR03/pimbrEv/Z3UQ0nyK0KbFgRV1BOsmFE6BFcKEgWT6mOur1ABUPleIx
	 lSRCwyO3Vz0eA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 08/11] platform/chrome: cros_ec_proto: change Kunit expectation for EC errors
Date: Tue, 28 Jun 2022 02:49:10 +0000
Message-Id: <20220628024913.1755292-9-tzungbi@kernel.org>
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

cros_ec_wait_until_complete() checks `msg->result` for
EC_CMD_GET_COMMS_STATUS.  However, it doesn't return standard error codes
like most of others.

Change the Kunit test expectation to align them.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_proto_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
index fbb872040711..2a6b099fbfd9 100644
--- a/drivers/platform/chrome/cros_ec_proto_test.c
+++ b/drivers/platform/chrome/cros_ec_proto_test.c
@@ -1927,7 +1927,7 @@ static void cros_ec_proto_test_cmd_xfer_in_progress_return_error(struct kunit *t
 	}
 
 	ret = cros_ec_cmd_xfer(ec_dev, &msg);
-	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, ret, -EOPNOTSUPP);
 
 	KUNIT_EXPECT_EQ(test, msg.result, EC_RES_INVALID_COMMAND);
 
-- 
2.37.0.rc0.161.g10f37bed90-goog

