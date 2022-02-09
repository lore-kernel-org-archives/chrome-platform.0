Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136172C80
	for <chrome-platform@lists.linux.dev>; Wed,  9 Feb 2022 09:57:24 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 127-20020a250f85000000b00611ab6484abso3635216ybp.23
        for <chrome-platform@lists.linux.dev>; Wed, 09 Feb 2022 01:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=HiqGi6T/H+jNXGMi9MYVABP3BOad9wxsk0Vnb/KPmnM=;
        b=klnw3w0Ujq5BD++WXJ29PmRLm20UzxVowqpLz+eu2EMFjTrwSaeW9UywFt8bg9AbwO
         Oi7Acuy0v7rf1bO31ctAIjo+4IZPN/0cH16pFgVBw74h2YiTRbn9flZ6L2k3a+0Dt6hb
         uTAEjzjTdMsCkUduERjTk9qNycl7pRLph5Gyi56xNBSSK3rj5lf5xzmrmAhW88h9rVnY
         y85q8OEUMabFAcqoYduQ69MEcaIHTX6AQug3iY67grhND49FBuF7AiK6SYEtv1AKhB4s
         p77vOj27F2lXaSKqW8+JMg5dPNPUafCOW4rqziVs2LUpgrgAqibjVN2pzFBLi10sdi6K
         qjsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=HiqGi6T/H+jNXGMi9MYVABP3BOad9wxsk0Vnb/KPmnM=;
        b=I2yJhXFrDgRKXpKerGdsLT8ScVoG3Toq7G0IMF0nKiyaNNvXXXUjoxnYl4qhWmhLlq
         pJXoc7afOM0XPsZtF3CcWLKHD3Jr7LH9FcgSy4i7iN6IqwHiwx4TrjUDk90eaKRiCqg3
         bn8+pLROsz2kb382VOx4pbx54gwkAQyzlW5vH/11cpn8dRBrBrUUEwC0mpGbccN6PEAH
         /ZrzG+YkuRGVLI4mhFC5TXTW7DRI9m2+y9o/PF+ObUYp1AeC5l7GmHIa53eSCvn/rSJs
         fL97LpKBpiX1lgli6rbyPErMdHP3GrqjOn+3Yba5t+DmW/8VwU7LpNFBIvBs+T0Athnw
         Z9FA==
X-Gm-Message-State: AOAM530fYrpZHXienjQsse7taJp4BdYxDVKqD0rcgo03pXLCZYU4MrrU
	fj+dcgRJPUNAoYM1wSUSvXs6QP0OaZS8
X-Google-Smtp-Source: ABdhPJyw9k6hMcAOYHhZe6hjqAdQ4dbDGZ18OMjDJ7a/6IDYTGxRSSXy0ez8OlFKi4/1sqGYx/upYrnVp3n3
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:ee29:8b32:75bc:44ec])
 (user=tzungbi job=sendgmr) by 2002:a81:af61:: with SMTP id
 x33mr1314943ywj.259.1644400643102; Wed, 09 Feb 2022 01:57:23 -0800 (PST)
Date: Wed,  9 Feb 2022 17:57:00 +0800
In-Reply-To: <20220209095703.517608-1-tzungbi@google.com>
Message-Id: <20220209095703.517608-4-tzungbi@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220209095703.517608-1-tzungbi@google.com>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
Subject: [PATCH v3 3/6] platform/chrome: cros_ec: determine `wake_enabled` in cros_ec_suspend()
From: Tzung-Bi Shih <tzungbi@google.com>
To: bleung@chromium.org, groeck@chromium.org
Cc: chrome-platform@lists.linux.dev, tzungbi@google.com, pmalani@chromium.org
Content-Type: text/plain; charset="UTF-8"

`wake_enabled` indicates cros_ec_resume() needs to call
disable_irq_wake() to undo enable_irq_wake() in cros_ec_suspend().

Determine `wake_enabled` in cros_ec_suspend() instead of
reset-after-used in cros_ec_resume().

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
No changes from v2.

Changes from v1:
(https://lore.kernel.org/lkml/20220125101527.1812887-1-tzungbi@google.com/T/#u)
- Use imperative mood in commit message.

 drivers/platform/chrome/cros_ec.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index c9c90f98baf4..07dd5cc35d7c 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -341,6 +341,8 @@ int cros_ec_suspend(struct cros_ec_device *ec_dev)
 
 	if (device_may_wakeup(dev))
 		ec_dev->wake_enabled = !enable_irq_wake(ec_dev->irq);
+	else
+		ec_dev->wake_enabled = false;
 
 	disable_irq(ec_dev->irq);
 	ec_dev->suspended = true;
@@ -382,10 +384,9 @@ int cros_ec_resume(struct cros_ec_device *ec_dev)
 		dev_dbg(ec_dev->dev, "Error %d sending resume event to ec",
 			ret);
 
-	if (ec_dev->wake_enabled) {
+	if (ec_dev->wake_enabled)
 		disable_irq_wake(ec_dev->irq);
-		ec_dev->wake_enabled = 0;
-	}
+
 	/*
 	 * Let the mfd devices know about events that occur during
 	 * suspend. This way the clients know what to do with them.
-- 
2.35.0.263.gb82422642f-goog

