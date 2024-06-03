Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEDE31A81
	for <chrome-platform@lists.linux.dev>; Mon,  3 Jun 2024 06:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717396737; cv=none; b=Bem8cvmV4nWwZEkR0C7c48eQ59G/aCx8PpwIbEZXhzKqidi4vs5aMiR0tUILyW7OoSmqO/sdZMRLYKoy4+OydT/ig4raQfZfI7I6Zi2c5a6j0aA0F19E5LJfA5zlC199X165kAxzPeqyOpbRqaDtU+9DNp3xQB5vmYa58VSpgRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717396737; c=relaxed/simple;
	bh=YO8T2l7ioynL4dJ2HBzsr4Lc+CIjZleDVP0rMdNwhdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bUDVZIvTzy3Z2hf3bFQllh7DiBJKSm44T0fdy6lyHCsboVzC9KhtyG+5gfawlEt3dCwEr4Ig8xKs0Q3h4PHqmW13iYqHEVi2e/YStQyKe2FYXEhBCZgfCBl4P0WBqCVPHNOvpyAOMSVe6LBuBegWs6wIvygjFFxAu6i+McTqhVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jubnut.com; spf=pass smtp.mailfrom=jubnut.com; dkim=pass (2048-bit key) header.d=jubnut.com header.i=@jubnut.com header.b=ngC8CfWU; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jubnut.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jubnut.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jubnut.com header.i=@jubnut.com header.b="ngC8CfWU"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Vt3wG1w98z9sGX;
	Mon,  3 Jun 2024 08:38:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jubnut.com; s=MBO0001;
	t=1717396734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q7DOQ46CF2Ag3tYa0Z/s3hWLgvY7PuGmefFcPNpDQz4=;
	b=ngC8CfWUs8uD1k2zCHYRGyzdOqxz4LlIDN/glyBAUzcTCasRaK5qyqA2ssChv2arUM9ORW
	t8A/+Y7DbuYoZ0CSx/DarkMRXAKzzvqoFiLYdpI1mdTGkb33eeQpM/FWiE9tn7qC0NQwOE
	0d3GEBfcmA7q7QKxSro7Nn5mtg/DThi1mxdUWFkeOHQMHTbBZOszn+t8QnpjBvGP4RPDFe
	5jDT9nUge+9BnJxLSBoGxUaSZGeTW+v0lEOlEhBXynWL4oueqDtupFsBzfdL0eA55y2VrF
	dzW9lWCQUCDt/uUtFoMqCboSxfPlk1PyyTrFQ28NehxnKgnFArf9c0OIvxZo3A==
From: Ben Walsh <ben@jubnut.com>
To: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	"Dustin L. Howett" <dustin@howett.net>,
	Kieran Levin <ktl@frame.work>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Ben Walsh <ben@jubnut.com>
Subject: [PATCH v2 3/5] platform/chrome: cros_ec_lpc: Add a new quirk for ACPI id
Date: Mon,  3 Jun 2024 07:38:32 +0100
Message-ID: <20240603063834.5580-4-ben@jubnut.com>
In-Reply-To: <20240603063834.5580-1-ben@jubnut.com>
References: <20240603063834.5580-1-ben@jubnut.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4Vt3wG1w98z9sGX

Framework Laptops' ACPI exposes the EC with id "PNP0C09". But
"PNP0C09" is part of the ACPI standard; there are lots of computers
with EC chips with this id, and most of them don't support the cros_ec
protocol.

The driver could find the ACPI device by having "PNP0C09" in the
acpi_match_table, but this would match devices which don't support the
cros_ec protocol. Instead, add a new quirk "CROS_EC_LPC_QUIRK_ACPI_ID"
which allows the id to be specified. This quirk is applied after the
DMI check shows that the device is supported.

Signed-off-by: Ben Walsh <ben@jubnut.com>
---
 drivers/platform/chrome/cros_ec_lpc.c | 53 ++++++++++++++++++++-------
 1 file changed, 40 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 6663141a07d4..c1c26a7ba6d4 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -39,6 +39,11 @@ static bool cros_ec_lpc_acpi_device_found;
  * be used as the base port for EC mapped memory.
  */
 #define CROS_EC_LPC_QUIRK_REMAP_MEMORY              BIT(0)
