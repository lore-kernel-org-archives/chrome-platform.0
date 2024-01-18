Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3202E820
	for <chrome-platform@lists.linux.dev>; Thu, 18 Jan 2024 19:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705607615; cv=none; b=n6FPRPHzQJa7olg2NuR97SqaJJBodbAlBUMUGvAcU+FkdEcdW4LGncGBuQW77nWEJRZbXxAGsN8NkSoqXhyPv2NrGEryuQDNXzIyjoel5uCnsW3ufZlOshNzrdiSaRoq4AzX3z5EKFIiPPah3hztagRxhjb/z1Z1RqxQvizIBeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705607615; c=relaxed/simple;
	bh=PFKESGwT+52VOtSt0GyKDZV9D4/icQHM8Qc6/fiJ5to=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sliHEx0QNbEfmpW8xDRDNrsMkelz3f+ZOOHmBDSwfBnUki9SL1qec1VKpTwFKmoHZL6zl5Qq1pHmDyPYFutRM+UApigpw7fogE91an8l28mcWGOoyF0I/Od3ccMNlyNJeXG1cj9NdrSa09LkHFfK5hm97XZ+s/6GvsqU/dB4aeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Tcjhub3L; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Tcjhub3L"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2cd880ceaf2so488331fa.2
        for <chrome-platform@lists.linux.dev>; Thu, 18 Jan 2024 11:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705607612; x=1706212412; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8Jw334gbtlpfyMf//A4Kl+X5QTyArqRPZ+OYE2aYXw=;
        b=Tcjhub3LoCad+jsxgrXGyMddkZ68Sc2p4zPFuY8grD9mK1IrTzMb8fWXaMcVUU7PRh
         Cna/KM++gIhdCIYe9r+F4r62TT7qs7Tr+CqcPJFrtAwOg5KN4KEMQmtdAAylUWS39m6p
         iU9M3xiTAMHhx2WnOH/uQSBktxaVB7gY6UcJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705607612; x=1706212412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V8Jw334gbtlpfyMf//A4Kl+X5QTyArqRPZ+OYE2aYXw=;
        b=IX1ZBQIerNYzl/TE111+EtjcBlXHpcy41NJW+CFhgFlE2pSj+dC6gi5M9OwCVekNzb
         wuqLatyTO/p77Q399ddOJFyBzX5mQFiVtRoLvnIej9I6W/4mxl1748a2cN0yMdQ3oWSk
         P3aWiBmSRDZmNybX9PA+6OQwoMGzS4DbJGbmT735ZA1DxddDsDVJazU8iRek1h1lrc/y
         VW2bqLgNc8ZAaT4aaJfl8jCPO+0ts0O8iqZLX0xwhSW/hwWYD0zCozkhFYfoxZlMm8fD
         9Nq3UHvpw4ViTMuXKfnkC8mUIkUFe4K4ZIYFeOVOLFN+LltUZoOr+CeZeLYVlDZmCDL4
         54dw==
X-Gm-Message-State: AOJu0YyTiyEbZ/PUIeV96UH5oXrBHbggjdbNQEzN9zz4PZL7/UY3id+2
	4o7ilu8riOKpgnHM+fdLz5K1jkkLSmY7Guu11h5UxF67WX1Hw5IoGj31MUaWHw==
X-Google-Smtp-Source: AGHT+IGs3IPfRmNPEfLm8x5S3sBVMFQ5OIhoPRJwNBQiMD7pjy+Duv2NI5PaO+U99JoQtUzE9H6YTg==
X-Received: by 2002:a2e:930d:0:b0:2cc:a5ae:f122 with SMTP id e13-20020a2e930d000000b002cca5aef122mr715385ljh.78.1705607611722;
        Thu, 18 Jan 2024 11:53:31 -0800 (PST)
Received: from cracow.c.googlers.com.com (138.58.228.35.bc.googleusercontent.com. [35.228.58.138])
        by smtp.gmail.com with ESMTPSA id 2-20020a05651c00c200b002ccd3e8a59esm2333345ljr.121.2024.01.18.11.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 11:53:31 -0800 (PST)
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
Subject: [PATCH v2 1/3] platform/chrome: Update binary interface for EC-based watchdog
Date: Thu, 18 Jan 2024 19:53:22 +0000
Message-ID: <20240118195325.2964918-2-lma@chromium.org>
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

