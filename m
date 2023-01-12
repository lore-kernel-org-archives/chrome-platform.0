Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC64366
	for <chrome-platform@lists.linux.dev>; Thu, 12 Jan 2023 04:39:34 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id s3so10441194pfd.12
        for <chrome-platform@lists.linux.dev>; Wed, 11 Jan 2023 20:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nCtsRB96tDB6ymydz+7uG9f0tEsazRT+tKtFE7IAYuA=;
        b=EKBQtrRqzsJpW4Uup0IpMJ6SWOaFDOmYKFSXSlY+tV6r4uGbSkPHtKifX2aL/CxmNM
         OK0xV+ZlW4gY0M8KFuTFSZVzOwlbw89QJtr+tC4xen9yI61kMXUKdzXr++cRgY4YRmZT
         Dn1fTHQEHNAl4WHkEfPgNPvnHlZSEY228FJow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nCtsRB96tDB6ymydz+7uG9f0tEsazRT+tKtFE7IAYuA=;
        b=6eAj+UpD9FImy7izX8ZUy4TgRNiS6Bz2tqvwFovF7H1ZH8kuzpQCuI8yQt/tLW2j19
         Q5LEw/xULDIr0u7gQUWn9IgWFQPT0eqJ3V9E/bVrO22CtcR/TuV6W6ZXT8Y7eBb0Bpyd
         cZUm1Mhigjqur24J18ay5wFo2rB+laoiPYySy+OT+r8DE79X4032sXgXzA+3hTamBBPK
         nUdjuhrIiJWvQJWRVPK93lp+k1lS6SFixfDtWfyhpPDSW3Fmc9pJUxwmRSmeR+D+6/hB
         /SYAv1iuuOnFkKmHLAa5BH0ER6h5aaDv7DkcE+/tet2yjcYsKVbx/KGmt3Egb2z247L2
         hDAA==
X-Gm-Message-State: AFqh2koIKGL1L/t4yWcAfhtwPecf73FAkaZTfhxl2OvOresAhf/wmNd5
	23LOqDDLeEhTs3ofXNmvXUnv9WkG3YErdyrT
X-Google-Smtp-Source: AMrXdXuIlD5zuHSehZeKpZmn+86D6vouPFiM/lBPSTKR4qKGRvavgfrKlSD8pL2/UYqSatb1Goiu0w==
X-Received: by 2002:a62:1791:0:b0:578:8533:9573 with SMTP id 139-20020a621791000000b0057885339573mr65335894pfx.22.1673498374112;
        Wed, 11 Jan 2023 20:39:34 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8720:bd4c:a7f7:4e33])
        by smtp.gmail.com with ESMTPSA id h10-20020a056a00000a00b00573eb4a9a66sm213725pfk.2.2023.01.11.20.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 20:39:33 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/chrome: cros_ec: Initialize panic notifier block
Date: Thu, 12 Jan 2023 12:39:08 +0800
Message-Id: <20230112043908.2938964-1-wenst@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit d90fa2c64d59 ("platform/chrome: cros_ec: Poll EC log on EC panic")
added a new notifier block, but failed to initialize it properly,
resulting in a warning and stack trace (omitted):

	INFO: trying to register non-static key.
	The code is fine but needs lockdep annotation, or maybe
	you didn't initialize this object before use?
	turning off the locking correctness validator.

Initialize the notifier block properly.

Fixes: d90fa2c64d59 ("platform/chrome: cros_ec: Poll EC log on EC panic")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/platform/chrome/cros_ec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index 4ae57820afd5..b895c8130bba 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -182,6 +182,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 	int err = 0;
 
 	BLOCKING_INIT_NOTIFIER_HEAD(&ec_dev->event_notifier);
+	BLOCKING_INIT_NOTIFIER_HEAD(&ec_dev->panic_notifier);
 
 	ec_dev->max_request = sizeof(struct ec_params_hello);
 	ec_dev->max_response = sizeof(struct ec_response_get_protocol_info);
-- 
2.39.0.314.g84b9a713c41-goog

