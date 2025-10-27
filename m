Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71221DF247
	for <chrome-platform@lists.linux.dev>; Mon, 27 Oct 2025 14:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761575937; cv=none; b=G3THP3URiVQqCrcfaGMDj0z3K9Vyyg/Zxz0FujZRo6K52FHe4Zqmzb7eXeJjjFRAcTuCEFj4Zvpy3y5zBR/j7vYb/8alnC/nc8cQBFRp8SwxtytR+NdeihcgeLDgvDLvQgKFUF+rkhHVtxu/T+32Op5oZULnu4aUje5c/nPy3qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761575937; c=relaxed/simple;
	bh=Vedc2M+pgV+Nboq192K0aq56jCuROIM/iusVyBk0mrk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XPI27h5A5MOeZWzAl7SqB6rOBbDr6ML4n2X30v1GPpvlnF6WiRCA0FR704iP4hZRYk4BB2Nx6jN0FIBvzd6gT7aXV8pOYbhu69jQ4/rcJlwfZkd5grO/nCoe4/KwcGuibdNNAdkMUw9YMB4Hloy6Ah9kN1pW4Giek9mO0jmzorY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M4WN3NBv; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M4WN3NBv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761575935; x=1793111935;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Vedc2M+pgV+Nboq192K0aq56jCuROIM/iusVyBk0mrk=;
  b=M4WN3NBvJ9hEIqyT3gHiVdpVMAPZHTCI1cVZb/jHckZ6Vh/m9lw/X+07
   wBaCm/WwnQ7U+0cVweDLgjprLaSChkQoBOdZ9t46LyhRhwZHAX6guG+Uf
   +gOd65tmGnY1oMu5+DZzwnqg7F4LnwUmbpxbywWfYkffkS/yRvuv8hmZH
   kCu+L2dfQ+8CQM4he+reGn2SgFIB+rSumU/SZyiamirgMmUrEl9fzsq7f
   YOyzB99+ffVgZUI1/Yqo33XcIFh34SQBEgg8wNNaNB6aaEIBCeoVubhtp
   5ejRJzC4Va2rkVJ6u/XCDWMdU3JGbaFs/71n1/b4ntDHxwu8sdD6EzMGs
   Q==;
X-CSE-ConnectionGUID: gwfgGrRgRcGd9ZOf5axZpA==
X-CSE-MsgGUID: YVTym9LHRZuMp5q7n1Wnyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63562456"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="63562456"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 07:38:55 -0700
X-CSE-ConnectionGUID: NYjZjO/URNuRA6ZU/kXoXA==
X-CSE-MsgGUID: 5cAUlfKeTFeMC14jyMvDZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="190191657"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 27 Oct 2025 07:38:52 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 28C0A95; Mon, 27 Oct 2025 15:38:51 +0100 (CET)
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
Subject: [PATCH v1 0/6] iio: Introduce and use value of π
Date: Mon, 27 Oct 2025 15:34:49 +0100
Message-ID: <20251027143850.2070427-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are a few drivers that use value of π (small Greek PI)
of different precision. Instead of hard coding over and over
convert them to use a defined constant, which one of the patches
in this series introduces. No functional changes involved.

Note, the respective IIO macros are not converted as it might include unwanted
churn, and hard to use definitions in the initialisers.

Andy Shevchenko (6):
  media: vidtv: Rename PI definition to PI_SAMPLES
  units: Add value of π * 10⁹
  media: dvb-frontends: atbm8830: Convert to use PI definition
  iio: cros_ec_sensors: Convert to use PI definition
  iio: frequency: ad9523: Convert to use PI definition
  iio: position: iqs624-pos: Convert to use PI definition

 drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c | 4 ++--
 drivers/iio/frequency/ad9523.c                       | 5 +++--
 drivers/iio/position/iqs624-pos.c                    | 3 ++-
 drivers/media/dvb-frontends/atbm8830.c               | 5 +++--
 drivers/media/test-drivers/vidtv/vidtv_s302m.c       | 6 +++---
 include/linux/units.h                                | 3 +++
 6 files changed, 16 insertions(+), 10 deletions(-)

-- 
2.50.1

