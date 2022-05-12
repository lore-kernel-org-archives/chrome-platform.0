Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096D317FC
	for <chrome-platform@lists.linux.dev>; Thu, 12 May 2022 08:36:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE659C34100;
	Thu, 12 May 2022 08:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652344613;
	bh=+ElejYVrlc9ZxlHbkXbJTVjfLTw9jluzs88dkguwQgw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WfzeSAilNyMiEDlFz6+/GQvqlhIB+YMmSv6Z16tQsDN4voGg9l+/HWNz7yWnVYQH+
	 1EXA/byEIWtixjtg4F74mb83x8ya0me0SPbmjBK7fZ5bpE08s7RLne9jMFTcfQbkE9
	 6TQOH4HXf6GbffR2d3aVx7LDSO+MxISu5Xr1KWNIH4vO6Nv3yyL/RAtAmy/qkhvkrO
	 nB+5XVqr/Jvoy0XnC87p8zgv5g/LzWViyoC4bgbqlI5RPIunlOKRjh06Kel7GFDKwA
	 9gn+BtZKNSmb7ctk+njxxN7gjZ227vhjNLNA89v57hWzqKZVLcqofq94fvgF2RyWo7
	 L2TaSIvlx+mpg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] platform/chrome: cros_ec_proto: drop BUG_ON() in cros_ec_prepare_tx()
Date: Thu, 12 May 2022 16:36:24 +0800
Message-Id: <20220512083627.885338-4-tzungbi@kernel.org>
X-Mailer: git-send-email 2.36.0.512.ge40c2bad7a-goog
In-Reply-To: <20220512083627.885338-1-tzungbi@kernel.org>
References: <20220512083627.885338-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is overkill to crash the kernel if the given message is oversize.

Drop the BUG_ON() and return -EINVAL instead.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
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
2.36.0.512.ge40c2bad7a-goog

