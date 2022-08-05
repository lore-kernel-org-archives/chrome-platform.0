Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD102F2B
	for <chrome-platform@lists.linux.dev>; Fri,  5 Aug 2022 22:17:24 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id x2-20020a17090ab00200b001f4da5cdc9cso9501735pjq.0
        for <chrome-platform@lists.linux.dev>; Fri, 05 Aug 2022 15:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=ZJtcr9fEhex1ZbEYDZnoQSyBPhqS7q79HP7zTOYQSF8=;
        b=FljTYTTkjpeuCYnmkCbpOCLALwZfJbnC5bQKGbqsr2ZWzJZodmLrJgX+yf3MZeztLE
         FWWuR7MuPGkOLeeSKrLii4CnmbfTB8h1xTcgDNJV5cttJ9oI4nuoWl7gXJsSGS+6gQhQ
         IaL8a72rMqr72M3b1HtHbxfGl3TTu/785Z1/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=ZJtcr9fEhex1ZbEYDZnoQSyBPhqS7q79HP7zTOYQSF8=;
        b=yqEbBStPi6mSg0ASLeZt8pAsNgg+Hjiyp09qM4F5OWdLjSA+Q5Dhx+A0g7aj3pIkWW
         UJgvYRvfGEPh0F7ypLuirbLNdqxhq0TUZho6OvU743znvDth18+66LyEXWLF/mVEBroU
         FY2f/jbIto2WeiRsAqY9rQ8E4payw5vOi6MvZro6/xYK/gqPQrQ/Xo7VNVk6KlAI4kR1
         nteI5BgDiQxKVdYWA4wyyg+4KilmiNt8ggPbiUuiBVRxKxtIubS8vhewh47YGndLQX7C
         iMH93L51MQi0S3q2raq+103xhV5EBeQzn8+RqPh0UCTWzL9G3LJgocZ8awRKV+XtMn/g
         xsfg==
X-Gm-Message-State: ACgBeo2xb9p3CREwdTt4mw6lhorsQNMlwyHR06lWQj0S7+l8HcYVFJio
	FvOJDZnIIzsJZYvzASUADjfFwA==
X-Google-Smtp-Source: AA6agR5ZCKWJCg6qYS0tP2dZfL9pHJTLa4Wn6fzy1yZcEme+4Ko4oC/h354MUmj2/cT4Y+UYBTcLhQ==
X-Received: by 2002:a17:90a:b785:b0:1f1:be59:a607 with SMTP id m5-20020a17090ab78500b001f1be59a607mr9456164pjr.84.1659737844220;
        Fri, 05 Aug 2022 15:17:24 -0700 (PDT)
Received: from evgreen-glaptop.lan ([98.45.66.167])
        by smtp.gmail.com with ESMTPSA id b10-20020aa78eca000000b0052dce4edceesm3489164pfr.169.2022.08.05.15.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 15:17:23 -0700 (PDT)
From: Evan Green <evgreen@chromium.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Rajat Jain <rajatja@chromium.org>,
	Evan Green <evgreen@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/chrome: cros_ec: Expose suspend_timeout in debugfs
Date: Fri,  5 Aug 2022 15:17:17 -0700
Message-Id: <20220805151551.1.Idd188ff3f9caddebc17ac357a13005f93333c21f@changeid>
X-Mailer: git-send-email 2.31.0
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In modern Chromebooks, the embedded controller has a mechanism where
it will watch a hardware-controlled line that toggles in suspend, and
wake the system up if an expected sleep transition didn't occur. This
can be very useful for detecting power management issues where the
system appears to suspend, but doesn't actually reach its lowest
expected power states.

Sometimes it's useful in debug and test scenarios to be able to control
the duration of that timeout, or even disable the EC timeout mechanism
altogether. Add a debugfs control to set the timeout to values other
than the EC-defined default, for more convenient debug and
development iteration.

