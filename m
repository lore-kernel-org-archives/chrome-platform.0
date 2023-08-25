Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092977E0
	for <chrome-platform@lists.linux.dev>; Fri, 25 Aug 2023 02:49:24 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-563f8e8a53dso216441a12.3
        for <chrome-platform@lists.linux.dev>; Thu, 24 Aug 2023 19:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692931764; x=1693536564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mXGXLKS3jNZtWjpP8MUeUNI8wguvALNNe8QcWuaTTAc=;
        b=Mj1W1eqcThgQTlQYu1yvNbtvQH/G5alkFNQy+YuuNyLjj4Hnae2wGWDYKymil8WYMh
         WCLCxv/Su3Tu4DbXSDGi+N1vhvTsiDpzz/SR9b5Zk4YRuBWqlU1H+0WmeJ3Pyn892zw8
         WptBDyuOgu2IVHdBERb8/a8/xUD1iCOpwm6Gw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692931764; x=1693536564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mXGXLKS3jNZtWjpP8MUeUNI8wguvALNNe8QcWuaTTAc=;
        b=gG2X0DFXUW/TYWUuHeqLnct5jjtvJG9NzXq4z57j5X0m4eG6xr6j+rjmHCONIZMWcB
         zGdGgLMJrVmcEBBsRp2z6im0bS/+5XYMZ6juiiBkbFiSx/kDSHDV3lkfxiurqLAdHh9Z
         shpn3dFKP2N8y3WXITKIcXIpMHsQfAPHnBtCMQzbbYIzrjDa44vVuAQgM0K1On4ybtSz
         KymynirpjdSRATICzovSK3MV1PGIuuhmISNMjUBUrIlDL8ZnsLoAOeHVb4c4ZB2Bn/jF
         nNU/r0qMNQt7wVoeu+rBX7AwfVoNuktRJfFZjFt5T8ymXfg8MSH9UaWw5qXiSqIbufUT
         dYLg==
X-Gm-Message-State: AOJu0YyzIGAS4O/6Ib9U0sGsUP3vUC6KCXQuxTdzSqA13JUXNVuF/zWR
	JAIwzIYq0Tjb5LXrp2iuuegUfg==
X-Google-Smtp-Source: AGHT+IGNYtCTR8SWTybJF6A/n55k6TG7mlB9uXu6QZZkx9rf59w+jxMBHqodnR3YX5bLWYANu9sCzA==
X-Received: by 2002:a17:902:d345:b0:1bb:1e69:28be with SMTP id l5-20020a170902d34500b001bb1e6928bemr13861764plk.42.1692931764287;
        Thu, 24 Aug 2023 19:49:24 -0700 (PDT)
Received: from rekanorman3.syd.corp.google.com ([2401:fa00:9:14:9fe1:d4b1:42cc:882f])
        by smtp.gmail.com with ESMTPSA id q10-20020a170902a3ca00b001bb0eebd90asm420847plb.245.2023.08.24.19.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 19:49:23 -0700 (PDT)
From: Reka Norman <rekanorman@chromium.org>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Daisuke Nojiri <dnojiri@chromium.org>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Stefan Adolfsson <sadolfsson@google.com>,
	Reka Norman <rekanorman@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 0/9] media: cros-ec-cec: Add support for multiple ports
Date: Fri, 25 Aug 2023 12:43:53 +1000
Message-ID: <20230825024735.1443836-1-rekanorman@chromium.org>
X-Mailer: git-send-email 2.42.0.rc2.253.gd59a3bf2b4-goog
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

Changes in v2:
- Make port_num unsigned in handle_cec_event
- Use NULL-terminated arrays for the conns field of cec_dmi_match
- Use a NULL-terminated conns array for the Dibbi match table entry

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

 .../media/cec/platform/cros-ec/cros-ec-cec.c  | 379 ++++++++++++++----
 .../linux/platform_data/cros_ec_commands.h    |  66 ++-
 2 files changed, 357 insertions(+), 88 deletions(-)

-- 
2.42.0.rc2.253.gd59a3bf2b4-goog

