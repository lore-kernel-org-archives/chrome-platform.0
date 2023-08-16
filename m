Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C57FC8D0
	for <chrome-platform@lists.linux.dev>; Wed, 16 Aug 2023 10:42:02 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4fe655796faso10269007e87.2
        for <chrome-platform@lists.linux.dev>; Wed, 16 Aug 2023 03:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692182521; x=1692787321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EEOhlysOvfWNJvIb70cjtnJmAujK5omEn+wIvkrC/Ww=;
        b=Bbk0jbkCUL6Bw7ExFSdT/GvvQxOPYqWu2Qi9kKF3x77YR8kVSYKCk2aIpdDS+r6Cee
         uIuFolqUeIt/637IudG876aHUsAzoB2GYFQ+QZOoav2V7ANQtv29i6BhiBYK3WM4MeRt
         V9o3xWJFwXbTSpcbMFrWGLzNUakLQs//XQFb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692182521; x=1692787321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EEOhlysOvfWNJvIb70cjtnJmAujK5omEn+wIvkrC/Ww=;
        b=HPoKYbO+FrWRoUi2+55jo2zi6RHGqKMrWmAiQppvDJefEe3XsdWUnaV1iVcix2JQmr
         zLvFySVtcu+0KypzrvXEpwQc6WloZZS/E6hnDJWbKLhukbvIqs3uAfwoqaNqQ6EdKKUG
         ybxfCLHvn+1k8vNKWDWMdiwy+j3wj3A35kv2DvwVTSrBS5zW1xG4TwbvaVJxAOJmSZV+
         XRMmFW3Y5pcxxdY+SaT1brzCxDcKRHI3nvP1Kr/tJrqt31Q1L408+D4LR3/hWZJzaR2q
         B5CmDhpnBITluNN4t/9tiCoJq+USBx3s0IKZ3ixn0Fw0L7nJv65PSYu+450dpK4VdRWW
         W4MQ==
X-Gm-Message-State: AOJu0Yx/uX6di16I8fnSDjhA0czeAxyp0ddY4vAemw3d/L0HrB2e7F+4
	r5ZzGIsv07jnhjrhF4SDiA2fjg==
X-Google-Smtp-Source: AGHT+IE0uEVDF8E5jme7kg4yNkE/yuuga1yCAg5iZ5Ktjjzp7BITPW2cpxAD8XTiTR9FW2SVEFDFYQ==
X-Received: by 2002:a05:6512:3d20:b0:4fb:8eec:ce49 with SMTP id d32-20020a0565123d2000b004fb8eecce49mr1765492lfv.31.1692182520687;
        Wed, 16 Aug 2023 03:42:00 -0700 (PDT)
Received: from localhost ([2620:0:1043:12:eef1:eea9:c836:8ed9])
        by smtp.gmail.com with UTF8SMTPSA id k20-20020ac257d4000000b004fe4d122a66sm2861403lfo.187.2023.08.16.03.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 03:42:00 -0700 (PDT)
From: Stefan Adolfsson <sadolfsson@chromium.org>
X-Google-Original-From: Stefan Adolfsson <sadolfsson@google.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Reka Norman <rekanorman@chromium.org>,
	linux-media@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stefan Adolfsson <sadolfsson@chromium.org>
Subject: [PATCH] media: cros-ec-cec: Add Constitution to the match table
Date: Wed, 16 Aug 2023 12:41:25 +0200
Message-ID: <20230816104125.712370-1-sadolfsson@google.com>
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Adolfsson <sadolfsson@chromium.org>

Constitution has two HDMI ports which support CEC:
    Port B is EC port 0
    Port A is EC port 1

This patch depends on "media: cros-ec-cec: Add Dibbi to the match
table".

Signed-off-by: Stefan Adolfsson <sadolfsson@chromium.org>
---
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 29f9a464857b..3c27349ce1d6 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -313,6 +313,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Lisbon", "0000:00:02.0", { "Port B" } },
 	/* Google Dibbi */
 	{ "Google", "Dibbi", "0000:00:02.0", { "Port D", "Port B" } },
+	/* Google Constitution */
+	{ "Google", "Constitution", "0000:00:02.0", { "Port B", "Port A" } },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.41.0.694.ge786442a9b-goog

