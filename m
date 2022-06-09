Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603F4210D
	for <chrome-platform@lists.linux.dev>; Thu,  9 Jun 2022 08:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32778C3411E;
	Thu,  9 Jun 2022 08:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654764630;
	bh=LINcrOmBhCitcXeglTlWjq+ceqlHnSXh5c4ROdaebSA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e9uG/NZSeSkoug7HdJCMYW4KSjKvTbhbZS3JvhHelhVQpRfrZKEDpVLzrGpLb694n
	 q+zeDdqV3v7TiP0/+8cWBljcXluPnvMGu7nQtON3Q4Pdz+eD5BB11Sfl1pSB7YkKDg
	 gBOLsFeziGWF32/+ZjIGEOd765Jfk8ZM5bS86Ux7Zz7n8TjIfhAg3cIfcMFR+ueJl6
	 It96VCbWeLOLlfxh+k3OiKeK9catHYATXTu2y2etzFm2kKorkNYJDGtspeL5/EFV1B
	 +gpCJ6NLaAZDrnj9iWMk/qtytGuvoAcmjWRL6eHDu7UGDUcR25SNSD+OT8CZUBBcs8
	 wMFjmGGK1iC9Q==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 13/21] platform/chrome: cros_ec_proto: don't show MKBP version if unsupported
Date: Thu,  9 Jun 2022 08:49:49 +0000
Message-Id: <20220609084957.3684698-14-tzungbi@kernel.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220609084957.3684698-1-tzungbi@kernel.org>
References: <20220609084957.3684698-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It wrongly showed the following message when it doesn't support MKBP:
"MKBP support version 4294967295".

Fix it.

Reviewed-by: Guenter Roeck <groeck@chromium.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
No change from v3.

Changes from v2:
- Add R-b tag.

 drivers/platform/chrome/cros_ec_proto.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 473654f50bca..e6e9b5b59e58 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -512,13 +512,13 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
 	ret = cros_ec_get_host_command_version_mask(ec_dev,
 						    EC_CMD_GET_NEXT_EVENT,
 						    &ver_mask);
-	if (ret < 0 || ver_mask == 0)
+	if (ret < 0 || ver_mask == 0) {
 		ec_dev->mkbp_event_supported = 0;
-	else
+	} else {
 		ec_dev->mkbp_event_supported = fls(ver_mask);
 
-	dev_dbg(ec_dev->dev, "MKBP support version %u\n",
-		ec_dev->mkbp_event_supported - 1);
+		dev_dbg(ec_dev->dev, "MKBP support version %u\n", ec_dev->mkbp_event_supported - 1);
+	}
 
 	/* Probe if host sleep v1 is supported for S0ix failure detection. */
 	ret = cros_ec_get_host_command_version_mask(ec_dev,
-- 
2.36.1.255.ge46751e96f-goog

