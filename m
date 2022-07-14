Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B7D4A38
	for <chrome-platform@lists.linux.dev>; Thu, 14 Jul 2022 16:09:49 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id r14so3221115wrg.1
        for <chrome-platform@lists.linux.dev>; Thu, 14 Jul 2022 09:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o/feeXuDF17U3RBhITfW4b8xd6jPaKrhz4mQZDocXnE=;
        b=qstB9JUwN0WNwR+RZEXK8uXWjBMHCoNZLWyXVtp2NScFXwB2tMJ2AA/eSIZWPKSLY2
         88iD23awwtBYX/Ip7FxVW6GpTRnbF+3npCqPksCBtK8s2GiqPQfyVZtuZLwTPSccDl3t
         jwTLFXRmMZvXeEnwxwdYZSLD15CHU9HC2M3sC9NxLvIslLwpJZSIk1yDvSPh6HYdirRQ
         c4otksAWqzzA54BEYImE1T0rOhRNtJApq+KbbqgilXbhY5dwrg1HVEmx/dnPEstD8y7l
         mLZr9WElpoCMJoxhLs7v0VmQ2L/NsFGCDa0SaTXf4op+ZhckSdp1oS+HRjFfcNFjMTkt
         ZbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o/feeXuDF17U3RBhITfW4b8xd6jPaKrhz4mQZDocXnE=;
        b=nxP18BjuIk5hh2v2AN2AK1JFj+jXUxC4Ec5KTKKNTJ+szFKpcdASFDGv9OdANQNOQB
         iozzerbxUiHqrcugJ0Z/5J9prg2Vvy2mCQfxzl/KAhBT5n0AVPY8qFA45GztaGNrKEMq
         m/8YjYumEa7EIlmI+MVnCxbuAG4DxND+38KSY8juGesWHeqO7DVsZI4nENVPjhlO+gLi
         qgdkWFxrY4chrb0RExA9vG4YD+kMt3tS4z3YKV+u/a6MDtB40GR92X84KjJgtef5+0/Q
         6q2o9OzfLDQRWVjWG+sigoc6+5s0aiScJyBL2q4Jinmhe2FEXmNbOCx28310ZznXqcvi
         keIQ==
X-Gm-Message-State: AJIora+hFUfvG6hM8+Ts3vPQAvBp+u5ObEUl5i03oGuwi34KQO8Me8h6
	Sm/JR4oytBQZMxWT0gkspDjFNA==
X-Google-Smtp-Source: AGRyM1thQHR7ljDVhTjy0f1PoC9fRTmLcI9qSF5de9HubbXG6CSsf9gMmgud55PZb4IwR9+1Aobk1w==
X-Received: by 2002:a5d:5451:0:b0:21d:2295:6a05 with SMTP id w17-20020a5d5451000000b0021d22956a05mr8796856wrv.302.1657814987995;
        Thu, 14 Jul 2022 09:09:47 -0700 (PDT)
Received: from localhost.localdomain (91-123-191-107.gigainternet.pl. [91.123.191.107])
        by smtp.gmail.com with ESMTPSA id p13-20020adff20d000000b0020e6ce4dabdsm1846289wro.103.2022.07.14.09.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 09:09:46 -0700 (PDT)
From: Patryk Duda <pdk@semihalf.com>
To: Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	upstream@semihalf.com,
	Patryk Duda <pdk@semihalf.com>
Subject: [PATCH] platform/chrome: cros_ec_proto: Update version on GET_NEXT_EVENT failure
Date: Thu, 14 Jul 2022 18:09:51 +0200
Message-Id: <20220714160951.9364-1-pdk@semihalf.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some EC based devices (e.g. Fingerpint MCU) can jump to RO part of the
firmware (intentionally or due to device reboot). The RO part doesn't
change during the device lifecycle, so it won't support newer version
of EC_CMD_GET_NEXT_EVENT command.

Function cros_ec_query_all() is responsible for finding maximum
supported MKBP event version. It's usually called when the device is
running RW part of the firmware, so the command version can be
potentially higher than version supported by the RO.

The problem was fixed by updating maximum supported version when the
device returns EC_RES_INVALID_VERSION (mapped to -ENOPROTOOPT). That way
the kernel will use highest common version supported by RO and RW.

Fixes: 3300fdd630d4 ("platform/chrome: cros_ec: handle MKBP more events flag")
Cc: <stable@vger.kernel.org> # 5.10+
Signed-off-by: Patryk Duda <pdk@semihalf.com>
---
When Fingerprint MCU is rebooted (e.g. as a part of tests) it jumps to
the RO image and performs RW image signature check. If kernel calls
EC_CMD_GET_NEXT_EVENT FPMCU RO will respond with EC_RES_INVALID_VERSION
because it's older than RW and supports up to version 1 of the command.
As a result kernel keeps trying to get MKBP events and effectively
blocks FPMCU from jumping to RW image.

Before patch 3300fdd630d4 the driver called version 1 of the command.
If the device responded with EC_RES_INVALID_VERSION, the driver would
use version 0 of the command.

Best regards,
Patryk

 drivers/platform/chrome/cros_ec_proto.c | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index ff767dccdf0f6..0a131045d50a9 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -750,6 +750,7 @@ int cros_ec_get_next_event(struct cros_ec_device *ec_dev,
 	u8 event_type;
 	u32 host_event;
 	int ret;
+	u32 ver_mask = 0;
 
 	/*
 	 * Default value for wake_event.
@@ -771,6 +772,37 @@ int cros_ec_get_next_event(struct cros_ec_device *ec_dev,
 		return get_keyboard_state_event(ec_dev);
 
 	ret = get_next_event(ec_dev);
+	/*
+	 * -ENOPROTOOPT is returned when EC returns EC_RES_INVALID_VERSION.
+	 * This can occur when EC based device (e.g. Fingerprint MCU) jumps to
+	 * the RO image which doesn't support newer version of the command. In
+	 * this case we will attempt to update maximum supported version of the
+	 * EC_CMD_GET_NEXT_EVENT.
+	 */
+	if (ret == -ENOPROTOOPT) {
+		dev_dbg(ec_dev->dev,
+			"GET_NEXT_EVENT returned invalid version error.\n");
+		ret = cros_ec_get_host_command_version_mask(ec_dev,
+							EC_CMD_GET_NEXT_EVENT,
+							&ver_mask);
+		if (ret < 0 || ver_mask == 0)
+			/*
+			 * Do not change the MKBP supported version if we can't
+			 * obtain supported version correctly. Please note that
+			 * calling EC_CMD_GET_NEXT_EVENT returned
+			 * EC_RES_INVALID_VERSION which means that the command
+			 * is present.
+			 */
+			return -ENOPROTOOPT;
+
+		ec_dev->mkbp_event_supported = fls(ver_mask);
+		dev_dbg(ec_dev->dev, "MKBP support version changed to %u\n",
+			ec_dev->mkbp_event_supported - 1);
+
+		/* Try to get next event with new MKBP support version set. */
+		ret = get_next_event(ec_dev);
+	}
+
 	if (ret <= 0)
 		return ret;
 
-- 
2.31.0

