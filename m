Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33B55C94
	for <chrome-platform@lists.linux.dev>; Tue, 30 Aug 2022 20:20:23 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id y29so8379454pfq.0
        for <chrome-platform@lists.linux.dev>; Tue, 30 Aug 2022 13:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=IIahQC3iUsvNJToMk9UFFnI7uylEWwTVmxgpc7S23kI=;
        b=b7QJQ9dHysGM+ncTgpqvop8xm6lADhwcKDUxSvuBLHkcQnYctwKKneWicxRpu/zf8y
         SqKNSU96C4poiPDV3DriN5+AnMP2nY7GAwMmbEm3hCbfeOm/ZGYfeVfeB+e1vAx1dC/I
         94azdNR986kJJ38TaOVaFJrSVmVbHbiEjSPb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=IIahQC3iUsvNJToMk9UFFnI7uylEWwTVmxgpc7S23kI=;
        b=eaQl/0Hs6DtRQfkjtTYfT5jH8LmhcjfZsGo8mWFBEQFGTRyZ6iStTscko//oYk276a
         f5227E3xAJAKmIrQLq5jAK3r96NQnFu+sIPCBddZoQz9GVV2/uTMoQrp0SoEFWcuKwlj
         oncVJgvtfrD/XXDAqpIoWWdp77fnZcNQnfU322dtRyykSMln3B2PTTbJETyrCGmMqcj7
         viZz9vt9h0gzdZjR5+v4YIQWdmjmZN4Sl2FZVWlZZYm/7pE/9FBPdZ94Nh7hsEXtXR2j
         hRF62weWPbH5YrjnNooTw5UZ7ThsYl+IKRA0cT6pZ5Yr7ZbmZJGhR9wU8UrgLmRkg55x
         3eKA==
X-Gm-Message-State: ACgBeo0+3mYY+MaF+4BxDJt+P+7yx+JwYG4bXTMssQ+kA8YYC7XJEF1N
	CX5zt77usixEyfNiUTrYNNdrag==
X-Google-Smtp-Source: AA6agR7W/292GbS9tKYBQcHXvWWz7uZ8dK3q3BOUaxIu+S/sTOJMmQ29g+D7tnTn/5qgQNN+VJzuHg==
X-Received: by 2002:a05:6a00:24d3:b0:53a:8f28:5054 with SMTP id d19-20020a056a0024d300b0053a8f285054mr2524501pfv.36.1661890823158;
        Tue, 30 Aug 2022 13:20:23 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (137.22.168.34.bc.googleusercontent.com. [34.168.22.137])
        by smtp.gmail.com with ESMTPSA id y1-20020a17090264c100b0016d4f05eb95sm6657528pli.272.2022.08.30.13.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 13:20:22 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: bleung@chromium.org,
	Prashant Malani <pmalani@chromium.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Guenter Roeck <groeck@chromium.org>
Subject: [PATCH] platform/chrome: cros_ec_typec: Register partner PDOs
Date: Tue, 30 Aug 2022 20:20:18 +0000
Message-Id: <20220830202018.1884851-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ChromeOS EC exports partner source/sink cap PDOs (Power Data
Objects) to the application processor (AP). Use this information
to register USB PD (Power Delivery) capabilities with the
USB Type-C Power Delivery device class.

Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 56 +++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 00208ffbe2e7..f84bf9659a0f 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -73,6 +73,11 @@ struct cros_typec_port {
 	struct ec_response_typec_discovery *disc_data;
 	struct list_head partner_mode_list;
 	struct list_head plug_mode_list;
+
+	/* PDO-related structs */
+	struct usb_power_delivery *partner_pd;
+	struct usb_power_delivery_capabilities *partner_src_caps;
+	struct usb_power_delivery_capabilities *partner_sink_caps;
 };
 
 /* Platform-specific data for the Chrome OS EC Type C controller. */
