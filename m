Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA1E1DE3A4
	for <chrome-platform@lists.linux.dev>; Mon,  2 Dec 2024 19:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733166041; cv=none; b=VxcaVOBg2sf2bK3WRlxGjBir81nTu3hwPBBRzIpL2+BNfgyBdqFumYrR6ZAn01esDQ2/zVNFm0RLBMrjyT0ugRPVUauMip3moqh5PTpJjMIpWayUw2jxwij49v2K4fyyHVEg677qPXFTq/SxHzdNyy+C4CcRA74usIsFHXwTjiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733166041; c=relaxed/simple;
	bh=8pXu+KIDxnIkhmw4RN4FUIaU1wDaZ00iHKd989Tn4us=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=txsJ11nDtOjEX/BgRwlroW1NYXQ8LOlfnEk42/BCL57J5FWhsWblZGQdlo5y3KCNTUbP/y0fbdSI4vbGRT2djAN8j0VbstKP2Y8LUuE8RnrG9zoNPvb4C5A+TWRerJtL8KmlSFTBHJbUoKzC4OeQUva9n3cCr/0FhfFJWDOpcY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=gBFUrsr+; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="gBFUrsr+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1733166037;
	bh=8pXu+KIDxnIkhmw4RN4FUIaU1wDaZ00iHKd989Tn4us=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gBFUrsr+Y5gbKfCIBnN+mVBBLd2ht/Yzp1ZH68AnyWMsUH4frA+qekk4i7UYOFI0e
	 RqmX5J+DxnEU0LTjzjOYyubiCNThRXZ56K6Eeuvec0cCO4nkiBkYsp6kBWYN1kA7cX
	 610RLvEWkMG/ATbdxyi5CBTAICClHMTtMw/KhT8s=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 02 Dec 2024 20:00:38 +0100
Subject: [PATCH 3/5] powerpc/powernv/flash: Use BIN_ATTR_ADMIN_WO() for
 bin_attribute definition
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241202-sysfs-const-bin_attr-admin_wo-v1-3-f489116210bf@weissschuh.net>
References: <20241202-sysfs-const-bin_attr-admin_wo-v1-0-f489116210bf@weissschuh.net>
In-Reply-To: <20241202-sysfs-const-bin_attr-admin_wo-v1-0-f489116210bf@weissschuh.net>
To: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Tzung-Bi Shih <tzungbi@kernel.org>, Brian Norris <briannorris@chromium.org>, 
 Julius Werner <jwerner@chromium.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, chrome-platform@lists.linux.dev, 
 linux-scsi@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733166036; l=2014;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=8pXu+KIDxnIkhmw4RN4FUIaU1wDaZ00iHKd989Tn4us=;
 b=HSh67zAWq4cTiwB5DE8N7fJi0p97k9R1Vmirv2ID1DlZHm9pe/UI8TBVHOAvhFnWJM+PYdtth
 zpBnll2/qZKAZPIjlMaeAO9ZGuBUFjgAjH5JihuVFiUP5OozHEDK1It
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Using the macro saves some lines of code and prepares the attribute for
the general constifications of struct bin_attributes.

While at it also constify the callback parameter.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 arch/powerpc/platforms/powernv/opal-flash.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-flash.c b/arch/powerpc/platforms/powernv/opal-flash.c
index d5ea04e8e4c526b99ca8f1ab613266b385362d82..76e3818601e5610f48bb8a6fd325239d6ad39723 100644
--- a/arch/powerpc/platforms/powernv/opal-flash.c
+++ b/arch/powerpc/platforms/powernv/opal-flash.c
@@ -431,9 +431,9 @@ static int alloc_image_buf(char *buffer, size_t count)
  * Parse candidate image header to get total image size
  * and pre-allocate required memory.
  */
-static ssize_t image_data_write(struct file *filp, struct kobject *kobj,
-				struct bin_attribute *bin_attr,
-				char *buffer, loff_t pos, size_t count)
+static ssize_t image_write(struct file *filp, struct kobject *kobj,
+			   const struct bin_attribute *bin_attr,
+			   char *buffer, loff_t pos, size_t count)
 {
 	int rc;
 
@@ -490,11 +490,7 @@ static ssize_t image_data_write(struct file *filp, struct kobject *kobj,
  *   update_flash	: Flash new firmware image
  *
  */
-static const struct bin_attribute image_data_attr = {
-	.attr = {.name = "image", .mode = 0200},
-	.size = MAX_IMAGE_SIZE,	/* Limit image size */
-	.write = image_data_write,
-};
+static const BIN_ATTR_ADMIN_WO(image, MAX_IMAGE_SIZE);
 
 static struct kobj_attribute validate_attribute =
 	__ATTR(validate_flash, 0600, validate_show, validate_store);
@@ -544,7 +540,7 @@ void __init opal_flash_update_init(void)
 		goto nokobj;
 	}
 
-	ret = sysfs_create_bin_file(opal_kobj, &image_data_attr);
+	ret = sysfs_create_bin_file(opal_kobj, &bin_attr_image);
 	if (ret) {
 		pr_warn("FLASH: Failed to create sysfs files\n");
 		goto nosysfs_file;

-- 
2.47.1

