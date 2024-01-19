Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797721E862
	for <chrome-platform@lists.linux.dev>; Fri, 19 Jan 2024 08:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705653817; cv=none; b=mSnE590r1TKBNDd0POh2n5g/FydJogT+GPSWa+FpHPhj3vi8EDv2dM1TNHdkjyHPFtI6HyFidCeedyYgc/5D2qOMc5CzPzX21Xl8/2bIxa9/6DCc0UEQ8FLfV0beQsCREtrVLh1eVVQDML2cB6m+1U+flxZh5IJTQDy05xqKA/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705653817; c=relaxed/simple;
	bh=PFKESGwT+52VOtSt0GyKDZV9D4/icQHM8Qc6/fiJ5to=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GRvl/7cLXRvgaThQ1YZeqUGsyRNBI7y0oxI3OvEv/SFe91YtWnc1+x/hDE0JmWxuUNCsvl5yglHqpUHKGZIIL3RaPoNuZRjtbcqKPMFmDEG2P4PD1/EekvyjVOldm1hdeol+3BDrYZaWAc6X2+vnU23Ug/ZmSd+fQXFzKsGHgp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=enbvkieE; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="enbvkieE"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50eac018059so676327e87.0
        for <chrome-platform@lists.linux.dev>; Fri, 19 Jan 2024 00:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705653813; x=1706258613; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8Jw334gbtlpfyMf//A4Kl+X5QTyArqRPZ+OYE2aYXw=;
        b=enbvkieERNwyOR91xfFy5mraf/0PEzjwACjZwXQ3zX48oRbBZ9x6cJrM/6i8cdrlWr
         FdKqFEgbdnSMen70wMU2hRjfjze0xAPyhpRotoFO7UZzba3Fi9FNF3Y47S5LkYcv9qEd
         i56GBXFQ4XzPsW3ZfspCmX3qbhuJjZ6eQ5p1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705653813; x=1706258613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V8Jw334gbtlpfyMf//A4Kl+X5QTyArqRPZ+OYE2aYXw=;
        b=wGZ8+KpaX8GImPfvpyP/E0Grf4glYWN7X+FKjz5MzvjwcUfZiJ2u68sL3ARiAHTTOS
         e+qxRaEEeapFBJVKEA9ABupCM5ri/cuOo7wUkd3YoLVik4zYqf1SyFCh6p+Vog7YSX/+
         ftI5u3lB35u7JPHIl4npSOAh/eOfcePRCkItjoPxCvg/OwehMX/WpwAbB4ZXtEUknBdq
         xbmNmbUz/RNcGf7tcBAGabB0trZSdDtrEk0oSxg16kmuOWkpTRn6/dIcpD7IhvOqPZeE
         OqPAxn3hrKOATCJejuugQCY1u6gjRrBhb7aUBZz9Oi/LXYWZT7IeI4oVwPxGu9crlj8f
         e83w==
X-Gm-Message-State: AOJu0YxEmxNaMKmLgW1d3iaLqg62aN1vLV9dxUe2GK3WiQL3BEPMhRc9
	OvkD6XqUrpNDnQLEz+cs2aYoT2jlUzk08OclZGEw0uBgH3gRpvW6PMShKzz1rw==
X-Google-Smtp-Source: AGHT+IGIBDb//4zZKW1szACYww6QbXCrisECs5lZ66+O573YHzIQR1uK1qMig1Xr2ISC4DBr1N9I/w==
X-Received: by 2002:ac2:464c:0:b0:50e:3479:3846 with SMTP id s12-20020ac2464c000000b0050e34793846mr474705lfo.68.1705653813409;
        Fri, 19 Jan 2024 00:43:33 -0800 (PST)
Received: from cracow.c.googlers.com.com (138.58.228.35.bc.googleusercontent.com. [35.228.58.138])
        by smtp.gmail.com with ESMTPSA id q23-20020ac246f7000000b0050e6aff6630sm905591lfo.152.2024.01.19.00.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 00:43:33 -0800 (PST)
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
Subject: [PATCH v3 1/3] platform/chrome: Update binary interface for EC-based watchdog
Date: Fri, 19 Jan 2024 08:43:25 +0000
Message-ID: <20240119084328.3135503-2-lma@chromium.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240119084328.3135503-1-lma@chromium.org>
References: <20240119084328.3135503-1-lma@chromium.org>
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

