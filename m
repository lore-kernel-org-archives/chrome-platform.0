Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480B123A7
	for <chrome-platform@lists.linux.dev>; Mon, 13 Mar 2023 09:45:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEDEAC4339C;
	Mon, 13 Mar 2023 09:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678700700;
	bh=rsnSL6GguEiZ0FKVcjrYvBFmFEAcSMqqw3PXRx1ugZw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TRuYUBau+0vmGEGOfGjnj6ywyN1jg+j/IWQyrlPWx1FpbR+0Pq2Ph/L7clUSlPD5p
	 hqQf+iMStYK2J4f1khRdRZCLCVLHQNbC/DmB0H7YPeU5jUtfc4LW+P9Pq1r1eL+4PC
	 CbGPJLsyAeESuFLAV2bshKTM/DYo5u8iRJO1d/bxx6ZF1ZKPCHhV/ZoRf8NuK6072y
	 5Qd8dkZOpLqaYJbTTR+zMyoA5i35AVXvQ9SjwBY0po+VttJ1X7YeW1nDsS/0RBWAow
	 eyn2Qhq4bfe/gW61fmeZdXm+vZag29Th2elg7oEld3/3/u0UxO0vwbc+hbFWi7baSB
	 y5mgxEMVDeUZA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	guillaume.tucker@collabora.com,
	denys.f@collabora.com,
	ricardo.canuelo@collabora.com
Subject: [PATCH 14/14] treewide: don't use "+" operator for concatenating strings
Date: Mon, 13 Mar 2023 17:44:31 +0800
Message-Id: <20230313094431.507952-15-tzungbi@kernel.org>
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

Don't use "+" operator for concatenating strings.  Use f-string instead.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 cros/helpers/mcu.py         | 4 ++--
 cros/tests/cros_ec_accel.py | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/cros/helpers/mcu.py b/cros/helpers/mcu.py
index e2d2db0ef1ed..d756f25a9c6e 100644
--- a/cros/helpers/mcu.py
+++ b/cros/helpers/mcu.py
@@ -134,7 +134,7 @@ def check_mcu_abi(s, name):
     """
     dev = os.path.join("/dev", name)
     if not os.path.exists(dev):
-        s.skipTest("MCU " + name + " not supported, skipping")
+        s.skipTest(f"MCU {name} not supported, skipping")
     files = ["flashinfo", "reboot", "version"]
     sysfs_check_attributes_exists(
         s, "/sys/class/chromeos/", name, files, False
@@ -145,7 +145,7 @@ def mcu_hello(s, name):
     """ Checks basic comunication with MCU. """
     dev = os.path.join("/dev", name)
     if not os.path.exists(dev):
-        s.skipTest("MCU " + name + " not present, skipping")
+        s.skipTest(f"MCU {name} not present, skipping")
     param = ec_params_hello()
     param.in_data = 0xA0B0C0D0  # magic number that the EC expects on HELLO
 
diff --git a/cros/tests/cros_ec_accel.py b/cros/tests/cros_ec_accel.py
index 15a92b7dd35d..22d7affe3632 100755
--- a/cros/tests/cros_ec_accel.py
+++ b/cros/tests/cros_ec_accel.py
@@ -66,7 +66,7 @@ class TestCrosECAccel(unittest.TestCase):
                     err = exp * ACCEL_MAG_VALID_OFFSET
                     mag = 0
                     for axis in ["x", "y", "z"]:
-                        axis_path = os.path.join(base_path, "in_accel_" + axis + "_raw")
+                        axis_path = os.path.join(base_path, f"in_accel_{axis}_raw")
                         value = int(read_file(axis_path))
                         value *= accel_scale
                         mag += value * value
-- 
2.40.0.rc1.284.g88254d51c5-goog

