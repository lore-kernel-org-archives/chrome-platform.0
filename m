Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF7A191F6F
	for <chrome-platform@lists.linux.dev>; Tue, 10 Sep 2024 10:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725963343; cv=none; b=izlyBQ3N8cfyu/VHqJUs/ANGb2LFWjvN1WcZ/NFVRjnB0VjWcyD327pM5WdhFlyJpzzrxhE8ynIqS5VYDf4VkJICa3LhLqzVj+LUidRZCvI0RUuecRiaNhSWrrH83c9AeVCMV2wuSAOn2Z998nzC4d6zoyrDlx5Vym8SbicFhmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725963343; c=relaxed/simple;
	bh=lKcBF8gwOmt/ffGeVilM/VC//BkP07Qg7KfFhbt/ATM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cBiRzvwAHH4eXhsepOVD2oUME2XLnR7/skFgM25fUbyaaxJSqw9UUcQONmZLW8mxyTJBAcG1bjUr6usLGamBoeFQRz7Cne0x6YE83PVD3KCTVWHyJZTGHWFTdWcD38rILdXK43vNLySEUocH79ZHB5xXlEVRC9i9MnkkB/C/G2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Z4EYK9ZG; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z4EYK9ZG"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5365d3f9d34so3775392e87.3
        for <chrome-platform@lists.linux.dev>; Tue, 10 Sep 2024 03:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725963340; x=1726568140; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8X/ITKpB8AA7PfOztOSGy2OE3K0m/AlkMzm5sCSbuU=;
        b=Z4EYK9ZG5x1MKw+GVqaG52QEQQUwjtbIDAkoFvM38To1ia91Rr2Wge577akSNizY3z
         24+DraoROblg73wM6o7a+8byYwsKozGMdBmYwWnei8SbdSbBmUVuLhgMyB2nlKZbhjuL
         zNhKFDEGbWgykbafvPhtR1LSrugXt7Gyz/bog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725963340; x=1726568140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8X/ITKpB8AA7PfOztOSGy2OE3K0m/AlkMzm5sCSbuU=;
        b=FERhpUtAHa4dBb6qbsMh25cvHDidp5nLgcTkCU4nOiktfuwBGcLwoihK+0ushd6kT+
         +15Wydu8AQ+6Mmc3h4f2tcRmpdkNFbsSFMqkdDZqy8TF0lNBEL41Qtsfrogkam7mS18v
         fqfzxxZhkvg2SLaAHy/TYJ7jjHWAogB/RUc2FuiYsgmqPoroJzUuEu7pm4p/szxOaZ60
         58JnoOSIf0qxRdev4qO8EyCFf/OCfwf5EyVXPY6MyPNyY8pYXx0g0gBHySspyQsBfxtf
         HPHAQgC7rtpzGI50eYwJTWIhs1QjLkPfHELxUXeeR5L1IRQcxrcy+A6EbtSw1fI5V0hT
         sH2g==
X-Forwarded-Encrypted: i=1; AJvYcCUB7OyAzzXs9YYXviFAjIpT/3ltJDkEg3mHzEtvM9qr6lCpLlKhBeNd3GgvQQVLBjDdG4CGLNzFbsFT7zop6YM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxilQJ9WOOaeA+pByLgK7FLPuEspxRAi6ceGflt4z4nc8dCEMPw
	HLnQJnj2AoBFqXJGya0NF4/9NtLTg7PdvOuOr7UAQjcsfCqDsAZS2ZkFMQpC
X-Google-Smtp-Source: AGHT+IEmWkkPyz1oxTksKWySx9B5Qd1qQQdKYCW6OpqyNaZ/PupJucqIzyjiUeUuE62f//tDSeOB4w==
X-Received: by 2002:a05:6512:695:b0:52e:97b3:42a1 with SMTP id 2adb3069b0e04-536587b2c9emr7792710e87.24.1725963340124;
        Tue, 10 Sep 2024 03:15:40 -0700 (PDT)
Received: from ukaszb-ng.c.googlers.com.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd424f0sm4075401a12.7.2024.09.10.03.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 03:15:39 -0700 (PDT)
From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v6 4/8] usb: typec: cros_ec_ucsi: Use complete instead of resume
Date: Tue, 10 Sep 2024 10:15:23 +0000
Message-ID: <20240910101527.603452-5-ukaszb@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240910101527.603452-1-ukaszb@chromium.org>
References: <20240910101527.603452-1-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

On platforms using cros_ec_lpc, resume is split into .resume_early and
.complete. To avoid missing EC events, use .complete to schedule work
when resuming.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
 drivers/usb/typec/ucsi/cros_ec_ucsi.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
index 20e608097fc6..422b3b14028c 100644
--- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
+++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
@@ -241,15 +241,18 @@ static int __maybe_unused cros_ucsi_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused cros_ucsi_resume(struct device *dev)
+static void __maybe_unused cros_ucsi_complete(struct device *dev)
 {
 	struct cros_ucsi_data *udata = dev_get_drvdata(dev);
-
-	return ucsi_resume(udata->ucsi);
+	ucsi_resume(udata->ucsi);
 }
 
-static SIMPLE_DEV_PM_OPS(cros_ucsi_pm_ops, cros_ucsi_suspend,
-			 cros_ucsi_resume);
+static const struct dev_pm_ops cros_ucsi_pm_ops = {
+#ifdef CONFIG_PM_SLEEP
+	.suspend = cros_ucsi_suspend,
+	.complete = cros_ucsi_complete,
+#endif
+};
 
 static const struct platform_device_id cros_ucsi_id[] = {
 	{ KBUILD_MODNAME, 0 },
-- 
2.46.0.598.g6f2099f65c-goog

