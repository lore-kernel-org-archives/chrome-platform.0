Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74792F39
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jun 2022 11:08:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6796C3411D;
	Wed,  8 Jun 2022 11:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654686496;
	bh=bPnqyf9AZKQ61p03l1ZhTBaGGia2Im8xpRcxv1K85hQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PZJBe4BPctuMS3xI7WkpvRptbond4MxlN5ysPKMwP9R9W9kRHAotuWVmUvzRnzJRq
	 SC/xUS3w+jQOXbJnC5+BC+hWgHmcJPc8QxIy6CFFk5PH9udZLOiJWVbcjzkBqN7JkN
	 YgV6C6ggBYYrWIqTb6ursL+OjgrxANfIf6ZVLxwcW5VDLI0ODtJFzZGCjshavQykXX
	 r6cSE4TlMIvziJ0siULm83x9kM1tyDBFOIgIPYJPBK6k+Cez3lsrLqyp2drdbx8WJy
	 hpCzS3JJVnCN/znzeU3LhfXjJMzYKxInZ5uFpSvoo3VbNtZV+uVVKp5gxGsf34SkHI
	 rgPHrV/G4kllw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 23/23] platform/chrome: cros_ec_proto: handle empty payload in getting wake mask
Date: Wed,  8 Jun 2022 11:07:34 +0000
Message-Id: <20220608110734.2928245-24-tzungbi@kernel.org>
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

cros_ec_get_host_event_wake_mask() expects to receive
sizeof(struct ec_response_host_event_mask) from send_command().  The
payload is valid only if the return value is positive.

Return -EPROTO if send_command() returns 0 in
cros_ec_get_host_event_wake_mask().

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
No v2.  New and separated from the original series.

 drivers/platform/chrome/cros_ec_proto.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 68a411e84744..5cbaaba26ff7 100644
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

