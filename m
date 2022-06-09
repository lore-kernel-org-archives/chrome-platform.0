Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F785210B
	for <chrome-platform@lists.linux.dev>; Thu,  9 Jun 2022 08:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DFF1C3411E;
	Thu,  9 Jun 2022 08:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654764615;
	bh=kSKP42ykG3A4myTitkeRDF2p6ezFTYtRvxAW7SZhgSQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ofFnETWpJ8tYyqXpwgCwo2kXg+InhjBQl0MT8Poo6HsphBba1wCKcMEcVivQvbHN2
	 F+kH49w3uzI6LESRzM7sgdENm9xXXYzq7fAX6QGhd6nM1AvACdBKpHwgP4El7sdTOX
	 oR/FnYG52YJ1kY+8WLbkJ8+vEX2GIkzAP2z0oPjfFe6tdcPFCHhdMepKCFv9SFqnmG
	 HCFEeqzqzOShTr7fr93FPqjLdMsIzujvYCdoUB9bQKtIik9Iww6dx0RuNDYLPRA6Jy
	 dWTvJwnqp+DZxLLdo040wu1FQhf6KhpqfoPgLWwyj1cfSXscRLUblfFwHrpqx8dQLJ
	 DGKKH1ksxY+PA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 01/21] platform/chrome: cros_ec_commands: fix compile errors
Date: Thu,  9 Jun 2022 08:49:37 +0000
Message-Id: <20220609084957.3684698-2-tzungbi@kernel.org>
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

Fix compile errors when including cros_ec_commands.h solely.

1.
cros_ec_commands.h:587:9: error: unknown type name 'uint8_t'
  587 |         uint8_t flags;
      |         ^~~~~~~

2.
cros_ec_commands.h:1105:43: error: implicit declaration of function 'BIT'
 1105 |         EC_COMMS_STATUS_PROCESSING      = BIT(0),
      |                                           ^~~

Reviewed-by: Guenter Roeck <groeck@chromium.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
No change from v2 and v3.

Changes from v1:
- Add R-b tag.

 include/linux/platform_data/cros_ec_commands.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 8cfa8cfca77e..a5b749a85707 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -13,8 +13,8 @@
 #ifndef __CROS_EC_COMMANDS_H
 #define __CROS_EC_COMMANDS_H
 
-
-
+#include <linux/bits.h>
+#include <linux/types.h>
 
 #define BUILD_ASSERT(_cond)
 
-- 
2.36.1.255.ge46751e96f-goog

