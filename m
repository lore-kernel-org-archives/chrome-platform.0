Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255856AA9
	for <chrome-platform@lists.linux.dev>; Tue, 16 Aug 2022 21:51:56 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id d16so10379017pll.11
        for <chrome-platform@lists.linux.dev>; Tue, 16 Aug 2022 14:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=ZUDKiJcy/NR4RiCY5xiO+505IhInHi372I8JGaQYasY=;
        b=huvYyD9DsHp8RsAMq8umXLvqy3zdfey2HAeowr1WoEseaI+1cHIhtxaBWSPSrjiexw
         y6MQpFZJIoz2Oj2y1p+nbkxgrOfIJpttGB/lBK3ExogrNhH6b6S0jKD9jxLfp6Vwmuq7
         1T0idtLboE4jZ4dpu+YtT6Lcd8R2EGilEXfY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=ZUDKiJcy/NR4RiCY5xiO+505IhInHi372I8JGaQYasY=;
        b=fLPhFaPl5lKzn/thS5nzVCz2z4ii+rexnbdDXqL7V7WRVFwqHCdntye/PO8tYXHbgF
         EvaVTIsyYTj3/WLdaUJDyyPXPfF3GCKhEdAcTSBQ6gbWcHJZFUfevFTH8AZQCxgt8Vqb
         7AVUEQSmfHg1bUYBcUtR60HyXIJHQpIpW3z6K6tJVPoiFrLM0S3GI4WxK/MotBR+WRnX
         26C/DOn96LeIBUmgY0VPbwcvyrwhTy5Uu7XVOzUTC5lXPE86TJBihw5TJqeY8z6DYBC8
         rRKVIfiZGrf1ceU4X+EZ6e6aUJ8/PkZByK1X2EWCwT6BWkYlpDqgVwxzLJHGV3HHEwRp
         rUyw==
X-Gm-Message-State: ACgBeo0InJhVO7UIk5Bnk5kVUdHX3WnNHtMQ+BPBdjs8qd5z9KBZEnIw
	VJKkPmAOTYhEhft8FbIZ/gbQhA==
X-Google-Smtp-Source: AA6agR4aSEdxsFuYhrYD+dK3r6Qv8LSY+0sTjAp4rl7A3rC6pwExZBKSQEAsNcsMXVpOct3lVsJ57g==
X-Received: by 2002:a17:90b:3b8a:b0:1f5:1df2:1fff with SMTP id pc10-20020a17090b3b8a00b001f51df21fffmr578753pjb.169.1660686715695;
        Tue, 16 Aug 2022 14:51:55 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (137.22.168.34.bc.googleusercontent.com. [34.168.22.137])
        by smtp.gmail.com with ESMTPSA id z5-20020a623305000000b005323a1a9fecsm8916650pfz.101.2022.08.16.14.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 14:51:55 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: bleung@chromium.org,
	Prashant Malani <pmalani@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	"Dustin L. Howett" <dustin@howett.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Lee Jones <lee.jones@linaro.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>
Subject: [PATCH v6 6/7] platform/chrome: cros_ec_typec: Cleanup switch handle return paths
Date: Tue, 16 Aug 2022 21:48:34 +0000
Message-Id: <20220816214857.2088914-7-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
In-Reply-To: <20220816214857.2088914-1-pmalani@chromium.org>
References: <20220816214857.2088914-1-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of the return paths for the cros_typec_get_switch_handles()
aren't necessary. Clean up the return paths to only undo the handle
get's which succeeded.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
---

Changes since v5:
- Picked up Reviewed-by tags.

Changes since v4:
- No changes.

Changes since v3:
- No changes.

Changes since v2:
- No changes.

Changes since v1:
- No changes.

 drivers/platform/chrome/cros_ec_typec.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index de6ee0f926a6..ee54add992db 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -158,12 +158,10 @@ static int cros_typec_get_switch_handles(struct cros_typec_port *port,
 	return 0;
 
 role_sw_err:
-	usb_role_switch_put(port->role_sw);
-ori_sw_err:
 	typec_switch_put(port->ori_sw);
-mux_err:
+ori_sw_err:
 	typec_mux_put(port->mux);
-
+mux_err:
 	return -ENODEV;
 }
 
-- 
2.37.1.595.g718a3a8f04-goog

