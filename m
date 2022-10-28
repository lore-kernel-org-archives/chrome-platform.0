Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3755D1FDF
	for <chrome-platform@lists.linux.dev>; Fri, 28 Oct 2022 21:14:58 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id y13so5794337pfp.7
        for <chrome-platform@lists.linux.dev>; Fri, 28 Oct 2022 14:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f26SHUDCKkAMIj7hIK8sG1Pls1nziet6vydLGNnOxd0=;
        b=dnA/a83rQeSZKqvN0pDy35114DLlbheKhA+37bGgVqAQUo/ykSu5Dq90/g3KNXN3SA
         qUf7BV73LW1eznwf0UQAlYOhfp//Utzl95cSmthb0sq/HG4YonuX1S4YCSmzrn4Par2v
         EVCCwvkjD24A6toOel1z6pvMXJvqQCpaumndY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f26SHUDCKkAMIj7hIK8sG1Pls1nziet6vydLGNnOxd0=;
        b=F4bpcZLjli0R2rwLJyCh7FvJzmsxEQNvZbqsSOq2y7P3lnoa6JiZmD31AbHMKSYnz8
         dZoA2hQyRPNgX/fL5JFemZzGKsiv4F8PAOGObmQnwqtzvuHHZM9EktshB6l//M6NB4A8
         uAAZxDZT5CCV96XH/wXh9qm37kxI6qXQNttDy5wMmFZvZ34zlR5s30qCWMnjZdBpYPdF
         2VQvxivKqqHJy4GN8JvjDHg7jmv0n6UpU0B6Fk4R7Bp9biDUC2Em/jXEJtfblhsinASH
         M84GBT+DIKjpssNv5zpahap+xHJ89+Vq1p8UHGg8zrxWbHQPprIW194C5wunA3l+Blsq
         1gYg==
X-Gm-Message-State: ACrzQf3wtyrCjymkI42znDXZZ5vENyj2GMgIeGodSYQUtU7kazhbiSCL
	TLiLG+uqm9hOkW8j7y9SfCJGcw==
X-Google-Smtp-Source: AMsMyM6zCYGK2VO/1jnIMbAxM6UrX9tbv4zJkSlVOMF9+ietep+0xrHrZNHpu8x7NqXFmgBwtWFoEw==
X-Received: by 2002:a63:2b53:0:b0:439:34d9:5d47 with SMTP id r80-20020a632b53000000b0043934d95d47mr1252271pgr.283.1666991697681;
        Fri, 28 Oct 2022 14:14:57 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:65f9:c180:249c:190f])
        by smtp.gmail.com with UTF8SMTPSA id m2-20020a170902db0200b001868ba9a867sm3498561plx.303.2022.10.28.14.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 14:14:57 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 3/5] platform/chrome: cros_ec_debugfs: Set PROBE_PREFER_ASYNCHRONOUS
Date: Fri, 28 Oct 2022 14:14:47 -0700
Message-Id: <20221028141411.3.Ic9a4f378f73319da323cd55940012fa6b1de24f4@changeid>
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

This driver takes on the order of 40ms to start on some systems. It
shouldn't have many cross-device dependencies to race with, nor racy
access to shared state with other drivers, so this should be a
relatively low risk change.

This driver was pinpointed as part of a survey of top slowest initcalls
(i.e., are built in, and probing synchronously) on a lab of ChromeOS
systems.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/platform/chrome/cros_ec_debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_debugfs.c b/drivers/platform/chrome/cros_ec_debugfs.c
index 4e63adf083ea..21d973fc6be2 100644
--- a/drivers/platform/chrome/cros_ec_debugfs.c
+++ b/drivers/platform/chrome/cros_ec_debugfs.c
@@ -521,6 +521,7 @@ static struct platform_driver cros_ec_debugfs_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.pm = &cros_ec_debugfs_pm_ops,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe = cros_ec_debugfs_probe,
 	.remove = cros_ec_debugfs_remove,
-- 
2.38.1.273.g43a17bfeac-goog

