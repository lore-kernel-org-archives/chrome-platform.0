Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BEA2F21
	for <chrome-platform@lists.linux.dev>; Wed,  9 Feb 2022 04:50:46 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id b64-20020a256743000000b0061e169a5f19so2005640ybc.11
        for <chrome-platform@lists.linux.dev>; Tue, 08 Feb 2022 20:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=TGpw6JCsUI7vu1URJQ/M4DQvG2LRyayAZSrFB0JmYO4=;
        b=SzvTI08/YVzNPp2ar5Amf2aF9ZgwdEpnZQrfgczpI0RRlxmM4KXPbouwxO02NZ5t2u
         klTA0+ffQHl9PcyfFhS53pMKxbJBioyuJTs8Ujhy2HNSbNZJk2xaMucX+24hzHSDHJpJ
         NPLjb7ogM/Pn6P4K8u/fgl8szlAm1zBpBVmLBYYd60RqhjtGASk+FL04vWx+15s9AFE7
         StB5vWSWlbp6of1f41Gqe8sP11CPEaVY87Yh+d8fsuO7lzbyHuQpxrzECcgQPutWLXi0
         ygU2z37KwSQaDQGOAwgrbX2Ikt1l546kXqkE/nVg9lJWytIRRDtZiu3D1oi8cd+EoenI
         eB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=TGpw6JCsUI7vu1URJQ/M4DQvG2LRyayAZSrFB0JmYO4=;
        b=rmB5DHHiVnT3JOzJ2CFCjndYB03POc/fmunAv5nQN+rnfaejDaRZJ+CNRkE4JasriF
         sCDV53wjWo7QuHT4f15256wAL1WI54UWrWOIKUCkXGJvR9HnGGJI1bn9ADYPyafjTmjj
         sgAICojqF6MUFyFkhtm38nSVmY7axE6CAGHeFLUmjFVjWHeJoMz4NMu72CEiWaikMTYL
         AGO7B55q0sbnZ676DInaV8cTbvKmFiWgd29El62BsZEv5/o6Q916vHn9+7eLbNetPiNG
         OJ+Smttmu/VgOVZm7+x8wn2z6ayFPMUYkgeKtC/VWyLS7nuUDlOlPO1K53w5RMwBJba7
         CV0Q==
X-Gm-Message-State: AOAM532eEjo4cuOxjupwKxdkOo+9lID5P4+UFgLyNA3DCuykX7LaPyO2
	QKd4mWu1AP6wMR+RGRvVlm65iGeqtwrz
X-Google-Smtp-Source: ABdhPJzTAoODqzH9hCVzIOtQGHhxyKQqYRNWifDqN3g4kj1kVm25ERwdjC//JrOXy7m9NDxncasizPkdQM+A
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:4b6f:f14d:be50:86a])
 (user=tzungbi job=sendgmr) by 2002:a81:364f:: with SMTP id
 d76mr474530ywa.406.1644382245868; Tue, 08 Feb 2022 20:50:45 -0800 (PST)
Date: Wed,  9 Feb 2022 12:50:30 +0800
In-Reply-To: <20220209045035.380615-1-tzungbi@google.com>
Message-Id: <20220209045035.380615-2-tzungbi@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220209045035.380615-1-tzungbi@google.com>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
Subject: [PATCH v2 1/6] platform/chrome: cros_ec: fix error handling in cros_ec_register()
From: Tzung-Bi Shih <tzungbi@google.com>
To: bleung@chromium.org, groeck@chromium.org
Cc: chrome-platform@lists.linux.dev, tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"

Fix cros_ec_register() doesn't unregister platform devices if
blocking_notifier_chain_register() fails.

Also use the single exit path to handle the platform device
unregistration.

This fix depends on the fact that all the callers of cros_ec_register()
allocate zeroed memory.

Fixes: 42cd0ab476e2 ("platform/chrome: cros_ec: Query EC protocol version if EC transitions between RO/RW")
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/platform/chrome/cros_ec.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index fc5aa1525d13..7ce667ff08e0 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -245,18 +245,16 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 		if (IS_ERR(ec_dev->pd)) {
 			dev_err(ec_dev->dev,
 				"Failed to create CrOS PD platform device\n");
-			platform_device_unregister(ec_dev->ec);
-			return PTR_ERR(ec_dev->pd);
+			err = PTR_ERR(ec_dev->pd);
+			goto exit;
 		}
 	}
 
 	if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
 		err = devm_of_platform_populate(dev);
 		if (err) {
-			platform_device_unregister(ec_dev->pd);
-			platform_device_unregister(ec_dev->ec);
 			dev_err(dev, "Failed to register sub-devices\n");
-			return err;
+			goto exit;
 		}
 	}
 
@@ -278,7 +276,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 		err = blocking_notifier_chain_register(&ec_dev->event_notifier,
 						      &ec_dev->notifier_ready);
 		if (err)
-			return err;
+			goto exit;
 	}
 
 	dev_info(dev, "Chrome EC device registered\n");
@@ -291,6 +289,12 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 		cros_ec_irq_thread(0, ec_dev);
 
 	return 0;
+exit:
+	if (!IS_ERR_OR_NULL(ec_dev->pd))
+		platform_device_unregister(ec_dev->pd);
+	if (!IS_ERR_OR_NULL(ec_dev->ec))
+		platform_device_unregister(ec_dev->ec);
+	return err;
 }
 EXPORT_SYMBOL(cros_ec_register);
 
-- 
2.35.0.263.gb82422642f-goog

