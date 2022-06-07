Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DB728FB
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jun 2022 14:56:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA7ACC34115;
	Tue,  7 Jun 2022 14:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654613812;
	bh=PJOeK80iHgC8RRWMR0Ls4DGQF5PPFq++wbR7M5To6Lc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q8p0rFxNnFfRkKOTVn8kGoeui1G+UYcnhqDByyN7dI/k3zz6mnI/sNGmPtO8D6Ger
	 RAor38SXM+DW7T+FBy+cVrKMVpws5va3EZH5eHK5KbliXBcMohuoF2t0/1LwWU3W42
	 cfkYllvbgVC6zSsp6ZtZIOH+O7eIyp8INT4ieRSu7YWr835Q8UXi9yJNvNJfMOI5wo
	 U3Jz9T2efPDDGwNxCvsilNypz7cDaM61PPdeE9wtS4WjroA1Q9Vjtt10nEti4wsl6r
	 T0pTae/gtYYsPirxe7nNEHmF4vhsAesPOKM6jiyQbvf5vHG0S/94s1oN1aBgcfbMwt
	 G3gwH3a+mAoLg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	tzungbi@kernel.org
Subject: [PATCH v2 01/15] platform/chrome: cros_ec_commands: fix compile errors
Date: Tue,  7 Jun 2022 14:56:25 +0000
Message-Id: <20220607145639.2362750-2-tzungbi@kernel.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220607145639.2362750-1-tzungbi@kernel.org>
References: <20220607145639.2362750-1-tzungbi@kernel.org>
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

