Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1850028FE
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jun 2022 14:56:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05E81C341C0;
	Tue,  7 Jun 2022 14:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654613817;
	bh=fMwLtQKEvH6GEv7RdnrlgaFUenGK2Aw6G/Gjb6hPjlg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=okb/MileIjuwqP10DDNiopVLkndfBpw9ahsdQwzzVpusMqrKR8z+anZdgQ+5IWaKu
	 VpNph3Oo3SDFTj4vOrZEfGdRnbCp/H2rqJ0D8j/QeQ2VW2zeOXiVEHOO25sLdJiRn7
	 4eEIFAlvzCjig+KCWMOqnWVI8fHETMxUXM50d34TSxvDpis3j224JZqOt853QX+TS7
	 UO3vy/xyycp0IaF830hKlscRfqJPEGKSgDwuVURUz8bcJHvr9h/XtoWxcKQ3qk5lRZ
	 KJAacIXIK2n4hK0+fDe4v+G2nCMlXQwTyXhuEDIeVeOj7tbmWJyKSh+Eg7lmiM5ceZ
	 Tn48SLDjZtVMQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	tzungbi@kernel.org
Subject: [PATCH v2 05/15] platform/chrome: cros_ec_proto: remove redundant NULL check
Date: Tue,  7 Jun 2022 14:56:29 +0000
Message-Id: <20220607145639.2362750-6-tzungbi@kernel.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220607145639.2362750-1-tzungbi@kernel.org>
References: <20220607145639.2362750-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

send_command() already checks if `ec_dev->pkt_xfer` is NULL.  Remove the
redundant check.

Reviewed-by: Guenter Roeck <groeck@chromium.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
Changes from v1:
- Add R-b tag.

 drivers/platform/chrome/cros_ec_proto.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 629dce3e6ab3..1b851dcd20c9 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -281,9 +281,6 @@ static int cros_ec_host_command_proto_query(struct cros_ec_device *ec_dev,
 	 */
 	int ret;
 
-	if (!ec_dev->pkt_xfer)
-		return -EPROTONOSUPPORT;
-
 	memset(msg, 0, sizeof(*msg));
 	msg->command = EC_CMD_PASSTHRU_OFFSET(devidx) | EC_CMD_GET_PROTOCOL_INFO;
 	msg->insize = sizeof(struct ec_response_get_protocol_info);
-- 
2.36.1.255.ge46751e96f-goog

