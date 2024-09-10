Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA9619AD81
	for <chrome-platform@lists.linux.dev>; Tue, 10 Sep 2024 10:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725963349; cv=none; b=U5wYfkfM+h1l47NPSftynfy+I7rtXI20/1+4e5Ov8F/RLB/3kl8PhxwUvtzVpl8mpPx6ZxFDwrBJnP+XK3A7aSwH5NSzqetazl1scb0xPXo3bQgXY92LtAizTmwRdJBQrwwpaQAtY10YNrP2gfcERJxuoGIKTGCuYnpbiIKYW1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725963349; c=relaxed/simple;
	bh=tSQJHbj2LLXTeUHGgMMfJ5BWAL/nLVLLEk1C+o3nHws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BmDVnHvjO43bC8g+W02UlK43lf2gHiQHm9t+ZvGqp1E/1mWrEH0J+Cw4Rov7Khv8+uISxeE96NV/OEJxg04UND5H4Ih+wB41LBykRMglxdqBFD/I/z1enkqzzr9x1AQNrYjTXyq0jf5wmsRFZ3XFTrLqoXVK7RtRmluKAfX5DPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=krsaad2a; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="krsaad2a"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f754d4a6e4so44062931fa.3
        for <chrome-platform@lists.linux.dev>; Tue, 10 Sep 2024 03:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725963346; x=1726568146; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6E5yTq083nuSzrDbz7WTLj5zuoz2JOMDpjBBNEDmzQ=;
        b=krsaad2aAqmL+JbWkWMUHqx5iQkFj7dXxwuX3ASlvqQO731f3gLQ62XneW8wl45BUc
         cYj0yBdamktfyuMB5GIsojBQGkryVEKYWA6E0IOoFoe84FaKm9AX7NU4g8lv7bMhEGrl
         im1Ag95QBC1uHEsIBFmqbGshqHHPTTz/sDjVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725963346; x=1726568146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e6E5yTq083nuSzrDbz7WTLj5zuoz2JOMDpjBBNEDmzQ=;
        b=kbuQq5KdhpASeusBl29g5lxlgb8z7roxfZzVvCnfY734wlIM6C0L0ryYV+eQ6CP/KA
         WpL+cPyQHaN0b0aWVhekS53a7eCVma/BQXf1xaKFj8Swgr+GGforN1jxERR9FXeUYp6d
         +CyxkwYICHqkkW3GZYyez9YuxdD4uEBctBdmtzrCc+769QtV0HTBCk9rV9PiNZMEUNaa
         DoxdEi1y7ne5g+Nfa12pvy5vtaW6fHNQZ5Qha63ohICj2Gt3cd8BE6luSd6FibQSR1lL
         oyMUNS4DUqaEtn+XKT7SCPlXYJpgPvF9DhZ4I7ZYGQGgS8ZvuwljPGkuwzFI4g9jJ69S
         Z2cQ==
X-Forwarded-Encrypted: i=1; AJvYcCW63ywWhyvu/C6zWLHvZojgkNyNjDnNGF3bCDocgRuxYT/dvnitTvaSjtHG6myB0gZsSxlK1rGoqB8hPahWlRg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5osP1KSvjdEmeDZXghTY4+KsFbxWxq+CnHnXt+4m65dn0RUP7
	awkaR4S9qh6EiASjcR2Sl52mz2KQFGbXfIhp5msq6VI0hygHNp532yQhDCwt
X-Google-Smtp-Source: AGHT+IHaKe6rWjU3xH9ycsM7F8BdbXD7rsT077HrnyCJDew/oIYr2SQOxzYhjp9tGDoTKY9rIz0ULg==
X-Received: by 2002:a2e:5109:0:b0:2f5:806:5cee with SMTP id 38308e7fff4ca-2f751ec7daamr64177571fa.11.1725963345513;
        Tue, 10 Sep 2024 03:15:45 -0700 (PDT)
Received: from ukaszb-ng.c.googlers.com.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd424f0sm4075401a12.7.2024.09.10.03.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 03:15:43 -0700 (PDT)
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
Subject: [PATCH v6 8/8] mfd: cros_ec: Don't load charger with UCSI
Date: Tue, 10 Sep 2024 10:15:27 +0000
Message-ID: <20240910101527.603452-9-ukaszb@chromium.org>
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

When UCSI is enabled, don't load cros_usbpd_charger and cros_usbpd_logger
drivers. Charger functionality is provided by the UCSI driver already and
logging will need to be added.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
 drivers/mfd/cros_ec_dev.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index d5d63df7fcbd..bc083c7b21de 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -133,11 +133,6 @@ static const struct cros_feature_to_cells cros_subdevices[] = {
 		.mfd_cells	= cros_ec_ucsi_cells,
 		.num_cells	= ARRAY_SIZE(cros_ec_ucsi_cells),
 	},
-	{
-		.id		= EC_FEATURE_USB_PD,
-		.mfd_cells	= cros_usbpd_charger_cells,
-		.num_cells	= ARRAY_SIZE(cros_usbpd_charger_cells),
-	},
 	{
 		.id		= EC_FEATURE_HANG_DETECT,
 		.mfd_cells	= cros_ec_wdt_cells,
@@ -261,6 +256,21 @@ static int ec_device_probe(struct platform_device *pdev)
 		}
 	}
 
+	/*
+	 * UCSI provides power supply information so we don't need to separately
+	 * load the cros_usbpd_charger driver.
+	 */
+	if (cros_ec_check_features(ec, EC_FEATURE_USB_PD) &&
+	    !cros_ec_check_features(ec, EC_FEATURE_UCSI_PPM)) {
+		retval = mfd_add_hotplug_devices(ec->dev,
+						 cros_usbpd_charger_cells,
+						 ARRAY_SIZE(cros_usbpd_charger_cells));
+
+		if (retval)
+			dev_warn(ec->dev, "failed to add usbpd-charger: %d\n",
+				 retval);
+	}
+
 	/*
 	 * Lightbar is a special case. Newer devices support autodetection,
 	 * but older ones do not.
-- 
2.46.0.598.g6f2099f65c-goog

