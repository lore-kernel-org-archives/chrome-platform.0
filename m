Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB1E2C80
	for <chrome-platform@lists.linux.dev>; Wed,  9 Feb 2022 09:57:21 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id z15-20020a25bb0f000000b00613388c7d99so3787917ybg.8
        for <chrome-platform@lists.linux.dev>; Wed, 09 Feb 2022 01:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=rRfDQtc3ibfieKIjj3DCAb31SXeCDyRQBAeZpRGeCck=;
        b=WTPDUbHhg0wilFuxCd/IelD7nNvO3Csj7uiID2ORu9emKEAZV6bu77ustH3kF0nwq2
         5c9g4+0px0ANQxwXiZvJQ2b/s7vsDh/1qnJVVRIAVqNMZlzSsTm0ePfKEz5/APD+UC9f
         2DIQPU4/DsQx0OoZL7HeLKCF82bHp/vcBTPs6AgMTQO97AFoXKotUoABjrmFAbIhQsu3
         SIA8i5exsQ9nqSO4qNV0iC35moXQarJZEn4N8WofQhnO0z7OIxMQe7O5ilUKtWtBivye
         fewPgjjvQPmJ4rdGmY9oNIQI6vnKtSwQqhTNTKNPLGcn5IQDM2C+IpHN03hL87aR92Gg
         g+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=rRfDQtc3ibfieKIjj3DCAb31SXeCDyRQBAeZpRGeCck=;
        b=CTqrCNG151P3Y+ZXQ1AGYLEbMbC1SHa1S8Vkqg90rkGlz6FBxb1GqaVYeS7EAzX/+k
         6jZB5hgAqmn8F0dLHUcTdyfZRvO0Y6L3xwD1SpbrXR4iUcVCcKtQAUy6zW+dPgCixetE
         1Fian00N5+ybY7InOeIRzo279mxEb0QgONjo0sDl3CaY979fkpKjFjjKl80DaQzRiNDZ
         Lg5PIf9G58wz+4fozbqfrZ5uydFEnvp0ZIPb6roKGF7+v/bnn7tskjV5NOWXE5AWQeRT
         gkeNDfgKUwztw/enqQ9w2ZVMGEEjRqrYPiPQLAbrexrZyV2TkCdgc0DWZ+kaa+v60bUA
         CrNQ==
X-Gm-Message-State: AOAM5311QiCwGUa+cKbC8Hf7TKJ/fLlAxJ47h7azm+As6Qco17j45Qgm
	yxgzO2K5Vr75uN9Cbqu0Cufq1I0PfG6h
X-Google-Smtp-Source: ABdhPJys72ND3y5pJ8+gacD13ARKSrqIUPQoxstrxP07EwsR8hBG8a8LqvGPOf/A8EpFAiBtB8kpWKVfT/lz
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:ee29:8b32:75bc:44ec])
 (user=tzungbi job=sendgmr) by 2002:a25:251:: with SMTP id 78mr1266412ybc.730.1644400639117;
 Wed, 09 Feb 2022 01:57:19 -0800 (PST)
Date: Wed,  9 Feb 2022 17:56:59 +0800
In-Reply-To: <20220209095703.517608-1-tzungbi@google.com>
Message-Id: <20220209095703.517608-3-tzungbi@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220209095703.517608-1-tzungbi@google.com>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
Subject: [PATCH v3 2/6] platform/chrome: cros_ec: remove unused variable `was_wake_device`
From: Tzung-Bi Shih <tzungbi@google.com>
To: bleung@chromium.org, groeck@chromium.org
Cc: chrome-platform@lists.linux.dev, tzungbi@google.com, pmalani@chromium.org
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Prashant Malani <pmalani@chromium.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
Changes from v2:
(https://patchwork.kernel.org/project/chrome-platform/patch/20220209045035.380615-3-tzungbi@google.com/)
- Add pmalani's R-b tag.
- Remove redundant commit message.

Changes from v1:
(https://lore.kernel.org/lkml/20220125101527.1812887-1-tzungbi@google.com/T/#u)
- Use imperative mood in commit message.

 drivers/platform/chrome/cros_ec.c           | 1 -
 include/linux/platform_data/cros_ec_proto.h | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index 15f599d721a1..c9c90f98baf4 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -343,7 +343,6 @@ int cros_ec_suspend(struct cros_ec_device *ec_dev)
 		ec_dev->wake_enabled = !enable_irq_wake(ec_dev->irq);
 
 	disable_irq(ec_dev->irq);
-	ec_dev->was_wake_device = ec_dev->wake_enabled;
 	ec_dev->suspended = true;
 
 	return 0;
diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
index df3c78c92ca2..c65971ec90ea 100644
--- a/include/linux/platform_data/cros_ec_proto.h
+++ b/include/linux/platform_data/cros_ec_proto.h
@@ -76,8 +76,6 @@ struct cros_ec_command {
  * struct cros_ec_device - Information about a ChromeOS EC device.
  * @phys_name: Name of physical comms layer (e.g. 'i2c-4').
  * @dev: Device pointer for physical comms device
- * @was_wake_device: True if this device was set to wake the system from
- *                   sleep at the last suspend.
  * @cros_class: The class structure for this device.
  * @cmd_readmem: Direct read of the EC memory-mapped region, if supported.
  *     @offset: Is within EC_LPC_ADDR_MEMMAP region.
@@ -137,7 +135,6 @@ struct cros_ec_device {
 	/* These are used by other drivers that want to talk to the EC */
 	const char *phys_name;
 	struct device *dev;
-	bool was_wake_device;
 	struct class *cros_class;
 	int (*cmd_readmem)(struct cros_ec_device *ec, unsigned int offset,
 			   unsigned int bytes, void *dest);
-- 
2.35.0.263.gb82422642f-goog

