Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778231885AF
	for <chrome-platform@lists.linux.dev>; Tue,  3 Sep 2024 16:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725381045; cv=none; b=RE8Z+CpvpHGPz4DJEd5Rpq8yABfS2iwD6DlppNh9ZLq/ldLdcwC3+H4iDLDJwk59c62AlKRPDUpbCwuLqRTTKpiUHWIHUaI8YUUhhvQ0ZG/Lw2F1TV/yuZ754HKiN/ZqSS/TPfKz07U6rGnmwefx3XaeI0YWIlMF2QevcVByqXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725381045; c=relaxed/simple;
	bh=NcRnI43j/32UrWwYS5V8VP4i4dLvb1AxJbQbRzMkl6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uOTKDUi/f9C9nuQfXBFaMl1CgI8eSVR9U9wswRjUZQ8XuOBIzSX1YOSR5z93jKls4D3+Q/+EW4+RbYJEhl32fxLo92EXdrm8YiQajOfme7exaMBYh9rceA3SZmyyZEqeyaQbjVgoLLNgfez6TdxKbcJGJic+aZUnNXQSy91FMOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RhLlhTXc; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RhLlhTXc"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c27067b81aso814007a12.0
        for <chrome-platform@lists.linux.dev>; Tue, 03 Sep 2024 09:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725381042; x=1725985842; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ch/nQk7xshZBBT85KVmRAI7T7THUEBQ92ebPsEv0TVI=;
        b=RhLlhTXc+VbvuognSWeF+KUsJKKtZkJGNSOdZAn0G3NwWQitCSzcEXw/HU7YDtFlXf
         Ftb0d7YOCaeScW9q49TM+2y6SvED7HOGrB7GAmhMJOFyyVNqpLxRm6JoM8VrbvonVu2B
         pe1lT3SwTHmKAUVQR5sAb/l7z7juXoigDC6GM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725381042; x=1725985842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ch/nQk7xshZBBT85KVmRAI7T7THUEBQ92ebPsEv0TVI=;
        b=CJ/+/7NOp4sjWx0Sjg58miMc3RUnlUZlK7D1zkoQB4Y5L7D+WbFAd6oIBl2q61aZTD
         NJ9syRzI4z8Awzw7iiZdXo88DlTG7o7eh3xiJF+4ibPHXYgNIiKXZ+db0o4P6lttVm0s
         OVMe74x+/pU0xQkSIt4V/3YI+juiNHi2Xd10xb8+r9MUpeC8ygxQxrZHB60boW4xopqN
         um17rL3CP8yjEs0oCrBvFJVmHpo8ja/1p9gpe6Lhi4IheIW0UPci6MkBQORvdKgXM+HW
         059aExFV9xnwYj5jT3sno9JChoqukLO1p7A5+sZFRZYtWZXSzmzg2YxQwVwnwfs8daOj
         rDLw==
X-Forwarded-Encrypted: i=1; AJvYcCXq4NpbyMOMhKLowD5GI13nf5s1cdmgcqEmrXP6xdiCQpFp8Se8/ds0yv//n9l2wzEvGo+XpfJSghrESVbpEx4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzWb1vIbzoRWmwoZQYnQK7+yLfMOPtKX7zSTtgy0OLtOY+A5clI
	ETWQVWDO4vwnY9vwZGoOv6qKCSipn1Uc6e9OMPbkc58I9YBkeypC0KFcQXpM
X-Google-Smtp-Source: AGHT+IHPa9Qvf/PS48YGwqnSZBUWQ/hXpFMaONG1d+Jtps88oT2k5Dw5JhWbGgaxI5p+BF5VuNzo6g==
X-Received: by 2002:a17:907:9813:b0:a6f:593f:d336 with SMTP id a640c23a62f3a-a897f77ea6amr1213890066b.11.1725381041378;
        Tue, 03 Sep 2024 09:30:41 -0700 (PDT)
Received: from ukaszb-ng.c.googlers.com.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989196bc4sm700685866b.125.2024.09.03.09.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 09:30:40 -0700 (PDT)
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
Subject: [PATCH v5 4/8] usb: typec: cros_ec_ucsi: Use complete instead of resume
Date: Tue,  3 Sep 2024 16:30:29 +0000
Message-ID: <20240903163033.3170815-5-ukaszb@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240903163033.3170815-1-ukaszb@chromium.org>
References: <20240903163033.3170815-1-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

On platforms using cros_ec_lpc, resume is split into .resume_early and
.complete. To avoid missing EC events, use .complete to schedule work
when resuming.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---
 drivers/usb/typec/ucsi/cros_ec_ucsi.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
index 6b9dc05a4960..4a3369c649bf 100644
--- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
+++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
@@ -246,15 +246,18 @@ static int __maybe_unused cros_ucsi_suspend(struct device *dev)
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
2.46.0.469.g59c65b2a67-goog

