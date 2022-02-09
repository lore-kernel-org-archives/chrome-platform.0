Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9883229CA
	for <chrome-platform@lists.linux.dev>; Wed,  9 Feb 2022 04:50:50 +0000 (UTC)
Received: by mail-pj1-f73.google.com with SMTP id n9-20020a17090a73c900b001b5cafefa27so955241pjk.2
        for <chrome-platform@lists.linux.dev>; Tue, 08 Feb 2022 20:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=hiaEEl8bksaecRkgyTL7gJID3dXR4jWaEsiI7nesU2A=;
        b=SLwJlCNfDVrERxV3KVLYCRVs9OuOaJ/+pXloZdDk7PyosNGrY0tAbuJWQr3RIV4uE1
         ICjv377W2f5z8NaZjeYjP2nooHtcU/n9TZxnVzh1WkOanAF2wAEk/p2MIKI0U9r/boKF
         go2jQL9x1Obahde5DMscxtJ73DiFBMGW/b/rsPovouZ6URrCPZM1x5dn7tn2i6tD3BN0
         lUl2OCdb3xMw6GVeB4MlvUjE4OZbE2b+dTy7iF3x9DLogIDRvabkyont9Gk/8QgEGVnz
         FZYQAh3fTCKq1w+0wD9QYHPCKwyU+yT2qngAtQNQ4O3YRD6hMRWzvuC8Fb4Vnchg1NYJ
         8wFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=hiaEEl8bksaecRkgyTL7gJID3dXR4jWaEsiI7nesU2A=;
        b=q8aqbHYDP6Zrtv+48VLKjnFAdtoTDTzQNGnZ3q35+lila9uaxLUbxC9SEf8dqYM8mc
         2PjnX5G8M9hcXa4n1PS7vW+tnhoTGy1rU8yvkjf6WWTYQkoxDePxVs+rCFnkc9/K/Sc3
         BMxeHe+GT8YH6WNA7CxvOTg3lqGZ/ilTHMqeoM/B7aLibINhS5H1N0jeSUUyEI1r839b
         MjUh9BuOfryfQNXsufWPoypktWNOxlaRM8bJ7JdTiy3G+TwG6NfW5OxEiS7BuIxuamNj
         jGiIliblLAIeyNa9gf+wt+KKLXRh8zJyUUGw8xSq08L+xIi7mVnsIHSnot5EtNfSovXL
         5kvw==
X-Gm-Message-State: AOAM530y5Kpdwq47o4W02ghdCdLRgRixpZW5VH387cQ5qaQez8fTkkIs
	NecBU7A9Sc/RElpA7pGKJNb6UQzxftAB
X-Google-Smtp-Source: ABdhPJy1dbFk4ggAppsMVvoyDeOhoQGS5Tm1MsSApeVo/23yMvIkcCjFQdWCr+UmyGmbx3Kxm33qtFwrVh7R
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:4b6f:f14d:be50:86a])
 (user=tzungbi job=sendgmr) by 2002:a17:903:41d0:: with SMTP id
 u16mr523179ple.144.1644382249855; Tue, 08 Feb 2022 20:50:49 -0800 (PST)
Date: Wed,  9 Feb 2022 12:50:31 +0800
In-Reply-To: <20220209045035.380615-1-tzungbi@google.com>
Message-Id: <20220209045035.380615-3-tzungbi@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220209045035.380615-1-tzungbi@google.com>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
Subject: [PATCH v2 2/6] platform/chrome: cros_ec: remove unused variable `was_wake_device`
From: Tzung-Bi Shih <tzungbi@google.com>
To: bleung@chromium.org, groeck@chromium.org
Cc: chrome-platform@lists.linux.dev, tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"

`was_wake_device` is unused.  Remove it.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/platform/chrome/cros_ec.c           | 1 -
 include/linux/platform_data/cros_ec_proto.h | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index 7ce667ff08e0..303af630c03e 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -344,7 +344,6 @@ int cros_ec_suspend(struct cros_ec_device *ec_dev)
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

