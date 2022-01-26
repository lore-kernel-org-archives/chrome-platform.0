Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381683FCE
	for <chrome-platform@lists.linux.dev>; Wed, 26 Jan 2022 22:22:41 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id z131so561867pgz.12
        for <chrome-platform@lists.linux.dev>; Wed, 26 Jan 2022 14:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bRwhL1NPkbRdnv8DYdCIqNEvEwK08/NeYumLy6TnqFI=;
        b=GejB6uj8tAaqSUfWeYhJQ+YhhcQNMDVdWsrOd2KteNyszjDIibMmICgjVI0tdBPxHz
         W4319Cq/TmYyRMjmyFBDFy8GN+9fEUgRxp8ajlWuiyP6fbZXz0LXqfFb5IBJq0MBvUbG
         8sn4/8QYotyzcMZ1n/fJpCUXayvrrwsnEwnOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bRwhL1NPkbRdnv8DYdCIqNEvEwK08/NeYumLy6TnqFI=;
        b=tay9PZ7+TW4LOmGmYXHlBdD49MHg1SXbEwRn35LIU8UTcarBvOYj4JESEQjjM6YuGu
         fZxHqUjyxZTJL55Jj9cDa6TGjC7ZyYXOCrZQ9DNYbgAhFCWB9plqSabxKeEpknjk10BS
         miRP12z2WHOjuGko+a88gK4EEQytgDBiD7tssU181zlu38L4VathkL1gXT2Fm+tz1jz/
         mSMgfany7CxK8D9BOvapcmmvOX/djvr9lFr9ugqRMGHc5poVm3soMlx8g3FIONGMRYYu
         Wr1hd+A7VgkYIcRQZMHcZUfOgH3IfgFuSpPHEGg3MYdg3QFYWzXwFkoqyHcUKns4IpqI
         bwWw==
X-Gm-Message-State: AOAM530OZzuIHBwm8dg1F7pl/qxt8InWcXCcPeUoxRePQMpZd9fU2UjQ
	9FeXByS4zHZp7PGpWAWIppUyMPxwly4WrQ==
X-Google-Smtp-Source: ABdhPJwW4gtXLi7FUbmqmsJLyKkC4nxO8knlYkooSPKifiMgPCNpALVd5g3uaIeh6lNY73omJA+5ow==
X-Received: by 2002:a63:8bc4:: with SMTP id j187mr683449pge.536.1643235760574;
        Wed, 26 Jan 2022 14:22:40 -0800 (PST)
Received: from bleung.mtv.corp.google.com ([2620:15c:202:201:7499:b258:18ee:819f])
        by smtp.gmail.com with ESMTPSA id q16sm3020769pfu.194.2022.01.26.14.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 14:22:40 -0800 (PST)
From: Benson Leung <bleung@chromium.org>
To: chrome-platform@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	bleung@google.com,
	bleung@chromium.org,
	pmalani@chromium.org
Subject: [PATCH] MAINTAINERS: platform-chrome: Add new chrome-platform@lists.linux.dev list
Date: Wed, 26 Jan 2022 14:22:33 -0800
Message-Id: <20220126222233.2852280-1-bleung@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Benson Leung <bleung@chromium.org>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ea3e6c914384..cad7b0fff9f4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4537,6 +4537,7 @@ F:	drivers/input/touchscreen/chipone_icn8505.c
 
 CHROME HARDWARE PLATFORM SUPPORT
 M:	Benson Leung <bleung@chromium.org>
+L:	chrome-platform@lists.linux.dev
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
 F:	drivers/platform/chrome/
@@ -4544,6 +4545,7 @@ F:	drivers/platform/chrome/
 CHROMEOS EC CODEC DRIVER
 M:	Cheng-Yi Chiang <cychiang@chromium.org>
 R:	Guenter Roeck <groeck@chromium.org>
+L:	chrome-platform@lists.linux.dev
 S:	Maintained
 F:	Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
 F:	sound/soc/codecs/cros_ec_codec.*
@@ -4551,6 +4553,7 @@ F:	sound/soc/codecs/cros_ec_codec.*
 CHROMEOS EC SUBDRIVERS
 M:	Benson Leung <bleung@chromium.org>
 R:	Guenter Roeck <groeck@chromium.org>
+L:	chrome-platform@lists.linux.dev
 S:	Maintained
 F:	drivers/power/supply/cros_usbpd-charger.c
 N:	cros_ec
@@ -4558,11 +4561,13 @@ N:	cros-ec
 
 CHROMEOS EC USB TYPE-C DRIVER
 M:	Prashant Malani <pmalani@chromium.org>
+L:	chrome-platform@lists.linux.dev
 S:	Maintained
 F:	drivers/platform/chrome/cros_ec_typec.c
 
 CHROMEOS EC USB PD NOTIFY DRIVER
 M:	Prashant Malani <pmalani@chromium.org>
+L:	chrome-platform@lists.linux.dev
 S:	Maintained
 F:	drivers/platform/chrome/cros_usbpd_notify.c
 F:	include/linux/platform_data/cros_usbpd_notify.h
-- 
2.35.0.rc0.227.g00780c9af4-goog

