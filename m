Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195AD6D22
	for <chrome-platform@lists.linux.dev>; Wed,  2 Aug 2023 17:58:58 +0000 (UTC)
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-5635233876bso20552a12.0
        for <chrome-platform@lists.linux.dev>; Wed, 02 Aug 2023 10:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690999138; x=1691603938;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J1wRxvwIBG6whrhBQqY3j42uJNiPMlVZKztMAOT2qV0=;
        b=QGUrIT89MvYS3t/BjCmVvSURD+MbqebJGtc3cCwz8zJN5xreAULo9hPxkBuDJTlREo
         Iv1et5XsMrpwC92xhQTbDswjowkDR822RrJZWcJaEMTKj+YSgL+gT5PWAtkeW70uIZM9
         NvmTY5E7sAEr94iOp23I87Fpb60kpow/fwNdC1beZrLqSfH4pBdvAETp/2InSsUZRcaV
         nyFuua1NT/VJ205mGgHCPrQD/vmuJkTHI9h7wvFAWyTl24eNyr98twK8K2ywXjMEKyze
         Ra07W7/nade914hbMyfmF9EhZT5ijKu0V06TMhKSj++vO1UjREsYg7Wm6PMT+8oWpVs0
         v97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690999138; x=1691603938;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J1wRxvwIBG6whrhBQqY3j42uJNiPMlVZKztMAOT2qV0=;
        b=YYh9nKF1NQB8CTAz5xnVIRa+igAILZkXJYqyAwfeZ6iW3+fNzeYFl5cJudq3zADT6F
         sUo7HzUnW/q6Fvm/HBGUU1ofj1UmE/sV+9F+wvuI6Y2RibCOVyhjVyyIN2FVZ3E2Di+r
         MDdUvX4gbOEYlgtvopfKWBtDsXZ06vN9XrArW7DAr725UiBlgWyBPSbFvoxRtPako2NL
         BwvPAtEVIJ8X4L6aWlnWCVP85bCodBlE7lFXBYN9CXOXFnrmAfqQOlK/fTcNFzFroG3E
         Dzy1+RwHm28+9PxRzNFCKxGX6MIdHvF1T3llkfnccS6OpjrpV3Fga3zh/vVb7p1yikcn
         hE9w==
X-Gm-Message-State: ABy/qLYPmq0P/QiRAkf8e0e3mBIxps6BWgzT3QL7QDjhlCoOuAFfSu6Z
	NYGxKuCHhMT1MQ7k+f2nZKZcEi5r6zJOcBY=
X-Google-Smtp-Source: APBJJlGBxnUJKAwPN2SkouJDIO/T7ZOjzXPDlTrpZnzACU8F/JTOH7Q9WY1CCvSB96tNZldsP+lPhdnEANtOQbk=
X-Received: from robbarnes3.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:6451])
 (user=robbarnes job=sendgmr) by 2002:a63:745e:0:b0:563:dd4c:7779 with SMTP id
 e30-20020a63745e000000b00563dd4c7779mr104804pgn.12.1690999138281; Wed, 02 Aug
 2023 10:58:58 -0700 (PDT)
Date: Wed,  2 Aug 2023 17:58:48 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
Message-ID: <20230802175847.1.Ie9fc53b6a1f4c6661c5376286a50e0cf51b3e961@changeid>
Subject: [PATCH] platform/chrome: cros_ec_lpc: Remove EC panic shutdown timeout
From: Rob Barnes <robbarnes@google.com>
To: bleung@chromium.org, groeck@chromium.org, tzungbi@kernel.org, 
	dtor@chromium.org
Cc: Rob Barnes <robbarnes@google.com>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Remove the 1 second timeout applied to hw_protection_shutdown after an
EC panic. On some platforms this 1 second timeout is insufficient to
allow the filesystem to fully sync. Independently the EC will force a
full system reset after a short period. So this backup timeout is
unnecessary.

Signed-off-by: Rob Barnes <robbarnes@google.com>
---

 drivers/platform/chrome/cros_ec_lpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 500a61b093e47..356572452898d 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -327,8 +327,8 @@ static void cros_ec_lpc_acpi_notify(acpi_handle device, u32 value, void *data)
 		dev_emerg(ec_dev->dev, "CrOS EC Panic Reported. Shutdown is imminent!");
 		blocking_notifier_call_chain(&ec_dev->panic_notifier, 0, ec_dev);
 		kobject_uevent_env(&ec_dev->dev->kobj, KOBJ_CHANGE, (char **)env);
-		/* Begin orderly shutdown. Force shutdown after 1 second. */
-		hw_protection_shutdown("CrOS EC Panic", 1000);
+		/* Begin orderly shutdown. EC will force reset after a short period. */
+		hw_protection_shutdown("CrOS EC Panic", -1);
 		/* Do not query for other events after a panic is reported */
 		return;
 	}
-- 
2.41.0.585.gd2178a4bd4-goog

