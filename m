Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C83E3206
	for <chrome-platform@lists.linux.dev>; Mon, 22 Aug 2022 17:28:44 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-333f0d49585so196219447b3.9
        for <chrome-platform@lists.linux.dev>; Mon, 22 Aug 2022 10:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc;
        bh=yzjS+LywkTWL8WvWDA7N7t+zpqj6zc8ZGGsibUAWoXc=;
        b=HvLX6cWQF1notA4Yggh9p9vMeoaGyxWp/t/sue/w1EOhy3i1JIiuey4oxPZFoTXNkp
         P0xEOo5gccH+H9j24WUunpcJJ5nNsVe6U4DNlAGPE0q+NLNbItfpCnDKap4y590e6+I0
         DsREykmxLQzMWVi0O7PwTnp3DA05QKKE7r800Ei8eVr5Ku7wtgbvi1cWeHOwiOpzuGMW
         yK9vxeBzvWjVYDcWtWecyxrytUGB4q4rohMIum5MXXtJ+fkmC//pGsypRGYAIK2WKAVr
         DcQCTcMGzB6qMvz+QbE5y+SaivL0FXuiTyYe9IlNd2FR3urGrf1k936KA8QaPa9Y3yZY
         YbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc;
        bh=yzjS+LywkTWL8WvWDA7N7t+zpqj6zc8ZGGsibUAWoXc=;
        b=UOCzyf7dErJiBM1GbRsaX5TSJeMf170wfVDbnE3VCpurOw4AxBgcvnkhFyZt2wMOed
         uJHHt5eKf4yec8Ks4ca6IHpXRd2kIA9BC8xRhJER75QNmrkizpYf2ifRi7nS7J9cukPS
         163BPDz+LBxMpsAws8UplFJhNE+wPsNieYBdn3BDEDd5kCRIJSgQp127N0hrkBuZ2e+t
         zFokSSetoQaSWUAKhVL270tQszdJ4NXRcNnceXME6XmSJ8nR+a5m2uyZ7gvq1y0sZ/w3
         h4KVMNeDWoaHE5e8PdNfvkkDeUaezv/g8rtARIwLqSJa5qq+jZ+LtRy8Q2540tBslCHd
         WJEw==
X-Gm-Message-State: ACgBeo3kzhhytZQGw6feUTuzhYIQdZJK4kgtGJIyZNp57cjElmUK1wO3
	F+bUZzIwakqUyj4NfMIx67vkbzwHYQ==
X-Google-Smtp-Source: AA6agR5pKK4GPpIqDTf9/ajoMTVtP1y9QH/7kTtaiFafgYADIP+eyPoY+AVJfw7OFW9JT34FZvouDUfvwA==
X-Received: from timvp-p620-9115096.bld.corp.google.com ([2620:15c:183:200:762:7c61:946f:731])
 (user=timvp job=sendgmr) by 2002:a81:7c2:0:b0:335:90cb:1962 with SMTP id
 185-20020a8107c2000000b0033590cb1962mr21509762ywh.173.1661189323446; Mon, 22
 Aug 2022 10:28:43 -0700 (PDT)
Date: Mon, 22 Aug 2022 11:28:40 -0600
Message-Id: <20220822112832.v6.1.I55189adfdb8d025fc991a0fa820ec09078619b15@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.609.g9ff673ca1a-goog
Subject: [PATCH v6] platform/chrome: cros_ec_lpc: Move host event to prepare/complete
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

