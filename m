Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504371C82E6
	for <chrome-platform@lists.linux.dev>; Thu, 28 Nov 2024 23:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732836049; cv=none; b=KAcnf6Eon01Kl5/Qj2gdsku0m48cFhINZ5EF6kDXDNX8mN941X0YqcbOWaouV0hn9nugn3dilTW5uPusp685VP9HdDcpr/tkJT3ojoVHqfRvtynVpF/pUuJGRlVE/a1Xe/rkCqwdZK3ijKj9ax3qwg8krWjNKjRn9S8zxivmuJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732836049; c=relaxed/simple;
	bh=tbcZYXU6HcwHtSy5LuzFDa9JvHECIlXLmldxQYaGrnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TVj51yTQ0Uy72GrR3rYIpyere8RrGSYKhLeZzYD1+vkYkeAV6an/eI4GEctvZSmFZ2IEECwm9Qt8weCB7n1rmXLvnbNluv0yUOB6T9RzTKYfTQNFMMhQzQqh199DrGtIvIia3HUDKo2g0L2AvcoKI4hwBnIdj1Xy04jfvuzZdkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JedQd9e7; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JedQd9e7"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ffc3f2b3a9so19343861fa.1
        for <chrome-platform@lists.linux.dev>; Thu, 28 Nov 2024 15:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732836045; x=1733440845; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NO7pr5IjtQ7DDii6MRKHjZ3m6XUBJXvLyCa0CyvruQQ=;
        b=JedQd9e72aTnVU3wtwpgvXIfRxQc1dCdOQ6owPg9XX/P8eW464zle9stwoXaPnM2iE
         fkrQVolS2bFZVn5Wh5ZdTe7THaPbuPrrBm9grM9wVMfjiQxA+ostVfXavSUaqf8sXz1x
         o7ZsQxJutnkPPDELKjCkQwHeTxSNCysJJijsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732836045; x=1733440845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NO7pr5IjtQ7DDii6MRKHjZ3m6XUBJXvLyCa0CyvruQQ=;
        b=krxt9CFczsksNzuZWZC5QVUsyP9E/asPa9HyaHc7AjAXNNpwIN+2deciTJv3CCnjB5
         MLNmyS5X2S6MXz2ypc9jRxUninwcIfe7MOEJJYSog+5e/NTEve0reC4hEOoUmz9AgccV
         +P2+UMOT0jhx12+X4Vqp8EJnH1LRBiJFnm2TRPTMUDrRmEcjjyc9tJNEVSSXeXC9mE+5
         cwiG33XS5/DkLXeonZ1sd9FmiXksPmmkQRkAqf6eFfzY8XNnjwpCvR+IQgGBbLW3X3sL
         5Lnzj/bFx4rOJFfrEjuvwZqONdVYAeAQY8+GOPrNWrnYuMKrfDpocxRNLY29//jtjvA0
         B/AA==
X-Forwarded-Encrypted: i=1; AJvYcCXRupF4lYo68vaxloemwLZY9y3c7UyUR9qw2rZxUMAH/8KrJD/48/CIutAKyYYCigeJKkPhnzfcZR5EM0J5+Pc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwdEfEbp5IYSphXAEhac+spV3+2lL1Y1K8nXO8xiIN10nFoB/fS
	Dpnuuost4ik+Y/CWlapjfGrSoQJlYBX3zFY8yxzb0IfSQJ2vuCrj9cqD4mGG
X-Gm-Gg: ASbGncsbh30FlKQVwezsAmvfTmxyLfFZH1rIf28MUf+VDzyxzttoH9IwPjWRiDRMrEP
	FT/LVrlScGX8HdiKQm/uUiwNFv5lEnjHSfOY0NK0sPq18MwmbLYJhjQjuTyA5TsEJEdi/CprB/E
	HGd6J1GW0dEBdpxrXDzz6JxOr6woV3LoPTIbjBM/GCNzg2FHnI95s6lmxJJaX4bvbbplx8t/2KN
	Hm9f/CxHOlQI3YqVgnjX6XodLWwNfrLww/A1qEXeOkmABrvF4GBqbwcP4GH4ys7tzt3OoIKkBGj
	Oj1uRf7Y7fgMWPO5Fc1Iy1BC+2WFNZ3EOAo=
X-Google-Smtp-Source: AGHT+IGmiebKIbZzhcAjX1oLllwlbZw4xh5D+KuARx/TSvORsh+S7wRIiiNwsgWUZtSjqXFexldF4g==
X-Received: by 2002:a05:651c:1502:b0:2fc:9674:60b5 with SMTP id 38308e7fff4ca-2ffd60a9703mr75687331fa.25.1732836045246;
        Thu, 28 Nov 2024 15:20:45 -0800 (PST)
Received: from ukaszb-ng.c.googlers.com.com (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5997d5672sm110757566b.77.2024.11.28.15.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 15:20:44 -0800 (PST)
From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benson Leung <bleung@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v8 3/3] usb: typec: cros_ec_ucsi: Recover from write timeouts
Date: Thu, 28 Nov 2024 23:20:35 +0000
Message-ID: <20241128232035.1525978-4-ukaszb@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241128232035.1525978-1-ukaszb@chromium.org>
References: <20241128232035.1525978-1-ukaszb@chromium.org>
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
 drivers/usb/typec/ucsi/cros_ec_ucsi.c | 88 ++++++++++++++++++++++++++-
 1 file changed, 87 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
index c588d9a57643..6daf61e7e62a 100644
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
@@ -99,12 +105,43 @@ static int cros_ucsi_async_control(struct ucsi *ucsi, u64 cmd)
 	return 0;
 }
 
+static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd)
+{
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
+}
+
 struct ucsi_operations cros_ucsi_ops = {
 	.read_version = cros_ucsi_read_version,
 	.read_cci = cros_ucsi_read_cci,
 	.read_message_in = cros_ucsi_read_message_in,
 	.async_control = cros_ucsi_async_control,
-	.sync_control = ucsi_sync_control_common,
+	.sync_control = cros_ucsi_sync_control,
 };
 
 static void cros_ucsi_work(struct work_struct *work)
@@ -118,6 +155,54 @@ static void cros_ucsi_work(struct work_struct *work)
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
@@ -162,6 +247,7 @@ static int cros_ucsi_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, udata);
 
 	INIT_WORK(&udata->work, cros_ucsi_work);
+	INIT_DELAYED_WORK(&udata->write_tmo, cros_ucsi_write_timeout);
 	init_completion(&udata->complete);
 
 	udata->ucsi = ucsi_create(dev, &cros_ucsi_ops);
-- 
2.47.0.338.g60cca15819-goog

