Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDC01FBE
	for <chrome-platform@lists.linux.dev>; Fri, 30 Jun 2023 06:32:06 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-635f1c7412cso10798366d6.0
        for <chrome-platform@lists.linux.dev>; Thu, 29 Jun 2023 23:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688106725; x=1690698725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hMqc59JLjfsmDQrIpQpsMtV1yNjY1VclkrG5Cc3ePcs=;
        b=KPFrrw3MO4GX/bJHUB4qB5OA41otQVjAGbZvBvc3a2/xRNUu4i3WZ/3Mjcu8SHEWxa
         PsIkvNu6G2JPEcDonDFHgc0sFKoGC+NOEAYVjoRJJkn3j1ug/pFhAHZdliYMbAJ8nZEP
         Jl3Ec0ruWH3jB3o9eSI5998MiE1YGu/2Qn7ci0kExFaCAazJr629hMqnVVosTwm7p8K3
         e0JQtUZPl3d/8hXb1QEmVSQ2akAzdlYj7osdfrIUARVGPwiI8AOY/9ZAFjdrzPnsLhBn
         odlXkRhadJ5UpafhIz6dLqw6vga4JfkaahgSWFOjiNWHqWWGcSvCVq+43Tyo7lOFabmz
         GJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688106725; x=1690698725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hMqc59JLjfsmDQrIpQpsMtV1yNjY1VclkrG5Cc3ePcs=;
        b=iji/Nlx0q7zuK2T4x+cT5CRfycNJhW7KNMhYcha2GM7frv6tfdzmtfyn0RHAzCWKJH
         xyWTJQog1MKB8bHSZMGOThty/i1Ayxqsp9QyYhqB8Iwc0PjlFNf5ey5IDrnzC+oUYDJB
         xCDsjSxSxyUFeNJPktZYnC/6DaLcqmVb/4L31+ILvs6cr19wi88A6D32IWLZIv8TVx/e
         hcQCJBuqRbyLN4Xd1NOMJ7cprdffAsYfA2LrbrgjsCqNejkncSOG/oDQeTKPG3+glCje
         05dOesCdo7QLmH0oHNnHrNqu8gMbfda10ZlIhHlMfyrztk8z5tWP7V7q4jFCZL6jNwZ9
         Bhjg==
X-Gm-Message-State: ABy/qLZb4bnNAR50tCD/T9zUvTcfeVSGrrfPKmA6Q1m06lkcSKF10A/Y
	V4mLyIFF+RfnqUntFfKGMeQ=
X-Google-Smtp-Source: APBJJlEk3/ngJX1N5MvlA6E+V5P2WsRTbwcrawrVMV7XdSehniPRa6Qcf4Gq9H7kAqmg/F+br49bhA==
X-Received: by 2002:a05:6214:21ab:b0:635:da2a:4712 with SMTP id t11-20020a05621421ab00b00635da2a4712mr1857880qvc.40.1688106725503;
        Thu, 29 Jun 2023 23:32:05 -0700 (PDT)
Received: from chcpu17.cse.ust.hk (fc3kcs10.cse.ust.hk. [143.89.191.124])
        by smtp.googlemail.com with ESMTPSA id u18-20020a0cf892000000b0063660329d57sm175276qvn.67.2023.06.29.23.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 23:32:05 -0700 (PDT)
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
Subject: [PATCH v2] iio: cros_ec: Fix the allocation size for cros_ec_command
Date: Fri, 30 Jun 2023 14:31:32 +0800
Message-Id: <20230630063132.314700-1-yguoaz@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230629132405.1237292-1-yguoaz@gmail.com>
References: <20230629132405.1237292-1-yguoaz@gmail.com>
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

Signed-off-by: Yiyuan Guo <yguoaz@gmail.com>
---
 drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
index 943e9e14d1e9..e4c01f1072bd 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
@@ -253,8 +253,8 @@ int cros_ec_sensors_core_init(struct platform_device *pdev,
 	platform_set_drvdata(pdev, indio_dev);
 
 	state->ec = ec->ec_dev;
-	state->msg = devm_kzalloc(&pdev->dev,
-				max((u16)sizeof(struct ec_params_motion_sense),
+	state->msg = devm_kzalloc(&pdev->dev, sizeof(*state->msg) +
+			max((u16)sizeof(struct ec_params_motion_sense),
 				state->ec->max_response), GFP_KERNEL);
 	if (!state->msg)
 		return -ENOMEM;
-- 
2.25.1

