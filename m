Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992295;
	b=gxC2kmpdj6FtDqSk33tls1+FTZiRN8whmkTBsZDGY+yN/9po8LUw/1Og2zFeFxhrqXiV
	 Fr/ZecmN/RqXZGrTEFNfzNrpcL5fyEPfIu2UscUP6qOf8UIets9XaKWJTm/otQ4wQMAmY
	 se9Zm1qe3141x91bGeMMdhowxPWMo9V9y0uwbPFJzXAgqNZiXR+t2s9ydBSbtI9L6P9P2
	 CPqg39XIVqnRZwgSS02fejW+Ew0AYmRAspSKe0iVkwy6b4f3td/WeXMklQmfaaeMznvfP
	 uD5sv/Hem4aAgJaqv3VjNMvKPDPIcBEKDZPBssLfcJ+TKtwk9S4IfyiklXiOfkYXpBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992295;
	h=DMARC-Filter:DKIM-Signature:From:Subject:Content-Type:To:
	 X-Original-From:References:X-Mailer:Content-Transfer-Encoding:Cc:Date:
	 Message-Id:In-Reply-To:Mime-Version:X-Lms-Return-Path:Received;
	bh=V+ax0LE+oaZFh2RJNlqPbptHh2NFlEiv1q4DHNueCJQ=;
	b=Eeps5nWCI19iSGffdwVkRe7s/mn4B5nnOZvIU/qkjM44KWxHtpQD5j24PMiXFGSRD+Qx
	 PGUtRvMOZhM4MrVm5i2V/vlWukbZMKY8ryqK5PdskqXI6+ththS2Lu+DGzQ/A6BAp1iNi
	 vM1vWW7U7molRNw6WAE0NAWXpC1qEJ4i1uyETF6fUfi5anUxWzx7tRfia3wDO2uqB1D6a
	 Sx2UrR+n+WxHO6rgBtgGNszHQmP1YugtqYJQk6mQeOO0UhLpQN0hfcwv9F2P3UyY3nOfD
	 45+nxA2Gg7jpDEpmz0wnDoX3lfguYnaccILwvRqET4L3987X5anvl1FPylU8BzDIfyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=WliUct3s;
	arc=none smtp.remote-ip=209.127.231.20
Received: from va-2-20.ptr.blmpb.com (va-2-20.ptr.blmpb.com [209.127.231.20])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD53606A32A
	for <chrome-platform@lists.linux.dev>; Wed, 18 Nov 2026 08:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DD53606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=WliUct3s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794992289;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=V+ax0LE+oaZFh2RJNlqPbptHh2NFlEiv1q4DHNueCJQ=;
 b=WliUct3soWnJNnSpDrD+EVGcWq4FGJjOpLF1oQlL1oKPdDxvMyEr/G67FqHOc4ktxvrgEn
 8qdhbOH71FbroZ3FdH6AMXQVAUVO98tC8QHT5A0Jv95rUY63lUXs2GDode+f7JVQMjKO4I
 IhO9Ye2cbNV8bCs9R7l0EaK8npFhzrnr6M31ZE638kiJPZNlXD7zd07f1BDFBZLdKvOX6s
 DlK3VQK7ySb+W/+VHaq/bFvQsGWWTvKUW7BIuubQr4KCJq9ljkVuZ1bjW/IO8oqRdQP/6u
 wIm+IqvE63D6wqsxZp+mqprZgepZm6aSqcKQGGKUGuQ2LoujF9Jucz1lFN89Bw==
From: "Wang Yang" <yang.wang@deepcomputing.io>
Subject: [PATCH 5/9] platform/chrome: Add SpacemiT K3 eSPI EC transport
Content-Type: text/plain; charset=UTF-8
To: "Yixun Lan" <dlan@kernel.org>, "Benson Leung" <bleung@chromium.org>
X-Original-From: Wang Yang <yang.wang@deepcomputing.io>
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 7bit
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Tzung-Bi Shih" <tzungbi@kernel.org>, 
	"Guenter Roeck" <groeck@chromium.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>, <devicetree@vger.kernel.org>, 
	<chrome-platform@lists.linux.dev>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Date: Wed, 18 Nov 2026 16:57:38 +0800
Message-Id: <20261118085742.1817536-6-yang.wang@deepcomputing.io>
In-Reply-To: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26afd689f+08d946+lists.linux.dev+yang.wang@deepcomputing.io>
Received: from ubuntu.. ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Wed, 18 Nov 2026 16:58:06 +0800

