Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9DE185D
	for <chrome-platform@lists.linux.dev>; Mon, 14 Aug 2023 04:35:52 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1bdbbede5d4so21245725ad.2
        for <chrome-platform@lists.linux.dev>; Sun, 13 Aug 2023 21:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691987752; x=1692592552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itIjiisrKDd0dEJkr9u7QlSUsM4Bsnb9Jzz0yBh6Gm4=;
        b=Xck3Z5OnJrMbtyD9wFRDW/GmpGf9wAmSvtvm5NQ2xVthLhnRYzQuocKe4GukWXcu0b
         MMoucWrJSb2GhXbqcMLVLtlIBkbvLwycQ16Li2XkSn8YTMF/ecRkjn9rMN/fl4Rj6YqQ
         xi4GlIxY+9jFma3qoicyW/h7wEzrASoM/IFxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691987752; x=1692592552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=itIjiisrKDd0dEJkr9u7QlSUsM4Bsnb9Jzz0yBh6Gm4=;
        b=NYiG8a0O3ynLtWjzOyw/Embd8CbzaAMWm7a1UNfNCX7O2vm0NC58XBdyH74Ny6vKQj
         Hig+/89xlRmUNTss6IftNepJGR7ituJZQ/EgXjyd4M8E5DgAZ6LSo5gmUhBe0ny0B7iO
         64czsd2UGbXczn4ydBihabq6bDRWHeVTknw0FFOhsJnv6j1FgCuSCnhFgy2Qz+zaATsE
         y/OBlxy2PNFCxD9CUauXG0h7cLmtXXvqXsLGgktTKwXYEl+wAQd3iDJH7I7wjMg9c5T2
         sTrud4jPI90yOmCERTiwbaFBv7t2SWx0R3GdRyDOp77HYtZhSUkgCMaDM+HIIUECDYj3
         nzdA==
X-Gm-Message-State: AOJu0Yxog0gdNzTGk4O4o9qrI3YlEc2DdZ3ObOvSU01utq4o4acp2XqM
	G2nbE3ZGHnqVJ+l/KZyid/NcoA==
X-Google-Smtp-Source: AGHT+IFna/y7uVLsE6ruMXik7aDZMg/YGKuA/YEcbhic+a5zZFTG734FNkYHqA7w/8MH8875Vy2ukQ==
X-Received: by 2002:a17:902:da85:b0:1bc:5b36:a2e8 with SMTP id j5-20020a170902da8500b001bc5b36a2e8mr11568693plx.34.1691987751762;
        Sun, 13 Aug 2023 21:35:51 -0700 (PDT)
Received: from rekanorman3.syd.corp.google.com ([2401:fa00:9:14:4ae6:d1a4:27c2:80ff])
        by smtp.gmail.com with ESMTPSA id ju17-20020a170903429100b001bdb0483e65sm6761865plb.265.2023.08.13.21.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 21:35:51 -0700 (PDT)
From: Reka Norman <rekanorman@chromium.org>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	Stefan Adolfsson <sadolfsson@google.com>,
	Reka Norman <rekanorman@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 3/9] media: cros-ec-cec: Support multiple ports in set/get host commands
Date: Mon, 14 Aug 2023 14:29:12 +1000
Message-ID: <20230814043140.1108917-4-rekanorman@chromium.org>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
In-Reply-To: <20230814043140.1108917-1-rekanorman@chromium.org>
References: <20230814043140.1108917-1-rekanorman@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reuse the top four bits of the cmd field to specify the port number.
The reason for doing this as opposed to adding a separate uint8_t field
is it avoids the need to add new versions of these commands. The change
is backwards compatible since these bits were previously always zero, so
the default behaviour is to always operate on port 0.

Signed-off-by: Reka Norman <rekanorman@chromium.org>
---

 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
 include/linux/platform_data/cros_ec_commands.h   | 8 ++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index d76a25ae0cf1..e969031e1e0e 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -118,6 +118,7 @@ static int cros_ec_cec_set_log_addr(struct cec_adapter *adap, u8 logical_addr)
 	struct cros_ec_device *cros_ec = cros_ec_cec->cros_ec;
 	struct ec_params_cec_set params = {
 		.cmd = CEC_CMD_LOGICAL_ADDRESS,
+		.port = port->port_num,
 		.val = logical_addr,
 	};
 	int ret;
@@ -162,6 +163,7 @@ static int cros_ec_cec_adap_enable(struct cec_adapter *adap, bool enable)
 	struct cros_ec_device *cros_ec = cros_ec_cec->cros_ec;
 	struct ec_params_cec_set params = {
 		.cmd = CEC_CMD_ENABLE,
+		.port = port->port_num,
 		.val = enable,
 	};
 	int ret;
diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index cb2ddd10a613..e8bb05db360f 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -4457,13 +4457,15 @@ struct ec_params_cec_write {
 /**
  * struct ec_params_cec_set - CEC parameters set
  * @cmd: parameter type, can be CEC_CMD_ENABLE or CEC_CMD_LOGICAL_ADDRESS
+ * @port: CEC port to set the parameter on
  * @val: in case cmd is CEC_CMD_ENABLE, this field can be 0 to disable CEC
  *	or 1 to enable CEC functionality, in case cmd is
  *	CEC_CMD_LOGICAL_ADDRESS, this field encodes the requested logical
  *	address between 0 and 15 or 0xff to unregister
  */
 struct ec_params_cec_set {
-	uint8_t cmd; /* enum cec_command */
+	uint8_t cmd : 4; /* enum cec_command */
+	uint8_t port : 4;
 	uint8_t val;
 } __ec_align1;
 
@@ -4473,9 +4475,11 @@ struct ec_params_cec_set {
 /**
  * struct ec_params_cec_get - CEC parameters get
  * @cmd: parameter type, can be CEC_CMD_ENABLE or CEC_CMD_LOGICAL_ADDRESS
+ * @port: CEC port to get the parameter on
  */
 struct ec_params_cec_get {
-	uint8_t cmd; /* enum cec_command */
+	uint8_t cmd : 4; /* enum cec_command */
+	uint8_t port : 4;
 } __ec_align1;
 
 /**
-- 
2.41.0.640.ga95def55d0-goog

