Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CACBE46
	for <chrome-platform@lists.linux.dev>; Mon, 17 Jul 2023 23:29:40 +0000 (UTC)
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-55ac8fcc887so2377419a12.0
        for <chrome-platform@lists.linux.dev>; Mon, 17 Jul 2023 16:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689636580; x=1692228580;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ird/WLydYaL1CZ8k5wr+kVwYTmymx69M3RobX2GjRRk=;
        b=hkifHyWTg3IccG5d/p0hfc+tMQUiLWzqHqVw7JWr85jdGXtWpvj7aATj6c/OzxTY1y
         2Iyf8y7BOcM914r8tnAJUC9c2l7r+2no2RdWV2OPYYuGdWu+x5rljiz+xVO5PmITzOD8
         cthk8Z+66glwpEg5AXsfVjothdOienhxYmYCGqXvmqT4IueqOqRoVLH82IFR3r107A72
         PB7RZy5OBdPhEmJ24npqCLJLviFGiiekbk+JkPVzf7/4rArUUMpdZp1VsqHgdu+mDl3n
         G9XhdZBklOtDwY9v1KcXF+BxKNLMupUDKYTBryTbmAOiF1LBeOOiM1l2iP3awq/NswtW
         iTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689636580; x=1692228580;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ird/WLydYaL1CZ8k5wr+kVwYTmymx69M3RobX2GjRRk=;
        b=AGuYTrmwBIeDFxycjxwv2hC3aHbN8FUh4OT4e1ouTySmbj780J4DWjvMN0wYkV5qb9
         jbxqhzZiDrBkld9JEY6l3R9SV4dVHNnqxaX6sFlANTwyK0SeNZ0D9N4nDNfcEBDN143H
         pJ79bMA0qwsOrV5EEzJr/tmu5HeQDimeI92uoHCdH7QYoBsqx2QTUwkJ03pHtKcI//e4
         WgKlM0dTJlAQlzrxIAWgLAKjrCucMGcD+rBQ91qnDDjjAo/F8VDtLw0pm0M2mAasF3HH
         u7Mc+DXoMQpBGVv4fju6IjAdB5icefOYmIkhqmyKFK6AIcvDMbpW27x0M3frWC9mv2Zj
         HSfQ==
X-Gm-Message-State: ABy/qLboDqUpWVZwlRZTzbuClvU4tT3VJAC32Fpx2RvyP070fODOz4uu
	6aWXGdpPBS86rREkTZzeQVqAWeHPX9BhQI4=
X-Google-Smtp-Source: APBJJlFf2yFppmL7A2x5VBahkETSDvkzC8Bm3eSvb1eaR96HjbZm8g/RzRfWAVGfvhdgg9m7kq7fcTczsJw+3k4=
X-Received: from robbarnes3.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:6451])
 (user=robbarnes job=sendgmr) by 2002:a63:9316:0:b0:55a:e71b:45b9 with SMTP id
 b22-20020a639316000000b0055ae71b45b9mr104144pge.2.1689636579886; Mon, 17 Jul
 2023 16:29:39 -0700 (PDT)
Date: Mon, 17 Jul 2023 23:29:32 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230717232932.1.I361812b405bd07772f66660624188339ab158772@changeid>
Subject: [PATCH] drivers/cros_ec: Emergency sync filesystem on EC panic
From: Rob Barnes <robbarnes@google.com>
To: pmalani@chromium.org, chrome-platform@lists.linux.dev
Cc: robbarnes@google.com, briannorris@chromium.org, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Perform an emergency filesystem sync when an EC panic is reported. An
emergency sync actually performs two syncs internally in case some
inodes or pages are temporarily locked.

hw_protection_shutdown is replaced for a few reasons. It is unnecessary
because the EC will force reset either way. hw_protection_shutdown does
not reliably sync filesystem before shutting down. emergency_sync is not
synchronous so hw_protection_shutdown may interrupt emergency_sync.

Signed-off-by: Rob Barnes <robbarnes@google.com>
---

 drivers/platform/chrome/cros_ec_lpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 500a61b093e47..9652fc073c2a4 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -327,8 +327,8 @@ static void cros_ec_lpc_acpi_notify(acpi_handle device, u32 value, void *data)
 		dev_emerg(ec_dev->dev, "CrOS EC Panic Reported. Shutdown is imminent!");
 		blocking_notifier_call_chain(&ec_dev->panic_notifier, 0, ec_dev);
 		kobject_uevent_env(&ec_dev->dev->kobj, KOBJ_CHANGE, (char **)env);
-		/* Begin orderly shutdown. Force shutdown after 1 second. */
-		hw_protection_shutdown("CrOS EC Panic", 1000);
+		/* Force sync the filesystem before EC resets */
+		emergency_sync();
 		/* Do not query for other events after a panic is reported */
 		return;
 	}
-- 
2.41.0.255.g8b1d071c50-goog

