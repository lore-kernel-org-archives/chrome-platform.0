Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E764C2F24
	for <chrome-platform@lists.linux.dev>; Mon, 18 Jul 2022 18:56:15 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id v4-20020a17090abb8400b001ef966652a3so19072996pjr.4
        for <chrome-platform@lists.linux.dev>; Mon, 18 Jul 2022 11:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ImWpl/KKv4UFu4MEO4wU0UdHvw3c0qhUubcZMjHwl1c=;
        b=ZoiVOL41A6vCsGH0b1L/NLRLJ58R67hAbMBl6a3ujrVpjQ4uRQDZ+b6sOUeVZChAv1
         Db+5EalLfTpv9YtPjcUskcoveKHKgPRjT7MSTzmSENZn0PUr4iiWciunSBvNuGMSCB8i
         mS/7dQdFnfsxyyVcx128s5nawZVpZOpiVwKlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ImWpl/KKv4UFu4MEO4wU0UdHvw3c0qhUubcZMjHwl1c=;
        b=Xs+kSwJZagGJ/q39uaSXWR9/vVqr9hKedUxBrhe6IFi3wiCx5zLxCTsioJc6qbM/jO
         n3/MeRyOpzzvtklCv4bTTvxI5REKdOrQM3E5Q3t2Nrndg5hMqc/edxItEN43/TORfseD
         pQeT12O0IiAiYXD6pOsxjaQkajnaDjpcJBoAFYGFN93p+QnixdoFnnO7GAtABf90vBhD
         5E0E0Voc8q9IQGvewIaPT9QpRdauk+R5O7ntjUuwbrHlxiQQlU4aTSAmf/BmZhu+qzfs
         nUzFM6kCpePGt755JNzyTpto1vFjsp8amKjklItRbE3ziMtjLGwl+xQKbnkkYOrpHjbw
         tPbg==
X-Gm-Message-State: AJIora8e0k+m+n1wqb9gOaj1XQ/SCZA/YJsKeCnEnayNdAIZ2zgGRGq9
	sIsE1Ngy9i2yfVjq7XW3Kxu+idcGPadCEw==
X-Google-Smtp-Source: AGRyM1t8c/cRBGwxbDh8wtrP3JCV2aD79MUsWaVgg+FuCPJnIe4Rl3qht860tDVjt0ZtJy8teE9r9g==
X-Received: by 2002:a17:902:f092:b0:16c:abb9:f984 with SMTP id p18-20020a170902f09200b0016cabb9f984mr25023585pla.41.1658170575345;
        Mon, 18 Jul 2022 11:56:15 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id d66-20020a621d45000000b00528669a770esm9791323pfd.90.2022.07.18.11.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 11:56:14 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: bleung@chromium.org,
	gregkh@linuxfoundation.org,
	Prashant Malani <pmalani@chromium.org>,
	"Reported-by : kernel test robot" <lkp@intel.com>
Subject: [PATCH] platform/chrome: cros_typec_switch: Add ACPI Kconfig dep
Date: Mon, 18 Jul 2022 18:55:51 +0000
Message-Id: <20220718185551.1025288-1-pmalani@chromium.org>
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
Reported-by: Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
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

