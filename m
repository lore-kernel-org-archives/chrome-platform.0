Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6C823A7
	for <chrome-platform@lists.linux.dev>; Mon, 13 Mar 2023 09:44:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED29BC433D2;
	Mon, 13 Mar 2023 09:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678700697;
	bh=12UCfVN80jBPcfaXziP438pBrv60ZCjR/WTBbUfdpWY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JWdbqxbOJjyoiRGB30+TFRtEdM3Ccn5NUlysr+63wdFbiPWHCyFIUFddvisWx1yx0
	 cWiFN06fgvgpgqExYtiJGEueP4KmXlLzELWdYp2quonav3W91uZsPqxh2wwJVihQ9S
	 G2JrN/Wjcez8uoBErVFwBmHYM+rKyY6zx/D7MdzvbVlWAss+3wQHW7ASXlCgcDzUao
	 1HmpwHnbmCTcvrB7M5CIOuV+Uro6VKTFO+146UMBaFVjA2GjExyoqv1z3O1IpkZzpv
	 evRBPrGaEsRrotQl3v/BFeWwEc3CRgm6UTKy0+pQxAQMN/Bt1TSSTBa5fhvRO1LfTm
	 sSN3hLNcFbVVw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	guillaume.tucker@collabora.com,
	denys.f@collabora.com,
	ricardo.canuelo@collabora.com
Subject: [PATCH 12/14] treewide: remove "r" in open() if reading mode
Date: Mon, 13 Mar 2023 17:44:29 +0800
Message-Id: <20230313094431.507952-13-tzungbi@kernel.org>
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

open()'s default mode is "r".  To simplify, remove them if reading
mode.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 cros/helpers/kernel.py      | 2 +-
 cros/helpers/mcu.py         | 8 ++++----
 cros/helpers/sysfs.py       | 4 ++--
 cros/tests/cros_ec_accel.py | 2 +-
 cros/tests/cros_ec_pwm.py   | 6 +++---
 cros/tests/cros_ec_rtc.py   | 2 +-
 setup.py                    | 2 +-
 7 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/cros/helpers/kernel.py b/cros/helpers/kernel.py
index 9e4d769c0531..c319f99a3143 100644
--- a/cros/helpers/kernel.py
+++ b/cros/helpers/kernel.py
@@ -14,7 +14,7 @@ def current_kernel_version():
     """ Returns the current kernel version as an integer you can
         compare.
     """
-    with open("/proc/version", "r") as fh:
+    with open("/proc/version") as fh:
         current = fh.read().split()[2].split("-")[0].split(".")
     return version_to_int(int(current[0]), int(current[1]), int(current[2]))
 
diff --git a/cros/helpers/mcu.py b/cros/helpers/mcu.py
index 7d197e600f47..6c12affd4073 100644
--- a/cros/helpers/mcu.py
+++ b/cros/helpers/mcu.py
@@ -116,7 +116,7 @@ def is_feature_supported(feature):
         cmd.insize = sizeof(response)
         cmd.outsize = 0
 
-        with open("/dev/cros_ec", "r") as fh:
+        with open("/dev/cros_ec") as fh:
             fcntl.ioctl(fh, EC_DEV_IOCXCMD, cmd)
         memmove(addressof(response), addressof(cmd.data), cmd.insize)
 
@@ -156,7 +156,7 @@ def mcu_hello(s, name):
     cmd.outsize = sizeof(response)
 
     memmove(addressof(cmd.data), addressof(param), cmd.insize)
-    with open("/dev/" + name, "r") as fh:
+    with open("/dev/" + name) as fh:
         fcntl.ioctl(fh, EC_DEV_IOCXCMD, cmd)
     memmove(addressof(response), addressof(cmd.data), cmd.outsize)
 
@@ -174,7 +174,7 @@ def mcu_get_version(name):
         cmd.insize = sizeof(response)
         cmd.outsize = 0
 
-        with open("/dev/" + name, "r") as fh:
+        with open("/dev/" + name) as fh:
             fcntl.ioctl(fh, EC_DEV_IOCXCMD, cmd)
         memmove(addressof(response), addressof(cmd.data), cmd.insize)
 
@@ -188,7 +188,7 @@ def mcu_reboot(name):
     cmd.insize = 0
     cmd.outsize = 0
     try:
