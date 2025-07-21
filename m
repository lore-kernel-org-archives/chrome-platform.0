Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F52072637
	for <chrome-platform@lists.linux.dev>; Mon, 21 Jul 2025 04:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753073127; cv=none; b=jdR57vSs6pR4wdgLPqq4A2MVxGn4NXPpcMti8381i701r7Tm0cqk0yfY7TKLtqS3+i4QTcXBSXBHQJX2dF1R9zS8ZiNAZZBJVBwxHrkxdFJO2EwkanC22SGBv0nq45mIM6BSd9MXR/jAI60XiSL/x+EkZ7b4id+bt2a25t4DXnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753073127; c=relaxed/simple;
	bh=FraLx22XXmMoWF/+kmopGsgzVFVAiBsy5XJC4N8vi08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FeMsDDPqx35ERi+Sp3ZTzQDLRNFt9KqqtYKOPBsRNOMTlcv5+BdGnX+61QX/bp6wu80hIX6+YEDRjK+DFAeMUSEXddhBGO+X2odfKYIuW2RthINBq3R+jArowUUmdg0EzGpI+vHZorJcn/pB6PhWOhUa0u850WlxcXIq1UogCSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AkxybbaS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AkxybbaS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1125FC4CEF4;
	Mon, 21 Jul 2025 04:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753073126;
	bh=FraLx22XXmMoWF/+kmopGsgzVFVAiBsy5XJC4N8vi08=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AkxybbaSYmGYXPeo78oCsYHftFuZIwAN3B7Zhe7coL858Z0ByEuxrESQTdzfbNbGk
	 LTTfErwsrPgrqwtgBhy4JY63WBkFeee+EqstXzpbJvp0RKo+z0TKCP3N5NEdmtPxEu
	 p50En2dIBp4IThHXIgTjNcJ4s9585AocRU0+1T2Fm+Mer0BrGpLIu0Cn9SyBDCEBax
	 iOjF+j4z4S0aYG5Ek4U5wItOJRIaQ5iEq+PrmpjThMYyeLfaawauVISqU+ZMNEcL8V
	 puYk0K58h9HIhUPGe82s1F2Zxm9NI2tpVta6ENXpCjrZuPBXyepiHkGjkzmSZLvT4g
	 RxgUzLlH1VHUg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org
Cc: tzungbi@kernel.org,
	dawidn@google.com,
	gregkh@linuxfoundation.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v3 6/8] platform/chrome: Don't initialize common utilities when registering
Date: Mon, 21 Jul 2025 04:44:54 +0000
Message-ID: <20250721044456.2736300-7-tzungbi@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250721044456.2736300-1-tzungbi@kernel.org>
References: <20250721044456.2736300-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lifecycle of common utilities in struct cros_ec_device should be the
same as struct cros_ec_device.  It is possible that a struct
cros_ec_device is unregistered however the utilities are still using.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
New patch in the v3 series.

 drivers/platform/chrome/cros_ec.c       | 10 ----------
 drivers/platform/chrome/cros_ec_proto.c | 16 ++++++++++++----
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index 9604424b6e7a..7e7930519947 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -185,9 +185,6 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 	struct device *dev = ec_dev->dev;
 	int err = 0;
 
-	BLOCKING_INIT_NOTIFIER_HEAD(&ec_dev->event_notifier);
-	BLOCKING_INIT_NOTIFIER_HEAD(&ec_dev->panic_notifier);
-
 	ec_dev->max_request = sizeof(struct ec_params_hello);
 	ec_dev->max_response = sizeof(struct ec_response_get_protocol_info);
 	ec_dev->max_passthru = 0;
@@ -204,9 +201,6 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 		return -ENOMEM;
 
 	atomic_set(&ec_dev->registered, 1);
-	lockdep_register_key(&ec_dev->lockdep_key);
-	mutex_init(&ec_dev->lock);
-	lockdep_set_class(&ec_dev->lock, &ec_dev->lockdep_key);
 
 	/* Send RWSIG continue to jump to RW for devices using RWSIG. */
 	err = cros_ec_rwsig_continue(ec_dev);
@@ -307,8 +301,6 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 	atomic_set(&ec_dev->registered, 0);
 	platform_device_unregister(ec_dev->ec);
 	platform_device_unregister(ec_dev->pd);
-	mutex_destroy(&ec_dev->lock);
-	lockdep_unregister_key(&ec_dev->lockdep_key);
 	return err;
 }
 EXPORT_SYMBOL(cros_ec_register);
@@ -330,8 +322,6 @@ void cros_ec_unregister(struct cros_ec_device *ec_dev)
 						   &ec_dev->notifier_ready);
 	platform_device_unregister(ec_dev->pd);
 	platform_device_unregister(ec_dev->ec);
-	mutex_destroy(&ec_dev->lock);
-	lockdep_unregister_key(&ec_dev->lockdep_key);
 	cros_ec_device_put(ec_dev);
 }
 EXPORT_SYMBOL(cros_ec_unregister);
diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 7fac4d7c1b78..f747068a36cd 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -1168,10 +1168,16 @@ struct cros_ec_device *cros_ec_device_alloc(struct device *dev)
 {
 	struct cros_ec_device *ec_dev = devm_kzalloc(dev, sizeof(*ec_dev), GFP_KERNEL);
 
-	if (ec_dev) {
-		ec_dev->dev = dev;
-		kref_init(&ec_dev->kref);
-	}
+	if (!ec_dev)
+		return NULL;
+
+	ec_dev->dev = dev;
+	kref_init(&ec_dev->kref);
+	BLOCKING_INIT_NOTIFIER_HEAD(&ec_dev->event_notifier);
+	BLOCKING_INIT_NOTIFIER_HEAD(&ec_dev->panic_notifier);
+	lockdep_register_key(&ec_dev->lockdep_key);
+	mutex_init(&ec_dev->lock);
+	lockdep_set_class(&ec_dev->lock, &ec_dev->lockdep_key);
 
 	return ec_dev;
 }
@@ -1191,6 +1197,8 @@ EXPORT_SYMBOL_GPL(cros_ec_device_get);
 static void cros_ec_device_release(struct kref *kref)
 {
 	/* Do not free the cros_ec_device as it is still dev-managed. */
+	mutex_destroy(&ec_dev->lock);
+	lockdep_unregister_key(&ec_dev->lockdep_key);
 }
 
 /**
-- 
2.50.0.727.gbf7dc18ff4-goog

