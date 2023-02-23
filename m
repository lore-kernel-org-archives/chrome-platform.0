Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DB21C26
	for <chrome-platform@lists.linux.dev>; Thu, 23 Feb 2023 05:41:47 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id c1so11777853plg.4
        for <chrome-platform@lists.linux.dev>; Wed, 22 Feb 2023 21:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wistron-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FEXPPCK8RfqWIy61SdJSATTm4fO5IDc6+VUaQzEmh4E=;
        b=Iaoybi9FTzh6C/4Q1uAlBnnpbXHAaChef57PMz+L5CNynKlpOVTV1yvWjcgHGLqLdO
         GsdRImZTtGpvoveMc5Q+0hD0MiBMi9/qPjfLkxgGrd9VbQ3ZWkO7LABV3eH+H5wr8Mx2
         xI/dc+0n5Ev0Varn6blZ48V6CSDbiYz+iP+A30M/BwpIwfHkHtJLeItKxus6j9hLd8DX
         mkIFrnsXKUcO7ybl5xvaqzT21jnAvqjKMQHmH1lMkRKM0EioeKEtN1BpWicIw0vz6+oz
         ujFisqnfE9cIiCg5swTO1vOnkrV9rW8RaDgpNhL+e972+kSkdQFk9GOuyYlL4+Gl0HTh
         8KrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FEXPPCK8RfqWIy61SdJSATTm4fO5IDc6+VUaQzEmh4E=;
        b=ntQslZr41nWcuvyANApsEFMiHZZ+NXb28DJ9VjX2VniELwcCCRCgwVrX/CiGcc2qIO
         1hjKXSbPrAvK4g2uyPnk20XyfIXBUkqY81B6kuHlxDt1m5y64g71FFJWgI89DiCv6No8
         pg4qGErPaye+X2gGeOpLwT0cqT1t4hV5rGbvqdj5qW/3CtkpZWmndkFuDx9w4XeN6KSP
         CLylcuBdOxieOKJRVKn0VE2kIhyukp0ROH39vnezOVGNpcwBMIGDMsutpMPqvrE0O5SI
         mAG6Ik612EkyxnWFP11CiJR4JNO8UGsk9SI+IUAWL0bMo06xLRzGew6yZXqNYBNo/nTC
         MPiA==
X-Gm-Message-State: AO0yUKU2xqjYPi/kSUNatc3u8/TWC71Y69qa7rvgZ1B+8BWHcrz35Owu
	zfpzYugG9AWGIiQ/NS4xDQH6UQ==
X-Google-Smtp-Source: AK7set9EfGInk0g9nPYWg1g2YklQ06/aSqmHefF8nH7RZ19edO7NzOiLMGFwQuZ5jFmjjxfAJx84rw==
X-Received: by 2002:a17:902:e1cc:b0:19c:9420:6236 with SMTP id t12-20020a170902e1cc00b0019c94206236mr6420380pla.22.1677130906465;
        Wed, 22 Feb 2023 21:41:46 -0800 (PST)
Received: from localhost.localdomain ([2401:e180:8812:cac3:129e:5c16:92e6:e867])
        by smtp.gmail.com with ESMTPSA id g12-20020a170902c38c00b0019c90f8c831sm4455256plg.242.2023.02.22.21.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 21:41:46 -0800 (PST)
From: Zoey Wu <zoey_wu@wistron.corp-partner.google.com>
To: hverkuil-cisco@xs4all.nl
Cc: mchehab@kernel.org,
	bleung@chromium.org,
	groeck@chromium.org,
	scott_chao@wistron.corp-partner.google.com,
	ajye_huang@compal.corp-partner.google.com,
	zoey_wu@wistron.corp-partner.google.com,
	hellojacky0226@hotmail.com,
	linux-media@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: platform: cros-ec: Add aurash to the match table
Date: Thu, 23 Feb 2023 13:41:38 +0800
Message-Id: <20230223054138.267849-1-zoey_wu@wistron.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Google aurash device uses the same approach as the Google Brask
which enables the HDMI CEC via the cros-ec-cec driver.

Signed-off-by: Zoey Wu <zoey_wu@wistron.corp-partner.google.com>
---
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 6ebedc71d67d..e7cb9509e967 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -225,6 +225,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Kinox", "0000:00:02.0", "Port B" },
 	/* Google Kuldax */
 	{ "Google", "Kuldax", "0000:00:02.0", "Port B" },
+	/* Google Aurash */
+	{ "Google", "Aurash", "0000:00:02.0", "Port B" },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.25.1

