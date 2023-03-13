Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C329D23A7
	for <chrome-platform@lists.linux.dev>; Mon, 13 Mar 2023 09:44:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7450DC433EF;
	Mon, 13 Mar 2023 09:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678700698;
	bh=SaNWtsEe4AGb2/cI0tzOdT8HUbmnOBPRLv6v1h4G9gM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c/2teot32nw7MXk2V7QzdRrkezNL2S2UWjAk8Ow8tJ/Mi01vb2YM85qUy+fkku2JL
	 n+szFDlBCxXnvwYu2wjVUjR8o4RJSVusnC77gdloW8PyP6TnyEsNPwPcySGNyeWmdt
	 BTHbXbiBjrReo+jGFaazCaF6aTFII87C8ZUDQ/k4Zqf9OrL+CKTlyWUYZbGpb3uKri
	 MpvBhQyURbG4cb62qZa3smKB3uMqNzlfMVyUB4iFDy85b9DewU1r7d8Ni4AIq0eXSW
	 Nq5GI4BOe1c1TFIfziYONwvLeVAmQ1JX9Vei+LSY2oFSpNu9y1VRMKSRKRCD1bfJ5W
	 CyqGF37b3Vglg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	guillaume.tucker@collabora.com,
	denys.f@collabora.com,
	ricardo.canuelo@collabora.com
Subject: [PATCH 13/14] treewide: don't use "+" operator for constructing paths
Date: Mon, 13 Mar 2023 17:44:30 +0800
Message-Id: <20230313094431.507952-14-tzungbi@kernel.org>
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

Don't use "+" operator for constructing paths.  Use os.path.join()
instead.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 cros/helpers/mcu.py          | 19 ++++++++++++-------
 cros/helpers/sysfs.py        |  6 ++++--
 cros/tests/cros_ec_accel.py  | 10 +++++-----
 cros/tests/cros_ec_extcon.py | 11 ++++++-----
 cros/tests/cros_ec_rtc.py    |  5 +++--
 5 files changed, 30 insertions(+), 21 deletions(-)

diff --git a/cros/helpers/mcu.py b/cros/helpers/mcu.py
index 6c12affd4073..e2d2db0ef1ed 100644
--- a/cros/helpers/mcu.py
+++ b/cros/helpers/mcu.py
@@ -132,7 +132,8 @@ def check_mcu_abi(s, name):
     """ Checks that the MCU character device exists in /dev and then verifies
         the standard MCU ABI in /sys/class/chromeos.
     """
