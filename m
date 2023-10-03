Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903D7D536
	for <chrome-platform@lists.linux.dev>; Tue,  3 Oct 2023 08:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9922EC433C7;
	Tue,  3 Oct 2023 08:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696320319;
	bh=+EXXE5qyb6OZuQ1N71rzLp8clhZBybJ1yv6PlQDVyis=;
	h=From:To:Cc:Subject:Date:From;
	b=NRgLHI9aiPaCoFd5yMu7iVLZAT/vWgi90qpweKFFJjg5oqu5R39TzEF2vvoxfjbzW
	 JfutX2ZG8G0mamQ7ZKasTzUuDBbEMAX0Rvg9DerNGL+sQWcdyQn+euUSYWbutot3S8
	 aUADVuibBKce7FNrVpGKBwqiS04vxW1U6+KZ/9K6jZDlvkKg3776i+RTcmKWLmdGRn
	 L1ILIEzjk+gQDBO19CcGOv/ZJU4RCdhFKakPg6iY4ufMnsJFqZJpLil9bpOaQOeExG
	 E/Z+kpW9RzShGx7GorUXCx/LvV0/uadPQxW4mX5IgQ30k97/p1h3I7XN9OWXhAOTsN
	 KvazeW3R4aBSw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: tzungbi@kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH] platform/chrome: kunit: make EC protocol tests independent
Date: Tue,  3 Oct 2023 08:05:15 +0000
Message-ID: <20231003080515.4011374-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove CONFIG_CROS_KUNIT and common code concept for ChromeOS Kunit but
make it bundle to ChromeOS EC protocol tests.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/Kconfig                             | 6 +++---
 drivers/platform/chrome/Makefile                            | 5 ++---
 drivers/platform/chrome/cros_ec_proto_test.c                | 2 +-
 .../chrome/{cros_kunit_util.c => cros_ec_proto_test_util.c} | 4 +---
 .../chrome/{cros_kunit_util.h => cros_ec_proto_test_util.h} | 0
 5 files changed, 7 insertions(+), 10 deletions(-)
 rename drivers/platform/chrome/{cros_kunit_util.c => cros_ec_proto_test_util.c} (98%)
 rename drivers/platform/chrome/{cros_kunit_util.h => cros_ec_proto_test_util.h} (100%)

diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
index 7d82a0946e1c..7a83346bfa53 100644
--- a/drivers/platform/chrome/Kconfig
+++ b/drivers/platform/chrome/Kconfig
@@ -299,12 +299,12 @@ config CROS_TYPEC_SWITCH
 source "drivers/platform/chrome/wilco_ec/Kconfig"
 
 # Kunit test cases
-config CROS_KUNIT
-	tristate "Kunit tests for ChromeOS" if !KUNIT_ALL_TESTS
+config CROS_KUNIT_EC_PROTO_TEST
+	tristate "Kunit tests for ChromeOS EC protocol" if !KUNIT_ALL_TESTS
 	depends on KUNIT && CROS_EC
 	default KUNIT_ALL_TESTS
 	select CROS_EC_PROTO
 	help
-	  ChromeOS Kunit tests.
+	  Kunit tests for ChromeOS EC protocol.
 
 endif # CHROMEOS_PLATFORMS
diff --git a/drivers/platform/chrome/Makefile b/drivers/platform/chrome/Makefile
index 9e26e45c4a37..2dcc6ccc2302 100644
--- a/drivers/platform/chrome/Makefile
+++ b/drivers/platform/chrome/Makefile
@@ -36,6 +36,5 @@ obj-$(CONFIG_CROS_USBPD_NOTIFY)		+= cros_usbpd_notify.o
 obj-$(CONFIG_WILCO_EC)			+= wilco_ec/
 
 # Kunit test cases
-obj-$(CONFIG_CROS_KUNIT)		+= cros_kunit.o
-cros_kunit-objs				:= cros_kunit_util.o
-cros_kunit-objs				+= cros_ec_proto_test.o
+obj-$(CONFIG_CROS_KUNIT_EC_PROTO_TEST)	+= cros_kunit_proto_test.o
+cros_kunit_proto_test-objs		:= cros_ec_proto_test_util.o cros_ec_proto_test.o
diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
index 5b9748e0463b..28f722396fc1 100644
--- a/drivers/platform/chrome/cros_ec_proto_test.c
+++ b/drivers/platform/chrome/cros_ec_proto_test.c
@@ -11,7 +11,7 @@
 #include <linux/platform_data/cros_ec_proto.h>
 
 #include "cros_ec.h"
-#include "cros_kunit_util.h"
+#include "cros_ec_proto_test_util.h"
 
 #define BUFSIZE 512
 
diff --git a/drivers/platform/chrome/cros_kunit_util.c b/drivers/platform/chrome/cros_ec_proto_test_util.c
similarity index 98%
rename from drivers/platform/chrome/cros_kunit_util.c
rename to drivers/platform/chrome/cros_ec_proto_test_util.c
index f0fda96b11bd..65d328bcd6eb 100644
--- a/drivers/platform/chrome/cros_kunit_util.c
+++ b/drivers/platform/chrome/cros_ec_proto_test_util.c
@@ -11,7 +11,7 @@
 #include <linux/platform_data/cros_ec_proto.h>
 
 #include "cros_ec.h"
-#include "cros_kunit_util.h"
+#include "cros_ec_proto_test_util.h"
 
 int cros_kunit_ec_xfer_mock_default_result;
 int cros_kunit_ec_xfer_mock_default_ret;
@@ -126,5 +126,3 @@ void cros_kunit_mock_reset(void)
 	cros_kunit_readmem_mock_data = NULL;
 	cros_kunit_readmem_mock_ret = 0;
 }
-
-MODULE_LICENSE("GPL");
diff --git a/drivers/platform/chrome/cros_kunit_util.h b/drivers/platform/chrome/cros_ec_proto_test_util.h
similarity index 100%
rename from drivers/platform/chrome/cros_kunit_util.h
rename to drivers/platform/chrome/cros_ec_proto_test_util.h
-- 
2.42.0.582.g8ccd20d70d-goog

