Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4443E1C15
	for <chrome-platform@lists.linux.dev>; Tue, 22 Nov 2022 22:06:01 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id k2-20020a17090a4c8200b002187cce2f92so171423pjh.2
        for <chrome-platform@lists.linux.dev>; Tue, 22 Nov 2022 14:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+rjcB3paNSLnVx7wDun/ydpcrulGpWbgAQ0wZgSMTwc=;
        b=fhVhrAbUQAozQOw3rZzn3le3iR2sZgNc9jsB/pGPrDYoJwzn8AYHaMHq1M+0xLzGsq
         hTBHU8jkcHaq3Vk3j7czc3Cs2VA0ymPvj+TU1OHvh2MN4WuQYe7bLhCrHM+zXJ3y8Cv/
         FrYqzZ4YnQPq6HWoFZjBz95XOxm3gK2egmPPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+rjcB3paNSLnVx7wDun/ydpcrulGpWbgAQ0wZgSMTwc=;
        b=Dfiz1/Rmax80L3e85jexlzv3DzSDO0FZEuK9KInYzRAwIGnad+Bksalukz73+UlxcG
         Iqa7cEdC34wxQVwmet0XB5LkYRZ64xBneiuyY3pl0ngh7Ak+D2DccXVsRooaADJkPQQU
         BeBg6LBLmo3HSqv7O/yZnLdpwd6zrxNWuAmekHRG1ulaGdQYafGzE8tovRApndAV8+8N
         +d1/F2u5db8E5NOX1KPK3/XTTx2Id7hW58DSy9DKMH54JFIzXuMavOodtulj5p+sW8+T
         h/FjdWZ0KrDY0YRTugxMwoyH8WrVgLT/zHfHmSHsu8EA5as5kNt6LlKxWZmk78ot4Voy
         Rtnw==
X-Gm-Message-State: ANoB5pmGFfqRKMiezamMPxBiUO4YPqDJ2UqYOio8RCOJFyyamRAmGmq6
	WEB+x/NW8Sku3ae2hu8VUwqelQ==
X-Google-Smtp-Source: AA0mqf4xYcYH7pBUiKBGUWee0mkH+YicFCSXQNr4GbtcvcjPqCUYr09kip6jpZNtWk3hN3Won6aSPA==
X-Received: by 2002:a17:902:ab08:b0:189:dc3:ee83 with SMTP id ik8-20020a170902ab0800b001890dc3ee83mr16773684plb.58.1669154760766;
        Tue, 22 Nov 2022 14:06:00 -0800 (PST)
Received: from pmalani.c.googlers.com.com (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id i24-20020a63e458000000b0042988a04bfdsm9640497pgk.9.2022.11.22.14.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 14:06:00 -0800 (PST)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH v2 0/2] platform/chrome: cros_ec_typec: Link PD object to partner
Date: Tue, 22 Nov 2022 22:05:35 +0000
Message-Id: <20221122220538.2991775-1-pmalani@chromium.org>
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

The first patch adds a wrapper to the Type-C class code to register a PD object
with a Type-C partner as its parent. The second patch uses that wrapper to
register the Type-C partner USB PD object in the port driver code.

There was an earlier patch[1] to solve this issue, but it's been jettisoned (on advice from
GregKH) in favor of the current approach.

[1] https://lore.kernel.org/linux-usb/Y3vNZEuNI3CWzZ0L@chromium.org/T/#m7521020f64d878313d7dd79903ec0e9421aa8737

Series submission suggestions (if the approach is OK):
- Patch 1 goes throug the USB tree and Patch 2 goes in the next release cycle
  through the chrome-platform tree.
- Patch 1 and 2 both go through the USB tree.

v1: https://lore.kernel.org/linux-usb/20221121201337.2772216-1-pmalani@chromium.org/

Changes since v1:
- Drop Patch 1 from v1, and instead introduce a new Patch 1 which uses the wrapper
  function suggested by Heikki Krogerus.
- Update Patch 2 to use the new wrapper.

Prashant Malani (2):
  usb: typec: Add partner PD object wrapper
  platform/chrome: cros_ec_typec: Set parent of partner PD object

 drivers/platform/chrome/cros_ec_typec.c |  2 +-
 drivers/usb/typec/class.c               | 19 +++++++++++++++++++
 include/linux/usb/typec.h               |  4 ++++
 3 files changed, 24 insertions(+), 1 deletion(-)

-- 
2.38.1.584.g0f3c55d4c2-goog

