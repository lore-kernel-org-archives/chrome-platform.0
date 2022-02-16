Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1731B69
	for <chrome-platform@lists.linux.dev>; Wed, 16 Feb 2022 04:37:04 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id i205-20020a2522d6000000b00622c778ac7cso1927398ybi.3
        for <chrome-platform@lists.linux.dev>; Tue, 15 Feb 2022 20:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=bYXXjRPc3+amq4nUn2zKlGGGB3ySddzbVS7PLxHhbGI=;
        b=AnyhfMfehc17BivQ/iPlxJOqaloiNeAlCKUVWzYDr2j6PopYBv8Ng6e396M+41Lo5/
         ILN70TE/GTQs8eFLLcavMUNDqUGxPrHfzJ7YhTtbNYkMJ2eUH0Ae7YmulGlJXed4VqyF
         NVb5MISdL6pKgQvJlo81UCNr+3s3SYhuVpy/fMyq03OJp4kWieR/Kmh81YxFDIBi0UlN
         Hxcr2DDYcw4mbQia8Zofh0E1kzQmGU000vSekQM2eWUqdQX8oA1fHt4l32Gsv7yNduzr
         HkBmRDzMTk4XP1Qe/QaDdnDlYyQuWKhyTtMugsLmbAkXF9QgnvEtuAL+4uXLl89ZF3n3
         3cDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=bYXXjRPc3+amq4nUn2zKlGGGB3ySddzbVS7PLxHhbGI=;
        b=heiLkVfnmgZ2ODEgvBpeuFpiGoitMfTkldF+SoEvtpCDlWBd8KFMfslP9A55Cx13cQ
         hjZv3C3wLOCdegEg+KVlvq4pZqzDoB+NV0qH6W3lF1ghxg/64k3JMmhWnYbdyuBJiNsa
         fDyhT2yaB3xzaF47E5mST4Atvdiw8eBJ6d9fKCdrY4GKQ015EJPCm70XRV0IJTNlcCSi
         PNdB3N25nt4bkUuL3bSEI4w5x8nP2H6hDQnt/YcJxVjs82BbhURWjOZpYAh742Po5sDr
         ZCnEJBEUZEZU2Dles8k60fNjS5C5YTsRm2SM1O5cXx+agQrRqVbNjHEpOkz/1W4Hps1y
         HRuA==
X-Gm-Message-State: AOAM531DUa2uAXMwX39gMGYydSuvaj6YcSX5Jt7Pl+Y9JCTAQlBCZ5wn
	c0ndk41laUvB+/LNrxG7kJ7Zi7zG65pL
X-Google-Smtp-Source: ABdhPJw95YErySPO3wArh7ukWmaemcssepqzKqsZZ6nlYXHHAxFhSFXHWC8WbsD9bG5pE/NAuv1pbQV0/6MJ
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:8ce7:5b2:9787:1a0b])
 (user=tzungbi job=sendgmr) by 2002:a25:dfd0:0:b0:61e:1ddf:a07e with SMTP id
 w199-20020a25dfd0000000b0061e1ddfa07emr756178ybg.242.1644986223292; Tue, 15
 Feb 2022 20:37:03 -0800 (PST)
Date: Wed, 16 Feb 2022 12:36:37 +0800
In-Reply-To: <20220216043639.3839185-1-tzungbi@google.com>
Message-Id: <20220216043639.3839185-4-tzungbi@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220216043639.3839185-1-tzungbi@google.com>
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
Subject: [PATCH v4 3/5] platform/chrome: cros_ec: initialize `wake_enabled` in cros_ec_register()
From: Tzung-Bi Shih <tzungbi@google.com>
To: bleung@chromium.org, groeck@chromium.org
Cc: chrome-platform@lists.linux.dev, tzungbi@google.com, pmalani@chromium.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

`wake_enabled` indicates cros_ec_resume() needs to call
disable_irq_wake() to undo enable_irq_wake() in cros_ec_suspend().

Initialize `wake_enabled` in cros_ec_register() and determine the flag
in cros_ec_suspend() instead of reset-after-used in cros_ec_resume().

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
Changes from v3:
(https://patchwork.kernel.org/project/chrome-platform/patch/20220209095703.517608-4-tzungbi@google.com/)
- Change the patch title.
- Simplify by initializing wake_enabled in cros_ec_register().

No changes from v2.

Changes from v1:
(https://lore.kernel.org/lkml/20220125101527.1812887-1-tzungbi@google.com/T/#u)
- Use imperative mood in commit message.

 drivers/platform/chrome/cros_ec.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index 25cd8df6e7b0..b6604a9ab315 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -191,6 +191,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 	ec_dev->max_passthru = 0;
 	ec_dev->ec = NULL;
 	ec_dev->pd = NULL;
+	ec_dev->wake_enabled = false;
 
 	ec_dev->din = devm_kzalloc(dev, ec_dev->din_size, GFP_KERNEL);
 	if (!ec_dev->din)
@@ -383,10 +384,9 @@ int cros_ec_resume(struct cros_ec_device *ec_dev)
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

