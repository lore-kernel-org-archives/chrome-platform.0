Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFF184D11
	for <chrome-platform@lists.linux.dev>; Mon, 25 Mar 2024 23:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711410150; cv=none; b=VWr9HmZ0gJGaRGbiGHLvznudvIzCB/qDaPlGK0ZKZGKSUPGJfEGJ+98flruH4uNdfa7XmzsAd3CsFXsd+/0ab3LKUnrmZxnCG2CQ6XCoFthvKJlN8JhC0+GSnS07FN2yVXTAJRnNERMk7rcWw7zp6eGn5oe+rKxnpNbPWWcCYCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711410150; c=relaxed/simple;
	bh=jbSJ8EoUHTJOt2gEIo2bLB7/XqaW9sPGoBPW7n04aM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t/fsqbwmjN7KI84K7PRDwETmxJ1CRHivyEvaTzenEVU5WlUazzSuTcWE8LkfhpZzbc319x675uQPwgm9kWFMEpwYL6xySV4zsne9g6QFzZGZIkrDOw6cmLO0gAAjbkD9egEb6vBqHUH08giyViCYA4Wnl16ijF/ezXKBXUy0e4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Wsu2JmDj; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Wsu2JmDj"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-221e1910c3bso2496146fac.1
        for <chrome-platform@lists.linux.dev>; Mon, 25 Mar 2024 16:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711410148; x=1712014948; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cF9ERqG1zIS6eGrOVmXcQQcR69NGZdIYHtZJEychHus=;
        b=Wsu2JmDj4rcZQZbZxEcWc+z1DZBy9dTtij+t2s7cR2jP3IUvra9d6q7VeKXxBbfpU7
         Yl1WXThMRLTy8ZzPVzjUdJXNBf9bCYMoVbxNzYYxxSM4MME1EcTZirxa3fl+EnqAH1/2
         TOoqbyVqiLbAvepIWXue1mKKtMwxJAibHUMKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711410148; x=1712014948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cF9ERqG1zIS6eGrOVmXcQQcR69NGZdIYHtZJEychHus=;
        b=lBkXnCE3A00e3I9UB82RzQRDJDlnYEOTHMNBRpfdmOZakA8Cn2XkKMO0CTH22PNNx+
         JNTVhan4yOKSAsuufb5sAEZI6DAWuWQpyWKq504wp53piUjMyQbstU8UTazI/UJr+4a7
         NoivY4J6UHPWmkgxW6GxNQJbsBEPeJcHx38fGoIG9PPjpsYaSRWaxDpH44xwSUz6kREs
         o10hVnB+Mt7L8gPjPbDEqtGW0yzVSmmbGSaq645dEdfMqGzxsWhYekmpOsuZUo9xhJz3
         QzXq8wGOjoAJtIwQYgJhOVkYCPD4Xi+/MUSAe3hky1qY+HRLMaTCXiPshZQ0eqkdpDHA
         1Wuw==
X-Forwarded-Encrypted: i=1; AJvYcCXVDAfu/u9QJBbnVltOwLaIri+OC5jI91HOUmXKXia2/z37U8TdekGRA4uo/DRqS2VjAoO02hkQb97zZIqs6SaBUD+Cwq5Fd5WfVOcaIlDL
X-Gm-Message-State: AOJu0Yyy1HNR28URS4UdV4ZIZfqFZlzj78CnY1GR+tMqDl3+xffMvZ5G
	hIj6TLTZS84hfF67AAwWtDrEn6MkLlZwueq9hOx+D3vVeK5lz0SoUqc3ATezhg==
X-Google-Smtp-Source: AGHT+IFfqUoFUiQ3FrCIorattkPr5kkTc+89j+fGmnMi8wh4pRSenLSBlVADwPUv8ovpzetIZDte0w==
X-Received: by 2002:a05:6870:d8ca:b0:21f:df18:349b with SMTP id of10-20020a056870d8ca00b0021fdf18349bmr9488740oac.35.1711410148244;
        Mon, 25 Mar 2024 16:42:28 -0700 (PDT)
Received: from pholla1.c.googlers.com (210.73.125.34.bc.googleusercontent.com. [34.125.73.210])
        by smtp.gmail.com with ESMTPSA id e12-20020aa7824c000000b006e5f754646csm4705250pfn.139.2024.03.25.16.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 16:42:27 -0700 (PDT)
