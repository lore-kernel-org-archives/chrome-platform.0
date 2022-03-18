Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A303715AC
	for <chrome-platform@lists.linux.dev>; Fri, 18 Mar 2022 01:54:53 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id mr5-20020a17090b238500b001c67366ae93so4750923pjb.4
        for <chrome-platform@lists.linux.dev>; Thu, 17 Mar 2022 18:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yxBIhyBEiFAgJKygaBubKQqJRvLxov0I5kEUPytrKfg=;
        b=WD5W3/fIsPgoTeHB0lZ/uXeTTgKgmcA9bCns//Gj0j+EyV0fU/LfNz8OO3QC3dh8HN
         UGd85scVmHjhJbT6mtBGyPIl8bgmnzYiKbaVSr8yZp1J8ZKJTxl31DNziR2QJbuXFg44
         02U8Ev9jUnkIfk6No6xYbBV21t0VKBUT25KiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yxBIhyBEiFAgJKygaBubKQqJRvLxov0I5kEUPytrKfg=;
        b=8Mb0S1rt3xHQ0eNC5llM+GOL06jenGqhHszG0XzSOnfKe8wcEGCP46mBVpgtLGj32X
         khoY9+oGuUMwV6tXI5t/Y/lM2fxx5++8m1bZ6XS8YhQLlhy1mI9i+YpA7Ioe9gP9+N5p
         X21RzzZJ8aaKlOpvuZHbXdRDVZz+O7ADQSqH6W+RUtffr8TNVe9D4okDefPkSxNOvEod
         FkMuLBAomzOh3uSyplIF7+5mBQvegMGoBmJtNkqZVveo9W0W95HEGKSZzc/hDnJRTro8
         PcPjPjfH5UECqdasnUAKHZusEuPOnK9Wre7ZWzMX4SU6kwMPBzV2v8Y0fPzvkmSOucN/
         dOVA==
X-Gm-Message-State: AOAM532Ei/6yfZSmOeg+u8IexQ8WeqNnOX358uJycjd4CElplw9UDi0g
	O/6VB5DGrUX3aOh5vAjnFN6Wzg==
X-Google-Smtp-Source: ABdhPJzeWkYn3YRTNXiVy9jq/jxHPBPwqdVFOCPMSFezW6Lfd5nhL4ppj1XX9OB13gwnZ/g2PT2lCw==
X-Received: by 2002:a17:90b:789:b0:1bc:293c:1445 with SMTP id l9-20020a17090b078900b001bc293c1445mr19014934pjz.111.1647568493095;
        Thu, 17 Mar 2022 18:54:53 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:49cf:7701:359e:b28f])
        by smtp.gmail.com with ESMTPSA id u10-20020a056a00124a00b004f783abfa0esm8050201pfi.28.2022.03.17.18.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 18:54:52 -0700 (PDT)
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
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v3 0/3] Update cros-ec-spi for fingerprint devices
Date: Thu, 17 Mar 2022 18:54:47 -0700
Message-Id: <20220318015451.2869388-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.1.894.gb6a874cedc-goog
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

Changes from v2 (https://lore.kernel.org/r/20220317005814.2496302-1-swboyd@chromium.org):
 * Dropped cros-ec spi dt properties that aren't of use right now
 * Picked up tags

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

 .../bindings/chrome/google,cros-ec-fp.yaml    | 66 +++++++++++++++++++
 drivers/platform/chrome/cros_ec_spi.c         | 44 ++++++++++++-
 2 files changed, 107 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/chrome/google,cros-ec-fp.yaml

Cc: Rob Herring <robh+dt@kernel.org>
Cc: <devicetree@vger.kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Craig Hesling <hesling@chromium.org>
Cc: Tom Hughes <tomhughes@chromium.org>
Cc: Alexandru M Stan <amstan@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Matthias Kaehlcke <mka@chromium.org>

base-commit: ffb217a13a2eaf6d5bd974fc83036a53ca69f1e2
-- 
https://chromeos.dev

