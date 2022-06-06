Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2D17E
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jun 2022 20:18:46 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id n8so13030913plh.1
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jun 2022 13:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YAlsC0h5lJCHopuggZD7f+zz1bUnWsXyG9PWIkU6Y+0=;
        b=ke+dA0R0UcPduUVRV2FXD2PjVf/XTJl1ISNU7QZSaoQ5timKMdBpps4QhF7AmOrLCl
         AOOxm+gw+9qf/9Xinr9iE0yrg9SRY2mOA1WoSu1utrkhipzXioFCFGylTuYSTuuZr2Jm
         13zjEnDUxP1KxrqNVTLAvehtDotVwQJ0rDbhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YAlsC0h5lJCHopuggZD7f+zz1bUnWsXyG9PWIkU6Y+0=;
        b=TTNNiyQxO7dQPQE/q+ftFooldtFaTnbWJy8w/6dl6U0FlPVEHLp7VWm6Gb4ngQ1Ilw
         k9Q3g/6ykmsGo5XjpimO8L7uIqZzhdJxzUGu3AQrYof0kqMXAWFmEtN9gH2xlQOW6CfN
         KxhUgs6vJQlvl6uS6ce680erVf6Nou/Wz+7RpXl74Xkv8u526F5KHkJ3wKW5rVLTkcYe
         ofRoRVylCQwB3jemqP/Uz4MD/PH7pNVeHKLeonQ3lf4BOW72u6ibjTxXmkpzpMiXWH3f
         WPiQDZhCVvKDppJhmnaah3kDwK0VARbhiYcvXZEpCMGcwe49fF96UHghYue7oeO4E48S
         6mNQ==
X-Gm-Message-State: AOAM5334PxnnrXkIrOTOMKxXWBLYK7mfgeiYswxSd+gbkB1TVrUSXmy8
	/L6I2mlUXf1vWdYV1JmuKMz48w==
X-Google-Smtp-Source: ABdhPJxfTNfRlDzcEtbKKPeM95NhovvrUH81ZWKOfqkm4zJBNTQwYGnjfGyo0SpIDvpZh2V9lfWHlg==
X-Received: by 2002:a17:90b:5091:b0:1e8:990c:f735 with SMTP id rt17-20020a17090b509100b001e8990cf735mr2428046pjb.153.1654546725832;
        Mon, 06 Jun 2022 13:18:45 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id l5-20020a170902d34500b0015ef27092aasm10883034plk.190.2022.06.06.13.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 13:18:45 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: bleung@chromium.org,
	Prashant Malani <pmalani@chromium.org>,
	Brian Norris <briannorris@chromium.org>,
	chrome-platform@lists.linux.dev (open list:CHROME HARDWARE PLATFORM SUPPORT),
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Guenter Roeck <groeck@chromium.org>,
	Lee Jones <lee.jones@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH 0/3] platform/chrome: cros_ec_command() improvements
Date: Mon,  6 Jun 2022 20:17:59 +0000
Message-Id: <20220606201825.763788-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a short series related to cros_ec_command(). The first patch
updates a couple of Cros EC regulator callsites to use the common
cros_ec_command(). The next couple of patches do a rename and argument
type update.

Prashant Malani (3):
  regulator: cros-ec: Use common cros_ec_command()
  platform/chrome: cros_ec_proto: Rename cros_ec_command function
  platform/chrome: cros_ec_proto: Update size arg types

 drivers/mfd/cros_ec_dev.c                   |  4 +--
 drivers/platform/chrome/cros_ec_proto.c     | 22 ++++++------
 drivers/platform/chrome/cros_ec_typec.c     | 39 ++++++++++-----------
 drivers/platform/chrome/cros_usbpd_notify.c |  4 +--
 drivers/regulator/cros-ec-regulator.c       | 36 ++-----------------
 include/linux/platform_data/cros_ec_proto.h |  4 +--
 6 files changed, 39 insertions(+), 70 deletions(-)

-- 
2.36.1.255.ge46751e96f-goog

