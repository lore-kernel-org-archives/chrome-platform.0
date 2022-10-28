Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AD41FDF
	for <chrome-platform@lists.linux.dev>; Fri, 28 Oct 2022 21:14:56 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id 20so5879166pgc.5
        for <chrome-platform@lists.linux.dev>; Fri, 28 Oct 2022 14:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ujrrf0uboQfvYL+QX/6R/v6yRcsPGzo+vWDkIBpQC3U=;
        b=hAMboiNXGwzfogwxNxk25ISfrCRUAyN7N3a6mSeDYroLEWBaazVzLEC+zF5fvgia4K
         F6xKEvTkHf3OzZ/LX7vRLmZOMCPETGhoptAdqfilrdBTeqytGpy25zvj2XOaBvJB6tNq
         zLwTDQjHsulpSbhRPP7Qx9mrR80jZr3sO4Tzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ujrrf0uboQfvYL+QX/6R/v6yRcsPGzo+vWDkIBpQC3U=;
        b=FOcLM2NGWXnZXgGNNYKsdkBGyBae8yJnlMx+qSzksvUYVI5UDEpcobuGkLcIgBrfVr
         SmSkocb7jSztEM4E3UVYhcL5nEUo9OCB74iUdXiY10kiguf6tfo2Gt67m9hRufoYQt2h
         2idm8glCXDNKvKAiDWXihb4Z1fO+O+Gpw7hPw9KagpEePkCEGpZIWZ0AVdlJEPwbgs6Q
         yga84w+G/gZsjbgocJdTtG5BZyJ8fbp68y2I5MroCPdiA2AqJTiukWkbri7scr+ruQDY
         qVZrOciNuJ2zoweAkFRPWMpIBhetUNKhrfEXNeL78Yys56wd7plVNOzudGJJY9JuB//y
         6rfA==
X-Gm-Message-State: ACrzQf1K2+wzgSeJIUlCFbtVuXeUxW/fpqymwyb78UOo85TBoUum4yJA
	o3g6BvFOr5eBvo3Beb+PaSK5tg==
X-Google-Smtp-Source: AMsMyM627qTuk0xQ3BfrSeQ3eIIkKsg3SThpR3lEHmzy3WNO0/wNh1VdWV0JXv/sB5TdAaF9gm2wNw==
X-Received: by 2002:a05:6a02:306:b0:46e:de86:8b24 with SMTP id bn6-20020a056a02030600b0046ede868b24mr1229478pgb.385.1666991695906;
        Fri, 28 Oct 2022 14:14:55 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:65f9:c180:249c:190f])
        by smtp.gmail.com with UTF8SMTPSA id b15-20020a170902650f00b00186c54188b4sm3442109plk.240.2022.10.28.14.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 14:14:55 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 2/5] platform/chrome: cros_ec_lpc: Mark PROBE_PREFER_ASYNCHRONOUS
Date: Fri, 28 Oct 2022 14:14:46 -0700
Message-Id: <20221028141411.2.Ib1036816e77aba71ebc16b71f7615c55d054689c@changeid>
X-Mailer: git-send-email 2.38.1.273.g43a17bfeac-goog
In-Reply-To: <20221028141411.1.I0728421299079b104710c202d5d7095b2674fd8c@changeid>
References: <20221028141411.1.I0728421299079b104710c202d5d7095b2674fd8c@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This takes on the order of 60ms to probe on some systems, so let it
probe asynchronously. It shouldn't have any dependencies that aren't
handled cleanly.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/platform/chrome/cros_ec_lpc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 0b6c7c912ec7..527092ffdecb 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -559,6 +559,7 @@ static struct platform_driver cros_ec_lpc_driver = {
 		.name = DRV_NAME,
 		.acpi_match_table = cros_ec_lpc_acpi_device_ids,
 		.pm = &cros_ec_lpc_pm_ops,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe = cros_ec_lpc_probe,
 	.remove = cros_ec_lpc_remove,
-- 
2.38.1.273.g43a17bfeac-goog

