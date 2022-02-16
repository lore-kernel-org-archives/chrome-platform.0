Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EA61B69
	for <chrome-platform@lists.linux.dev>; Wed, 16 Feb 2022 08:03:24 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 128-20020a251286000000b0062234a636b0so2646431ybs.16
        for <chrome-platform@lists.linux.dev>; Wed, 16 Feb 2022 00:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=QwbIJmiyLmPJsz2898M/cKW1wrJYaBVyOrGjlzPUzPM=;
        b=QKqEMCGcSx2J3hQkVkRuvqwH+mW4FQKm+Y0JL6wkgcPIwTDVabKlRaTr/qFFPbehup
         Ca3LeujYdXNC2VCz41ANfKgS6oBnpOEROXSNTqS3bVDU1QaF348xv3+8kkZJJotyd2V8
         E3kIVWLjfK2kD8yg8EqixIMvSLRUg43RPHZX30hlfDiBKbzj3gsFQT9ZBZp3ZxjTqwQm
         CUyctzVDYKtaqZBbn4xM8Pa2U1hRSYnv6YWzffTI233Go/qCJNk8FgvJz1inn3Dp7YNC
         V/9snbueLCPDnKiuBQLE77JmbrEo2JTPgJQXJHXY4Q5zTBBvNB1+cQGjBquckXK404Fe
         uxGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=QwbIJmiyLmPJsz2898M/cKW1wrJYaBVyOrGjlzPUzPM=;
        b=Nvh6geRKxdT2GFxn2LI8N1B22f9p6H0fRntx8JMi4mW75A2xD+3/ZvJWBcYrYXly57
         A73t1rLoiBSXakoW/XPQ763smakFxgJXwGLSmW+BLaF93duJnw8C46GvI4OdWpvjayCS
         STQXWszP6yzBZG5hOpkjFjTuF8mCH8qBHCik9+99Y//nFsv1KXBu92u7X+QLidZM4Zqv
         9IiX3kL2pRyfUQQiftm+/V7n/KwwnN3Xf8DN6quxLQLHEjHo/nu32woXk267iyD0kE9r
         HvcomHBnFFR1Y78a4xbl2F72RgrYMDc4y0kXeYsH4EeQyxglqp3B3YdqOm8Y6oLjuauI
         f7Og==
X-Gm-Message-State: AOAM531oaBHRGvdzMXrjbYnvAcxd9lbNlb1l05mIzUZjvApMrHFwnG7Z
	MIpxRA03ueSgp4EqDYhQQbccFsW08W+e
X-Google-Smtp-Source: ABdhPJz+DlHTqa1DwdMIlck0KFDFQurTMv/sTMydH+BMvolVF8Nxsj4O7axBlt5IlDG82yTYuLXvIRhG4Ygt
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:8ce7:5b2:9787:1a0b])
 (user=tzungbi job=sendgmr) by 2002:a25:e802:0:b0:60e:94cb:dbc0 with SMTP id
 k2-20020a25e802000000b0060e94cbdbc0mr1056681ybd.509.1644998603121; Wed, 16
 Feb 2022 00:03:23 -0800 (PST)
Date: Wed, 16 Feb 2022 16:03:02 +0800
In-Reply-To: <20220216080306.3864163-1-tzungbi@google.com>
Message-Id: <20220216080306.3864163-2-tzungbi@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220216080306.3864163-1-tzungbi@google.com>
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
Subject: [PATCH v5 1/5] platform/chrome: cros_ec: fix error handling in cros_ec_register()
From: Tzung-Bi Shih <tzungbi@google.com>
To: bleung@chromium.org, groeck@chromium.org
Cc: chrome-platform@lists.linux.dev, pmalani@chromium.org, tzungbi@google.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Fix cros_ec_register() to unregister platform devices if
blocking_notifier_chain_register() fails.

Also use the single exit path to handle the platform device
unregistration.

Fixes: 42cd0ab476e2 ("platform/chrome: cros_ec: Query EC protocol version if EC transitions between RO/RW")
Reviewed-by: Prashant Malani <pmalani@chromium.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
Changes from v4:
(https://patchwork.kernel.org/project/chrome-platform/patch/20220216043639.3839185-2-tzungbi@google.com/)
- Add R-b tag.

Changes from v3:
(https://patchwork.kernel.org/project/chrome-platform/patch/20220209095703.517608-2-tzungbi@google.com/)
- Simplify by initializing the variables at the beginning.

Changes from v2:
(https://patchwork.kernel.org/project/chrome-platform/patch/20220209045035.380615-2-tzungbi@google.com/)
- Fix grammar error in commit message.
- Change the code that don't rely on zeroed memory.
- Remove unnecessary `if` checks before calling platform_device_unregister().

Changes from v1:
(https://lore.kernel.org/lkml/20220125101527.1812887-1-tzungbi@google.com/T/#u)
- Use imperative mood in commit message.
- Use IS_ERR_OR_NULL() in 1st patch.

 drivers/platform/chrome/cros_ec.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index fc5aa1525d13..ff2a24b0c611 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -189,6 +189,8 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 	ec_dev->max_request = sizeof(struct ec_params_hello);
 	ec_dev->max_response = sizeof(struct ec_response_get_protocol_info);
 	ec_dev->max_passthru = 0;
+	ec_dev->ec = NULL;
+	ec_dev->pd = NULL;
 
 	ec_dev->din = devm_kzalloc(dev, ec_dev->din_size, GFP_KERNEL);
 	if (!ec_dev->din)
@@ -245,18 +247,16 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
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
 
@@ -278,7 +278,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 		err = blocking_notifier_chain_register(&ec_dev->event_notifier,
 						      &ec_dev->notifier_ready);
 		if (err)
-			return err;
+			goto exit;
 	}
 
 	dev_info(dev, "Chrome EC device registered\n");
@@ -291,6 +291,10 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 		cros_ec_irq_thread(0, ec_dev);
 
 	return 0;
+exit:
+	platform_device_unregister(ec_dev->ec);
+	platform_device_unregister(ec_dev->pd);
+	return err;
 }
 EXPORT_SYMBOL(cros_ec_register);
 
-- 
2.35.1.265.g69c8d7142f-goog

