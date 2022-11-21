Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB85679C3
	for <chrome-platform@lists.linux.dev>; Mon, 21 Nov 2022 20:13:50 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id 130so12327088pfu.8
        for <chrome-platform@lists.linux.dev>; Mon, 21 Nov 2022 12:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rq8a2hBX27gcIVHpejpVIZL+hRyBNLYkb+s20L9WV6w=;
        b=SqLgfLqLWXgmjXhNGZIU6mAMHlKkjWNnbCRUg8OpME4ixk3GEFZq7BLXUUt/sx7273
         Nyn6a1zF1thpfbom4ap6EMprRGQurZhAatGX3dXHNO7toAEL3nX138lfDoG5XWZeQdSb
         HvfdpU8SAyxIFn8FvQ/ZGAFJM1tWhTDOEZ2SA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rq8a2hBX27gcIVHpejpVIZL+hRyBNLYkb+s20L9WV6w=;
        b=z9nUhWplxW8zCoGTbUylhYl0PUb2VpFcvYexd6oYaOLCOY6L1+//RZBC6+Yhjx0EKn
         cXMlJwHmrSeGvTZfbCgHDkjc/PsmvgZNiz0rB8mLmK5HM+t/4wzCKzP4opd9Qd8CNo0R
         40UCg7Gh1nprLp+FhaGQxnAluJMnizxHIkDvY4ELlaNUaumnwDC7P6FYKUyE5Wv01nDL
         xsImFAijv/4RBENjlG3iWgLUC8nDYl6vqrblwEsXW/QfUpF5Jic/r3kCi7wC1o02wp3r
         3UZ7GAcjXFodLOBNy23EJ+pQalE1abMEPMXTZ4eRlnIS2Bxgk8krTuZb5oo/RrlCGy59
         b97Q==
X-Gm-Message-State: ANoB5pmTtjsflwqu4BLWszWAWEbnnuuslAsZ5dB3otGSomhDjI3U64Nw
	PeTiw/WDv9S7il1bcvAlEoVfoQ==
X-Google-Smtp-Source: AA0mqf6bUyCGH1kkSoR2meAE+laA0AOnlYeMweAaTvvR9s2UP4evcKNKPPO3M1hYW+8vc2rBOaC90A==
X-Received: by 2002:aa7:9057:0:b0:573:1d31:2b78 with SMTP id n23-20020aa79057000000b005731d312b78mr2662956pfo.61.1669061630232;
        Mon, 21 Nov 2022 12:13:50 -0800 (PST)
Received: from pmalani.c.googlers.com.com (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id h8-20020a170902f70800b001822121c45asm10178507plo.28.2022.11.21.12.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 12:13:49 -0800 (PST)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH 0/2] platform/chrome: cros_ec_typec: Link PD object to partner
Date: Mon, 21 Nov 2022 20:13:34 +0000
Message-Id: <20221121201337.2772216-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a short series to link a registered USB PD object to its associated
partner device. This is helpful for userspace services (the ChromeOS Type-C
daemon, for example), to identify which Type-C peripheral a PD object belongs to,
when a uevent for the PD object arrives.

The first patch adds a helper to the Type-C class code to access the device struct
for a partner. The second patch uses that helper to set the parent for the USB PD object
in the port driver code.

There was an earlier patch[1] to solve this issue, but it's been jettisoned (on advice from
GregKH) in favor of the current approach.

[1] https://lore.kernel.org/linux-usb/Y3vNZEuNI3CWzZ0L@chromium.org/T/#m7521020f64d878313d7dd79903ec0e9421aa8737

Series submission suggestions (if the approach is OK):
- Patch 1 goes throug the USB tree and Patch 2 goes in the next release cycle
  through the chrome-platform tree.
- Patch 1 and 2 both go through the USB tree.


Prashant Malani (2):
  usb: typec: Add helper to get partner device struct
  platform/chrome: cros_ec_typec: Set parent of partner PD object

 drivers/platform/chrome/cros_ec_typec.c |  2 +-
 drivers/usb/typec/class.c               | 13 +++++++++++++
 include/linux/usb/typec.h               |  2 ++
 3 files changed, 16 insertions(+), 1 deletion(-)

-- 
2.38.1.584.g0f3c55d4c2-goog