Update structures and defines related to EC_CMD_HANG_DETECT
to allow usage of new EC-based watchdog.

Signed-off-by: Lukasz Majczak <lma@chromium.org>
---
 .../linux/platform_data/cros_ec_commands.h    | 78 +++++++++----------
 1 file changed, 35 insertions(+), 43 deletions(-)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 7dae17b62a4d..ecc47d5fe239 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -3961,60 +3961,52 @@ struct ec_response_i2c_passthru {
 } __ec_align1;
 
 /*****************************************************************************/
-/* Power button hang detect */
-
+/* AP hang detect */
 #define EC_CMD_HANG_DETECT 0x009F
 
-/* Reasons to start hang detection timer */
-/* Power button pressed */
-#define EC_HANG_START_ON_POWER_PRESS  BIT(0)
-
-/* Lid closed */
-#define EC_HANG_START_ON_LID_CLOSE    BIT(1)
-
- /* Lid opened */
-#define EC_HANG_START_ON_LID_OPEN     BIT(2)
-
-/* Start of AP S3->S0 transition (booting or resuming from suspend) */
-#define EC_HANG_START_ON_RESUME       BIT(3)
-
-/* Reasons to cancel hang detection */
+#define EC_HANG_DETECT_MIN_TIMEOUT 5
+#define EC_HANG_DETECT_MAX_TIMEOUT 65535
 
-/* Power button released */
-#define EC_HANG_STOP_ON_POWER_RELEASE BIT(8)
+/* EC hang detect commands */
+enum ec_hang_detect_cmds {
+	/* Reload AP hang detect timer. */
+	EC_HANG_DETECT_CMD_RELOAD = 0x0,
 
-/* Any host command from AP received */
-#define EC_HANG_STOP_ON_HOST_COMMAND  BIT(9)
+	/* Stop AP hang detect timer. */
+	EC_HANG_DETECT_CMD_CANCEL = 0x1,
 
-/* Stop on end of AP S0->S3 transition (suspending or shutting down) */
-#define EC_HANG_STOP_ON_SUSPEND       BIT(10)
+	/* Configure watchdog with given reboot timeout and
+	 * cancel currently running AP hang detect timer.
+	 */
+	EC_HANG_DETECT_CMD_SET_TIMEOUT = 0x2,
 
-/*
- * If this flag is set, all the other fields are ignored, and the hang detect
- * timer is started.  This provides the AP a way to start the hang timer
- * without reconfiguring any of the other hang detect settings.  Note that
- * you must previously have configured the timeouts.
- */
-#define EC_HANG_START_NOW             BIT(30)
+	/* Get last hang status - whether the AP boot was clear or not */
+	EC_HANG_DETECT_CMD_GET_STATUS = 0x3,
 
-/*
- * If this flag is set, all the other fields are ignored (including
- * EC_HANG_START_NOW).  This provides the AP a way to stop the hang timer
- * without reconfiguring any of the other hang detect settings.
- */
-#define EC_HANG_STOP_NOW              BIT(31)
+	/* Clear last hang status. Called when AP is rebooting/shutting down
+	 * gracefully.
+	 */
+	EC_HANG_DETECT_CMD_CLEAR_STATUS = 0x4
+};
 
 struct ec_params_hang_detect {
-	/* Flags; see EC_HANG_* */
-	uint32_t flags;
-
-	/* Timeout in msec before generating host event, if enabled */
-	uint16_t host_event_timeout_msec;
+	uint16_t command; /* enum ec_hang_detect_cmds */
+	/* Timeout in seconds before generating reboot */
+	uint16_t reboot_timeout_sec;
+} __ec_align2;
 
-	/* Timeout in msec before generating warm reboot, if enabled */
-	uint16_t warm_reboot_timeout_msec;
-} __ec_align4;
+/* Status codes that describe whether AP has boot normally or the hang has been
+ * detected and EC has reset AP
+ */
+enum ec_hang_detect_status {
+	EC_HANG_DETECT_AP_BOOT_NORMAL = 0x0,
+	EC_HANG_DETECT_AP_BOOT_EC_WDT = 0x1,
+	EC_HANG_DETECT_AP_BOOT_COUNT,
+};
 
+struct ec_response_hang_detect {
+	uint8_t status; /* enum ec_hang_detect_status */
+} __ec_align1;
 /*****************************************************************************/
 /* Commands for battery charging */
 
-- 
2.43.0.429.g432eaa2c6b-goog

