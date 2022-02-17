Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BEB3D61
	for <chrome-platform@lists.linux.dev>; Thu, 17 Feb 2022 16:59:49 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id z7so2722522ilb.6
        for <chrome-platform@lists.linux.dev>; Thu, 17 Feb 2022 08:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=howett-net.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xwIxiKUP7PqQ7DJOcZ4CEXh73RTxob2Q5iXow8reRPA=;
        b=mrwmhsJti+UQWnlJ/Q02ry5ISbaduJAxwnRqes87uYXC9MhMG2RhqBV0n6owitUhsT
         rdxX19pR0SYI3NOzvB6rOWcNQ44jubOs0MHcssa4Fl8/8VzL1cH2n1Q+xw/1GjTrBx0t
         +MulzVISJ1thRZ1XKNOWvuq/8JXYiVYZz+peZd0JGkdkHoQdRbjRlSf5fHj5wGlTqp45
         xMUvjOfQT9pYzGrdJc1Vbq7oDKmT1LNKKM1OuoEokOEasTnY18kR0lgQYot/YIaLC0Ti
         eN70Uz2JBjVXC+RdK1ySM8l9BeFwQpgwqc9dKu5C1UVD5lkNbgomj8UiZYovCoIAawOi
         A2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xwIxiKUP7PqQ7DJOcZ4CEXh73RTxob2Q5iXow8reRPA=;
        b=7i2DbgN87yq3xCYolDfPwaGign5H+OgeaJdowiix9HGX7bi2/kLoNkgND+HZ1QUcds
         /ZtoQhnaSsjxBQ0xKExObLdotbuF1YPHCq1Uu07dLBPujhO9ktqidwUu5+n00QJWaVgt
         jMyYET7DROB5zIQSAUmpgR8ROmqYaC1kCvn6FzG375m/3hHjjbZwiTtVgxrTKeWUYfUd
         h1R5HlblgSKOe3Mvr9rjTpAKpTWd/pTDXG7g3ylB5AbORza9+MUcE9Ls/JKcMLDK8pO5
         dg8pu06SVjF2GDJcjHUZH8IZEoz0X+wfIUv0Z2v+H5Ajl3o4Cgegb4v65b0vq3FK5zNa
         julQ==
X-Gm-Message-State: AOAM533THK0xIsHxFI0MrDtPbFaSikYDQx1t0hfyyt1Xp42Bnxn7d7Yf
	M6Ovg+59rZ3gA671R4TJB8rY42fUzPCbCRXJ
X-Google-Smtp-Source: ABdhPJxj/sh8XDF+m9qntCVX6RTJJnFt0cX9NPmKuJq4RfmZK9G460/LzeWUa5Fv3S2/2tB5AxMRSg==
X-Received: by 2002:a92:6406:0:b0:2bb:f1de:e13e with SMTP id y6-20020a926406000000b002bbf1dee13emr2520370ilb.305.1645117188791;
        Thu, 17 Feb 2022 08:59:48 -0800 (PST)
Received: from rigel.delfino.n.howett.net ([2600:1700:df50:a7cf::725])
        by smtp.googlemail.com with ESMTPSA id a15sm2108346ilq.24.2022.02.17.08.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 08:59:48 -0800 (PST)
From: "Dustin L. Howett" <dustin@howett.net>
To: chrome-platform@lists.linux.dev
Cc: Benson Leung <bleung@chromium.org>,
	Aseda Aboagye <aaboagye@chromium.org>,
	Tzung-Bi Shih <tzungbi@google.com>,
	Michael Niksa <michael.niksa@live.com>,
	"Dustin L. Howett" <dustin@howett.net>
Subject: [PATCH v3 2/2] platform/chrome: cros_ec_lpcs: reserve the MEC LPC I/O ports first
Date: Thu, 17 Feb 2022 10:59:30 -0600
Message-Id: <20220217165930.15081-3-dustin@howett.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217165930.15081-1-dustin@howett.net>
References: <20220217165930.15081-1-dustin@howett.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some ChromeOS EC devices (such as the Framework Laptop) only map I/O
ports 0x800-0x807. Making the larger reservation required by the non-MEC
LPC (the 0xFF ports for the memory map, and the 0xFF ports for the
parameter region) is non-viable on these devices.

Since we probe the MEC EC first, we can get away with a smaller
reservation that covers the MEC EC ports. If we fall back to classic
LPC, we can grow the reservation to cover the memory map and the
parameter region.

cros_ec_lpc_probe also interacted with I/O ports 0x800-0x807 without a
reservation. Restructuring the code to request the MEC LPC region first
obviates the need to do so.

