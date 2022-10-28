Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163551FDF
	for <chrome-platform@lists.linux.dev>; Fri, 28 Oct 2022 21:14:59 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id d10so5800396pfh.6
        for <chrome-platform@lists.linux.dev>; Fri, 28 Oct 2022 14:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPP9pF7fIvV/nLcvOx6oDjBVViuf9MAG5n+X6Tj0h3Y=;
        b=ZW9XW/GfmujrJzDszG++/tJuCMwJBY7sSL2UrozY9KqH2Q0vlWzgUTXD7vpYtObRm/
         61xOuFMG+ZzrULCo/W9z8JasQoFrm6Dg6gHxExJyQU1D1f4QjBpE7oLrC23Jqd63ycbX
         obYJUiuItCe8/7dqWy6i77dDUD6hvr7XAIWsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZPP9pF7fIvV/nLcvOx6oDjBVViuf9MAG5n+X6Tj0h3Y=;
        b=26K7ZdvrvgzOet0+WqdKOxj0k13ltl7jdhcLIekZKHbOuu3j2xXxS+pSmphIQXKgSw
         h5w0Hlw67bS78IwZoP/LLibnW5lvpJgbglNsHsVPEvDowr5p5yrRy8T32szy9bG0Krry
         /AyReFtJNVFlxdGY3aFZ3N3EWkYL+pcFmbtSAQvyTpjt9ZvD8BOBCjq5RVZZGKQU/qqU
         avQDz/H+xQduwoQoIzwlylGiOBQMussDgq3j2UvOapOsgs95mgNFZczp2LYOgUGG/RKR
         D06Ss8OzU8MthlYsmChSJmfmHMKSm6h0Z9Jb9bdNqQI/nM+spDosDqBqjNItQOHBC8qj
         v0ag==
X-Gm-Message-State: ACrzQf1PX2ImsQYSciG0P5aySRBZqM79RMtZRhhqUfMOywSGUJGrB1iE
	/vAGDRREA/QTVEX9ieA69hqtag==
X-Google-Smtp-Source: AMsMyM6ePtsEr6bhRuJOE0O5l6NLMbLUbjQQgLCds/0zyy2pDwvRkeYSpVxPsE++pdwZHk+dQWXyEQ==
X-Received: by 2002:a05:6a00:1749:b0:563:8346:12e9 with SMTP id j9-20020a056a00174900b00563834612e9mr1125101pfc.68.1666991699582;
        Fri, 28 Oct 2022 14:14:59 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:65f9:c180:249c:190f])
        by smtp.gmail.com with UTF8SMTPSA id jc19-20020a17090325d300b00186ae20e8dcsm3415829plb.271.2022.10.28.14.14.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 14:14:59 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 4/5] platform/chrome: cros_ec_lightbar: Set PROBE_PREFER_ASYNCHRONOUS
Date: Fri, 28 Oct 2022 14:14:48 -0700
Message-Id: <20221028141411.4.I565598102e0bfb03bdf8c090d3bfdf954d026bc5@changeid>
X-Mailer: git-send-email 2.38.1.273.g43a17bfeac-goog
In-Reply-To: <20221028141411.1.I0728421299079b104710c202d5d7095b2674fd8c@changeid>
References: <20221028141411.1.I0728421299079b104710c202d5d7095b2674fd8c@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver takes on the order of 15ms to start on some systems. Even on
systems where there is no lightbar support, it can take a few
milliseconds just to probe the EC for support. It shouldn't have many
cross-device dependencies to race with, nor racy access to shared state
with other drivers, so this should be a relatively low risk change.

This driver was pinpointed as part of a survey of top slowest initcalls
(i.e., are built in, and probing synchronously) on a lab of ChromeOS
systems.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/platform/chrome/cros_ec_lightbar.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_lightbar.c b/drivers/platform/chrome/cros_ec_lightbar.c
index 469dfc7a4a03..ff4d619cf924 100644
--- a/drivers/platform/chrome/cros_ec_lightbar.c
+++ b/drivers/platform/chrome/cros_ec_lightbar.c
@@ -601,6 +601,7 @@ static struct platform_driver cros_ec_lightbar_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.pm = &cros_ec_lightbar_pm_ops,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe = cros_ec_lightbar_probe,
 	.remove = cros_ec_lightbar_remove,
-- 
2.38.1.273.g43a17bfeac-goog

