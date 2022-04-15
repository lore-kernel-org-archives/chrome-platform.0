Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D8518D
	for <chrome-platform@lists.linux.dev>; Fri, 15 Apr 2022 00:32:57 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id cw11so6210859pfb.1
        for <chrome-platform@lists.linux.dev>; Thu, 14 Apr 2022 17:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jkz+K46qtkIknicoqbLXEwCJgWhY8AVoAaPBkdZve2U=;
        b=UGyg9hR+s/RnQZqDAT16Gq3HREy8egyTdio40vc9b2DXdzEhoR+syVUHMO6ACrN4si
         o5m2LO78SdlXKcFz2Y0unk1Rz3+ZYTNxIHyrEe7jYqw6KMm3qFBqzIGFfHfUbweV5EJK
         gYd2QE8lr4c2DhEP5HnJxUIOQSOD9VOv1Wm0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jkz+K46qtkIknicoqbLXEwCJgWhY8AVoAaPBkdZve2U=;
        b=1xGLMa8KOKxJ/UK1Iv/2Kb+ABCu8vg/v3D4DibOu4PxYRyfpnKf/W6b1OL2294O25d
         j19q9rRfP7Syoilf+yjP18Z+1xX8YkJCl3Y8Fgun/wOOSv+Jb//k0G6wsTBSkoH49+wt
         qNZcIg0U6gZE0yBv8i9XibEWIkmQ8Bkn07D9Uu9LLk8uQl4iDpcSJUj4pN8VYy2Jl8tw
         DE1YfVsWVJxB1gugjqZOeTbo+xQrJSOEosjX3fjP07YIxQiTHp7D0IuLwDLO2BuOZLJ7
         q3GVR/sU04R4qvNp3+BLsZ4m9h24zZq7zJOE0AL0XpZ5/oCP5XI4HK+OVqtFdi0+VCqu
         +qRQ==
X-Gm-Message-State: AOAM5307xOuf+VNS/bccOIDlowmUUsA5vCaqxLtdlyy66d47K8St9VYr
	bRLAhzz5MRbNK1orRKX2FaWUag==
X-Google-Smtp-Source: ABdhPJxvYhjYZJVkJb/YqcuxXe04uZW1OYgYUoLiRnxUGlY1oCtRAnvQQVyvmC3kzKaWPTQk6Qd8GA==
X-Received: by 2002:a05:6a00:cc3:b0:505:c82b:f4f8 with SMTP id b3-20020a056a000cc300b00505c82bf4f8mr6363580pfv.59.1649982777538;
        Thu, 14 Apr 2022 17:32:57 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:e3e0:734:f81a:d2c1])
        by smtp.gmail.com with ESMTPSA id p12-20020a63ab0c000000b00381f7577a5csm2830187pgf.17.2022.04.14.17.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 17:32:57 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Benson Leung <bleung@chromium.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Lee Jones <lee.jones@linaro.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev
Subject: [PATCH 2/3] mfd: cros_ec_dev: Only register PCHG device if present
Date: Thu, 14 Apr 2022 17:32:52 -0700
Message-Id: <20220415003253.1973106-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
In-Reply-To: <20220415003253.1973106-1-swboyd@chromium.org>
References: <20220415003253.1973106-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Don't create a device for the peripheral charger (PCHG) if there aren't
any peripheral charger ports. This removes a device on most ChromeOS
systems, because the peripheral charger functionality isn't always
present.

Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daisuke Nojiri <dnojiri@chromium.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: <chrome-platform@lists.linux.dev>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/mfd/cros_ec_dev.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 546feef851ab..d2ba6a1fbc1d 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -114,6 +114,9 @@ static const struct mfd_cell cros_ec_platform_cells[] = {
 	{ .name = "cros-ec-chardev", },
 	{ .name = "cros-ec-debugfs", },
 	{ .name = "cros-ec-sysfs", },
+};
+
+static const struct mfd_cell cros_ec_pchg_cells[] = {
 	{ .name = "cros-ec-pchg", },
 };
 
@@ -242,6 +245,19 @@ static int ec_device_probe(struct platform_device *pdev)
 		}
 	}
 
+	/*
+	 * The PCHG device cannot be detected by sending EC_FEATURE_GET_CMD, but
+	 * it can be detected by querying the number of peripheral chargers.
+	 */
+	if (cros_ec_pchg_port_count(ec)) {
+		retval = mfd_add_hotplug_devices(ec->dev,
+					cros_ec_pchg_cells,
+					ARRAY_SIZE(cros_ec_pchg_cells));
+		if (retval)
+			dev_warn(ec->dev, "failed to add pchg: %d\n",
+				 retval);
+	}
+
 	/*
 	 * The following subdevices cannot be detected by sending the
 	 * EC_FEATURE_GET_CMD to the Embedded Controller device.
-- 
https://chromeos.dev

