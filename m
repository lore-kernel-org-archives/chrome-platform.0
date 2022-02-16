Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405731B69
	for <chrome-platform@lists.linux.dev>; Wed, 16 Feb 2022 04:37:00 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id b64-20020a256743000000b0061e169a5f19so1858477ybc.11
        for <chrome-platform@lists.linux.dev>; Tue, 15 Feb 2022 20:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=3psUtytUo6C/8Z0JrCprvFcq0BsJKPsjqLf/EYmVQiY=;
        b=R61yA4MuvnJnZisJJDkQCcKXaqxVdWCN7piOxfw0ApsloLfargZcrWV2ECFhBjxk5L
         FW/60zSo83AP+wRNDJX2qCoAJtiG8S9DheCMRJfV5gmAT9KJjstOQsoq4ZLCQdtJkEW3
         v6Y9Qutmhj1MnWkFdlZiyRPVD/QitEae4P5kqAT5+1ornj2CGcEaN0vPO6Vd80EjsGXC
         w/Vo2xHAV3FVNI8no0ogSAdiYl+38s3jflv7tasY9iVoyk4g2ztRcHV8pVS/QxnIu5Ky
         ceJBeKzQ0joXBKCkmrBZ+MZWJFGsvF1iOVWjhfFqFOZPK/SrIkKehcHel5rjRu4FcQap
         f4YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=3psUtytUo6C/8Z0JrCprvFcq0BsJKPsjqLf/EYmVQiY=;
        b=L03frraU0mq5KVsYzHuUx84JoWVtoM1mJOzZxecdW4hi/Y6FxGkl1iOQy79V2SLTX6
         JOmAq4MwZPeLity3n5STMxTBuY/pDMAV8UjYWfCTyPA3gksIpXxtBHlsRkvQFwhBlVKC
         zfA/eY9asXS1iBGwlxHLfgpzwgoinWSTN1XsBEVSQxZwbZeIzovw00k0ywlQvf0dWc9N
         vbZN78fcRE5i5IVvx1ndekdHfVjkgLPV25Ld6dlgm7affiDrdfUBsrDL9Q29FCdjQJCl
         Vp/wyqgJGqBN2B772ST1aoseSWOUuulyxib+onb6h6odxqoBavvsnZ2yqVb5LEt0UAvM
         Qy8Q==
X-Gm-Message-State: AOAM530DhGk366o29aFFkq8drEWKlTD4zExj43MhTEXb5l4AIfBcUjAR
	u+8/6zLYQ8kuzPWIS0HMzbWYXV12eG77
X-Google-Smtp-Source: ABdhPJyXmG4jjevHJQteNz+ljtX+93eYeDh1wIh5I4xce+CKQryCSEl6xChYGFlGey+mXlpDLbDktU12iaDR
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:8ce7:5b2:9787:1a0b])
 (user=tzungbi job=sendgmr) by 2002:a05:6902:110b:b0:61b:3576:95d1 with SMTP
 id o11-20020a056902110b00b0061b357695d1mr692277ybu.694.1644986219311; Tue, 15
 Feb 2022 20:36:59 -0800 (PST)
Date: Wed, 16 Feb 2022 12:36:36 +0800
In-Reply-To: <20220216043639.3839185-1-tzungbi@google.com>
Message-Id: <20220216043639.3839185-3-tzungbi@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220216043639.3839185-1-tzungbi@google.com>
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
Subject: [PATCH v4 2/5] platform/chrome: cros_ec: remove unused variable `was_wake_device`
From: Tzung-Bi Shih <tzungbi@google.com>
To: bleung@chromium.org, groeck@chromium.org
Cc: chrome-platform@lists.linux.dev, tzungbi@google.com, pmalani@chromium.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Prashant Malani <pmalani@chromium.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
No changes from v3.

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

