Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC7515497
	for <chrome-platform@lists.linux.dev>; Fri, 26 May 2023 13:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685106875; x=1716642875;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BgbdTHx7BzoXHpdv2KHG8iMYdfwvWaWc5pq2ZtcBVD0=;
  b=F0IJ3lT0YvuNHyySQCPAGA8chcdOky7mMblRxUFga9sd76hsesJmQFn8
   /jv5p54LKNQSijZyVaRZmbBmI5vuCxlEA1xlXKhcw/t8h4iMLbbPuANoa
   K4IEVZgSUrvgacnt4b5k7ZeEhNLGjiKCKa8rYqh/NxILo97JN5J0lOhM8
   V4/VoEL4hT0Aml6KMC/0UBzPRS92gN9EL/2xYWhEiZC6GCHWknsSTz6TM
   v8g5fmGN0uIDXJXNdamRBxNEo9aNl17SIhhUlAUrtMpnGP8VlComeRSi8
   sTEGyZasGCpDQ//xbsbsQ50wmgtDU3SX3gXqIgf33NA45lANcTeWEvci/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="419955106"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="419955106"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 06:14:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="849555278"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="849555278"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 26 May 2023 06:14:32 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	chrome-platform@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] usb: typec: mux: Clean up mux_fwnode_match()
Date: Fri, 26 May 2023 16:14:33 +0300
Message-Id: <20230526131434.46920-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230526131434.46920-1-heikki.krogerus@linux.intel.com>
References: <20230526131434.46920-1-heikki.krogerus@linux.intel.com>
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
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Tested-by: Bjorn Andersson <andersson@kernel.org>
---
v2: Fixed the comment as requested by Bjorn.

 drivers/usb/typec/mux.c | 55 ++++++-----------------------------------
 1 file changed, 7 insertions(+), 48 deletions(-)

diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index d9eaf9a0b0bfd..f2eee6322815d 100644
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
+	 * an additional device property is needed. With typec muxes the
+	 * property is named "mode-switch" (@id). The value of the device
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

