Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2641D368277
	for <chrome-platform@lists.linux.dev>; Mon, 19 Jan 2026 13:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768828744; cv=none; b=fz9OsBBWOmmte55PJuYm7WQrcZnzkzv7Y6eNtIV0kTgAHIkkHyZdmCbhl/0zfVUSt64JUU681vM/zI9k9AV0JBQltyU0qe7XGr4IhLA+Z6qosPgGmRRONaq6hLhcuic2oh9jvj9rXTOhPhqGKqdxFWssDq1o0q5O3LyZFml9ySo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768828744; c=relaxed/simple;
	bh=zFB/wu9zF/WPehhEPtbWl8UOJvP9spgPqLlItDsGdnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fHWNRhg7EXGl3huhILrVhn+dVXGoiamDXhZNGukmbMxCISz+FtUfpeC/ZOBMDqhzaZAih9YjefBmSVYb5dRLFmz6916/5RjdaUvgO+5KFcxtH8VQRmVf9lYfdN1s85nv9SxT77xLnXP+sSrChnL11cidY4MYvStO3S2qA4xqZw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G2QmmUqi; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G2QmmUqi"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b872de50c91so671371466b.2
        for <chrome-platform@lists.linux.dev>; Mon, 19 Jan 2026 05:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768828737; x=1769433537; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Jj9JdVBqHdqB0HXN619HZiSF0v0HIUhhUTLIyvICbg=;
        b=G2QmmUqiWTw6lemjCsIFq2idLXOcLiMF4IiUWPvY5cN6cofq+ymR8efV4IHLrONtlZ
         jOYJrcyRpMdi/RMTklKXXIIAzuI2pmIa8HlPEcVFqarXpnzRJ6VNeQWgC3d5bODYO4+W
         5uEaUxfpOXRJ+ClvQ4AFNIRc2a1P/7CY6fRuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768828737; x=1769433537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Jj9JdVBqHdqB0HXN619HZiSF0v0HIUhhUTLIyvICbg=;
        b=il5Ky2gtg+/IQYYXSt5vrImXeYnCnN5Hfyu7OxPldYz2OukKfe+Auzov69X37DfT5r
         5VsVcszskVLmwnWwpeoCnsehQ3vnJ0Y+stPgcUWwqon2qf8Kqb19T7J/2VLZ4C42awd0
         +IufpSGJz5du9a3nQsR5EpuLY54z7C3jX8p1W/CX+YfJPZdlLQ9NOV0TgZUrn4xTOKLb
         hEO23FxeXNCY+HspI0F+wGTUqvqLcRoJcx+Yl8exT5joF5VK+j1+eMEclkhwxBn2WxzM
         Jgh5kziWxD3TZLmBiBRZuhVaRoFqwLugkJ8yXQj6vZh6IXLx3U/q7sfUTNjzu2g8fI3n
         tmKA==
X-Forwarded-Encrypted: i=1; AJvYcCXQTDsEcMsGd6xtMzQqqgVgWXBfIS4yz9jshdCxEnmj9DMVUBxqB+1watK8Uhb/z3aJJSh5bUaxJauoron/Ro4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZChIOhJcaK538MImj/WHU37JcSTtV+8RwlvTLunam6irMI7/V
	nasI0wj1px9lFQbj6J1XW+RlC9sDafFKrMbSfAckAba3vjKO517RNfXfAbF91bmWsg==
X-Gm-Gg: AY/fxX7FwNFWxZOuMt9Az6UgJR9GmS1kCab3korEr6RDJPKemECNORawwc43OZGuZ3n
	NKLf3YXM6Vo4+a5uVWjUu/evXX2/VZ7H+vMyNd8ELjW/tn/C71ljgjsin1cCtLerXXK3sxDjy2F
	najD0Bf5zQefl62KqamFrB25ll4uVkb5AKEK7GgAYz1Cz8Njv7QPNPMR/LYHDFXEQ259i+p9zw7
	9u52k0HEYSkRW7sZAOdLqGUtlmi6+wEywfmHHruPI8WCgdYoKwRDvUe99LuptiQQ9gvXPlZfXkG
	/Xuqwvb5fryKAEjkTy9PRLULNbVIEDdKjCMtFJ7x5BSmnfWiJeI4UImPNIhVUCnWDSNj0bta+Mi
	fo35mdJqPdZ9iXXB4AEcZ8VWgcJpXJEeBb9NF0eErT56DDUsOwL/QfBp4QowfPWAXOLE3CYa51Q
	PQj6AwKOiXzMTKP3U2DVY+Vq+xLJ+NGuEfr30ALR+7iGIDGq7wrvVuizxTuzKbSNujcdZ18KSbO
	oaBQp66
X-Received: by 2002:a17:907:8692:b0:b87:6ce:1269 with SMTP id a640c23a62f3a-b8792de8e4cmr919137966b.19.1768828737282;
        Mon, 19 Jan 2026 05:18:57 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9a14sm1078801866b.45.2026.01.19.05.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 05:18:56 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v5 7/7] usb: typec: ucsi: Enforce mode selection for cros_ec_ucsi
Date: Mon, 19 Jan 2026 13:18:24 +0000
Message-ID: <20260119131824.2529334-8-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260119131824.2529334-1-akuchynski@chromium.org>
References: <20260119131824.2529334-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mode selection sequence is initiated by the driver after all partner
alternate modes have been successfully registered.
When a partner is disconnected, the driver also stops the mode selection
process and releases resources via `typec_mode_selection_delete`.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
Changes in V5:
- Use the no_mode_control field instead of
  con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE

 drivers/usb/typec/ucsi/cros_ec_ucsi.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
index eed2a7d0ebc63..6bca2dce211cd 100644
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
@@ -134,6 +140,20 @@ static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd, u32 *cci,
 	return ret;
 }
 
+static void cros_ucsi_add_partner_altmodes(struct ucsi_connector *con)
+{
+	if (!con->typec_cap.no_mode_control)
+		typec_mode_selection_start(con->partner,
+					   mode_selection_delay,
+					   mode_selection_timeout);
+}
+
+static void cros_ucsi_remove_partner_altmodes(struct ucsi_connector *con)
+{
+	if (!con->typec_cap.no_mode_control)
+		typec_mode_selection_delete(con->partner);
+}
+
 static const struct ucsi_operations cros_ucsi_ops = {
 	.read_version = cros_ucsi_read_version,
 	.read_cci = cros_ucsi_read_cci,
@@ -141,6 +161,8 @@ static const struct ucsi_operations cros_ucsi_ops = {
 	.read_message_in = cros_ucsi_read_message_in,
 	.async_control = cros_ucsi_async_control,
 	.sync_control = cros_ucsi_sync_control,
+	.add_partner_altmodes = cros_ucsi_add_partner_altmodes,
+	.remove_partner_altmodes = cros_ucsi_remove_partner_altmodes,
 };
 
 static void cros_ucsi_work(struct work_struct *work)
-- 
2.52.0.457.g6b5491de43-goog

