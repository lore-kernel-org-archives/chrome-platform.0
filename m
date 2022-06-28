Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A327368
	for <chrome-platform@lists.linux.dev>; Tue, 28 Jun 2022 02:49:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19158C34115;
	Tue, 28 Jun 2022 02:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656384586;
	bh=RCdzDyyspYZBbTy21S73pVMkpsXGg+X2fE0S4NTTvrE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kEkHb4EOokE+b0s6/tFxK/7Dy/zJ2l5+Y2TaH19ERYx3aocGIFDuMWGQhRX6QF43Q
	 xo1WLZ6dytalM553zy0QzILZK2FTiWNG23Lp4/ozz3yh/tmL8IA+9gxiw5iKNltwwl
	 FmlQXR02CE8tFJts0zr2k4W9ZgZ8Rln0Laz0+GsestXhNvWjES7HHtCBQNlQxB/S4C
	 uZCJTcRBNfK92pCzOXrFeryDfh2a6O8WmbIQND+aNdnIWvmWpRJT16B5hNXlf8cX4w
	 l72m2X836aQh9pFgAt3SMeJAhpIwxk51sTyxVa+t3eib1y8+/N3zJ4Gom+M01mWojg
	 wr8uXUYj/hw3g==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 11/11] platform/chrome: cros_ec_proto: return -EPROTO if empty payload
Date: Tue, 28 Jun 2022 02:49:13 +0000
Message-Id: <20220628024913.1755292-12-tzungbi@kernel.org>
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

cros_ec_wait_until_complete() sends EC_CMD_GET_COMMS_STATUS which expects
to receive sizeof(struct ec_response_get_comms_status) from
cros_ec_xfer_command().

Return -EPROTO if cros_ec_xfer_command() returns 0.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_proto.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 5323edddb540..0c7042aa2640 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -166,6 +166,11 @@ static int cros_ec_wait_until_complete(struct cros_ec_device *ec_dev, uint32_t *
 			break;
 		}
 
+		if (ret == 0) {
+			ret = -EPROTO;
+			break;
+		}
+
 		if (!(status->flags & EC_COMMS_STATUS_PROCESSING))
 			break;
 	}
-- 
2.37.0.rc0.161.g10f37bed90-goog

