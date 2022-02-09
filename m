Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4932C80
	for <chrome-platform@lists.linux.dev>; Wed,  9 Feb 2022 04:51:06 +0000 (UTC)
Received: by mail-pj1-f73.google.com with SMTP id bj11-20020a17090b088b00b001b8ba3e7ce7so2994826pjb.2
        for <chrome-platform@lists.linux.dev>; Tue, 08 Feb 2022 20:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=w/FmSJt4q0EBOhTIs5yfalWe7onSq3OGyk5zwTrCxMM=;
        b=E5VSI6zb/Cx1lAfNoS+227jAzLKcmnPWMxyUTsNtqpX1UIXpb8Y+qijNHTfnWqwMCH
         JZmC+EhkQlisU2VimqaLKeXbGjFFC4k6X2q6M6lHSX/uhniZO9DM8Ced9Ax7Rh9GiXCL
         c7ZP57sbr+q5UuMn+BLQIgfMnxFVl7PJvH/RyrQPJ5o6SsLMy5ljclGU36UopQASAtVF
         fx3OlJO/GairO4s3ZSpAmYoq8UhStC2+EpDC285FodunvKz9j5wEeIEuidnYoKr+1KGE
         znMvu6holwajHZva3RsfaBK/0KKNjyvfeVMsjh/2m3YqLik7OHHYf2QCkdPkZtv9Oipy
         tfjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=w/FmSJt4q0EBOhTIs5yfalWe7onSq3OGyk5zwTrCxMM=;
        b=EGPpofeDxUb9dlzvxtQp+vRWM7u4SyU2VBDXmqo/X08p4TMBaj1WfOcCH2iL7V6qJ8
         SyUfcksF0CJyORo1euKZXBmc/EJIYY0WQ6BDTIja+bnLWjGiSSWC1aQ/rL0iSNpd1sD9
         ZXGcR4tnSwbomFFJD3q5zv/8N+XmYyM4BjDSuO1ThDLO7JpkmN1EV2/fAtXQGYdYF0lb
         x0cuLWLB5JwCovSi5VO9uMEascl8xGoX/4AOdLx43+LsBJjWdlKUKTuZFUj4RRDc2jzW
         qPCsfZtH2qV+pI4NTOdwsJSnD17ArVLofRRx2YS3EP7oC1SOz+pGO3mulhmCqF0S9g4j
         gCgA==
X-Gm-Message-State: AOAM533xGb+v+8UEy5eEX5o01pRDRJ5G056W+lQGk+TWAE1vGRLf31ZW
	ij8oD8ZLbg0UlNkr9p20Luzy1VIMhqAv
X-Google-Smtp-Source: ABdhPJx7RMkh8rtj5s/zxdPCY68SRTxtjuZoMZkiVHH5NL0si/DyWbWI6acc1OJ9J/edxMvxfzM50uKxMdqO
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:4b6f:f14d:be50:86a])
 (user=tzungbi job=sendgmr) by 2002:a17:902:f711:: with SMTP id
 h17mr776132plo.26.1644382265741; Tue, 08 Feb 2022 20:51:05 -0800 (PST)
Date: Wed,  9 Feb 2022 12:50:35 +0800
In-Reply-To: <20220209045035.380615-1-tzungbi@google.com>
Message-Id: <20220209045035.380615-7-tzungbi@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220209045035.380615-1-tzungbi@google.com>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
Subject: [PATCH v2 6/6] platform/chrome: cros_ec: append newline to all logs
From: Tzung-Bi Shih <tzungbi@google.com>
To: bleung@chromium.org, groeck@chromium.org
Cc: chrome-platform@lists.linux.dev, tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"

To be consistent, append newline ("\n") to all logs.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/platform/chrome/cros_ec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index 008dc2fc5066..426314e4b7f6 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -213,7 +213,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 						IRQF_TRIGGER_LOW | IRQF_ONESHOT,
 						"chromeos-ec", ec_dev);
 		if (err) {
-			dev_err(dev, "Failed to request IRQ %d: %d",
+			dev_err(dev, "Failed to request IRQ %d: %d\n",
 				ec_dev->irq, err);
 			return err;
 		}
@@ -264,7 +264,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 	 */
 	err = cros_ec_sleep_event(ec_dev, 0);
 	if (err < 0)
-		dev_dbg(ec_dev->dev, "Error %d clearing sleep event to ec",
+		dev_dbg(ec_dev->dev, "Error %d clearing sleep event to ec\n",
 			err);
 
 	if (ec_dev->mkbp_event_supported) {
@@ -337,7 +337,7 @@ int cros_ec_suspend(struct cros_ec_device *ec_dev)
 
 	ret = cros_ec_sleep_event(ec_dev, sleep_event);
 	if (ret < 0)
-		dev_dbg(ec_dev->dev, "Error %d sending suspend event to ec",
+		dev_dbg(ec_dev->dev, "Error %d sending suspend event to ec\n",
 			ret);
 
 	if (device_may_wakeup(dev))
@@ -382,7 +382,7 @@ int cros_ec_resume(struct cros_ec_device *ec_dev)
 
 	ret = cros_ec_sleep_event(ec_dev, sleep_event);
 	if (ret < 0)
-		dev_dbg(ec_dev->dev, "Error %d sending resume event to ec",
+		dev_dbg(ec_dev->dev, "Error %d sending resume event to ec\n",
 			ret);
 
 	if (ec_dev->wake_enabled)
-- 
2.35.0.263.gb82422642f-goog

