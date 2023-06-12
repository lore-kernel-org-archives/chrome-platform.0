Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5026AC8C1
	for <chrome-platform@lists.linux.dev>; Mon, 12 Jun 2023 21:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686605012; x=1718141012;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OnJIaM6mT/0GSvLlclpAypaShpM1x4qhu+renP9R2l8=;
  b=NdZtoBGDuxzrAxnrTrmlx33X9Y8JTWXAEf/7MZeOZWF0JDRQsQYY8nsO
   TCrcU0SwA/S7gAMqzkVPtVexPMVbNkXRDgKFcBmqBUMnrxojWSdKu6H92
   G3VCoocs+LVqadgCT+JgNnosvERRQ1vRXCbU/L0xrertRvHZUVYkWT6N2
   RMt/AY7soBiXV1vzFNscab5AFwIu00MIHSMJzvg5JIf+IjegzHcCw1Q9a
   uAh+5llPZHno4C4HjQgFGdW8hLBheUcS3ah+zxpodOIKFeGwXJVqZQamt
   zeCcgpBqADPhrmMKMOBL84DHysAt6T333sxL/SfdaphKVMNy587RGfpUu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="444542961"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="444542961"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 14:23:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="705539158"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="705539158"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 12 Jun 2023 14:23:29 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id DF037357; Tue, 13 Jun 2023 00:23:37 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Subject: [PATCH v1 1/1] platform/chrome: cros_ec_spi: Use %*ph for printing hexdump of a small buffer
Date: Tue, 13 Jun 2023 00:23:36 +0300
Message-Id: <20230612212336.4961-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel already has a helper to print a hexdump of a small
buffer via pointer extension. Use that instead of open coded
variant.

In long term it helps to kill pr_cont() or at least narrow down
its use.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/chrome/cros_ec_spi.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_spi.c b/drivers/platform/chrome/cros_ec_spi.c
index 21143dba8970..3e88cc92e819 100644
--- a/drivers/platform/chrome/cros_ec_spi.c
+++ b/drivers/platform/chrome/cros_ec_spi.c
@@ -104,13 +104,7 @@ static void debug_packet(struct device *dev, const char *name, u8 *ptr,
 			 int len)
 {
 #ifdef DEBUG
-	int i;
-
-	dev_dbg(dev, "%s: ", name);
-	for (i = 0; i < len; i++)
-		pr_cont(" %02x", ptr[i]);
-
-	pr_cont("\n");
+	dev_dbg(dev, "%s: %*ph\n", name, len, ptr);
 #endif
 }
 
-- 
2.40.0.1.gaa8946217a0b