Add the K3-specific EC transport as a separate driver. Use a vendor-
scoped Kconfig symbol, module name and compatible. The register mapping
and recovery API are tied to the SpacemiT K3 controller, so this does
not claim to be a generic eSPI EC transport.

Preserve the original independent eSPI command and event logic. Existing
EC core, LPC, protocol and keyboard implementations remain unchanged.

Signed-off-by: Wang Yang <yang.wang@deepcomputing.io>
---
 drivers/platform/chrome/Kconfig               |  11 +
 drivers/platform/chrome/Makefile              |   1 +
 drivers/platform/chrome/cros_ec_spacemit_k3.c | 739 ++++++++++++++++++
 3 files changed, 751 insertions(+)
 create mode 100644 drivers/platform/chrome/cros_ec_spacemit_k3.c

diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
index 6beda4655..10933f7af 100644
--- a/drivers/platform/chrome/Kconfig
+++ b/drivers/platform/chrome/Kconfig
@@ -154,6 +154,17 @@ config CROS_EC_LPC
 	  To compile this driver as a module, choose M here: the
 	  module will be called cros_ec_lpcs.
 
+config CROS_EC_SPACEMIT_K3
+	tristate "SpacemiT K3 ChromeOS EC over eSPI"
+	depends on CROS_EC && SPACEMIT_ESPI_BUS
+	help
+	  Support a ChromeOS EC connected through the SpacemiT K3 eSPI
+	  peripheral shared-memory window. The transport supports host
+	  command protocol versions 2 and 3 and EC event interrupts.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called cros_ec_spacemit_k3.
+
 config CROS_EC_PROTO
 	tristate
 	help
diff --git a/drivers/platform/chrome/Makefile b/drivers/platform/chrome/Makefile
index b981a1bb5..e3357a6bc 100644
--- a/drivers/platform/chrome/Makefile
+++ b/drivers/platform/chrome/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_CROS_EC_I2C)		+= cros_ec_i2c.o
 obj-$(CONFIG_CROS_EC_ISHTP)		+= cros_ec_ishtp.o
 obj-$(CONFIG_CROS_TYPEC_SWITCH)		+= cros_typec_switch.o
 obj-$(CONFIG_CROS_EC_RPMSG)		+= cros_ec_rpmsg.o
+obj-$(CONFIG_CROS_EC_SPACEMIT_K3)		+= cros_ec_spacemit_k3.o
 obj-$(CONFIG_CROS_EC_SPI)		+= cros_ec_spi.o
 obj-$(CONFIG_CROS_EC_UART)		+= cros_ec_uart.o
 cros_ec_lpcs-objs			:= cros_ec_lpc.o cros_ec_lpc_mec.o
