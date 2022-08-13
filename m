Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F55257D
	for <chrome-platform@lists.linux.dev>; Sat, 13 Aug 2022 20:18:57 +0000 (UTC)
Received: from localhost.localdomain (unknown [178.129.182.214])
	by mail.ispras.ru (Postfix) with ESMTPSA id 707DF40737A6;
	Sat, 13 Aug 2022 20:09:11 +0000 (UTC)
From: Rustam Subkhankulov <subkhankulov@ispras.ru>
To: Benson Leung <bleung@chromium.org>
Cc: Rustam Subkhankulov <subkhankulov@ispras.ru>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	ldv-project@linuxtesting.org
Subject: [PATCH] platform/chrome: fix double-free in chromeos_laptop_prepare()
Date: Sun, 14 Aug 2022 01:08:43 +0300
Message-Id: <20220813220843.2373004-1-subkhankulov@ispras.ru>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If chromeos_laptop_prepare_i2c_peripherals() fails after allocating memory
for 'cros_laptop->i2c_peripherals', this memory is freed at 'err_out' label
and nonzero value is returned. Then chromeos_laptop_destroy() is called,
resulting in double-free error.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Rustam Subkhankulov <subkhankulov@ispras.ru>
Fixes: 5020cd29d8bf ("platform/chrome: chromeos_laptop - supply properties for ACPI devices")
---
 drivers/platform/chrome/chromeos_laptop.c | 24 ++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/chrome/chromeos_laptop.c b/drivers/platform/chrome/chromeos_laptop.c
index 4e14b4d6635d..a2cdbfbaeae6 100644
--- a/drivers/platform/chrome/chromeos_laptop.c
+++ b/drivers/platform/chrome/chromeos_laptop.c
@@ -740,6 +740,7 @@ static int __init
 chromeos_laptop_prepare_i2c_peripherals(struct chromeos_laptop *cros_laptop,
 					const struct chromeos_laptop *src)
 {
+	struct i2c_peripheral *i2c_peripherals;
 	struct i2c_peripheral *i2c_dev;
 	struct i2c_board_info *info;
 	int i;
@@ -748,17 +749,15 @@ chromeos_laptop_prepare_i2c_peripherals(struct chromeos_laptop *cros_laptop,
 	if (!src->num_i2c_peripherals)
 		return 0;
 
-	cros_laptop->i2c_peripherals = kmemdup(src->i2c_peripherals,
-					       src->num_i2c_peripherals *
-						sizeof(*src->i2c_peripherals),
-					       GFP_KERNEL);
-	if (!cros_laptop->i2c_peripherals)
+	i2c_peripherals = kmemdup(src->i2c_peripherals,
+					      src->num_i2c_peripherals *
+					  sizeof(*src->i2c_peripherals),
+					  GFP_KERNEL);
+	if (!i2c_peripherals)
 		return -ENOMEM;
 
-	cros_laptop->num_i2c_peripherals = src->num_i2c_peripherals;
-
-	for (i = 0; i < cros_laptop->num_i2c_peripherals; i++) {
-		i2c_dev = &cros_laptop->i2c_peripherals[i];
+	for (i = 0; i < src->num_i2c_peripherals; i++) {
+		i2c_dev = &i2c_peripherals[i];
 		info = &i2c_dev->board_info;
 
 		error = chromeos_laptop_setup_irq(i2c_dev);
@@ -775,16 +774,19 @@ chromeos_laptop_prepare_i2c_peripherals(struct chromeos_laptop *cros_laptop,
 		}
 	}
 
+	cros_laptop->i2c_peripherals = i2c_peripherals;
+	cros_laptop->num_i2c_peripherals = src->num_i2c_peripherals;
+
 	return 0;
 
 err_out:
 	while (--i >= 0) {
-		i2c_dev = &cros_laptop->i2c_peripherals[i];
+		i2c_dev = &i2c_peripherals[i];
 		info = &i2c_dev->board_info;
 		if (!IS_ERR_OR_NULL(info->fwnode))
 			fwnode_remove_software_node(info->fwnode);
 	}
-	kfree(cros_laptop->i2c_peripherals);
+	kfree(i2c_peripherals);
 	return error;
 }
 
-- 
2.34.1

