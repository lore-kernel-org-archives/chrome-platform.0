Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E3F23A7
	for <chrome-platform@lists.linux.dev>; Mon, 13 Mar 2023 09:44:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70F40C4339B;
	Mon, 13 Mar 2023 09:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678700695;
	bh=geSItmkZ1ry1wVMagK9KqOXpXpfhHLhi6xl8i0vQ/Ns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UH+NMy1TXE0+KzqjYl1hLNhBKBhpjmKMXJlkiYsPhEnLHgrFrHucOe3jf2drS86XA
	 pwTofHTaxN1ldX/5kNTngH4+Onx7n/xXCN49QY5oVGt6cr0ZcpPAxuZ2Yrwyv6zJ8x
	 lS7Fes8eY2xVAEd30X8CRfZzT/dz51w2h6HX0g3mXIJDjcTf4Q61HpZ/fSRm6w2E1m
	 8wpDGWjCyRrpnbB10wOsu8VZclyCrUO1ZFQSoZfRCs6vf6orOb44SA6NTx98+VUaVv
	 QqpXUGBX2tj/qeuaOOEQwInYgkFDkNzTfXrCbSyhBTDDaaUr0sB2ytbS1SrYlW+Wf3
	 6JUVGKUd3k/mw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	guillaume.tucker@collabora.com,
	denys.f@collabora.com,
	ricardo.canuelo@collabora.com
Subject: [PATCH 11/14] helpers/mcu: fix EC_CMD_GET_FEATURES usage
Date: Mon, 13 Mar 2023 17:44:28 +0800
Message-Id: <20230313094431.507952-12-tzungbi@kernel.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230313094431.507952-1-tzungbi@kernel.org>
References: <20230313094431.507952-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

EC_CMD_GET_FEATURES has no parameter.  Remove it.

Also, the in and out was reversed.  Fix it.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 cros/helpers/mcu.py | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/cros/helpers/mcu.py b/cros/helpers/mcu.py
index 506730e71115..7d197e600f47 100644
--- a/cros/helpers/mcu.py
+++ b/cros/helpers/mcu.py
@@ -89,12 +89,8 @@ class ec_response_get_version(Structure):
         ("current_image", c_uint),
     ]
 
-class ec_params_get_features(Structure):
-    _fields_ = [("in_data", c_uint64)]
-
-
 class ec_response_get_features(Structure):
-    _fields_ = [("out_data", c_uint64)]
+    _fields_ = [("in_data", c_uint64)]
 
 
 def EC_FEATURE_MASK_0(event_code):
@@ -112,22 +108,20 @@ def is_feature_supported(feature):
     global ECFEATURES
 
     if ECFEATURES == -1:
-        param = ec_params_get_features()
         response = ec_response_get_features()
 
         cmd = cros_ec_command()
         cmd.version = 0
         cmd.command = EC_CMD_GET_FEATURES
-        cmd.insize = sizeof(param)
-        cmd.outsize = sizeof(response)
+        cmd.insize = sizeof(response)
+        cmd.outsize = 0
 
-        memmove(addressof(cmd.data), addressof(param), cmd.outsize)
         with open("/dev/cros_ec", "r") as fh:
             fcntl.ioctl(fh, EC_DEV_IOCXCMD, cmd)
-        memmove(addressof(response), addressof(cmd.data), cmd.outsize)
+        memmove(addressof(response), addressof(cmd.data), cmd.insize)
 
         if cmd.result == 0:
-            ECFEATURES = response.out_data
+            ECFEATURES = response.in_data
         else:
             return False
 
-- 
2.40.0.rc1.284.g88254d51c5-goog

