Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608001102
	for <chrome-platform@lists.linux.dev>; Mon, 15 Aug 2022 06:44:35 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id 24so5829194pgr.7
        for <chrome-platform@lists.linux.dev>; Sun, 14 Aug 2022 23:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=RJziAcdwqSHxXgUj0onY2n8IS5JD3vb95lzQbzWkWLI=;
        b=XsJEoodtcCGJbDsuP0RLg51aYou66Ds+346IKLbcNX1VzKwLOBFeMf/YEsKX6AVUoR
         fWlxxUFBeE/4hBHmemMrlt6x9+e8yTABXmMhPZHbWS6LEKKfuHvCnuCsTBl70thUdU6n
         t7K5vQvej6G9KDjCE28HFd/n7+bZIMDze6fhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=RJziAcdwqSHxXgUj0onY2n8IS5JD3vb95lzQbzWkWLI=;
        b=dmiq5KaqH9Aciwhfy/VR5GnS0V84jfz83ejQeEtbMLeOG2/xGUliR8etMVj2Gq7gB1
         gv7K1IgGuVK2nuYBoKep2V6xrwLN1TXg8dWmE/WQbtR1tE2Z5Lo/Ci3J962GJMHohNkf
         E5u1uto5A5z87DAppNzkiFlxv+IA4VAddc3w+dgddWW1wbrqWFHdj9iWGEM6DkbjapXg
         TnkWyOyi24OfCUpWoJUsYsE+/BeBFONvVbebvblzSwXtKJo9e33XEzF39Ao4bKO5sjbg
         VgFR56/G0ZdfwAn8CTfc8W7MkRhnj8/d/aB4V3IYuI8xpH8YANGLQVE6DPK6MKrRblZL
         6Jsg==
X-Gm-Message-State: ACgBeo1aZL8huL9F713UgNai/dvgl/Rs88TS7ZUqxaRuHA7wlb86n11a
	EoPhtHW7oy9cidKrlWzcilAiWg==
X-Google-Smtp-Source: AA6agR446wHPCYbLAa9lBoYkAl5m6yhRbR4u1jAAQ8WRws1gaRsilRU1+B7KO66gatZg4a0FpR9Gkg==
X-Received: by 2002:a63:8548:0:b0:428:a204:c9f7 with SMTP id u69-20020a638548000000b00428a204c9f7mr3906037pgd.331.1660545874813;
        Sun, 14 Aug 2022 23:44:34 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (137.22.168.34.bc.googleusercontent.com. [34.168.22.137])
        by smtp.gmail.com with ESMTPSA id 200-20020a6214d1000000b0052db82ad8b2sm5988233pfu.123.2022.08.14.23.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 23:44:34 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: bleung@chromium.org,
	Prashant Malani <pmalani@chromium.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	"Dustin L. Howett" <dustin@howett.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Lee Jones <lee.jones@linaro.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Xiang wangx <wangxiang@cdjrlc.com>
Subject: [PATCH v5 4/7] platform/chrome: cros_typec_switch: Add event check
Date: Mon, 15 Aug 2022 06:34:24 +0000
Message-Id: <20220815063555.1384505-5-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
In-Reply-To: <20220815063555.1384505-1-pmalani@chromium.org>
References: <20220815063555.1384505-1-pmalani@chromium.org>
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

Changes since v4:
- Update cros_ec_command() to cros_ec_cmd().
- Dropped unnecessary Reported-by tag (since this patch is not a
  bug fix).

Changes since v3:
- No changes.

Changes since v2:
- Fixed missing "static" identifier.

Changes since v1:
- No changes.

 drivers/platform/chrome/cros_typec_switch.c | 72 ++++++++++++++++++++-
 1 file changed, 70 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_typec_switch.c b/drivers/platform/chrome/cros_typec_switch.c
index befe35655a9a..a9e114391321 100644
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
+	return cros_ec_cmd(sdata->ec, 0, EC_CMD_TYPEC_CONTROL, &req,
+			   sizeof(req), NULL, 0);
+}
+
+static bool cros_typec_check_event(struct cros_typec_switch_data *sdata, int port_num, u32 mask)
+{
+	struct ec_response_typec_status resp;
+	struct ec_params_typec_status req = {
+		.port = port_num,
+	};
+	int ret;
+
+	ret = cros_ec_cmd(sdata->ec, 0, EC_CMD_TYPEC_STATUS, &req, sizeof(req),
+			  &resp, sizeof(resp));
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
 
 static int cros_typec_retimer_set(struct typec_retimer *retimer, struct typec_retimer_state *state)
-- 
2.37.1.595.g718a3a8f04-goog

