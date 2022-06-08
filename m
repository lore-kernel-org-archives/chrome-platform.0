Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB222F39
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jun 2022 11:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DB08C341C6;
	Wed,  8 Jun 2022 11:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654686474;
	bh=aJzp2r5ahOwBl7hiZoC8UrDVJ/W0sy8bmq1ExWIBB9k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WCQzpCSAkQUi2t2gk1w4QUATihCBrVCVk6Gi+z7BAzS3wc3A3yjy3S59e8CH3DFhm
	 P7jCM0kil7VhyaH0YCfS6gCTfQbKlv8snsvLOX5W8nolGNLSyFdMhoGU26pJhvs3e6
	 BiZZ6hr7JyIU3ZMVfgvbmORAw9BwyauF3MVvaqZoB0jxNIRhR5xOCa4uoiAbLA2ruB
	 M553HFy0aPwwq6YAoZKIIL5Oc5yIu6fXAyFIb224rREe5mukSii8nLpo86Shb1Ugfg
	 4QgiZi/s1cmsGHTEhTXh1giCGyzS3gLqgoWZFvEdhR8BhrMjF3Q+2uH95nRP7FEyCL
	 /ka9Kfpsrrrmg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/23] platform/chrome: cros_ec_proto: remove redundant NULL check
Date: Wed,  8 Jun 2022 11:07:16 +0000
Message-Id: <20220608110734.2928245-6-tzungbi@kernel.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220608110734.2928245-1-tzungbi@kernel.org>
References: <20220608110734.2928245-1-tzungbi@kernel.org>
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
No change from v2.

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

