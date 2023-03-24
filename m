Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9188F15A7
	for <chrome-platform@lists.linux.dev>; Fri, 24 Mar 2023 01:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7072EC433EF;
	Fri, 24 Mar 2023 01:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679620026;
	bh=6+V7A+xBJy8zGloyJdaVVLe4ngqLbhkyImoinYDyZJQ=;
	h=From:To:Cc:Subject:Date:From;
	b=sJgZjvZXml8MHGYJIwfqnVw/GxCOZfGE3GS1OfydL7iEPe0/PGM4+JSFsx0zvi3sr
	 fkuev+F1nCSIUnHkjj270EE0RvoIEAarSZC9EMO9S4UGQ01pf15wwVib6LwPYNjPGM
	 igl6YAuMDtFmJt6EVmeaqpQhYSJkEKhfz7WJR7kPhOm/p2AxGmrTzfOOEduu1OkxsV
	 t1w57wjmKeWDRKkLR8hyBSvEujfZAYqwAqZ/n6bFEypFE2G/XbKoLQ1csIy7S/AJxa
	 MA8AsvLq5/2gFPGcZo6a/rGYb70OEl5DQgyqM5ywp1gkCJCefmb80TtVDT42p1IE7K
	 c6Fpl4scXNgtA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org
Subject: [PATCH] platform/chrome: cros_ec_chardev: fix kernel data leak from ioctl
Date: Fri, 24 Mar 2023 09:06:58 +0800
Message-Id: <20230324010658.1082361-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is possible to peep kernel page's data by providing larger `insize`
in struct cros_ec_command[1] when invoking EC host commands.

Fix it by using zeroed memory.

[1]: https://elixir.bootlin.com/linux/v6.2/source/include/linux/platform_data/cros_ec_proto.h#L74

Fixes: eda2e30c6684 ("mfd / platform: cros_ec: Miscellaneous character device to talk with the EC")
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_chardev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_chardev.c b/drivers/platform/chrome/cros_ec_chardev.c
index 0de7c255254e..d6de5a294128 100644
--- a/drivers/platform/chrome/cros_ec_chardev.c
+++ b/drivers/platform/chrome/cros_ec_chardev.c
@@ -284,7 +284,7 @@ static long cros_ec_chardev_ioctl_xcmd(struct cros_ec_dev *ec, void __user *arg)
 	    u_cmd.insize > EC_MAX_MSG_BYTES)
 		return -EINVAL;
 
-	s_cmd = kmalloc(sizeof(*s_cmd) + max(u_cmd.outsize, u_cmd.insize),
+	s_cmd = kzalloc(sizeof(*s_cmd) + max(u_cmd.outsize, u_cmd.insize),
 			GFP_KERNEL);
 	if (!s_cmd)
 		return -ENOMEM;
-- 
2.40.0.348.gf938b09366-goog

