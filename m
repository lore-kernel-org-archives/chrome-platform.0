Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA7FA2A
	for <chrome-platform@lists.linux.dev>; Wed, 28 Dec 2022 00:56:41 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id n4so14699818plp.1
        for <chrome-platform@lists.linux.dev>; Tue, 27 Dec 2022 16:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pBNYJdKXzam2nXK0e/4rLZrKFDWqDasg6cE5ctCeLs=;
        b=RKvg/T3PMBvEQZilUPnU4QNnnFWl3WaUHN9Rf/hXYh6bzT9+tVGKtuqYOuFUFKL/xt
         tCiKyp2lUBydu+rR22CjAkhiw0oiIpA4oD8BVbALOVLcusx2KyR1ob1G8hQ/CiiitCzn
         bomGAoN0aZ4RLZl3gzDrce6rFlcaf3O69q7/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6pBNYJdKXzam2nXK0e/4rLZrKFDWqDasg6cE5ctCeLs=;
        b=Y5aVT4dQ9jV05wf8YXu2tGgwzpqAK7ww//lkdfO89kMgXpFdhilOqj4RnN3+9oLiXn
         qXH09W5mACSPR5fQIQyyEGzFHzy+MZA49vRm5veaZbISWV7nZ00ygKRHGw6rqkDPu2ag
         43uNoFX2YfzFhSX+/X7178GvWXj0o04+des4M4zcL9XqBiM+jUxO7322Efm2peQEc4SY
         vU9auGotE8jO1dTl5xPbVwYUApNXwEsLqmLqqy54CHKp7LSELt7rwe6XmJtYofq0PFwe
         kg5a+uqvWkjDEGQktJRxIer09omwgWtBt3FVL6nK4p+ZJXoQU+DC3TpP/rC2FqHaYyzL
         1zfg==
X-Gm-Message-State: AFqh2kr4BOFsZguUYVDhuVSBbHVVnleKuokEA/h2hL5CgfDu5Z3ukT7l
	cg1zDWkazL7+bonZPcicIwO2Fg==
X-Google-Smtp-Source: AMrXdXtlGD1iF9qDlfibxWqFvtJyFneuKzXuyKtopGLMCo88wsQSvk2xYDuqTAiHjx1yO48ULlMsFw==
X-Received: by 2002:a05:6a20:1bd9:b0:ad:efda:5e5d with SMTP id cv25-20020a056a201bd900b000adefda5e5dmr24969506pzb.61.1672189000941;
        Tue, 27 Dec 2022 16:56:40 -0800 (PST)
Received: from pmalani.c.googlers.com.com (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id 68-20020a621947000000b00580e679dcf2sm6045566pfz.157.2022.12.27.16.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 16:56:40 -0800 (PST)
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
Subject: [PATCH 01/10] Revert "mfd: cros_ec: Add SCP Core-1 as a new CrOS EC MCU"
Date: Wed, 28 Dec 2022 00:45:04 +0000
Message-Id: <20221228004648.793339-2-pmalani@chromium.org>
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

This reverts commit 66ee379d743c69c726b61d078119a34d5be96a35.

The feature flag introduced by Commit 66ee379d743c ("mfd: cros_ec: Add
SCP Core-1 as a new CrOS EC MCU") was not first added in the source EC
code base[1]. This can lead to the possible misinterpration of an EC's
supported feature set, as well as causes issues with all future feature
flag updates.

[1] https://source.chromium.org/chromium/chromiumos/platform/ec/+/main:include/ec_commands.h

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

While this patch modifies drivers/mfd, it would be preferable to submit
it through the chrome-platform tree, since that eliminates cross-tree
dependencies for the series of which this patch is a part.


 drivers/mfd/cros_ec_dev.c                      | 5 -----
 include/linux/platform_data/cros_ec_commands.h | 2 --
 include/linux/platform_data/cros_ec_proto.h    | 1 -
 3 files changed, 8 deletions(-)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 344ad03bdc42..02d4271dfe06 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -64,11 +64,6 @@ static const struct cros_feature_to_name cros_mcu_devices[] = {
 		.name	= CROS_EC_DEV_SCP_NAME,
 		.desc	= "System Control Processor",
 	},
-	{
-		.id	= EC_FEATURE_SCP_C1,
-		.name	= CROS_EC_DEV_SCP_C1_NAME,
-		.desc	= "System Control Processor 2nd Core",
-	},
 	{
 		.id	= EC_FEATURE_TOUCHPAD,
 		.name	= CROS_EC_DEV_TP_NAME,
diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 5744a2d746aa..7c94bf5c8f05 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -1300,8 +1300,6 @@ enum ec_feature_code {
 	 * mux.
 	 */
 	EC_FEATURE_TYPEC_MUX_REQUIRE_AP_ACK = 43,
-	/* The MCU is a System Companion Processor (SCP) 2nd Core. */
-	EC_FEATURE_SCP_C1 = 45,
 };
 
 #define EC_FEATURE_MASK_0(event_code) BIT(event_code % 32)
diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
index e43107e0bee1..a1f5b6d6db3a 100644
--- a/include/linux/platform_data/cros_ec_proto.h
+++ b/include/linux/platform_data/cros_ec_proto.h
@@ -19,7 +19,6 @@
 #define CROS_EC_DEV_ISH_NAME	"cros_ish"
 #define CROS_EC_DEV_PD_NAME	"cros_pd"
 #define CROS_EC_DEV_SCP_NAME	"cros_scp"
-#define CROS_EC_DEV_SCP_C1_NAME	"cros_scp_c1"
 #define CROS_EC_DEV_TP_NAME	"cros_tp"
 
 #define CROS_EC_DEV_EC_INDEX 0
-- 
2.39.0.314.g84b9a713c41-goog

