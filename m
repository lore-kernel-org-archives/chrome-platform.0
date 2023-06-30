Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A54E55E
	for <chrome-platform@lists.linux.dev>; Fri, 30 Jun 2023 14:38:27 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-76728ae3162so178689785a.3
        for <chrome-platform@lists.linux.dev>; Fri, 30 Jun 2023 07:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688135907; x=1690727907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NJtRVTrBXHzy1SAWRtn4ErvKw0dJAPtFGr8YFV61VM0=;
        b=qo3c6gQ1aurXfcty4ClitGHXhU+jPlmGo49d+CkjKkjvIi1LJbt+s9zkIT6KBeb6VS
         htw7qWxVw/SmPP8H4T/3TxIChnmbiPs98uaK6xU8AeBsMI96ZZdL49ugCuz7UutZOLY5
         wCNL+MNIT1e6RFeRlUXUaombnzbBlK7YGspY03gw+ZiCWOUkfJEFRWJKcpDRzKkZUoev
         0XjGTySAb2db0Uvh+dlktnozINVfhguYTrMB/rqGrzLf+7/AMRdk51lRHTYFhDz77OSe
         4LDrBmpluWDKanHDbBcWXtOpMCv8bnyiTrc8zzpkLMd5NvfYLkXUaEpmzGvK2S+0C/fx
         y0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688135907; x=1690727907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NJtRVTrBXHzy1SAWRtn4ErvKw0dJAPtFGr8YFV61VM0=;
        b=Z/perJYjDEmgVrqtEbsE2jnptu3TKS6b0G4ecIgf4TipJwolfKS5fFV1TnKAtMyt0/
         AOE7+PHgVINGdWoeiCmgWbpzSo/NGIR6ieVbufo5iWmqc5zoMjWodC9TSCGB9Q08WsSF
         1qNBRJ/7+PN9iixaFeqLF431U/NcJ/nvZtgN1kK/m0es5SswGLmC2Ac7ButelkYc+Cvt
         fZU/SPXf7HJE978k6yXygcjMr3T0r6vv2nyOzokit6oiPSt/gv/rEd+r2uXulKbXPixu
         rehOW/gaC44IxLZgtAHSYRvWxjgcMUeMzBx09FmqCRFROFUcjr95LvJaIUKEqI/TiaZv
         u1hQ==
X-Gm-Message-State: ABy/qLZgqNryryOThY9FGK04nzGgGYhBqwFH1XtrJyFu0pswoCi7tlrY
	tVNR6Tz4qdDSuECmSjziv4g=
X-Google-Smtp-Source: APBJJlGl49NkX3puvlSHJbA3MwbpD7GXW1Ez14RmX3plv1Gv8oo9e3Lj4B7DSVGpda0ARFzY9/VOtg==
X-Received: by 2002:ad4:5966:0:b0:623:9ac1:a4be with SMTP id eq6-20020ad45966000000b006239ac1a4bemr3302573qvb.12.1688135906782;
        Fri, 30 Jun 2023 07:38:26 -0700 (PDT)
Received: from chcpu17.cse.ust.hk (fc3kcs10.cse.ust.hk. [143.89.191.124])
        by smtp.googlemail.com with ESMTPSA id g10-20020ad4510a000000b0063623c266easm1832100qvp.3.2023.06.30.07.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 07:38:26 -0700 (PDT)
From: Yiyuan Guo <yguoaz@gmail.com>
To: tzungbi@kernel.org
Cc: jic23@kernel.org,
	lars@metafoo.de,
	bleung@chromium.org,
	groeck@google.com,
	dianders@chromium.org,
	mazziesaccount@gmail.com,
	gwendal@chromium.org,
	linux-iio@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	yguoaz@gmail.com
Subject: [PATCH v3] iio: cros_ec: Fix the allocation size for cros_ec_command
Date: Fri, 30 Jun 2023 22:37:19 +0800
Message-Id: <20230630143719.1513906-1-yguoaz@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The struct cros_ec_command contains several integer fields and a
trailing array. An allocation size neglecting the integer fields can
lead to buffer overrun.

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Yiyuan Guo <yguoaz@gmail.com>
---
v2->v3: 
 * Added R-b tag from Tzung-Bi Shih
 * Aligned the code by adding an extra tab before "max"
 * Added a patch changelog
v1->v2: Prefixed the commit title with "iio: cros_ec:"

 drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
index 943e9e14d1e9..b72d39fc2434 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
@@ -253,7 +253,7 @@ int cros_ec_sensors_core_init(struct platform_device *pdev,
 	platform_set_drvdata(pdev, indio_dev);
 
 	state->ec = ec->ec_dev;
-	state->msg = devm_kzalloc(&pdev->dev,
+	state->msg = devm_kzalloc(&pdev->dev, sizeof(*state->msg) +
 				max((u16)sizeof(struct ec_params_motion_sense),
 				state->ec->max_response), GFP_KERNEL);
 	if (!state->msg)
-- 
2.25.1

