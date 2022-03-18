Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D243215AC
	for <chrome-platform@lists.linux.dev>; Fri, 18 Mar 2022 01:54:55 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id c11so4034698pgu.11
        for <chrome-platform@lists.linux.dev>; Thu, 17 Mar 2022 18:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yclMSQyOdfMOQoKpzUaRMtJg5TrGLXT/don6YL5wL2c=;
        b=d2lwOh30lYLmGIksygfZa83/YPhubrVDgBVn0fNS04CVQG9Tclhpai24uavY85z+0J
         Iu7l9uz+mGGWxjO+FK235uTwQZAgNCd88OJaVGQhXiarlj5laEa8IiJWDMiU8wgj4IWG
         6YlOzrKY21jKVAnvlEtJ83EZ9wrW3o4esVGL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yclMSQyOdfMOQoKpzUaRMtJg5TrGLXT/don6YL5wL2c=;
        b=spebLVgXu2IpmwjUos3Jb/KOXkQb8dTfrD3uDtIbLf+Ybcm5NwM8IcG1EGNadueApD
         WT6L4CYltBRBg/Yoj7f4fz9r4SRarIDVTg2z1hPtP9sgDqdLoIkjUyij8PMFaoCl8sDB
         x0geXOq8/TZywXwLXEVXbXt8RaTMYOhsYFv2B+U34NELDPOH9zmcvwOa2w4lSHSNsGYM
         SxBTGEe4ADEuFgOzAQ3LGdS/AIfu7oNkR/yvIXLKtJQ+7lbkk3b0qSUCE05jE7oTDmF+
         KY+nDr7mU/wQUoK1IImXgt2sQ9u5u4MmbxXf2Z10Ubz009BEGr2b/eYFue78rcRaiVwr
         rDmQ==
X-Gm-Message-State: AOAM531hMhJcTcAXKRVVMJ79tpmFFG3gduDNIg3ViGacMT6cy0il7N5b
	f6A/0fdKLna4fmgVzbuCgS/Trg==
X-Google-Smtp-Source: ABdhPJy3Ad1i05NYrMrhjpdEuaAZPN9G/qb30grnL6HPiiVjTdRz0jeLpRhropCPVAl3vnQ+yWwAHg==
X-Received: by 2002:a65:4789:0:b0:374:8b11:fb47 with SMTP id e9-20020a654789000000b003748b11fb47mr5909016pgs.325.1647568495413;
        Thu, 17 Mar 2022 18:54:55 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:49cf:7701:359e:b28f])
        by smtp.gmail.com with ESMTPSA id u10-20020a056a00124a00b004f783abfa0esm8050201pfi.28.2022.03.17.18.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 18:54:55 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Benson Leung <bleung@chromium.org>
Cc: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Guenter Roeck <groeck@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Craig Hesling <hesling@chromium.org>,
	Tom Hughes <tomhughes@chromium.org>,
	Alexandru M Stan <amstan@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v3 2/3] platform/chrome: cros_ec_spi: Match cros-ec-fp compatible
Date: Thu, 17 Mar 2022 18:54:49 -0700
Message-Id: <20220318015451.2869388-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.1.894.gb6a874cedc-goog
In-Reply-To: <20220318015451.2869388-1-swboyd@chromium.org>
References: <20220318015451.2869388-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the fingerprint cros-ec compatible and spi_device_id so that we can probe
fingerprint devices.

Cc: Guenter Roeck <groeck@chromium.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Craig Hesling <hesling@chromium.org>
Cc: Tom Hughes <tomhughes@chromium.org>
Cc: Alexandru M Stan <amstan@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/platform/chrome/cros_ec_spi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_spi.c b/drivers/platform/chrome/cros_ec_spi.c
index 14c4046fa04d..d0f9496076d6 100644
--- a/drivers/platform/chrome/cros_ec_spi.c
+++ b/drivers/platform/chrome/cros_ec_spi.c
@@ -813,12 +813,14 @@ static SIMPLE_DEV_PM_OPS(cros_ec_spi_pm_ops, cros_ec_spi_suspend,
 			 cros_ec_spi_resume);
 
 static const struct of_device_id cros_ec_spi_of_match[] = {
+	{ .compatible = "google,cros-ec-fp", },
 	{ .compatible = "google,cros-ec-spi", },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, cros_ec_spi_of_match);
 
 static const struct spi_device_id cros_ec_spi_id[] = {
+	{ "cros-ec-fp", 0 },
 	{ "cros-ec-spi", 0 },
 	{ }
 };
-- 
https://chromeos.dev

