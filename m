Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFD7308F3D
	for <chrome-platform@lists.linux.dev>; Mon, 27 Oct 2025 14:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761575942; cv=none; b=VGNOVd5ug9sTTHGKzyzoY90pMXwme+1NKge0ZXiOL++hTps+riSz0ZOMDtguy750sSlcBp7J+FC8PGXy2LTSoCU23UC8VcOd+UWuxzic/8cty7i+OzQj7Z/6h3SorxoKcaLLXltutBVORvfDzIRAwA837FjP+wkY7FEvO6v+BKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761575942; c=relaxed/simple;
	bh=0mf6KVr/j+MOBfxqbaBzUm0ypZGxlXyGgTneCJcNaf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lcPplV2RN5aTHspmmxjt1yl3G1qFVjWc4ORpbsLlgfJbfwM5TTSjJXLcyI+F/rka/TwpRBWXV1nl33/nQn6of7XAkY2btlnlANvAeLgcrBbGFswLBoskVGVbGk4HX/Lynxarf6i/vG8CzLmrRWTCjQ/n7IOW7r3vFrOfiqaP5bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lx9HxSgO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lx9HxSgO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761575940; x=1793111940;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0mf6KVr/j+MOBfxqbaBzUm0ypZGxlXyGgTneCJcNaf8=;
  b=lx9HxSgOuiSAubt6kKo3DmBQkOHrSwHhnRGAVvWJgYqhcqklvwCKNv/Q
   Lanjuy9YL341YZnbDzQnEVOaQymBWH9rR4hZlOBbvNhfN17LhjhOULmTX
   JHYJsBH1a7RZccnXEu8yozntIGeq3O17/7JgY7KsNwF+xGhI/0AYckDGC
   r0k7NR9qTcC6y7eLyEvpff9in4hc3z7GNGGC5CMbRnIuoOqS+wLDfAHee
   EIwtcReutLm3+j9PWzkWB/2/lGZgcIAlf3zVFadLvWsaeBw0ZE7m5iwwc
   rBx2LD2fQg5nSfD+iRKdg1xkGtfdVJIvt50CkrQW0wlXJfGfWmy4ZIyr+
   w==;
X-CSE-ConnectionGUID: SKlp2WGOSImH0TOEaduNWg==
X-CSE-MsgGUID: WIojlkvbSTKoZUv4nQEifw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67299502"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="67299502"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 07:39:00 -0700
X-CSE-ConnectionGUID: bu4SSwf0Tuq5K1xZT9spYw==
X-CSE-MsgGUID: Gb8a2lmTQkuVLnzjbCuitQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="208673521"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 27 Oct 2025 07:38:56 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 632509B; Mon, 27 Oct 2025 15:38:53 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
Subject: [PATCH v1 6/6] iio: position: iqs624-pos: Convert to use PI definition
Date: Mon, 27 Oct 2025 15:34:55 +0100
Message-ID: <20251027143850.2070427-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251027143850.2070427-1-andriy.shevchenko@linux.intel.com>
References: <20251027143850.2070427-1-andriy.shevchenko@linux.intel.com>
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
index 8239239c6ee2..da432d1b515c 100644
--- a/drivers/iio/position/iqs624-pos.c
+++ b/drivers/iio/position/iqs624-pos.c
@@ -15,10 +15,11 @@
 #include <linux/notifier.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/units.h>
 
 #define IQS624_POS_DEG_OUT			0x16
 
-#define IQS624_POS_SCALE1			(314159 / 180)
+#define IQS624_POS_SCALE1			DIV_ROUND_UP_ULL(PI, 1800000)
 #define IQS624_POS_SCALE2			100000
 
 struct iqs624_pos_private {
-- 
2.50.1

