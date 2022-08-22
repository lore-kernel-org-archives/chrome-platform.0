Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52152580
	for <chrome-platform@lists.linux.dev>; Mon, 22 Aug 2022 16:46:33 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-335ff2ef600so196815567b3.18
        for <chrome-platform@lists.linux.dev>; Mon, 22 Aug 2022 09:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc;
        bh=rtaEMsVUgxkEpbiKW/IF/USL8m9F2ihukaZ79pkCq9I=;
        b=mjqMv7yH264vsDiv7u0L+VSabvq7vtfkSvTACtXqss1McRB5WTAjXotwOuQPfHoVcI
         4ALfVqaz/i/+R9HFZDHd+cuKM2aZXIOo9h27kRzBozz1Bfou4C32SWVET0W4VM7ykgig
         F4kFVGyhXN+nCcvNwy+4Fo87+LmmRcAhkTRCN9tBMOKRJeA2w0aNEywMYbBGWbZwfa2V
         Jc1mjfXsz5UWcDQba1FCyc5jtmXgulIIjtprrGPdbZawbNtPC6+x14nLlJBYPNGHxRxH
         X+nmRev7OSqjtLLteH/fslfAn46KdkaDn+SDK1icthm98S5+HJ7m+Z32FyvCyEtvnB2t
         32qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc;
        bh=rtaEMsVUgxkEpbiKW/IF/USL8m9F2ihukaZ79pkCq9I=;
        b=0YB5uyk5FBP885jPbXmRO9MsZqKmZaMNNVFhuFeTFY6Zgzn/FylEg3W852LNPYFeYA
         S/ZR851pyUWr3PXX2l69052wVVX0cAKuH1yYjaGx+zbhB274zRERe/M3ie+N0NuiUIBD
         UzbMuNLwUeVG9s6nN+U81nY1iaaRoi/GPxtigNEVQHC4E3LJ/OJke6fd3+Iha5L6Y1gP
         d5PSMrNT+FV+ObtdVrVteXsHVdo9NfGkPKf4n+dM6HbhmP2K96XUAGXE84NauBw6rTjN
         Dln9RdJzvZD3oBD7Tp4xILolJjtT3EOFGa/EHfO6QwvkUJoc2B9Q6C3SncGMkWLM1lyN
         jppQ==
X-Gm-Message-State: ACgBeo2TSh40hmX05L9Kd1j9ZyQ/l9fOre1IxVAz850n9olTQmbWX5r7
	Yu2uHsKlk7buB7uaHRkD0sGbw4y5Ug==
X-Google-Smtp-Source: AA6agR73Sy+VVh3pbE8Fb3F5GAchuoB8ByQOwyUn1gZ4RUvfD1b2rHWZBQAjl5Z99T3oBIwnrEepHKeZpg==
X-Received: from timvp-p620-9115096.bld.corp.google.com ([2620:15c:183:200:762:7c61:946f:731])
 (user=timvp job=sendgmr) by 2002:a05:690c:823:b0:339:cd73:5be9 with SMTP id
 by3-20020a05690c082300b00339cd735be9mr11068057ywb.21.1661186792797; Mon, 22
 Aug 2022 09:46:32 -0700 (PDT)
Date: Mon, 22 Aug 2022 10:46:30 -0600
Message-Id: <20220822104624.v5.1.If155ede36f7d344f15d153d5d75b45c7612bcb8c@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
Subject: [PATCH v5] platform/chrome: cros_ec_lpc: Move host event to prepare/complete
From: Tim Van Patten <timvp@google.com>
To: rrangel@chromium.org, robbarnes@google.com
Cc: Tim Van Patten <timvp@google.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Update cros_ec_lpc_pm_ops to call cros_ec_lpc_prepare() during PM
.prepare() and cros_ec_lpc_complete() during .complete(). This moves the
host event that the AP sends and allows the EC to log entry/exit of AP's
suspend/resume more accurately.

Signed-off-by: Tim Van Patten <timvp@google.com>
---

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
index 7677ab3c0ead..5a8f3a3f9c85 100644
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
+static int cros_ec_lpc_complete(struct device *dev)
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
2.37.1.595.g718a3a8f04-goog

