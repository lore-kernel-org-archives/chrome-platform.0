Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4748733D9
	for <chrome-platform@lists.linux.dev>; Tue,  4 Oct 2022 16:40:18 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id d14so7104402ilf.2
        for <chrome-platform@lists.linux.dev>; Tue, 04 Oct 2022 09:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eD9ClG3484euncfgO7/kWoFVuqCGIS8dHqTmfi3+hso=;
        b=OeJot6r8y2szSxpLDtQIn9KSUn2xUxeyO2c7FqTadsyS4ImiOdmPMP8rJOkjoPdNHK
         hgh5qA9ZdSntAt2DahEKPpvl+Cy1GPx8RMUefJLeRlQVwZ5XOOYcnhh2bZwMYL94y78Q
         RAa1CD25iGqbMH7Hml6lAs4X3wwd1tuWy/RP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eD9ClG3484euncfgO7/kWoFVuqCGIS8dHqTmfi3+hso=;
        b=nChPeIGo1mCyDKLWEyv20rAs/AyMW3XlgyGSBwZ3q1cA69C8kR/kpZorRDtGy9a+HN
         MZ0EAe5ZEPqN/dztXjz3G262l9jlLRDKvtFDWvIHUrDEzKohkGAtt5DBbNtHBTuNw5Uh
         ii74/2gFhcX6cSAuXPErVKC+329HmP8+vXWEU5uVySs0ux9U2pioeTYiRXQA29O0PhIt
         p/JumQ7sHGkG0YCHPDOulLQl10SeNViExPAsXAyDQ3MIWPMuiOPxfyEomduNcld429Ld
         gpOY05lGOUy0HoAbKO3mvaHZ568eCozLYvaFI7YyvjWPRfoFNsAXFDALytDnbsuAqhiI
         RDUA==
X-Gm-Message-State: ACrzQf1Zp73ZM2mPwFO39qrtD7prGPELquxaVva5RNznNLXIHpEkPDmc
	1mWf0D0IerwRzZJvx4Q9hdAFMw==
X-Google-Smtp-Source: AMsMyM7YgaTI90NoeZN31vh13geqkMjdQP34bTTWiVoSK6Wr/qBNlflg02nAFz+ksv/cbZicyeJnVw==
X-Received: by 2002:a05:6e02:dc6:b0:2f9:76bd:9f76 with SMTP id l6-20020a056e020dc600b002f976bd9f76mr8068790ilj.259.1664901617204;
        Tue, 04 Oct 2022 09:40:17 -0700 (PDT)
Received: from jrosenth45.lan (c-73-217-34-248.hsd1.co.comcast.net. [73.217.34.248])
        by smtp.gmail.com with ESMTPSA id o20-20020a056e02093400b002f9c552aac2sm2565758ilt.1.2022.10.04.09.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 09:40:16 -0700 (PDT)
From: Jack Rosenthal <jrosenth@chromium.org>
To: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	gregkh@linuxfoundation.org
Cc: Jack Rosenthal <jrosenth@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Julius Werner <jwerner@chromium.org>
Subject: [PATCH v13] firmware: google: Implement cbmem in sysfs driver
Date: Tue,  4 Oct 2022 10:40:11 -0600
Message-Id: <20221004164011.108352-1-jrosenth@chromium.org>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CBMEM area is a downward-growing memory region used by coreboot to
dynamically allocate tagged data structures ("CBMEM entries") that
remain resident during boot.

This implements a driver which exports access to the CBMEM entries
via sysfs under /sys/bus/coreboot/devices/cbmem-<id>.

This implementation is quite versatile.  Examples of how it could be
used are given below:

* Tools like util/cbmem from the coreboot tree could use this driver
  instead of finding CBMEM in /dev/mem directly.  Alternatively,
  firmware developers debugging an issue may find the sysfs interface
  more ergonomic than the cbmem tool and choose to use it directly.

* The crossystem tool, which exposes verified boot variables, can use
  this driver to read the vboot work buffer.

* Tools which read the BIOS SPI flash (e.g., flashrom) can find the
  flash layout in CBMEM directly, which is significantly faster than
  searching the flash directly.

