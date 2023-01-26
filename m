Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75CD538D
	for <chrome-platform@lists.linux.dev>; Thu, 26 Jan 2023 20:57:32 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id x2-20020a17090a46c200b002295ca9855aso6553312pjg.2
        for <chrome-platform@lists.linux.dev>; Thu, 26 Jan 2023 12:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmhmI4D2ECXjETCrLzWK9fUqbXCjLtYUyXyZabkNnbA=;
        b=h8b6PRp/L8Q41yNrCwI4fZ8tX1BbumNWlKs//Z4UGtIUMXG5Pqd2Tt6BuLu/Tz7Ak7
         SN3n0rYXu+f/NMexV4qLiT5XhjxXTQ6ciB9i+v2agCY0CRxalu6Whuqi0IdebgMXtVfW
         aPiMStxKqnKtsCs5eW3NJ7IYzLXFosqtgEDcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cmhmI4D2ECXjETCrLzWK9fUqbXCjLtYUyXyZabkNnbA=;
        b=536+HdMP63TS7ocsJ7tX0ehgsHbVgMRpvmsadfrlwS8FC4HbeIRUQJDOtUeW//Opju
         yw2rN2NWbV5wHBB4UohQSgLuP05lhiMR7LMr3hA/XmsMJoj1Vcj5IzFQiWbO8Adn3WLz
         gVX1FPbse0L2FvC5r94/KToqFGEzDPA0D9ZhQRHC3qD0qQTJYqIhpwgbSgRsMsnqF/7z
         qwLtrsEuRDMWhxNbPt4n6IPRpHzz6t1Ou25D1pymghkju987HX1cnf4yole64rKDgT5v
         CDxLI38c5nyr98hpOE8D2ewjol7ZK6fKtCJnv+lNQvnv/EoBp7wkIhw5G3fNf4HM1lR5
         FWHw==
X-Gm-Message-State: AFqh2koeQJWreiJu4KX4udHWVTd5wyvBDeThaL6YWz/837xiSDg2GyEp
	P1T2WkgK3Rge7HXs7MFDXcGqeA==
X-Google-Smtp-Source: AMrXdXv2WT5wVVNUSH9saGarlFU8XXjQOWR/+uNwR5taMbz/fMKkJ5DGlRy52PLI9rK7B5GWiwzhyQ==
X-Received: by 2002:a17:902:ccc1:b0:194:7d25:cb78 with SMTP id z1-20020a170902ccc100b001947d25cb78mr42444964ple.46.1674766652071;
        Thu, 26 Jan 2023 12:57:32 -0800 (PST)
Received: from pmalani.c.googlers.com.com (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id l5-20020a170903120500b00193132018ecsm1386669plh.170.2023.01.26.12.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 12:57:31 -0800 (PST)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: bleung@chromium.org,
	heikki.krogerus@linux.intel.com,
	Prashant Malani <pmalani@chromium.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	"Dustin L. Howett" <dustin@howett.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH 2/2] platform/chrome: cros_typec_vdm: Add Attention support
Date: Thu, 26 Jan 2023 20:55:46 +0000
Message-Id: <20230126205620.3714994-2-pmalani@chromium.org>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
In-Reply-To: <20230126205620.3714994-1-pmalani@chromium.org>
References: <20230126205620.3714994-1-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support to retrieve VDM attention messages and forward them to the
appropriate alt mode driver.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c  |  8 +++++
 drivers/platform/chrome/cros_typec_vdm.c | 40 ++++++++++++++++++++++++
 drivers/platform/chrome/cros_typec_vdm.h |  1 +
 3 files changed, 49 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 1abb471840d5..71f5d7d8e055 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -1015,6 +1015,14 @@ static void cros_typec_handle_status(struct cros_typec_data *typec, int port_num
 		if (ret < 0)
 			dev_warn(typec->dev, "Failed VDM Reply event clear, port: %d\n", port_num);
 	}
+
+	if (resp.events & PD_STATUS_EVENT_VDM_ATTENTION) {
+		cros_typec_handle_vdm_attention(typec, port_num);
+		ret = cros_typec_send_clear_event(typec, port_num, PD_STATUS_EVENT_VDM_ATTENTION);
+		if (ret < 0)
+			dev_warn(typec->dev, "Failed VDM Attenetion event clear, port: %d\n",
+				 port_num);
+	}
 }
 
 static int cros_typec_port_update(struct cros_typec_data *typec, int port_num)
diff --git a/drivers/platform/chrome/cros_typec_vdm.c b/drivers/platform/chrome/cros_typec_vdm.c
index 06f4a55999c5..20515ee0a20e 100644
--- a/drivers/platform/chrome/cros_typec_vdm.c
+++ b/drivers/platform/chrome/cros_typec_vdm.c
@@ -13,6 +13,46 @@
 #include "cros_ec_typec.h"
 #include "cros_typec_vdm.h"
 
+/*
+ * Retrieves pending VDM attention messages from the EC and forwards them to the altmode driver
+ * based on SVID.
+ */
+void cros_typec_handle_vdm_attention(struct cros_typec_data *typec, int port_num)
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
+	do {
+		ret = cros_ec_cmd(typec->ec, 0, EC_CMD_TYPEC_VDM_RESPONSE, &req,
+				sizeof(req), &resp, sizeof(resp));
+		if (ret < 0) {
+			dev_warn(typec->dev, "Failed VDM response fetch, port: %d\n", port_num);
+			return;
+		}
+
+		hdr = resp.vdm_response[0];
+		svid = PD_VDO_VID(hdr);
+		dev_dbg(typec->dev, "Received VDM Attention header: %x, port: %d\n", hdr, port_num);
+
+		amode = typec_match_altmode(typec->ports[port_num]->port_altmode,
+					    CROS_EC_ALTMODE_MAX, svid, PD_VDO_OPOS(hdr));
+		if (!amode) {
+			dev_err(typec->dev,
+				"Received VDM for unregistered altmode (SVID:%x), port: %d\n",
+				svid, port_num);
+			return;
+		}
+
+		typec_altmode_attention(amode, resp.vdm_attention[1]);
+	} while (resp.vdm_attention_left);
+}
+
 /*
  * Retrieves a VDM response from the EC and forwards it to the altmode driver based on SVID.
  */
diff --git a/drivers/platform/chrome/cros_typec_vdm.h b/drivers/platform/chrome/cros_typec_vdm.h
index 003587525554..95a6a75d32b6 100644
--- a/drivers/platform/chrome/cros_typec_vdm.h
+++ b/drivers/platform/chrome/cros_typec_vdm.h
@@ -7,6 +7,7 @@
 
 extern struct typec_altmode_ops port_amode_ops;
 
+void cros_typec_handle_vdm_attention(struct cros_typec_data *typec, int port_num);
 void cros_typec_handle_vdm_response(struct cros_typec_data *typec, int port_num);
 
 #endif /*  __CROS_TYPEC_VDM__ */
-- 
2.39.1.456.gfc5497dd1b-goog

