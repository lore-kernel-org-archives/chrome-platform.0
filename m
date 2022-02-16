Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5170D23AC
	for <chrome-platform@lists.linux.dev>; Wed, 16 Feb 2022 08:03:28 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id a12-20020a056902056c00b0061dc0f2a94aso2724451ybt.6
        for <chrome-platform@lists.linux.dev>; Wed, 16 Feb 2022 00:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=1aDHrU0OAcezWyAKSlCofgKbepJMdH6+ryrRYnqT3dM=;
        b=m3Sv/VM/AlkzDd57mYih9LNc5rNzE8uBAoQF+vV9+aWQnFJQxTji5+HbY31hng1WA5
         GCfsFP2zAmvphqMab7UKlG9U8RmvsUoBFfyluy0WN4Rg42Mo1fETKvNiR2BV2XnbLHis
         ipuYLauO9EQ5q0Tu+OIPQ13DpfgOOV+5S8sN2N9/u1AVAuaeGzcwJQ26ADm0om3OOLWU
         teAGfdXE+N6iv9PgAywSz729pqw4xhin4KNIjb5EELI91ItE3uC0SZKhjKajM1KmF4r9
         HOWw35rpM9zkF7lUqa7L1VTycERYigL6dK+tTvgsXMl8ZZUMEX5m5V0nT4O/brE9LKrg
         bCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=1aDHrU0OAcezWyAKSlCofgKbepJMdH6+ryrRYnqT3dM=;
        b=b8JDRyxPfYIS94h5eKAUmST6qfeoNBdTOsEvkIF90b0EHeHUNijsyQRHF00HsBu6v8
         JB39onyrAynizIVOnjg1sj0lMG3ylgysZHyj0k1x/7kIjSSBrlWtTqBaXsUq89GsX9JT
         DYTvrNmdUbm6eR9YAOrEwduyl5zb1wpRu+nkTvZd7Iyv3SdAdSCYHlw/DQJkLKARShGw
         /b+A3tiX9/o01xasOP7JVSDRSZmewl65ZPbRMk4HuWc5lyvebUM97qQr6ABrSBVm834x
         OD6RdJjarresM2cN9DkSstrgBlpLxEw+fzzNs99P2ED3xye4u7D8tRDsXDzrcXzdOzWD
         YTuQ==
X-Gm-Message-State: AOAM532xAMBcDvZ0HqNSDk7nTeF9YAOEcajKJuRewNEMtdOJVYz+HM15
	tpIvvREgTA3H2UzmjRI0o0Cm5WPJZf/u
X-Google-Smtp-Source: ABdhPJwnL3ty0rYB/mTS6ohebP4mDHDFhYi+THLa6qb0jeK6tO/c5ZPJ75AyiazmV9ig+lSOTxgPMQ+iQI11
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:8ce7:5b2:9787:1a0b])
 (user=tzungbi job=sendgmr) by 2002:a25:1402:0:b0:61a:9815:b84b with SMTP id
 2-20020a251402000000b0061a9815b84bmr1121925ybu.573.1644998607466; Wed, 16 Feb
 2022 00:03:27 -0800 (PST)
Date: Wed, 16 Feb 2022 16:03:03 +0800
In-Reply-To: <20220216080306.3864163-1-tzungbi@google.com>
Message-Id: <20220216080306.3864163-3-tzungbi@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220216080306.3864163-1-tzungbi@google.com>
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
Subject: [PATCH v5 2/5] platform/chrome: cros_ec: remove unused variable `was_wake_device`
From: Tzung-Bi Shih <tzungbi@google.com>
To: bleung@chromium.org, groeck@chromium.org
Cc: chrome-platform@lists.linux.dev, pmalani@chromium.org, tzungbi@google.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Prashant Malani <pmalani@chromium.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
No changes from v3 and v4.

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
index ff2a24b0c611..25cd8df6e7b0 100644
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
2.35.1.265.g69c8d7142f-goog

