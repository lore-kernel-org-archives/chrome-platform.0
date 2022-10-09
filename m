Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BF65CAA
	for <chrome-platform@lists.linux.dev>; Sun,  9 Oct 2022 23:53:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37490C433D7;
	Sun,  9 Oct 2022 23:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665359602;
	bh=M38r/E9gOiSMNUxlhb0oTig0PM5+yEimJHqsvloDPrY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LDvXf8RIXpTZk6zU6mwqKEqw1gJz3xLFKEhGYrZbNQ2J7TixhPx7IAQKbvYgIWg1e
	 BI/xchKaUFVtBRZAubXP03zMYo+xMFQUs/Q8tvymMPTz1xoUrjCzVcr/TJjAdhUz66
	 +QTHHKflwZZxC44kj0N4WNXVF2RaqUukWuN1VbJXNWEDkhdI4WPp8YgCxMB2Z95LNS
	 Ithyuvoo5nUoAj/25eCwk6w0pX6H/pHb9Tm3TQd+unoPPff8dALpTiedLqcmbyP9FA
	 sf6oBwr/6xbEeDI38kicnmUJ+wMTaVIrkUZJk1P9iz004dMSgKZNEisesO9CaUT0cG
	 ryCeBIRQ5PIYg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jameson Thies <jthies@google.com>,
	Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	chrome-platform@lists.linux.dev
Subject: [PATCH AUTOSEL 5.19 19/36] platform/chrome: cros_ec: Notify the PM of wake events during resume
Date: Sun,  9 Oct 2022 19:52:05 -0400
Message-Id: <20221009235222.1230786-19-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009235222.1230786-1-sashal@kernel.org>
References: <20221009235222.1230786-1-sashal@kernel.org>
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
index 00381490dd3e..4b0934ef7714 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -352,10 +352,16 @@ EXPORT_SYMBOL(cros_ec_suspend);
 
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

