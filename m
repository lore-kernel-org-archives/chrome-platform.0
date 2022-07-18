Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFCCA47
	for <chrome-platform@lists.linux.dev>; Mon, 18 Jul 2022 05:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ED59C341C8;
	Mon, 18 Jul 2022 05:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658121016;
	bh=qZEfQmPuzobblfAILf3AUWXcuMaT0V6hEOUvHUNl8Wg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T9D2Uwy5Q9lasElEuSApy6N0MnUxH+mHQhsf1FmV3W1fqzsRDG9gIjgJFtRm3X7uy
	 Kqrsth9rh+JoQ/g7RQicEjrvHB0xzTExvIKrJ91qRYi7aHZQ2z9+sEX71aGhub4VI7
	 jt89FUWYEsSQu2K01OWtXkSNi5I5+h+cPC0tA644n4H4zpnakVVPL6Js4/RbeXB9pA
	 5rElaI0ZfxT3GpNc4Rep6j6NBFlW45TliPKWfza/6CnGVAwvFu/8Yl1xKzKtSwuepL
	 E2+BLj2I++0b1rMIEyKmO5qnl3DZlVsSFUiEy3bWNAb5rS4vlgbYw4BGHePnMtOW/A
	 AB3ZX+PrTggAw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/10] platform/chrome: cros_ec_proto: return -EAGAIN when retries timed out
Date: Mon, 18 Jul 2022 05:09:12 +0000
Message-Id: <20220718050914.2267370-9-tzungbi@kernel.org>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
In-Reply-To: <20220718050914.2267370-1-tzungbi@kernel.org>
References: <20220718050914.2267370-1-tzungbi@kernel.org>
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

Return -EAGAIN in the case instead.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
No changes from v1.

 drivers/platform/chrome/cros_ec_proto.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index a6ad7f7956e6..9dec475edc84 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -167,6 +167,9 @@ static int cros_ec_wait_until_complete(struct cros_ec_device *ec_dev, uint32_t *
 			return ret;
 	}
 
+	if (i >= EC_COMMAND_RETRIES)
+		ret = -EAGAIN;
+
 	return ret;
 }
 
-- 
2.37.0.170.g444d1eabd0-goog

