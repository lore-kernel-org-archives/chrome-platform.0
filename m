Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9C823AC
	for <chrome-platform@lists.linux.dev>; Wed, 16 Feb 2022 08:03:41 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id z15-20020a25bb0f000000b00613388c7d99so2726469ybg.8
        for <chrome-platform@lists.linux.dev>; Wed, 16 Feb 2022 00:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=cBsOjcPnmLH7/AqklcuehpI9b0p1xbakmUIE5IP9keU=;
        b=IOikt31P2zEAtluISzAwx5beeMxSU+NsFh4G/wCC2BPZHmo5C2myILKNgUnhx7jIsr
         5u1gca1R0sgoUJXWzmNxx+IPiBlv93cY3G2d66YrxGpcD9nUwzXrBzESt8m3gnuPVXX9
         Z2f4kXgs7fxoOwbtzUyUbhBMrSiwMuGA5+DN52h/GSaGYQU4LEK9G7b7vRskRbg6zNiQ
         4ntsP7jnUj2Pb/JpFYBObmW8NZdFH7XwtW+/mdOH8cz9GDqHH9+lHuNeqJx450ymbW1F
         JEHs9Q0IJmyclfGlwjN8NQUUPF0l48kvAfWwRBA80U8jmjZoHMadvGHdk7mDydWCUGm3
         5FWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=cBsOjcPnmLH7/AqklcuehpI9b0p1xbakmUIE5IP9keU=;
        b=L2x5mZql/JwozpyrI57n1r9ecrtnddQuLddxM+gJpqaEgtJxiFuUkSoi+6X1Nq9vrP
         h2tXTxPSgoOpkqZum7Rsbrw3FaTLmiGjMjL33OcrnQTiMsZ1i5pXCDLrog4ll3XC7RLC
         eCIFvIA3eXviQP97sVq5QzYNguCeU6sLJ4YUIMNoYl4W7la0sCwyncx4ShKsDQGaKYbB
         aBKhPwy4W7h17UpUuO5L6Xn4YyEAKIddZWYb2ZHcAVXvJTWOR/LOrgNWONjtbCLea6+l
         Se1VVm9eTnW0bE0I+RcY7m5u3vqgIRa8gHg4LbEcFWxx9kJY2D9zGKlnYPFTyriHSx+J
         L/Jg==
X-Gm-Message-State: AOAM533r93RMFA6V0Ktue6+CG1CAg5A41WTVn6tm6sMQ99Wp+XQaoUjn
	UiTE690Olq/ETYWhgEU+GosjK+xwpVLn
X-Google-Smtp-Source: ABdhPJwIKjl5qpVIgCVJ6WFHe5Q6tyytpUjKF+fO3a8yu4ekaUbz6G5cuNxkcJXUaxbtAWEwmzQeSHmbSR5p
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:8ce7:5b2:9787:1a0b])
 (user=tzungbi job=sendgmr) by 2002:a0d:ef82:0:b0:2ca:287c:6c5b with SMTP id
 y124-20020a0def82000000b002ca287c6c5bmr1424157ywe.256.1644998620185; Wed, 16
 Feb 2022 00:03:40 -0800 (PST)
Date: Wed, 16 Feb 2022 16:03:06 +0800
In-Reply-To: <20220216080306.3864163-1-tzungbi@google.com>
Message-Id: <20220216080306.3864163-6-tzungbi@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220216080306.3864163-1-tzungbi@google.com>
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
Subject: [PATCH v5 5/5] platform/chrome: cros_ec: append newline to all logs
From: Tzung-Bi Shih <tzungbi@google.com>
To: bleung@chromium.org, groeck@chromium.org
Cc: chrome-platform@lists.linux.dev, pmalani@chromium.org, tzungbi@google.com, 
	linux-kernel@vger.kernel.org, Guenter Roeck <groeck@google.com>
Content-Type: text/plain; charset="UTF-8"

To be consistent, append newline ("\n") to all logs.

Reviewed-by: Guenter Roeck <groeck@google.com>
Reviewed-by: Prashant Malani <pmalani@chromium.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
No changes from v4.

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
index 1e1a24a80d9f..1395c764d938 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -215,7 +215,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 						IRQF_TRIGGER_LOW | IRQF_ONESHOT,
 						"chromeos-ec", ec_dev);
 		if (err) {
-			dev_err(dev, "Failed to request IRQ %d: %d",
+			dev_err(dev, "Failed to request IRQ %d: %d\n",
 				ec_dev->irq, err);
 			return err;
 		}
@@ -266,7 +266,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
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
2.35.1.265.g69c8d7142f-goog

