Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93004A47
	for <chrome-platform@lists.linux.dev>; Mon, 18 Jul 2022 05:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86003C341C8;
	Mon, 18 Jul 2022 05:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658121019;
	bh=gbnWF/H385ErUCktkchjx9qWigCWiBQBmE32idRb2bc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oEL0daO+4CLKjDbZlMyzc113plobNi/RfQML86pWpFHiRo8Lm687f90tgMwzqEZVu
	 8HeKG68CsSLHXwI334xKu9zh2TCqhPUbrFgfvgrQLzfRToMsXh59/lO6sGR59sDHNu
	 Ev3MR5KPNiXVfOv2FZg+dtm0INVB/FaSgIUvhhRCqBnxYybFCA26L+z3KH1sUGhl7p
	 9DBCQO/x1JNWSSYr+XMyPkrKXH1O3CgIZu37CsSsq+oJON3UMxn5m+lmbKh3XPRcMC
	 mTyMFvcyvSVQWF/Wkq/JFYe8Kth29wZqqZTG90Cx37v8eK1ToOekfycKDJcXFQqZWB
	 ho8YuJHG1ycDg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/10] platform/chrome: cros_ec_proto: return -EPROTO if empty payload
Date: Mon, 18 Jul 2022 05:09:14 +0000
Message-Id: <20220718050914.2267370-11-tzungbi@kernel.org>
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

cros_ec_wait_until_complete() sends EC_CMD_GET_COMMS_STATUS which expects
to receive sizeof(struct ec_response_get_comms_status) from
cros_ec_xfer_command().

Return -EPROTO if cros_ec_xfer_command() returns 0.

Reviewed-by: Guenter Roeck <groeck@chromium.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
Changes from v1:
- Add R-b tag.

 drivers/platform/chrome/cros_ec_proto.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 9dec475edc84..05d2e8765a66 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -163,6 +163,11 @@ static int cros_ec_wait_until_complete(struct cros_ec_device *ec_dev, uint32_t *
 		if (msg->result != EC_RES_SUCCESS)
 			return ret;
 
+		if (ret == 0) {
+			ret = -EPROTO;
+			break;
+		}
+
 		if (!(status->flags & EC_COMMS_STATUS_PROCESSING))
 			return ret;
 	}
-- 
2.37.0.170.g444d1eabd0-goog

