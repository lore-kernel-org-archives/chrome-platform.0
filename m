Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D065CAB
	for <chrome-platform@lists.linux.dev>; Sun,  9 Oct 2022 23:55:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EE05C43148;
	Sun,  9 Oct 2022 23:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665359705;
	bh=JG4zpURXQKIe8yvupxxFcpZJr66Oes7UwY5ObWUaDP4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D3uLByhaG7elr72Rw2TDhfznqCKuwsQ03+jx2lSxv9iOm58nLYOEqVrajwd/MZGoI
	 Oj87YvVpfw2YspoUFP+PjVcoMSlDLtiEVoU+SUoSC6XGHDD/bKmoKDkdlFyzISDT+H
	 3P2ac/7v6BfX7LhaviCAwIHsBW5L5TKSlayZRdSs/VuxOZuDFWazcbe9o7wuEHYsPW
	 KXqXRvGw39jYheclZd5KZXtdWGNT6lIQLn4B3eh1Sj4Xi2W9Yr5IL0MfgNTXn4oIoT
	 CZKV8HuJk1GQxOuuwzLs+NCHpbWcshUSoBEVgFuvpSu1McVWb07yvxdF4L0jWJ7T1F
	 nxFnHj7qszOxg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jameson Thies <jthies@google.com>,
	Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	chrome-platform@lists.linux.dev
Subject: [PATCH AUTOSEL 5.15 15/25] platform/chrome: cros_ec: Notify the PM of wake events during resume
Date: Sun,  9 Oct 2022 19:54:15 -0400
Message-Id: <20221009235426.1231313-15-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009235426.1231313-1-sashal@kernel.org>
References: <20221009235426.1231313-1-sashal@kernel.org>
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
index 4f0390b10cd3..9664e13ded59 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -353,10 +353,16 @@ EXPORT_SYMBOL(cros_ec_suspend);
 
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

