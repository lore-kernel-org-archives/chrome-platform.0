Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DC8A2A
	for <chrome-platform@lists.linux.dev>; Wed, 28 Dec 2022 01:12:57 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id g20so1581317pfb.3
        for <chrome-platform@lists.linux.dev>; Tue, 27 Dec 2022 17:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19FACrxzZLvGXvd0qASwod3BuDfjZjR6MyHlKQ4qp7g=;
        b=iEVqWLpKFWneA1CaDK1kR7cs5OO3qwDqFvdU2t4jNQZOYZuUah0u5S9U6d6kBS9K5P
         4GynIc5CjpScZRoFcv7w4txy1LtJyF1SiMm8Mapgj32y6w1cX9VXL6lcpELZYg4G3ohN
         YRRTb4EG9LMCE47SXDsUxXt8KElbfN1f9MgKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19FACrxzZLvGXvd0qASwod3BuDfjZjR6MyHlKQ4qp7g=;
        b=sXE1uiZY9d0zEcRgl3bM7D8scwLYk/N6EJbL3CukWJMwm4jhd1AoGs3ULhNvqE+aqI
         qswmp3N7expIpcvX7oJi4AONfMPGlCfr34aw77jcw53T9U2/KkK89/3RfY1cMyCVrcLP
         vrjXq2MXYA6NzEBaLH4sIGUwknek+qXRZ2VbY2JgWo4UYpkM3ze14iPtmDymP0cZbfmq
         +BKA0jbx/xT9M9nj/2TEo6N8SzZkQNYrHvMETrAxr5L13rt6GFRqsI0vr9diEO19dpV1
         6fBCe0LLTu6ccHoSM5okehVr8BlYy0PmtVdryblYsF6eqRng1zS75vNl2PyLHLDQXYE7
         XS0A==
X-Gm-Message-State: AFqh2kr3vGNGfVrNUhaIJaoziT3gJQ5nkZfjOqRGHbS8BWdlpYyk0aTe
	GKGGCxKtK4JcetL0U4oMmF5sbA==
X-Google-Smtp-Source: AMrXdXtE+Iu61LxC8/oG9wiX3A5IaH1P+cVPyJUa2fQ6FKLIm8WQohl8bsbs8zl8o9Nxf1TwkKt2rA==
X-Received: by 2002:a05:6a00:1f06:b0:581:366b:ca63 with SMTP id be6-20020a056a001f0600b00581366bca63mr7058629pfb.34.1672189977038;
        Tue, 27 Dec 2022 17:12:57 -0800 (PST)
Received: from pmalani.c.googlers.com.com (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id 68-20020a621947000000b00580e679dcf2sm6045566pfz.157.2022.12.27.17.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 17:12:56 -0800 (PST)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: heikki.krogerus@linux.intel.com,
	Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	"Dustin L. Howett" <dustin@howett.net>,
	Evan Green <evgreen@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Lee Jones <lee.jones@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Xiang wangx <wangxiang@cdjrlc.com>
Subject: [PATCH 10/10] platform/chrome: cros_typec_vdm: Add VDM send support
Date: Wed, 28 Dec 2022 00:45:13 +0000
Message-Id: <20221228004648.793339-11-pmalani@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
In-Reply-To: <20221228004648.793339-1-pmalani@chromium.org>
References: <20221228004648.793339-1-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support to send generic VDM messages from the alt mode driver to the
partner (via the ChromeOS EC). The function introduced here is intended
to be called by the alt mode driver (via the Type-C bus logic).

Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/platform/chrome/cros_typec_vdm.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/platform/chrome/cros_typec_vdm.c b/drivers/platform/chrome/cros_typec_vdm.c
index fc7b602ceb37..aca9d337118e 100644
--- a/drivers/platform/chrome/cros_typec_vdm.c
+++ b/drivers/platform/chrome/cros_typec_vdm.c
@@ -77,6 +77,30 @@ static int cros_typec_port_amode_enter(struct typec_altmode *amode, u32 *vdo)
 			   sizeof(req), NULL, 0);
 }
 
+static int cros_typec_port_amode_vdm(struct typec_altmode *amode, const u32 hdr,
+				     const u32 *vdo, int cnt)
+{
+	struct cros_typec_port *port = typec_altmode_get_drvdata(amode);
+	struct ec_params_typec_control req = {
+		.port = port->port_num,
+		.command = TYPEC_CONTROL_COMMAND_SEND_VDM_REQ,
+	};
+	struct typec_vdm_req vdm_req = {};
+
+	vdm_req.vdm_data[0] = hdr;
+	vdm_req.vdm_data_objects = cnt;
+	memcpy(&vdm_req.vdm_data[1], vdo, cnt - 1);
+	vdm_req.partner_type = TYPEC_PARTNER_SOP;
+	req.vdm_req_params = vdm_req;
+
+	dev_dbg(port->typec_data->dev, "Sending VDM, hdr: %x, num_objects: %d, port: %d\n",
+		hdr, cnt, port->port_num);
+
+	return cros_ec_cmd(port->typec_data->ec, 0, EC_CMD_TYPEC_CONTROL, &req,
+			   sizeof(req), NULL, 0);
+}
+
 struct typec_altmode_ops port_amode_ops = {
 	.enter = cros_typec_port_amode_enter,
+	.vdm = cros_typec_port_amode_vdm,
 };
-- 
2.39.0.314.g84b9a713c41-goog

