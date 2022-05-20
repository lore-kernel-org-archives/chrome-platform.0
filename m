Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDB017D7
	for <chrome-platform@lists.linux.dev>; Fri, 20 May 2022 11:08:41 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id a11so7504753pff.1
        for <chrome-platform@lists.linux.dev>; Fri, 20 May 2022 04:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wistron-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=um6Mtxj9hn6MLF0/DG+dua7GL3nWe8jP1xt8gG30nLY=;
        b=Kj+7Auan4bsUc8KoQwFqczhOJlVHGQfBnGWy608iYQ8110CriJtjyCBAAHB+RWZcHf
         VhiR/XacCdO7kwRyAap6FDCFM6zbxyX0tcYdJblf2/2p4nZq0Q5zA0qO1KBLu8p+gKTo
         zl90Y5Mjl4hOI8IDd9Jmf/4tkmKJWBi3qHex7P1eX3/bMPVaHBAaNkNs+jBft20JLJF7
         qcoROWC7QzVIWsXxCaI/7NSr79rh7jNsCgThmsG+mAKFKRox47W0EABIBgF3K7m+6f0K
         K3TNXZ//JuZ4vImzp5pVFq2+5TrigPiLzmDK8ds+gMANvPyOqzUScpERuO0yLxCrjQdM
         K1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=um6Mtxj9hn6MLF0/DG+dua7GL3nWe8jP1xt8gG30nLY=;
        b=Z/vzitDuhuAHdys/grGPx9/O3LQAQTxsQ4uOzKWMVOZb1zUso7SdV9PNVBACov7i+2
         JswPmxdpy82Ng83uxDY//0oMzg8boGrndAXulCMzyZgXoFzD2b0alfIIIkJQgJEI5KsE
         D5l9/jF2rRw/FI2eXnfEPWxFOSCQJwD4C46dtZ6b5NfuPosn+OH99h8keHpGJ4kdEExI
         4argHE6iTtNaKTo3NRZwVyfRNzgTXoNIo19fYSPFesc8BUcStsV/yY21mGStMF3k1aEH
         /ZVSu4zbX2EbM6ZQYaCNbRmYMWwBsN0gN3lmxcJ+kY1Vhev/WrfTAneehqUyT+Ab2gfp
         1XKQ==
X-Gm-Message-State: AOAM5323/+9yHA3mjlVYBItASHGdUm0hagIFFkX5wv9lS/k8vxzjoeHD
	kkol+/HoMzXkVAe6aENvMcxPww==
X-Google-Smtp-Source: ABdhPJzaCxARv0TVc1XJwcQ1nIwmAQeK6wnibMcmMKPiqUSE5dM+POfMx56MI0U7lwnC2UEaDu0dFg==
X-Received: by 2002:a63:680a:0:b0:3c2:7c45:c0ab with SMTP id d10-20020a63680a000000b003c27c45c0abmr8251254pgc.63.1653044920549;
        Fri, 20 May 2022 04:08:40 -0700 (PDT)
Received: from localhost.localdomain ([1.200.35.228])
        by smtp.gmail.com with ESMTPSA id s4-20020a170902ea0400b0015e8d4eb29bsm5530686plg.229.2022.05.20.04.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 04:08:40 -0700 (PDT)
From: Scott Chao <scott_chao@wistron.corp-partner.google.com>
To: hverkuil-cisco@xs4all.nl
Cc: mchehab@kernel.org,
	bleung@chromium.org,
	groeck@chromium.org,
	zhuohao@chromium.org,
	linux-media@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Scott Chao <scott_chao@wistron.corp-partner.google.com>
Subject: [PATCH] [v3] media: platform: cros-ec: Add moli to the match table
Date: Fri, 20 May 2022 19:08:31 +0800
Message-Id: <20220520110831.29502-1-scott_chao@wistron.corp-partner.google.com>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Google Moli device uses the same approach as the Google Brask
which enables the HDMI CEC via the cros-ec-cec driver.

Signed-off-by: Scott Chao <scott_chao@wistron.corp-partner.google.com>
---
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 8c8d8fc5e63e..25dc7309beab 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -217,6 +217,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Fizz", "0000:00:02.0", "Port B" },
 	/* Google Brask */
 	{ "Google", "Brask", "0000:00:02.0", "Port B" },
+	/* Google Moli */
+	{ "Google", "Moli", "0000:00:02.0", "Port B" },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.36.1

