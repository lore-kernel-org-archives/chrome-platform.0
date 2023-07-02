Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B593C2A
	for <chrome-platform@lists.linux.dev>; Sun,  2 Jul 2023 19:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4650AC433C7;
	Sun,  2 Jul 2023 19:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688327460;
	bh=4pvMoacaA60G7V3hYy9YvZAexu4GvTj9gc943PFNtyg=;
	h=From:To:Cc:Subject:Date:From;
	b=O12IaRm3TBpOzfQ6yb36CcmR9DCSIBy4AHnEsHUskPy0+rbP/ChOu3Zlkn0q07tJf
	 c+Ff1nvZY9qCgtKZPuyhkc95Mn7RjyFm8lNfzAEDIMXmuPNOF0LYxTZb4dKdUiI4jD
	 MG0tjzXHmY8VYLJcS32YgGL7PO5f64TvPs+mxY6c3xxculVtn5jXSCWgS7aHoL/Zwa
	 BatT+5vrTHT4F1nAS//xrTwFjZCQ0xN+1/bDwgsHQ46unSiGnZdXACBMP1eiRsAUNa
	 pQcvXZvf3MwKXkqSJjBTEqwfVLLRM8XDFuNmkZdPH/cODplX2DU0gFaj4FVU54kfKM
	 40JI0l22LhcaQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Rob Barnes <robbarnes@google.com>,
	Prashant Malani <pmalani@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	bleung@chromium.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH AUTOSEL 6.4 01/12] platform/chrome: cros_ec: Report EC panic as uevent
Date: Sun,  2 Jul 2023 15:50:46 -0400
Message-Id: <20230702195057.1787686-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.1
Content-Transfer-Encoding: 8bit

From: Rob Barnes <robbarnes@google.com>

[ Upstream commit 2cbf475a04b2ae3d722bbe41742e5d874a027fc3 ]

Create a uevent when an EC panic is detected. This will allow udev rules
to trigger when a panic occurs. For example, a udev rule could be added to
capture an EC coredump. This approach avoids the need to stuff all the
processing into the driver.

Signed-off-by: Rob Barnes <robbarnes@google.com>
Reviewed-by: Prashant Malani <pmalani@chromium.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
Link: https://lore.kernel.org/r/20230509232624.3120347-1-robbarnes@google.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/chrome/cros_ec_lpc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 68bba0fcafab3..2b1ce3e1abf2e 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -16,6 +16,7 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/interrupt.h>
+#include <linux/kobject.h>
 #include <linux/module.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_ec_proto.h>
@@ -315,6 +316,7 @@ static int cros_ec_lpc_readmem(struct cros_ec_device *ec, unsigned int offset,
 
 static void cros_ec_lpc_acpi_notify(acpi_handle device, u32 value, void *data)
 {
+	static const char *env[] = { "ERROR=PANIC", NULL };
 	struct cros_ec_device *ec_dev = data;
 	bool ec_has_more_events;
 	int ret;
@@ -324,6 +326,7 @@ static void cros_ec_lpc_acpi_notify(acpi_handle device, u32 value, void *data)
 	if (value == ACPI_NOTIFY_CROS_EC_PANIC) {
 		dev_emerg(ec_dev->dev, "CrOS EC Panic Reported. Shutdown is imminent!");
 		blocking_notifier_call_chain(&ec_dev->panic_notifier, 0, ec_dev);
+		kobject_uevent_env(&ec_dev->dev->kobj, KOBJ_CHANGE, (char **)env);
 		/* Begin orderly shutdown. Force shutdown after 1 second. */
 		hw_protection_shutdown("CrOS EC Panic", 1000);
 		/* Do not query for other events after a panic is reported */
-- 
2.39.2

