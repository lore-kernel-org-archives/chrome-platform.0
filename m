Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F505CAB
	for <chrome-platform@lists.linux.dev>; Sun,  9 Oct 2022 23:56:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB8FC433B5;
	Sun,  9 Oct 2022 23:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665359796;
	bh=o3vtTwlB4jCOZ2PyHCmxu2zJ9FHZxZzmrmeAx8nin9U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kRJ0EDRteZiRSvcjvIY2JDR4OtJzK+opAJGwPRsAwd+xKlcVtYaKK7BF8/rZOsqno
	 rGmdsuC3Q/xCWcSos0tJYuVhCbWeEDCLq9nkz7JXBKumTwOv9PSnk2jeB9df6HnQK6
	 3kGmDM1i6xz8VPnLyDCyL36DvOuD7Yx4O0vte/06HmW3PH2pxd0l2lKMWVfulfi2kJ
	 uJ40a3wCCRR0BUO9oxvMGusNYXjInAqHcbAhZOlbi0mA6dW6Qy6ba2iWMSYUOL/8gs
	 1CSBswG3p87RaG580BDHQ53xgzPzMC+yW2078+yJAtvdbBvsSTn3YfsF0YynfR1Hcm
	 Fkx7JTyZJBOww==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jameson Thies <jthies@google.com>,
	Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	chrome-platform@lists.linux.dev
Subject: [PATCH AUTOSEL 5.10 13/22] platform/chrome: cros_ec: Notify the PM of wake events during resume
Date: Sun,  9 Oct 2022 19:55:31 -0400
Message-Id: <20221009235540.1231640-13-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009235540.1231640-1-sashal@kernel.org>
References: <20221009235540.1231640-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Jameson Thies <jthies@google.com>

[ Upstream commit 8edd2752b0aa498b3a61f3caee8f79f7e0567fad ]

cros_ec_handle_event in the cros_ec driver can notify the PM of wake
events. When a device is suspended, cros_ec_handle_event will not check
MKBP events. Instead, received MKBP events are checked during resume by
cros_ec_report_events_during_suspend. But
cros_ec_report_events_during_suspend cannot notify the PM if received
events are wake events, causing wake events to not be reported if
received while the device is suspended.

Update cros_ec_report_events_during_suspend to notify the PM of wake
events during resume by calling pm_wakeup_event.

Signed-off-by: Jameson Thies <jthies@google.com>
Reviewed-by: Prashant Malani <pmalani@chromium.org>
Reviewed-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
Link: https://lore.kernel.org/r/20220913204954.2931042-1-jthies@google.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/chrome/cros_ec.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index c4de8c4db193..5a622666a075 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -332,10 +332,16 @@ EXPORT_SYMBOL(cros_ec_suspend);
 
 static void cros_ec_report_events_during_suspend(struct cros_ec_device *ec_dev)
 {
+	bool wake_event;
+
 	while (ec_dev->mkbp_event_supported &&
-	       cros_ec_get_next_event(ec_dev, NULL, NULL) > 0)
+	       cros_ec_get_next_event(ec_dev, &wake_event, NULL) > 0) {
 		blocking_notifier_call_chain(&ec_dev->event_notifier,
 					     1, ec_dev);
+
+		if (wake_event && device_may_wakeup(ec_dev->dev))
+			pm_wakeup_event(ec_dev->dev, 0);
+	}
 }
 
 /**
-- 
2.35.1

