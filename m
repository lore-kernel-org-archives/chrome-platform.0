Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B0115A7
	for <chrome-platform@lists.linux.dev>; Fri, 20 May 2022 10:43:19 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id z7-20020a17090abd8700b001df78c7c209so11172875pjr.1
        for <chrome-platform@lists.linux.dev>; Fri, 20 May 2022 03:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wistron-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=um6Mtxj9hn6MLF0/DG+dua7GL3nWe8jP1xt8gG30nLY=;
        b=QQI6WKxPdPQlxQR2wBHF8ieDOe8AjPnodlbFL2coMjZXGkbYc3ejUJKSdjhWhC5Hrz
         4Frb0wz7hDNs9vuvxfcXLhPiO/Vx5V198ppq/coM2RoCMTxc3hT+fOnO7nrmqY5h3XmR
         G783hWx646iduUN4WKTRng/rwRaGCJB7vVzArrL7IBWE6YrVsiTmBAjOrFsltZZgCWKC
         X8d/1aEJnLduuk18lRy7YYSPFsXQFvixoCfTXD6/cjU0cOScIVj+yBeDz5Fa9UhcAJTX
         pmsDtshY4fB4qdLauDDjsdpLjYYdCUXszo7Ii3G0UeylDOgmy1dvD9zwtGOGV5mHylrI
         +97Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=um6Mtxj9hn6MLF0/DG+dua7GL3nWe8jP1xt8gG30nLY=;
        b=05vHvlSpl8Q8MDfg9sPRNN07Mb/Zpy1hvWucPH1O0nbQujCxNANT0e9B10bDdEHSL/
         DU8nZK6VPPbcbCw8Pc5X98uY2l8f9Lz3R5Yo1VFQ0pj4xPOKPPiZlaOEYXNUc/VRVCuo
         H7CawWOLTyiAzy6FPzlWU/JGp8b8xAvC5wOfjQysms8oXqSA22SUBJwE1NWQLkGwccnE
         6PJf7fGYSNbfx9iq9hnjGY0oN52WBPgMwPWtNvLKjSigcJylC8oil8lGC1G5XAhA9w6q
         uRpgU19KdjxV76UuUHLkarYhKDc0mTzaRmRvhU8Y6bJK4e5Dssu2IUz+4dab1xMQm3Qp
         eo0A==
X-Gm-Message-State: AOAM5320UX1Mc4qhj17WeTejz6WnZg1j6HaNgIXEqSsmyZkqidadlOY1
	USrBeIkY16QGYxOKbvtHVj4E9w==
X-Google-Smtp-Source: ABdhPJzJvp4abACIC9bSi6TaYIAOrBzPR9AkpGWI0uG2VlDBiX0Juhn7NPRg20Zp/1xDQU2YVkvBgQ==
X-Received: by 2002:a17:903:244f:b0:15e:bb9a:3aa9 with SMTP id l15-20020a170903244f00b0015ebb9a3aa9mr9053463pls.78.1653043398455;
        Fri, 20 May 2022 03:43:18 -0700 (PDT)
Received: from localhost.localdomain ([1.200.35.228])
        by smtp.gmail.com with ESMTPSA id ru13-20020a17090b2bcd00b001df4a0e9357sm1598543pjb.12.2022.05.20.03.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 03:43:18 -0700 (PDT)
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
Subject: [PATCH] [v2] media/platform-wide: platform: Add moli to the match table
Date: Fri, 20 May 2022 18:42:53 +0800
Message-Id: <20220520104253.26054-1-scott_chao@wistron.corp-partner.google.com>
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

