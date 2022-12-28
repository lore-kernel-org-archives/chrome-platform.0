Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CA8A2A
	for <chrome-platform@lists.linux.dev>; Wed, 28 Dec 2022 01:02:54 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id c9so4918388pfj.5
        for <chrome-platform@lists.linux.dev>; Tue, 27 Dec 2022 17:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbjTsx7UG59fZ2gLebJbhfQe4ODmuLy0COLAvv8hKdk=;
        b=ah1j6uRlh40gT4KP48ZO4mCU9YtccnyURceyhbTIH6fORS0aZqEok97bfxUQai4LLP
         fYfTjCPLYz2bUl5qvzmk3xYNuq7JsoBJDZ0IRGvTHnNfo/qczH/Tk6I+fBJ6wApoZ6aF
         Z5Onv+nMh5Qji4XfGX+1tzunUoq33squgPVWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CbjTsx7UG59fZ2gLebJbhfQe4ODmuLy0COLAvv8hKdk=;
        b=zyxjG7MBoSkOKqrGZXFsKrtMxoVsitKT41+Rci1GW+XmJUAGUBKEv5pVOeKbNGLkKd
         DLgnW+zkPTm8YYPtRXpb+K06FNzo5GbXMuKukraW78NxWtjaU3le1FLAppLwR8yfL9rU
         UDypKjW49PYjAQgrgHQpIR1VMH2Tdc1FkapU4mO05N0OIeXH/bEOEg+CRCPf6Zt9nAZJ
         ue9FutuKQjTsgDQkDqgZXz28soTAhZMmKp/MEBlc4Ev2uSsG3LvwUlpWBLTRLCZF/bGc
         OUnn1oJWibq0QTmP8jSwTCfGL/PoUrO1KjTqiWdfYSfgZi9nrHUH3A0vH6cEx3CuzeBm
         rQHw==
X-Gm-Message-State: AFqh2kopFYVy0+RL/PDnaaJfOS8LrJpCP+d6+oWrSIiVP9tPYDijKnaq
	6HE8g4Uw2dlv0UVDSTwiVAUaxw==
X-Google-Smtp-Source: AMrXdXtag5e98w+qZ8o8usxXV7igTWLFzCDC0XYCGCVJixhOsxrxWP+M/gdV7E5FHEBniz371pMBMw==
X-Received: by 2002:a05:6a00:1d91:b0:575:a4f5:7812 with SMTP id z17-20020a056a001d9100b00575a4f57812mr28189419pfw.4.1672189374332;
        Tue, 27 Dec 2022 17:02:54 -0800 (PST)
Received: from pmalani.c.googlers.com.com (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id 68-20020a621947000000b00580e679dcf2sm6045566pfz.157.2022.12.27.17.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 17:02:54 -0800 (PST)
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
	Kees Cook <keescook@chromium.org>,
	Lee Jones <lee.jones@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Xiang wangx <wangxiang@cdjrlc.com>
Subject: [PATCH 04/10] platform/chrome: cros_ec_typec: Set port alt mode drvdata
Date: Wed, 28 Dec 2022 00:45:07 +0000
Message-Id: <20221228004648.793339-5-pmalani@chromium.org>
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

Save the ChromeOS-specific Type-C port info in the port altmodes' driver
data. This makes communication with the ChromeOS EC (Embedded
Controller) easier when alt mode drivers need to send messages to
peripherals.

Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index bc8dc8bd90b3..05dc5a63af53 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -345,6 +345,7 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
 	if (IS_ERR(amode))
 		return PTR_ERR(amode);
 	port->port_altmode[CROS_EC_ALTMODE_DP] = amode;
+	typec_altmode_set_drvdata(amode, port);
 
 	/*
 	 * Register TBT compatibility alt mode. The EC will not enter the mode
@@ -358,6 +359,7 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
 	if (IS_ERR(amode))
 		return PTR_ERR(amode);
 	port->port_altmode[CROS_EC_ALTMODE_TBT] = amode;
+	typec_altmode_set_drvdata(amode, port);
 
 	port->state.alt = NULL;
 	port->state.mode = TYPEC_STATE_USB;
-- 
2.39.0.314.g84b9a713c41-goog

