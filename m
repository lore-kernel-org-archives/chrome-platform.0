Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02F76AA9
	for <chrome-platform@lists.linux.dev>; Tue, 16 Aug 2022 21:49:32 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id jm11so8163380plb.13
        for <chrome-platform@lists.linux.dev>; Tue, 16 Aug 2022 14:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Dpx0PwACWbQFxixTVFk/61UCM3kuZHHFS7n8j4zijMQ=;
        b=FRgbWwyP7EWE0icWc2RFJVeZqv8kIQ0lB0mhEn/eyAI/mpax2GzRstd2pefdvVa8Zf
         gxkDlWiw3KbxMal0E/z1DZyUnGQ0WglhfDOcD1ksrq2mnzOrGbYktsaIy7HmklrycNew
         5x9yabw9ILeGKD/r52jqw0eoGHIQPp5626BeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Dpx0PwACWbQFxixTVFk/61UCM3kuZHHFS7n8j4zijMQ=;
        b=LGgkvIojdkFAScF3WYunjvE1ds+P0lPgR8sB5CkRmIWZJ2SNa/MN1KzpIwQ5iohdm5
         L1btvlbtE95OUZT+1m/+oMvszwNizZ+ov7g159mbanfOIrPSKfw8D2wtrawsB7aSh43O
         KxenNzYH+c4TiqZG+5wVv34uQqKUzHwiAQCrAKPfgQapzYilqws6lYqcXAlpTmU1+9ze
         oOvU7ptijvfaFs/WByB7nXLomxYJ+acx1IQucHVdAiwp5hB6mzcPZmEs4bTIjMOFvtJ0
         eHjs5KcOye7i6k0tWN838kKaKtKuLVEvjngxUzoIonSCS8kjmMqb3lj3Ow+0BpPTKFWl
         TTCA==
X-Gm-Message-State: ACgBeo3NHGzelxmSYHBbBtPJXw61Hc3lfOTJQFZuPCakDFVrIn6uOcDE
	ku6qQqqOrHIZTqTN9iVnfsqwGA==
X-Google-Smtp-Source: AA6agR7TNB5zQ63ecTmqMx8UI/o9MDKSbE814YlS5wFCIQHu/6qamsTObsVT65zOn9TQ///HUVDcVA==
X-Received: by 2002:a17:90a:bb96:b0:1f4:414a:d89e with SMTP id v22-20020a17090abb9600b001f4414ad89emr606470pjr.240.1660686572172;
        Tue, 16 Aug 2022 14:49:32 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (137.22.168.34.bc.googleusercontent.com. [34.168.22.137])
        by smtp.gmail.com with ESMTPSA id z5-20020a623305000000b005323a1a9fecsm8916650pfz.101.2022.08.16.14.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 14:49:31 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: bleung@chromium.org,
	Prashant Malani <pmalani@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	"Dustin L. Howett" <dustin@howett.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Xiang wangx <wangxiang@cdjrlc.com>
Subject: [PATCH v6 1/7] platform/chrome: Add Type-C mux set command definitions
Date: Tue, 16 Aug 2022 21:48:29 +0000
Message-Id: <20220816214857.2088914-2-pmalani@chromium.org>
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

Copy EC header definitions for the USB Type-C Mux control command from
the EC code base. Also pull in "TBT_UFP_REPLY" definitions, since that
is the prior entry in the enum.

These headers are already present in the EC code base. [1]

[1] https://chromium.googlesource.com/chromiumos/platform/ec/+/b80f85a94a423273c1638ef7b662c56931a138dd/include/ec_commands.h

Signed-off-by: Prashant Malani <pmalani@chromium.org>
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
---

Changes since v5:
- Picked by Reviewed-by tag.
- No functional changes.

Changes since v4:
- No changes.

Changes since v3:
- No changes.

Changes since v2:
- No changes.

Changes since v1:
- No changes.

 include/linux/platform_data/cros_ec_commands.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 8b1b795867a1..5744a2d746aa 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -5724,8 +5724,21 @@ enum typec_control_command {
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
@@ -5739,6 +5752,8 @@ struct ec_params_typec_control {
 	union {
 		uint32_t clear_events_mask;
 		uint8_t mode_to_enter;      /* enum typec_mode */
+		uint8_t tbt_ufp_reply;      /* enum typec_tbt_ufp_reply */
+		struct typec_usb_mux_set mux_params;
 		uint8_t placeholder[128];
 	};
 } __ec_align1;
@@ -5817,6 +5832,9 @@ enum tcpc_cc_polarity {
 #define PD_STATUS_EVENT_SOP_DISC_DONE		BIT(0)
 #define PD_STATUS_EVENT_SOP_PRIME_DISC_DONE	BIT(1)
 #define PD_STATUS_EVENT_HARD_RESET		BIT(2)
+#define PD_STATUS_EVENT_DISCONNECTED		BIT(3)
+#define PD_STATUS_EVENT_MUX_0_SET_DONE		BIT(4)
+#define PD_STATUS_EVENT_MUX_1_SET_DONE		BIT(5)
 
 struct ec_params_typec_status {
 	uint8_t port;
-- 
2.37.1.595.g718a3a8f04-goog

