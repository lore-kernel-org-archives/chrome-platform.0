Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8CB30217B
	for <chrome-platform@lists.linux.dev>; Fri,  7 Nov 2025 20:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762546217; cv=none; b=dak7XYYyRHHFPLdmVNxSBKwWGd6IQxnxTLjGsBYsV++owXZR+zfPdVTcWlkl5E/vKDNuDzQvUkxxQifHuue+/qN+q45FYrQlNVazhcN0qzUPVUTKyNIz22Y2hfsnzr6lJem4RXGZF1d+FQ0j9hKXSTedJZh0OMmW7+btRAVL9xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762546217; c=relaxed/simple;
	bh=ONGv1ACjdjp+CWs348+vBQ+93sUiFmM8XePjcDa3Ops=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cJ8RnfgWSHDxNo7VV1BgvHN8pU/rMPhw1JagEYJpPWB9qMTz6A/CRDCmF2T794Y6nW1zwt7kaQitJQtwdtBCVMYHW14Yn0S37d9rd4rgVLLaM1EQUD+4douEssogUCVjiO10f/BzkylxJ/dvQPTLUJhauWzPXiYj8wOki4xIYLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=acrmj914; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="acrmj914"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762546215; x=1794082215;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ONGv1ACjdjp+CWs348+vBQ+93sUiFmM8XePjcDa3Ops=;
  b=acrmj914tbD/94CkEDhHgAGK6hzaj29yNP/ZcYdxcpZHtWTWjMh1iOof
   lUI+nDa5K6DlZKfY6tBq+L4R5DNW9JEtP+sdq3maGGypTnHucWxu+762o
   GEu3qeH/zMxEwVon8O/3FsbvJRuwAeF/r8A6EB7NK1aSH2Q4kZc9dWW3S
   vLU0wbw76Mq3mYb0QNQV5c7Mv5Ja4P86z2m/O9cCDFZjYTtK+CoHRLQnM
   uCG9HG37VqIYl/RgXtrOFsax6lbdcAouWBE1DUqHYScgj19W+dFgAKGye
   FHuQAHq+3cirbVdTir/JHeHOiyZK9zGXUEvYGEoGCERJjMrnZ6FjoVdHN
   w==;
X-CSE-ConnectionGUID: hSNe1xdWSd66JswQB7BNxg==
X-CSE-MsgGUID: OXviHRqsSs6XRrBpR2KJ4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="82327905"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="82327905"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 12:10:14 -0800
X-CSE-ConnectionGUID: yfRFfQbYStqUYagdPJaGzw==
X-CSE-MsgGUID: 7AIunAwJQwKfzYn3aVp6FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="187422699"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 07 Nov 2025 12:10:10 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id D6BB695; Fri, 07 Nov 2025 21:10:09 +0100 (CET)
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
Subject: [PATCH v2 0/6] iio: Introduce and use value of π
Date: Fri,  7 Nov 2025 21:02:58 +0100
Message-ID: <20251107201005.3156118-1-andriy.shevchenko@linux.intel.com>
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

Note, the respective IIO macros are not converted yet by this series.

All of the converted files were checked in disassembled format before
and after the change to see that the value:
a) pre-calculated at compile-time;
b) is the same that is expected.

I didn't put the power-of-10 into the definition names as now they are
the maximum that fits the respective signed type.

Series is supposed to go via IIO tree.

Changelog v2:
- redone to avoid unneeded calculations
- collected tags (Hans)

v1: <20251027143850.2070427-1-andriy.shevchenko@linux.intel.com>

Andy Shevchenko (6):
  media: vidtv: Rename PI definition to PI_SAMPLES
  units: Add 32- and 64-bit signed values of π
  media: dvb-frontends: atbm8830: Convert to use PI definition
  iio: cros_ec_sensors: Convert to use PI definition
  iio: frequency: ad9523: Convert to use PI definition
  iio: position: iqs624-pos: Convert to use PI definition

 drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c | 3 ++-
 drivers/iio/frequency/ad9523.c                       | 5 +++--
 drivers/iio/position/iqs624-pos.c                    | 3 ++-
 drivers/media/dvb-frontends/atbm8830.c               | 5 +++--
 drivers/media/test-drivers/vidtv/vidtv_s302m.c       | 6 +++---
 include/linux/units.h                                | 6 ++++++
 6 files changed, 19 insertions(+), 9 deletions(-)

-- 
2.50.1

