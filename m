Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C457D20F4
	for <chrome-platform@lists.linux.dev>; Fri, 13 May 2022 04:41:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94919C34116;
	Fri, 13 May 2022 04:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652416916;
	bh=DUjbqOiPwSotTkZmud2YzJPM3OuvMaOA+B4B15eN5pA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YdyoEmQj+SYNv2mOLGGst/beMLUNkickm8rJrk9M16dps/yhPSR9O7yXrXk3BzIb1
	 LZ+1/L/1/vMyMWOfmn/78fioIUovUkHnyVI/vNWeEeBnYrdOy96fazazodXZzocDdv
	 XgKKUxoAMQo+MIgArsi3XGLUfGNLmOzzvCr+RWYrVAsNq/SKDaKdz3nHnaZP7pR/ki
	 akLIPFN2owWcsX4NQB1z+8+OPnW7Ce43re0yNagbMmgFzQ8UBP0GiF5DhvDOW3phpH
	 arfGSDd87A0G3lPhLNyZFC3daprfGg41B1mZDWwH380ysNjEjRyUsmc7J0zdFQ++Zt
	 Te9iV+fETR/tw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/7] platform/chrome: cros_ec_proto: drop BUG_ON() in cros_ec_prepare_tx()
Date: Fri, 13 May 2022 12:41:39 +0800
Message-Id: <20220513044143.1045728-4-tzungbi@kernel.org>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
In-Reply-To: <20220513044143.1045728-1-tzungbi@kernel.org>
References: <20220513044143.1045728-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is overkill to crash the kernel if the given message is oversize.

Drop the BUG_ON() and return -EINVAL instead.

Reviewed-by: Guenter Roeck <groeck@chromium.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
Changes from v1:
- Add R-b tag.

 drivers/platform/chrome/cros_ec_proto.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 2d6d3fbfa905..9ce3374846ff 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -60,7 +60,8 @@ static int prepare_packet(struct cros_ec_device *ec_dev,
 	int i;
 	u8 csum = 0;
 
-	BUG_ON(msg->outsize + sizeof(*request) > ec_dev->dout_size);
+	if (msg->outsize + sizeof(*request) > ec_dev->dout_size)
+		return -EINVAL;
 
 	out = ec_dev->dout;
 	request = (struct ec_host_request *)out;
@@ -176,7 +177,9 @@ int cros_ec_prepare_tx(struct cros_ec_device *ec_dev,
 	if (ec_dev->proto_version > 2)
 		return prepare_packet(ec_dev, msg);
 
-	BUG_ON(msg->outsize > EC_PROTO2_MAX_PARAM_SIZE);
+	if (msg->outsize > EC_PROTO2_MAX_PARAM_SIZE)
+		return -EINVAL;
+
 	out = ec_dev->dout;
 	out[0] = EC_CMD_VERSION0 + msg->version;
 	out[1] = msg->command;
-- 
2.36.0.550.gb090851708-goog

