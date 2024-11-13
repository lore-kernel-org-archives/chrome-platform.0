Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC6713B7AE
	for <chrome-platform@lists.linux.dev>; Wed, 13 Nov 2024 02:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731465510; cv=none; b=NdArRk0J+rXg/2fQ4LftQyShY9lncaBMK69o7jqTP2jRqvNgUrnH24swKbZDrG7eoAeqKTcZMAk6Tc8KHmouf3t9iZu/7ZIOEfeqFXRs557AIfBbbC8vTMRjMBWNcPnglHFJqg/1luU6qU+Zp5DPKOtFxMfw0oh3X1P9afrF4sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731465510; c=relaxed/simple;
	bh=ZymKMZaRT17JlSWpKxlZ8QxhVgWamgK/6GBSRaNSbKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aqbehUzDfcOuG4L14T8asoiDrYjLx5+eaIdmhRuirso1LcJah6jA9bvvCCgGPCZcbqJjbnhQTs5OLYV3CG6sa33EmjXWSvcL04sJ66+7O3D5xoi0D7sEXGSZ1O+Kv6tFZZwCqSwFGh0kQfJRXfCymXWLy1U/Fuim2g7EHnIZBlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U/Lc6siP; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/Lc6siP"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6cbd00dd21cso42801076d6.3
        for <chrome-platform@lists.linux.dev>; Tue, 12 Nov 2024 18:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731465505; x=1732070305; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLB1YOejlkFp168fWkLSHEDUMBTxRBOVTjCAjOJWMX4=;
        b=U/Lc6siPkc8ylOPul7NPDrXBUEbaeiwOLa6NkKpNbBZc4oL2Kj02uW0p8YMOOttRjF
         Nm0va+fgdGWMFhRuqzk9fOv36QToayyLt9cGElV5eitk1wCt6h+0G/+C/HFDzsTcRPZi
         /hqUKCLDMxsDqx5Nicovg3JlnJlw0K/7EkFTTrYy6lOQwmdbjOvVUmMOYk5mdQRLb9sX
         KmyLao6ki6omCAlejgglJSChFQO2hHpK0inSCLiQu8VrIJzthk7f04gj9qMNl4FMibbB
         3T7TdBaWVhlriUsecE6uA/lesWc+9oKaqGcW/2xyqVgx8CwVTFY7gITqS+/gsKsz9rXu
         I8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731465505; x=1732070305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bLB1YOejlkFp168fWkLSHEDUMBTxRBOVTjCAjOJWMX4=;
        b=UnsLNF1niyxnAZiusoXWWyvdOiYw82Cgx008K1AmuujFCqd5RelHAHhREEhm3soyw0
         G66Xih9eQaQ65Yp+tej2R2ZuqCDHSazsVicWi8fS0WzWOG0i/0/IthXXZa+ZSqeNoBb6
         A2Ga12ZeKH8iYqwQfUOQ29/1A4AdVzlueimpOQGGV416CfZYAzNDdzlDFZMxbPREu2Y4
         tyEOc9VoXSFitfpVJINdKvAjeUkpfyhXSC9QJQr4Gfp96sqr5WmLR3FP23TfE4CtQyoz
         Zbrz1udhFX6ctMaMotQcgRTa0+8gSQ6fBZwWL/wwfC/mbhcxFEsKsTP4OexcYwhuCQt2
         5MKg==
X-Gm-Message-State: AOJu0YzRRm2oFoYvVkNEh+YcR13oquU4kjDfOrYRsVcGWymuLou5SIyQ
	HQ/RCnEYI1lNsJk2iCwvgahxjhiZq5itwoFbAqWL3BwPcgItiksj
X-Google-Smtp-Source: AGHT+IGFHzo6HFFdb8bGuuUTihpDFAPsosOmhHkipWEzthJSKgIbwJcRvloqfep2mITdGX3AbgycwA==
X-Received: by 2002:a05:6214:5b04:b0:6d3:a694:a0a4 with SMTP id 6a1803df08f44-6d3d00be44fmr64178896d6.11.1731465505470;
        Tue, 12 Nov 2024 18:38:25 -0800 (PST)
Received: from pixel.. ([37.19.199.148])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3bf23cc01sm35444306d6.122.2024.11.12.18.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 18:38:25 -0800 (PST)
From: Brandon Casey <drafnel@gmail.com>
To: bleung@chromium.org,
	tzungbi@kernel.org
Cc: chrome-platform@lists.linux.dev,
	Brandon Casey <drafnel@gmail.com>
Subject: [PATCH] platform/chrome: cros_kbd_led_backlight: support Google Link
Date: Tue, 12 Nov 2024 20:29:05 -0600
Message-ID: <20241113023800.6263-2-drafnel@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241113023800.6263-1-drafnel@gmail.com>
References: <20241113023800.6263-1-drafnel@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the Google Pixel chromebook (aka Google Link), the keyboard led
backlight has the ACPI device id "GGL0002".  Let's add it to the
configuration array.

Signed-off-by: Brandon Casey <drafnel@gmail.com>
---
 drivers/platform/chrome/cros_kbd_led_backlight.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_kbd_led_backlight.c b/drivers/platform/chrome/cros_kbd_led_backlight.c
index 78097c8a4966..5b7766feb10d 100644
--- a/drivers/platform/chrome/cros_kbd_led_backlight.c
+++ b/drivers/platform/chrome/cros_kbd_led_backlight.c
@@ -268,6 +268,7 @@ static int keyboard_led_probe(struct platform_device *pdev)
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id keyboard_led_acpi_match[] = {
 	{ "GOOG0002", (kernel_ulong_t)&keyboard_led_drvdata_acpi },
+	{ "GGL0002", (kernel_ulong_t)&keyboard_led_drvdata_acpi },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, keyboard_led_acpi_match);
-- 
2.43.0

