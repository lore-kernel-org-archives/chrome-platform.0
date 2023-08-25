Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5ED7E0
	for <chrome-platform@lists.linux.dev>; Fri, 25 Aug 2023 02:51:41 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-68becf931bfso432629b3a.0
        for <chrome-platform@lists.linux.dev>; Thu, 24 Aug 2023 19:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692931901; x=1693536701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UoorNgyABvybX2N9IoeEyWhrUT8xIewGPwdORVnknF0=;
        b=K8Lf4oK6ktUjrkQ68iwm6vPV8GIRczhwBm429iWOBzINCynZyca6b3meAALHmNhsiT
         3xLO4pWxeMBDLLiMC7ZL5vSuU6Vc8ZIO/0pLW/bgsZLRPutSUL22aw/VMbxJOH5bDy1V
         4hOnKpX5ZVIHfNMu7KTDTPkHuscv4C2QUNsIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692931901; x=1693536701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UoorNgyABvybX2N9IoeEyWhrUT8xIewGPwdORVnknF0=;
        b=Kg33CRoSMAA7OtGMN2NTdRqnIzKbEW7XpmFkyyjRwyBkdnr9dNz/ijWf3+BCTO+S7S
         i0Xd3yOthVuQv5EJiAJtLn6kPRHKXzqEN1eiS54D/M/4TCwOK9n2puj9aaAygY6P1hzt
         Hru+HN2WPnqdFDb4UTqsfmirwzoT0RFJM8Rx3FhDzLQcYiXrbNvqjLYg8G2f4lOgfwNw
         Ta31d1+ZqYgZ9YTRaSG4ruQL7gj7ZjhszIfQiptfpoOX0wpM4ZM/uAVHstR7cPid8H1e
         js9uiVU3gujHKsKyZnddeq+dBO2D1FHJtXWpMHTnx2DsbHF30Awyb2STDf2IQ5q8FLgV
         qeUQ==
X-Gm-Message-State: AOJu0YxQ7LqP+lW2P63GamS6Fb2ODsDSnbzLGFOObKv33GJaRCucSLMm
	T/uuLGBGYApyySg6hrW8FrCSTw==
X-Google-Smtp-Source: AGHT+IHJEWkbTkPNvjUmAuW8N3dHFgd6FLUeujMwWF6UFo7ranfDCfQ0KEffXNcO3qtYPsIntNy+Zg==
X-Received: by 2002:a05:6a20:4910:b0:141:d54e:a90a with SMTP id ft16-20020a056a20491000b00141d54ea90amr13229510pzb.56.1692931901197;
        Thu, 24 Aug 2023 19:51:41 -0700 (PDT)
Received: from rekanorman3.syd.corp.google.com ([2401:fa00:9:14:9fe1:d4b1:42cc:882f])
        by smtp.gmail.com with ESMTPSA id q10-20020a170902a3ca00b001bb0eebd90asm420847plb.245.2023.08.24.19.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 19:51:40 -0700 (PDT)
From: Reka Norman <rekanorman@chromium.org>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Daisuke Nojiri <dnojiri@chromium.org>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Stefan Adolfsson <sadolfsson@google.com>,
	Reka Norman <rekanorman@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 5/9] media: cros-ec-cec: Support multiple ports in MKBP cec_events
Date: Fri, 25 Aug 2023 12:43:58 +1000
Message-ID: <20230825024735.1443836-6-rekanorman@chromium.org>
X-Mailer: git-send-email 2.42.0.rc2.253.gd59a3bf2b4-goog
In-Reply-To: <20230825024735.1443836-1-rekanorman@chromium.org>
References: <20230825024735.1443836-1-rekanorman@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the top four bits of the cec_events MKBP event to store the port
number.

Signed-off-by: Reka Norman <rekanorman@chromium.org>
---

Changes in v2:
- Make port_num unsigned in handle_cec_event

 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 13 +++++++++++--
 include/linux/platform_data/cros_ec_commands.h   | 10 ++++++++++
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index d674a432dfdd..18f78b7e034a 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -77,8 +77,17 @@ static void handle_cec_message(struct cros_ec_cec *cros_ec_cec)
 static void handle_cec_event(struct cros_ec_cec *cros_ec_cec)
 {
 	struct cros_ec_device *cros_ec = cros_ec_cec->cros_ec;
-	uint32_t events = cros_ec->event_data.data.cec_events;
-	struct cros_ec_cec_port *port = cros_ec_cec->ports[CEC_PORT];
+	uint32_t cec_events = cros_ec->event_data.data.cec_events;
+	uint32_t port_num = EC_MKBP_EVENT_CEC_GET_PORT(cec_events);
+	uint32_t events = EC_MKBP_EVENT_CEC_GET_EVENTS(cec_events);
+	struct cros_ec_cec_port *port;
+
+	if (port_num >= cros_ec_cec->num_ports) {
+		dev_err(cros_ec->dev,
+			"received CEC event for invalid port %d\n", port_num);
+		return;
+	}
+	port = cros_ec_cec->ports[port_num];
 
 	if (events & EC_MKBP_CEC_SEND_OK)
 		cec_transmit_attempt_done(port->adap, CEC_TX_STATUS_OK);
diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 9a0c6e28f370..b7e8573a8a49 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -4440,6 +4440,16 @@ struct ec_response_i2c_passthru_protect {
 
 #define MAX_CEC_MSG_LEN 16
 
+/*
+ * Helper macros for packing/unpacking cec_events.
+ * bits[27:0] : bitmask of events from enum mkbp_cec_event
+ * bits[31:28]: port number
+ */
+#define EC_MKBP_EVENT_CEC_PACK(events, port) \
+		(((events) & GENMASK(27, 0)) | (((port) & 0xf) << 28))
+#define EC_MKBP_EVENT_CEC_GET_EVENTS(event) ((event) & GENMASK(27, 0))
+#define EC_MKBP_EVENT_CEC_GET_PORT(event) (((event) >> 28) & 0xf)
+
 /* CEC message from the AP to be written on the CEC bus */
 #define EC_CMD_CEC_WRITE_MSG 0x00B8
 
-- 
2.42.0.rc2.253.gd59a3bf2b4-goog