+/*
+ * Indicates that lpc_driver_data.quirk_acpi_id should be used to find
+ * the ACPI device.
+ */
+#define CROS_EC_LPC_QUIRK_ACPI_ID                   BIT(1)
 
 /**
  * struct lpc_driver_data - driver data attached to a DMI device ID to indicate
@@ -46,10 +51,12 @@ static bool cros_ec_lpc_acpi_device_found;
  * @quirks: a bitfield composed of quirks from CROS_EC_LPC_QUIRK_*
  * @quirk_mmio_memory_base: The first I/O port addressing EC mapped memory (used
  *                          when quirk ...REMAP_MEMORY is set.)
+ * @quirk_acpi_id: An ACPI HID to be used to find the ACPI device.
  */
 struct lpc_driver_data {
 	u32 quirks;
 	u16 quirk_mmio_memory_base;
+	const char *quirk_acpi_id;
 };
 
 /**
@@ -418,6 +425,26 @@ static void cros_ec_lpc_acpi_notify(acpi_handle device, u32 value, void *data)
 		pm_system_wakeup();
 }
 
+static acpi_status cros_ec_lpc_parse_device(acpi_handle handle, u32 level,
+					    void *context, void **retval)
+{
+	*(struct acpi_device **)context = acpi_fetch_acpi_dev(handle);
+	return AE_CTRL_TERMINATE;
+}
+
+static struct acpi_device *cros_ec_lpc_get_device(const char *id)
+{
+	struct acpi_device *adev = NULL;
+	acpi_status status = acpi_get_devices(id, cros_ec_lpc_parse_device,
+					      &adev, NULL);
+	if (ACPI_FAILURE(status)) {
+		pr_warn(DRV_NAME ": Looking for %s failed\n", id);
+		return NULL;
+	}
+
+	return adev;
+}
+
 static int cros_ec_lpc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -436,6 +463,8 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 
 	ec_lpc->mmio_memory_base = EC_LPC_ADDR_MEMMAP;
 
+	adev = ACPI_COMPANION(dev);
+
 	driver_data = platform_get_drvdata(pdev);
 	if (driver_data) {
 		quirks = driver_data->quirks;
@@ -445,6 +474,16 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 
 		if (quirks & CROS_EC_LPC_QUIRK_REMAP_MEMORY)
 			ec_lpc->mmio_memory_base = driver_data->quirk_mmio_memory_base;
+
+		if (quirks & CROS_EC_LPC_QUIRK_ACPI_ID) {
+			adev = cros_ec_lpc_get_device(driver_data->quirk_acpi_id);
+			if (!adev) {
+				dev_err(dev, "failed to get ACPI device '%s'",
+					driver_data->quirk_acpi_id);
+				return -ENODEV;
+			}
+			ACPI_COMPANION_SET(dev, adev);
+		}
 	}
 
 	/*
@@ -538,7 +577,6 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 	 * Connect a notify handler to process MKBP messages if we have a
 	 * companion ACPI device.
 	 */
-	adev = ACPI_COMPANION(dev);
 	if (adev) {
 		status = acpi_install_notify_handler(adev->handle,
 						     ACPI_ALL_NOTIFY,
@@ -705,23 +743,12 @@ static struct platform_device cros_ec_lpc_device = {
 	.name = DRV_NAME
 };
 
-static acpi_status cros_ec_lpc_parse_device(acpi_handle handle, u32 level,
-					    void *context, void **retval)
-{
-	*(bool *)context = true;
-	return AE_CTRL_TERMINATE;
-}
-
 static int __init cros_ec_lpc_init(void)
 {
 	int ret;
-	acpi_status status;
 	const struct dmi_system_id *dmi_match;
 
-	status = acpi_get_devices(ACPI_DRV_NAME, cros_ec_lpc_parse_device,
-				  &cros_ec_lpc_acpi_device_found, NULL);
-	if (ACPI_FAILURE(status))
-		pr_warn(DRV_NAME ": Looking for %s failed\n", ACPI_DRV_NAME);
+	cros_ec_lpc_acpi_device_found = !!cros_ec_lpc_get_device(ACPI_DRV_NAME);
 
 	dmi_match = dmi_first_match(cros_ec_lpc_dmi_table);
 
-- 
2.45.1

