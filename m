Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85FC23A7
	for <chrome-platform@lists.linux.dev>; Mon, 13 Mar 2023 09:44:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF29C4339B;
	Mon, 13 Mar 2023 09:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678700689;
	bh=NAb/tW4KA4Gh0mNxYdjrSzKgSMNRY+nHzJcxmk5hgXY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=exc9qgLLJtU+AzUUDa+/DStD139m7Jw5sP3/UdC2ARRY/J/Yxvg2gYVp49pDSXtb3
	 Q70Jzs1X6+fpEJPaimRnbNXK1qNOXps+0LJ5MdqQD3dNHAWYssLXCAErFP3aEL7Spm
	 Xg97X1QoNRDmdFDy4ZCxyldj5//FaHfxp0ZqTBa1z+VPwAvz6O7kAIb7sypHYQDJ6O
	 bXjj/ej7M9lK4pCNvlOVYs3fLqtohZkQ7MFoTQhgPoVQsLhP9pVAvYBjUuZOE+p4Cs
	 ae0T4RZQFbvNs56w8DRhzlDlGoHvjUzC8cmD8i9SRzBDzfuW6+pzNjszJQGCHM1MGV
	 cuKDrt3Dr2AkA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	guillaume.tucker@collabora.com,
	denys.f@collabora.com,
	ricardo.canuelo@collabora.com
Subject: [PATCH 07/14] cros_ec_pwm: fix ResourceWarning on /sys/kernel/debug/pwm
Date: Mon, 13 Mar 2023 17:44:24 +0800
Message-Id: <20230313094431.507952-8-tzungbi@kernel.org>
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

Some errors have been revealed after the runner is-a TextTestRunner.

Fix the following warning:
> ResourceWarning: unclosed file <_io.TextIOWrapper
  name='/sys/kernel/debug/pwm'

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 cros/tests/cros_ec_pwm.py | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/cros/tests/cros_ec_pwm.py b/cros/tests/cros_ec_pwm.py
index bcc9fbcea1d5..ba429a327db1 100644
--- a/cros/tests/cros_ec_pwm.py
+++ b/cros/tests/cros_ec_pwm.py
@@ -37,16 +37,14 @@ class TestCrosECPWM(unittest.TestCase):
         fd = open("/sys/class/backlight/backlight/brightness", "w")
         fd.write(str(brightness))
         fd.close()
-        fd = open("/sys/kernel/debug/pwm", "r")
-        line = fd.readline()
-        while line:
-            if "backlight" in line:
-                start = line.find("duty") + 6
-                self.assertNotEqual(start, 5)
-                end = start + line[start:].find(" ")
-                self.assertNotEqual(start, end)
-                duty = int(line[start:end])
-                self.assertNotEqual(duty, 0)
-                break
-            line = fd.readline()
-        fd.close()
+
+        with open("/sys/kernel/debug/pwm", "r") as fh:
+            for line in fh:
+                if "backlight" in line:
+                    start = line.find("duty") + 6
+                    self.assertNotEqual(start, 5)
+                    end = start + line[start:].find(" ")
+                    self.assertNotEqual(start, end)
+                    duty = int(line[start:end])
+                    self.assertNotEqual(duty, 0)
+                    break
-- 
2.40.0.rc1.284.g88254d51c5-goog

