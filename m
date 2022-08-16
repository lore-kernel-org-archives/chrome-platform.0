Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618A36AA9
	for <chrome-platform@lists.linux.dev>; Tue, 16 Aug 2022 21:51:01 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id ch17-20020a17090af41100b001fa74771f61so2292460pjb.0
        for <chrome-platform@lists.linux.dev>; Tue, 16 Aug 2022 14:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=tjMBMSeLf47Dl9twMgr77h09YFRDoxykrXGPZHBAccY=;
        b=MbZdnqhDu3qlh1Cy6jJRu1PFT0mgvRF/UzbWWvdiCnSbqwBAcPduwys9Yt977aNLAR
         t8FY7+27CjCn906Nnnt+DEXHYIYioH9+Wq0L54MGDpk95ih6PHETpfmhZ5dSi40pxART
         3QauOv9pmCCfcr6Gv1gtFLfjKqgKt46BW9VkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=tjMBMSeLf47Dl9twMgr77h09YFRDoxykrXGPZHBAccY=;
        b=Moh/WKpW4PSJX7fAdzR5jTE3Q888sUyXZ8Rrcpsu+NDpPHxY8ybPYBFo/gq4eORivV
         sF02rU7AeKZYJfpwN96SXKhRo6K24zObvOt6tRxyRiwnV5NJA/CVHWHozXlYcHSwkbjg
         L6ayE/yPca5epQDE/i6begQsc5wpXG1J6z2igjymACfAO+e66jr2ZLZY5DiEeeiMwuRG
         7XWJnhK3X+Yr2yEbIhohpX0DP2uEYskBihXmBnmYWLVwAk53a7dihXJxAo0eoqxmXdcP
         3n4aZf6vO9H/OhpMuYrCh/BYaITXpiszm/OC3HwXVrzga8iVfENbxlrXHh/YIegPZkQ7
         CLDw==
X-Gm-Message-State: ACgBeo2p2LiScFbG1gzKEFYGDWpplxGM4SN7ySZ1GF+7G9i4RAYi0+3r
	mwfRrfg1rSojTHDQK/CM9fayAjri/Wdxvw==
X-Google-Smtp-Source: AA6agR4vBYgz2zHsn0+x4VIXE126q6rD9Mi4i/Y2ISPSXNn4+YYi9wPEDAkrdZ0LoEcwyduFjRNWgQ==
X-Received: by 2002:a17:90b:1bd0:b0:1f3:396f:9942 with SMTP id oa16-20020a17090b1bd000b001f3396f9942mr573956pjb.220.1660686660978;
        Tue, 16 Aug 2022 14:51:00 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (137.22.168.34.bc.googleusercontent.com. [34.168.22.137])
        by smtp.gmail.com with ESMTPSA id z5-20020a623305000000b005323a1a9fecsm8916650pfz.101.2022.08.16.14.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 14:51:00 -0700 (PDT)
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
	Kees Cook <keescook@chromium.org>,
	Lee Jones <lee.jones@linaro.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Xiang wangx <wangxiang@cdjrlc.com>
Subject: [PATCH v6 4/7] platform/chrome: cros_typec_switch: Add event check
Date: Tue, 16 Aug 2022 21:48:32 +0000
Message-Id: <20220816214857.2088914-5-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
In-Reply-To: <20220816214857.2088914-1-pmalani@chromium.org>
References: <20220816214857.2088914-1-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ChromeOS EC updates Type-C status events when mux set requests from
the Application Processor (AP) are completed. Add a check to the
flow of configuring muxes to look for this status done bit, so that
the driver is aware that the mux set completed successfully or not.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes since v5:
- Change "Chrome OS" -> "ChromeOS".
- Make cros_ec_cmd() invocation fit on 1 line.

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

 drivers/platform/chrome/cros_typec_switch.c | 71 ++++++++++++++++++++-
 1 file changed, 69 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_typec_switch.c b/drivers/platform/chrome/cros_typec_switch.c
index eae7d26416aa..dc84cdec8f7f 100644
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
@@ -60,6 +62,39 @@ static int cros_typec_get_mux_state(unsigned long mode, struct typec_altmode *al
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
+	return cros_ec_cmd(sdata->ec, 0, EC_CMD_TYPEC_CONTROL, &req, sizeof(req), NULL, 0);
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
  * The ChromeOS EC treats both mode-switches and retimers as "muxes" for the purposes of the
  * host command API. This common function configures and verifies the retimer/mode-switch
@@ -68,12 +103,44 @@ static int cros_typec_get_mux_state(unsigned long mode, struct typec_altmode *al
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
+
+	/* Clear any old mux set done event. */
+	if (index == 0)
+		event_mask = PD_STATUS_EVENT_MUX_0_SET_DONE;
+	else
+		event_mask = PD_STATUS_EVENT_MUX_1_SET_DONE;
 
+	ret = cros_typec_send_clear_event(sdata, port_num, event_mask);
 	if (ret < 0)
 		return ret;
 
-	return cros_typec_cmd_mux_set(sdata, port_num, index, (u8)ret);
+	/* Send the set command. */
+	ret = cros_typec_cmd_mux_set(sdata, port_num, index, mux_state);
+	if (ret < 0)
+		return ret;
+
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

