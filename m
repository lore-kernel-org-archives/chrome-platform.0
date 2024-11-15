Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D4E1D5ADE
	for <chrome-platform@lists.linux.dev>; Fri, 15 Nov 2024 15:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731685966; cv=none; b=fAUruFKMfRLe5dv+DXzj/wWJqQbDbNAaWrlw9NRsCXDKt5SORRVKKI5EbtB+2JIYLKDGp9iCHamFivs6nNyFRVH8Pwz6sukJbFCJrHXMUnpsiybXovKdPTT4WPynUrT0mZaSIOwfJwhMvXidIeVvTcwdYzRlABNjrr//GndVheA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731685966; c=relaxed/simple;
	bh=IA0lrnNas0YoO/jbHCyNZSl7uiH/6eRgBzzm6A//b1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=acFgxqR2vnhFFixMgV5jlZm8fkrmEMoALB9TpegOGB1HfBvUDhpBbwd+kzaheBLTgoZ6Xnp8sqae2xunwF//gTD9lbQMaLzlFBllzRKimOcTnjHdxop/LVd4xM+K8MZwU4cMxtFbwMJ0jloL6wsMzNvvKiLVUY3OVyfU4/xxXXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Lu8Tsu4H; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Lu8Tsu4H"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa2099efdc3so376907266b.1
        for <chrome-platform@lists.linux.dev>; Fri, 15 Nov 2024 07:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731685963; x=1732290763; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+h/4OtNQOmknexdS73X7hyoeknIzANxsH8Xqm1Epi0=;
        b=Lu8Tsu4HsIEgH3WmeQRWWubFM+lbRlsVp+qjB+TZmXJ/i//GxCwD/OCs4rPQnlq3Kz
         PJk2y2gblwgRtdhJOg3e1qSEsoayjAswLViNVL6AoDbdjN93b4BiLIbHDsgIPS5tzo6y
         Lw30slOorbW2stquQiWLSEoDbm39lLNUAAK6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731685963; x=1732290763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+h/4OtNQOmknexdS73X7hyoeknIzANxsH8Xqm1Epi0=;
        b=vp6/MWSPgf3v/8urxLjGhHtLtASdqsr5D4VJ1SzjKalPv7H9auJve/KWq0NV5UgBKu
         nwRtPUP+UGY+VmOvig/GP4Q6SgK+LMwYLLdiK5D0DY3PNAiwRdKv+GzRoH1WolIAKuJR
         VrxLjbaKzzzHq32rSos+Lnbm4g1yzWgikdcCDxaQZWert41mWyYiTRMf6EhIHRn5KxJm
         yFVUPWaXcimf4v2bRPys7elcmbZSnLpAwbQRi1aB/074fG3AHU24TyZQ4giV8npiOLlY
         ZcEPy+Np1ZpBkkCdux7Hrv7hJNxyhiGaiNcxXSZaK+mYmnLWrZwi/ryuzNNZqrtNcmqz
         CnZg==
X-Forwarded-Encrypted: i=1; AJvYcCXfOJsarVY7maI6yyduwCeQGDWLypAFLboXoomZTR8Jo+ekqpFG94/D4lKtmf94Apx5PSVaOxxd554xgSrUlL8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxzxENiGxz/4rIVq2XbZKE3KqGh1XnhCnyFAc3bIzlfW9vHZ5Cu
	/rrTBVUiSBTtS2gWwj3oMS/I43DTzsPqt7avUPdjWWwLYendwHR5Sb9qThXw
X-Google-Smtp-Source: AGHT+IHIW/jLgqdVPuNl3GJnBFPcKnN15+ULgCZmftrtTOho9nPQQD34rXutZqYJHJ2kxZxYaBb9qw==
X-Received: by 2002:a17:907:2d93:b0:a9e:82f3:d4ab with SMTP id a640c23a62f3a-aa207687241mr701475266b.9.1731685963146;
        Fri, 15 Nov 2024 07:52:43 -0800 (PST)
Received: from ukaszb-ng.c.googlers.com.com (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e086244sm187758166b.177.2024.11.15.07.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 07:52:42 -0800 (PST)
From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benson Leung <bleung@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v7 3/3] usb: typec: cros_ec_ucsi: Recover from write timeouts
Date: Fri, 15 Nov 2024 15:52:34 +0000
Message-ID: <20241115155234.1587589-4-ukaszb@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241115155234.1587589-1-ukaszb@chromium.org>
References: <20241115155234.1587589-1-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

In a suspend-resume edge case, the OPM is timing out in ucsi_resume and
the PPM is getting stuck waiting for a command complete ack. Add a write
timeout recovery task that will get us out of this state.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
 drivers/usb/typec/ucsi/cros_ec_ucsi.c | 83 ++++++++++++++++++++++++++-
 1 file changed, 82 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