Write access is provided to all CBMEM regions via
/sys/bus/coreboot/devices/cbmem-<id>/mem, as the existing cbmem
tooling updates this memory region, and envisioned use cases with
crossystem can benefit from updating memory regions.

Link: https://issuetracker.google.com/239604743
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Reviewed-by: Guenter Roeck <groeck@chromium.org>
Reviewed-by: Julius Werner <jwerner@chromium.org>
Tested-by: Jack Rosenthal <jrosenth@chromium.org>
Signed-off-by: Jack Rosenthal <jrosenth@chromium.org>
---
Changes in v13:
* Removed "id" attribute as it's reduntant to the device name.
* ABI documentation has more specific information about hexadecimal
  output.
* Updated Kconfig help text to include module name.

 Documentation/ABI/testing/sysfs-bus-coreboot |  45 +++++++
 drivers/firmware/google/Kconfig              |  15 +++
 drivers/firmware/google/Makefile             |   3 +
 drivers/firmware/google/cbmem.c              | 129 +++++++++++++++++++
 drivers/firmware/google/coreboot_table.c     |  11 +-
 drivers/firmware/google/coreboot_table.h     |  18 +++
 6 files changed, 220 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coreboot
 create mode 100644 drivers/firmware/google/cbmem.c

diff --git a/Documentation/ABI/testing/sysfs-bus-coreboot b/Documentation/ABI/testing/sysfs-bus-coreboot
new file mode 100644
index 000000000000..9c5accecc470
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-coreboot
@@ -0,0 +1,45 @@
+What:		/sys/bus/coreboot
+Date:		August 2022
+Contact:	Jack Rosenthal <jrosenth@chromium.org>
+Description:
+		The coreboot bus provides a variety of virtual devices used to
+		access data structures created by the Coreboot BIOS.
+
+What:		/sys/bus/coreboot/devices/cbmem-<id>
+Date:		August 2022
+Contact:	Jack Rosenthal <jrosenth@chromium.org>
+Description:
+		CBMEM is a downwards-growing memory region created by Coreboot,
+		and contains tagged data structures to be shared with payloads
+		in the boot process and the OS.  Each CBMEM entry is given a
+		directory in /sys/bus/coreboot/devices based on its id.
+		A list of ids known to Coreboot can be found in the coreboot
+		source tree at
+		``src/commonlib/bsd/include/commonlib/bsd/cbmem_id.h``.
+
+What:		/sys/bus/coreboot/devices/cbmem-<id>/address
+Date:		August 2022
+Contact:	Jack Rosenthal <jrosenth@chromium.org>
+Description:
+		This is the pyhsical memory address that the CBMEM entry's data
+		begins at, in hexadecimal (e.g., ``0x76ffe000``).
+
+What:		/sys/bus/coreboot/devices/cbmem-<id>/size
+Date:		August 2022
+Contact:	Jack Rosenthal <jrosenth@chromium.org>
+Description:
+		This is the size of the CBMEM entry's data, in hexadecimal
+		(e.g., ``0x1234``).
+
+What:		/sys/bus/coreboot/devices/cbmem-<id>/mem
+Date:		August 2022
+Contact:	Jack Rosenthal <jrosenth@chromium.org>
+Description:
+		A file exposing read/write access to the entry's data.  Note
+		that this file does not support mmap(), as coreboot
+		does not guarantee that the data will be page-aligned.
+
+		The mode of this file is 0600.  While there shouldn't be
+		anything security-sensitive contained in CBMEM, read access
+		requires root privileges given this is exposing a small subset
+		of physical memory.
diff --git a/drivers/firmware/google/Kconfig b/drivers/firmware/google/Kconfig
index 983e07dc022e..9f190eab43ed 100644
--- a/drivers/firmware/google/Kconfig
+++ b/drivers/firmware/google/Kconfig
@@ -19,6 +19,21 @@ config GOOGLE_SMI
 	  driver provides an interface for reading and writing NVRAM
 	  variables.
 
