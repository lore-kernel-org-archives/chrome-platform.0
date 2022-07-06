Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287D82F38
	for <chrome-platform@lists.linux.dev>; Wed,  6 Jul 2022 17:19:31 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id o5-20020a17090a3d4500b001ef76490983so11894558pjf.2
        for <chrome-platform@lists.linux.dev>; Wed, 06 Jul 2022 10:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Nh8Zsj297L5xQ28EmOP0RXdwpiKaAwlSsSkxMC+PvCY=;
        b=huBl1UfJz8hUIIAtZ1nGtac5fgWGUI3RmihI7qawQJa/I55yzAIM1Lycp9AL4U8y0A
         oyrMmdQWtznysLCyudiO+MD8Yv5+StviKDRB/VOa27HdvuW48ovHuLT+Oud2BMCfXZ/B
         7/2qGCGfZT1H0xC266KuuaDaG+lLrGpPgtzvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nh8Zsj297L5xQ28EmOP0RXdwpiKaAwlSsSkxMC+PvCY=;
        b=sHX25qMdQoY4yNdIzrD0tcEUM14JhIeP5X8BVuO8mMWk1NaqWu4WNkDjnHMtvB8EIc
         yfWu7LeJEWfEYT0CNS5FmXcEew7/sKZDdZU2MSnWyEi59E1FYB+YIwgatcdUPA61Q/1c
         UgJ9xGXxM0v5h5/WvsGFSxb3UtGSsRiUoA+7bKKlZpsSERW6yS3a3fU04Rqnp24gxO3c
         LFIz/lLwy7U6cJWl/YxNq3Awq6W94px7T9HRJukoVxEq29JZvmVDVJLyzf49ioX7UPXn
         zykRvChShL3f9fX6t73kDERAJ57TPZak8zGUWluKfcmP44nXXXvlcTbRsKeHeEU5wxHW
         3qzg==
X-Gm-Message-State: AJIora9bVlQ5HZij2ihIOPZ++L/W5h8Kg5H4LgIvMAkHRGhCgGFTreAy
	jf+ShEowxLB33RoMwBQNMi95Vw==
X-Google-Smtp-Source: AGRyM1vbGj/LSC0lSOh1KWEBi/TyhTjEKK6CqY2DbWiF9bUc6u0EgUtEkwLUBM+TmWN+j6hR0OoqKg==
X-Received: by 2002:a17:903:18e:b0:16a:5f55:c4e with SMTP id z14-20020a170903018e00b0016a5f550c4emr47870812plg.33.1657127970572;
        Wed, 06 Jul 2022 10:19:30 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id h14-20020a170902f7ce00b0016be0d5483asm7514953plw.252.2022.07.06.10.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 10:19:30 -0700 (PDT)
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
Subject: [PATCH v2 3/9] platform/chrome: Add Type-C mux set command definitions
Date: Wed,  6 Jul 2022 17:15:07 +0000
Message-Id: <20220706171601.807042-4-pmalani@chromium.org>
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

Copy EC header definitions for the USB Type-C Mux control command from
the EC code base. Also pull in "TBT_UFP_REPLY" definitions, since that
is the prior entry in the enum.

These headers are already present in the EC code base. [1]

[1] https://chromium.googlesource.com/chromiumos/platform/ec/+/b80f85a94a423273c1638ef7b662c56931a138dd/include/ec_commands.h

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes since v1:
- No changes.

 include/linux/platform_data/cros_ec_commands.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 8cfa8cfca77e..a3945c5e7f50 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -5722,8 +5722,21 @@ enum typec_control_command {
 	TYPEC_CONTROL_COMMAND_EXIT_MODES,
 	TYPEC_CONTROL_COMMAND_CLEAR_EVENTS,
 	TYPEC_CONTROL_COMMAND_ENTER_MODE,
+	TYPEC_CONTROL_COMMAND_TBT_UFP_REPLY,
+	TYPEC_CONTROL_COMMAND_USB_MUX_SET,
 };
 
+/* Replies the AP may specify to the TBT EnterMode command as a UFP */
+enum typec_tbt_ufp_reply {
+	TYPEC_TBT_UFP_REPLY_NAK,
+	TYPEC_TBT_UFP_REPLY_ACK,
+};
+
+struct typec_usb_mux_set {
+	uint8_t mux_index;	/* Index of the mux to set in the chain */
+	uint8_t mux_flags;	/* USB_PD_MUX_*-encoded USB mux state to set */
+} __ec_align1;
+
 struct ec_params_typec_control {
 	uint8_t port;
 	uint8_t command;	/* enum typec_control_command */
@@ -5737,6 +5750,8 @@ struct ec_params_typec_control {
 	union {
 		uint32_t clear_events_mask;
 		uint8_t mode_to_enter;      /* enum typec_mode */
+		uint8_t tbt_ufp_reply;      /* enum typec_tbt_ufp_reply */
+		struct typec_usb_mux_set mux_params;
 		uint8_t placeholder[128];
 	};
 } __ec_align1;
@@ -5815,6 +5830,9 @@ enum tcpc_cc_polarity {
 #define PD_STATUS_EVENT_SOP_DISC_DONE		BIT(0)
 #define PD_STATUS_EVENT_SOP_PRIME_DISC_DONE	BIT(1)
 #define PD_STATUS_EVENT_HARD_RESET		BIT(2)
+#define PD_STATUS_EVENT_DISCONNECTED		BIT(3)
+#define PD_STATUS_EVENT_MUX_0_SET_DONE		BIT(4)
+#define PD_STATUS_EVENT_MUX_1_SET_DONE		BIT(5)
 
 struct ec_params_typec_status {
 	uint8_t port;
-- 
2.37.0.rc0.161.g10f37bed90-goog

