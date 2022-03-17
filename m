Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C157D2F36
	for <chrome-platform@lists.linux.dev>; Thu, 17 Mar 2022 00:58:17 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id 132so1448859pga.5
        for <chrome-platform@lists.linux.dev>; Wed, 16 Mar 2022 17:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fEiIQq/+MOx3ePleZyRnWSsBiCDIwdwlXulJMg5j/dU=;
        b=ZVsb4IAerwlksFkFTiTBppTgLDXwo3YbWwf6u3r/vAIo88oQ2UCDC1FgVVqqHUIZnZ
         L/zbUUB38+uJ4VrxZNlGL6qlO777DWxW3bVI/stdj64lOb/d6hAOvPSYtAOaaJF93ZvC
         SevGZCWI9eBHOrHZcmAV75OSRk4YzDESwsOPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fEiIQq/+MOx3ePleZyRnWSsBiCDIwdwlXulJMg5j/dU=;
        b=zmrfwzXME5Lb8uQvchId0tye8VjkYXxgt5H/9X7Vqsdtx/hHrYGbwR4Ov7HdKSTLDB
         dffShJ67QQ4d9Kze0SvK4vA+66pG1OdTGOYVjE8NKggWGExdSqjxznVTHSJWxjeKvOY7
         aK5f+N+JVc9qoJC3uq9JirYLv16bXPT9cgAwv9DktCyVNJxxWXCj1dTkpjspEvipUrOD
         QpV4dcrm44Kw+yV6Dp3g2VsHnF4AuZjeEgbFXvjt3/PatzJwzHVBh0OETXwX8neLQEBk
         L/ksXaI2HqlOCs13/FjoXIVjoIK9k2R+1sJtXiNpjzg4nCrQuFE6nO3h5QuB7EGGAgld
         OMlA==
X-Gm-Message-State: AOAM532UL7/0T1EMRsUHUT3SG10yoAKUkjpb3oC8L2XMFv/LPafmHovm
	NZgBsR7/H8Q+ep9Z+/Lbi2WIzQ==
X-Google-Smtp-Source: ABdhPJz9glq6TQM7GOOPVAx81AqOWt/UlQ9XNEvnwyjw33SzLieR6JBTwjoQR821DFRC/3bxvWAEPA==
X-Received: by 2002:a63:d306:0:b0:34e:4330:efea with SMTP id b6-20020a63d306000000b0034e4330efeamr1720091pgg.174.1647478697208;
        Wed, 16 Mar 2022 17:58:17 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:dec5:e3f8:cbd7:f5a7])
        by smtp.gmail.com with ESMTPSA id l20-20020a056a00141400b004f65cedfb09sm4433445pfu.48.2022.03.16.17.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 17:58:16 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Benson Leung <bleung@chromium.org>
Cc: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Guenter Roeck <groeck@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Craig Hesling <hesling@chromium.org>,
	Tom Hughes <tomhughes@chromium.org>,
	Alexandru M Stan <amstan@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH v2 0/3] Update cros-ec-spi for fingerprint devices
Date: Wed, 16 Mar 2022 17:58:11 -0700
Message-Id: <20220317005814.2496302-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.1.723.g4982287a31-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces a DT binding for chromeos fingerprint
devices and then implements support to boot those processors during
driver probe if the BIOS hasn't done it already.

Changes from v1 (https://lore.kernel.org/r/20220314232214.4183078-1-swboyd@chromium.org):
 * Properly do the boot sequence
 * Add a message that we're booting and delaying a while
 * Fix typo in commit text
 * Change binding to not spell out reset-gpios and indicate that boot0
   is about asserting boot mode
 * Split device id to different patch as it's a different topic from
   booting

Stephen Boyd (3):
  dt-bindings: chrome: Add ChromeOS fingerprint binding
  platform/chrome: cros_ec_spi: Match cros-ec-fp compatible
  platform/chrome: cros_ec_spi: Boot fingerprint processor during probe

 .../bindings/chrome/google,cros-ec-fp.yaml    | 85 +++++++++++++++++++
 drivers/platform/chrome/cros_ec_spi.c         | 44 +++++++++-
 2 files changed, 126 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/chrome/google,cros-ec-fp.yaml

Cc: Rob Herring <robh+dt@kernel.org>
Cc: <devicetree@vger.kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Craig Hesling <hesling@chromium.org>
Cc: Tom Hughes <tomhughes@chromium.org>
Cc: Alexandru M Stan <amstan@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>

base-commit: ffb217a13a2eaf6d5bd974fc83036a53ca69f1e2
-- 
https://chromeos.dev

