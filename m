Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D49A2A
	for <chrome-platform@lists.linux.dev>; Wed, 28 Dec 2022 01:04:39 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id e21so239647pfl.1
        for <chrome-platform@lists.linux.dev>; Tue, 27 Dec 2022 17:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5mZF+HqNi7oJNQi66SgCofHZHC1n4UI9rtyVYM/8No=;
        b=KiXQtSzK6SfREKzd9svD1tT0Hd3tIGm6pdGm+RbC+q7dG/Y5Uk/MXDB4H+UwxH8CSF
         MF2snD+BFILP1wBx1EcIXbKnt+5YWVABswwFJ4OTWq1fYcIG1rqA1yK/0vCLyrc5do1I
         lFveHNrmGfJ1u01ZL+qgFDsqDoeqGy22tbUpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r5mZF+HqNi7oJNQi66SgCofHZHC1n4UI9rtyVYM/8No=;
        b=mj1WXdx6AeieHpv+WbO4MrXhjsYmXyrkhlGb+a8XfPkUSbmSaEq7CqkoBVaxhvjQOR
         zr/4L89hba7FkjC8G3yo5NZjzDU/ZtB6xgHyvelE/wNqhFxzDZ/wMSV0bQUE0tMnsR1N
         ebAJAKhBS5FBOH+hdbryAT5qOW4TeTnus4Rk7sM8Zobc1Vd+z9qitke1wQxzDP/NEANc
         AGrc8M8RzrHeww9uuFG5ArybJWZAiEEIezc95Qwoe6vSRkLjtJ3Lk7WbyIP64HGxPHLY
         GNV0Db0WtSylV56UyOH94RmyPVLM1SeAeBzP7eZwtSQyUF8e4yXjAZEOaYAe9eC4+Rp5
         /w0g==
X-Gm-Message-State: AFqh2kq+cjV+FLimkzTp7bdL2EaBPGoqtMEYiP7naIcd9YPFHbllWM2X
	M92Hejp1b2znTZ04sAXAt6qsqQ==
X-Google-Smtp-Source: AMrXdXveagOKrg0TX75B+ykXkGP1Pv+3qW3ri++W2sqEuWcUZoMLj6WCEAJPZTVuQO0zRoCzG7eoBw==
X-Received: by 2002:a62:ae13:0:b0:577:9182:19a7 with SMTP id q19-20020a62ae13000000b00577918219a7mr27292800pff.29.1672189479431;
        Tue, 27 Dec 2022 17:04:39 -0800 (PST)
Received: from pmalani.c.googlers.com.com (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id 68-20020a621947000000b00580e679dcf2sm6045566pfz.157.2022.12.27.17.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 17:04:39 -0800 (PST)
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
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Xiang wangx <wangxiang@cdjrlc.com>
Subject: [PATCH 05/10] platform/chrome: cros_ec_typec: Update port DP VDO
Date: Wed, 28 Dec 2022 00:45:08 +0000
Message-Id: <20221228004648.793339-6-pmalani@chromium.org>
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

The port advertising DP support is a Type-C receptacle. Fix the port's
DisplayPort VDO to reflect this.

Fixes: 1903adae0464 ("platform/chrome: cros_ec_typec: Add bit offset for DP VDO")
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 05dc5a63af53..665fa76e2416 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -27,7 +27,7 @@
 #define DRV_NAME "cros-ec-typec"
 
 #define DP_PORT_VDO	(DP_CONF_SET_PIN_ASSIGN(BIT(DP_PIN_ASSIGN_C) | BIT(DP_PIN_ASSIGN_D)) | \
-				DP_CAP_DFP_D)
+				DP_CAP_DFP_D | DP_CAP_RECEPTACLE)
 
 /* Supported alt modes. */
 enum {
-- 
2.39.0.314.g84b9a713c41-goog

