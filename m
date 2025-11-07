Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FED230C616
	for <chrome-platform@lists.linux.dev>; Fri,  7 Nov 2025 20:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762546219; cv=none; b=Mpyl/0fAOt3gqnW01gUhWhDbWzErmGcueAVvAG2Xblcjfq/zdqY8Wq7N5odSZLkORtLk7bh/f4ECaaFavWpgAWxQh5+s3JAzGAt2fyJA0vhjLbDnAtBIhQuV/b1y8gHW7S7vn0Kgcv7UCrul8NeUR+UElaV20SthlIProk4FZsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762546219; c=relaxed/simple;
	bh=wyLEETnK4zhorMpO22VG8cMcBXMNAugr/wB2nBSxo9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ILM+FXexfyZ/Te82YjsfJWYmPGF0D20e3OmMjQ/BLKEM7jcez7WrPrb8Hgr448wanRaba3cZR/aRfKnQDJ8m/aFHIRUOjO3N00GBS2xmQ+NzyFM4djTN/kVr1OvWmuNWa6fgnWr+lT+dN7p/OOEUF3PH1nyIgFE7HP769S2W99g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UtoFCvYS; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UtoFCvYS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762546218; x=1794082218;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wyLEETnK4zhorMpO22VG8cMcBXMNAugr/wB2nBSxo9A=;
  b=UtoFCvYS1acDPebmY1sL+MkXVzWkWt0n8TNvBBhQXCiAhOGsLFE0UphS
   LxPzH0U5Yei+2uNPHhVNXF+8mXmRaD4M6Jm58AgG/ombkkhHC7loH4QhH
   PbNBhYRiTZErhKd1SCOHPzoJoxr7mz+Ddzp8qXIE+KsAqrrvTsfbVvR++
   aSYzNlLXwrNsP16PzoZkutuFMQpWp+yXo36WOMmAzteN583PWCl3CR3in
   SNdwKcFuZHMDckiLF/azUm1vCUyR5rTpXROwld6AYr98QxpJwoyeRjYBa
   PmB+I6rrzuBG8WST22trDoe1Uq4uCS4BMBltXOlUpKu52U6mAhU8ZjqAN
   A==;
X-CSE-ConnectionGUID: VCV0YGh/SIWp7sdcCaTaaA==
X-CSE-MsgGUID: YTDCC/6eQG+o3FXgevkp3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64738174"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="64738174"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 12:10:17 -0800
X-CSE-ConnectionGUID: UqKpWsbuThWVWno3DuXTLA==
X-CSE-MsgGUID: 7VoUL2B3QN2G32HIU/pTDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="187956296"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 07 Nov 2025 12:10:14 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id ECC739A; Fri, 07 Nov 2025 21:10:09 +0100 (CET)
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
Subject: [PATCH v2 5/6] iio: frequency: ad9523: Convert to use PI definition
Date: Fri,  7 Nov 2025 21:03:03 +0100
Message-ID: <20251107201005.3156118-6-andriy.shevchenko@linux.intel.com>
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
 drivers/iio/frequency/ad9523.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/frequency/ad9523.c b/drivers/iio/frequency/ad9523.c
index 63c485e9e44c..781e0ada75d9 100644
--- a/drivers/iio/frequency/ad9523.c
+++ b/drivers/iio/frequency/ad9523.c
@@ -15,6 +15,7 @@
 #include <linux/err.h>
 #include <linux/module.h>
 #include <linux/delay.h>
+#include <linux/units.h>
 
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
@@ -652,7 +653,7 @@ static int ad9523_read_raw(struct iio_dev *indio_dev,
 			AD9523_CLK_DIST_DIV_REV(ret);
 		return IIO_VAL_INT;
 	case IIO_CHAN_INFO_PHASE:
-		code = (AD9523_CLK_DIST_DIV_PHASE_REV(ret) * 3141592) /
+		code = (AD9523_CLK_DIST_DIV_PHASE_REV(ret) * DIV_ROUND_UP(PI, 100)) /
 			AD9523_CLK_DIST_DIV_REV(ret);
 		*val = code / 1000000;
 		*val2 = code % 1000000;
@@ -701,7 +702,7 @@ static int ad9523_write_raw(struct iio_dev *indio_dev,
 		break;
 	case IIO_CHAN_INFO_PHASE:
 		code = val * 1000000 + val2 % 1000000;
-		tmp = (code * AD9523_CLK_DIST_DIV_REV(ret)) / 3141592;
+		tmp = (code * AD9523_CLK_DIST_DIV_REV(reg)) / DIV_ROUND_UP(PI, 100);
 		tmp = clamp(tmp, 0, 63);
 		reg &= ~AD9523_CLK_DIST_DIV_PHASE(~0);
 		reg |= AD9523_CLK_DIST_DIV_PHASE(tmp);
-- 
2.50.1

