Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0658CA2A
	for <chrome-platform@lists.linux.dev>; Wed, 28 Dec 2022 01:11:22 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id y21so7631136pfo.7
        for <chrome-platform@lists.linux.dev>; Tue, 27 Dec 2022 17:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNxB8uMl8S+cIx13svZb0f8mLMHIEoe8sZA5V2z0kk4=;
        b=WE2qgyx2SI+0tgX6FHwbAgRVNSwZkLvp+BZysQ1edZOmVv9pJnG8YXnN/8Lclrb0Vl
         XqC3/gtQRm5xycVhdAzhZ2ri8e4ZOz/ULgJ34r+L9pGkwzarzraFHYwWE0QOPWSFzM2e
         teYVgdNUSBYpY+M3rIq1RMbt8q9twyzRCBpVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BNxB8uMl8S+cIx13svZb0f8mLMHIEoe8sZA5V2z0kk4=;
        b=0PZ3SbACpOFvzc00Dc0/VL534g+gkQsk6qokBTIZEpBgJ9YtPKZCDYUTkPozvvN70n
         ELiEdVVVbXY1lSvbisASMI5uixbTjK6QmFU+Y9fUKLV/6xTElvJtwgGNtG8j2I4kR6Js
         tjjtTcW/2YewAuEiFSCBloCtHvzGpmyjl/ncm4zH9Pml8VCw+3l1gTm9p4sCkhfepRc3
         1QnMU0lYAKxSX3Ag/jFZrh72XmtMd1IBrtrbctIGNpKigIsTn5NfwMDOTZfgQJtd5HHt
         zbfE0AiWckK+nBSssV3iN09YMJuWqnCHCGtCC3A2hJqQrr6mIgqJcxDy+31kqHaLVywH
         Tlrg==
X-Gm-Message-State: AFqh2krEA6Jq5rOENASkux3IxQijfRg+H20MBEV8xP42f8cpS+0lYhoW
	Jt/5Zgf3UUm1hkDwkMob8yBdvwU+Z2j/sFF+
X-Google-Smtp-Source: AMrXdXuRniPa+kdLE35R+lvAK/KHSDtSV/UXu7eXSGc2mSHOFloadStPHn4NrOnaiT9YsDCTJDnekw==
X-Received: by 2002:aa7:9e11:0:b0:576:c2f0:d6a1 with SMTP id y17-20020aa79e11000000b00576c2f0d6a1mr27063164pfq.8.1672189882439;
        Tue, 27 Dec 2022 17:11:22 -0800 (PST)
Received: from pmalani.c.googlers.com.com (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id 68-20020a621947000000b00580e679dcf2sm6045566pfz.157.2022.12.27.17.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 17:11:22 -0800 (PST)
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
	Stephen Boyd <swboyd@chromium.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Xiang wangx <wangxiang@cdjrlc.com>
Subject: [PATCH 09/10] platform/chrome: cros_typec_vdm: Add VDM reply support
Date: Wed, 28 Dec 2022 00:45:12 +0000
Message-Id: <20221228004648.793339-10-pmalani@chromium.org>
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

Handle response VDMs which are sent by the partner (replying to VDMs
sent by the host system itself). These get forwarded to the altmode
driver.

Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c  |  7 +++++
 drivers/platform/chrome/cros_typec_vdm.c | 39 ++++++++++++++++++++++++
 drivers/platform/chrome/cros_typec_vdm.h |  2 ++
 3 files changed, 48 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 1e28d56b094d..e02107a6870a 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -1000,6 +1000,13 @@ static void cros_typec_handle_status(struct cros_typec_data *typec, int port_num
 					 "Failed SOP Disc event clear, port: %d\n", port_num);
 		}
 	}
+
+	if (resp.events & PD_STATUS_EVENT_VDM_REQ_REPLY) {
+		cros_typec_handle_vdm_response(typec, port_num);
+		ret = cros_typec_send_clear_event(typec, port_num, PD_STATUS_EVENT_VDM_REQ_REPLY);
+		if (ret < 0)
+			dev_warn(typec->dev, "Failed VDM Reply event clear, port: %d\n", port_num);
+	}
 }
 
 static int cros_typec_port_update(struct cros_typec_data *typec, int port_num)
diff --git a/drivers/platform/chrome/cros_typec_vdm.c b/drivers/platform/chrome/cros_typec_vdm.c
index df0102ca3a18..fc7b602ceb37 100644
--- a/drivers/platform/chrome/cros_typec_vdm.c
+++ b/drivers/platform/chrome/cros_typec_vdm.c
@@ -13,6 +13,45 @@
 #include "cros_ec_typec.h"
 #include "cros_typec_vdm.h"
 
+/*
+ * Retrieves a VDM response from the EC and forwards it to the altmode driver based on SVID.
+ */
+void cros_typec_handle_vdm_response(struct cros_typec_data *typec, int port_num)
+{
+	struct ec_response_typec_vdm_response resp;
+	struct ec_params_typec_vdm_response req = {
+		.port = port_num,
+	};
+	struct typec_altmode *amode;
+	u16 svid;
+	u32 hdr;
+	int ret;
+
+	ret = cros_ec_cmd(typec->ec, 0, EC_CMD_TYPEC_VDM_RESPONSE, &req,
+			  sizeof(req), &resp, sizeof(resp));
+	if (ret < 0) {
+		dev_warn(typec->dev, "Failed VDM response fetch, port: %d\n", port_num);
+		return;
+	}
+
+	hdr = resp.vdm_response[0];
+	svid = PD_VDO_VID(hdr);
+	dev_dbg(typec->dev, "Received VDM header: %x, port: %d\n", hdr, port_num);
+
+	amode = typec_match_altmode(typec->ports[port_num]->port_altmode, CROS_EC_ALTMODE_MAX,
+				    svid, PD_VDO_OPOS(hdr));
+	if (!amode) {
+		dev_err(typec->dev, "Received VDM for unregistered altmode (SVID:%x), port: %d\n",
+			svid, port_num);
+		return;
+	}
+
+	ret = typec_altmode_vdm(amode, hdr, &resp.vdm_response[1], resp.vdm_data_objects);
+	if (ret)
+		dev_err(typec->dev, "Failed to forward VDM to altmode (SVID:%x), port: %d\n",
+			svid, port_num);
+}
+
 static int cros_typec_port_amode_enter(struct typec_altmode *amode, u32 *vdo)
 {
 	struct cros_typec_port *port = typec_altmode_get_drvdata(amode);
diff --git a/drivers/platform/chrome/cros_typec_vdm.h b/drivers/platform/chrome/cros_typec_vdm.h
index 7e282d168a98..003587525554 100644
--- a/drivers/platform/chrome/cros_typec_vdm.h
+++ b/drivers/platform/chrome/cros_typec_vdm.h
@@ -7,4 +7,6 @@
 
 extern struct typec_altmode_ops port_amode_ops;
 
+void cros_typec_handle_vdm_response(struct cros_typec_data *typec, int port_num);
+
 #endif /*  __CROS_TYPEC_VDM__ */
-- 
2.39.0.314.g84b9a713c41-goog

