Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382601B69
	for <chrome-platform@lists.linux.dev>; Wed, 16 Feb 2022 04:37:12 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id c10-20020a251c0a000000b0062272fc32bfso1821257ybc.17
        for <chrome-platform@lists.linux.dev>; Tue, 15 Feb 2022 20:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=ZVCaTafRnnf5d3inHCDQdPKKWocYJyu5eiZME/8lYHM=;
        b=Lp0pe85DVhHiZL5qfP+SkXpvO95oZbjOtle8vsjMApUQZu9ZrMDoRO2I1jat8A3GSt
         JSgLehb4yIHAaOsjvDi/3eTh10v1ZIPQf3VcR/ny+oli7hkGoio2fvuYcvF1YSTUzv/X
         PWccAqwLhuZ2HAoGJshdp1qFnzAoIHBAaK46WlfCmKj/QlbjIqR6zN/FqaXLuR4eYDKM
         rUcfNpxKQVvUW0bzhxvUQFN7gmk40k1O8ELDrbI7NmnfWWbB4GTGSWfJgC28KYyEBti8
         aujsN3ee+Cq/E4h6enmRBnyJqaXFH1gukgjCDLDb14XslPquNSHnKEalKMkIEuBW5WgM
         PqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ZVCaTafRnnf5d3inHCDQdPKKWocYJyu5eiZME/8lYHM=;
        b=LqfS2KnbUTOEEns39xU9U36mh781GP8XUbUxDGTW0oExbBzbjERFHDssMinU5VIIDo
         RFSoLRFUR+oM/S0ICFEPFTnv143yJx4/882MRCW2DaQkpxhve0mzJqyQEzdYaeN64/el
         MHG5HSWWkREfgpnI8to1lL+gWkjSbg0LAxOqpUMzjhBygMtabwf3ZhnpwoiPOsd5UPBY
         MHidPNK7k3Q8adgRNbnHCwGii4ahD1YTDGkPUg43k2ev2r2UmHonm01xxn0xRvBvXTli
         U3jcu9HjcFPbbAZp3Tb6Gn4zG3nQ/UGfRY1uXG+prkzpIlvRJI3DyzcOoSFWjMz/QYzm
         3P3A==
X-Gm-Message-State: AOAM531KIRbvdzcqSzNah2+4U920DBQ+jopZ4zadbmrpCGDYrIje9Nb4
	0KYXIjDh9NdeJ0V9OFBfH4hrSJURM2Pb
X-Google-Smtp-Source: ABdhPJxkeYjK1cD1AfT1ZUclFMK0x5SOz6XYbqagS0Uf3dXTfmZJWGMDkeXbVnqZ4XYm/AJO4n05WNGK12zi
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:8ce7:5b2:9787:1a0b])
 (user=tzungbi job=sendgmr) by 2002:a25:20c5:0:b0:61d:eeef:cc53 with SMTP id
 g188-20020a2520c5000000b0061deeefcc53mr751041ybg.150.1644986231395; Tue, 15
 Feb 2022 20:37:11 -0800 (PST)
Date: Wed, 16 Feb 2022 12:36:39 +0800
In-Reply-To: <20220216043639.3839185-1-tzungbi@google.com>
Message-Id: <20220216043639.3839185-6-tzungbi@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220216043639.3839185-1-tzungbi@google.com>
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
Subject: [PATCH v4 5/5] platform/chrome: cros_ec: append newline to all logs
From: Tzung-Bi Shih <tzungbi@google.com>
To: bleung@chromium.org, groeck@chromium.org
Cc: chrome-platform@lists.linux.dev, tzungbi@google.com, pmalani@chromium.org, 
	linux-kernel@vger.kernel.org, Guenter Roeck <groeck@google.com>
Content-Type: text/plain; charset="UTF-8"

To be consistent, append newline ("\n") to all logs.

Reviewed-by: Guenter Roeck <groeck@google.com>
Reviewed-by: Prashant Malani <pmalani@chromium.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
Changes from v3:
(https://patchwork.kernel.org/project/chrome-platform/patch/20220209095703.517608-7-tzungbi@google.com/)
- Add R-b tags.

No changes from v2.

Changes from v1:
(https://lore.kernel.org/lkml/20220125101527.1812887-1-tzungbi@google.com/T/#u)
- Use imperative mood in commit message.

 drivers/platform/chrome/cros_ec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index a3921fe5813a..a45bbc589928 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -216,7 +216,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 						IRQF_TRIGGER_LOW | IRQF_ONESHOT,
 						"chromeos-ec", ec_dev);
 		if (err) {
-			dev_err(dev, "Failed to request IRQ %d: %d",
+			dev_err(dev, "Failed to request IRQ %d: %d\n",
 				ec_dev->irq, err);
 			return err;
 		}
@@ -267,7 +267,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 	 */
 	err = cros_ec_sleep_event(ec_dev, 0);
 	if (err < 0)
-		dev_dbg(ec_dev->dev, "Error %d clearing sleep event to ec",
+		dev_dbg(ec_dev->dev, "Error %d clearing sleep event to ec\n",
 			err);
 
 	if (ec_dev->mkbp_event_supported) {
@@ -338,7 +338,7 @@ int cros_ec_suspend(struct cros_ec_device *ec_dev)
 
 	ret = cros_ec_sleep_event(ec_dev, sleep_event);
 	if (ret < 0)
-		dev_dbg(ec_dev->dev, "Error %d sending suspend event to ec",
+		dev_dbg(ec_dev->dev, "Error %d sending suspend event to ec\n",
 			ret);
 
 	if (device_may_wakeup(dev))
@@ -381,7 +381,7 @@ int cros_ec_resume(struct cros_ec_device *ec_dev)
 
 	ret = cros_ec_sleep_event(ec_dev, sleep_event);
 	if (ret < 0)
-		dev_dbg(ec_dev->dev, "Error %d sending resume event to ec",
+		dev_dbg(ec_dev->dev, "Error %d sending resume event to ec\n",
 			ret);
 
 	if (ec_dev->wake_enabled)
-- 
2.35.1.265.g69c8d7142f-goog