+config GOOGLE_CBMEM
+	tristate "CBMEM entries in sysfs"
+	depends on GOOGLE_COREBOOT_TABLE
+	help
+	  CBMEM is a downwards-growing memory region created by the
+	  Coreboot BIOS containing tagged data structures from the
+	  BIOS.  These data structures expose things like the verified
+	  boot firmware variables, flash layout, firmware event log,
+	  and more.
+
+	  This option enables the cbmem module, which causes the
+	  kernel to search for Coreboot CBMEM entries, and expose the
+	  memory for each entry in sysfs under
+	  /sys/bus/coreboot/devices/cbmem-<id>.
+
 config GOOGLE_COREBOOT_TABLE
 	tristate "Coreboot Table Access"
 	depends on HAS_IOMEM && (ACPI || OF)
diff --git a/drivers/firmware/google/Makefile b/drivers/firmware/google/Makefile
index d17caded5d88..8151e323cc43 100644
--- a/drivers/firmware/google/Makefile
+++ b/drivers/firmware/google/Makefile
@@ -7,5 +7,8 @@ obj-$(CONFIG_GOOGLE_MEMCONSOLE)            += memconsole.o
 obj-$(CONFIG_GOOGLE_MEMCONSOLE_COREBOOT)   += memconsole-coreboot.o
 obj-$(CONFIG_GOOGLE_MEMCONSOLE_X86_LEGACY) += memconsole-x86-legacy.o
 
+# Must come after coreboot_table.o, as this driver depends on that bus type.
+obj-$(CONFIG_GOOGLE_CBMEM)		+= cbmem.o
+
 vpd-sysfs-y := vpd.o vpd_decode.o
 obj-$(CONFIG_GOOGLE_VPD)		+= vpd-sysfs.o
