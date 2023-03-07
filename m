Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE0A613D
	for <chrome-platform@lists.linux.dev>; Tue,  7 Mar 2023 12:58:50 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id p6so13995624plf.0
        for <chrome-platform@lists.linux.dev>; Tue, 07 Mar 2023 04:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678193930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=14KEI7DKb7/XgYTk/mAvRRCNE1njt0Ubmbcu0U/o2i8=;
        b=B9KIsBBHPiA2BPfdnUytopIE29AZLAjY8edo7J+4Tel8M3KFP9c4EU0LsKdQPBI7xu
         B8P6T+peKou5jXwwJWJy0IAd9JmNgXhzIFuFENxDANvoHixlMPJMql7knTNTPJ1C/LsK
         KbC00wV6gVx6Eg5c2WX3sJve3JTA3zcffDALmE55MtCkJNha0SGEcvA1oUJeCOnw9tmK
         NlSWOj/sYSJ+NUaSIt1c0/9uj2OYDuyxlyzObOwKqtCkyqdoVuh0BnQuoQtUIH1DJ017
         lqNu/1YmB1Z7Yrkl7anMvLxK5utn9Pn4fbE14sKS4o+eQ+l4hKtLU8B7zSJSc6lryONC
         kNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678193930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=14KEI7DKb7/XgYTk/mAvRRCNE1njt0Ubmbcu0U/o2i8=;
        b=ctNFo2CQK3pL1REdrOJVRem8+u54xx6edFbmhBSWOuPcDvGPNyEPx1q/4EJ4ZbayDx
         B9qJHMN7bnc67fx/qwnOdLYp6Z5M5NTaqQcBKqvbh6eHTrZf+qnN6cn28ulTCOqR98k4
         lsN4a6Eqbct38p7qMA0zyBgm6ekmG+o7XIckMSrSbpWAGukQufQNZNoBzHNB7NVI0YsI
         kxyVPGIO1FAlfJNmg5z70nFCSqPVYnPOSanKBhurJ5huD/2z5X7VUyt0Ez9eBkXZuyVV
         dPtbvbcwdd06vxZhI/A1OjpjRfR7ihLww+vPeIbyMa5saBuqCefnCoR+P5D8cKWRqCkL
         TCoA==
X-Gm-Message-State: AO0yUKUMIEb6rG96+sO7yAiHDrzKb+vFbj6xsokODd7zKHi8aXehhCcs
	Qr1aDdzSQlFHnn6+BLJe4Ug=
X-Google-Smtp-Source: AK7set+gmznO1briq15scDCO3CmlkNAWZHRE+CMnQ5g6FcmgnV4O0iXGQj2YIhOV2h5pY4RxWQSXnQ==
X-Received: by 2002:a17:902:db0e:b0:19d:1c5:adb9 with SMTP id m14-20020a170902db0e00b0019d01c5adb9mr17466721plx.3.1678193929687;
        Tue, 07 Mar 2023 04:58:49 -0800 (PST)
Received: from kevin-NL5.. (2001-b400-e30a-9c5a-d50f-1833-f384-bd8c.emome-ip6.hinet.net. [2001:b400:e30a:9c5a:d50f:1833:f384:bd8c])
        by smtp.gmail.com with ESMTPSA id le3-20020a170902fb0300b0019edf582a95sm1312591plb.20.2023.03.07.04.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 04:58:49 -0800 (PST)
From: Kevin Chiu <kevin.chiu.17802@gmail.com>
To: bleung@chromium.org,
	mchehab@kernel.org
Cc: groeck@chromium.org,
	linux-media@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kevin Chiu <kevin.chiu.17802@gmail.com>
Subject: [PATCH] media: platform: cros-ec: Add Gladios/Lisbon to the match table
Date: Tue,  7 Mar 2023 20:58:45 +0800
Message-Id: <20230307125845.64231-1-kevin.chiu.17802@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Google Gladios/Lisbon device uses the same approach as the Google Brask
which enables the HDMI CEC via the cros-ec-cec driver.

Signed-off-by: Kevin Chiu <kevin.chiu.17802@gmail.com>
---
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 6ebedc71d67d..96c4c055d691 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -225,6 +225,10 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Kinox", "0000:00:02.0", "Port B" },
 	/* Google Kuldax */
 	{ "Google", "Kuldax", "0000:00:02.0", "Port B" },
+	/* Google Gladios */
+	{ "Google", "Gladios", "0000:00:02.0", "Port B" },
+	/* Google Lisbon */
+	{ "Google", "Lisbon", "0000:00:02.0", "Port B" },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.38.2

