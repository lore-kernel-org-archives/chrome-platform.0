Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA1E4A09
	for <chrome-platform@lists.linux.dev>; Fri, 19 Aug 2022 19:08:16 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id s36-20020a17090a69a700b001faad0a7a34so8376430pjj.4
        for <chrome-platform@lists.linux.dev>; Fri, 19 Aug 2022 12:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=8WuC3QVNj7mN+gJ3LjT4Cfvi0Qq7SJaLcYxLIkVCB2I=;
        b=boS2jioIR3XnzDYWXFCfhb+LllONe6VH67/GSUWbCeUb9ROSFmyoCi45qHQ2uqfNFl
         RkA7XlSJ4KoJmpr4d2cA3unGM72tJfyemOnWja22v9H5rVKNv/DJZlaK0Fdszjhid6Bk
         LpclbcGGjJO2xvS3oxWcpYdSSIbUg4TWAQCmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=8WuC3QVNj7mN+gJ3LjT4Cfvi0Qq7SJaLcYxLIkVCB2I=;
        b=t1jgHM3mzYze04zyGnr3msCaFlcq5aShFMTcGFI740nT43rvxFtq5Ca78ENLFaYXr3
         7POVTRx0knrZKYZAOw+Vg5oXQ+KSJGVFKpMkuhZRwS0t0OcSrtllmJ/vKgkRWW9VR0od
         JX1mB/+eVd2KkxnygPIczZ7Q6c8cijvCy/m3Yq1blZqYAvMdWLuhLaGwrs1Aw6jNlw7X
         P6LR8+ocAXxIJHrctjcNVq+Miuf/pVSS4r6ot9yxB7WNoadR50xg4o21R68CFZ71c7ES
         wjiiaimQOBlr8Cu3y32iJ+zOTQgrT8rCtTRcHIGnL7OZ/LyOnqd1RVKjQdLwaae1795a
         Mt4w==
X-Gm-Message-State: ACgBeo13e04u2JnO6Z3F/V2ENaZYoyb7nSLWZlM2fjeZD+iRgz7WDJNf
	GBDacv7Oo5zj8kDX6OxhNviAng==
X-Google-Smtp-Source: AA6agR7dsTtzR9jI8fPkHbcLyi9Kp1fhBb4YYG+GJpFhKXDSjZ84k8gw9vAMssGvEBMGyjOPq9p2/w==
X-Received: by 2002:a17:902:7242:b0:171:398d:9e66 with SMTP id c2-20020a170902724200b00171398d9e66mr8963930pll.19.1660936095903;
        Fri, 19 Aug 2022 12:08:15 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (137.22.168.34.bc.googleusercontent.com. [34.168.22.137])
        by smtp.gmail.com with ESMTPSA id b14-20020a170903228e00b00172a567d910sm3499775plh.289.2022.08.19.12.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 12:08:15 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: bleung@chromium.org,
	Prashant Malani <pmalani@chromium.org>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Guenter Roeck <groeck@chromium.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH 0/4] platform/chrome: cros_ec_typec: Altmode fixes
Date: Fri, 19 Aug 2022 19:08:01 +0000
Message-Id: <20220819190807.1275937-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a short series of minor fixes and changes to prepare the
ChromeOS Type-C driver to better support alternate mode drivers.

Prashant Malani (4):
  platform/chrome: cros_ec_typec: Add bit offset for DP VDO
  platform/chrome: cros_ec_typec: Correct alt mode index
  platform/chrome: cros_ec_typec: Stash port driver info
  platform/chrome: cros_ec_typec: Use Type-C driver data

 drivers/platform/chrome/cros_ec_typec.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

-- 
2.37.1.595.g718a3a8f04-goog

