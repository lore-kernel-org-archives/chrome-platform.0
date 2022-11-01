Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26ED47B
	for <chrome-platform@lists.linux.dev>; Tue,  1 Nov 2022 22:22:50 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id b29so14711186pfp.13
        for <chrome-platform@lists.linux.dev>; Tue, 01 Nov 2022 15:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R2mYasaks6aptBfsPPyIC9J85cwXhD99E7+c00DwPbA=;
        b=Ajojwm8aTq5a5qEgs5TEi16nesN2y4q0kWSF7HGc3uXuKHbEjEOkTGVewj2Gmoepsc
         8ntCNEufJHV8rY5YDEU3A6r/uN6PFBK/3pq4VVWumLluDO1VWMXbCMBDvfbEPcIn/DOz
         B6idaltMm4ZGPq7Mji80bHMyTPfYZUjClWXWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R2mYasaks6aptBfsPPyIC9J85cwXhD99E7+c00DwPbA=;
        b=YqS6ZF4NMX2UCxMhwZGca+rpeOgWSZ2fo3X2PftKiAMANdAtyHdCcT3sa7DwdovBvn
         Orrkc6c7wg5GFItPS+9Gc2TinhV+RcuyT+nSs4ltavb4V3KaKFWNHsZ60DH1IkM3j371
         MwWv+ByERYv7X1hcdWZrkhMWTxi3oGkhIr3ApVmgFikPL24mwl5DVVuO0j7F07KHEye7
         ZIQvJbMf5X5hanHPIibwn+y0j5clnckPFZKkhrbOjwWA+IZvCjkGETg9JoDHzpY3diau
         Uug6Wyts6mEFRWu4JBasHSTQ8EHyPLQ8JDu39uVNSfbmAtFen4M/R5nX2Dtwg/5ulM7y
         ukBg==
X-Gm-Message-State: ACrzQf2XA1Z0x9QFpe9lKAb94Toe0+12X4Wug7Ds5jDBQZ1KHMmxZM6r
	O/GoBhTLeWbU5tILEAfP3wrthA==
X-Google-Smtp-Source: AMsMyM7z44U0WddjC7xZsKVbzAMfSn71Yqn/mU5tK6PR+vCLItR7s0tYh5Xrc+NUSoTYfVDlvmmr0w==
X-Received: by 2002:a05:6a00:1706:b0:56d:3028:23f0 with SMTP id h6-20020a056a00170600b0056d302823f0mr18245554pfc.59.1667341369540;
        Tue, 01 Nov 2022 15:22:49 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:9c5f:7c8e:b8a2:3495])
        by smtp.gmail.com with UTF8SMTPSA id f13-20020a170902f38d00b0017b264a2d4asm6862730ple.44.2022.11.01.15.22.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Nov 2022 15:22:49 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 1/5] platform/chrome: cros_ec_lpc: Move mec_init to device probe
Date: Tue,  1 Nov 2022 15:22:06 -0700
Message-Id: <20221101152132.v2.1.I0728421299079b104710c202d5d7095b2674fd8c@changeid>
X-Mailer: git-send-email 2.38.1.273.g43a17bfeac-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Disregarding the weird global state hiding in this cros_ec_lpc_mec_*()
stuff, it belongs in device probe. We shouldn't assume we can access
hardware resources when the device isn't attached to the driver.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
 - drop cros_ec_lpc_mec_destroy() (removed in -next; was done wrong in
   my v1 anyway)

 drivers/platform/chrome/cros_ec_lpc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 6ef5e5d40ba4..48302183d62e 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -354,6 +354,9 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 		return -EBUSY;
 	}
 
+	cros_ec_lpc_mec_init(EC_HOST_CMD_REGION0,
+			     EC_LPC_ADDR_MEMMAP + EC_MEMMAP_SIZE);
+
 	/*
 	 * Read the mapped ID twice, the first one is assuming the
 	 * EC is a Microchip Embedded Controller (MEC) variant, if the
@@ -586,9 +589,6 @@ static int __init cros_ec_lpc_init(void)
 		return -ENODEV;
 	}
 
-	cros_ec_lpc_mec_init(EC_HOST_CMD_REGION0,
-			     EC_LPC_ADDR_MEMMAP + EC_MEMMAP_SIZE);
-
 	/* Register the driver */
 	ret = platform_driver_register(&cros_ec_lpc_driver);
 	if (ret) {
-- 
2.38.1.273.g43a17bfeac-goog

