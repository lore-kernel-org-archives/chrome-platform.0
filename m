Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1896302CAC
	for <chrome-platform@lists.linux.dev>; Fri,  7 Nov 2025 20:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762546216; cv=none; b=V8cuXUVp6Cn47/BEVdDetmyCSeTASXxaGy0bDTZeOqeFHLC+wlRzbYGxBSHqxo4YO9fD60md+l7u6i+FEm8RwN68HbWnw55k+rvfHeEV0DafbA6SdEbhMiS2KBg6G5j/Satc0i7Q5gg/A4uKHurDqYY1JsV70N8mQ+xlcuOU8KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762546216; c=relaxed/simple;
	bh=5QG0FpgOvh5wtnP8TLZzDRojDuvAIKEwkt4o9WiKN7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=de7LDfnNmYdZxzhDHTcpmMjihu5kDoL+406J8jO7TfavmCIUTNtUicOHNTd/ZKyNh3OsZlEkSwWg7uYaudVxHz6cpm4gikRJ5mNkkBkcbJKfoXyf5l06e8TxrCQbqvU2HWq++AyilC8VdeZY7avw1u87FUBWhIbZ6DCknSczdgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZsC41e+m; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZsC41e+m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762546215; x=1794082215;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5QG0FpgOvh5wtnP8TLZzDRojDuvAIKEwkt4o9WiKN7U=;
  b=ZsC41e+mSMRUTKK0grwLDNH+N0Jc4aGwxTMASGWdk7nvLhwQTXyjxLLO
   cTlT+JWaRT9nPx3bldr7vfDLf2z9WSP09CPNbmCR36V3KhQepimexE6BI
   m3keEh5/6tYThGMpv/erH6g/DVws+wDW7qdco9cKc85YnJsil/u7KHMm8
   Z0xC0SKYM9Uw5xzmt8xd2M6R+gkAzxLiHkjtuLr4mfIP+tHXJNnUGKupB
   nTc8hDc4jU7inluLstJWGH2y1QQuDhqGz5V/uqEm7MnL3sBdYtW04LatG
   MH64sIJyUmv28AlK3njaBzSobxyIMcfUxgn5m53N9lQg1ORrDhglLz9l+
   A==;
X-CSE-ConnectionGUID: CcRi7NN6THWgZmmR2J+P9A==
X-CSE-MsgGUID: CuZtqfGsRWWiioI0vD912A==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="75392091"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="75392091"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 12:10:14 -0800
X-CSE-ConnectionGUID: hWl+RhlQSNa2I3aHFHm0sA==
X-CSE-MsgGUID: VvCS4ZgmS160DI7KY7ucrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="218777174"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 07 Nov 2025 12:10:11 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id E39B098; Fri, 07 Nov 2025 21:10:09 +0100 (CET)
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
Subject: [PATCH v2 3/6] media: dvb-frontends: atbm8830: Convert to use PI definition
Date: Fri,  7 Nov 2025 21:03:01 +0100
Message-ID: <20251107201005.3156118-4-andriy.shevchenko@linux.intel.com>
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

Acked-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/dvb-frontends/atbm8830.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/atbm8830.c b/drivers/media/dvb-frontends/atbm8830.c
index 778c865085bf..93181e0eb34f 100644
--- a/drivers/media/dvb-frontends/atbm8830.c
+++ b/drivers/media/dvb-frontends/atbm8830.c
@@ -6,7 +6,8 @@
  *    Copyright (C) 2009 David T.L. Wong <davidtlwong@gmail.com>
  */
 
-#include <asm/div64.h>
+#include <linux/math64.h>
+#include <linux/units.h>
 #include <media/dvb_frontend.h>
 
 #include "atbm8830.h"
@@ -112,7 +113,7 @@ static int set_if_freq(struct atbm_state *priv, u32 freq /*in kHz*/)
 
 	if (freq != 0) {
 		/* 2 * PI * (freq - fs) / fs * (2 ^ 22) */
-		t = (u64) 2 * 31416 * (freq - fs);
+		t = (u64) 2 * DIV_ROUND_UP(PI, 10000) * (freq - fs);
 		t <<= 22;
 		do_div(t, fs);
 		do_div(t, 1000);
-- 
2.50.1

