Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED457B
	for <chrome-platform@lists.linux.dev>; Fri, 15 Apr 2022 00:32:55 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id q3so6016687plg.3
        for <chrome-platform@lists.linux.dev>; Thu, 14 Apr 2022 17:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pbmJlQ5qR1kbE+0/nE9kjO/1skZ6I73pg5jrM6AR8pU=;
        b=i4xp4OxhcZ40oUwcpgza1kp7fp5COsqzWZ/fhqpFqeTDyND88jjZOs+776yAiDWpKk
         B9M3ZfUFcIjIWKLuCC2Yey72mJ6TjNlCg4V3mPRLH0UbkP1rspoq+I9fn7B+asSqDFul
         JL9zYGoSQC/6hPIJFRLXwy0BMt+Q+fVwC1/lc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pbmJlQ5qR1kbE+0/nE9kjO/1skZ6I73pg5jrM6AR8pU=;
        b=pS+Pgb46PaPLsWWgy1zCLbQ4dtnqLzVeWkXVrg/Do419qlRGuy2t6TUcz/LI2rODUw
         5KIRijKuAAZVlO1d8HGltK/+SZjy65RVk7MrHiRpU5HM5FTYhDRaLU8Xka6LVzXSYzxR
         zngS6S2YEVUO/7Q972kun9ArWD9AooBKUgkcWSJYh9U3hjSTY4OmzHgb9C1Tl0kBcEcy
         +jHrdMcskZvYor5uIQv4y9QQtW4kSCROLhkrBRfZjbvWMnQcSZujdh+9DVpT0CiwPgde
         YEUgdkwkuh2J8CGZOZJn4knk0fje73dGLGCQV7+O4+Qnc07XTHVYHtb5iYNNyrQ4GICQ
         kL5g==
X-Gm-Message-State: AOAM5301tjYG6wH3HMYrFXRGnFNE0NdBPseaOiV5ppExHzGZ/omYc8TS
	JwYuHXaD+JaZG22jfi9EDiytDw==
X-Google-Smtp-Source: ABdhPJwpLciy5kX+80ADH/58xXbGxA3ukoZ2ddhMynp/EA/S9RnXSUcbCCLEUDTX2HYLh/N1aPdMWw==
X-Received: by 2002:a17:902:e0c9:b0:158:9b65:aab with SMTP id e9-20020a170902e0c900b001589b650aabmr11948591pla.18.1649982775315;
        Thu, 14 Apr 2022 17:32:55 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:e3e0:734:f81a:d2c1])
        by smtp.gmail.com with ESMTPSA id p12-20020a63ab0c000000b00381f7577a5csm2830187pgf.17.2022.04.14.17.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 17:32:54 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Benson Leung <bleung@chromium.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Lee Jones <lee.jones@linaro.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev
Subject: [PATCH 0/3] platform/chrome: Only register PCHG if present
Date: Thu, 14 Apr 2022 17:32:50 -0700
Message-Id: <20220415003253.1973106-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I see a printk when booting on chromebooks that don't have the
PCHG device. This series extracts the count function from the PCHG
driver and uses it in the mfd driver to skip registration of the PCHG
device if there aren't any charger ports. This gets rid of the message
at boot and removes one struct device from my system.

Stephen Boyd (3):
  platform/chrome: cros_ec_proto: Add peripheral charger count API
  mfd: cros_ec_dev: Only register PCHG device if present
  power: supply: PCHG: Use cros_ec_pchg_port_count()

 drivers/mfd/cros_ec_dev.c                     | 16 ++++++++++
 drivers/platform/chrome/cros_ec_proto.c       | 31 +++++++++++++++++++
 .../power/supply/cros_peripheral_charger.c    | 29 +----------------
 include/linux/platform_data/cros_ec_proto.h   |  1 +
 4 files changed, 49 insertions(+), 28 deletions(-)

Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daisuke Nojiri <dnojiri@chromium.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: <chrome-platform@lists.linux.dev>

base-commit: 3123109284176b1532874591f7c81f3837bbdc17
-- 
https://chromeos.dev

