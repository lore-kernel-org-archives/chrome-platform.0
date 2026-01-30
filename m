Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE8830BF55
	for <chrome-platform@lists.linux.dev>; Fri, 30 Jan 2026 04:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769745836; cv=none; b=amFHNi6AHDWnuKQM8nmvWsC+sXJUqlkoHL/xw3Kj8LCK0ON48wt8Gef6T8SfWeHoNEZEZ1+v6gCDmcTmWB+6tOVauZqEWZtMFzNQeof1dTQdZnOu0YjxP3cSvkD9vvcs8SYLnPzqISLvTaMq1M5StPgdlOQKbNSESf66fIMRHMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769745836; c=relaxed/simple;
	bh=yLtdkn3/nJUEJD69HQPrLv9eJ479ofNGVlBySD6lMZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M1e6AibUw5OQVWNz9J9swKxDb1NcDefkratcIVIGGuYr4gbhd/RxMCGGDRNprCdu6Fryr4+y09wqF7FeQqxKeNfJrmTAtMp4C3bciyrwEiSzEASt+FHonePB03U4yUtYU2Y6E6yPWjfVtMU+kBgq1q6zuvZPiI+Q3HrzTrHUHi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DzSDKO6b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DzSDKO6b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE6F1C4CEF7;
	Fri, 30 Jan 2026 04:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769745835;
	bh=yLtdkn3/nJUEJD69HQPrLv9eJ479ofNGVlBySD6lMZs=;
	h=From:To:Cc:Subject:Date:From;
	b=DzSDKO6bFJLoHFzu+fXU/1nnQepcrI4PlRXZPpxAC8iTXwUKQbV6v+IEwie/nQ2bi
	 oQF0JRuERs4SCjSopFwxYfu7mPgAQuAbE9v8ldOOzZZk/ZleT7gz2Wnn1romRjJq8L
	 vLa2EyyFkpGILhrM+gSqs8jYYK7gf++Ag+CG6UYUsvXrwetu5rny+BAdgnTYULmdOe
	 AUvdPE4MXOnJm9ZXVraJKr5UP+rjyWoGGXqyZVS6MuLHdoVpdBcDnZ41t2O+a098pO
	 IGXE5oNXEy2Pok5iGwSGYccSNhFb6FT1KYeUUrYsbRRvWoVO93vAfboeORNZMb2XWb
	 L6hNsOR9nQoaA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>
Cc: Gwendal Grignou <gwendal@google.com>,
	chrome-platform@lists.linux.dev,
	tzungbi@kernel.org
Subject: [PATCH] platform/chrome: cros_ec_lightbar: Fix response size initialization
Date: Fri, 30 Jan 2026 04:03:35 +0000
Message-ID: <20260130040335.361997-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 1e7913ff5f9f ("platform/chrome: cros_ec_lightbar: Reduce
ligthbar get version command") meant to set smaller values for both
request and response sizes.

However, it incorrectly assigned the response size to the `result` field
instead of `insize`.  Fix it.

Reported-by: Gwendal Grignou <gwendal@google.com>
Closes: https://lore.kernel.org/chrome-platform/CAMHSBOVrrYaB=1nEqZk09VkczCrj=6B-P8Fe29TpPdSDgT2CCQ@mail.gmail.com
Fixes: 1e7913ff5f9f ("platform/chrome: cros_ec_lightbar: Reduce ligthbar get version command")
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
As the cut-off date for the next merge window is approaching.  I really
hope to include the fix in the cycle.  Sent the fix by myself.  See also
https://lore.kernel.org/chrome-platform/aXmaQeTV0oTqi_KB@google.com/.

 drivers/platform/chrome/cros_ec_lightbar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_lightbar.c b/drivers/platform/chrome/cros_ec_lightbar.c
index 8352e9732791..3702baff5d4f 100644
--- a/drivers/platform/chrome/cros_ec_lightbar.c
+++ b/drivers/platform/chrome/cros_ec_lightbar.c
@@ -126,7 +126,7 @@ static int get_lightbar_version(struct cros_ec_dev *ec,
 	param = (struct ec_params_lightbar *)msg->data;
 	param->cmd = LIGHTBAR_CMD_VERSION;
 	msg->outsize = sizeof(param->cmd);
-	msg->result = sizeof(resp->version);
+	msg->insize = sizeof(resp->version);
 	ret = cros_ec_cmd_xfer_status(ec->ec_dev, msg);
 	if (ret < 0 && ret != -EINVAL) {
 		ret = 0;
-- 
2.53.0.rc2.204.g2597b5adb4-goog

