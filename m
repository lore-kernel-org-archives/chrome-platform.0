Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D603130E0D9
	for <chrome-platform@lists.linux.dev>; Mon,  1 Dec 2025 12:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764591987; cv=none; b=XbuwpXfmcJL4Q+W1ZenhvuUpWkk0e8NQPZa3lH63qIRUlAtF06oWYAdip0gLCc8Ct4Fb6VkPJCW8imhZ+LrwW95cTP6CAja0lYVDGx7/80rPScRRlb3iewnNqZlW+0T0CPV3usYe4dY78m9zGKAb0MYns21EUqieiPILhgIjB6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764591987; c=relaxed/simple;
	bh=EjyjRDZ14jo9PQ2gU5QebdkTOWDTQZAHb1P+d2FyXxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uChlqZRgTSNmWMoB9JOircHA+M0AmD9FESYuQJGs3VIyFU5h29c5Zk2JW+qfTlnF9zI+kB3q35djQCzm4MRWZ9b6uWuC8OTkYjfgSx6hGAHZMxf+d1D/tvi8O/VchPe64/mFPu2LCcIi4SzSrNA2wauuK1PHllYzRPU0LYzJGAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mcimcMGE; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mcimcMGE"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b728a43e410so704013966b.1
        for <chrome-platform@lists.linux.dev>; Mon, 01 Dec 2025 04:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764591983; x=1765196783; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3siUDoeibOS44ZiVJ7r4alLl9iFlDQ+/+PWsVjixhQ=;
        b=mcimcMGE6/3BZhShF6P3Q9K9ucCCJZ0kLXxLVcSC7d8xnQKpQrl93tU01Ev7othyCM
         nmkxl9suL44DGbJKfOvfiglGZApWmZUdxo1/ia+AKgjKsy4qugzMMRUfO8oB5k7KHgsi
         PuUb9RjNClNn3RHTlviiGh69Bsmqf7QAWkM4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764591983; x=1765196783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w3siUDoeibOS44ZiVJ7r4alLl9iFlDQ+/+PWsVjixhQ=;
        b=KgXOTCCTbgo9G3nTwcr600MuLnesHff/fkd4XlH5iuauAl7MpXOky5E95gD4A9Qo4g
         SzXoT063XJkhyG7y8Zw9AtPSWQQp92kfnruYm3SMf051CzNH4Tv6gpW2TKDU2QiyiBk8
         GYcspDcr4iN9LrtCKKSSDpbPR4zNndWTh1CIcyOfPYt+qMXNuB0dS69CToi29/RdSZuP
         QA1tvNGC3vjtHEa3dDfm3p7xW/NA7d+MCmKTt+cDNIjcBOXSloA4GIQBh9THf03E7OON
         ltVfAxbsFQH8fz66nvBqANtkHbYWx35mqMWdL4fEexpA9X8YAY7VMowfNmWTHkLvIa5q
         H+Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWLC4tQ1qAWMQreeXv+4kq6oBFfMCt/21ETdV8OiAX0+atjsnXQHjPwE7mcD3AX8HWIjGqqWDNYMo/NZlLuRHY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/Y/+h/DWim+4+RZybToF9ogdeO3EJA5g0Ic4tAsiH6n1xjWCR
	TXURgJOFZ3vyosXBZ8t2Tk2FMLTJsaNlXoGy1ETDtomeJza6dz/x0S8sA2c/JmF9LA==
X-Gm-Gg: ASbGncuCjX2vIY9q7l2FP54lXsNCmVq4tlYpZ3JDQE56Pu8JTNSEyg7I+bcjO/sS/WH
	Cepy73blti3ui1pXpWYUB6wXceoFAO8A3Agp8006Vkrh9CRjH7obcKJsqZ1MweQ7FgjWXtKUPN1
	IcI5MsWtOBGt7JWXssxfsLRuGSfiaJxNLggLrdGfx+xEEmn519/8gp5WJyCvkEPEhi0lrwck9Zl
	UyswxD1zQTQjx4VWkJIwyGTxdiwtIaKOlYkKDR3ufUcuK69pKOkXCgl5QU3fOh3vINliVdZzCjW
	3JK1m6xArVemu6uoZSGVTGso7+mHn8FtR4aUOX1dKqScSyDroFw3hJIKQC6Z3knGh8lGUa8B3jd
	13lyD1xln2IpYqQ0oOGxSNdIPNdfIMBVnA7LfiP8MlDBenBqUFuEbhw8Kw8+mZNuu844kupc8VT
	Qrl97f5f/nlePm+gCn2R1Ymoj9OZBF4MkeJVEZChqu/sm2085/eGUl++ilUx4JYZlo5TM8nWDhA
	W93+g6adsk=
