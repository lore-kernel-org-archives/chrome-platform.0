Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A043D368
	for <chrome-platform@lists.linux.dev>; Tue, 28 Jun 2022 02:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90BE4C34115;
	Tue, 28 Jun 2022 02:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656384583;
	bh=CRx51XgSdj0MtbthQC0H1WA4XmHqBiDh8m06ANT9P8M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PvUvL9Leqn1cWbcbHO3EZhyVEImtkdWx2xILnPVbJqLg58/LjDbg7JIJkJ+uT7tPP
	 qVicWOB/Oyglsx87ewW5ZTNQuLb/zsHop17LzYJbQXTqbnObcw70qibDAo90vfJLag
	 vdypsC90/0rIIiO06vkJ9rC6itP1yA13Qt8ICjxkrjN2A78F4IgsRe3jH2pMu98w7M
	 CXqKAZ/tSirPhmGw3tYELEITKT04Po9SPtVTchadjCz72sK/uMA+ZOJX3fhlxaX3NT
	 btG+v3iTMkDCUAgXvu6u6n5t5MbKcNS7gDA6miTPcHppVXqwwetCzht38MFNleFNcq
	 8h42T9YnYvOkA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 09/11] platform/chrome: cros_ec_proto: return standard error codes for EC errors
Date: Tue, 28 Jun 2022 02:49:11 +0000
Message-Id: <20220628024913.1755292-10-tzungbi@kernel.org>
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

Use cros_ec_map_error() to align them.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_proto.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 49772a4c5353..5323edddb540 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -138,7 +138,7 @@ static int cros_ec_wait_until_complete(struct cros_ec_device *ec_dev, uint32_t *
 {
 	struct cros_ec_command *msg;
 	struct ec_response_get_comms_status *status;
-	int ret = 0, i;
+	int ret = 0, i, mapped;
 
 	msg = kzalloc(sizeof(*msg) + sizeof(*status), GFP_KERNEL);
 	if (!msg)
@@ -160,8 +160,11 @@ static int cros_ec_wait_until_complete(struct cros_ec_device *ec_dev, uint32_t *
 			break;
 
 		*result = msg->result;
-		if (msg->result != EC_RES_SUCCESS)
+		mapped = cros_ec_map_error(msg->result);
+		if (mapped) {
+			ret = mapped;
 			break;
+		}
 
 		if (!(status->flags & EC_COMMS_STATUS_PROCESSING))
 			break;
-- 
2.37.0.rc0.161.g10f37bed90-goog