@@ -253,6 +258,14 @@ static void cros_typec_remove_partner(struct cros_typec_data *typec,
 
 	cros_typec_unregister_altmodes(typec, port_num, true);
 
+	typec_partner_set_usb_power_delivery(port->partner, NULL);
+	usb_power_delivery_unregister_capabilities(port->partner_sink_caps);
+	port->partner_sink_caps = NULL;
+	usb_power_delivery_unregister_capabilities(port->partner_src_caps);
+	port->partner_src_caps = NULL;
+	usb_power_delivery_unregister(port->partner_pd);
+	port->partner_pd = NULL;
+
 	cros_typec_usb_disconnect_state(port);
 	port->mux_flags = USB_PD_MUX_NONE;
 
@@ -939,6 +952,46 @@ static int cros_typec_send_clear_event(struct cros_typec_data *typec, int port_n
 			   sizeof(req), NULL, 0);
 }
 
+static void cros_typec_register_partner_pdos(struct cros_typec_data *typec,
+					     struct ec_response_typec_status *resp, int port_num)
+{
+	struct usb_power_delivery_capabilities_desc caps_desc = {};
+	struct usb_power_delivery_desc desc = {
+		.revision = (le16_to_cpu(resp->sop_revision) & 0xff00) >> 4,
+	};
+	struct cros_typec_port *port = typec->ports[port_num];
+
+	if (!port->partner || port->partner_pd)
+		return;
+
+	/* If no caps are available, don't bother creating a device. */
+	if (!resp->source_cap_count && !resp->sink_cap_count)
+		return;
+
+	port->partner_pd = usb_power_delivery_register(NULL, &desc);
+	if (IS_ERR(port->partner_pd)) {
+		dev_warn(typec->dev, "Failed to register partner PD device, port: %d\n", port_num);
+		return;
+	}
+
+	typec_partner_set_usb_power_delivery(port->partner, port->partner_pd);
+
+	memcpy(caps_desc.pdo, resp->source_cap_pdos, sizeof(u32) * resp->source_cap_count);
+	caps_desc.role = TYPEC_SOURCE;
+	port->partner_src_caps = usb_power_delivery_register_capabilities(port->partner_pd,
+									  &caps_desc);
+	if (IS_ERR(port->partner_src_caps))
+		dev_warn(typec->dev, "Failed to register source caps, port: %d\n", port_num);
+
+	memset(&caps_desc, 0, sizeof(caps_desc));
+	memcpy(caps_desc.pdo, resp->sink_cap_pdos, sizeof(u32) * resp->sink_cap_count);
+	caps_desc.role = TYPEC_SINK;
+	port->partner_sink_caps = usb_power_delivery_register_capabilities(port->partner_pd,
+									   &caps_desc);
+	if (IS_ERR(port->partner_sink_caps))
+		dev_warn(typec->dev, "Failed to register sink caps, port: %d\n", port_num);
+}
+
 static void cros_typec_handle_status(struct cros_typec_data *typec, int port_num)
 {
 	struct ec_response_typec_status resp;
@@ -986,6 +1039,8 @@ static void cros_typec_handle_status(struct cros_typec_data *typec, int port_num
 		}
 		if (resp.sop_connected)
 			typec_set_pwr_opmode(typec->ports[port_num]->port, TYPEC_PWR_MODE_PD);
+
+		cros_typec_register_partner_pdos(typec, &resp, port_num);
 	}
 
 	if (resp.events & PD_STATUS_EVENT_SOP_PRIME_DISC_DONE &&
@@ -1006,6 +1061,7 @@ static void cros_typec_handle_status(struct cros_typec_data *typec, int port_num
 					 "Failed SOP Disc event clear, port: %d\n", port_num);
 		}
 	}
+
 }
 
 static int cros_typec_port_update(struct cros_typec_data *typec, int port_num)
-- 
2.37.2.672.g94769d06f0-goog

