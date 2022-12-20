Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906621383
	for <chrome-platform@lists.linux.dev>; Tue, 20 Dec 2022 06:00:26 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id w37so7669854pga.5
        for <chrome-platform@lists.linux.dev>; Mon, 19 Dec 2022 22:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vlt5L7PlVbNdJJaExwquyrI4ZxAOGOeQ6ynKwqgYwpA=;
        b=U4aWNeCxYSUN5ig1wQqKMbkaUkYM7c0YFJoV+eHi0OiAN/CzAW3LpMzr6H1o5c/aCU
         hAfqE/riijqebe1EKvmAr2wE70NX87sEQIgpMCGsMfHPZy82EX8541fD1iBLnLH8jldg
         X7yCrXbv9icl7HW072RwN5TSqB/LxwTagF5edyStp+OszCGE/A/0dECGM06Lf2s/WHkL
         Ohk2ukrdn2BsUFWbqmPgiJEjvofz4vARX9vtA3FbEkNfoe6sA8yFSMNCPtN4VyPJXOLi
         YsTtVEfW9qTQA7yVdc3nHPaNOrodY4yhdS1RZCaHKQSIt7/VzLibS2teawEx9rSqkOma
         ol1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vlt5L7PlVbNdJJaExwquyrI4ZxAOGOeQ6ynKwqgYwpA=;
        b=KPY7vFi3Goymwc9kOuxqpjcJDB7dggPSeApmSwvDKbRPJWugUmSM0faxilQdKQKfFg
         3VGR5X7CvwxVofxbZQSJSAHwrZcsHdxPAtDarmW0uZmxZZ4aZTmGME5RaIJC4Q/5gDSQ
         YpAqpFAvr+MgnKxxktlOI0r9mgMtZs8cSrOJfRhujn0v8UhhGkAZCcqr+UN6faW2cwx5
         HqFzchXcCGu6NLl/tTa78aP0IYQcFbQvTr9jlpnDuFmPCLhWc37CjaMszXrgxhf0YPOU
         /mHn25s3SPXJMYcqUOhhQvx9WSrLt1kGbQR3kmd0ftNLx0LSIZsy+1EZOnhR3c1O47TI
         s0Jw==
X-Gm-Message-State: AFqh2kp1lCp1+kEInc5QxSwcU2WFr3EPAUzHZbIczJBSowUVOtcjbIki
	cIGGUinsQJle2x9kqZtXvpUwyxcdsdIkKsYe
X-Google-Smtp-Source: AMrXdXsihtHIsVRfcKkT0WgAyl4LWKBQjahqEdXysshmOPl7jp1UPWw1Jij+kWJt93rhBxkxdY4qog==
X-Received: by 2002:a05:6a00:f0f:b0:578:4efa:e3ae with SMTP id cr15-20020a056a000f0f00b005784efae3aemr15144736pfb.33.1671516025983;
        Mon, 19 Dec 2022 22:00:25 -0800 (PST)
Received: from ruihai-HP.huaqin.com ([101.78.151.205])
        by smtp.gmail.com with ESMTPSA id 12-20020a62150c000000b00574f83c5d51sm7637913pfv.198.2022.12.19.22.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 22:00:25 -0800 (PST)
From: Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>
To: pmalani@chromium.org,
	bleung@chromium.org,
	groeck@chromium.org,
	knoxchiou@chromium.org,
	weishunc@chromium.org
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>
Subject: [PATCH] platform/chrome: cros_ec_typec: deferred probe when typec count mismatch
Date: Tue, 20 Dec 2022 13:59:54 +0800
Message-Id: <20221220055954.11197-1-zhouruihai@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>

The kernel bootup is much faster with normal mode. In this case,
there is a chance that the cros-ec-typec module get the actual typec
port counts but not accurate from ec before ec is able to setup it.
It will block the HDMI mux function.
Hence, return -EPROBE_DEFER to put the device onto the deferred probe
list when the typec count mismatch between ec and node.

Signed-off-by: Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>
---
 drivers/platform/chrome/cros_ec_typec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 59de4ce01fab..d821501e875c 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -382,7 +382,7 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 
 	if (nports > typec->num_ports) {
 		dev_err(dev, "More ports listed than can be supported.\n");
-		return -EINVAL;
+		return -EPROBE_DEFER;
 	}
 
 	/* DT uses "reg" to specify port number. */
-- 
2.17.1