diff --git a/drivers/firmware/google/cbmem.c b/drivers/firmware/google/cbmem.c
new file mode 100644
index 000000000000..685f3070ce9d
--- /dev/null
+++ b/drivers/firmware/google/cbmem.c
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * cbmem.c
+ *
+ * Driver for exporting cbmem entries in sysfs.
+ *
+ * Copyright 2022 Google LLC
+ */
+
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/kobject.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/sysfs.h>
+
+#include "coreboot_table.h"
+
+struct cbmem_entry {
+	char *mem_file_buf;
+	u32 size;
+};
+
+static struct cbmem_entry *to_cbmem_entry(struct kobject *kobj)
+{
+	return dev_get_drvdata(kobj_to_dev(kobj));
+}
+
+static ssize_t mem_read(struct file *filp, struct kobject *kobj,
+			struct bin_attribute *bin_attr, char *buf, loff_t pos,
+			size_t count)
+{
+	struct cbmem_entry *entry = to_cbmem_entry(kobj);
+
+	return memory_read_from_buffer(buf, count, &pos, entry->mem_file_buf,
+				       entry->size);
+}
+
+static ssize_t mem_write(struct file *filp, struct kobject *kobj,
+			 struct bin_attribute *bin_attr, char *buf, loff_t pos,
+			 size_t count)
+{
+	struct cbmem_entry *entry = to_cbmem_entry(kobj);
+
+	if (pos < 0 || pos >= entry->size)
+		return -EINVAL;
+	if (count > entry->size - pos)
+		count = entry->size - pos;
+
+	memcpy(entry->mem_file_buf + pos, buf, count);
+	return count;
+}
+static BIN_ATTR_ADMIN_RW(mem, 0);
+
+static ssize_t address_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	struct coreboot_device *cbdev = dev_to_coreboot_device(dev);
+
+	return sysfs_emit(buf, "0x%llx\n", cbdev->cbmem_entry.address);
+}
+static DEVICE_ATTR_RO(address);
+
+static ssize_t size_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
+{
+	struct coreboot_device *cbdev = dev_to_coreboot_device(dev);
+
+	return sysfs_emit(buf, "0x%x\n", cbdev->cbmem_entry.entry_size);
+}
+static DEVICE_ATTR_RO(size);
+
+static struct attribute *attrs[] = {
+	&dev_attr_address.attr,
+	&dev_attr_size.attr,
+	NULL,
+};
+
+static struct bin_attribute *bin_attrs[] = {
+	&bin_attr_mem,
+	NULL,
+};
+
+static const struct attribute_group cbmem_entry_group = {
+	.attrs = attrs,
+	.bin_attrs = bin_attrs,
+};
+
+static const struct attribute_group *dev_groups[] = {
+	&cbmem_entry_group,
+	NULL,
+};
+
+static int cbmem_entry_probe(struct coreboot_device *dev)
+{
+	struct cbmem_entry *entry;
+
+	entry = devm_kzalloc(&dev->dev, sizeof(*entry), GFP_KERNEL);
+	if (!entry)
+		return -ENOMEM;
+
+	dev_set_drvdata(&dev->dev, entry);
+	entry->mem_file_buf = devm_memremap(&dev->dev, dev->cbmem_entry.address,
+					    dev->cbmem_entry.entry_size,
+					    MEMREMAP_WB);
+	if (!entry->mem_file_buf)
+		return -ENOMEM;
+
+	entry->size = dev->cbmem_entry.entry_size;
+
+	return 0;
+}
+
+static struct coreboot_driver cbmem_entry_driver = {
+	.probe = cbmem_entry_probe,
+	.drv = {
+		.name = "cbmem",
+		.owner = THIS_MODULE,
+		.dev_groups = dev_groups,
+	},
+	.tag = LB_TAG_CBMEM_ENTRY,
+};
+module_coreboot_driver(cbmem_entry_driver);
+
+MODULE_AUTHOR("Jack Rosenthal <jrosenth@chromium.org>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/firmware/google/coreboot_table.c b/drivers/firmware/google/coreboot_table.c
index c52bcaa9def6..7748067eb9e6 100644
--- a/drivers/firmware/google/coreboot_table.c
+++ b/drivers/firmware/google/coreboot_table.c
@@ -97,12 +97,21 @@ static int coreboot_table_populate(struct device *dev, void *ptr)
 		if (!device)
 			return -ENOMEM;
 
-		dev_set_name(&device->dev, "coreboot%d", i);
 		device->dev.parent = dev;
 		device->dev.bus = &coreboot_bus_type;
 		device->dev.release = coreboot_device_release;
 		memcpy(&device->entry, ptr_entry, entry->size);
 
+		switch (device->entry.tag) {
+		case LB_TAG_CBMEM_ENTRY:
+			dev_set_name(&device->dev, "cbmem-%08x",
+				     device->cbmem_entry.id);
+			break;
+		default:
+			dev_set_name(&device->dev, "coreboot%d", i);
+			break;
+		}
+
 		ret = device_register(&device->dev);
 		if (ret) {
 			put_device(&device->dev);
diff --git a/drivers/firmware/google/coreboot_table.h b/drivers/firmware/google/coreboot_table.h
index beb778674acd..37f4d335a606 100644
--- a/drivers/firmware/google/coreboot_table.h
+++ b/drivers/firmware/google/coreboot_table.h
@@ -39,6 +39,18 @@ struct lb_cbmem_ref {
 	u64 cbmem_addr;
 };
 
+#define LB_TAG_CBMEM_ENTRY 0x31
+
+/* Corresponds to LB_TAG_CBMEM_ENTRY */
+struct lb_cbmem_entry {
+	u32 tag;
+	u32 size;
+
+	u64 address;
+	u32 entry_size;
+	u32 id;
+};
+
 /* Describes framebuffer setup by coreboot */
 struct lb_framebuffer {
 	u32 tag;
@@ -65,10 +77,16 @@ struct coreboot_device {
 	union {
 		struct coreboot_table_entry entry;
 		struct lb_cbmem_ref cbmem_ref;
+		struct lb_cbmem_entry cbmem_entry;
 		struct lb_framebuffer framebuffer;
 	};
 };
 
+static inline struct coreboot_device *dev_to_coreboot_device(struct device *dev)
+{
+	return container_of(dev, struct coreboot_device, dev);
+}
+
 /* A driver for handling devices described in coreboot tables. */
 struct coreboot_driver {
 	int (*probe)(struct coreboot_device *);
-- 
2.38.0.rc1.362.ged0d419d3c-goog

