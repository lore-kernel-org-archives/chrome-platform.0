Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5352F39
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jun 2022 11:08:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21190C341C4;
	Wed,  8 Jun 2022 11:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654686488;
	bh=AK1qFo6Tmuz0zcWaXZ/wuGjHC69Ezlky7hqTBqz+/Zk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S1LtJO6kwxR0jCVB5t6V0puFmQiY/eMpEhRwJG8qzpfPUdAb/6M/e3T/kG7GVMrLm
	 s1t6qT6dmdufndU9EMbDQXEIXv3TGN6qI+UvuttZetxZRvBfwluyHeHFt5P/8LFkiE
	 e0XZR4KyN+3kI025N01wagAAq1vS8mqy986X11UJ7cBn7RCAjKsn70j8TiK5jTQn9X
	 vfED2qXPCq+y+gFyT9O8+I+IAYpG8CWzx794Rh5MVQ8vKAUuQ/O39d+uOjdocj+1Yl
	 SsE3obJ2pK4zVyb2BjAdz9xHnYhvzvfzDwDcxYxiTlk3DiCDkshTgk3SpyLWGJitxh
	 QOYCe4DSrBQWw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 16/23] platform/chrome: cros_ec_proto: return 0 on getting cmd mask success
Date: Wed,  8 Jun 2022 11:07:27 +0000
Message-Id: <20220608110734.2928245-17-tzungbi@kernel.org>
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

cros_ec_get_host_command_version_mask() used to return value from
send_command() which is number of available bytes for input payload on
success (i.e. sizeof(struct ec_response_get_cmd_versions)).

However, the callers don't need to know how many bytes are available.

Don't return number of available bytes.  Instead, return 0 on success;
otherwise, negative integers on error.

Also remove the unneeded `ver_mask` initialization as the callers should
take it only if cros_ec_get_host_command_version_mask() returns 0.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
Changes from v2:
- Separate Kunit test to another patch.
- Rephrase the commit message.

Changes from v1:
- Return 0 on success; otherwise, negative intergers.

 drivers/platform/chrome/cros_ec_proto.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index efbabdcb31ae..06bc7db1213e 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -453,6 +453,7 @@ static int cros_ec_get_host_command_version_mask(struct cros_ec_device *ec_dev,
 	if (ret > 0) {
 		rver = (struct ec_response_get_cmd_versions *)msg->data;
 		*mask = rver->version_mask;
+		ret = 0;
 	}
 
 	kfree(msg);
@@ -469,7 +470,7 @@ static int cros_ec_get_host_command_version_mask(struct cros_ec_device *ec_dev,
  */
 int cros_ec_query_all(struct cros_ec_device *ec_dev)
 {
-	u32 ver_mask = 0;
+	u32 ver_mask;
 	int ret;
 
 	/* First try sending with proto v3. */
@@ -505,9 +506,7 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
 		return -ENOMEM;
 
 	/* Probe if MKBP event is supported */
-	ret = cros_ec_get_host_command_version_mask(ec_dev,
-						    EC_CMD_GET_NEXT_EVENT,
-						    &ver_mask);
+	ret = cros_ec_get_host_command_version_mask(ec_dev, EC_CMD_GET_NEXT_EVENT, &ver_mask);
 	if (ret < 0 || ver_mask == 0) {
 		ec_dev->mkbp_event_supported = 0;
 	} else {
@@ -517,10 +516,8 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
 	}
 
 	/* Probe if host sleep v1 is supported for S0ix failure detection. */
-	ret = cros_ec_get_host_command_version_mask(ec_dev,
-						    EC_CMD_HOST_SLEEP_EVENT,
-						    &ver_mask);
-	ec_dev->host_sleep_v1 = (ret >= 0 && (ver_mask & EC_VER_MASK(1)));
+	ret = cros_ec_get_host_command_version_mask(ec_dev, EC_CMD_HOST_SLEEP_EVENT, &ver_mask);
+	ec_dev->host_sleep_v1 = (ret == 0 && (ver_mask & EC_VER_MASK(1)));
 
 	/* Get host event wake mask. */
 	ret = cros_ec_get_host_event_wake_mask(ec_dev, &ec_dev->host_event_wake_mask);
-- 
2.36.1.255.ge46751e96f-goog

