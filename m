Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B874F3081C6
	for <chrome-platform@lists.linux.dev>; Mon, 27 Oct 2025 14:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761575941; cv=none; b=UaS1EjI6Tlg3ROhgEFvjK2f1Pc6nbrN61rwkn6BgGqXElq/4wdyprb5+O7CBZkswMU3ge4k49XbW+U+7IO36l7t5uALvVUhWtUSEGGzA6aYu6N/twCPu2PRY2L0FfgtjBd4ju5/EvSwBIFghERAFtMfJZC2s/+qyxTAy6sWnBN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761575941; c=relaxed/simple;
	bh=nJ5njJ5+9hYtCs0aj31BczBczYllyXS0BJAPe/01RYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y/u6S8g1DZcqt2UqpECnZ2BqHtoMlwKhG+iz3eh6By62A8CFolRNQwImEsxDif/hVl1LVUrzdMbTsgeWP0/y17LP4wqz5uALc81xZgrT7JIzLemp78wAz6ePAu9Q7n0BceWnK2Yud4muqRPINIxf4AXTZAhVPi+6jCFMcHV/r0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RGRwTRnG; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RGRwTRnG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761575939; x=1793111939;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nJ5njJ5+9hYtCs0aj31BczBczYllyXS0BJAPe/01RYE=;
  b=RGRwTRnGVmzV9eADhJzyZfgKwwS/R05vvK2wmr8KaiJuD6la4FFD34MX
   5ZS4H2iw/A4wOHw87CKns+0HU2b8oM62TPVTydNT+r4jwVdxMrfTH6KkK
   lbTr6N8LS1udmAhoBbWUL9MzN8UKCHxj7T0j2bMcVf1PiHf5Dk0Ctd8Sp
   8prWWDFByNO5Igngoawm2vLZ66VgFYpUuCgUIvZn6S5IE1xIYRRSVVChR
   tsHRyPlY/wkO9LfnV0F9wtr20KqE0ZShygcJuI3oDzMXWixxoEl47TZNA
   qdhubw2fB6OUwmMyCoK+VfFeHKvFfz79MIUEuXz3Ih/2cxie6qWIgP8OX
   Q==;
X-CSE-ConnectionGUID: oSWm2j6yS6GQAJWH9n37Mg==
X-CSE-MsgGUID: T5L/QSAJSC+BfebvpjlMUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67490640"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67490640"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 07:38:57 -0700
X-CSE-ConnectionGUID: KdQ8Cx24S+CkfiR30J0CGg==
X-CSE-MsgGUID: 9ObjXCVMTXq4FJg4Ehc4/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="215712208"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 27 Oct 2025 07:38:55 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 5A09B99; Mon, 27 Oct 2025 15:38:53 +0100 (CET)
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
Subject: [PATCH v1 4/6] iio: cros_ec_sensors: Convert to use PI definition
Date: Mon, 27 Oct 2025 15:34:53 +0100
Message-ID: <20251027143850.2070427-5-andriy.shevchenko@linux.intel.com>
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
 drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
index 82cef4a12442..7e7b7f97454d 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
@@ -21,6 +21,7 @@
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_ec_proto.h>
 #include <linux/platform_device.h>
+#include <linux/units.h>
 #include <linux/slab.h>
 
 #define CROS_EC_SENSORS_MAX_CHANNELS 4
@@ -120,8 +121,7 @@ static int cros_ec_sensors_read(struct iio_dev *indio_dev,
 			 * loss. Round to the nearest integer.
 			 */
 			*val = 0;
-			*val2 = div_s64(val64 * 3141592653ULL,
-					180 << (CROS_EC_SENSOR_BITS - 1));
+			*val2 = div_s64(val64 * PI, 180 << (CROS_EC_SENSOR_BITS - 1));
 			ret = IIO_VAL_INT_PLUS_NANO;
 			break;
 		case MOTIONSENSE_TYPE_MAG:
-- 
2.50.1

