Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1AC7C
	for <chrome-platform@lists.linux.dev>; Mon,  4 Apr 2022 04:11:21 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id l4-20020a17090a49c400b001c6840df4a3so7916577pjm.0
        for <chrome-platform@lists.linux.dev>; Sun, 03 Apr 2022 21:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mmN7qtmnz9zJj+1xO5pDRuU70Xzo2jJcKr0sswtR2JA=;
        b=YhYyGtNTV+WpURFXebyNjUmPMblXNGgVGmDeL/ONC6eWKIhn3ZxB+jPYb//rCIdBNf
         u61GoO3kMvMBPqukrOIsONqSM5SvtOGiCLoPoqF3osM2bvjo6wGDQiI3FBOunsXFeUwd
         Mi05Gg7bCXubuHuKbvwdO6+/6jXTuGgdco2xFaUXf514EbMe6Tbm5XgYPRcBnmk+xPOW
         l2KL7mMZnjeR2jpkGt2d+QsOuj+Q4jyEPaPdeYSzB1W7ZRSKfScyn9DXOObWtjuz1iuj
         KfluTkS3dRUVj/oMhONDVj2Iak0G9I363XaZU/pxaZ+4T5PRpDNCEI0eQvysr6wZSvUv
         FCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mmN7qtmnz9zJj+1xO5pDRuU70Xzo2jJcKr0sswtR2JA=;
        b=sS1y1zaabM41qcy6+AJeK4dD6ItmZJnXvwodiPzZpYbuk4ku459Wlv7BqvfAH9XW4f
         VNkuZACYLEhruj+VsQ1Eb5a5/DeRxThiAbeti4UE/VTvVxNI6bqPuUErO4XLFH+UfnJd
         Jd7V5QvLVqlX4e8LCgr+Oa5sIGy4J0iDNlR8Y6vsw4R2czeePGRfBmlOZXCI+nDwnLUQ
         1tTLML4DMzObm8vMIwlRYzFyxxqYjIRcs7uKYs1CaVKgahbtOfxdUO1HvNSbadJ3hAej
         8+nXg97EWAjJr2jSoe+PzDex9d7iP+6WG8CyFMS7ykouoWaGz64mk2XUOVfMK5jIx8Sd
         GyRw==
X-Gm-Message-State: AOAM53383iZavZiid1yuUbx4pMT8hZS3N9f0S8shu/HLIZyHnpTzlj7u
	DbQKhsRCUnfoLJxG4AzjcD0=
X-Google-Smtp-Source: ABdhPJxii3cMBBdQUfskIVXUrDArJikACE9u3FZkmsIVlTucBiyOSn1Atuuz0jETrgJfiv69ojYrMA==
X-Received: by 2002:a17:902:ce90:b0:154:3029:97e6 with SMTP id f16-20020a170902ce9000b00154302997e6mr20863385plg.111.1649045481102;
        Sun, 03 Apr 2022 21:11:21 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
        by smtp.gmail.com with ESMTPSA id x123-20020a623181000000b004fdf99d25f6sm2882641pfx.80.2022.04.03.21.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 21:11:20 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH] platform/chrome: cros_ec_typec: Check for EC driver
Date: Mon,  4 Apr 2022 13:11:01 +0900
Message-Id: <20220404041101.6276-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The EC driver may not be initialized when cros_typec_probe is called,
particulary when CONFIG_CROS_EC_CHARDEV=m.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 drivers/platform/chrome/cros_ec_typec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 4bd2752c0823..7cb2e35c4ded 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -1084,6 +1084,9 @@ static int cros_typec_probe(struct platform_device *pdev)
 	}
 
 	ec_dev = dev_get_drvdata(&typec->ec->ec->dev);
+	if (!ec_dev)
+		return -EPROBE_DEFER;
+
 	typec->typec_cmd_supported = cros_ec_check_features(ec_dev, EC_FEATURE_TYPEC_CMD);
 	typec->needs_mux_ack = cros_ec_check_features(ec_dev, EC_FEATURE_TYPEC_MUX_REQUIRE_AP_ACK);
 
-- 
2.35.1

