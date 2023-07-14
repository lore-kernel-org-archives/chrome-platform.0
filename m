Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A184014A83
	for <chrome-platform@lists.linux.dev>; Fri, 14 Jul 2023 17:49:57 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3463de183b0so9765395ab.2
        for <chrome-platform@lists.linux.dev>; Fri, 14 Jul 2023 10:49:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689356996; x=1691948996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Zl9ZOznQn0z/OyvCDvuTYi3+h4lEQZHsyG8cOFSOc4=;
        b=XL5J7z28Ea49prww8sXepDW6JmuMKxZkysvVbyiu3bfxNvr1Yxi5aR8KQja71SAFY0
         R5LrM/ADUxQqBH36YNn8IoI/xzU8JIoAC8ZOanTrdAluAFHlcSgzXG/ql0W+o3GUWmxh
         p/rszHHEJoJlINBTW/hiK8I0HvVIU3vNh6OLLqjnxJAgWoNgQ4gcVPXtj2jBd5Lln7Ij
         3OROHrWJT7/IbKtSM/MSnFMX8tlSaCOwi4fVL6+1OInUNDILXzJqxhWmAUTFle/ACkNg
         DWg5llDk47Lal1pr+ujw4GAkUQCx3rrj2Z/Quqq8tpM1jdW9eMK/oaUfREZbiLhUBgDy
         SJtw==
X-Gm-Message-State: ABy/qLY4swwdd4F3G1gtvkg/81eIh6yz07kIX+P/j3e69HkNsRpSFUZM
	kX7cKdvZGgYf3qoi2ai5i2JVQx4ZFja2
X-Google-Smtp-Source: APBJJlHyhOQHM8DYxUbkCpRl+VNuf7Fk5/wUH7gPm88oLEInYJkKFUKSDSTtUF7PbOeG9gGJZIAX0Q==
X-Received: by 2002:a05:6e02:933:b0:346:50ce:d602 with SMTP id o19-20020a056e02093300b0034650ced602mr4857766ilt.1.1689356996535;
        Fri, 14 Jul 2023 10:49:56 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id h7-20020a02b607000000b0042b1d495aecsm2711161jam.123.2023.07.14.10.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 10:49:55 -0700 (PDT)
Received: (nullmailer pid 4062949 invoked by uid 1000);
	Fri, 14 Jul 2023 17:49:17 -0000
From: Rob Herring <robh@kernel.org>
To: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Cc: devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform: Explicitly include correct DT includes
Date: Fri, 14 Jul 2023 11:49:09 -0600
Message-Id: <20230714174909.4062739-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/platform/chrome/cros_ec.c          | 1 +
 drivers/platform/mellanox/mlxreg-hotplug.c | 1 -
 drivers/platform/mellanox/mlxreg-io.c      | 1 -
 3 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index 8b7949220382..5d36fbc75e1b 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -12,6 +12,7 @@
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_ec_proto.h>
 #include <linux/slab.h>
diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index b7dcc64cd238..6ddfea0d4c5b 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -12,7 +12,6 @@
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/platform_data/mlxreg.h>
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
diff --git a/drivers/platform/mellanox/mlxreg-io.c b/drivers/platform/mellanox/mlxreg-io.c
index ddc08abf398c..83ba037408cd 100644
--- a/drivers/platform/mellanox/mlxreg-io.c
+++ b/drivers/platform/mellanox/mlxreg-io.c
@@ -11,7 +11,6 @@
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/platform_data/mlxreg.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
-- 
2.40.1

