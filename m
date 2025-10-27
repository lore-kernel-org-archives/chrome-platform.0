Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3DD22AE65
	for <chrome-platform@lists.linux.dev>; Mon, 27 Oct 2025 14:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761575939; cv=none; b=hbWvBLQmlGw+KBgGdxfQZo2R9K5Y2Ttcuf0bSWzQGiFjX5q5ugzVxYhYZdevtt7ZbF3l21G8QKfS27XPkQtY7Ij0VgTDjLx9oiiVO9crkgU8/MEqq7mhQIr+PPFdmwA5Gvfyf0VqFOrDsyXlNzpLv3nYOy7SuUcZA+vfJ7RAz5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761575939; c=relaxed/simple;
	bh=kgLsFhWseh0ujDYIDdowa7yD3Ra0B33OBKNPNc/z5WY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JsMgzH9MpjWqQjVPrY/+UjEprR4sDVWHqF//2cAq3gDuBzWEyqz+j9tAH3aUlP1z8MeCYg5uXXiZrUj3EB07P4Kaa1VLX+hEAUnejAx0PP3z0x9UWlV1eRNRCqBeto17qewl3KFncKrCQKKrc2MNzpGIsurSI0/aO+DgrMeW64E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aA89q8kr; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aA89q8kr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761575937; x=1793111937;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kgLsFhWseh0ujDYIDdowa7yD3Ra0B33OBKNPNc/z5WY=;
  b=aA89q8krAexArwPRk+j+aKokVCQTaUZAqqFx2Sm/IKOxTz1rn7Ym4RKY
   kT5zSBbj1OIdtE0uCy2vfcfJC3QkUa+4eLAqOjiYOX6UupOkd+oPBQH6p
   ck0N9yj9stsOQa79KE1QQxcTn9sIInlUbQSEk7xcrUHRsSaP7B631RWX5
   LJSrnsKoiaV34bq2OraC1X39PBTZq1n3M6JmdyIYbTyJvvmgHRPlDXe2I
   UUrVYDQ+TtkBEnannusk72/KoPP8FKDzbY/NN3jtFTKbNUriH46CkJDa7
   Yc0r7bRSA5xJoWSvCJgNygD4edgqldRRzwV7IwaPtJhXciMwzLuQkrkyf
   g==;
X-CSE-ConnectionGUID: pIgve2iSSpSsk2M2t1qHdQ==
X-CSE-MsgGUID: TTmGlCj1TFmuIbEXDK7CRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="89126621"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="89126621"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 07:38:57 -0700
X-CSE-ConnectionGUID: tvtm8zCpQXWL1kiPvyOWLA==
X-CSE-MsgGUID: frXLvfIjQb2EQex6nulUCg==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 27 Oct 2025 07:38:54 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 4CE0696; Mon, 27 Oct 2025 15:38:53 +0100 (CET)
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
Subject: [PATCH v1 1/6] media: vidtv: Rename PI definition to PI_SAMPLES
Date: Mon, 27 Oct 2025 15:34:50 +0100
Message-ID: <20251027143850.2070427-2-andriy.shevchenko@linux.intel.com>
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

The definition of PI in the driver is not the actual value in radians,
but rather degrees. Since we are going to have a value in radians
defined in a global header, rename this definition to avoid potential
collisions. No functional changes.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/test-drivers/vidtv/vidtv_s302m.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_s302m.c b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
index 9da18eac04b5..b3217d643b1e 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_s302m.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
@@ -45,7 +45,7 @@
 #define FF_S302M_DEFAULT_PTS_OFFSET 100000
 
 /* Used by the tone generator: number of samples for PI */
-#define PI		180
+#define PI_SAMPLES		180
 
 static const u8 reverse[256] = {
 	/* from ffmpeg */
@@ -259,10 +259,10 @@ static u16 vidtv_s302m_get_sample(struct vidtv_encoder *e)
 		if (!ctx->last_tone)
 			return 0x8000;
 
-		pos = (2 * PI * ctx->note_offset * ctx->last_tone) / S302M_SAMPLING_RATE_HZ;
+		pos = (2 * PI_SAMPLES * ctx->note_offset * ctx->last_tone) / S302M_SAMPLING_RATE_HZ;
 		ctx->note_offset++;
 
-		return (fixp_sin32(pos % (2 * PI)) >> 16) + 0x8000;
+		return (fixp_sin32(pos % (2 * PI_SAMPLES)) >> 16) + 0x8000;
 	}
 
 	/* bug somewhere */
-- 
2.50.1

