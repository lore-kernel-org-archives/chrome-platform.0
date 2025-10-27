Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F47122D7B1
	for <chrome-platform@lists.linux.dev>; Mon, 27 Oct 2025 14:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761575939; cv=none; b=hKthiM505MiBW8RpyOEe4BGdNagjwLf7VNyAcpzP9KboIGfbZ+2Jktp8paydz8PRgk4YtBj/9DYMrtPbngWhqEeC4Dy5cI89FyLhYZ6C7lsMa/TkST4a8q8pYlMz6XOO6QIkTGLk9J3VUuadM2wic0BydeTlJtjilfUo6rpQghA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761575939; c=relaxed/simple;
	bh=avO4KxU32Xlunsqyq7BmWvOS2Y5h0UKNDU8DR6pAnGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XHePcWeQARPw2PXQGXAAu2FbS/uZfi/q/Pkb/zh0u/zTAYu7/MP3rk/atLKNN1FUwDcOUG4gQm2tLlvsnrmuOkcIFD0mND7J36z+v04w+RvwwFHp+P09D39IgvGWoV6WZCiFlgRPymjwPQGQ12F+lpxHu2Xhcfm+ouPM9ESVOxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=evQNCFyk; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="evQNCFyk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761575937; x=1793111937;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=avO4KxU32Xlunsqyq7BmWvOS2Y5h0UKNDU8DR6pAnGI=;
  b=evQNCFykstamsyT6O4V9gPCxwVK1i+3vTlWmINZ2x7I+HN0r076qIPRT
   EdOs5S0EkTKn7Jlm2eWoEy2P/+aKGppxwivfc11pzgmuAVTwSl635NS9d
   M7YXl4o/771o5bwzH3mShvPS34R5qwEw6dvaMfpLEgUiGQlWVTW892Gvh
   qrF5LsYe94CYTNcHfhRM0DqNla0zRKCwUC7Uol0zC9aKBWepSD+B/xiY5
   rq9mDynjZvXg+fxoGufe1lgO6d0yNeShgzUFlOQ1ep+xIlzE67sCtwsIL
   vPkG36fAQoR9CaYSBB2AHbeMF3KwTX4XvLxZ2IBxaoT4TvcXlcZttXr9+
   A==;
X-CSE-ConnectionGUID: 88Fh/UTHRZOdAfDAjQZJJA==
X-CSE-MsgGUID: i8lOKzN6QPuW1DXSfEcGHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67490638"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67490638"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 07:38:57 -0700
X-CSE-ConnectionGUID: 14+sqHWdR4m8zXTHKhpQtw==
X-CSE-MsgGUID: 4Brf0ud8TmumEX8E11mt7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="184756643"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 27 Oct 2025 07:38:53 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 55B4298; Mon, 27 Oct 2025 15:38:53 +0100 (CET)
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
Subject: [PATCH v1 3/6] media: dvb-frontends: atbm8830: Convert to use PI definition
Date: Mon, 27 Oct 2025 15:34:52 +0100
Message-ID: <20251027143850.2070427-4-andriy.shevchenko@linux.intel.com>
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
 drivers/media/dvb-frontends/atbm8830.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/atbm8830.c b/drivers/media/dvb-frontends/atbm8830.c
index 778c865085bf..74032364d183 100644
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
+		t = 2 * DIV_ROUND_UP_ULL(PI, 100000) * (freq - fs);
 		t <<= 22;
 		do_div(t, fs);
 		do_div(t, 1000);
-- 
2.50.1

