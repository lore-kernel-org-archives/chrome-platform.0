Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDA58F7C
	for <chrome-platform@lists.linux.dev>; Tue,  3 Jan 2023 22:52:14 +0000 (UTC)
Received: by mail-pl1-f202.google.com with SMTP id u2-20020a17090341c200b00192bc565119so6285024ple.16
        for <chrome-platform@lists.linux.dev>; Tue, 03 Jan 2023 14:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTOoPfcNG0aT7/+lzCzhxQIfXn4mODv2jojK4QZNxeE=;
        b=AGivzF74tZLqiofMGxnAwJOVb3dW5ySId8wuUNCwfXu9JZmed29HGFebA4VRA/JIiK
         04by/xig++YIzGyJjKxFtpnLbtYKmMZm03H9OXCSEoam9BCD9LfAiBk2NDWvn0r8ILIQ
         W1Ues5se3ibCi4o9MfFGTrrQXtB+5r/UAKV5UiGhGIzeb3/zwHU63iZQIY0OMpOBj2am
         dhSdXWEOirzrZaOX5Y+WZXzbUtSkLxE6G20leV4/9evO1hBrcmb3KMisAtMyH7NwnHSI
         o+NprNenLeDljF3zO4bzZmSFCLBPyKSKm1S3y+YWfb0NU0v4I8zakPlBgaSegS3vbV5T
         J6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTOoPfcNG0aT7/+lzCzhxQIfXn4mODv2jojK4QZNxeE=;
        b=eif/I//W3XBA5ECz4Ea3h+lDLlPyWLll3blJ1UtA2ku/jTePziO6lH3x8twRdBx+i7
         RbekvYFWuEtlYmh/xUZAX/XURbuZ/z8VUTD9y8TYTsWaWALMslElrxXEQW3FKDXUS8sE
         ElTwmKj5lyS548uB8i8layeWu37W3E5UhFh4lZrpytXa7Xr7466s2KcaTr0zQpkMVieX
         0fi6pTeOlj31BUb/iEXEyHGp0MGShfeUK3UIBLU5ZQKLAT2JhY/C33Wsr9UxuWDFLeVr
         mQxinr3IekDosWbJVLuzyDBum3qPc6hvdlrTHnoRjz1d0VyB3qwxaqVWeO+f32JnBwj3
         XZmQ==
X-Gm-Message-State: AFqh2koEjOPekclFi+SlQUmkzGPIh7J9bu0TFhXxxEQxrWUyUGWE5lNZ
	E19W643AQrKJHaRH196OPL59UkcNXVTog/Y=
X-Google-Smtp-Source: AMrXdXu3h/AFI3G96bHYl/kEHydrCzXB2kq8Dz0U9mrtQGjWVr6rgoZM/Ixn6LdBCPdHtMmy1JQ8H79aBE1hqUA=
X-Received: from robbarnes3.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:6451])
 (user=robbarnes job=sendgmr) by 2002:a17:90b:4d83:b0:220:1f03:129b with SMTP
 id oj3-20020a17090b4d8300b002201f03129bmr431763pjb.0.1672786333408; Tue, 03
 Jan 2023 14:52:13 -0800 (PST)
Date: Tue,  3 Jan 2023 22:52:03 +0000
In-Reply-To: <20230103225204.346088-1-robbarnes@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CACeCKafGg5=1MQQdCtXDm-3LE2VsixHPsUDngRwQXUvAwQ=u=Q@mail.gmail.com>
 <20230103225204.346088-1-robbarnes@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230103225204.346088-3-robbarnes@google.com>
Subject: [PATCH v2 2/2] platform/chrome: cros_ec: Shutdown on EC Panic
From: Rob Barnes <robbarnes@google.com>
To: groeck@chromium.org, pmalani@chromium.org
Cc: chrome-platform@lists.linux.dev, dtor@chromium.org, 
	Rob Barnes <robbarnes@google.com>
Content-Type: text/plain; charset="UTF-8"

When an EC panic is reported, attempt an orderly shutdown.
Force a shutdown after a brief timeout if the orderly shutdown
fails for any reason.

Using the common hw_protection_shutdown utility function since
an EC panic has the potential to cause hw damage.

This is all best effort. EC should also force a hard reset after a
short timeout.

Change-Id: Ie87e7921431b85e3aba5c0e6c9f0a34e4daa181d
Signed-off-by: Rob Barnes <robbarnes@google.com>
---
 drivers/platform/chrome/cros_ec_lpc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 5738f1d25091..3708fa75feb1 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -21,6 +21,7 @@
 #include <linux/platform_data/cros_ec_proto.h>
 #include <linux/platform_device.h>
 #include <linux/printk.h>
+#include <linux/reboot.h>
 #include <linux/suspend.h>
 
 #include "cros_ec.h"
@@ -323,6 +324,8 @@ static void cros_ec_lpc_acpi_notify(acpi_handle device, u32 value, void *data)
 	if (value == ACPI_NOTIFY_CROS_EC_PANIC) {
 		dev_emerg(ec_dev->dev, "CrOS EC Panic Reported. Shutdown is imminent!");
 		blocking_notifier_call_chain(&ec_dev->panic_notifier, 0, ec_dev);
+		/* Begin orderly shutdown. Force shutdown after 1 second. */
+		hw_protection_shutdown("CrOS EC Panic", 1000);
 		/* Do not query for other events after a panic is reported */
 		return;
 	}
-- 
2.39.0.314.g84b9a713c41-goog