Signed-off-by: Dustin L. Howett <dustin@howett.net>
---
 drivers/platform/chrome/cros_ec_lpc.c         | 39 ++++++++++++-------
 .../linux/platform_data/cros_ec_commands.h    | 10 +++--
 2 files changed, 33 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 458eb59db2ff..06fdfe365710 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -341,9 +341,14 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 	u8 buf[2];
 	int irq, ret;
 
-	if (!devm_request_region(dev, EC_LPC_ADDR_MEMMAP, EC_MEMMAP_SIZE,
-				 dev_name(dev))) {
-		dev_err(dev, "couldn't reserve memmap region\n");
+	/*
+	 * The Framework Laptop (and possibly other non-ChromeOS devices)
+	 * only exposes the eight I/O ports that are required for the Microchip EC.
+	 * Requesting a larger reservation will fail.
+	 */
+	if (!devm_request_region(dev, EC_HOST_CMD_REGION0,
+				 EC_HOST_CMD_MEC_REGION_SIZE, dev_name(dev))) {
+		dev_err(dev, "couldn't reserve MEC region\n");
 		return -EBUSY;
 	}
 
@@ -357,6 +362,12 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 	cros_ec_lpc_ops.write = cros_ec_lpc_mec_write_bytes;
 	cros_ec_lpc_ops.read(EC_LPC_ADDR_MEMMAP + EC_MEMMAP_ID, 2, buf);
 	if (buf[0] != 'E' || buf[1] != 'C') {
+		if (!devm_request_region(dev, EC_LPC_ADDR_MEMMAP, EC_MEMMAP_SIZE,
+					 dev_name(dev))) {
+			dev_err(dev, "couldn't reserve memmap region\n");
+			return -EBUSY;
+		}
+
 		/* Re-assign read/write operations for the non MEC variant */
 		cros_ec_lpc_ops.read = cros_ec_lpc_read_bytes;
 		cros_ec_lpc_ops.write = cros_ec_lpc_write_bytes;
@@ -366,17 +377,19 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 			dev_err(dev, "EC ID not detected\n");
 			return -ENODEV;
 		}
-	}
 
-	if (!devm_request_region(dev, EC_HOST_CMD_REGION0,
-				 EC_HOST_CMD_REGION_SIZE, dev_name(dev))) {
-		dev_err(dev, "couldn't reserve region0\n");
-		return -EBUSY;
-	}
-	if (!devm_request_region(dev, EC_HOST_CMD_REGION1,
-				 EC_HOST_CMD_REGION_SIZE, dev_name(dev))) {
-		dev_err(dev, "couldn't reserve region1\n");
-		return -EBUSY;
+		/* Reserve the remaining I/O ports required by the non-MEC protocol. */
+		if (!devm_request_region(dev, EC_HOST_CMD_REGION0 + EC_HOST_CMD_MEC_REGION_SIZE,
+					 EC_HOST_CMD_REGION_SIZE - EC_HOST_CMD_MEC_REGION_SIZE,
+					 dev_name(dev))) {
+			dev_err(dev, "couldn't reserve remainder of region0\n");
+			return -EBUSY;
+		}
+		if (!devm_request_region(dev, EC_HOST_CMD_REGION1,
+					 EC_HOST_CMD_REGION_SIZE, dev_name(dev))) {
+			dev_err(dev, "couldn't reserve region1\n");
+			return -EBUSY;
+		}
 	}
 
 	ec_dev = devm_kzalloc(dev, sizeof(*ec_dev), GFP_KERNEL);
diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 271bd87bff0a..1a9a38ce0d3f 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -51,10 +51,14 @@
 /*
  * The actual block is 0x800-0x8ff, but some BIOSes think it's 0x880-0x8ff
  * and they tell the kernel that so we have to think of it as two parts.
+ *
+ * Other BIOSes report only the I/O port region spanned by the Microchip
+ * MEC series EC; an attempt to address a larger region may fail.
  */
-#define EC_HOST_CMD_REGION0    0x800
-#define EC_HOST_CMD_REGION1    0x880
-#define EC_HOST_CMD_REGION_SIZE 0x80
+#define EC_HOST_CMD_REGION0       0x800
+#define EC_HOST_CMD_REGION1       0x880
+#define EC_HOST_CMD_REGION_SIZE    0x80
+#define EC_HOST_CMD_MEC_REGION_SIZE 0x8
 
 /* EC command register bit functions */
 #define EC_LPC_CMDR_DATA	BIT(0)  /* Data ready for host to read */
-- 
2.34.1

