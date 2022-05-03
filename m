Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F6F33C9
	for <chrome-platform@lists.linux.dev>; Tue,  3 May 2022 20:42:15 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id v11so6199968pff.6
        for <chrome-platform@lists.linux.dev>; Tue, 03 May 2022 13:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9sH2w/vVTdfqCz9W7ywvi2pyU3dj2/u0WQnJwqpg8dQ=;
        b=TsVPkF5lorasvG1c2y3HR37wwKZGRSaeSe8PsNwNLlK2wi5Bosh8OI+CNya7EG9Y+u
         hlQIkf+UrhTi6GFmf6u+1ZfSEvNA1YPyjKpWKXYmIfdnnXqkNqVbZQR0YW6n2Vzg4Z8e
         ktwBeYTBB86K88SKuYlb7OF+aibShxishTBzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9sH2w/vVTdfqCz9W7ywvi2pyU3dj2/u0WQnJwqpg8dQ=;
        b=ZMh4+Yv2s1sxxj0pLgPrcNDP5gFcy55xBYc9ngllELXZZHN7fRzjzXnQvSM7pwXcKf
         nfVryc2aKzD4h0F0zqPiTtOZyahjppCaiw+PLxnbg1THLN4ZV+qTNzgk6q991dwakB4o
         nXizxC8miHQOwgTvTfsub3b8l0dtvv8KPOjzMQMQLt4j1ES9zn9Qk56/KdrepfZhF3cT
         DbpqTY8MHp7n0t8OfsPS+SGOUeYoAtqAyliklaoy8DVTzbssvkJtKDsJipYmgDCWHkwN
         j+sbxb90eTpEKdarQv/vJdhoXazcOnZLEkkxIKNeskFx/LPtS4cG7i51xKqHcpt/oYR0
         7AmQ==
X-Gm-Message-State: AOAM533VVou+0hUSm0NH75F1l5nwYhrvtwmZMtuzpEFFFPV3Ll5CimlM
	xepNdXCxqPA/FxY6o7/fnOQFhw==
X-Google-Smtp-Source: ABdhPJyjndjP6OpzigAn1DCQYecLfzQxzacZHA2QxQ7hTlGtc3urBMYgF3okwc7M7hDK8vnnYzwa4w==
X-Received: by 2002:aa7:8258:0:b0:50d:d365:70c8 with SMTP id e24-20020aa78258000000b0050dd36570c8mr15890945pfn.50.1651610535103;
        Tue, 03 May 2022 13:42:15 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:15e:c760:9a04:7fbe])
        by smtp.gmail.com with ESMTPSA id x18-20020aa79192000000b0050dc76281e4sm6702081pfa.190.2022.05.03.13.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 13:42:14 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	chrome-platform@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	"Joseph S. Barrera III" <joebar@chromium.org>
Subject: [PATCH v4 0/2] Input: cros-ec-keyb: Better matrixless support
Date: Tue,  3 May 2022 13:42:10 -0700
Message-Id: <20220503204212.3907925-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.36.0.464.gb9c8b46e94-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a followup to my previous patch[1] that skips keyboard registration
when the matrix properties aren't present. This adds a compatible string
for this scenario so we can ease existing DTBs over to the new design.

Changes from v3 (https://lore.kernel.org/r/20220503042242.3597561-1-swboyd@chromium.org):
 * s/register_keyboard/has_keyboard/
 * Pick up review tags
 * Indicate properties are required in example #2 in yaml file

Changes from v2 (https://lore.kernel.org/r/20220429233112.2851665-1-swboyd@chromium.org):
 * Drop rows/cols check now that compatible schema handles it
 * Make binding require rows,cols,keymap for cros-ec-keyb compatible

Changes from v1 (https://lore.kernel.org/r/20220427203026.828183-1-swboyd@chromium.org):
 * Better enforcement of properties in DT binding
 * Skip registration by means of adding compatible to device id list

Stephen Boyd (2):
  dt-bindings: google,cros-ec-keyb: Introduce switches only compatible
  Input: cros-ec-keyb - skip keyboard registration w/o cros-ec-keyb
    compatible

 .../bindings/input/google,cros-ec-keyb.yaml   | 87 +++++++++++++++++--
 drivers/input/keyboard/cros_ec_keyb.c         | 19 ++--
 2 files changed, 91 insertions(+), 15 deletions(-)

Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: <devicetree@vger.kernel.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: "Joseph S. Barrera III" <joebar@chromium.org>

[1] https://lore.kernel.org/all/20220425210726.3813477-1-swboyd@chromium.org/

base-commit: 4352e23a7ff2f8a4ff229dd1283ed2f2b708ec51
-- 
https://chromeos.dev

