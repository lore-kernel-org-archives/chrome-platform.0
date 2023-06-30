Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FDE1FB8
	for <chrome-platform@lists.linux.dev>; Fri, 30 Jun 2023 08:31:33 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7658752ce2fso128670885a.1
        for <chrome-platform@lists.linux.dev>; Fri, 30 Jun 2023 01:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688113892; x=1690705892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJtRVTrBXHzy1SAWRtn4ErvKw0dJAPtFGr8YFV61VM0=;
        b=Mwg5wcWZqfPJ9jLPYPvXyjxdyXMwEWm00Q8tZvEGl4TmpkIp85Jh1aDf0T975wVtrl
         n14yEk1vswKw8QbaTorG58E+wcU6JvpXrexZ+hpMVHv3Bz7zmQ2DJmbjKThqI5bdizxl
         wObcuaYRB3g9zjU2t1TTqx+dbezvZmHVUfzoc9R2YLIDnq+dToMaocVUl33sGqYV5SLB
         Z6u8Og0ostgnY+Ho6jxgzUOLWTxOw2BTIZMYSbiIYkzE+RfGtNPf/1n2tpsBIpOqaF7O
         2h/joWIT5rXW6/TQ5guZ8TuTEl7GsW+M+fwYPH4oSW2OkpKm5SDVzRK+K7zanwJNFn4M
         Eo+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688113892; x=1690705892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NJtRVTrBXHzy1SAWRtn4ErvKw0dJAPtFGr8YFV61VM0=;
        b=GH8rWxaaauBSe8YYc22c9QKtL7+nhkO7XR58xQz6sKrkMiUuQA4fcciJnO5tfRZHS7
         8ZqKGsuPWKlmLLhDv+dCxnIQ/Ta8cvlU5o/4L801gDCdQjtEgmvnzMSLPhpBTB9QyvgX
         EiQ7jUssnYlYsRX1bIakD7UY1eB3P7yLDVmgy8mUzBFvDKt2wiNM2uh2tM7T6AbYU3gI
         O6hepA5dUzXdUELoPzOdSAXy244RB8ecvvovqdeXJrBY1DgnpDOdh9cg4VVAVPmxiID3
         TnmIEfaA6TMuMH1IcrPUSe/E1TvChQsoIdE/1fEt6Ng4LEBz7OIaqYlUcZdCdQ/x86MZ
         wd4g==
X-Gm-Message-State: ABy/qLYgnUIHTf6F/Ee7XAsQ4uy4ZYjlDjFL7deofh0WESEewtinhS3x
	gtO9cX2jAyzu4kRXTkQW5ic=
X-Google-Smtp-Source: APBJJlE9Fi+oiwjKrHm4+GLJT1H7D5HMQLdwOGJjYgx1gXutxBbvOrgmmvUkYCM6uysI5UIG58/Lpg==
X-Received: by 2002:ad4:5f4e:0:b0:635:da2a:4706 with SMTP id p14-20020ad45f4e000000b00635da2a4706mr2698383qvg.15.1688113892241;
        Fri, 30 Jun 2023 01:31:32 -0700 (PDT)
Received: from chcpu17.cse.ust.hk (fc3kcs10.cse.ust.hk. [143.89.191.124])
        by smtp.googlemail.com with ESMTPSA id jy19-20020a0562142b5300b00635e9db359bsm4765587qvb.82.2023.06.30.01.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 01:31:31 -0700 (PDT)
From: Yiyuan Guo <yguoaz@gmail.com>
To: tzungbi@kernel.org
Cc: jic23@kernel.org,
	lars@metafoo.de,
	bleung@chromium.org,
	groeck@chromium.org,
	dianders@chromium.org,
	mazziesaccount@gmail.com,
	gwendal@chromium.org,
	linux-iio@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	yguoaz@gmail.com
Subject: [PATCH v3] iio: cros_ec: Fix the allocation size for cros_ec_command
Date: Fri, 30 Jun 2023 16:31:12 +0800
Message-Id: <20230630083112.2344234-1-yguoaz@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ZJ6F4THLoYy6S8HP@google.com>
References: <ZJ6F4THLoYy6S8HP@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The struct cros_ec_command contains several integer fields and a
trailing array. An allocation size neglecting the integer fields can
lead to buffer overrun.

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Yiyuan Guo <yguoaz@gmail.com>
---
v2->v3: 
 * Added R-b tag from Tzung-Bi Shih
 * Aligned the code by adding an extra tab before "max"
 * Added a patch changelog
v1->v2: Prefixed the commit title with "iio: cros_ec:"

 drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
index 943e9e14d1e9..b72d39fc2434 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
@@ -253,7 +253,7 @@ int cros_ec_sensors_core_init(struct platform_device *pdev,
 	platform_set_drvdata(pdev, indio_dev);
 
 	state->ec = ec->ec_dev;
-	state->msg = devm_kzalloc(&pdev->dev,
+	state->msg = devm_kzalloc(&pdev->dev, sizeof(*state->msg) +
 				max((u16)sizeof(struct ec_params_motion_sense),
 				state->ec->max_response), GFP_KERNEL);
 	if (!state->msg)
-- 
2.25.1

