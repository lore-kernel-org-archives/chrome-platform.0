Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EA2A2A
	for <chrome-platform@lists.linux.dev>; Wed, 28 Dec 2022 01:00:01 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id 78so9699122pgb.8
        for <chrome-platform@lists.linux.dev>; Tue, 27 Dec 2022 17:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bl9lz1LdkOsI7rrZ+m78RYNdWxgzzlfo1gzTHpgM0to=;
        b=LEO2YJhja0QYiJBr0E4k0KdFonbevTkEqWkdTH1/UlaDcZ4FMjgHlEs4sYaltUvvup
         AflcM7I7fNmcBvbsXaJeuog+gvdLuVQPH/RgNR7FcmXGWF0sugC4nqSAY72+ztwvisM1
         9CN5EhlD8jf6mZfTgEiKHhHINhVwFJJJTAIfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bl9lz1LdkOsI7rrZ+m78RYNdWxgzzlfo1gzTHpgM0to=;
        b=TXg9BQBLu9Z0r+4MT/HcbXRM0dlRfuQzPaP2YISdWZZ8RgK39iFEsq/ZQQV0CjKoGR
         3jJjXjEyjLiDMT04u3I3LjqRS8Q1HaF8Ie/F09ILw67E15+IsZ/JeuN258qycExVv8nP
         5YiqVUKE24vD8JSyvBkdkrbqhY+sIzhpuASYto5uyC03iyjsa0eJZlqcZUvYA7rZ13Tv
         6l3r9jR6NSaxnzaVKHPwuk7OjExTdym04wPqMsn3CYf1WL2BfDCGDk4z1VJQSITNehqn
         oMvR+z5wVBkVyeabMfvYuY3OohI4o6cgFqflKz8JnP0kM7Nu5oO5IEaQcliyiIiRomCW
         3dgg==
X-Gm-Message-State: AFqh2kr043z98sS4Rt36gEnsbPGQUKkcZ1NfWjmFIO0aHKsT0u2P10Zv
	/koIi5prqsTmrcor1VqNRUiwcA==
X-Google-Smtp-Source: AMrXdXtAppN52JChY/7t8akMZ+vaDIVh1t73ZtrT//8uxQ3LN5WN4hTEtGMrmbsqO/sRMnFMX5IfsA==
X-Received: by 2002:a62:6143:0:b0:577:3546:d7be with SMTP id v64-20020a626143000000b005773546d7bemr24695903pfb.30.1672189201437;
        Tue, 27 Dec 2022 17:00:01 -0800 (PST)
Received: from pmalani.c.googlers.com.com (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id 68-20020a621947000000b00580e679dcf2sm6045566pfz.157.2022.12.27.17.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 17:00:01 -0800 (PST)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: heikki.krogerus@linux.intel.com,
	Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	"Dustin L. Howett" <dustin@howett.net>,
	Evan Green <evgreen@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Lee Jones <lee.jones@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Xiang wangx <wangxiang@cdjrlc.com>
Subject: [PATCH 03/10] platform/chrome: cros_ec_typec: Stash port driver info
Date: Wed, 28 Dec 2022 00:45:06 +0000
Message-Id: <20221228004648.793339-4-pmalani@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
In-Reply-To: <20221228004648.793339-1-pmalani@chromium.org>
References: <20221228004648.793339-1-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Stash port number and a pointer to the driver-specific struct in the
local typec port struct.

These can be useful to the port driver to figure out how to communicate
with the Chrome EC when an altmode-driver related callback is invoked
from the Type-C class code.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 001b0de95a46..bc8dc8bd90b3 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -45,6 +45,7 @@ struct cros_typec_altmode_node {
 /* Per port data. */
 struct cros_typec_port {
 	struct typec_port *port;
+	int port_num;
 	/* Initial capabilities for the port. */
 	struct typec_capability caps;
 	struct typec_partner *partner;
@@ -78,6 +79,8 @@ struct cros_typec_port {
 	struct usb_power_delivery *partner_pd;
 	struct usb_power_delivery_capabilities *partner_src_caps;
 	struct usb_power_delivery_capabilities *partner_sink_caps;
+
+	struct cros_typec_data *typec_data;
 };
 
 /* Platform-specific data for the Chrome OS EC Type C controller. */
@@ -408,6 +411,8 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 			goto unregister_ports;
 		}
 
+		cros_port->port_num = port_num;
+		cros_port->typec_data = typec;
 		typec->ports[port_num] = cros_port;
 		cap = &cros_port->caps;
 
-- 
2.39.0.314.g84b9a713c41-goog

