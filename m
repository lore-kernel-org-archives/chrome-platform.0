Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED332CA1
	for <chrome-platform@lists.linux.dev>; Thu, 27 Jan 2022 19:17:13 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id j10so3095378pgc.6
        for <chrome-platform@lists.linux.dev>; Thu, 27 Jan 2022 11:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mH3nYcd9zv+BTIzE/gVRRbxueZQ6/1T3MPJYS4VSIUg=;
        b=E6PrxJoS/Mlbc9HMCJh+xJmsvQvF3DlKHUNWPsIj7lTN+r+Z4RrrCmMLUBnzdxw+MO
         QapUbKXC2cYBkhdTB4Qo2Loz4uY6s6iOH7oRbaNnSt5/JAy6IbLc/Xx1ORb9XvRQMJ5x
         3YcQPxaRjhVaZf3nrSQvVm9K2xWH/nJ6QPMRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mH3nYcd9zv+BTIzE/gVRRbxueZQ6/1T3MPJYS4VSIUg=;
        b=H3WEQofLcjFH7QON3LzFysO9nCTXaR5taGVoPQr/JfUdrR14m5WAjXD/qOTrp8FR6S
         kGrt2I5FSAXWUgAW4m4u///c3dfnY2UJRhQ7h7fqWIXTT8McnXlteLU0rwczQD47ZxbG
         rQNYzdL+l+cQJd59sQDd9Sa+VYVSAMJrDa7Ks7mhCbHSKI1FZjvPCX4rfANcJbGAjSsf
         lPWd2ZQ1mtAZlljE3m/Ae1yhbR8v8s38F6+jbTUgpXxzGLDy/CaWTgRa4e7m+3hpvkTb
         8gV58q2UT1QRstT3TpnoMXVPvpzwuIa067koiUZnSKQa1A42MKU29/B8w1rh5Qz0Xteh
         Pf6w==
X-Gm-Message-State: AOAM5333VUgOsObhVKLwrJxel5Fkc9sAtRE0EBRQybzKoBruWqcQ7sKi
	t8tHr8nua6yBpfchshosEmP5bQ==
X-Google-Smtp-Source: ABdhPJxWs1POLe9XntCkGcT4PCfpNjWtYL2TykZSG9BUvhctT3zTIiTfEHqOTthLmqOCbiWXT0UUcg==
X-Received: by 2002:a63:243:: with SMTP id 64mr3811160pgc.117.1643311033189;
        Thu, 27 Jan 2022 11:17:13 -0800 (PST)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id lb3sm99570pjb.47.2022.01.27.11.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 11:17:12 -0800 (PST)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Prashant Malani <pmalani@chromium.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Benson Leung <bleung@chromium.org>,
	chrome-platform@lists.linux.dev (open list:CHROMEOS EC USB TYPE-C DRIVER),
	Guenter Roeck <groeck@chromium.org>
Subject: [PATCH] platform/chrome: cros_ec_typec: Make try power role optional
Date: Thu, 27 Jan 2022 19:16:59 +0000
Message-Id: <20220127191659.3560810-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some boards prefer not to specify a try-power-role. Update the port
property parsing logic to not error out in case a try-power-role is not
specified.

Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 5de0bfb0bc4d..ee12658009e5 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -115,17 +115,18 @@ static int cros_typec_parse_port_props(struct typec_capability *cap,
 		return ret;
 	cap->data = ret;
 
+	/* Try-power-role is optional. */
 	ret = fwnode_property_read_string(fwnode, "try-power-role", &buf);
 	if (ret) {
-		dev_err(dev, "try-power-role not found: %d\n", ret);
-		return ret;
+		dev_warn(dev, "try-power-role not found: %d\n", ret);
+		cap->prefer_role = TYPEC_NO_PREFERRED_ROLE;
+	} else {
+		ret = typec_find_power_role(buf);
+		if (ret < 0)
+			return ret;
+		cap->prefer_role = ret;
 	}
 
-	ret = typec_find_power_role(buf);
-	if (ret < 0)
-		return ret;
-	cap->prefer_role = ret;
-
 	cap->fwnode = fwnode;
 
 	return 0;
-- 
2.35.0.rc0.227.g00780c9af4-goog

