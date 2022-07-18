Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10F93C37
	for <chrome-platform@lists.linux.dev>; Mon, 18 Jul 2022 21:28:32 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id k19so10203361pll.5
        for <chrome-platform@lists.linux.dev>; Mon, 18 Jul 2022 14:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PVcgZzjdK9fjloy6/Y+huhUu52yh6ctU8017XyeNTLM=;
        b=Sa/S6jwMcJ6vjrfJHhWknnUYuPM+pYaLLPuHmCGsdMeJChAHIeOO5asROW8eyJpcIK
         ZVPoVHm7j1hKHIePlke4jGYo7O7x8uwE/3WaJKMTh36xmHe8nbBADJz6zFb2Ta/zswfl
         3tOPxbJzDaNmEuC9x6q48jG3Yo4WXSple2DMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PVcgZzjdK9fjloy6/Y+huhUu52yh6ctU8017XyeNTLM=;
        b=7bTQ3xlMeIDRWB4xJg0GEt2Dhp5u4AqlKUjPZ8GpoNpQB37vpfttew3uz8Sipyth37
         NTSf7wmt2XQiC3q5S1110pfcFtgDv0dNFJfO0ylaDwgq8TJgrVjsxilnVwoewyin5WO0
         yPAJaMb83anPz9HHPXe9lWTc2xWgUICfImJqtYpsfiBJqWq6vXfbFhqWbPdIHw9maRBy
         dmXG04XOH7HfVDDdOe59r8/AfctXvoiG8HFT4gpcRfNI57Fro3jkBIC49m2TW8M15TKh
         IPZk9Tg5NjtlEGetKQ6zz/Ud/WqUovvOC1gFF9N+ukrs5hUc+dt4a9SQGJjj1oNUdubs
         FuxQ==
X-Gm-Message-State: AJIora8R5LD0CmTh161VV8MR/Z4ulouTnyk3k72GaVMmfO2a+6GcHyE+
	KKeRImhC93fUkv9zdAZqat74tg==
X-Google-Smtp-Source: AGRyM1tKSCH41BB852jsIS5RXGkAx+Hvett+tlV5FCfr3isJIr5ePfcCMhOC36ySIh28Iy2UYPICjA==
X-Received: by 2002:a17:903:18c:b0:16c:51c6:675d with SMTP id z12-20020a170903018c00b0016c51c6675dmr29737274plg.153.1658179712184;
        Mon, 18 Jul 2022 14:28:32 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id z9-20020a631909000000b0041992864d69sm8536830pgl.77.2022.07.18.14.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 14:28:31 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: bleung@chromium.org,
	gregkh@linuxfoundation.org,
	Prashant Malani <pmalani@chromium.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2] platform/chrome: cros_typec_switch: Add ACPI Kconfig dep
Date: Mon, 18 Jul 2022 21:27:55 +0000
Message-Id: <20220718212754.1129257-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the ACPI Kconfig dependency that was missed during the initial
driver submission. Fixes the following compiler errors:

drivers/platform/chrome/cros_typec_switch.c:93:9: error: call to
undeclared function 'acpi_evaluate_integer'; ISO C99 and later do not
support implicit function declarations
 [-Wimplicit-function-declaration]
   ret = acpi_evaluate_integer(adev->handle, "_ADR", NULL, &index);

drivers/platform/chrome/cros_typec_switch.c:93:35: error: incomplete
definition of type 'struct acpi_device'
   ret = acpi_evaluate_integer(adev->handle, "_ADR", NULL, &index);

Fixes: e54369058f3d ("platform/chrome: cros_typec_switch: Add switch driver")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes since v1:
- Correct the malformed Reported-by tag. No functional changes.
(Apologies for the quick respin.)

 drivers/platform/chrome/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
index c62a514a087f..9d4fc505fa25 100644
--- a/drivers/platform/chrome/Kconfig
+++ b/drivers/platform/chrome/Kconfig
@@ -267,7 +267,7 @@ config CHROMEOS_PRIVACY_SCREEN
 
 config CROS_TYPEC_SWITCH
 	tristate "ChromeOS EC Type-C Switch Control"
-	depends on MFD_CROS_EC_DEV && TYPEC
+	depends on MFD_CROS_EC_DEV && TYPEC && ACPI
 	default MFD_CROS_EC_DEV
 	help
 	  If you say Y here, you get support for configuring the Chrome OS EC Type C
-- 
2.37.0.170.g444d1eabd0-goog

