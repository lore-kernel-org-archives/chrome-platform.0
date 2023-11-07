Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375842DF92
	for <chrome-platform@lists.linux.dev>; Tue,  7 Nov 2023 12:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VZ0AKvsg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C5E2C43395;
	Tue,  7 Nov 2023 12:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699358919;
	bh=MtEg56Db1ITpZqsJ9sWS9PdSnPZ0PiHqxkymMm27JNQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VZ0AKvsg+BJq90/l+Xd7lpVOhJzfpuHUCQdWsZLd1y6T/3oJwWw9zOkQGDIFamsQ9
	 jbgqlvtRhakAHasaAjzcW8FJP3dOJ/dRcDFIIKrMQUS3NWLayzHx2Cvc+/4szPl015
	 bb4Y5DPO+Hh8sJNE1boM4bFAK1W8nv+PG+HiU60gP2vgyKMNQ+P+Wyl9jUPfcpC/lT
	 SOYXIfvmYT5D4O4OOAxP07Y7A7HJeoy+7EDghdaNquxgZkgWS4HUbCTEVjwWJS6wS7
	 Z5MpQpLQqxm1th+kCCbcFZacFSLFgDP40dX/AqEArS/riYv+fH0vaB0/W9PucHALFS
	 llGPV/s1dWZUQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Sasha Levin <sashal@kernel.org>,
	bleung@chromium.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH AUTOSEL 6.6 29/31] platform/chrome: kunit: initialize lock for fake ec_dev
Date: Tue,  7 Nov 2023 07:06:16 -0500
Message-ID: <20231107120704.3756327-29-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107120704.3756327-1-sashal@kernel.org>
References: <20231107120704.3756327-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6
Content-Transfer-Encoding: 8bit

From: Tzung-Bi Shih <tzungbi@kernel.org>

[ Upstream commit e410b4ade83d06a046f6e32b5085997502ba0559 ]

cros_ec_cmd_xfer() uses ec_dev->lock.  Initialize it.

Otherwise, dmesg shows the following:
> DEBUG_LOCKS_WARN_ON(lock->magic != lock)
> ...
> Call Trace:
>  ? __mutex_lock
>  ? __warn
>  ? __mutex_lock
>  ...
>  ? cros_ec_cmd_xfer

Reviewed-by: Guenter Roeck <groeck@chromium.org>
Link: https://lore.kernel.org/r/20231003080504.4011337-1-tzungbi@kernel.org
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/chrome/cros_ec_proto_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
index 5b9748e0463bc..63e38671e95a6 100644
--- a/drivers/platform/chrome/cros_ec_proto_test.c
+++ b/drivers/platform/chrome/cros_ec_proto_test.c
@@ -2668,6 +2668,7 @@ static int cros_ec_proto_test_init(struct kunit *test)
 	ec_dev->dev->release = cros_ec_proto_test_release;
 	ec_dev->cmd_xfer = cros_kunit_ec_xfer_mock;
 	ec_dev->pkt_xfer = cros_kunit_ec_xfer_mock;
+	mutex_init(&ec_dev->lock);
 
 	priv->msg = (struct cros_ec_command *)priv->_msg;
 
-- 
2.42.0

