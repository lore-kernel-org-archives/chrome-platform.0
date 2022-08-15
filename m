Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44ECB1102
	for <chrome-platform@lists.linux.dev>; Mon, 15 Aug 2022 06:38:34 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id h21-20020a17090aa89500b001f31a61b91dso13615372pjq.4
        for <chrome-platform@lists.linux.dev>; Sun, 14 Aug 2022 23:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=t0lzq9wXtDZalDc+MqW+q/Qr6dM8adTctzXUvTWqjXw=;
        b=mJZ4VkOcUookg2qKkoDfdsGdAK5ungyXoH75mzIMbXSlD1e3Fb2fu6nmK757mhROgs
         UNXG+dWaInBvgNqv+PAI8VUaledvrOzwjnAT1UxeYn1iOBTzM/2Htua1MwLDVf1QjVHu
         CHcv6VV+jVlxAhUX7PsYB7f7OWJCEJiuszq1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=t0lzq9wXtDZalDc+MqW+q/Qr6dM8adTctzXUvTWqjXw=;
        b=V5spqppzU36fdFDwnT6AuTuV9SxALNpWBNQf8peoO9vwHydEUTat107JESUVkdNVMN
         mFYD3yC3X5AbZI92gpAyCOwQbjdLGPlMbeh3RKpbop8vPYHn+s2y1+v5Ff1qcnsb9Aml
         9GzFuZhwGOr8O5tfwKmZxF7Iwqo3f7AnlElFi/nvE612K0TgwQUZ+MJIRWRMq3450rTB
         HVFcmgYSk1bDOqu1U7WcSgBKIJTGXqHHLioOi+m5LBhis6dfD5xx7cVXX2cUtnm69zOU
         4+w9EPbSh+W6ayIj/qz3pEFblgff/CfSwGeqIWf/7cnE9yvYhS8FajibbBZeKh11h1DH
         QVOQ==
X-Gm-Message-State: ACgBeo0wwAUcWG9YThs0daOzI24B7sPRdCcZpGBNGzlUU3/TK/haFRo9
	Anpnjc9CKh6Tmd7omfUegPP3pPYG/6DE5Q==
X-Google-Smtp-Source: AA6agR7lhgSd83SNVI3JVmj+q3jlu0eT7XHkY/HqQvsYT2lX6B8gSJ8NGEu++JfxXrv3C9yGkog63g==
X-Received: by 2002:a17:90b:4a05:b0:1f5:62d5:4155 with SMTP id kk5-20020a17090b4a0500b001f562d54155mr17504326pjb.6.1660545513764;
        Sun, 14 Aug 2022 23:38:33 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (137.22.168.34.bc.googleusercontent.com. [34.168.22.137])
        by smtp.gmail.com with ESMTPSA id 200-20020a6214d1000000b0052db82ad8b2sm5988233pfu.123.2022.08.14.23.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 23:38:33 -0700 (PDT)
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
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Xiang wangx <wangxiang@cdjrlc.com>
Subject: [PATCH v5 1/7] platform/chrome: Add Type-C mux set command definitions
Date: Mon, 15 Aug 2022 06:34:17 +0000
Message-Id: <20220815063555.1384505-2-pmalani@chromium.org>
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

Copy EC header definitions for the USB Type-C Mux control command from
the EC code base. Also pull in "TBT_UFP_REPLY" definitions, since that
is the prior entry in the enum.

These headers are already present in the EC code base. [1]

[1] https://chromium.googlesource.com/chromiumos/platform/ec/+/b80f85a94a423273c1638ef7b662c56931a138dd/include/ec_commands.h

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
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

