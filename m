Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CFF538F
	for <chrome-platform@lists.linux.dev>; Wed,  6 Jul 2022 17:22:21 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id y141so14930008pfb.7
        for <chrome-platform@lists.linux.dev>; Wed, 06 Jul 2022 10:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8vkh4TpqQ2iDSGtdYg+e9qVXOj8wmBpN55yIEeN36y0=;
        b=ThTTUVLaBkNvNvD7kstnLhRwdeS954leLaxWs9DUoyO/M6VlQPx/G0zAQHtOIRcyIe
         SJx6dbUkTs4Wj9NVD/CC85q2hXjmkc2eeSJtNtD9avsWZXE1f9UPiUOJUKn621GRzrAv
         2QeSVX4w7Gn76Ho02P3s2Ei+sW6816z0csY/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8vkh4TpqQ2iDSGtdYg+e9qVXOj8wmBpN55yIEeN36y0=;
        b=f2BIjDCx80Y6OEqmsJI9Iwv/tUD/tOtYR5uUOzT88doZE9EG3/UtSIbK90gZldOheb
         oJ/0E+dvQE+KAYyPbTMPZdfqL+/1rW+bqTJjc6gcMnlDWc42tTzw+j0sm7AZN7Ph1lFj
         Hjki0iOFzv6Bvw7X9h9+uJtPoIhWa3gEHmu7FYh+hNvKoez/Buy/uPHZe+K7O0EEG8NB
         6f5q+inoHiGmYCQ3J1Q3W+0k1spyxPSNRy4qmJd+GmQLhId+jajAnjHoejZGb9Anuqts
         b03OlN+kkWCWdGqO3aUFhafogTXCTiaW3o7ITzMNy3kr/fi3hCd/+SheznfaNggkUzNt
         djeg==
X-Gm-Message-State: AJIora9KQiVQNgU2oBmVUJrbClSjbqurNWxbOXKz+MG3GYRF68hNka67
	tOuVPOfg4a9oxEbDdlWxhPRUVQ==
X-Google-Smtp-Source: AGRyM1sOulPvskKuXxJw8YFyvB7Ug9Hn6UdaLMDf2/lSv05bFdXt9zZpJcRLUpeYqbs3c3fJXpSWcQ==
X-Received: by 2002:a63:b341:0:b0:40d:677:881a with SMTP id x1-20020a63b341000000b0040d0677881amr35450152pgt.407.1657128140603;
        Wed, 06 Jul 2022 10:22:20 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id h14-20020a170902f7ce00b0016be0d5483asm7514953plw.252.2022.07.06.10.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 10:22:20 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: bleung@chromium.org,
	heikki.krogerus@linux.intel.com,
	Prashant Malani <pmalani@chromium.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	"Dustin L. Howett" <dustin@howett.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH v2 6/9] platform/chrome: cros_typec_switch: Add event check
Date: Wed,  6 Jul 2022 17:15:10 +0000
Message-Id: <20220706171601.807042-7-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220706171601.807042-1-pmalani@chromium.org>
References: <20220706171601.807042-1-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Chrome EC updates Type-C status events when mux set requests from
the Application Processor (AP) are completed. Add a check to the
flow of configuring muxes to look for this status done bit, so that
the driver is aware that the mux set completed successfully or not.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes since v1:
- No changes.

 drivers/platform/chrome/cros_typec_switch.c | 72 ++++++++++++++++++++-
 1 file changed, 70 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_typec_switch.c b/drivers/platform/chrome/cros_typec_switch.c
index 9faa442dd81a..a226f828514f 100644
--- a/drivers/platform/chrome/cros_typec_switch.c
+++ b/drivers/platform/chrome/cros_typec_switch.c
@@ -7,6 +7,8 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/delay.h>
+#include <linux/jiffies.h>
 #include <linux/module.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_ec_proto.h>
@@ -63,6 +65,40 @@ static int cros_typec_get_mux_state(unsigned long mode, struct typec_altmode *al
 	return ret;
 }
 
+static int cros_typec_send_clear_event(struct cros_typec_switch_data *sdata, int port_num,
+				       u32 events_mask)
+{
+	struct ec_params_typec_control req = {
+		.port = port_num,
+		.command = TYPEC_CONTROL_COMMAND_CLEAR_EVENTS,
+		.clear_events_mask = events_mask,
+	};
+
+	return cros_ec_command(sdata->ec, 0, EC_CMD_TYPEC_CONTROL, &req,
+			       sizeof(req), NULL, 0);
+}
+
+bool cros_typec_check_event(struct cros_typec_switch_data *sdata, int port_num, u32 mask)
+{
+	struct ec_response_typec_status resp;
+	struct ec_params_typec_status req = {
+		.port = port_num,
+	};
+	int ret;
+
+	ret = cros_ec_command(sdata->ec, 0, EC_CMD_TYPEC_STATUS, &req, sizeof(req),
+			      &resp, sizeof(resp));
+	if (ret < 0) {
+		dev_warn(sdata->dev, "EC_CMD_TYPEC_STATUS failed for port: %d\n", port_num);
+		return false;
+	}
+
+	if (resp.events & mask)
+		return true;
+
+	return false;
+}
+
 /*
  * The Chrome EC treats both mode-switches and retimers as "muxes" for the purposes of the
  * host command API. This common function configures and verifies the retimer/mode-switch
@@ -71,12 +107,44 @@ static int cros_typec_get_mux_state(unsigned long mode, struct typec_altmode *al
 static int cros_typec_configure_mux(struct cros_typec_switch_data *sdata, int port_num, int index,
 				    unsigned long mode, struct typec_altmode *alt)
 {
-	int ret = cros_typec_get_mux_state(mode, alt);
+	unsigned long end;
+	u32 event_mask;
+	u8 mux_state;
+	int ret;
+
+	ret = cros_typec_get_mux_state(mode, alt);
+	if (ret < 0)
+		return ret;
+	mux_state = (u8)ret;
 
+	/* Clear any old mux set done event. */
+	if (index == 0)
+		event_mask = PD_STATUS_EVENT_MUX_0_SET_DONE;
+	else
+		event_mask = PD_STATUS_EVENT_MUX_1_SET_DONE;
+
+	ret = cros_typec_send_clear_event(sdata, port_num, event_mask);
+	if (ret < 0)
+		return ret;
+
+	/* Send the set command. */
+	ret = cros_typec_cmd_mux_set(sdata, port_num, index, mux_state);
 	if (ret < 0)
 		return ret;
 
-	return cros_typec_cmd_mux_set(sdata, port_num, index, (u8)ret);
+	/* Check for the mux set done event. */
+	end = jiffies + msecs_to_jiffies(1000);
+	do {
+		if (cros_typec_check_event(sdata, port_num, event_mask))
+			return 0;
+
+		usleep_range(500, 1000);
+	} while (time_before(jiffies, end));
+
+	dev_err(sdata->dev, "Timed out waiting for mux set done on index: %d, state: %d\n",
+		index, mux_state);
+
+	return -ETIMEDOUT;
 }
 
 static int
-- 
2.37.0.rc0.161.g10f37bed90-goog