-        with open("/dev/" + name, "r") as fh:
+        with open("/dev/" + name) as fh:
             fcntl.ioctl(fh, EC_DEV_IOCXCMD, cmd)
     except IOError:
         pass
diff --git a/cros/helpers/sysfs.py b/cros/helpers/sysfs.py
index 80653fd13431..4d3b6735ef45 100755
--- a/cros/helpers/sysfs.py
+++ b/cros/helpers/sysfs.py
@@ -6,7 +6,7 @@ import os
 
 def read_file(name):
     """ Returns the content of the file named 'name'."""
-    with open(name, "r") as fh:
+    with open(name) as fh:
         contents = fh.read()
     return contents
 
@@ -20,7 +20,7 @@ def sysfs_check_attributes_exists(s, path, name, files, check_devtype):
     try:
         for devname in os.listdir(path):
             if check_devtype:
-                with open(path + "/" + devname + "/name", "r") as fh:
+                with open(path + "/" + devname + "/name") as fh:
                     devtype = fh.read()
                 if not devtype.startswith(name):
                     continue
diff --git a/cros/tests/cros_ec_accel.py b/cros/tests/cros_ec_accel.py
index b76d2a6fbb4d..3d6a54acac16 100755
--- a/cros/tests/cros_ec_accel.py
+++ b/cros/tests/cros_ec_accel.py
@@ -57,7 +57,7 @@ class TestCrosECAccel(unittest.TestCase):
         try:
             for devname in os.listdir("/sys/bus/iio/devices"):
                 base_path = "/sys/bus/iio/devices/" + devname + "/"
-                with open(base_path + "name", "r") as fh:
+                with open(base_path + "name") as fh:
                     devtype = fh.read()
                 if devtype.startswith("cros-ec-accel"):
                     location = read_file(base_path + "location")
diff --git a/cros/tests/cros_ec_pwm.py b/cros/tests/cros_ec_pwm.py
index 7158463b115f..6be5c292ffa2 100644
--- a/cros/tests/cros_ec_pwm.py
+++ b/cros/tests/cros_ec_pwm.py
@@ -14,19 +14,19 @@ class TestCrosECPWM(unittest.TestCase):
         """
         if not os.path.exists("/sys/class/backlight/backlight/max_brightness"):
             self.skipTest("No backlight pwm found, skipping")
-        with open("/sys/kernel/debug/pwm", "r") as fh:
+        with open("/sys/kernel/debug/pwm") as fh:
             pwm = fh.read()
         for s in pwm.split('\n\n'):
             if re.match(r'.*:ec-pwm.*backlight', s, re.DOTALL):
                 break
         else:
             self.skipTest("No EC backlight pwm found, skipping")
-        with open("/sys/class/backlight/backlight/max_brightness", "r") as fh:
+        with open("/sys/class/backlight/backlight/max_brightness") as fh:
             brightness = int(int(fh.read()) / 2)
         with open("/sys/class/backlight/backlight/brightness", "w") as fh:
             fh.write(str(brightness))
 
-        with open("/sys/kernel/debug/pwm", "r") as fh:
+        with open("/sys/kernel/debug/pwm") as fh:
             for line in fh:
                 if "backlight" in line:
                     start = line.find("duty") + 6
diff --git a/cros/tests/cros_ec_rtc.py b/cros/tests/cros_ec_rtc.py
index 7afed70f0429..e59fa383659d 100755
--- a/cros/tests/cros_ec_rtc.py
+++ b/cros/tests/cros_ec_rtc.py
@@ -14,7 +14,7 @@ class TestCrosECRTC(unittest.TestCase):
         match = 0
         try:
             for devname in os.listdir("/sys/class/rtc"):
-                with open("/sys/class/rtc/" + devname + "/name", "r") as fh:
+                with open("/sys/class/rtc/" + devname + "/name") as fh:
                     devtype = fh.read()
                 if devtype.startswith("cros-ec-rtc"):
                     files = [
diff --git a/setup.py b/setup.py
index 92e4ed794245..958aaa89e143 100644
--- a/setup.py
+++ b/setup.py
@@ -3,7 +3,7 @@
 
 import setuptools
 
-with open("README.md", "r") as fh:
+with open("README.md") as fh:
     long_description = fh.read()
 
 setuptools.setup(
-- 
2.40.0.rc1.284.g88254d51c5-goog

