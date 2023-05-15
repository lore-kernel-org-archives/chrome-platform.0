Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C671952D
	for <chrome-platform@lists.linux.dev>; Mon, 15 May 2023 20:26:11 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3361b08a564so33192765ab.3
        for <chrome-platform@lists.linux.dev>; Mon, 15 May 2023 13:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684182370; x=1686774370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WtsdvTBA3WKi5YHrPj2RYjpUUqiBU6dPu45EYIw0z5Y=;
        b=NWhH4DpGt8VieswRPgRtgtYvAFGYENdIDHcSwOZhy/E1vflMfs4Pu1fe5X2inS1d76
         ZBQn2oTBbqmofMRUMFYcT8dpsqyBEfqeyM9Mb8lqdrAAOnEBee5fWKoCRIHUmJ58OcFI
         yF2nm5/e+q8LA0gqzHW6q2lfWIprZKROilJsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684182370; x=1686774370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WtsdvTBA3WKi5YHrPj2RYjpUUqiBU6dPu45EYIw0z5Y=;
        b=kbElGCUQQqH9WP7LPgwXBihXx85WlTDE3rsQ92tYinwQZz7DJ7R8bIxzO/5PTAXj/M
         IHSwio8NsH/T3MixyetZyof8eVSPA+bHnFc9/eVgQBgjbuBriz766WwF1juVdwNqajQ3
         n0otQfR59p5loSNgwoAYntiwNzP84XpIlKbEKLi0k79Q6lt2Ce7x75Rt9FfLcqqHJoR3
         v+0lYfYCM7QeeoCVOzKiKj3htFpaDXJVu+D+/IH6vSVmM2YNgXv6udcapmSdohVnQAGN
         vDSEZqV6OG8hbJql/swZfzxSu0w4WJMnRSF8C6e8iCetwIpZMkNU3dnAa6bCfDeJZat+
         Kg5w==
X-Gm-Message-State: AC+VfDzvCPJCGjcuoeif46spCxJmzzznkLmwK5Ix+qxi2YcZmWxrGVPS
	Vf2A6tbWr4c4jGYdU+OT361ITw==
X-Google-Smtp-Source: ACHHUZ4ir542iMVtI2Ji0s7aVVlQ1Rk/0NZdCKmBmOb1sZyQTr9SzKBI8PYLm5fOC4B+AtOCVUAKEA==
X-Received: by 2002:a92:d403:0:b0:326:3a39:89d0 with SMTP id q3-20020a92d403000000b003263a3989d0mr22977766ilm.1.1684182370715;
        Mon, 15 May 2023 13:26:10 -0700 (PDT)
Received: from timvp-p620-9115096.bld.corp.google.com ([2620:15c:183:200:f061:bf7d:2f95:2b91])
        by smtp.gmail.com with ESMTPSA id cb9-20020a0566381b0900b0041669a9fb62sm6296296jab.131.2023.05.15.13.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 13:26:10 -0700 (PDT)
From: Tim Van Patten <timvp@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: robbarnes@google.com,
	lalithkraj@google.com,
	rrangel@chromium.org,
	Tim Van Patten <timvp@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev
Subject: [PATCH] [v9] platform/chrome: cros_ec_lpc: Move host command to prepare/complete
Date: Mon, 15 May 2023 14:25:52 -0600
Message-ID: <20230515142552.1.I17cae37888be3a8683911991602f18e482e7a621@changeid>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update cros_ec_lpc_pm_ops to call cros_ec_lpc_prepare() during PM
.prepare() and cros_ec_lpc_complete() during .complete(). This moves the
host command that the AP sends and allows the EC to log entry/exit of
AP's suspend/resume more accurately.

Changes in v9:
- Remove log statements.
- Ignore return value from cros_ec_resume().

Changes in v8:
- Resend with chromium.org account.
- No code changes.

Changes in v7:
- Rename "host event" to "host command" in title/description.

Changes in v6:
- Fully restore fixes from v3.

Changes in v5:
- Restore fixes from v3.

Changes in v4:
- Update title and description.

Changes in v3:
- Update cros_ec_lpc_suspend() to cros_ec_lpc_prepare()
- Update cros_ec_lpc_resume() to cros_ec_lpc_complete()

Changes in v2:
- Include cros_ec_resume() return value in dev_info() output.
- Guard setting .prepare/.complete with #ifdef CONFIG_PM_SLEEP.

Reviewed-by: Raul E Rangel <rrangel@chromium.org>
Signed-off-by: Tim Van Patten <timvp@chromium.org>
---

 drivers/platform/chrome/cros_ec_lpc.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 68bba0fcafab3..2318eccd9c6ad 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -543,23 +543,25 @@ static const struct dmi_system_id cros_ec_lpc_dmi_table[] __initconst = {
 MODULE_DEVICE_TABLE(dmi, cros_ec_lpc_dmi_table);
 
 #ifdef CONFIG_PM_SLEEP
-static int cros_ec_lpc_suspend(struct device *dev)
+static int cros_ec_lpc_prepare(struct device *dev)
 {
 	struct cros_ec_device *ec_dev = dev_get_drvdata(dev);
 
 	return cros_ec_suspend(ec_dev);
 }
 
-static int cros_ec_lpc_resume(struct device *dev)
+static void cros_ec_lpc_complete(struct device *dev)
 {
 	struct cros_ec_device *ec_dev = dev_get_drvdata(dev);
-
-	return cros_ec_resume(ec_dev);
+	cros_ec_resume(ec_dev);
 }
 #endif
 
 static const struct dev_pm_ops cros_ec_lpc_pm_ops = {
-	SET_LATE_SYSTEM_SLEEP_PM_OPS(cros_ec_lpc_suspend, cros_ec_lpc_resume)
+#ifdef CONFIG_PM_SLEEP
+	.prepare = cros_ec_lpc_prepare,
+	.complete = cros_ec_lpc_complete
+#endif
 };
 
 static struct platform_driver cros_ec_lpc_driver = {
-- 
2.40.1.606.ga4b1b128d6-goog