X-Google-Smtp-Source: AGHT+IGdIbQA5fN2pjwFCGt2uQXmBVTAC2xTd2yjO+gh50cAVKF7tAIvotcRnv9TG3dRpl06Kz7Dmw==
X-Received: by 2002:a17:906:fe08:b0:b72:a5bd:c585 with SMTP id a640c23a62f3a-b7671732667mr4428434466b.46.1764591983127;
        Mon, 01 Dec 2025 04:26:23 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (218.127.147.34.bc.googleusercontent.com. [34.147.127.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f519e331sm1229049266b.24.2025.12.01.04.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 04:26:22 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Pavan Holla <pholla@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH RFC 5/8] usb: typec: ucsi: Enforce mode selection for cros_ec_ucsi
Date: Mon,  1 Dec 2025 12:26:01 +0000
Message-ID: <20251201122604.1268071-6-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.158.g65b55ccf14-goog
In-Reply-To: <20251201122604.1268071-1-akuchynski@chromium.org>
References: <20251201122604.1268071-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mode selection sequence is initiated by the driver after all partner
alternate modes have been successfully registered.
To prevent the Power Delivery Controller (PDC) from activating alternate
modes, the driver disables all alternate modes on the connector:
- During the connector registration
- Upon partner disconnection
When a partner is disconnected, the driver also stops the mode selection
process and releases resources via `typec_mode_selection_delete`.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/cros_ec_ucsi.c | 44 +++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
index d753f2188e25..988a159ed778 100644
--- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
+++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/wait.h>
+#include <linux/usb/typec_altmode.h>
 
 #include "ucsi.h"
 
@@ -33,6 +34,11 @@
 /* Number of times to attempt recovery from a write timeout before giving up. */
 #define WRITE_TMO_CTR_MAX	5
 
+/* Delay between mode entry/exit attempts, ms */
+static const unsigned int mode_selection_delay = 1000;
+/* Timeout for a mode entry attempt, ms */
+static const unsigned int mode_selection_timeout = 4000;
+
 struct cros_ucsi_data {
 	struct device *dev;
 	struct ucsi *ucsi;
@@ -133,6 +139,41 @@ static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd, u32 *cci)
 	return ret;
 }
 
+static void cros_ucsi_disable_altmodes(struct ucsi_connector *con)
+{
+	struct cros_ucsi_data *udata = ucsi_get_drvdata(con->ucsi);
+	u64 command = UCSI_SET_NEW_CAM | UCSI_CONNECTOR_NUMBER(con->num) |
+				UCSI_SET_NEW_CAM_SET_AM((u64)0xFF);
+	int ret;
+
+	con->ucsi->message_in_size = 0;
+	ret = ucsi_send_command(con->ucsi, command);
+	if (ret < 0)
+		dev_err(udata->dev,
+			"Unable to disable alt-modes on port %d\n", con->num);
+}
+
+static void cros_ucsi_update_connector(struct ucsi_connector *con)
+{
+	if (con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE)
+		cros_ucsi_disable_altmodes(con);
+}
+
+static void cros_ucsi_add_partner_altmodes(struct ucsi_connector *con)
+{
+	if (con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE)
+		typec_mode_selection_start(con->partner,
+				mode_selection_delay, mode_selection_timeout);
+}
+
+static void cros_ucsi_remove_partner_altmodes(struct ucsi_connector *con)
+{
+	if (con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE) {
+		typec_mode_selection_delete(con->partner);
+		cros_ucsi_disable_altmodes(con);
+	}
+}
+
 static const struct ucsi_operations cros_ucsi_ops = {
 	.read_version = cros_ucsi_read_version,
 	.read_cci = cros_ucsi_read_cci,
@@ -140,6 +181,9 @@ static const struct ucsi_operations cros_ucsi_ops = {
 	.read_message_in = cros_ucsi_read_message_in,
 	.async_control = cros_ucsi_async_control,
 	.sync_control = cros_ucsi_sync_control,
+	.update_connector = cros_ucsi_update_connector,
+	.add_partner_altmodes = cros_ucsi_add_partner_altmodes,
+	.remove_partner_altmodes = cros_ucsi_remove_partner_altmodes,
 };
 
 static void cros_ucsi_work(struct work_struct *work)
-- 
2.52.0.158.g65b55ccf14-goog

