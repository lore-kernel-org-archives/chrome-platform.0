Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB5E1AA65
	for <chrome-platform@lists.linux.dev>; Wed, 26 Jul 2023 18:17:46 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-d20d99c03fbso43971276.3
        for <chrome-platform@lists.linux.dev>; Wed, 26 Jul 2023 11:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690395466; x=1691000266;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6hpPFf3+4VDGkjUYreTZKwGSOm+oraygLQyLjZ9weYQ=;
        b=hjn8mdrtNt9Ay3MT8vju6yt1vWWaegDo8jLTy5DfycKo2rzUVA/XHPkvSjJFTg6z/9
         ZO/2sJVzjGD4YwuFUuL3uUYLNuY9h3lzSYcAcemBYK9pmFUsMo3feU1lhphgzA6buHTf
         /s/30xXM6avFdrT4XdzovhgQUc7UahQHgtETcqIIdTBNvAeHHjh2pXsPBmfO68uSqoDq
         HYyh9ejstmtWTcxPccAyM2NyC/kNm8WrPf5pel+MpbgYQjv71M0+YuzlmwT/hJv1bvpS
         YdsAbPhUysp7Bs1c2M29rTcvR22VVWQtSiw/rvDRU53Zj980a1n0qBGDtvc8z3UBr+kV
         Xokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690395466; x=1691000266;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6hpPFf3+4VDGkjUYreTZKwGSOm+oraygLQyLjZ9weYQ=;
        b=edigE4O6ie2nBhARJWpSkqyZrih2y2XCirfRfXHYuRStK8FU6wU77W8BHPqk2seO3g
         AYxb6pWDTREAa48mjofD1oIQqQNPQ3C1QiIEV2z5K7RGkfDcC/oDSFTHILAeJXCHpp/N
         K8WCjSCNXKBljNUsFJ487bUHNvVPGgmUzwW01zzNpTwI1OKxk3Sm+xDHVYKIMz2G9qDG
         yipxWFhyZd2gvJDrfcc4cpl9JTrIB4nbv9ORxV4xUDHcHwSkTiTnOvbN0gZqBKoryZOF
         yXpCSPq2pv2Y68gsP/ryAC4P0EGfm6fp26nJdcIXO+qF/i6vGdGBBYjeWX0pDiQ8kzQK
         0hxA==
X-Gm-Message-State: ABy/qLZXDt88VIdOHCs5hfAKmLqhtJ5Eaen/iincwLULM2B2oGlLdE2Q
	B1n7oCRUgqQTc8I2EBZZwk9sBw43NlNyCc8=
X-Google-Smtp-Source: APBJJlHbz0sUA7ksJ0wtqMgCDZ3UsGIdiM6y/iN9eyg5I8CgKaXTzEA5PrDCe21WfEENMYVlo27ltf1yGRlemxo=
X-Received: from robbarnes3.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:6451])
 (user=robbarnes job=sendgmr) by 2002:a25:3212:0:b0:cef:5453:b6da with SMTP id
 y18-20020a253212000000b00cef5453b6damr16367yby.7.1690395465748; Wed, 26 Jul
 2023 11:17:45 -0700 (PDT)
Date: Wed, 26 Jul 2023 18:17:39 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Message-ID: <20230726181738.1.Ic6b8e25120b2aec95e3d0f4ac92c2a35fc7a40e8@changeid>
Subject: [PATCH] platform/chrome: cros_ec_lpc: Sync filesystem on EC panic
From: Rob Barnes <robbarnes@google.com>
To: bleung@chromium.org, groeck@chromium.org, tzungbi@kernel.org, 
	dtor@chromium.org
Cc: Rob Barnes <robbarnes@google.com>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Perform a filesystem sync when an EC panic is reported. The
sync is performed twice in case some inodes or pages are
temporarily locked. Testing showed syncing twice significantly
improved reliability.

hw_protection_shutdown is replaced for a couple reasons. It is
unnecessary because the EC will force reset either way.
hw_protection_shutdown does not reliably sync filesystem
before shutting down.

Signed-off-by: Rob Barnes <robbarnes@google.com>
---

 drivers/platform/chrome/cros_ec_lpc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 500a61b093e47..44b7637e745c2 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -327,8 +327,10 @@ static void cros_ec_lpc_acpi_notify(acpi_handle device, u32 value, void *data)
 		dev_emerg(ec_dev->dev, "CrOS EC Panic Reported. Shutdown is imminent!");
 		blocking_notifier_call_chain(&ec_dev->panic_notifier, 0, ec_dev);
 		kobject_uevent_env(&ec_dev->dev->kobj, KOBJ_CHANGE, (char **)env);
-		/* Begin orderly shutdown. Force shutdown after 1 second. */
-		hw_protection_shutdown("CrOS EC Panic", 1000);
+		/* Sync filesystem before EC resets */
+		ksys_sync_helper();
+		/* Sync again just in case some inodes were temporarily locked */
+		ksys_sync_helper();
 		/* Do not query for other events after a panic is reported */
 		return;
 	}
-- 
2.41.0.487.g6d72f3e995-goog

