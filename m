Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9833D2F29
	for <chrome-platform@lists.linux.dev>; Tue, 23 Aug 2022 15:59:20 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-335ff2ef600so247064937b3.18
        for <chrome-platform@lists.linux.dev>; Tue, 23 Aug 2022 08:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc;
        bh=s208mFKW5mux3x3fFQzuS0oklKHocAknnwXo8nQY6YI=;
        b=onfDdlrNeXjaHJVDclJvl6kkSSZkwz5ngSB+xHxpci91JPwn/QO5fmV/397a+aKKxp
         zTPVzXdt1umOXjW8wgznpZ1IlQ4kZgOHnBZiB55z16cURRuftdST3FqI3I+UVo3b11h3
         XxkIIXmNoF0oLdrwDceCt/wTQn9UJbLIdHuQgggVxuaVm5+KNac5PQPzdHbFe2CFjx9I
         hbcEIsznWyLSkDngLXclu2/eSvs7K2b1fH4EzzNEg86OETq+ltNOkV9PIpYilyHRkqL4
         1nBZFFUXLC3aJEPGR7WT+kszNxPVrmIjbjrjcAfyeFB3LvUdjBuoo1vlYq60nMCIA7S1
         lpQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc;
        bh=s208mFKW5mux3x3fFQzuS0oklKHocAknnwXo8nQY6YI=;
        b=OrS3oMM/KyhbdvgtTg5jKtssEl6pBZzCxI+Jdi7OvFwuXbkzKTuRJDa2RI0UWYAQXm
         KzOml7LF5VQjmk0/zK3ZPA+0Ul5GmHXnjZeCHd9HJavOzXpobhf35cm0Mg5nH/ymeJgK
         smV0fV5m8RsLY11torn6jrxzr0QQGJPe0LEZvpVVWB6X0tt4Ru4jEAcFfV2EZRB52rH5
         wRNscxC6I67XGyKDuI4A2F6IP79YnglKg3f2Qd5HaAG58ZK1zcgKSSJzD8sjV5w14zV8
         NRe208WWXrAmAQemawhUe3X6zDmSEpjZN+BKiMcrYJbWCt17ypK/PKDeebq606g0xpsM
         L9HA==
X-Gm-Message-State: ACgBeo3zpDZrJSAt27eW1FWLo6jyJABBvOfFXUURjhx0Gqnl0iqhAtw/
	Z4AeaBZz9L7MyhC/Bwj5DMDH2wT9zg==
X-Google-Smtp-Source: AA6agR6lvaz85tu0pzAuiS+DWBgUc/EfOcw88DjqRBJtufUAKYnAyUkyBx9LWajcnsGGF57Q4v0iO+5xwQ==
X-Received: from timvp-p620-9115096.bld.corp.google.com ([2620:15c:183:200:2f3b:1daa:d20:c362])
 (user=timvp job=sendgmr) by 2002:a5b:d09:0:b0:695:f25c:fa14 with SMTP id
 y9-20020a5b0d09000000b00695f25cfa14mr3450377ybp.163.1661270359512; Tue, 23
 Aug 2022 08:59:19 -0700 (PDT)
Date: Tue, 23 Aug 2022 09:59:17 -0600
Message-Id: <20220823095915.v7.1.I55189adfdb8d025fc991a0fa820ec09078619b15@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.609.g9ff673ca1a-goog
Subject: [PATCH v7] platform/chrome: cros_ec_lpc: Move host command to prepare/complete
From: Tim Van Patten <timvp@google.com>
To: rrangel@chromium.org, robbarnes@google.com
Cc: Tim Van Patten <timvp@google.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Update cros_ec_lpc_pm_ops to call cros_ec_lpc_prepare() during PM
.prepare() and cros_ec_lpc_complete() during .complete(). This moves the
host command that the AP sends and allows the EC to log entry/exit of
AP's suspend/resume more accurately.

Signed-off-by: Tim Van Patten <timvp@google.com>
---

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

 drivers/platform/chrome/cros_ec_lpc.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 7677ab3c0ead..4158bdeee197 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -530,23 +530,31 @@ static const struct dmi_system_id cros_ec_lpc_dmi_table[] __initconst = {
 MODULE_DEVICE_TABLE(dmi, cros_ec_lpc_dmi_table);
 
 #ifdef CONFIG_PM_SLEEP
-static int cros_ec_lpc_suspend(struct device *dev)
+static int cros_ec_lpc_prepare(struct device *dev)
 {
 	struct cros_ec_device *ec_dev = dev_get_drvdata(dev);
 
+	dev_info(dev, "Prepare EC suspend\n");
+
 	return cros_ec_suspend(ec_dev);
 }
 
-static int cros_ec_lpc_resume(struct device *dev)
+static void cros_ec_lpc_complete(struct device *dev)
 {
 	struct cros_ec_device *ec_dev = dev_get_drvdata(dev);
+	int ret;
+
+	ret = cros_ec_resume(ec_dev);
 
-	return cros_ec_resume(ec_dev);
+	dev_info(dev, "EC resume completed: ret = %d\n", ret);
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
2.37.2.609.g9ff673ca1a-goog