index aae0bf106494..3e6b59aba275 100644
--- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
+++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
@@ -7,6 +7,7 @@
 
 #include <linux/container_of.h>
 #include <linux/dev_printk.h>
+#include <linux/jiffies.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_data/cros_ec_commands.h>
@@ -29,6 +30,9 @@
  */
 #define WRITE_TMO_MS		5000
 
+/* Number of times to attempt recovery from a write timeout before giving up. */
+#define WRITE_TMO_CTR_MAX	5
+
 struct cros_ucsi_data {
 	struct device *dev;
 	struct ucsi *ucsi;
@@ -36,6 +40,8 @@ struct cros_ucsi_data {
 	struct cros_ec_device *ec;
 	struct notifier_block nb;
 	struct work_struct work;
+	struct delayed_work write_tmo;
+	int tmo_counter;
 
 	struct completion complete;
 	unsigned long flags;
@@ -101,7 +107,33 @@ static int cros_ucsi_async_control(struct ucsi *ucsi, u64 cmd)
 
 static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd)
 {
-	return ucsi_sync_control_common(ucsi, cmd);
+	struct cros_ucsi_data *udata = ucsi_get_drvdata(ucsi);
+	int ret;
+
+	ret = ucsi_sync_control_common(ucsi, cmd);
+	if (ret)
+		goto out;
+
+	/* Successful write. Cancel any pending recovery work. */
+	cancel_delayed_work_sync(&udata->write_tmo);
+
+	return 0;
+out:
+	/* EC may return -EBUSY if CCI.busy is set. Convert this to a timeout.
+	 */
+	if (ret == -EBUSY)
+		ret = -ETIMEDOUT;
+
+	/* Schedule recovery attempt when we timeout or tried to send a command
+	 * while still busy.
+	 */
+	if (ret == -ETIMEDOUT) {
+		cancel_delayed_work_sync(&udata->write_tmo);
+		schedule_delayed_work(&udata->write_tmo,
+				      msecs_to_jiffies(WRITE_TMO_MS));
+	}
+
+	return ret;
 }
 
 struct ucsi_operations cros_ucsi_ops = {
@@ -123,6 +155,54 @@ static void cros_ucsi_work(struct work_struct *work)
 	ucsi_notify_common(udata->ucsi, cci);
 }
 
+static void cros_ucsi_write_timeout(struct work_struct *work)
+{
+	struct cros_ucsi_data *udata =
+		container_of(work, struct cros_ucsi_data, write_tmo.work);
+	u32 cci;
+	u64 cmd;
+
+	if (cros_ucsi_read(udata->ucsi, UCSI_CCI, &cci, sizeof(cci))) {
+		dev_err(udata->dev,
+			"Reading CCI failed; no write timeout recovery possible.");
+		return;
+	}
+
+	if (cci & UCSI_CCI_BUSY) {
+		udata->tmo_counter++;
+
+		if (udata->tmo_counter <= WRITE_TMO_CTR_MAX)
+			schedule_delayed_work(&udata->write_tmo,
+					      msecs_to_jiffies(WRITE_TMO_MS));
+		else
+			dev_err(udata->dev,
+				"PPM unresponsive - too many write timeouts.");
+
+		return;
+	}
+
+	/* No longer busy means we can reset our timeout counter. */
+	udata->tmo_counter = 0;
+
+	/* Need to ack previous command which may have timed out. */
+	if (cci & UCSI_CCI_COMMAND_COMPLETE) {
+		cmd = UCSI_ACK_CC_CI | UCSI_ACK_COMMAND_COMPLETE;
+		cros_ucsi_async_control(udata->ucsi, &cmd);
+
+		/* Check again after a few seconds that the system has
+		 * recovered to make sure our async write above was successful.
+		 */
+		schedule_delayed_work(&udata->write_tmo,
+				      msecs_to_jiffies(WRITE_TMO_MS));
+		return;
+	}
+
+	/* We recovered from a previous timeout. Treat this as a recovery from
+	 * suspend and call resume.
+	 */
+	ucsi_resume(udata->ucsi);
+}
+
 static int cros_ucsi_event(struct notifier_block *nb,
 			   unsigned long host_event, void *_notify)
 {
@@ -167,6 +247,7 @@ static int cros_ucsi_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, udata);
 
 	INIT_WORK(&udata->work, cros_ucsi_work);
+	INIT_DELAYED_WORK(&udata->write_tmo, cros_ucsi_write_timeout);
 	init_completion(&udata->complete);
 
 	udata->ucsi = ucsi_create(dev, &cros_ucsi_ops);
-- 
2.47.0.338.g60cca15819-goog

