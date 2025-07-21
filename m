Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AED11CA0
	for <chrome-platform@lists.linux.dev>; Mon, 21 Jul 2025 04:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753073129; cv=none; b=h607HeC3vqvcoRcNFPrkYYU1JPnGZywpmvQSnoHqLrczT6y0qrAeiC6GgIh04S7eiNYDMjP1VX4grmE/DOF+nTmBoi3cUxaQifVCKdl1BCjJRs2cqwv2pn+zs+P3qKTG8P29t4eijbqgua2gx6PmpcZVDSzjOoH1J63jh0rn5ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753073129; c=relaxed/simple;
	bh=kOOQKQCc2JLL8AJ+ZShDxuJn+3f4YnRFEzIDZGJaCr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JsTZ6v7maKT3MkYBQ/XhDp4421zVvqdSCTezvSl17pBed8KJWGquoUiyhemkDbDc7URV5rjrX2g9VwoeJ9a5FTJDJrxBxzPTCA/LSHsGdNRmcCttDOGZzSo9U/QB9t7a0V5sVPaNcmLxIhD55jjQzx2WqWlqzmyMDUWymYllgog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qjoe4M2H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qjoe4M2H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 853B7C4CEF4;
	Mon, 21 Jul 2025 04:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753073129;
	bh=kOOQKQCc2JLL8AJ+ZShDxuJn+3f4YnRFEzIDZGJaCr0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qjoe4M2HBPvu7wgfx0oPYsy4kf7P+Kjg+rnfqn3XsH326VhB+YJrYBrzcp3JjRdON
	 y93dPOL0TIpSJJ4GbelbtY5Hi0NblFBgqsTrOjCBRSz3o2DW+OGs0BTkkOuFXh7SxA
	 zmBwrl6R9pBEM0GC6j1tZ0d1KywoedXKjhs8KbeBFFAhcBXBlCAkFvr2sGMkGkZ24V
	 sib6oWYTJluv9oPBmQmWoTpDXlc9qhDOPqozr1Ow3JhlIrSCOhlpI89dX9DmbRPXf1
	 m2s+fBAcubWnJOaIkX6sz+TpeRnwZxhtbSwQZYr2NaqT6De56vPXO9f4qRKk9CDFY3
	 Ut6cgCOeK8Ayw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org
Cc: tzungbi@kernel.org,
	dawidn@google.com,
	gregkh@linuxfoundation.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v3 8/8] platform/chrome: Manage struct cros_ec_device lifecycle by its refcount
Date: Mon, 21 Jul 2025 04:44:56 +0000
Message-ID: <20250721044456.2736300-9-tzungbi@kernel.org>
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

Stop delegating the memory to dev-managed.  Use its own refcount for
managing the lifecycle.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
No changes since v2 (https://patchwork.kernel.org/project/chrome-platform/patch/20250708080034.3425427-7-tzungbi@kernel.org/).

 drivers/platform/chrome/cros_ec_proto.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index f747068a36cd..06ccb07fad5f 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -1166,7 +1166,7 @@ EXPORT_SYMBOL_GPL(cros_ec_get_cmd_versions);
  */
 struct cros_ec_device *cros_ec_device_alloc(struct device *dev)
 {
-	struct cros_ec_device *ec_dev = devm_kzalloc(dev, sizeof(*ec_dev), GFP_KERNEL);
+	struct cros_ec_device *ec_dev = kzalloc(sizeof(*ec_dev), GFP_KERNEL);
 
 	if (!ec_dev)
 		return NULL;
@@ -1196,9 +1196,11 @@ EXPORT_SYMBOL_GPL(cros_ec_device_get);
 
 static void cros_ec_device_release(struct kref *kref)
 {
-	/* Do not free the cros_ec_device as it is still dev-managed. */
+	struct cros_ec_device *ec_dev = container_of(kref, struct cros_ec_device, kref);
+
 	mutex_destroy(&ec_dev->lock);
 	lockdep_unregister_key(&ec_dev->lockdep_key);
+	kfree(ec_dev);
 }
 
 /**
-- 
2.50.0.727.gbf7dc18ff4-goog