-    if not os.path.exists("/dev/" + name):
+    dev = os.path.join("/dev", name)
+    if not os.path.exists(dev):
         s.skipTest("MCU " + name + " not supported, skipping")
     files = ["flashinfo", "reboot", "version"]
     sysfs_check_attributes_exists(
@@ -142,7 +143,8 @@ def check_mcu_abi(s, name):
 
 def mcu_hello(s, name):
     """ Checks basic comunication with MCU. """
-    if not os.path.exists("/dev/" + name):
+    dev = os.path.join("/dev", name)
+    if not os.path.exists(dev):
         s.skipTest("MCU " + name + " not present, skipping")
     param = ec_params_hello()
     param.in_data = 0xA0B0C0D0  # magic number that the EC expects on HELLO
@@ -156,7 +158,7 @@ def mcu_hello(s, name):
     cmd.outsize = sizeof(response)
 
     memmove(addressof(cmd.data), addressof(param), cmd.insize)
-    with open("/dev/" + name) as fh:
+    with open(dev) as fh:
         fcntl.ioctl(fh, EC_DEV_IOCXCMD, cmd)
     memmove(addressof(response), addressof(cmd.data), cmd.outsize)
 
@@ -165,7 +167,8 @@ def mcu_hello(s, name):
     s.assertEqual(response.out_data, 0xA1B2C3D4)
 
 def mcu_get_version(name):
-    if os.path.exists("/dev/" + name):
+    dev = os.path.join("/dev", name)
+    if os.path.exists(dev):
         response = ec_response_get_version()
 
         cmd = cros_ec_command()
@@ -174,7 +177,7 @@ def mcu_get_version(name):
         cmd.insize = sizeof(response)
         cmd.outsize = 0
 
-        with open("/dev/" + name) as fh:
+        with open(dev) as fh:
             fcntl.ioctl(fh, EC_DEV_IOCXCMD, cmd)
         memmove(addressof(response), addressof(cmd.data), cmd.insize)
 
@@ -188,13 +191,15 @@ def mcu_reboot(name):
     cmd.insize = 0
     cmd.outsize = 0
     try:
-        with open("/dev/" + name) as fh:
+        dev = os.path.join("/dev", name)
+        with open(dev) as fh:
             fcntl.ioctl(fh, EC_DEV_IOCXCMD, cmd)
     except IOError:
         pass
 
 def check_mcu_reboot_rw(s, name):
-    if not os.path.exists("/dev/" + name):
+    dev = os.path.join("/dev", name)
+    if not os.path.exists(dev):
         s.skipTest("cros_fp not present, skipping")
     mcu_reboot(name)
     response = mcu_get_version(name)
diff --git a/cros/helpers/sysfs.py b/cros/helpers/sysfs.py
index 4d3b6735ef45..882bc4d14243 100755
--- a/cros/helpers/sysfs.py
+++ b/cros/helpers/sysfs.py
@@ -20,7 +20,8 @@ def sysfs_check_attributes_exists(s, path, name, files, check_devtype):
     try:
         for devname in os.listdir(path):
             if check_devtype:
-                with open(path + "/" + devname + "/name") as fh:
+                p = os.path.join(path, devname, "name")
+                with open(p) as fh:
                     devtype = fh.read()
                 if not devtype.startswith(name):
                     continue
@@ -29,7 +30,8 @@ def sysfs_check_attributes_exists(s, path, name, files, check_devtype):
                     continue
             match += 1
             for filename in files:
-                s.assertEqual(os.path.exists(path + "/" + devname + "/" + filename), 1)
+                p = os.path.join(path, devname, filename)
+                s.assertEqual(os.path.exists(p), 1)
     except IOError as e:
             s.skipTest("Exception occured: {0}, skipping".format(e.strerror))
     if match == 0:
diff --git a/cros/tests/cros_ec_accel.py b/cros/tests/cros_ec_accel.py
index 3d6a54acac16..15a92b7dd35d 100755
--- a/cros/tests/cros_ec_accel.py
+++ b/cros/tests/cros_ec_accel.py
@@ -56,17 +56,17 @@ class TestCrosECAccel(unittest.TestCase):
         match = 0
         try:
             for devname in os.listdir("/sys/bus/iio/devices"):
-                base_path = "/sys/bus/iio/devices/" + devname + "/"
-                with open(base_path + "name") as fh:
+                base_path = os.path.join("/sys/bus/iio/devices", devname)
+                with open(os.path.join(base_path, "name")) as fh:
                     devtype = fh.read()
                 if devtype.startswith("cros-ec-accel"):
-                    location = read_file(base_path + "location")
-                    accel_scale = float(read_file(base_path + "scale"))
+                    location = read_file(os.path.join(base_path, "location"))
+                    accel_scale = float(read_file(os.path.join(base_path, "scale")))
                     exp = ACCEL_1G_IN_MS2
                     err = exp * ACCEL_MAG_VALID_OFFSET
                     mag = 0
                     for axis in ["x", "y", "z"]:
-                        axis_path = base_path + "in_accel_" + axis + "_raw"
+                        axis_path = os.path.join(base_path, "in_accel_" + axis + "_raw")
                         value = int(read_file(axis_path))
                         value *= accel_scale
                         mag += value * value
diff --git a/cros/tests/cros_ec_extcon.py b/cros/tests/cros_ec_extcon.py
index b2864b52f4c0..8c496b868bb3 100755
--- a/cros/tests/cros_ec_extcon.py
+++ b/cros/tests/cros_ec_extcon.py
@@ -11,22 +11,23 @@ class TestCrosECextcon(unittest.TestCase):
         match = 0
         try:
             for devname in os.listdir("/sys/class/extcon"):
-                devtype = read_file("/sys/class/extcon/" + devname + "/name")
+                d = os.path.join("/sys/class/extcon", devname)
+                devtype = read_file(os.path.join(d, "name"))
                 if ".spi:ec@0:extcon@" in devtype:
                     self.assertEqual(
-                        os.path.exists("/sys/class/extcon/" + devname + "/state"), 1
+                        os.path.exists(os.path.join(d, "state")), 1
                     )
-                    for cable in os.listdir("/sys/class/extcon/" + devname):
+                    for cable in os.listdir(d):
                         if cable.startswith("cable"):
                             self.assertEqual(
                                 os.path.exists(
-                                    "/sys/class/extcon/" + devname + "/" + cable + "/name"
+                                    os.path.join(d, cable, "name")
                                 ),
                                 1,
                             )
                             self.assertEqual(
                                 os.path.exists(
-                                    "/sys/class/extcon/" + devname + "/" + cable + "/state"
+                                    os.path.join(d, cable, "state")
                                 ),
                                 1,
                             )
diff --git a/cros/tests/cros_ec_rtc.py b/cros/tests/cros_ec_rtc.py
index e59fa383659d..2d1ef3d58d85 100755
--- a/cros/tests/cros_ec_rtc.py
+++ b/cros/tests/cros_ec_rtc.py
@@ -14,7 +14,8 @@ class TestCrosECRTC(unittest.TestCase):
         match = 0
         try:
             for devname in os.listdir("/sys/class/rtc"):
-                with open("/sys/class/rtc/" + devname + "/name") as fh:
+                d = os.path.join("/sys/class/rtc", devname)
+                with open(os.path.join(d, "name")) as fh:
                     devtype = fh.read()
                 if devtype.startswith("cros-ec-rtc"):
                     files = [
@@ -28,7 +29,7 @@ class TestCrosECRTC(unittest.TestCase):
                     match += 1
                     for filename in files:
                         self.assertEqual(
-                            os.path.exists("/sys/class/rtc/" + devname + "/" + filename), 1
+                            os.path.exists(os.path.join(d, filename)), 1
                         )
         except IOError as e:
             self.skipTest("Exception occured: {0}, skipping".format(e.strerror))
-- 
2.40.0.rc1.284.g88254d51c5-goog

