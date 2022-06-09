Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D53210B
	for <chrome-platform@lists.linux.dev>; Thu,  9 Jun 2022 08:50:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BD60C385A9;
	Thu,  9 Jun 2022 08:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654764637;
	bh=ALskAB7uMDL0rnO7G/AGFH8ycfhIWZ7nlarq7eYiqxw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bip3M02J+XtnZd+kejCcrw9WAFXB27husZyxcbznOxi2M7DSOBaZ57qfSIGaYrYso
	 7tcq8wkfiHYJm0h3O2YglY7yzdrouA2/ncthmDJw59iORO94bhG81LKlKdvOOALjzf
	 Q2Uyx4+bIjjHCSZj8cow+k1az6hcQ7pB4KzsEjkSU1tQXYEmu/BXtqAPmTWeqh4sBd
	 i0U2AVu6/QMrURmjGZfQugDHaw/WneAIVoC70BRwADokQ4+F6czNNmpt47UucBckFX
	 EWqJixlT8SYEiTLCY+GY98izNwPWzUp3eJVEvT4Cy1hrU8uuRYTuvOF5LvHpDCoWKO
	 bpbR4OWjKHiLg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 19/21] platform/chrome: cros_ec_proto: return 0 on getting wake mask success
Date: Thu,  9 Jun 2022 08:49:55 +0000
Message-Id: <20220609084957.3684698-20-tzungbi@kernel.org>
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

cros_ec_get_host_event_wake_mask() used to return value from
send_command() which is number of bytes for input payload on success
(i.e. sizeof(struct ec_response_host_event_mask)).

However, the callers don't need to know how many bytes are available.

Don't return number of available bytes.  Instead, return 0 on success;
otherwise, negative integers on error.

Reviewed-by: Guenter Roeck <groeck@chromium.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
Changes from v3:
- Add R-b tag.

Changes from v2:
- Separate Kunit test to another patch.

Changes from v1:
- Return 0 on success; otherwise, negative intergers.

 drivers/platform/chrome/cros_ec_proto.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 28c103315144..760a6da0965a 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -236,7 +236,7 @@ EXPORT_SYMBOL(cros_ec_check_result);
  *
  * @ec_dev: EC device to call
  * @msg: message structure to use
- * @mask: result when function returns >=0.
+ * @mask: result when function returns 0.
  *
  * LOCKING:
  * the caller has ec_dev->lock mutex, or the caller knows there is
@@ -266,6 +266,7 @@ static int cros_ec_get_host_event_wake_mask(struct cros_ec_device *ec_dev, uint3
 	if (ret > 0) {
 		r = (struct ec_response_host_event_mask *)msg->data;
 		*mask = r->mask;
+		ret = 0;
 	}
 
 exit:
-- 
2.36.1.255.ge46751e96f-goog