diff --git a/drivers/platform/chrome/cros_ec_spacemit_k3.c b/drivers/platform/chrome/cros_ec_spacemit_k3.c
new file mode 100644
index 000000000..b3010e2bf
--- /dev/null
+++ b/drivers/platform/chrome/cros_ec_spacemit_k3.c
@@ -0,0 +1,739 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ChromeOS EC interface for the SpacemiT K3 eSPI controller
+ *
+ * Copyright (c) 2012 The Chromium OS Authors.
+ * Copyright (c) 2024 SpacemiT, Inc.
+ *
+ * This driver provides the SpacemiT K3 eSPI window for ChromeOS EC communication.
+ * It converts LPC I/O port accesses to eSPI shared memory accesses while maintaining
+ * compatibility with the existing ChromeOS EC protocol stack.
+ */
+
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/jiffies.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/platform_data/cros_ec_commands.h>
+#include <linux/platform_data/cros_ec_proto.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/spacemit-k3-espi.h>
+#include <linux/suspend.h>
+
+#include "cros_ec.h"
+
+#define DRV_NAME "cros_ec_spacemit_k3"
+
+/* eSPI shared memory access timeout */
+#define ESPI_CMD_TIMEOUT_MS 5000
+/*
+ * After an EC reboot the transport may recover well before the EC firmware
+ * finishes repopulating the shared memory window. Allow a longer grace period
+ * here so the first post-reboot command does not immediately fall into another
+ * full timeout cycle.
+ */
+#define ESPI_READY_TIMEOUT_MS 20000
+#define ESPI_READY_POLL_INTERVAL_US 20000
+#define ESPI_RECOVERY_RETRY_INTERVAL_MS 5000
+#define ESPI_INVALID_STATUS_VALUE 0xff
+#define ESPI_INVALID_STATUS_MAX_POLLS 5
+
+/*
+ * eSPI Shared Memory Address Mapping for EC Communication
+ *
+ * This driver converts LPC I/O port accesses to eSPI shared memory accesses.
+ * The original LPC addresses are mapped to offsets within the eSPI shared memory region.
+ *
+ * Address Mapping Strategy:
+ * - LPC addresses are mapped to shared memory offsets
+ * - The mapping preserves the relative layout and functionality of the original LPC interface
+ * - All accesses go through espi_shared_mem_base + offset
+ *
+ * Memory Layout in eSPI Shared Memory:
+ * 0x000: Host command register (EC_LPC_ADDR_HOST_CMD -> 0x000)
+ * 0x001: Host data register (EC_LPC_ADDR_HOST_DATA -> 0x001)
+ * 0x010-0x017: Host arguments (8 bytes)
+ * 0x018-0x0FF: Host parameters (up to 232 bytes)
+ * 0x100-0x1FF: Packet data area (256 bytes for protocol v3)
+ * 0x200-0x2FF: Memory map region (256 bytes)
+ */
+
+/* eSPI shared memory offsets */
+#define ESPI_HOST_CMD_OFFSET 0x000 /* EC_LPC_ADDR_HOST_CMD -> 0x000 */
+#define ESPI_HOST_DATA_OFFSET 0x001 /* EC_LPC_ADDR_HOST_DATA -> 0x001 */
+#define ESPI_HOST_ARGS_OFFSET 0x010 /* EC_LPC_ADDR_HOST_ARGS -> 0x010 */
+#define ESPI_HOST_PARAM_OFFSET 0x018 /* EC_LPC_ADDR_HOST_PARAM -> 0x018 */
+#define ESPI_HOST_PACKET_OFFSET 0x100 /* EC_LPC_ADDR_HOST_PACKET -> 0x100 */
+#define ESPI_MEMMAP_OFFSET 0x200 /* EC_LPC_ADDR_MEMMAP -> 0x200 */
+
+/**
+ * struct cros_ec_espi - eSPI device-specific data
+ * @espi_shared_mem_base: Base address of eSPI shared memory region
+ * @mmio_memory_base: The first I/O port addressing EC mapped memory
+ * @io_mutex: Mutex to protect eSPI shared memory access
+ */
+struct cros_ec_espi {
+	void __iomem *espi_shared_mem_base;
+	u16 mmio_memory_base;
+	/* Serialize shared-window accesses and link recovery. */
+	struct mutex io_mutex;
+};
+
+/* Convert LPC address to eSPI shared memory offset */
+static inline u32 lpc_to_espi_offset(struct cros_ec_device *ec, u32 lpc_addr)
+{
+	switch (lpc_addr & 0xFF00) {
+	case 0x200: /* HOST_CMD/DATA region */
+		if (lpc_addr == EC_LPC_ADDR_HOST_CMD)
+			return ESPI_HOST_CMD_OFFSET;
+		else if (lpc_addr == EC_LPC_ADDR_HOST_DATA)
+			return ESPI_HOST_DATA_OFFSET;
+		break;
+	case 0x800: /* HOST_ARGS/PARAM/PACKET region */
+		/* Protocols 2 and 3 use the same LPC addresses. */
+		if (ec->proto_version > 2)
+			return ESPI_HOST_PACKET_OFFSET +
+			       (lpc_addr - EC_LPC_ADDR_HOST_PACKET);
+		else if (lpc_addr >= EC_LPC_ADDR_HOST_ARGS &&
+			 lpc_addr < EC_LPC_ADDR_HOST_PARAM)
+			return ESPI_HOST_ARGS_OFFSET +
+			       (lpc_addr - EC_LPC_ADDR_HOST_ARGS);
+		else if (lpc_addr >= EC_LPC_ADDR_HOST_PARAM)
+			return ESPI_HOST_PARAM_OFFSET +
+			       (lpc_addr - EC_LPC_ADDR_HOST_PARAM);
+		break;
+	case 0x900: /* MEMMAP region */
+		return ESPI_MEMMAP_OFFSET + (lpc_addr - EC_LPC_ADDR_MEMMAP);
+	}
+
+	/* Default mapping for unknown addresses */
+	pr_warn_once("Unknown LPC address 0x%x, using direct offset\n",
+		     lpc_addr);
+	return lpc_addr & 0xFF;
+}
+
+/* Return the checksum of the bytes read from the peripheral window. */
+static int cros_ec_espi_read_bytes(struct cros_ec_device *ec,
+				   unsigned int offset, unsigned int length,
+				   u8 *dest)
+{
+	struct cros_ec_espi *ec_espi = ec->priv;
+	void __iomem *addr;
+	u32 espi_offset;
+	u8 sum = 0;
+	int i;
+
+	mutex_lock(&ec_espi->io_mutex);
+
+	for (i = 0; i < length; ++i) {
+		espi_offset = lpc_to_espi_offset(ec, offset + i);
+		addr = ec_espi->espi_shared_mem_base + espi_offset;
+
+		/* eSPI shared memory: 1-byte access */
+		dest[i] = readb(addr);
+		sum += dest[i];
+	}
+
+	mutex_unlock(&ec_espi->io_mutex);
+
+	/* Return checksum of all bytes read */
+	return sum;
+}
+
+/* Return the checksum of the bytes written to the peripheral window. */
+static int cros_ec_espi_write_bytes(struct cros_ec_device *ec,
+				    unsigned int offset, unsigned int length,
+				    const u8 *msg)
+{
+	struct cros_ec_espi *ec_espi = ec->priv;
+	void __iomem *addr;
+	u32 espi_offset;
+	u8 sum = 0;
+	int i;
+
+	mutex_lock(&ec_espi->io_mutex);
+
+	for (i = 0; i < length; ++i) {
+		espi_offset = lpc_to_espi_offset(ec, offset + i);
+		addr = ec_espi->espi_shared_mem_base + espi_offset;
+
+		/* eSPI shared memory: 1-byte access */
+		writeb(msg[i], addr);
+		sum += msg[i];
+	}
+
+	mutex_unlock(&ec_espi->io_mutex);
+
+	/* Return checksum of all bytes written */
+	return sum;
+}
+
+static int ec_response_timed_out(struct cros_ec_device *ec)
+{
+	unsigned long timeout = jiffies + msecs_to_jiffies(ESPI_CMD_TIMEOUT_MS);
+	unsigned int invalid_status_polls = 0;
+	u8 data;
+	int ret;
+
+	usleep_range(200, 300);
+	do {
+		ret = cros_ec_espi_read_bytes(ec, EC_LPC_ADDR_HOST_CMD, 1, &data);
+		if (ret < 0)
+			return ret;
+
+		if (!(data & EC_LPC_STATUS_BUSY_MASK))
+			return 0;
+
+		/*
+		 * While the EC is rebooting the shared window reads back as 0xff.
+		 * Escalate to controller recovery quickly instead of burning the
+		 * whole command timeout on an absent endpoint.
+		 */
+		if (data == ESPI_INVALID_STATUS_VALUE) {
+			if (++invalid_status_polls >= ESPI_INVALID_STATUS_MAX_POLLS)
+				return 1;
+		} else {
+			invalid_status_polls = 0;
+		}
+
+		usleep_range(100, 200);
+	} while (time_before(jiffies, timeout));
+
+	return 1;
+}
+
+static bool cros_ec_espi_valid_id(const u8 *buf)
+{
+	return buf[0] == 'E' && buf[1] == 'C';
+}
+
+static int cros_ec_espi_read_id(struct cros_ec_device *ec, u8 *buf)
+{
+	return cros_ec_espi_read_bytes(ec, EC_LPC_ADDR_MEMMAP + EC_MEMMAP_ID, 2, buf);
+}
+
+static int cros_ec_espi_recover_bus(struct cros_ec_device *ec)
+{
+	struct cros_ec_espi *ec_espi = ec->priv;
+	int ret;
+
+	mutex_lock(&ec_espi->io_mutex);
+	ret = spacemit_k3_espi_recover(ec->dev->parent);
+	mutex_unlock(&ec_espi->io_mutex);
+
+	return ret;
+}
+
+static int cros_ec_espi_wait_ready(struct cros_ec_device *ec, const char *reason)
+{
+	struct device *dev = ec->dev;
+	unsigned long timeout = jiffies + msecs_to_jiffies(ESPI_READY_TIMEOUT_MS);
+	unsigned long next_recover =
+		jiffies + msecs_to_jiffies(ESPI_RECOVERY_RETRY_INTERVAL_MS);
+	u8 buf[2] = {};
+	int ret = 0;
+
+	do {
+		ret = cros_ec_espi_read_id(ec, buf);
+		if (ret >= 0 && cros_ec_espi_valid_id(buf))
+			return 0;
+
+		/*
+		 * The first recover may happen while the EC is still updating and
+		 * leave the controller in a master-only state. Retry link recovery
+		 * periodically while waiting so we can renegotiate as soon as the
+		 * EC starts responding again.
+		 */
+		if (time_after_eq(jiffies, next_recover)) {
+			ret = cros_ec_espi_recover_bus(ec);
+			if (ret)
+				dev_dbg(dev, "background eSPI recovery failed: %d\n", ret);
+			next_recover = jiffies +
+				msecs_to_jiffies(ESPI_RECOVERY_RETRY_INTERVAL_MS);
+			continue;
+		}
+
+		usleep_range(ESPI_READY_POLL_INTERVAL_US,
+			     ESPI_READY_POLL_INTERVAL_US + 10000);
+	} while (time_before(jiffies, timeout));
+
+	if (ret < 0)
+		dev_warn(dev, "EC not ready after %s: %d\n", reason, ret);
+	else
+		dev_warn(dev, "EC not ready after %s (id: 0x%02x 0x%02x)\n",
+			 reason, buf[0], buf[1]);
+
+	return ret < 0 ? ret : -ETIMEDOUT;
+}
+
+static int cros_ec_espi_recover_controller(struct cros_ec_device *ec,
+					   const char *reason)
+{
+	struct device *dev = ec->dev;
+	int ret;
+
+	if (!dev->parent)
+		return -ENODEV;
+
+	dev_warn(dev, "attempting eSPI controller recovery after %s\n", reason);
+	ret = cros_ec_espi_recover_bus(ec);
+	if (ret)
+		dev_err(dev, "eSPI controller recovery failed: %d\n", ret);
+
+	if (ret)
+		return ret;
+
+	return cros_ec_espi_wait_ready(ec, reason);
+}
+
+static int cros_ec_pkt_xfer_espi_once(struct cros_ec_device *ec,
+				      struct cros_ec_command *msg)
+{
+	struct ec_host_response response;
+	u8 sum;
+	int ret = 0;
+	u8 *dout;
+
+	/*
+	 * Give EC some time between commands to avoid overwhelming it.
+	 * This prevents timing issues when multiple commands are sent rapidly.
+	 */
+	usleep_range(500, 1000);
+
+	ret = cros_ec_prepare_tx(ec, msg);
+	if (ret < 0) {
+		dev_err(ec->dev, "cros_ec_prepare_tx failed: %d\n", ret);
+		goto done;
+	}
+
+	/* Write buffer */
+	ret = cros_ec_espi_write_bytes(ec, EC_LPC_ADDR_HOST_PACKET, ret, ec->dout);
+	if (ret < 0) {
+		dev_err(ec->dev, "Write to HOST_PACKET failed: %d\n", ret);
+		goto done;
+	}
+
+	/* Here we go */
+	sum = EC_COMMAND_PROTOCOL_3;
+	ret = cros_ec_espi_write_bytes(ec, EC_LPC_ADDR_HOST_CMD, 1, &sum);
+	if (ret < 0) {
+		dev_err(ec->dev, "Write to HOST_CMD failed: %d\n", ret);
+		goto done;
+	}
+
+	ret = ec_response_timed_out(ec);
+	if (ret < 0) {
+		dev_err(ec->dev, "ec_response_timed_out failed: %d\n", ret);
+		goto done;
+	}
+	if (ret) {
+		dev_warn(ec->dev, "EC response timed out\n");
+		ret = -ETIMEDOUT;
+		goto done;
+	}
+
+	/* Check result */
+	ret = cros_ec_espi_read_bytes(ec, EC_LPC_ADDR_HOST_DATA, 1, &sum);
+	if (ret < 0) {
+		dev_err(ec->dev, "Read from HOST_DATA failed: %d\n", ret);
+		goto done;
+	}
+
+	msg->result = sum;
+	ret = cros_ec_check_result(ec, msg);
+	if (ret) {
+		dev_err(ec->dev, "cros_ec_check_result failed: %d\n", ret);
+		goto done;
+	}
+
+	/* Read back response */
+	dout = (u8 *)&response;
+	ret = cros_ec_espi_read_bytes(ec, EC_LPC_ADDR_HOST_PACKET, sizeof(response),
+				      dout);
+	if (ret < 0) {
+		dev_err(ec->dev, "Read response header failed: %d\n", ret);
+		goto done;
+	}
+	sum = ret;
+
+	msg->result = response.result;
+
+	if (response.data_len > msg->insize) {
+		dev_err(ec->dev, "packet too long (%d bytes, expected %d)",
+			response.data_len, msg->insize);
+		ret = -EMSGSIZE;
+		goto done;
+	}
+
+	/* Read response and process checksum */
+	ret = cros_ec_espi_read_bytes(ec, EC_LPC_ADDR_HOST_PACKET + sizeof(response),
+				      response.data_len, msg->data);
+	if (ret < 0) {
+		dev_err(ec->dev, "Read response data failed: %d\n", ret);
+		goto done;
+	}
+	sum += ret;
+
+	if (sum) {
+		dev_err(ec->dev, "bad packet checksum %02x\n",
+			response.checksum);
+		ret = -EBADMSG;
+		goto done;
+	}
+
+	/* Return actual amount of data received */
+	ret = response.data_len;
+done:
+	return ret;
+}
+
+static int cros_ec_espi_xfer_retry(struct cros_ec_device *ec,
+				   struct cros_ec_command *msg,
+				   int (*xfer_once)(struct cros_ec_device *ec,
+						    struct cros_ec_command *msg),
+				   const char *name)
+{
+	int ret;
+
+	ret = xfer_once(ec, msg);
+	if (ret != -ETIMEDOUT)
+		return ret;
+
+	if (cros_ec_espi_recover_controller(ec, name))
+		return ret;
+
+	dev_dbg(ec->dev, "eSPI controller recovered, retrying %s\n", name);
+	return xfer_once(ec, msg);
+}
+
+static int cros_ec_pkt_xfer_espi(struct cros_ec_device *ec,
+				 struct cros_ec_command *msg)
+{
+	return cros_ec_espi_xfer_retry(ec, msg, cros_ec_pkt_xfer_espi_once,
+				       "packet transfer timeout");
+}
+
+static int cros_ec_cmd_xfer_espi_once(struct cros_ec_device *ec,
+				      struct cros_ec_command *msg)
+{
+	struct ec_lpc_host_args args;
+	u8 sum;
+	int ret = 0;
+
+	if (msg->outsize > EC_PROTO2_MAX_PARAM_SIZE ||
+	    msg->insize > EC_PROTO2_MAX_PARAM_SIZE) {
+		dev_err(ec->dev, "invalid buffer sizes (out %d, in %d)\n",
+			msg->outsize, msg->insize);
+		return -EINVAL;
+	}
+
+	/*
+	 * Give EC some time between commands to avoid overwhelming it.
+	 * This prevents timing issues when multiple commands are sent rapidly.
+	 */
+	usleep_range(500, 1000);
+
+	/* Now actually send the command to the EC and get the result */
+	args.flags = EC_HOST_ARGS_FLAG_FROM_HOST;
+	args.command_version = msg->version;
+	args.data_size = msg->outsize;
+
+	/* Initialize checksum */
+	sum = msg->command + args.flags + args.command_version + args.data_size;
+
+	/* Copy data and update checksum */
+	ret = cros_ec_espi_write_bytes(ec, EC_LPC_ADDR_HOST_PARAM, msg->outsize,
+				       msg->data);
+	if (ret < 0) {
+		dev_err(ec->dev, "Write to HOST_PARAM failed: %d\n", ret);
+		goto done;
+	}
+	sum += ret;
+
+	/* Finalize checksum and write args */
+	args.checksum = sum;
+	ret = cros_ec_espi_write_bytes(ec, EC_LPC_ADDR_HOST_ARGS, sizeof(args),
+				       (u8 *)&args);
+	if (ret < 0) {
+		dev_err(ec->dev, "Write to HOST_ARGS failed: %d\n", ret);
+		goto done;
+	}
+
+	/* Here we go */
+	sum = msg->command;
+	ret = cros_ec_espi_write_bytes(ec, EC_LPC_ADDR_HOST_CMD, 1, &sum);
+	if (ret < 0) {
+		dev_err(ec->dev, "Write to HOST_CMD failed: %d\n", ret);
+		goto done;
+	}
+
+	ret = ec_response_timed_out(ec);
+	if (ret < 0) {
+		dev_err(ec->dev, "ec_response_timed_out failed: %d\n", ret);
+		goto done;
+	}
+	if (ret) {
+		dev_warn(ec->dev, "EC response timed out\n");
+		ret = -ETIMEDOUT;
+		goto done;
+	}
+
+	/* Check result */
+	ret = cros_ec_espi_read_bytes(ec, EC_LPC_ADDR_HOST_DATA, 1, &sum);
+	if (ret < 0) {
+		dev_err(ec->dev, "Read from HOST_DATA failed: %d\n", ret);
+		goto done;
+	}
+
+	msg->result = sum;
+	ret = cros_ec_check_result(ec, msg);
+	if (ret) {
+		dev_err(ec->dev, "cros_ec_check_result failed: %d\n", ret);
+		goto done;
+	}
+
+	/* Read back args */
+	ret = cros_ec_espi_read_bytes(ec, EC_LPC_ADDR_HOST_ARGS, sizeof(args),
+				      (u8 *)&args);
+	if (ret < 0) {
+		dev_err(ec->dev, "Read HOST_ARGS failed: %d\n", ret);
+		goto done;
+	}
+
+	if (args.data_size > msg->insize) {
+		dev_err(ec->dev, "packet too long (%d bytes, expected %d)",
+			args.data_size, msg->insize);
+		ret = -ENOSPC;
+		goto done;
+	}
+
+	/* Start calculating response checksum */
+	sum = msg->command + args.flags + args.command_version + args.data_size;
+
+	/* Read response and update checksum */
+	ret = cros_ec_espi_read_bytes(ec, EC_LPC_ADDR_HOST_PARAM, args.data_size,
+				      msg->data);
+	if (ret < 0) {
+		dev_err(ec->dev, "Read response data failed: %d\n", ret);
+		goto done;
+	}
+	sum += ret;
+
+	/* Verify checksum */
+	if (args.checksum != sum) {
+		dev_err(ec->dev,
+			"bad packet checksum, expected %02x, got %02x\n",
+			args.checksum, sum);
+		ret = -EBADMSG;
+		goto done;
+	}
+
+	/* Return actual amount of data received */
+	ret = args.data_size;
+done:
+	return ret;
+}
+
+static int cros_ec_cmd_xfer_espi(struct cros_ec_device *ec,
+				 struct cros_ec_command *msg)
+{
+	return cros_ec_espi_xfer_retry(ec, msg, cros_ec_cmd_xfer_espi_once,
+				       "command transfer timeout");
+}
+
+/* Returns num bytes read, or negative on error. Doesn't need locking. */
+static int cros_ec_espi_readmem(struct cros_ec_device *ec, unsigned int offset,
+				unsigned int bytes, void *dest)
+{
+	struct cros_ec_espi *ec_espi = ec->priv;
+	int i = offset;
+	char *s = dest;
+	int cnt = 0;
+	int ret;
+
+	if (offset >= EC_MEMMAP_SIZE || bytes > EC_MEMMAP_SIZE - offset)
+		return -EINVAL;
+
+	/* fixed length */
+	if (bytes) {
+		ret = cros_ec_espi_read_bytes(ec, ec_espi->mmio_memory_base + offset,
+					      bytes, s);
+		if (ret < 0)
+			return ret;
+		return bytes;
+	}
+
+	/* string */
+	for (; i < EC_MEMMAP_SIZE; i++, s++) {
+		ret = cros_ec_espi_read_bytes(ec, ec_espi->mmio_memory_base + i, 1,
+					      s);
+		if (ret < 0)
+			return ret;
+		cnt++;
+		if (!*s)
+			break;
+	}
+
+	return cnt;
+}
+
+static irqreturn_t cros_ec_espi_irq_handler(int irq, void *data)
+{
+	struct cros_ec_device *ec_dev = data;
+
+	ec_dev->last_event_time = cros_ec_get_time_ns();
+
+	return IRQ_WAKE_THREAD;
+}
+
+static int cros_ec_espi_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cros_ec_device *ec;
+	struct cros_ec_espi *ec_espi;
+	struct resource *res;
+	u8 id[2];
+	int irq, ret;
+
+	ec_espi = devm_kzalloc(dev, sizeof(*ec_espi), GFP_KERNEL);
+	if (!ec_espi)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res || resource_size(res) < 0x300)
+		return -EINVAL;
+	ec_espi->espi_shared_mem_base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(ec_espi->espi_shared_mem_base))
+		return PTR_ERR(ec_espi->espi_shared_mem_base);
+
+	ec_espi->mmio_memory_base = EC_LPC_ADDR_MEMMAP;
+	mutex_init(&ec_espi->io_mutex);
+
+	ec = cros_ec_device_alloc(dev);
+	if (!ec)
+		return -ENOMEM;
+
+	ec->phys_name = dev_name(dev);
+	ec->cmd_xfer = cros_ec_cmd_xfer_espi;
+	ec->pkt_xfer = cros_ec_pkt_xfer_espi;
+	ec->cmd_readmem = cros_ec_espi_readmem;
+	ec->priv = ec_espi;
+	platform_set_drvdata(pdev, ec);
+
+	ret = cros_ec_espi_read_id(ec, id);
+	if (ret < 0 || !cros_ec_espi_valid_id(id)) {
+		ret = cros_ec_espi_recover_controller(ec, "EC detection");
+		if (ret)
+			return dev_err_probe(dev, ret, "EC is not ready\n");
+	}
+
+	/* The EC still initializes its command window after publishing its ID. */
+	msleep(100);
+
+	irq = platform_get_irq_optional(pdev, 0);
+	if (irq < 0 && irq != -ENXIO)
+		return irq;
+
+	/* Keep IRQ ownership here; the core requests a fixed low-level IRQ. */
+	ret = cros_ec_register(ec);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register EC\n");
+
+	if (irq > 0) {
+		ec->irq = irq;
+		ret = devm_request_threaded_irq(dev, irq, cros_ec_espi_irq_handler,
+						cros_ec_irq_thread, IRQF_ONESHOT,
+						"chromeos-ec", ec);
+		if (ret) {
+			cros_ec_unregister(ec);
+			return dev_err_probe(dev, ret, "failed to request EC IRQ\n");
+		}
+
+		/* Drain events queued before the edge-triggered IRQ was ready. */
+		if (ec->mkbp_event_supported)
+			cros_ec_irq_thread(irq, ec);
+	}
+
+	return 0;
+}
+
+static void cros_ec_espi_remove(struct platform_device *pdev)
+{
+	struct cros_ec_device *ec = platform_get_drvdata(pdev);
+
+	if (ec->irq > 0)
+		devm_free_irq(&pdev->dev, ec->irq, ec);
+	cros_ec_unregister(ec);
+}
+
+static const struct of_device_id cros_ec_espi_of_match[] = {
+	{ .compatible = "spacemit,k3-cros-ec" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, cros_ec_espi_of_match);
+
+#ifdef CONFIG_PM_SLEEP
+static int cros_ec_espi_prepare(struct device *dev)
+{
+	struct cros_ec_device *ec_dev = dev_get_drvdata(dev);
+
+	return cros_ec_suspend_prepare(ec_dev);
+}
+
+static void cros_ec_espi_complete(struct device *dev)
+{
+	struct cros_ec_device *ec_dev = dev_get_drvdata(dev);
+
+	cros_ec_resume_complete(ec_dev);
+}
+
+static int cros_ec_espi_suspend_late(struct device *dev)
+{
+	struct cros_ec_device *ec_dev = dev_get_drvdata(dev);
+
+	return cros_ec_suspend_late(ec_dev);
+}
+
+static int cros_ec_espi_resume_early(struct device *dev)
+{
+	struct cros_ec_device *ec_dev = dev_get_drvdata(dev);
+
+	return cros_ec_resume_early(ec_dev);
+}
+#endif
+
+static const struct dev_pm_ops cros_ec_espi_pm_ops = {
+#ifdef CONFIG_PM_SLEEP
+	.prepare = cros_ec_espi_prepare,
+	.complete = cros_ec_espi_complete,
+#endif
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(cros_ec_espi_suspend_late,
+				     cros_ec_espi_resume_early)
+};
+
+static struct platform_driver cros_ec_espi_driver = {
+	.driver = {
+		.name = DRV_NAME,
+		.of_match_table = cros_ec_espi_of_match,
+		.pm = &cros_ec_espi_pm_ops,
+		/*
+		 * Child devices may probe before us, and they racily
+		 * check our drvdata pointer. Force synchronous probe until
+		 * those races are resolved.
+		 */
+		.probe_type = PROBE_FORCE_SYNCHRONOUS,
+	},
+	.probe = cros_ec_espi_probe,
+	.remove = cros_ec_espi_remove,
+};
+
+module_platform_driver(cros_ec_espi_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("SpacemiT K3 eSPI ChromeOS EC transport");
+MODULE_ALIAS("platform:" DRV_NAME);
-- 
2.43.0
