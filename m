Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22177538D
	for <chrome-platform@lists.linux.dev>; Thu, 26 Jan 2023 20:56:28 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id nn18-20020a17090b38d200b0022bfb584987so2936672pjb.2
        for <chrome-platform@lists.linux.dev>; Thu, 26 Jan 2023 12:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G6CBOqI5oDgyySu3dQCO+N4eLyzK+lB6jUuJvc7nfiE=;
        b=Kj11lwWxzTZ2rDlQBxesaEQfj6VLCP1z/6knxCOLQ66Tk7/WOu7vNWsTBWTq3k9buD
         m3RZ/rP39XJOktJV5zBNiusbvawtsXeeCucRof66E3oTgo95TQvWEKR7Y9UXbO85XhOl
         jnPDd19wnqS55s4nJ7ENDH6fiMDLMKVDKes6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G6CBOqI5oDgyySu3dQCO+N4eLyzK+lB6jUuJvc7nfiE=;
        b=horMW2NC5MXON/mFObKnTLZTwWxFNERRwuOrbooR6ftqhJsmptcXfddHoY736FPWYA
         wiLWhPbBV/tIEh0oKN4uFciVGs9w3YTQfDihogzLBTSg0bgEjqm6hAQ5MHVqc4UYaQTv
         9YfRrsxz/61nbryMHMCQsR0qP46x59jUvns5VsPsp3LE+2sSoch4iv7q4yywHICnl/EY
         Qc/DLXzclGGQVktGnXzULtrC60MSvEzU5TPko4P9p4V5XAMhYA/9PRiQyEQaNIJZz3E+
         Y87e3VTM/QEJhOT0XnHOMG4l0i3jkEJDTqY2OCespQh0VPfY6aJTAxdspj2hbAqGDZ6h
         1IgQ==
X-Gm-Message-State: AFqh2kpbAUqDxVne8oK3XXKeaGvlW/8s/MhAQFpDoRCrG17mr5DrgfVQ
	xKSARP9NcsKAyfMvpptBPNohPlfqUSxwMOBR
X-Google-Smtp-Source: AMrXdXvS1yRk2f8IaN7syoV2tCqwXFFkwEE089yK9QnmE/TwycMz5AjGqsaxVt/Goc8uLOalOfFPpw==
X-Received: by 2002:a17:902:bf0c:b0:192:c36c:f115 with SMTP id bi12-20020a170902bf0c00b00192c36cf115mr34923104plb.66.1674766588568;
        Thu, 26 Jan 2023 12:56:28 -0800 (PST)
Received: from pmalani.c.googlers.com.com (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id l5-20020a170903120500b00193132018ecsm1386669plh.170.2023.01.26.12.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 12:56:28 -0800 (PST)
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
Subject: [PATCH 1/2] platform/chrome: cros_ec: Add VDM attention headers
Date: Thu, 26 Jan 2023 20:55:45 +0000
Message-Id: <20230126205620.3714994-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Incorporate updates to the EC headers to support the retrieval of VDM
Attention messages from port partners. These headers are already present
in the ChromeOS EC codebase. [1]

[1] https://source.chromium.org/chromium/chromiumos/platform/ec/+/main:include/ec_commands.h

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 include/linux/platform_data/cros_ec_commands.h | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index b9c4a3964247..ec327638c6eb 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -5862,6 +5862,7 @@ enum tcpc_cc_polarity {
 #define PD_STATUS_EVENT_MUX_1_SET_DONE		BIT(5)
 #define PD_STATUS_EVENT_VDM_REQ_REPLY		BIT(6)
 #define PD_STATUS_EVENT_VDM_REQ_FAILED		BIT(7)
+#define PD_STATUS_EVENT_VDM_ATTENTION			BIT(8)
 
 struct ec_params_typec_status {
 	uint8_t port;
@@ -5906,7 +5907,8 @@ struct ec_response_typec_status {
 } __ec_align1;
 
 /*
- * Gather the response to the most recent VDM REQ from the AP
+ * Gather the response to the most recent VDM REQ from the AP, as well
+ * as popping the oldest VDM:Attention from the DPM queue
  */
 #define EC_CMD_TYPEC_VDM_RESPONSE 0x013C
 
@@ -5919,10 +5921,18 @@ struct ec_response_typec_vdm_response {
 	uint8_t vdm_data_objects;
 	/* Partner to address - see enum typec_partner_type */
 	uint8_t partner_type;
-	/* Reserved */
-	uint16_t reserved;
+	/* enum ec_status describing VDM response */
+	uint16_t vdm_response_err;
 	/* VDM data, including VDM header */
 	uint32_t vdm_response[VDO_MAX_SIZE];
+	/* Number of 32-bit Attention fields filled in */
+	uint8_t vdm_attention_objects;
+	/* Number of remaining messages to consume */
+	uint8_t vdm_attention_left;
+	/* Reserved */
+	uint16_t reserved1;
+	/* VDM:Attention contents */
+	uint32_t vdm_attention[2];
 } __ec_align1;
 
 #undef VDO_MAX_SIZE
-- 
2.39.1.456.gfc5497dd1b-goog

