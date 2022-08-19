Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB7E4A09
	for <chrome-platform@lists.linux.dev>; Fri, 19 Aug 2022 19:08:32 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id u22so4876537plq.12
        for <chrome-platform@lists.linux.dev>; Fri, 19 Aug 2022 12:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=LRNQZAQfuVWPtn0ySqLWsoQsRuvJYWivZoqggybL5d4=;
        b=OJYjgn5Ecua8yljlsSDpa51lK5T4ff4foNJdIiSLf5dNe6a6frhKr7dxS9Bbj8nSoo
         HnirEUD7kvbmjSOXMm+vZvJWj9rRAvvR6hfXpQowjzOFLjXwmEz0eKisYWgGc6noO/v0
         yHP6AClXhnWajIVHARTyTmYCabfyodtv1lpm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=LRNQZAQfuVWPtn0ySqLWsoQsRuvJYWivZoqggybL5d4=;
        b=ZsPMC6wt0W22wm/V24S4VfySyyXm776d1mUIm7xKQidnNRyedF2QcridaCzf0hXqAz
         Jf3KrfCG4q4Sllbn+26wtdqSXKilvdpbFdd6WU3Alnrx+LP1W40AhirAk4KEWvbRUPA6
         YwWhsy3pYMLX0bZUJas+7VISR//kgUX6MbAZEuUV9X1bG4xDekofWgdcAofb6OoAmKaX
         7sM0L/gwXBuarxpYHf+h2YMCUqxtfPaoVH+0yzQcOL675OptPWBiweEPWdjcYDLQRviE
         oLU0gwiRLzt2JyBWyzwdcP7bBihuesBbi5Y0YE+jfoXtAawEv0mvvMsiooKUMpaIJ0y7
         m4Qw==
X-Gm-Message-State: ACgBeo2/VCwRLhbtCgGyTiTDjcOiOBIzfS5fJlY4eFipTz4ByhE6//Ui
	Mqaw6OD9IXt0/qbiKxLG02yeNQ==
X-Google-Smtp-Source: AA6agR5y8NDxG372IwiHy3L/WeoVZMiJNDnSzObCzFMnj9kywQ5kojSHeAn2uZkfOggsjIO+U3I8Zw==
X-Received: by 2002:a17:903:494:b0:172:9823:e355 with SMTP id jj20-20020a170903049400b001729823e355mr8608235plb.75.1660936112240;
        Fri, 19 Aug 2022 12:08:32 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (137.22.168.34.bc.googleusercontent.com. [34.168.22.137])
        by smtp.gmail.com with ESMTPSA id b14-20020a170903228e00b00172a567d910sm3499775plh.289.2022.08.19.12.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 12:08:32 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: bleung@chromium.org,
	Prashant Malani <pmalani@chromium.org>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Guenter Roeck <groeck@chromium.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH 3/4] platform/chrome: cros_ec_typec: Stash port driver info
Date: Fri, 19 Aug 2022 19:08:04 +0000
Message-Id: <20220819190807.1275937-4-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
In-Reply-To: <20220819190807.1275937-1-pmalani@chromium.org>
References: <20220819190807.1275937-1-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Stash port number and a pointer to the driver-specific struct in the
local Type-C port struct.

These can be useful to the port driver to figure out how to communicate
with the ChromeOS EC when an altmode driver related callback is invoked
from the Type-C class code.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index dc5722db2066..7daf4207c11e 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -44,6 +44,7 @@ struct cros_typec_altmode_node {
 /* Per port data. */
 struct cros_typec_port {
 	struct typec_port *port;
+	int port_num;
 	/* Initial capabilities for the port. */
 	struct typec_capability caps;
 	struct typec_partner *partner;
@@ -71,6 +72,8 @@ struct cros_typec_port {
 	struct ec_response_typec_discovery *disc_data;
 	struct list_head partner_mode_list;
 	struct list_head plug_mode_list;
+
+	struct cros_typec_data *typec_data;
 };
 
 /* Platform-specific data for the Chrome OS EC Type C controller. */
@@ -368,6 +371,8 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 			goto unregister_ports;
 		}
 
+		cros_port->port_num = port_num;
+		cros_port->typec_data = typec;
 		typec->ports[port_num] = cros_port;
 		cap = &cros_port->caps;
 
-- 
2.37.1.595.g718a3a8f04-goog

