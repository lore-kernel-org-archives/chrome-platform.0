Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F1A210D
	for <chrome-platform@lists.linux.dev>; Thu,  9 Jun 2022 08:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D958BC34114;
	Thu,  9 Jun 2022 08:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654764633;
	bh=SgO6CDbY+UqjQi0CI0tKrqW4Qj9sx/TpOYxB52nDipM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jKUhJL/WxZjYO14TYAH9gpFSMLiB9QTVqRJQ36VeQcqfiUVnBjKY93G+XCEpmTPyq
	 AOvDkdLAhMy5RNgKLbRVH5TlSUHCMDYGk7MPQqlhEkrDXjb4oRBQO5xbjR1nkxZ8g+
	 9pbqes08M7rstzxEaewT0nA32X3lxM+SvyD4VkJh7/E/AOYLDSpbYhKg3oQOvPmnX/
	 9p6MynIED2Iha0mVJqSoyajrFpcFCIb1vsgFtdMTCXi/b2Z021TutBVFOczrsgIgvu
	 TNYlzHy6Emm7ssWPxejHhtq8is3eB0mC8RHLHv/Squ2WAuWVXXcuDupQ/Ahd9jMCxj
	 IPqI/s0oH5w/g==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 16/21] platform/chrome: cros_ec_proto: check `msg->result` in getting cmd mask
Date: Thu,  9 Jun 2022 08:49:52 +0000
Message-Id: <20220609084957.3684698-17-tzungbi@kernel.org>
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

cros_ec_get_host_command_version_mask() should check if EC wasn't happy
by checking `msg->result`.

Use cros_ec_map_error() and return the error code if any.

Reviewed-by: Guenter Roeck <groeck@chromium.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
Changes from v3:
- Add R-b tag.

 drivers/platform/chrome/cros_ec_proto.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 20a1f8f7e70d..ac445bbbd060 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -428,13 +428,12 @@ static int cros_ec_get_proto_info_legacy(struct cros_ec_device *ec_dev)
  * the caller has ec_dev->lock mutex or the caller knows there is
  * no other command in progress.
  */
-static int cros_ec_get_host_command_version_mask(struct cros_ec_device *ec_dev,
-	u16 cmd, u32 *mask)
+static int cros_ec_get_host_command_version_mask(struct cros_ec_device *ec_dev, u16 cmd, u32 *mask)
 {
 	struct ec_params_get_cmd_versions *pver;
 	struct ec_response_get_cmd_versions *rver;
 	struct cros_ec_command *msg;
-	int ret;
+	int ret, mapped;
 
 	msg = kmalloc(sizeof(*msg) + max(sizeof(*rver), sizeof(*pver)),
 		      GFP_KERNEL);
@@ -450,14 +449,20 @@ static int cros_ec_get_host_command_version_mask(struct cros_ec_device *ec_dev,
 	pver->cmd = cmd;
 
 	ret = send_command(ec_dev, msg);
-	if (ret > 0) {
-		rver = (struct ec_response_get_cmd_versions *)msg->data;
-		*mask = rver->version_mask;
-		ret = 0;
+	if (ret < 0)
+		goto exit;
+
+	mapped = cros_ec_map_error(msg->result);
+	if (mapped) {
+		ret = mapped;
+		goto exit;
 	}
 
+	rver = (struct ec_response_get_cmd_versions *)msg->data;
+	*mask = rver->version_mask;
+	ret = 0;
+exit:
 	kfree(msg);
-
 	return ret;
 }
 
-- 
2.36.1.255.ge46751e96f-goog

