Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AB74A09
	for <chrome-platform@lists.linux.dev>; Fri, 19 Aug 2022 19:08:36 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id p18so4883032plr.8
        for <chrome-platform@lists.linux.dev>; Fri, 19 Aug 2022 12:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=DqrEek4KEewVAx/BWFwpw/lOY/BhLwmErxM0R0EWxLo=;
        b=MwFNBQo0TZ6ZipDVfvyCnneHe7+leBOXAzZu5KqzchrPPb9Yjc/vvEEVuvx+qV39vO
         V5YCldxxCyOYEdgy093cDUANWG7mMGS+mR3UEfYCTayQ2a4lv/xVijHlz9ZSl8fLus7o
         3YcHWTykQ89fdE+pG+jslDjXurkjxMpD/BRHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=DqrEek4KEewVAx/BWFwpw/lOY/BhLwmErxM0R0EWxLo=;
        b=MlUuIM9nvF/4Cp10q0ft8eGrAkAoUjT4jiIHD0SXHDuNHK5uGhQlIt44xNFpV4rcS8
         fEllmaurRUsK62Q2ZlBWsWtSF63Cx2T+XJYSw4wYKGditYChsxVBhyLy432ANr7iq0LT
         VEEvHP1Dl6jNuDvcjg5TmV53RP1I92Glf82i7IvTaq1b1eNILf+ORj7UVps0dCBBpQb5
         +9p0/XJc8f6TwdDbNv9P/EJNygjtS0nFxZI1jZWBQmi1A+I3qofpYpC1He8VdzW9qzDj
         VPhvjZK6zFOaYsNiN9BF20iVMZbZ8Q7FzJY61fTuCUKQS5UQmHd3m/Svo7/z9vdxIT0f
         SxYA==
X-Gm-Message-State: ACgBeo2h/W5rv9vSq/cFD4hL81wfyDlWyqrmx0cOAi9l5/RyENpaW+5x
	FO+XjNptMn94KBmM9bUTVjLXSg==
X-Google-Smtp-Source: AA6agR4T/qUdLe4Pb2e1At9eR7z2ZJw11QKB/5L2FNFC3ZuaAZNkzzsZtZz5GcksgRnluCf8GT0Tyw==
X-Received: by 2002:a17:90b:4b89:b0:1f5:68b:b14e with SMTP id lr9-20020a17090b4b8900b001f5068bb14emr16054333pjb.30.1660936115902;
        Fri, 19 Aug 2022 12:08:35 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (137.22.168.34.bc.googleusercontent.com. [34.168.22.137])
        by smtp.gmail.com with ESMTPSA id b14-20020a170903228e00b00172a567d910sm3499775plh.289.2022.08.19.12.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 12:08:35 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: bleung@chromium.org,
	Prashant Malani <pmalani@chromium.org>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Guenter Roeck <groeck@chromium.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH 4/4] platform/chrome: cros_ec_typec: Use Type-C driver data
Date: Fri, 19 Aug 2022 19:08:05 +0000
Message-Id: <20220819190807.1275937-5-pmalani@chromium.org>
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

Altmode driver callbacks need EC-specific port information to
communicate with the ChromeOS EC. To accomplish this, save a
pointer to the driver-specific port struct in the Type-C port's
driver data field.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 7daf4207c11e..e3f75440030d 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -379,6 +379,7 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 		ret = cros_typec_parse_port_props(cap, fwnode, dev);
 		if (ret < 0)
 			goto unregister_ports;
+		cap->driver_data = cros_port;
 
 		cros_port->port = typec_register_port(dev, cap);
 		if (IS_ERR(cros_port->port)) {
-- 
2.37.1.595.g718a3a8f04-goog