From: Pavan Holla <pholla@chromium.org>
Date: Mon, 25 Mar 2024 23:42:26 +0000
Subject: [PATCH v2 2/3] usb: typec: ucsi: Import interface for UCSI
 transport
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240325-public-ucsi-h-v2-2-a6d716968bb1@chromium.org>
References: <20240325-public-ucsi-h-v2-0-a6d716968bb1@chromium.org>
In-Reply-To: <20240325-public-ucsi-h-v2-0-a6d716968bb1@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Guenter Roeck <groeck@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
 chrome-platform@lists.linux.dev, Pavan Holla <pholla@chromium.org>
X-Mailer: b4 0.12.4

Import include/linux/usb/ucsi.h and remove any duplicate declarations.

Signed-off-by: Pavan Holla <pholla@chromium.org>
---
 drivers/usb/typec/ucsi/ucsi.h | 54 +------------------------------------------
 1 file changed, 1 insertion(+), 53 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 32daf5f58650..167951538030 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -10,22 +10,13 @@
 #include <linux/usb/typec.h>
 #include <linux/usb/pd.h>
 #include <linux/usb/role.h>
+#include <linux/usb/ucsi.h>
 #include <asm/unaligned.h>
 
 /* -------------------------------------------------------------------------- */
 
-struct ucsi;
-struct ucsi_altmode;
 struct dentry;
 
-/* UCSI offsets (Bytes) */
-#define UCSI_VERSION			0
-#define UCSI_CCI			4
-#define UCSI_CONTROL			8
-#define UCSI_MESSAGE_IN			16
-#define UCSI_MESSAGE_OUT		32
-#define UCSIv2_MESSAGE_OUT		272
-
 /* UCSI versions */
 #define UCSI_VERSION_1_2	0x0120
 #define UCSI_VERSION_2_0	0x0200
@@ -42,48 +33,6 @@ struct dentry;
  */
 #define UCSI_SPEC_REVISION_TO_BCD(_v_)  (((_v_) + 1) << 8)
 
-/* Command Status and Connector Change Indication (CCI) bits */
-#define UCSI_CCI_CONNECTOR(_c_)		(((_c_) & GENMASK(7, 1)) >> 1)
-#define UCSI_CCI_LENGTH(_c_)		(((_c_) & GENMASK(15, 8)) >> 8)
-#define UCSI_CCI_NOT_SUPPORTED		BIT(25)
-#define UCSI_CCI_CANCEL_COMPLETE	BIT(26)
-#define UCSI_CCI_RESET_COMPLETE		BIT(27)
-#define UCSI_CCI_BUSY			BIT(28)
-#define UCSI_CCI_ACK_COMPLETE		BIT(29)
-#define UCSI_CCI_ERROR			BIT(30)
-#define UCSI_CCI_COMMAND_COMPLETE	BIT(31)
-
-/**
- * struct ucsi_operations - UCSI I/O operations
- * @read: Read operation
- * @sync_write: Blocking write operation
- * @async_write: Non-blocking write operation
- * @update_altmodes: Squashes duplicate DP altmodes
- *
- * Read and write routines for UCSI interface. @sync_write must wait for the
- * Command Completion Event from the PPM before returning, and @async_write must
- * return immediately after sending the data to the PPM.
- */
-struct ucsi_operations {
-	int (*read)(struct ucsi *ucsi, unsigned int offset,
-		    void *val, size_t val_len);
-	int (*sync_write)(struct ucsi *ucsi, unsigned int offset,
-			  const void *val, size_t val_len);
-	int (*async_write)(struct ucsi *ucsi, unsigned int offset,
-			   const void *val, size_t val_len);
-	bool (*update_altmodes)(struct ucsi *ucsi, struct ucsi_altmode *orig,
-				struct ucsi_altmode *updated);
-};
-
-struct ucsi *ucsi_create(struct device *dev, const struct ucsi_operations *ops);
-void ucsi_destroy(struct ucsi *ucsi);
-int ucsi_register(struct ucsi *ucsi);
-void ucsi_unregister(struct ucsi *ucsi);
-void *ucsi_get_drvdata(struct ucsi *ucsi);
-void ucsi_set_drvdata(struct ucsi *ucsi, void *data);
-
-void ucsi_connector_change(struct ucsi *ucsi, u8 num);
-
 /* -------------------------------------------------------------------------- */
 
 /* Commands */
@@ -465,7 +414,6 @@ int ucsi_send_command(struct ucsi *ucsi, u64 command,
 		      void *retval, size_t size);
 
 void ucsi_altmode_update_active(struct ucsi_connector *con);
-int ucsi_resume(struct ucsi *ucsi);
 
 #if IS_ENABLED(CONFIG_POWER_SUPPLY)
 int ucsi_register_port_psy(struct ucsi_connector *con);

-- 
2.44.0.396.g6e790dbe36-goog

