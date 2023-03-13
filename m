Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4234223A7
	for <chrome-platform@lists.linux.dev>; Mon, 13 Mar 2023 09:44:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7B2AC433EF;
	Mon, 13 Mar 2023 09:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678700691;
	bh=POf40pYdouJgqRpyWymB+P+khOAYzJCuFVtawEhAyyg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B2sD3WYc4FMwHIXVlXJTIvWo/x/TnnUT61MiQdPJztiJghzx5BBDDSb4mI4qKmn9L
	 q1igdDdk3gagueWzfyaR9lXHaWYRjkSLIyWIT3Lxxcx8eavifRa7XDWS7RblzTfliB
	 fxGwUCV6Vt6wa6mKyNdHMRvXBL0msKv+pZrB5uwmrCcHKfS0CDIT/Z4BFbWWBjJfeM
	 Ofh6a8T8dRDPMPuAL35xXDkBHroktajCPRl8466PE68OVNO7pXbLbVNhQKEstT/ucO
	 RdyW9hB+mVEy0D5Rezmu1BPzKZ/LBGA3e4uR1k/rQAjwGG5KAYyptzShWBH4H/8fNU
	 f7GuxxNhPOP+g==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	guillaume.tucker@collabora.com,
	denys.f@collabora.com,
	ricardo.canuelo@collabora.com
Subject: [PATCH 08/14] treewide: use context manager on file objects
Date: Mon, 13 Mar 2023 17:44:25 +0800
Message-Id: <20230313094431.507952-9-tzungbi@kernel.org>
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

Use context manager on file objects so that the resource is correctly
released even if an exception happens before it calls close().

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 cros/helpers/kernel.py      |  5 ++---
 cros/helpers/mcu.py         | 17 ++++++-----------
 cros/helpers/sysfs.py       | 10 ++++------
 cros/tests/cros_ec_accel.py |  5 ++---
 cros/tests/cros_ec_pwm.py   | 10 ++++------
 cros/tests/cros_ec_rtc.py   |  5 ++---
 6 files changed, 20 insertions(+), 32 deletions(-)

diff --git a/cros/helpers/kernel.py b/cros/helpers/kernel.py
index db0c69f01683..9e4d769c0531 100644
--- a/cros/helpers/kernel.py
+++ b/cros/helpers/kernel.py
@@ -14,9 +14,8 @@ def current_kernel_version():
     """ Returns the current kernel version as an integer you can
         compare.
     """
-    fd = open("/proc/version", "r")
-    current = fd.read().split()[2].split("-")[0].split(".")
-    fd.close()
+    with open("/proc/version", "r") as fh:
+        current = fh.read().split()[2].split("-")[0].split(".")
     return version_to_int(int(current[0]), int(current[1]), int(current[2]))
 
 
diff --git a/cros/helpers/mcu.py b/cros/helpers/mcu.py
index 80e3328cdf08..27ce9ad5cc58 100644
--- a/cros/helpers/mcu.py
+++ b/cros/helpers/mcu.py
@@ -150,7 +150,6 @@ def mcu_hello(s, name):
     """ Checks basic comunication with MCU. """
     if not os.path.exists("/dev/" + name):
         s.skipTest("MCU " + name + " not present, skipping")
-    fd = open("/dev/" + name, "r")
     param = ec_params_hello()
     param.in_data = 0xA0B0C0D0  # magic number that the EC expects on HELLO
 
@@ -163,19 +162,16 @@ def mcu_hello(s, name):
     cmd.outsize = sizeof(response)
 
     memmove(addressof(cmd.data), addressof(param), cmd.insize)
-    fcntl.ioctl(fd, EC_DEV_IOCXCMD, cmd)
+    with open("/dev/" + name, "r") as fh:
+        fcntl.ioctl(fh, EC_DEV_IOCXCMD, cmd)
     memmove(addressof(response), addressof(cmd.data), cmd.outsize)
 
-    fd.close()
-
     s.assertEqual(cmd.result, 0)
     # magic number that the EC answers on HELLO
     s.assertEqual(response.out_data, 0xA1B2C3D4)
 
 def mcu_get_version(name):
     if os.path.exists("/dev/" + name):
-        fd = open("/dev/" + name, "r")
-
         response = ec_response_get_version()
 
         cmd = cros_ec_command()
@@ -184,25 +180,24 @@ def mcu_get_version(name):
         cmd.insize = sizeof(response)
         cmd.outsize = 0
 
-        fcntl.ioctl(fd, EC_DEV_IOCXCMD, cmd)
+        with open("/dev/" + name, "r") as fh:
+            fcntl.ioctl(fh, EC_DEV_IOCXCMD, cmd)
         memmove(addressof(response), addressof(cmd.data), cmd.insize)
 
