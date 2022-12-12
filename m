Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03FD6FD9
	for <chrome-platform@lists.linux.dev>; Mon, 12 Dec 2022 21:39:05 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id cg5so10210786qtb.12
        for <chrome-platform@lists.linux.dev>; Mon, 12 Dec 2022 13:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ffELf9QCePpNkmA9SAPHTlpHz3ybgd2eAH/oKDo0+I8=;
        b=LZ8PtqosW7Y7QlUmY6zM4LbmRdcyMNnyEyUDRpekxerbBKbTJH3J/Tq6Jjtb6cHVWI
         Lbjo38u457Pe9c1bzWk+tvJ5igO2XSUx7ECzVWEUwRAaR6S61InfS0RRDE2Z1sjX2nCq
         HlBviIJ27b6+LHt0ew2p+dok4F3Uq3pkzLB78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ffELf9QCePpNkmA9SAPHTlpHz3ybgd2eAH/oKDo0+I8=;
        b=GwdW4HMpIJGIyHVwdHcKfuL9WTZUpXais9FVJrBTCvEReKtIxqDTmSiPHAtWwpynVR
         u1ZoklCz7igRWETt2TJHSugqPDM4Fpq4932cQekGZgFXC4F60U+UbHHCv6EhQ7diGbdM
         nBzYCRyLNWgleDlDooWk4adiSbBLEIGj1Ep/CxLDb3nd/wnYM3HKZSHeQOvWlKTJSSmG
         pwCbSGFXuD2bEnKO4oJNwDLjJM0IXPCMf3IyPU4zQ8NgERkqbTl0ILW64ruYNKFXPAJn
         mRi4ZHSvjMZFrPnpWJkql1hF5Z6731v3fCy1Qn2NlT3BAMdoN0lX1H/Jw2kr89FifO0s
         vBnw==
X-Gm-Message-State: ANoB5pkEjs9t/JJepktXnUrOra7MjpCJiVNbl6olll/yERr5qDweo5Yo
	vF74T+F5m+M18O4MzRIfUj8imw==
X-Google-Smtp-Source: AA0mqf6/OESp8CG9m1MQzlFOnwK5AuQJ7XG9xPfLuM3qwWg+A7OsNzi3Fm+vPu458zhET97D7lqOdA==
X-Received: by 2002:ac8:4e31:0:b0:3a5:1caf:6886 with SMTP id d17-20020ac84e31000000b003a51caf6886mr21189906qtw.57.1670881144513;
        Mon, 12 Dec 2022 13:39:04 -0800 (PST)
Received: from grundler-glapstation.lan ([70.134.62.80])
        by smtp.gmail.com with ESMTPSA id s5-20020a05620a254500b006ec62032d3dsm6599107qko.30.2022.12.12.13.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 13:39:03 -0800 (PST)
From: Grant Grundler <grundler@chromium.org>
To: Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>,
	Sebastian Reichel <sre@kernel.org>,
	chrome-platform@lists.linux.dev,
	linux-pm@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Grant Grundler <grundler@chromium.org>
Subject: [PATCH] power: supply: cros_usbpd: reclassify "default case!" as debug
Date: Mon, 12 Dec 2022 13:38:57 -0800
Message-Id: <20221212213857.3636830-1-grundler@chromium.org>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This doesn't need to be printed every second as an error:
...
<3>[17438.628385] cros-usbpd-charger cros-usbpd-charger.3.auto: Port 1: default case!
<3>[17439.634176] cros-usbpd-charger cros-usbpd-charger.3.auto: Port 1: default case!
<3>[17440.640298] cros-usbpd-charger cros-usbpd-charger.3.auto: Port 1: default case!
...

Reduce priority from ERROR to DEBUG.

Signed-off-by: Grant Grundler <grundler@chromium.org>
---
 drivers/power/supply/cros_usbpd-charger.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/cros_usbpd-charger.c b/drivers/power/supply/cros_usbpd-charger.c
index cadb6a0c2cc7..b6c96376776a 100644
--- a/drivers/power/supply/cros_usbpd-charger.c
+++ b/drivers/power/supply/cros_usbpd-charger.c
@@ -276,7 +276,7 @@ static int cros_usbpd_charger_get_power_info(struct port_data *port)
 		port->psy_current_max = 0;
 		break;
 	default:
-		dev_err(dev, "Port %d: default case!\n", port->port_number);
+		dev_dbg(dev, "Port %d: default case!\n", port->port_number);
 		port->psy_usb_type = POWER_SUPPLY_USB_TYPE_SDP;
 	}
 
-- 
2.39.0.rc1.256.g54fd8350bd-goog

