Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398E22F22
	for <chrome-platform@lists.linux.dev>; Wed, 19 Oct 2022 12:54:55 +0000 (UTC)
X-QQ-mid: bizesmtp67t1666183971tap1fkn8
Received: from localhost.localdomain ( [182.148.15.91])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 19 Oct 2022 20:52:49 +0800 (CST)
X-QQ-SSF: 01000000008000E0J000B00A0000000
X-QQ-FEAT: +oIWmpEafD/3ErJpHslt5YkZvLkPzxVd2l9JB2lduXxgKsmxNqMFG5Zb0z0oH
	PH6tqzlWdl4eCgPtb1GK/eaOF7L0DFkrC4RVPleUe3VF0TNWwiAJXKNLC4tbGLVgypjhlOz
	FTAgURKBcuBpU04fLIkFaPeuteVsIXWUzfDlMinONart/OyNxjTWP0vyhJm+N2jjBirC1Te
	kyL0C/rDKCxMevQf+5iA+Q+5Q5ZpnKn5K/M6Z++VpAlPdAlNVsLMV84D8j11SmNyaJ51uxS
	0hETpdL1SOpcIZu0ZQa+YP4Kv7RwpMoW0Jq4tfxXXey9dmXBTXnD3w6Y2p/1nsNmZB1kPZl
	D3xKAoT4GqYeEaqnJErqr0gWDidshFPvAcsHDEt2fm9NMCW12VAcBhlBDX0T18CPU9/PFSm
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jilin Yuan <yuanjilin@cdjrlc.com>
Subject: [PATCH] platform/chrome: fix repeated words in comments
Date: Wed, 19 Oct 2022 20:52:43 +0800
Message-Id: <20221019125243.49098-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4

Delete the redundant word 'from'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/platform/chrome/cros_ec_rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_rpmsg.c b/drivers/platform/chrome/cros_ec_rpmsg.c
index 39d3b50a7c09..a62b87086bad 100644
--- a/drivers/platform/chrome/cros_ec_rpmsg.c
+++ b/drivers/platform/chrome/cros_ec_rpmsg.c
@@ -20,7 +20,7 @@
 #define HOST_EVENT_MARK		2
 
 /**
- * struct cros_ec_rpmsg_response - rpmsg message format from from EC.
+ * struct cros_ec_rpmsg_response - rpmsg message format from EC.
  *
  * @type:	The type of message, should be either HOST_COMMAND_MARK or
  *		HOST_EVENT_MARK, representing that the message is a response to
-- 
2.36.1

