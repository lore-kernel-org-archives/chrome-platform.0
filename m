Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A898D30DD3C
	for <chrome-platform@lists.linux.dev>; Fri,  7 Nov 2025 20:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762546220; cv=none; b=mjS/xYV9PtrTNgczGB8D22p3OcRnAN1vx3XfbNBJEe/N6u6+Q1GgF+6EoBe/wql+P889q0u1u5WvWZyZdyzm7GV0rKp+KXcy1LBg1NpYLMpPBELIo41YPUAO47oDue67nepq/A7EQW5vrj2wtDDALaMKr4nFEoB76q0IYNiGEs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762546220; c=relaxed/simple;
	bh=ud1/96IUeRP+Bx2biumyTkRJpYJUg2NbiGKWfKUmRbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i2R0d9WMoXNOQdKAKEyWH9FY3S0701ijA5HKBaIZVit205IDzJoyjaskEuy3CfeRB97eoVWwxAKEh/gBRqdlj14Nqu2lLRXaIhYg28ekusbxhCw2H71g1PGtmvUTCq7YwLtp7200ptNBRObx5R31dKEXnNlmSPkhOffGmd2ONhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Be0xm+Z7; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Be0xm+Z7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762546219; x=1794082219;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ud1/96IUeRP+Bx2biumyTkRJpYJUg2NbiGKWfKUmRbw=;
  b=Be0xm+Z7Fs9T4XvBRN27AYxdhrMfKJuALCryfIDg/wa2jmxWAfvymmfw
   6TWNAAg8lbK8VzECkj/iAO65tsSta2gUW0DS4bLDvWlX7abzc2uB2ZvZr
   r4eFoP1UguraM/KNPaRVjMl7RW1uhNGBgcaD4OEkgSSsDJlCKzzwHI2+n
   pCOER0l00A3P2zvi/5SuF/N91Ob6AVmer6JnDZruhera+4r02XHwjncJg
   xBhx0zI1HQs35u/ljezKWwFG7tKRWn0/E2YRQBR3bJZCl+C+eoCq6jp28
   UqrDg5slMdOE4q9oewPU+17bIZiY4z3Fx9sk4imjQtiMRrt2YsCkkW1Of
   Q==;
X-CSE-ConnectionGUID: 365qZg1mRSiIn3SUylAekg==
X-CSE-MsgGUID: 7HATUX2IQ1iYvPWP8oTnJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64855259"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="64855259"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 12:10:18 -0800
X-CSE-ConnectionGUID: 3jq1ptbVQAa2Kp7bUKTyoQ==
X-CSE-MsgGUID: Wnku1eHJSLu6IyykDen4gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="188285318"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 07 Nov 2025 12:10:15 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id F12BF9B; Fri, 07 Nov 2025 21:10:09 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-iio@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	"Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Subject: [PATCH v2 6/6] iio: position: iqs624-pos: Convert to use PI definition
Date: Fri,  7 Nov 2025 21:03:04 +0100
Message-ID: <20251107201005.3156118-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251107201005.3156118-1-andriy.shevchenko@linux.intel.com>
References: <20251107201005.3156118-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert to use PI definition instead of open coded value of it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/iio/position/iqs624-pos.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/position/iqs624-pos.c b/drivers/iio/position/iqs624-pos.c
index 8239239c6ee2..24d7a2591858 100644
--- a/drivers/iio/position/iqs624-pos.c
+++ b/drivers/iio/position/iqs624-pos.c
@@ -15,10 +15,11 @@
 #include <linux/notifier.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/units.h>
 
 #define IQS624_POS_DEG_OUT			0x16
 
-#define IQS624_POS_SCALE1			(314159 / 180)
+#define IQS624_POS_SCALE1			(PI / 180000)
 #define IQS624_POS_SCALE2			100000
 
 struct iqs624_pos_private {
-- 
2.50.1

