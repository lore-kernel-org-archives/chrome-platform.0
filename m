Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FD311190
	for <chrome-platform@lists.linux.dev>; Thu, 29 Jun 2023 13:25:26 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-765942d497fso64615585a.1
        for <chrome-platform@lists.linux.dev>; Thu, 29 Jun 2023 06:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688045125; x=1690637125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hMqc59JLjfsmDQrIpQpsMtV1yNjY1VclkrG5Cc3ePcs=;
        b=YECbENiP1T1aRxkh7wMBIccAQs5xbJmnOtTGez2fjWzkY8z60Ng4fIrbin8eKfY2Qh
         NjqmdyJxhQfsgv3LkmbTCPj5eSMP9ppEseASW2eiiXI8fd/uL1kNjEsrvrbdGSmX8B24
         hWaDPdohAvJOW43sY0zlkwbOjCcAPlKArRyIzXCeUT4Yzu8pwpou1tywG+ypkh0a1XJx
         A5XnW9YXQuAjqZ/PwBoWeLZrPYQi+o7ffjT8uUmV8Ey+QDXFHU2eU1aEQIqSspi5GxD5
         iUZTb/lM9fIiwxKKitjWlRtd9v6mCDJW2cbRL3Sz8fEmT+FEjf6WaIRFjh6FR0EyB91D
         Aqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688045125; x=1690637125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hMqc59JLjfsmDQrIpQpsMtV1yNjY1VclkrG5Cc3ePcs=;
        b=HtPQtgsIFBPswqa3mCeHx8QCTlGVrzSp+SXmX2Bq0TNSoc7NzqgxaPj951lLF+BoHv
         KQg6bDhEGjd/lRT2ppAfjEJGdgZUh0QNc+xA1KqWyp4vQfYfPemtSsceNWN7NCCBK5/n
         8YI14diRjuasNvRRxXKggWBQ10xuJsd3WovG1xgsewB+OsVdzzjWB2S+hzM1HC4vcBg+
         TOtxodyBDrIEnOZnG+98PanA9OrOUvlMQC2TVz6s12U4VQbySp2KUJR2basu1kuSl+m4
         wvxiQUXaNhBxjtCPsKfEXl570qhh14dqa6RXKGxF4qCLoSAtOodR5J/s5GH2uZhn00jl
         bmtA==
X-Gm-Message-State: ABy/qLbPeWuPWaEdJGbm3A0bBIAjhZXvmNqPnDgd+G3f5pvuZjPIGNhA
	mVz0RxqrHw3JBOvtCJjTx+Q=
X-Google-Smtp-Source: APBJJlEKDJ/EBwBtGazRkXSXvIakwn2FfvV9Cd4dnKnKnIggg+6sAwFydC8nw3NE3Swc/kOq+zajtw==
X-Received: by 2002:a0c:ea50:0:b0:626:3a5a:f8f8 with SMTP id u16-20020a0cea50000000b006263a5af8f8mr376728qvp.58.1688045125146;
        Thu, 29 Jun 2023 06:25:25 -0700 (PDT)
Received: from chcpu17.cse.ust.hk (fc3kcs10.cse.ust.hk. [143.89.191.124])
        by smtp.googlemail.com with ESMTPSA id ej8-20020ad45a48000000b0062119a7a7a3sm7061271qvb.4.2023.06.29.06.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 06:25:24 -0700 (PDT)
From: Yiyuan Guo <yguoaz@gmail.com>
To: jic23@kernel.org,
	lars@metafoo.de,
	bleung@chromium.org,
	groeck@chromium.org
Cc: dianders@chromium.org,
	mazziesaccount@gmail.com,
	gwendal@chromium.org,
	linux-iio@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	yguoaz@gmail.com
Subject: [PATCH] iio: Fix the allocation size for cros_ec_command
Date: Thu, 29 Jun 2023 21:24:05 +0800
Message-Id: <20230629132405.1237292-1-yguoaz@gmail.com>
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

Signed-off-by: Yiyuan Guo <yguoaz@gmail.com>
---
 drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
index 943e9e14d1e9..e4c01f1072bd 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
@@ -253,8 +253,8 @@ int cros_ec_sensors_core_init(struct platform_device *pdev,
 	platform_set_drvdata(pdev, indio_dev);
 
 	state->ec = ec->ec_dev;
-	state->msg = devm_kzalloc(&pdev->dev,
-				max((u16)sizeof(struct ec_params_motion_sense),
+	state->msg = devm_kzalloc(&pdev->dev, sizeof(*state->msg) +
+			max((u16)sizeof(struct ec_params_motion_sense),
 				state->ec->max_response), GFP_KERNEL);
 	if (!state->msg)
 		return -ENOMEM;
-- 
2.25.1

