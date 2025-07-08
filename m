Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF4C29B233
	for <chrome-platform@lists.linux.dev>; Tue,  8 Jul 2025 08:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751961770; cv=none; b=HX7EkREwZTH53ghc51dzEyAwDLmM/M5nmUyEfdMnAENTvnrRtWtVWpLJLwl9VCwwdtafXDNxVrxPFY/QbhoDluTuXnaJVZQDWv32KP6db3b5ZuKygH8hd3253Qbe3GIdX79HRomMl+S+Ft+zoMZciOvB4/qo1R2bIrS2YopVCrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751961770; c=relaxed/simple;
	bh=TADtv2VNHhtmpIB3xP9WktxXmhgnGcgQw9tfw8l8XYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lrhNPv4V5/LxF+TMT1dWF4T0zILeb73rtUcVN1SWfCmDrCW6e6olcMpvnqbHOyOf/lltqQu1q+bVtt4+EW+o20cw6q2yuJ75+3NBG5RtmkNtr747D8Atr+i3xgQvdf0dK4rAmo5HJDg2UmgFi1iq/RayyzsDA5YKhRC7SZlmzzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q98cbW6h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q98cbW6h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBA78C4CEED;
	Tue,  8 Jul 2025 08:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751961770;
	bh=TADtv2VNHhtmpIB3xP9WktxXmhgnGcgQw9tfw8l8XYM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q98cbW6htJIVTJZ5NbyI9N39zoyxbmct8nuuL+T/UgPV2yUCbi+o36exWEHr0ftPp
	 cSRM9zSBKOy3AVhraHeB4A89NnsMscNNmkIQSfUo7cYyYovr48vnfUctSOwAvwByI+
	 ozQ/jAGRyPLRh3GZTO+3VkEs0jPaNniCoGXCwQsAlm6gDbLkRY2Hsq0pll2/BQGFwR
	 XeIRr7x8sw/AcjnyafcdwrCcr42dwlXL0Z2ulMchcYqjwqiiTFmkAt5DGXsLJXKOr/
	 YrgjecppTionzsfYAIH9Sjg9jN8WSueYns4ZoNAb2YPZTTiLty/1QGbf+Rjd+iIm0A
	 E04iIxpaNyq4Q==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	dawidn@google.com,
	gregkh@linuxfoundation.org
Subject: [PATCH v2 6/6] platform/chrome: Manage struct cros_ec_device lifecycle by its refcount
Date: Tue,  8 Jul 2025 08:00:34 +0000
Message-ID: <20250708080034.3425427-7-tzungbi@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250708080034.3425427-1-tzungbi@kernel.org>
References: <20250708080034.3425427-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Stop delegating the memory to dev-managed.  Use its own refcount for
managing the lifecycle.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
New patch in the v2 series.

 drivers/platform/chrome/cros_ec_proto.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index f23d0522da96..097ef1fb3658 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -1166,7 +1166,7 @@ EXPORT_SYMBOL_GPL(cros_ec_get_cmd_versions);
  */
 struct cros_ec_device *cros_ec_device_alloc(struct device *dev)
 {
-	struct cros_ec_device *ec_dev = devm_kzalloc(dev, sizeof(*ec_dev), GFP_KERNEL);
+	struct cros_ec_device *ec_dev = kzalloc(sizeof(*ec_dev), GFP_KERNEL);
 
 	if (ec_dev) {
 		ec_dev->dev = dev;
@@ -1190,7 +1190,9 @@ EXPORT_SYMBOL_GPL(cros_ec_device_get);
 
 static void cros_ec_device_release(struct kref *kref)
 {
-	/* Do nothing as the cros_ec_device is still dev-managed. */
+	struct cros_ec_device *ec_dev = container_of(kref, struct cros_ec_device, kref);
+
+	kfree(ec_dev);
 }
 
 /**
-- 
2.50.0.727.gbf7dc18ff4-goog

