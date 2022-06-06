Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632F12574
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jun 2022 14:11:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43AE0C3411C;
	Mon,  6 Jun 2022 14:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654524717;
	bh=jEFcX4+rGobfNa0MECgKONfbmATsAGer9hHBokT4s5g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tk2F0WXXTci5g5Ag501ao+8yKFGIEhoEAodqi9ePh1wX6HgIoeJVv+DTNhSxMNMU3
	 Avq4i5/1UBm8a1XWTBW6oQB6FUJf1nhymkWYPJQoxAXG2TgAc9YGUo37XkvPeiPB+k
	 ePRDONbAdVao5Uh0Ynq7XRrVPgj5qKdar+EIepL9S/Leg2wttJ1JGfIshZEFldLDqU
	 XeVQISK2J5fh4mWl8PqxkMF2xtPyfvLlVuWZl/wmsClpnBTKF537xKAtkC0CEnb9fR
	 3BRk7MCVjezwq9oixFjgRF0Gdc804skcEfPOvaAVIbRMoEikdNzQr8RXzhX8n+lHC2
	 zvZUIRY2uQLig==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/13] platform/chrome: cros_ec_commands: fix compile errors
Date: Mon,  6 Jun 2022 14:10:39 +0000
Message-Id: <20220606141051.285823-2-tzungbi@kernel.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220606141051.285823-1-tzungbi@kernel.org>
References: <20220606141051.285823-1-tzungbi@kernel.org>
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

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
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

