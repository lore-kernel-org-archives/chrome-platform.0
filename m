Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F14223A7
	for <chrome-platform@lists.linux.dev>; Mon, 13 Mar 2023 09:44:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30F2C433A0;
	Mon, 13 Mar 2023 09:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678700685;
	bh=zOKVpcK7fJYF7L4PNzP8f0M2jUmarqfzj9FYGV1kP2I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K3eyzPVTh90JLxt5FwMPBvokEVSNgP/BRIz2fkkBpah9GI8RnGh7mV2uCSxa05Lo3
	 MVLXtKspunQ1ff7rnSXMx2fb2pxQ27sAEb+8KWbWE0YpLAzUuLcUHzPwj18/pLEoM8
	 dl9mUI3cr0We2RY8yRl5Yg61PhTqEnwRs2g5n8Gi+o7had1mfrz+7SueFu3onmCdi2
	 nACpuwCDa2X5MgTiyDXAIjvffE2MSLP83YlQh5UsWgwxhAhYYca4up8jHI0XXitrO5
	 v2ycWViLpi3MQ77s4vLA28AKH+Ze03bNNg1LwdPqvf+nlTPRrH8MrTfUybTD0gmZpb
	 jNVSEhAmzMbNg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	guillaume.tucker@collabora.com,
	denys.f@collabora.com,
	ricardo.canuelo@collabora.com
Subject: [PATCH 04/14] lava_runner: respect to verbosity flag from unittest framework
Date: Mon, 13 Mar 2023 17:44:21 +0800
Message-Id: <20230313094431.507952-5-tzungbi@kernel.org>
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

testRunner in unittest.main() shouldn't be an instance.  Otherwise, any
verbosity flag won't pass into the testRunner.

For example:

1.
m = unittest.main(
	testRunner=TextTestRunner(...),
	verbosity=0
    )
The verbosity won't take effect in the TextTestRunner.  Instead, it uses
the default verbosity in TextTestRunner(), i.e., 1.

2.
m = unittest.main(
	testRunner=TextTestRunner(...),
    )
When invoking `python3 -m ... -q`, it intends to set the verbosity to 0.
However, the testRunner has been instantiated, the flag won't pass to
the testRunner.

Thus, LavaTestRunner is back.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 cros/runners/lava_runner.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/cros/runners/lava_runner.py b/cros/runners/lava_runner.py
index 70f8aa61132e..427d41f2eadb 100755
--- a/cros/runners/lava_runner.py
+++ b/cros/runners/lava_runner.py
@@ -1,6 +1,7 @@
 #!/usr/bin/env python3
 # -*- coding: utf-8 -*-
 
+import functools
 import sys
 import unittest
 
@@ -43,9 +44,15 @@ class LavaTestResult(unittest.TextTestResult):
         self.writeLavaSignal(test, "skip")
 
 
+class LavaTestRunner(unittest.TextTestRunner):
+    __init__ = functools.partialmethod(
+                    unittest.TextTestRunner.__init__,
+                    resultclass=LavaTestResult)
+
+
 if __name__ == "__main__":
     unittest.main(
-        testRunner=unittest.TextTestRunner(resultclass=LavaTestResult),
+        testRunner=LavaTestRunner,
         # these make sure that some options that are not applicable
         # remain hidden from the help menu.
         failfast=False,
-- 
2.40.0.rc1.284.g88254d51c5-goog

