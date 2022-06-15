Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB127C
	for <chrome-platform@lists.linux.dev>; Wed, 15 Jun 2022 05:13:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B919EC341C0;
	Wed, 15 Jun 2022 05:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655269993;
	bh=ouMi+OrOc1vdWAJZIxurgSh0grbjdWfmqXvHpzaOysA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mdBgEqbehzX3muATuka1QXahgd/QR7A/6g84zTd6wEpvPjeWadHV7XbFKzdVxH1tQ
	 R/RneL0rTryU1we8pa2Z5MrNRDLCrCxCxPX7E49bycU1J1EzOE4/E2tXdwj4Ohzh31
	 mBomMgFuUTGjPjoJpfGF+Q/Egjg3m4Jbon6VIYxKaznBxkHQsF6h+XyoMXgHscf+xH
	 oW+hpXnY4VdifBa+iXbTyTMjLJDRfHXjXplz+6aeYZX/5nGawuMQD0QRosIYVieSjD
	 74ZLSaQ/6zVoJISaWfNHonppDJRsh0Aw4ahb3SOxGFzfUWkZBp3GrIRxiBrzppiTvy
	 beaC7kUh+OmKg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/11] platform/chrome: cros_ec_proto: change Kunit expectation for EC errors
Date: Wed, 15 Jun 2022 05:12:45 +0000
Message-Id: <20220615051248.1628156-9-tzungbi@kernel.org>
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
2.36.1.476.g0c4daa206d-goog

