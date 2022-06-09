Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C96210B
	for <chrome-platform@lists.linux.dev>; Thu,  9 Jun 2022 08:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B2DC34114;
	Thu,  9 Jun 2022 08:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654764639;
	bh=1FZCyMr6ih6zxzovPaeP8IrHIWKNkoBjM09gYC8FEgY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OE2/bFNVhJtHla0mWHqi9xlH36l5isSw4hBRjisRsUHZKo0PuCbzM8AX1txZf+JvL
	 JyLbYj2XzaF0JLRYS10VVU2EDr+RDMa406Lvaf9HfYTrrlyGofGrID683tIlrFsD0N
	 JlDRiGN+lJnugh5kbqc2bj8kBqDJqa5hdRMDiBZ7Q/ZxA/LN7ykWIDeXEe311mDnW9
	 fRfDX2CcvXm6jPMzQEt7JO1M8nSuCTUOLd5OI/kIspB/XQ4CgjbdLkUCB07VkhFRUa
	 zt4Cwukj1Ha3vQsPy+VPwsx60hJhOkBU7uDhyclTMnP0+xpisePkjFxK4nXVXOvKKo
	 LYgK+tiCsNilg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 21/21] platform/chrome: cros_ec_proto: handle empty payload in getting wake mask
Date: Thu,  9 Jun 2022 08:49:57 +0000
Message-Id: <20220609084957.3684698-22-tzungbi@kernel.org>
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

cros_ec_get_host_event_wake_mask() expects to receive
sizeof(struct ec_response_host_event_mask) from send_command().  The
payload is valid only if the return value is positive.

Return -EPROTO if send_command() returns 0 in
cros_ec_get_host_event_wake_mask().

Reviewed-by: Guenter Roeck <groeck@chromium.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
Changes from v3:
- Add R-b tag.

 drivers/platform/chrome/cros_ec_proto.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 760a6da0965a..ef942e8d0e8f 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -256,19 +256,23 @@ static int cros_ec_get_host_event_wake_mask(struct cros_ec_device *ec_dev, uint3
 	msg->insize = sizeof(*r);
 
 	ret = send_command(ec_dev, msg);
-	if (ret >= 0) {
-		mapped = cros_ec_map_error(msg->result);
-		if (mapped) {
-			ret = mapped;
-			goto exit;
-		}
+	if (ret < 0)
+		goto exit;
+
+	mapped = cros_ec_map_error(msg->result);
+	if (mapped) {
+		ret = mapped;
+		goto exit;
 	}
-	if (ret > 0) {
-		r = (struct ec_response_host_event_mask *)msg->data;
-		*mask = r->mask;
-		ret = 0;
+
+	if (ret == 0) {
+		ret = -EPROTO;
+		goto exit;
 	}
 
+	r = (struct ec_response_host_event_mask *)msg->data;
+	*mask = r->mask;
+	ret = 0;
 exit:
 	kfree(msg);
 	return ret;
-- 
2.36.1.255.ge46751e96f-goog

