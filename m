Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D115182C0
	for <chrome-platform@lists.linux.dev>; Wed, 24 May 2023 12:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684931343; x=1716467343;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AUZv9YuPMG0nfqwZaGNsKXwlR4mFQTyLIv//QJk1Idw=;
  b=XJSdGAaF0NDNv6HeToYaWnHVbxIL31jhpPLWJZ0zVksmXR8Lzn9s17KA
   wYqE5UQVkhDRbRE9VmGJvFkLSQ1XSaBTyOsNp1OyMZ1FoMmM9I0E+MV7m
   YaIJjE0TD8YJvPwm3W6S98PtTY67LIECA1Hxu0Ta1spHc/YMxnUVgds+V
   Voi7TMDx/hWQ85lZ8yfTxx3wlGE2tcFaq3PP0CcwiPTCV2ueJkp4qR23N
   wyFTsn86hkB6PjKuoX5rv67z4FQNXGKfZIXm1OnqlGorQSv6ETLUqG71R
   c65J2M/CZpaBlagc1zlxZyCHwM2I+VVrY4Th3VnkVUwRhzeMm4IN3IeDH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="333904902"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="333904902"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 05:29:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="848731379"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="848731379"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 24 May 2023 05:29:00 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	chrome-platform@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] usb: typec: mux: Clean up mux_fwnode_match()
Date: Wed, 24 May 2023 15:29:00 +0300
Message-Id: <20230524122901.53659-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230524122901.53659-1-heikki.krogerus@linux.intel.com>
References: <20230524122901.53659-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removing the "svid" and "accessory" device property checks.
Those properties are not supported on any platform.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Link: https://lore.kernel.org/lkml/20230522215348.uoyboow26n2o3tel@ripper/
Cc: Bjorn Andersson <andersson@kernel.org>
---
 drivers/usb/typec/mux.c | 55 ++++++-----------------------------------
 1 file changed, 7 insertions(+), 48 deletions(-)

diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index d9eaf9a0b0bfd..089c2fd478318 100644
--- a/drivers/usb/typec/mux.c
+++ b/drivers/usb/typec/mux.c
@@ -265,60 +265,19 @@ static int mux_fwnode_match(struct device *dev, const void *fwnode)
 static void *typec_mux_match(const struct fwnode_handle *fwnode,
 			     const char *id, void *data)
 {
-	const struct typec_altmode_desc *desc = data;
 	struct device *dev;
-	bool match;
-	int nval;
-	u16 *val;
-	int ret;
-	int i;
 
 	/*
-	 * Check has the identifier already been "consumed". If it
-	 * has, no need to do any extra connection identification.
+	 * Device graph (OF graph) does not give any means to identify the
+	 * device type or the device class of the remote port parent that @fwnode
+	 * represents, so in order to identify the type or the class of @fwnode
+	 * an additional device property is needed. With typec switches the
+	 * property is named "orientation-switch" (@id). The value of the device
+	 * property is ignored.
 	 */
-	match = !id;
-	if (match)
-		goto find_mux;
-
-	if (!desc) {
-		/*
-		 * Accessory Mode muxes & muxes which explicitly specify
-		 * the required identifier can avoid SVID matching.
-		 */
-		match = fwnode_property_present(fwnode, "accessory") ||
-			fwnode_property_present(fwnode, id);
-		if (match)
-			goto find_mux;
-		return NULL;
-	}
-
-	/* Alternate Mode muxes */
-	nval = fwnode_property_count_u16(fwnode, "svid");
-	if (nval <= 0)
+	if (id && !fwnode_property_present(fwnode, id))
 		return NULL;
 
-	val = kcalloc(nval, sizeof(*val), GFP_KERNEL);
-	if (!val)
-		return ERR_PTR(-ENOMEM);
-
-	ret = fwnode_property_read_u16_array(fwnode, "svid", val, nval);
-	if (ret < 0) {
-		kfree(val);
-		return ERR_PTR(ret);
-	}
-
-	for (i = 0; i < nval; i++) {
-		match = val[i] == desc->svid;
-		if (match) {
-			kfree(val);
-			goto find_mux;
-		}
-	}
-	kfree(val);
-	return NULL;
-
-find_mux:
 	dev = class_find_device(&typec_mux_class, NULL, fwnode,
 				mux_fwnode_match);
 
-- 
2.39.2

