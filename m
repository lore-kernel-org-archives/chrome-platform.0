Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A72612C
	for <chrome-platform@lists.linux.dev>; Mon, 21 Mar 2022 19:11:04 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id c11so10964370pgu.11
        for <chrome-platform@lists.linux.dev>; Mon, 21 Mar 2022 12:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2S7ShVJAy626NONsIWJsSJwwvja+2+hPi/cA9JVaGwU=;
        b=JMQZL+JUW/xaIOLRzFSLEcIywoAUAsY8Aq/8MMUP9fftDpOAFp/Od63YzymBQUSdT3
         n22HZYl5klKcsAHxTxTrqneEak2tOvU5t5ZaHGBuTBXl3QrR4cBekNm4chhO7g9+AkqV
         oewbc/4DhQbpvRaMT5oZMFBEka4PyQPQ01FEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2S7ShVJAy626NONsIWJsSJwwvja+2+hPi/cA9JVaGwU=;
        b=6pYgiVosnVedP+IbHR3gps3hjKDzgFXBlMiHoerf2yKqihUiMeSJIbk97xHnuMVJ0y
         ZTRoVVUGGeZCB2uStJjfkJd5GKOXGyWZ1WAY2iPq0gC87tWlRSV0nWMFn+u7xpjM4ZbK
         gm4dw7T3iAsJpGIw9Uqbfw4/f0MqNShGiMAuePVecPIEcHy/+iXlxpzFzCT6QV6LfK+A
         OOssI67FZd98wjaPtzCYov+haAEd27gYo9/7YHnHrBpZbFkW4Ggrwfdz/sojAtEODLiR
         OopM75ZkzDzSydWo4PZRG4ze6mxVWzUIWnfGCV5SCui6R/Ncz/H9Zzy01L8NjHHiyLe+
         EkWQ==
X-Gm-Message-State: AOAM533goEq2PVQlCFHVJyI3fLFFg48lWl9u0D/zeCV8VH/8E6j64UtL
	n49Nu2LZd0GWyx+hhcAC0gLfvA==
X-Google-Smtp-Source: ABdhPJwYrurevKmMK2GwtHliuAAWk+ENh/FntvetNgQnFy1BsgAoj7JXWTJdYoDQzHCFN+QXqI1vvA==
X-Received: by 2002:a63:4d15:0:b0:37f:f622:fe0f with SMTP id a21-20020a634d15000000b0037ff622fe0fmr19084086pgb.68.1647889864572;
        Mon, 21 Mar 2022 12:11:04 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:2ffa:f7a0:c7f5:8171])
        by smtp.gmail.com with ESMTPSA id y14-20020a056a001c8e00b004fa829db45csm3384022pfw.218.2022.03.21.12.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 12:11:04 -0700 (PDT)
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
Subject: [PATCH v4 2/3] platform/chrome: cros_ec_spi: Match cros-ec-fp compatible
Date: Mon, 21 Mar 2022 12:10:58 -0700
Message-Id: <20220321191100.1993-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.1.894.gb6a874cedc-goog
In-Reply-To: <20220321191100.1993-1-swboyd@chromium.org>
References: <20220321191100.1993-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the fingerprint cros-ec compatible so that we can probe fingerprint
devices using the cros-ec-fp binding.

Cc: Guenter Roeck <groeck@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Cc: Craig Hesling <hesling@chromium.org>
Cc: Tom Hughes <tomhughes@chromium.org>
Cc: Alexandru M Stan <amstan@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/platform/chrome/cros_ec_spi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_spi.c b/drivers/platform/chrome/cros_ec_spi.c
index 14c4046fa04d..51b64b392c51 100644
--- a/drivers/platform/chrome/cros_ec_spi.c
+++ b/drivers/platform/chrome/cros_ec_spi.c
@@ -813,6 +813,7 @@ static SIMPLE_DEV_PM_OPS(cros_ec_spi_pm_ops, cros_ec_spi_suspend,
 			 cros_ec_spi_resume);
 
 static const struct of_device_id cros_ec_spi_of_match[] = {
+	{ .compatible = "google,cros-ec-fp", },
 	{ .compatible = "google,cros-ec-spi", },
 	{ /* sentinel */ },
 };
-- 
https://chromeos.dev

