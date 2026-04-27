Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296E81EE7C6;
	Mon, 27 Apr 2026 13:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777297680; cv=none; b=oLVuGiZUoV9iq3KRBKiofcM7vL6g4UJcbQd01q4m73Ovkblxte+qm7Crc8cGHQwU6ZSNgE9JR0TtRdrBau8jQTi1HlLkx14OauboIwPr1bAx8m84jqD36/p9nsdVD9jpHgYUH/f7TR5z0kssMQ1tIbuz314JKQrNZqgWpBIU9Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777297680; c=relaxed/simple;
	bh=/nbg4csrds1GV+pHT06fJFCg9AKtL4PAQmpYknDp23A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p4U3yS3UffuYPur5mTGx3vyI19YLk5310bppMk9Z4yaZhZ7YcNHVKU/UhGVG7tnwWScKByQP6bSBEXe0FJdu8WVpR8SCA2QMesUHA6AJSB7/NRCWlcvnwJ4RSstuF17i3LqUpKhN2NaJrjQIbJZF8ipzMSt4UcY/CPvq7/0kPRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CNoNEv9N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CNoNEv9N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06A0EC4AF09;
	Mon, 27 Apr 2026 13:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777297679;
	bh=/nbg4csrds1GV+pHT06fJFCg9AKtL4PAQmpYknDp23A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CNoNEv9NlkVjGNI25wVRYgU5/OyWoplg0eV7uydWYQDKQFEHXdJPCWQ8OUG4kVzan
	 UfoiF/8SB/cPWTev3e7uVSRNBrLoDoy5/W15u+y0/X466coFR/H4wSadAyalpvGHRW
	 sFPHQeYWJGLsg4okPQprG+UmCV7HeQXR4pogEjrabIIL0tvTh9J7869jHJzCzIfisJ
	 BA0cE6vfH3WiOocYjJAtA+tU5zhmP9mQzNgkTPO7yX1fZAVqPGa0qL0AGhlnKXc9c2
	 ATU0YRGNZQdEp6x5BDhTCYKhge0PP2PkqaGB8nS1k06ixTr5Yu1VDgrdMUpLEB9fqq
	 uNZCndhZP4kEQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Benson Leung <bleung@chromium.org>,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Johan Hovold <johan@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH 8/8] platform/chrome: cros_ec_chardev: Use misc_sync_register()
Date: Mon, 27 Apr 2026 21:46:59 +0800
Message-ID: <20260427134659.95181-9-tzungbi@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260427134659.95181-1-tzungbi@kernel.org>
References: <20260427134659.95181-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to use misc_sync_register() instead of misc_register() to
enable synchronous file operations support.  This helps prevent
Use-After-Free errors when the device is removed while files are still
open.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_chardev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_chardev.c b/drivers/platform/chrome/cros_ec_chardev.c
index 7e046fc56998..d44afa3ef92d 100644
--- a/drivers/platform/chrome/cros_ec_chardev.c
+++ b/drivers/platform/chrome/cros_ec_chardev.c
@@ -430,7 +430,7 @@ static int cros_ec_chardev_probe(struct platform_device *pdev)
 	pdata->misc.name = ec_platform->ec_name;
 	pdata->misc.parent = pdev->dev.parent;
 
-	ret = misc_register(&pdata->misc);
+	ret = misc_sync_register(&pdata->misc);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register misc device\n");
 		goto err_unregister_notifier;
-- 
2.51.0

