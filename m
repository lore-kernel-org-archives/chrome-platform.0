Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CF47B
	for <chrome-platform@lists.linux.dev>; Tue,  1 Nov 2022 22:22:53 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id k15so6686732pfg.2
        for <chrome-platform@lists.linux.dev>; Tue, 01 Nov 2022 15:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekHYZpDEhYvmgLl9ibVW1UrC0RjLNjOHWSwbS/YHNwk=;
        b=We4cGsIeIdDqNRSLbBZwM8NCXtOgrImcozpOe19X4k4kUy2sMr99BV6XbE2pW0sAnN
         XDqAKM5zWARWYRjot6ekw2J13Css968k2n72VBsT23O+oQGiaBdFn+yG/C1JJkM0dtF4
         2RpMAYHLAqXHBI4BoJj+r4j9S9uCRZPfADNkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ekHYZpDEhYvmgLl9ibVW1UrC0RjLNjOHWSwbS/YHNwk=;
        b=B05RyiHMwxOYEVlsrs5gIvmPBIggPy/bawTFhnlRMqEU8HO33kvWH+myw5sGXdq9Iw
         Q8Eox5ojr3+U1rZ5sV+Oz21zj5sVYa64KR9TuzIKozhZz9cX/gi7pJmoprJFQAn8AzCv
         RfmPJQjEfcoH3eBjAqyoaX6QUBZ+gibEo5spwv9v8Gh/2fI9JOgeGlfTPbXVtBwD2yKu
         2T07aWU/1ZO281AJnd8JzMxWH60/iSVHRdejUtQUhu6+HI4J3URT6k0sCccv0wQKRD2P
         PRkGq+gK9d/XE1X6E4KlvCDYdqTP8b/JdwB7zY+Z9Ptr7JBPs0NhsGdO/xqqdYYgZ4Gn
         zpcQ==
X-Gm-Message-State: ACrzQf1F3WfkdDimC8QSMzPfZPrylrsctOuRrVRseJyKWAUARdaHkgsD
	MGddXdUZ3eZ7cxjaBE1LuR63AQ==
X-Google-Smtp-Source: AMsMyM6Z/kapNZXYi+y4YDi0ULoqmJ35hoYlfVuPSko31JNn1avbNlegyM4Sun4haQP8GrG47MPTeg==
X-Received: by 2002:a63:2b10:0:b0:451:5df1:4b17 with SMTP id r16-20020a632b10000000b004515df14b17mr18480543pgr.61.1667341373216;
        Tue, 01 Nov 2022 15:22:53 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:9c5f:7c8e:b8a2:3495])
        by smtp.gmail.com with UTF8SMTPSA id 9-20020a631749000000b0046f1e8cb30dsm6300322pgx.26.2022.11.01.15.22.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Nov 2022 15:22:52 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 3/5] platform/chrome: cros_ec_debugfs: Set PROBE_PREFER_ASYNCHRONOUS
Date: Tue,  1 Nov 2022 15:22:08 -0700
Message-Id: <20221101152132.v2.3.Ic9a4f378f73319da323cd55940012fa6b1de24f4@changeid>
X-Mailer: git-send-email 2.38.1.273.g43a17bfeac-goog
In-Reply-To: <20221101152132.v2.1.I0728421299079b104710c202d5d7095b2674fd8c@changeid>
References: <20221101152132.v2.1.I0728421299079b104710c202d5d7095b2674fd8c@changeid>
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

(no changes since v1)

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

