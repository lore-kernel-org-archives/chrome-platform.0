Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0FEA2A
	for <chrome-platform@lists.linux.dev>; Wed, 28 Dec 2022 00:58:17 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id v23so14760946pju.3
        for <chrome-platform@lists.linux.dev>; Tue, 27 Dec 2022 16:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UlkVfUBe/NCfBa71O2rd9oCNbNRfdZ1yxlTWgpEWcJM=;
        b=DtPex/an83yfigVpvCXORqv940vc0AIQEz08QWsNwTfI1b4uzmqNDUsRKW9L7TdIe/
         HjadvImKK/AW8yt34ZtnpaeGrp4qI8AOK+lcfHnyKHZYidt7wiIfZU8ttDEiPqqWANi9
         VlE0AYjiRo5r4nS8KS+BsLPxLh+osXkwsoVCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UlkVfUBe/NCfBa71O2rd9oCNbNRfdZ1yxlTWgpEWcJM=;
        b=3pGrSLbNs/7f75Kre56y4fniaGOfdFAoWz3H3vgZWIWyJzQ+YVSBXrjvoTAx23F85U
         SbSZnU13wXf/EFP8cLjOwI4d8hBf31+hwQHtYrQAmQ2QqFm0XxEdMbFplG42uzp1Cp2z
         fkS15cSrVgmJLw/KTRQ77DRZwRR/isw8FbYSdVZ6cx8G2sYI7ASZjgIAui4nslDTvzds
         g1hPzo7JIegln90pNCSHHnbuZnkkqBkLomRo5D0toluTsgGd8t0dCRaayLDQuJne5hWR
         QGAkf7164T89a7RltOz6crGfXxvIAW8WOmWO7zNTLH4Om7nV+M0RJnBAL2xdiIey51Vk
         3RFQ==
X-Gm-Message-State: AFqh2kpjfyGKNCwfa39yv659sYLI+8Ev1Lj4CMiPo4yiSV4NFIXWRtkQ
	Dlo+nrq5oLw4q1P6pNbp85tEoA==
X-Google-Smtp-Source: AMrXdXufenNnXoC4kkU0SDNn5FlEczA8R3d5sE9/rZBWavVP5SpMEqK/pwUXdtNUGoE3mN/yZFMdaQ==
X-Received: by 2002:a05:6a20:7da8:b0:a2:c45f:f0fc with SMTP id v40-20020a056a207da800b000a2c45ff0fcmr36080228pzj.27.1672189096619;
        Tue, 27 Dec 2022 16:58:16 -0800 (PST)
Received: from pmalani.c.googlers.com.com (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id 68-20020a621947000000b00580e679dcf2sm6045566pfz.157.2022.12.27.16.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 16:58:16 -0800 (PST)
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
Subject: [PATCH 02/10] platform_chrome: cros_ec: Add Type-C VDM defines
Date: Wed, 28 Dec 2022 00:45:05 +0000
Message-Id: <20221228004648.793339-3-pmalani@chromium.org>
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

Add the EC header changes need to support USB Type-C VDM (Vendor Defined
Messages) communication between the system and USB PD-enabled
peripherals.

The headers are already present in the EC code base, from which they've
been ported [1].

[1] https://source.chromium.org/chromium/chromiumos/platform/ec/+/main:include/ec_commands.h

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 .../linux/platform_data/cros_ec_commands.h    | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 7c94bf5c8f05..6665e7da6ee2 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -1300,6 +1300,18 @@ enum ec_feature_code {
 	 * mux.
 	 */
 	EC_FEATURE_TYPEC_MUX_REQUIRE_AP_ACK = 43,
+	/*
+	 * The EC supports entering and residing in S4.
+	 */
+	EC_FEATURE_S4_RESIDENCY = 44,
+	/*
+	 * The EC supports the AP directing mux sets for the board.
+	 */
+	EC_FEATURE_TYPEC_AP_MUX_SET = 45,
+	/*
+	 * The EC supports the AP composing VDMs for us to send.
+	 */
+	EC_FEATURE_TYPEC_AP_VDM_SEND = 46,
 };
 
 #define EC_FEATURE_MASK_0(event_code) BIT(event_code % 32)
@@ -5724,6 +5736,8 @@ enum typec_control_command {
 	TYPEC_CONTROL_COMMAND_ENTER_MODE,
 	TYPEC_CONTROL_COMMAND_TBT_UFP_REPLY,
 	TYPEC_CONTROL_COMMAND_USB_MUX_SET,
+	TYPEC_CONTROL_COMMAND_BIST_SHARE_MODE,
+	TYPEC_CONTROL_COMMAND_SEND_VDM_REQ,
 };
 
 /* Replies the AP may specify to the TBT EnterMode command as a UFP */
@@ -5737,6 +5751,17 @@ struct typec_usb_mux_set {
 	uint8_t mux_flags;	/* USB_PD_MUX_*-encoded USB mux state to set */
 } __ec_align1;
 
+#define VDO_MAX_SIZE 7
+
+struct typec_vdm_req {
+	/* VDM data, including VDM header */
+	uint32_t vdm_data[VDO_MAX_SIZE];
+	/* Number of 32-bit fields filled in */
+	uint8_t vdm_data_objects;
+	/* Partner to address - see enum typec_partner_type */
+	uint8_t partner_type;
+} __ec_align1;
+
 struct ec_params_typec_control {
 	uint8_t port;
 	uint8_t command;	/* enum typec_control_command */
@@ -5752,6 +5777,8 @@ struct ec_params_typec_control {
 		uint8_t mode_to_enter;      /* enum typec_mode */
 		uint8_t tbt_ufp_reply;      /* enum typec_tbt_ufp_reply */
 		struct typec_usb_mux_set mux_params;
+		/* Used for VMD_REQ */
+		struct typec_vdm_req vdm_req_params;
 		uint8_t placeholder[128];
 	};
 } __ec_align1;
@@ -5833,6 +5860,8 @@ enum tcpc_cc_polarity {
 #define PD_STATUS_EVENT_DISCONNECTED		BIT(3)
 #define PD_STATUS_EVENT_MUX_0_SET_DONE		BIT(4)
 #define PD_STATUS_EVENT_MUX_1_SET_DONE		BIT(5)
+#define PD_STATUS_EVENT_VDM_REQ_REPLY		BIT(6)
+#define PD_STATUS_EVENT_VDM_REQ_FAILED		BIT(7)
 
 struct ec_params_typec_status {
 	uint8_t port;
@@ -5876,6 +5905,28 @@ struct ec_response_typec_status {
 	uint32_t sink_cap_pdos[7];	/* Max 7 PDOs can be present */
 } __ec_align1;
 
+/*
+ * Gather the response to the most recent VDM REQ from the AP
+ */
+#define EC_CMD_TYPEC_VDM_RESPONSE 0x013C
+
+struct ec_params_typec_vdm_response {
+	uint8_t port;
+} __ec_align1;
+
+struct ec_response_typec_vdm_response {
+	/* Number of 32-bit fields filled in */
+	uint8_t vdm_data_objects;
+	/* Partner to address - see enum typec_partner_type */
+	uint8_t partner_type;
+	/* Reserved */
+	uint16_t reserved;
+	/* VDM data, including VDM header */
+	uint32_t vdm_response[VDO_MAX_SIZE];
+} __ec_align1;
+
+#undef VDO_MAX_SIZE
+
 /*****************************************************************************/
 /* The command range 0x200-0x2FF is reserved for Rotor. */
 
-- 
2.39.0.314.g84b9a713c41-goog

