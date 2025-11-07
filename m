Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB673302172
	for <chrome-platform@lists.linux.dev>; Fri,  7 Nov 2025 20:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762546216; cv=none; b=n1kVOtWiHcdh011t/pV+r+IN/qkjfsDjSiDPRVnTTRsEHLB369QoXN/yeXRob6rgVGHCFfd5AWLHnunQpr/VgrQ1VYnkIafmqQM8LluEtWTIsJ9huAv8u9CsLUJv0L8GmE8974QBSaDI+ZoBcLqErvOxeShjqhpkiDpjFdlv08k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762546216; c=relaxed/simple;
	bh=84hvNmk1wrkfPc8Aw4HiHMUeu30dNeI0g/yAJW6HfMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zl493w6UuwnEbw6qhXQBE6qWkR1COtjICBCafzz20GCYjE0o0bsSu9pqOX0CoYZe2f+5bSipSSj9roa5nAonDLH7BhyCGf7gNX6ZSb7uiiAdTD+h+Np/tx8A7E0QP4CKBWzHre1xmBH5U0X/iiK0d1SoVWmD0JrbGl1E28TpLo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IyXvKv/w; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IyXvKv/w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762546214; x=1794082214;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=84hvNmk1wrkfPc8Aw4HiHMUeu30dNeI0g/yAJW6HfMk=;
  b=IyXvKv/wKRQ1M9FD0i4p61AhosZ7c7GDtQz9r7CJNHlWPa+NGGMWVsXl
   f3ZXLDgy/jGW1diJd+FCQbvyG+B/072TdP4xz2TNgz07UOvTeRwUHeool
   a12DxrERKwq6ygOg3R+DzXPnN57XEwpTPhNMQzkL7MX3jPbxKWpex+Lxh
   SYYvl+9n74Cb6uyTswkzfztHxoKlf292XDHSursIpkNcCMp7ovKsZiFQR
   XIV7nAATkLyWFyxTdIqKjri3b8YDHJ4QujMwdUnL+O8a1uarnrdzHMeVI
   +loliC5o2kQe52Npxb+wDqgydCS21ekmqXyc5Hh1tBgfLlFYP9YYWYPLJ
   g==;
X-CSE-ConnectionGUID: +hoiUve+RFW0KhZEjDtHvQ==
X-CSE-MsgGUID: pDC1HzpwQ1iGanCbqoezeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="68561835"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="68561835"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 12:10:14 -0800
X-CSE-ConnectionGUID: L3pN/AknT0WGhHbFTM1CEw==
X-CSE-MsgGUID: RQxIx9bNQ1yIpX4eyC7d1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="188065153"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 07 Nov 2025 12:10:11 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id DEB6B97; Fri, 07 Nov 2025 21:10:09 +0100 (CET)
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
Subject: [PATCH v2 2/6] =?UTF-8?q?units:=20Add=2032-=20and=2064-bit=20sign?= =?UTF-8?q?ed=20values=20of=20=CF=80?=
Date: Fri,  7 Nov 2025 21:03:00 +0100
Message-ID: <20251107201005.3156118-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251107201005.3156118-1-andriy.shevchenko@linux.intel.com>
References: <20251107201005.3156118-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are a few drivers that want to have these values, and
one more known to come soon. Let's define the values for them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/units.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/units.h b/include/linux/units.h
index f626e212d4ca..5b3293bce04c 100644
--- a/include/linux/units.h
+++ b/include/linux/units.h
@@ -21,6 +21,12 @@
 #define PICO	1000000000000ULL
 #define FEMTO	1000000000000000ULL
 
+/* Value of π * 10⁸ (fits s32 or signed int) */
+#define PI	314159265
+
+/* Value of π * 10¹⁸ (fits s64 or signed long long) */
+#define PI_LL	3141592653589793238LL
+
 /* Hz based multipliers */
 #define NANOHZ_PER_HZ		1000000000UL
 #define MICROHZ_PER_HZ		1000000UL
-- 
2.50.1

