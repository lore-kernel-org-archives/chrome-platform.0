Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819FC23AC
	for <chrome-platform@lists.linux.dev>; Wed, 16 Feb 2022 08:03:32 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id b12-20020a056902030c00b0061d720e274aso2636676ybs.20
        for <chrome-platform@lists.linux.dev>; Wed, 16 Feb 2022 00:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=SE1MVdE6VYYgYy0YdvS/4bDSsAOzBU2OrOAH/ZUOnFg=;
        b=oeGfckUJe6Fgl8bC2ziCgYFPG71l9XmLh+g9L4Yq4ppJfmoLfhqaRT7PhyCF92nQa8
         4j96bF3sQyGxNkZO/f1cnd1NQ909E/VE6a9nhLAA77BAfpEnT37UN2A9eC49FdNvXi6R
         cPuzJXe8hRvI79/fT5VfcPQInUsduFGfWbrkcYbuDfDdbB6CVUtn9XdHp8qzDc6X7oVG
         WtOts4TH2CYXrGzhymjUWttuElJqDwNCNmUf3GiuoB/I3rrg3YaZncqrSi6s6m5EixfI
         9j2uLGPci4eqhqDXA+YsoAXY9Wh3tZRmCib2wcZRL+Et7EiEZ2SGmN7Wsl77xLlbx0yT
         7jfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=SE1MVdE6VYYgYy0YdvS/4bDSsAOzBU2OrOAH/ZUOnFg=;
        b=hIx+ohMuHS8GZm9zZBhM2I/5J4fmxF+eTW/R+RzKyDP2XI4+B9sKCvlYziS/dnXhfE
         ET5siyrQFKvipVm2y8kFtdfiHvNnmhMGKY3hJEEZfimo+UBBaUgZYt+f9Z4pBaaRKxmw
         VaZMKWkfSB/rEc6YzZNez4Yg/nTgd7osBKFI0OGFLINwOpK4hvfmUkTjz6a6iQ4/z6gJ
         Jqd8CkSbSDl0SFGBs5QvmcPNE2erZLAc1asLHExeouDEExMsNKFDOYH/iK6Q00C2vPfb
         zjXHjli1Y/WENAk3JtomQSznEY9ao+RXO3BpQsWx0MFvSvVMF6W3GG4ZygF+sgG4noCk
         9vAg==
X-Gm-Message-State: AOAM532vWM4jLfo6+tUAGN4pfgpW2c/vjEUe++2i86EcQpL0ZxUC+/WR
	/fTWfFe3e/Q0ibkhiNs2L03Bb9juJXFz
X-Google-Smtp-Source: ABdhPJxMKIQf7axeUM4rmevbTIpLdf4pXF/mgLIQe7ZVC5J4o0olbRMFcXkad1Mnde1GqBRBGMAZayKoyZu7
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:8ce7:5b2:9787:1a0b])
 (user=tzungbi job=sendgmr) by 2002:a81:7707:0:b0:2d0:dc96:5729 with SMTP id
 s7-20020a817707000000b002d0dc965729mr1398343ywc.37.1644998611613; Wed, 16 Feb
 2022 00:03:31 -0800 (PST)
Date: Wed, 16 Feb 2022 16:03:04 +0800
In-Reply-To: <20220216080306.3864163-1-tzungbi@google.com>
Message-Id: <20220216080306.3864163-4-tzungbi@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220216080306.3864163-1-tzungbi@google.com>
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
Subject: [PATCH v5 3/5] platform/chrome: cros_ec: determine `wake_enabled` in cros_ec_suspend()
From: Tzung-Bi Shih <tzungbi@google.com>
To: bleung@chromium.org, groeck@chromium.org
Cc: chrome-platform@lists.linux.dev, pmalani@chromium.org, tzungbi@google.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

`wake_enabled` indicates cros_ec_resume() needs to call
disable_irq_wake() to undo enable_irq_wake() in cros_ec_suspend().

Determine `wake_enabled` in cros_ec_suspend() instead of
reset-after-used in cros_ec_resume().

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
Changes from v4:
(https://patchwork.kernel.org/project/chrome-platform/patch/20220216043639.3839185-4-tzungbi@google.com/)
- Undo changes from v3; rollback to v2.

Changes from v3:
(https://patchwork.kernel.org/project/chrome-platform/patch/20220209095703.517608-4-tzungbi@google.com/)
- Change the patch title.
- Simplify by initializing wake_enabled in cros_ec_register().

No changes from v2.

Changes from v1:
(https://lore.kernel.org/lkml/20220125101527.1812887-1-tzungbi@google.com/T/#u)
- Use imperative mood in commit message.

 drivers/platform/chrome/cros_ec.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index 25cd8df6e7b0..a013fbceeb03 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -342,6 +342,8 @@ int cros_ec_suspend(struct cros_ec_device *ec_dev)
 
 	if (device_may_wakeup(dev))
 		ec_dev->wake_enabled = !enable_irq_wake(ec_dev->irq);
+	else
+		ec_dev->wake_enabled = false;
 
 	disable_irq(ec_dev->irq);
 	ec_dev->suspended = true;
@@ -383,10 +385,9 @@ int cros_ec_resume(struct cros_ec_device *ec_dev)
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
2.35.1.265.g69c8d7142f-goog

