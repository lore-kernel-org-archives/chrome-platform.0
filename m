Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC29023A7
	for <chrome-platform@lists.linux.dev>; Mon, 13 Mar 2023 09:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC15C4339B;
	Mon, 13 Mar 2023 09:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678700692;
	bh=mAwuBGJlTbhSNDH+WXQKl+8rladqzugSOXw9+ToCWxw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M11OOyUYQIEku60ZkRHwHD/RlekxCIFF8n+r8Pa0SAJ2iE1RD9JBOwQFiT7bYDBWi
	 LlfRgT/hPqpqCPlIojrc25xir757xSkebYGp4RtV8YKPCbA8CbXFHWU7J6wDpfrtbl
	 AmqbJMq0vrbZp05+WeI+TsEdmEaUuC6yRehwtsszc5fj0oRe45gOwIDRU8PNpOzJNQ
	 YMnvXi2mugJ5lKjnpJ4QyA6bF43QPgTYsx+aR6ODZwgA49peBfefzdjrAUReDhDcV3
	 /IFOi5QFDP0gJ3xluG4aC7JvXfGibBsO9TbcK+3xzaWfBhSjtpvbp1RQ/8bnwyGiNW
	 q4HqfWRAUBTIw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	guillaume.tucker@collabora.com,
	denys.f@collabora.com,
	ricardo.canuelo@collabora.com
Subject: [PATCH 09/14] cros_ec_pwm: use RE to search EC backlight PWM
Date: Mon, 13 Mar 2023 17:44:26 +0800
Message-Id: <20230313094431.507952-10-tzungbi@kernel.org>
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

Use RE to search pattern instead of reading the file line by line.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 cros/tests/cros_ec_pwm.py | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/cros/tests/cros_ec_pwm.py b/cros/tests/cros_ec_pwm.py
index 2b7b4a3418b1..7158463b115f 100644
--- a/cros/tests/cros_ec_pwm.py
+++ b/cros/tests/cros_ec_pwm.py
@@ -2,6 +2,7 @@
 # -*- coding: utf-8 -*-
 
 from cros.helpers.sysfs import *
+import re
 import unittest
 
 
@@ -13,23 +14,12 @@ class TestCrosECPWM(unittest.TestCase):
         """
         if not os.path.exists("/sys/class/backlight/backlight/max_brightness"):
             self.skipTest("No backlight pwm found, skipping")
-        is_ec_pwm = False
-        fd = open("/sys/kernel/debug/pwm", "r")
-        line = fd.readline()
-        while line and not is_ec_pwm:
-            if line[0] != " " and ":ec-pwm" in line:
-                line = fd.readline()
-                while line:
-                    if line[0] == "\n":
-                        is_ec_pwm = False
-                        break
-                    if "backlight" in line:
-                        is_ec_pwm = True
-                        break
-                    line = fd.readline()
-            line = fd.readline()
-        fd.close()
-        if not is_ec_pwm:
+        with open("/sys/kernel/debug/pwm", "r") as fh:
+            pwm = fh.read()
+        for s in pwm.split('\n\n'):
+            if re.match(r'.*:ec-pwm.*backlight', s, re.DOTALL):
+                break
+        else:
             self.skipTest("No EC backlight pwm found, skipping")
         with open("/sys/class/backlight/backlight/max_brightness", "r") as fh:
             brightness = int(int(fh.read()) / 2)
-- 
2.40.0.rc1.284.g88254d51c5-goog

