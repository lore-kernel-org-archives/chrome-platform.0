Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856A47B
	for <chrome-platform@lists.linux.dev>; Tue,  1 Nov 2022 22:22:55 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id j12so14873778plj.5
        for <chrome-platform@lists.linux.dev>; Tue, 01 Nov 2022 15:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ra1DxUtw8duk3xgpznu2G+LVRe7hBZGi32jB2ilzSnQ=;
        b=iXQLCb7yS8xX4ME+5QdaSAHIGdXvLXPpDImW60Izftv/1EOP8FQUyGdvJSgy2CrcVA
         NDeh8roIFXnclEFuowwIJL6z1Gm7axBhj/DrnaQS+bUhWW+FUPndhk14geAqc9m4g0JE
         Eh2OQwEOKTVGH6lTQBJJFQFexxmdmHHHIgyi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ra1DxUtw8duk3xgpznu2G+LVRe7hBZGi32jB2ilzSnQ=;
        b=MnCEdv+qpdHZDq/4d/GeaPpvexcOKcLL5I83jFsfWVxEEL0ROu8Vf8jzLU/2pfES67
         ZeW9bJb+xKyxDQ/0mu9MCPqsC/kGvacF0EZkLTtp3MCGHKcJ2DQwUybAM/NOgHroGCbd
         GUrPwcNSjKW4W1wni1DyAGxznQ2wKkDbOJ5W0TkdM6Dkst8CkrdOlwJBkgZpyy6b0w/8
         In7p60xdhPDmrggkhgoimKkEwr57+Q0Owymwvxcg/tmrhdeE19+pXIRE3yMqNEQng4/f
         Gy1dR38tZ++E9w/yLp6HyzgxaEVs5+Xa8BGkwEh7iLViCXnRzE2gs1/tshYI6JbdCSO6
         YXZg==
X-Gm-Message-State: ACrzQf0/b2677lIG6yYjBH+debGTXoQMLvOq7tT3999YAh9+ae5F52PL
	xyFs0ju27ONKcgOmkjL2kvPwJA==
X-Google-Smtp-Source: AMsMyM7VzAAGq+6n5lYLKgnuYhLF2BBv6ZAjScDJ2lK/wn09iPkr186t67e0nbahn6C04vm8x20w0Q==
X-Received: by 2002:a17:902:ed8e:b0:187:27b3:74e5 with SMTP id e14-20020a170902ed8e00b0018727b374e5mr10525835plj.90.1667341375079;
        Tue, 01 Nov 2022 15:22:55 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:9c5f:7c8e:b8a2:3495])
        by smtp.gmail.com with UTF8SMTPSA id y22-20020aa79af6000000b0056be1581126sm7261255pfp.143.2022.11.01.15.22.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Nov 2022 15:22:54 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 4/5] platform/chrome: cros_ec_lightbar: Set PROBE_PREFER_ASYNCHRONOUS
Date: Tue,  1 Nov 2022 15:22:09 -0700
Message-Id: <20221101152132.v2.4.I565598102e0bfb03bdf8c090d3bfdf954d026bc5@changeid>
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

(no changes since v1)

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

