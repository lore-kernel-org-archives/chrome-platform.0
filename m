Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328B717CE
	for <chrome-platform@lists.linux.dev>; Mon, 14 Aug 2023 04:33:16 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-565331f0736so3077909a12.0
        for <chrome-platform@lists.linux.dev>; Sun, 13 Aug 2023 21:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691987596; x=1692592396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JGX2iQreR4Wa0lEJRVthG1ZLrq79VS9RRmn8uvS4tBw=;
        b=ReM7E/zJUHj/2KoAnU/iyMfZfy0EDj8RbAiNZqdllHBsHTqXMjVsIukPm6CcNsmU8H
         IIxwpd16TYxaYMxKOcotA6ZC0D7bTIOJ5G/OUrO1SLPvArdnekH8sqqB+J0EAwZ4ii6/
         RgnDKUczA0XpHMepz7C4LaxVrXpnKGWoGfPrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691987596; x=1692592396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JGX2iQreR4Wa0lEJRVthG1ZLrq79VS9RRmn8uvS4tBw=;
        b=Lq/Oj2piSPpmcqNzh1gB9shP8sU8EYFRhhcV6VDpIQDK1TZObb2JvRkYstCfL72jfw
         rfXYXSyChczKoP0KIrrD8x561oOcwHK91qiNaFLuqWUlm2cwLCYr1u6n9qvqCZqRFGDF
         nBoyagdAZDY6xWlD0+LZFHgG5spGL24eDhFw0PmcFRV3mHRE8ApgO1nXCguVxU2GYhKf
         +Q0zOdcRZMl6aAPlSgNSv++eG160GbQ+y5neQdDF31sAQKoCgdC/dd9uVKQMctfPkp7G
         LIuS/ejIe+q4UUDqjiq3QPPinHZjyeLgs7tvnjPzgFLaHFxGKGZtyiEFpTxmrAqH61g4
         rdNg==
X-Gm-Message-State: AOJu0Yx/VS6zV04R2WIalKzY5g5etuMEYuo1Mek8A+R8tOWM3YgMUuFR
	EOn0VR3GeKVkDg5XyRH7lclbww==
X-Google-Smtp-Source: AGHT+IECfYOTOeL7Do4LXrA/RmqwOQo4GC8Ctl2U+2iZsd6BHgi+Q0ahMo2jCeaKtY142l90DpEN1g==
X-Received: by 2002:a17:902:d4c4:b0:1bc:411f:1097 with SMTP id o4-20020a170902d4c400b001bc411f1097mr9455934plg.47.1691987596346;
        Sun, 13 Aug 2023 21:33:16 -0700 (PDT)
Received: from rekanorman3.syd.corp.google.com ([2401:fa00:9:14:4ae6:d1a4:27c2:80ff])
        by smtp.gmail.com with ESMTPSA id ju17-20020a170903429100b001bdb0483e65sm6761865plb.265.2023.08.13.21.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 21:33:16 -0700 (PDT)
From: Reka Norman <rekanorman@chromium.org>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	Stefan Adolfsson <sadolfsson@google.com>,
	Reka Norman <rekanorman@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 0/9] media: cros-ec-cec: Add support for multiple ports
Date: Mon, 14 Aug 2023 14:29:09 +1000
Message-ID: <20230814043140.1108917-1-rekanorman@chromium.org>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The Google Dibbi chromebox will have two HDMI ports with CEC enabled via
its EC. Currently, the cros-ec-cec driver and the host command interface
to the EC assume there is only one port. E.g. the commands have no
parameter to indicated which port to operate on.

This series adds support for multiple ports. The driver is modified to
manage an array of ports, each with their own CEC adapter and notifier.
The host command interface is modified to support multiple ports. All
changes to interface are backwards compatible.


Reka Norman (9):
  media: cros-ec-cec: Use cros_ec_cmd to send host commands
  media: cros-ec-cec: Manage an array of ports
  media: cros-ec-cec: Support multiple ports in set/get host commands
  media: cros-ec-cec: Support multiple ports in write command
  media: cros-ec-cec: Support multiple ports in MKBP cec_events
  media: cros-ec-cec: Support receiving messages from multiple ports
  media: cros-ec-cec: Allow specifying multiple HDMI connectors
  media: cros-ec-cec: Get number of CEC ports from EC
  media: cros-ec-cec: Add Dibbi to the match table

 .../media/cec/platform/cros-ec/cros-ec-cec.c  | 376 ++++++++++++++----
 .../linux/platform_data/cros_ec_commands.h    |  66 ++-
 2 files changed, 354 insertions(+), 88 deletions(-)

-- 
2.41.0.640.ga95def55d0-goog