Signed-off-by: Evan Green <evgreen@chromium.org>
---

 Documentation/ABI/testing/debugfs-cros-ec   | 22 +++++++++++++++++++++
 drivers/platform/chrome/cros_ec.c           |  3 ++-
 drivers/platform/chrome/cros_ec_debugfs.c   |  3 +++
 include/linux/platform_data/cros_ec_proto.h |  1 +
 4 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/debugfs-cros-ec b/Documentation/ABI/testing/debugfs-cros-ec
index 1fe0add99a2a99..8e7e76e6481550 100644
--- a/Documentation/ABI/testing/debugfs-cros-ec
+++ b/Documentation/ABI/testing/debugfs-cros-ec
@@ -54,3 +54,25 @@ Description:
 		this feature.
 
 		Output will be in the format: "0x%08x\n".
+
+What:		/sys/kernel/debug/<cros-ec-device>/suspend_timeout
+Date:		August 2022
+KernelVersion:	6.0
+Description:
+		Some ECs have a feature where they will track transitions to the
+		a hardware-controlled sleep line, such as Intel's SLP_S0 line,
+		in order to detect cases where a system failed to go into deep
+		sleep states. The suspend_timeout file controls the amount of
+		time in milliseconds the EC will wait before declaring a sleep
+		timeout event and attempting to wake the system.
+
+		Supply 0 to use the default value coded into EC firmware. Supply
+		65535 to disable the EC sleep failure detection mechanism.
+		Values in between 0 and 65535 indicate the number of
+		milliseconds the EC should wait after a sleep transition before
+		declaring a timeout. This includes both the duration after a
+		sleep command was received but before the hardware line changed,
+		as well as the duration between when the hardware line changed
+		and the kernel sent an EC resume command.
+
+		Output will be in the format: "%u\n".
diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index 8aace50d446d65..e8d3e2a29a58f5 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -115,7 +115,7 @@ static int cros_ec_sleep_event(struct cros_ec_device *ec_dev, u8 sleep_event)
 	if (ec_dev->host_sleep_v1) {
 		buf.u.req1.sleep_event = sleep_event;
 		buf.u.req1.suspend_params.sleep_timeout_ms =
-				EC_HOST_SLEEP_TIMEOUT_DEFAULT;
+				ec_dev->suspend_timeout;
 
 		buf.msg.outsize = sizeof(buf.u.req1);
 		if ((sleep_event == HOST_SLEEP_EVENT_S3_RESUME) ||
@@ -188,6 +188,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 	ec_dev->max_passthru = 0;
 	ec_dev->ec = NULL;
 	ec_dev->pd = NULL;
+	ec_dev->suspend_timeout = EC_HOST_SLEEP_TIMEOUT_DEFAULT;
 
 	ec_dev->din = devm_kzalloc(dev, ec_dev->din_size, GFP_KERNEL);
 	if (!ec_dev->din)
diff --git a/drivers/platform/chrome/cros_ec_debugfs.c b/drivers/platform/chrome/cros_ec_debugfs.c
index 0dbceee87a4b1a..530378bd4359dd 100644
--- a/drivers/platform/chrome/cros_ec_debugfs.c
+++ b/drivers/platform/chrome/cros_ec_debugfs.c
@@ -470,6 +470,9 @@ static int cros_ec_debugfs_probe(struct platform_device *pd)
 	debugfs_create_x32("last_resume_result", 0444, debug_info->dir,
 			   &ec->ec_dev->last_resume_result);
 
+	debugfs_create_u16("suspend_timeout", 0664, debug_info->dir,
+			   &ec->ec_dev->suspend_timeout);
+
 	ec->debug_info = debug_info;
 
 	dev_set_drvdata(&pd->dev, ec);
diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
index 408b29ca4004be..60132444f7daa6 100644
--- a/include/linux/platform_data/cros_ec_proto.h
+++ b/include/linux/platform_data/cros_ec_proto.h
@@ -169,6 +169,7 @@ struct cros_ec_device {
 	int event_size;
 	u32 host_event_wake_mask;
 	u32 last_resume_result;
+	u16 suspend_timeout;
 	ktime_t last_event_time;
 	struct notifier_block notifier_ready;
 
-- 
2.31.0

