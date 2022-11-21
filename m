Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C30EC15
	for <chrome-platform@lists.linux.dev>; Mon, 21 Nov 2022 20:13:59 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id q96-20020a17090a1b6900b00218b8f9035cso3160080pjq.5
        for <chrome-platform@lists.linux.dev>; Mon, 21 Nov 2022 12:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+miEWjJAtnDGZKESGC2K13aQrBJTCpBeMrGNcOOuCUo=;
        b=h72e6p/FkTIdXBoJPIHLPAwYiX0sUKoIYNfLigO8S8y3c5Hmp3ItR+mjG8pawk/swt
         0rYb7PZGEFIBlW4wV8boeOS0y/Tpq1t9tBOauGJCVvcBRUZtsZJm2m7Jbl96APMGvc4b
         5XGoN2yZR2a/iKRPfuWT02FW/jZppd6CW53xY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+miEWjJAtnDGZKESGC2K13aQrBJTCpBeMrGNcOOuCUo=;
        b=apsdSHjCllEMO1JGa18hUhhO8YzMLk9F83HgrpoRMgZvJAEMc0TllaEjHP1vJfRI9j
         TgBoMjliExNzfI80nt7lI8kwhe+zN4L3KPHbc3ZRYuqlTX18CGq1466N5CFjkY4lSXtP
         ZShyjRllBETNmZA6Uky1kg8FWgy23y9MYF872ffNHKnQ3wvBhwtOF6IdiG0LnGcEccv0
         KNQMtamgVpDvnwvhghezcqDgLXYf8NlhoptgGyKvTtKL2f6EHpTXHE/UWN81KN/YoruZ
         Sxe6PfWQJMd2b7GLjYZij5CxJzwFgnFrtmW2vbIuT1IZRjSwWMX4iUtlGBn2WMWTe4js
         npmA==
X-Gm-Message-State: ANoB5ploq6enwXDSRhqCA0triVu6SU3bzHmCMDIa4/cMDSWdsBdTtxBK
	xZPLXrvy6Cd4Okn6phz8+oAlFQ==
X-Google-Smtp-Source: AA0mqf4J2H1pH7NHOK+06xGanIwq/IsfLuMtmvKrdt5ShfRBmYOT3EPi6ihcIuBrDAvRaEvm7bUiNw==
X-Received: by 2002:a17:902:f609:b0:178:2a08:2e7f with SMTP id n9-20020a170902f60900b001782a082e7fmr1199139plg.128.1669061639225;
        Mon, 21 Nov 2022 12:13:59 -0800 (PST)
Received: from pmalani.c.googlers.com.com (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id h8-20020a170902f70800b001822121c45asm10178507plo.28.2022.11.21.12.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 12:13:58 -0800 (PST)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>
Subject: [PATCH 2/2] platform/chrome: cros_ec_typec: Set parent of partner PD object
Date: Mon, 21 Nov 2022 20:13:36 +0000
Message-Id: <20221121201337.2772216-3-pmalani@chromium.org>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
In-Reply-To: <20221121201337.2772216-1-pmalani@chromium.org>
References: <20221121201337.2772216-1-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to tell what Type-C device a PD object belongs to, its parent
needs to be set. Set the parent appropriately for PD objects which are
created for connected Type-C partners.

Cc: Benson Leung <bleung@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 2a7ff14dc37e..a1cc23b86f3c 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -968,7 +968,7 @@ static void cros_typec_register_partner_pdos(struct cros_typec_data *typec,
 	if (!resp->source_cap_count && !resp->sink_cap_count)
 		return;
 
-	port->partner_pd = usb_power_delivery_register(NULL, &desc);
+	port->partner_pd = usb_power_delivery_register(typec_partner_to_dev(port->partner), &desc);
 	if (IS_ERR(port->partner_pd)) {
 		dev_warn(typec->dev, "Failed to register partner PD device, port: %d\n", port_num);
 		return;
-- 
2.38.1.584.g0f3c55d4c2-goog

