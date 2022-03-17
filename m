Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A042F36
	for <chrome-platform@lists.linux.dev>; Thu, 17 Mar 2022 00:58:19 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id t5so5544304pfg.4
        for <chrome-platform@lists.linux.dev>; Wed, 16 Mar 2022 17:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ozEwxbhS5CJ9GBcAAvnujKd841/J1GSZd5stO5HqEjg=;
        b=lo0d5tF/rK43t4wYULaadPTcwiYjzT503duKa/wadkni0wAlDUtkjc3hBPNwZ651jb
         pylYMJmLs0li6nZfG46yutukJ5dpRILnAC/cCyy9fDEBTGaCwRuI7uV2QeM2xKP61NlS
         Ls3/+5hGfssJMzw2v0cYQE7gzcQ3KR50+CbbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ozEwxbhS5CJ9GBcAAvnujKd841/J1GSZd5stO5HqEjg=;
        b=MBmIDK2N/opst12aeMOUYBPmOiCN87OQuxGGnrP65feOEHyXBuV1C45C7fdM+dcmY3
         86zWkmAaJel2uLB0D/hcln5x75BGEVvkmJ2Zm0eQ/MF4YHWkYU978P2CQZ6W6rs3awbn
         uBjHj1/WfJ1qh/ktscHAV3cTiRAmTx6edDWedDKj1W79DFYlTpssBCiGQZ7qM9JWHbB6
         xnMRWM0vY4iEMAqODE8fSCaLNdH21B7qWfiu1COY/jWgjPCFFMA2fHBt/4215O6XwY0a
         z8FVVdqnwAV/DTZ9UwLVsT6yNkk5yfhbkUIlv+CQ88buL34xFPwiUEBkdmiMAT//0NDl
         oqOQ==
X-Gm-Message-State: AOAM5333Na0eX+ftS/0uNX3Fce5wKi200vQpG290i4w3Lid828GQXZ4T
	FKBopXJjHeamxnRTSuHgDdTcbQ==
X-Google-Smtp-Source: ABdhPJzkyu8es5VniOnUk80gazU+n+K2q/wh9W4obuf9K7sJsU0VfFzQ6S1sX/59tsvUJfjVj8kQ4g==
X-Received: by 2002:aa7:9ac5:0:b0:4f6:a2e1:6073 with SMTP id x5-20020aa79ac5000000b004f6a2e16073mr2534018pfp.52.1647478699424;
        Wed, 16 Mar 2022 17:58:19 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:dec5:e3f8:cbd7:f5a7])
        by smtp.gmail.com with ESMTPSA id l20-20020a056a00141400b004f65cedfb09sm4433445pfu.48.2022.03.16.17.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 17:58:19 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Benson Leung <bleung@chromium.org>
Cc: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Guenter Roeck <groeck@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Craig Hesling <hesling@chromium.org>,
	Tom Hughes <tomhughes@chromium.org>,
	Alexandru M Stan <amstan@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH v2 2/3] platform/chrome: cros_ec_spi: Match cros-ec-fp compatible
Date: Wed, 16 Mar 2022 17:58:13 -0700
Message-Id: <20220317005814.2496302-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.1.723.g4982287a31-goog
In-Reply-To: <20220317005814.2496302-1-swboyd@chromium.org>
References: <20220317005814.2496302-1-swboyd@chromium.org>
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

