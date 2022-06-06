Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753887E
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jun 2022 20:20:11 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id z17so13596354pff.7
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jun 2022 13:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zICvYCx4eGxVrXk8LpGPKi4keG/OpLNxmOtIxsqErvI=;
        b=IagWj/SYc4/Y9FtFzDCdKS0529Z4XuGo/muGY5dQdCpyLFUW4vJ6bi0MvsqL2kl5Ag
         x6oaZvLNOMpEwbKp3Hr7hRhbVM2hoMI1eIwsPfTLGax/rgzs75IqMS0pNkoSyhk9NLZz
         pebdYMxt0VX9bf4CyTFGLvAjhw/vC87BDFvfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zICvYCx4eGxVrXk8LpGPKi4keG/OpLNxmOtIxsqErvI=;
        b=PJABeTwL1ZrQAhXp1P4HevpAEtb1BBZ9CT0adSurWqHUiQ/1C24HhN7kN+CFll/SYf
         dxVs+S1JRE67It06KEKuFv6Y9RBlg+BvSyPLPqb6c0OXMDgSGmSjZKaiwF4Y+G8lrkZ9
         xmrLzUVqsnjiCC8V7iBNQjYsedRCk7wn1UV/wfBSOC+F9fF15ObHTuZ9LATAOn/fb+SW
         dzQHQYJt+BIDtR9HSNEn9TnUmOQHWZvyibpR2m7sS8XwMbbOPzhOSfu6Khzc+RQ+Z594
         MZZGTrMvtd7FjZKaAQEY9RPpNYRHbEBhCy0YcKlq4gRCfc96sVqE9r8OPzsCC9sJBJ/J
         MyBA==
X-Gm-Message-State: AOAM5323AmNR/Qyc0PRqwh419GCFadR1lgCfiy0xbBbOsC56KmibhfnY
	4C18UDGCHwykPok+Nd+V7UzL2w==
X-Google-Smtp-Source: ABdhPJzhSZmC7qAnR3r/4uCpN7yK371WiuxS6DFokrY0B9A6JlwUmhG3U3RSl+6CPJFBjoOq2WeGEQ==
X-Received: by 2002:a63:2360:0:b0:3fb:ee61:82cf with SMTP id u32-20020a632360000000b003fbee6182cfmr22288194pgm.574.1654546810993;
        Mon, 06 Jun 2022 13:20:10 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id l5-20020a170902d34500b0015ef27092aasm10883034plk.190.2022.06.06.13.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 13:20:10 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: bleung@chromium.org,
	Prashant Malani <pmalani@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	chrome-platform@lists.linux.dev (open list:CHROME HARDWARE PLATFORM SUPPORT)
Subject: [PATCH 3/3] platform/chrome: cros_ec_proto: Update size arg types
Date: Mon,  6 Jun 2022 20:18:05 +0000
Message-Id: <20220606201825.763788-4-pmalani@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220606201825.763788-1-pmalani@chromium.org>
References: <20220606201825.763788-1-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cros_ec_cmd() takes 2 size arguments. Update them to be of the more
appropriate type size_t.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/platform/chrome/cros_ec_proto.c     | 4 ++--
 include/linux/platform_data/cros_ec_proto.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index b6bea183ee28..cefabfe45551 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -958,9 +958,9 @@ int cros_ec_cmd(struct cros_ec_device *ec_dev,
 		unsigned int version,
 		int command,
 		void *outdata,
-		int outsize,
+		size_t outsize,
 		void *indata,
-		int insize)
+		size_t insize)
 {
 	struct cros_ec_command *msg;
 	int ret;
diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
index 816da4eef3e5..85e29300f63d 100644
--- a/include/linux/platform_data/cros_ec_proto.h
+++ b/include/linux/platform_data/cros_ec_proto.h
@@ -232,7 +232,7 @@ bool cros_ec_check_features(struct cros_ec_dev *ec, int feature);
 int cros_ec_get_sensor_count(struct cros_ec_dev *ec);
 
 int cros_ec_cmd(struct cros_ec_device *ec_dev, unsigned int version, int command, void *outdata,
-		    int outsize, void *indata, int insize);
+		    size_t outsize, void *indata, size_t insize);
 
 /**
  * cros_ec_get_time_ns() - Return time in ns.
-- 
2.36.1.255.ge46751e96f-goog