-        fd.close()
         if cmd.result == 0:
             return response
 
 def mcu_reboot(name):
-    fd = open("/dev/" + name, "r")
     cmd = cros_ec_command()
     cmd.version = 0
     cmd.command = EC_CMD_REBOOT
     cmd.insize = 0
     cmd.outsize = 0
     try:
-        fcntl.ioctl(fd, EC_DEV_IOCXCMD, cmd)
+        with open("/dev/" + name, "r") as fh:
+            fcntl.ioctl(fh, EC_DEV_IOCXCMD, cmd)
     except IOError:
         pass
-    fd.close()
 
 def check_mcu_reboot_rw(s, name):
     if not os.path.exists("/dev/" + name):
diff --git a/cros/helpers/sysfs.py b/cros/helpers/sysfs.py
index 1ccc0cd2ba24..80653fd13431 100755
--- a/cros/helpers/sysfs.py
+++ b/cros/helpers/sysfs.py
@@ -6,9 +6,8 @@ import os
 
 def read_file(name):
     """ Returns the content of the file named 'name'."""
-    fd = open(name, "r")
-    contents = fd.read()
-    fd.close()
+    with open(name, "r") as fh:
+        contents = fh.read()
     return contents
 
 
@@ -21,9 +20,8 @@ def sysfs_check_attributes_exists(s, path, name, files, check_devtype):
     try:
         for devname in os.listdir(path):
             if check_devtype:
-                fd = open(path + "/" + devname + "/name", "r")
-                devtype = fd.read()
-                fd.close()
+                with open(path + "/" + devname + "/name", "r") as fh:
+                    devtype = fh.read()
                 if not devtype.startswith(name):
                     continue
             else:
diff --git a/cros/tests/cros_ec_accel.py b/cros/tests/cros_ec_accel.py
index 8861eb0e1c2c..b76d2a6fbb4d 100755
--- a/cros/tests/cros_ec_accel.py
+++ b/cros/tests/cros_ec_accel.py
@@ -57,8 +57,8 @@ class TestCrosECAccel(unittest.TestCase):
         try:
             for devname in os.listdir("/sys/bus/iio/devices"):
                 base_path = "/sys/bus/iio/devices/" + devname + "/"
-                fd = open(base_path + "name", "r")
-                devtype = fd.read()
+                with open(base_path + "name", "r") as fh:
+                    devtype = fh.read()
                 if devtype.startswith("cros-ec-accel"):
                     location = read_file(base_path + "location")
                     accel_scale = float(read_file(base_path + "scale"))
@@ -73,7 +73,6 @@ class TestCrosECAccel(unittest.TestCase):
                     mag = math.sqrt(mag)
                     self.assertTrue(abs(mag - exp) <= err)
                     match += 1
-                fd.close()
         except IOError as e:
             self.skipTest("Exception occured: {0}, skipping".format(e.strerror))
         if match == 0:
diff --git a/cros/tests/cros_ec_pwm.py b/cros/tests/cros_ec_pwm.py
index ba429a327db1..2b7b4a3418b1 100644
--- a/cros/tests/cros_ec_pwm.py
+++ b/cros/tests/cros_ec_pwm.py
@@ -31,12 +31,10 @@ class TestCrosECPWM(unittest.TestCase):
         fd.close()
         if not is_ec_pwm:
             self.skipTest("No EC backlight pwm found, skipping")
-        fd = open("/sys/class/backlight/backlight/max_brightness", "r")
-        brightness = int(int(fd.read()) / 2)
-        fd.close()
-        fd = open("/sys/class/backlight/backlight/brightness", "w")
-        fd.write(str(brightness))
-        fd.close()
+        with open("/sys/class/backlight/backlight/max_brightness", "r") as fh:
+            brightness = int(int(fh.read()) / 2)
+        with open("/sys/class/backlight/backlight/brightness", "w") as fh:
+            fh.write(str(brightness))
 
         with open("/sys/kernel/debug/pwm", "r") as fh:
             for line in fh:
diff --git a/cros/tests/cros_ec_rtc.py b/cros/tests/cros_ec_rtc.py
index 9f497d2fcb7e..7afed70f0429 100755
--- a/cros/tests/cros_ec_rtc.py
+++ b/cros/tests/cros_ec_rtc.py
@@ -14,9 +14,8 @@ class TestCrosECRTC(unittest.TestCase):
         match = 0
         try:
             for devname in os.listdir("/sys/class/rtc"):
-                fd = open("/sys/class/rtc/" + devname + "/name", "r")
-                devtype = fd.read()
-                fd.close()
+                with open("/sys/class/rtc/" + devname + "/name", "r") as fh:
+                    devtype = fh.read()
                 if devtype.startswith("cros-ec-rtc"):
                     files = [
                         "date",
-- 
2.40.0.rc1.284.g88254d51c5-goog

