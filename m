Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23402E83C
	for <chrome-platform@lists.linux.dev>; Thu, 18 Jan 2024 19:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705607618; cv=none; b=jucJEozYwhNJbINk169VinJj1lhppZcgzWxJYv0bt6PQBimLeoSnhY34+rvb1nON3wF6fFRq8l9EbEZ5b6aqsCmfZoT6mT300zS4/MceE5t3Hjtup1SwyFcsp37UoNCJnDfwDMobrh/BMXg4Bs+frDjwx+VXo9rFhBkbUlqyRxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705607618; c=relaxed/simple;
	bh=TJ0HS9DsmpIK3Lc89zTlK7cbKY5l8+Fb4v4FOr6pRxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uZ/0/E5RKyuoebSEG81vHFdw8xGmvbUtko56T5eF0Q9oGKCIodqRG88O+QCp8DPlUo/W6YcfbqKmQ5cvqJyFvfRxJhbkN++KFPZ+pIK9sRsoXGUJ4jjhaVNvDMwIwgslA/tAqA04kCjwIJSW6rs5hMmuVHI3e+E+M0NyYu9NQKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kAk28TNp; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kAk28TNp"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2cd1a1c5addso609311fa.1
        for <chrome-platform@lists.linux.dev>; Thu, 18 Jan 2024 11:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705607615; x=1706212415; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAiOdmemfs++EaElh/QkCQxHrKK1nXdTbeGxucqp/W4=;
        b=kAk28TNpDuPPbhIZXW/7S5PVv95X7H6awTjQe2ZrN/WHUW8ne5WbQtzeydgps9bN3+
         4P0iuji3zTdAT62Tsk80+xqAOiAGnBBYtmBD5K+6oA8YjDnokbIWfZnbOGYgh4DeyuAI
         6ZulrikAGEiKBgUfx0aj/ZqyyE4nlBSsJFbWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705607615; x=1706212415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oAiOdmemfs++EaElh/QkCQxHrKK1nXdTbeGxucqp/W4=;
        b=GPeDslyGUYSsGeULANvhAPNuGbvNxeXva+TTr1FJ0Gyb+Z2YcBWZgGx5jF39Gg9AFc
         bxMxl2xGWU9PXGjSKSGG3ArXwJ0ZSjSaTPKMCXYsUFXHFhgbuog+kyKM0tpYqjGw3p4c
         5M1lTwcXl2tzWZf35bwp2cTLinyTJevekn8bPHlGtaKC8HrjFWxCpEw9kFXK7i8phvfj
         jvH4eou1fL1TeRA7rTIsD7QZMlA2hWU9DhpZC+6m3q3kOc30945AqtN1E7/JisJJh7Na
         CcRq32KYDBvoiuZ9hPagVNgRGiz7GH/3FuZl0MR0m/KYCfL1nIM81u/7bcsAiikBPZNL
         0eXQ==
X-Gm-Message-State: AOJu0YzqnqdyUl5vK5JwcDIsPqOZgnl6z4QmnwfnF0WsbSQvCPIZIpxn
	clXmCpNd4hLlXUpERcSuIMArZibnp69gvwM3UdrgcqqOqfdmV54oeqcckfcVFQ==
X-Google-Smtp-Source: AGHT+IEy33EOIoM9A41TAqaa5BgK/M3wGgbb3sgYuQYOQsgSDzkgvy6rte8dlH1jvozcsJ8pHI/OXw==
X-Received: by 2002:a2e:b708:0:b0:2cd:2606:70e2 with SMTP id j8-20020a2eb708000000b002cd260670e2mr807557ljo.20.1705607614870;
        Thu, 18 Jan 2024 11:53:34 -0800 (PST)
Received: from cracow.c.googlers.com.com (138.58.228.35.bc.googleusercontent.com. [35.228.58.138])
        by smtp.gmail.com with ESMTPSA id 2-20020a05651c00c200b002ccd3e8a59esm2333345ljr.121.2024.01.18.11.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 11:53:34 -0800 (PST)
From: Lukasz Majczak <lma@chromium.org>
To: Gwendal Grignou <gwendal@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Radoslaw Biernacki <biernacki@google.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Lee Jones <lee@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Lukasz Majczak <lma@chromium.org>
Subject: [PATCH v2 3/3] mfd: cros_ec: Register EC-based watchdog subdevice
Date: Thu, 18 Jan 2024 19:53:24 +0000
Message-ID: <20240118195325.2964918-4-lma@chromium.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240118195325.2964918-1-lma@chromium.org>
References: <20240118195325.2964918-1-lma@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ChromeOS EC-based watchdog as EC subdevice.

Signed-off-by: Lukasz Majczak <lma@chromium.org>
---
 drivers/mfd/cros_ec_dev.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 603b1cd52785..d0140a285f69 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -91,6 +91,10 @@ static const struct mfd_cell cros_usbpd_notify_cells[] = {
 	{ .name = "cros-usbpd-notify", },
 };
 
+static const struct mfd_cell cros_ec_wdt_cells[] = {
+	{ .name = "cros-ec-wdt-drv", }
+};
+
 static const struct cros_feature_to_cells cros_subdevices[] = {
 	{
 		.id		= EC_FEATURE_CEC,
@@ -107,6 +111,11 @@ static const struct cros_feature_to_cells cros_subdevices[] = {
 		.mfd_cells	= cros_usbpd_charger_cells,
 		.num_cells	= ARRAY_SIZE(cros_usbpd_charger_cells),
 	},
+	{
+		.id		= EC_FEATURE_HANG_DETECT,
+		.mfd_cells	= cros_ec_wdt_cells,
+		.num_cells	= ARRAY_SIZE(cros_ec_wdt_cells),
+	},
 };
 
 static const struct mfd_cell cros_ec_platform_cells[] = {
-- 
2.43.0.429.g432eaa2c6b-goog

