Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B75238CFF7
	for <chrome-platform@lists.linux.dev>; Sat,  4 Apr 2026 07:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775289350; cv=none; b=a4a5OYLfkjaOqZ4FBtcsGVC7Rrq1m59JW7VXHDxhdT7PatDPqZzDn8JvkpMktip6n2gDd6qtqG9Hj4Nw/JqziCmIOeFGmYlP4nEyGQlTEuEmMwlpWGe/aO+l0VGnv3iVDRz8EOgPQ4FFvAXgR46AyzKIxFVMhW44O4cFuItvNj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775289350; c=relaxed/simple;
	bh=tzXGR8ydX1rF/V86lNPqa+YFNyOTF+OTb9Rk9SsVNQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dG9VDEan19t1KQsNMSC6zCRk+a0HeTy3kRg0WUebLCAFZGgvU1ABn6mVly5OB0GBxcBu4Yz7ykM8olWA4aUihOnaNcU6RnH6BnaPTGxGh3bqn83mfdzJsX/9vFt1Rn/N/JM0QMOzSfU00x8OQs+zeWEsTu8nFSUeD0+cxXUUbdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=EjylFkP1; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="EjylFkP1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775289337;
	bh=tzXGR8ydX1rF/V86lNPqa+YFNyOTF+OTb9Rk9SsVNQU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EjylFkP17WcGOEGlMkOxteLQc6RraZsKH7vldp/F5Uq9ygnRt6YogEYJuatlE5WDL
	 d8TgRiofHTiUDYu/yhL1b4bXcVMPfz6D/nYC/nVOrlVUg3aVCLggcv9SbAp0gyFU72
	 +DNbtmr+JFT+TEmgolAAZaCZQdp82OhGkjJoAPAA=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 04 Apr 2026 09:55:29 +0200
Subject: [PATCH 4/5] mfd: cros_ec: Add a helper to retrieve the EC device
 from the MFD parent
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260404-cros_kbd_led-cleanup-v1-4-0dc1100d54e3@weissschuh.net>
References: <20260404-cros_kbd_led-cleanup-v1-0-0dc1100d54e3@weissschuh.net>
In-Reply-To: <20260404-cros_kbd_led-cleanup-v1-0-0dc1100d54e3@weissschuh.net>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Lee Jones <lee@kernel.org>, Guenter Roeck <groeck@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775289335; l=1028;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=tzXGR8ydX1rF/V86lNPqa+YFNyOTF+OTb9Rk9SsVNQU=;
 b=Ozm+k9J+hzmooRvn2D65KhmzIwgfLS8U2ru/i7Xaco7EzrQ8FnI+SSnpEFZ7G+tnoQt3UiNJb
 Vnp9BFgyZOIClp/O7DyomHW7kVRMBXTu4zKps2pN/gy5cU02ETwqUyc
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The 'struct cros_ec_dev' needs to be retrieved from the MFD parent
device through a non-typesafe API. This logic is duplicated over all
CrOS EC drivers and it is not obvious what is going on.

Add a dedicated helper function which makes clear what is happening.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 include/linux/mfd/cros_ec.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/mfd/cros_ec.h b/include/linux/mfd/cros_ec.h
new file mode 100644
index 000000000000..ea5b007accfc
--- /dev/null
+++ b/include/linux/mfd/cros_ec.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __LINUX_MFD_CROS_EC_H
+#define __LINUX_MFD_CROS_EC_H
+
+#include <linux/compiler_attributes.h>
+
+struct cros_ec_dev;
+struct platform_device;
+
+static __always_inline struct cros_ec_dev *cros_ec_mfd_get_ec_dev(struct platform_device *pdev)
+{
+	return dev_get_drvdata(pdev->dev.parent);
+}
+
+#endif /* __LINUX_MFD_CROS_EC_H */

-- 
2.53.0

