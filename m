Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA2B155725
	for <chrome-platform@lists.linux.dev>; Mon, 16 Sep 2024 11:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726484464; cv=none; b=T9YLcoT+iJ8CgpMbEDRdXODVN2kNCwfFL1kf4CeQVf3auU8aDZ58+aHK78KpQcGGFt0swsChpq9TXINul8FGaSe4G3X/iHu1J5ozdtgaen2VTB3RHPxMM7oOYyPoLw8MJ2aLMHfX8cxvnnYKMEVwrsb0/vhK/Tsazf51KC/T9kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726484464; c=relaxed/simple;
	bh=mxagBuP3eu3IAKCLOLfRcfBz9gvaoYDB9uCXJ+9hXkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ImFrfr2awc7Zr90+4Kwhc/eSJgkmlnmqI0HSx09pmyBWE0RoTFyFkYRR/H/4CmMLayAz+qhPkB5b4tWFnbPg2XZG0Qg0us7+0pzO7D6Kbo5FqBbX4rTUadj6nKyY2DpVtXQdcwlIaMvP7SgQEOTuh/xmdbVUrMuAcCf7SF7MNoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dAGpzON8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dAGpzON8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726484462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eEjIF7qtpeO5gdAg8m1MkAHfmOzMzhqhggl+Nd1IK9g=;
	b=dAGpzON8Q5kaPH8cE/rPoBS2sY72pwINs5CcovcngEJlYtnS/qU7H1DpdZ2DF5o/fkAtrW
	XZCQ/iAIkNtRbq/RtXNNfvcWVaq5TiImUWfvKesRVW8/sWe3FVm0gLzmkTRMd062JJ2ybX
	2iaHNRw83PkP19mCbxor63itQ2Yh/fQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-yaflcvgHPFGrlU77zKBFaw-1; Mon, 16 Sep 2024 07:00:59 -0400
X-MC-Unique: yaflcvgHPFGrlU77zKBFaw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42cb89fbb8cso27763775e9.0
        for <chrome-platform@lists.linux.dev>; Mon, 16 Sep 2024 04:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726484458; x=1727089258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eEjIF7qtpeO5gdAg8m1MkAHfmOzMzhqhggl+Nd1IK9g=;
        b=XwvZHdWdCJKDQiO6c5gXGLDoF+D112o2OJr0VutkpoIFNMngxTq4GNTfa3yrclVGGP
         hT9vCYoknKZ1zgYrSnGbF7atsVpiCdyMs9DSRhJD38NN8VCnCZ7ONIS/Z87QEza4G5L7
         GRO+HMTaqoIpnqHdmOQqOYBM9zOeRQOJwRQaLc8tMQWlhIQan9aSnALb7TVMSC5RVJc2
         mzYIhIAKXSYHztxhz6NfuolhyFIuqyorZeo6LBsLuS18Ku/V+kdeqIgBP0Ay8UlJ+lwO
         h3ee5/Y4FfLl2SgotU/Qbf1yePuanKMTaoNleIcGVnUdYBACiHDmM6nA47fgX0JhypzZ
         5pRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpwnfSrnJ4i4AQ6fDZB1iuP4zY5lG6hL0fB2OIqJS2mwH0oky3SRifM1F0dh4lFcbTVPF5PhnJjgZ6AvpM3yg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzWEgZzX7bDmsuDeLdefZIk3MvhgUxhSnuFp2K2dA1Gs0zcJDUw
	PvKf/LuFF0OsgqdZtHwLizyucjrbPZNgRF8foVkO8R2r0c32+L6TCn08Y4/M6Zc0o5O8EZrMp7G
	4Cyp78RBWUEA+4wAldcCUZzeIh7Jq4cp4aK8gvAIsnjH1Z3BT/i0GVjZBOD1+kvgCYw==
X-Received: by 2002:a05:600c:21d1:b0:42c:de2f:da27 with SMTP id 5b1f17b1804b1-42cde2fdb54mr105453535e9.2.1726484457613;
        Mon, 16 Sep 2024 04:00:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuoN48esuPwjXdzhGeiLsvhSvLtwnfWmyh0YiWdZ01XdL7xeFl8Crpz10A2XtyhhYWXONvEQ==
X-Received: by 2002:a05:600c:21d1:b0:42c:de2f:da27 with SMTP id 5b1f17b1804b1-42cde2fdb54mr105453355e9.2.1726484457174;
        Mon, 16 Sep 2024 04:00:57 -0700 (PDT)
Received: from localhost ([195.166.127.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cc137556esm200901665e9.1.2024.09.16.04.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 04:00:56 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Brian Norris <briannorris@chromium.org>,
	dri-devel@lists.freedesktop.org,
	Borislav Petkov <bp@alien8.de>,
	Julius Werner <jwerner@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	chrome-platform@lists.linux.dev,
	intel-gfx@lists.freedesktop.org,
	Hugues Bruant <hugues.bruant@gmail.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH v4 2/2] firmware: coreboot: Don't register a pdev if screen_info data is present
Date: Mon, 16 Sep 2024 13:00:26 +0200
Message-ID: <20240916110040.1688511-3-javierm@redhat.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240916110040.1688511-1-javierm@redhat.com>
References: <20240916110040.1688511-1-javierm@redhat.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

On coreboot platforms, a system framebuffer may be provided to the Linux
kernel by filling a LB_TAG_FRAMEBUFFER entry in the coreboot table. But
a coreboot payload (e.g: SeaBIOS) could also provide its own framebuffer
information to the Linux kernel.

If that's the case, arch x86 boot code will fill the global screen_info
data and this used by the Generic System Framebuffers (sysfb) framework,
to register a platform device with pdata about the system's framebuffer.

But later, the framebuffer_coreboot driver will try to do the same and
attempt to register a "simple-framebuffer" platform device (using the
information from the coreboot table), which will lead to an error due a
device with the same name already being registered:

    sysfs: cannot create duplicate filename '/bus/platform/devices/simple-framebuffer.0'
    ...
    coreboot: could not register framebuffer
    framebuffer coreboot8: probe with driver framebuffer failed with error -17

To prevent this issue, make the framebuffer_core driver to not register
a platform device if the global struct screen_info data has been filled.

Reported-by: Brian Norris <briannorris@chromium.org>
Closes: https://lore.kernel.org/all/ZuCG-DggNThuF4pj@b20ea791c01f/T/#ma7fb65acbc1a56042258adac910992bb225a20d2
Suggested-by: Julius Werner <jwerner@chromium.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Brian Norris <briannorris@chromium.org>
Reviewed-by: Julius Werner <jwerner@chromium.org>
---

Changes in v4:
- Use a sysfb_handles_screen_info() helper instead of screen_info_video_type()
  to fix build errors on platforms that don't define a struct screen_info
  (Thomas Zimmermann).

Changes in v3:
- Fix coreboot spelling to be all in lowercase (Julius Werner).

Changes in v2:
- Declare the struct screen_info as constant variable (Thomas Zimmermann).
- Use screen_info_video_type() instead of checking the screen_info video
  types directly (Thomas Zimmermann).
- Fix missing "device" word in a comment (Brian Norris).
- Fix some mispellings in a comment (Brian Norris).
- Change error code returned from -EINVAL to -ENODEV (Brian Norris).

 drivers/firmware/google/framebuffer-coreboot.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/firmware/google/framebuffer-coreboot.c b/drivers/firmware/google/framebuffer-coreboot.c
index daadd71d8ddd..c68c9f56370f 100644
--- a/drivers/firmware/google/framebuffer-coreboot.c
+++ b/drivers/firmware/google/framebuffer-coreboot.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/platform_data/simplefb.h>
 #include <linux/platform_device.h>
+#include <linux/sysfb.h>
 
 #include "coreboot_table.h"
 
@@ -36,6 +37,19 @@ static int framebuffer_probe(struct coreboot_device *dev)
 		.format = NULL,
 	};
 
+	/*
+	 * On coreboot systems, the advertised LB_TAG_FRAMEBUFFER entry
+	 * in the coreboot table should only be used if the payload did
+	 * not pass a framebuffer information to the Linux kernel.
+	 *
+	 * If the global screen_info data has been filled, the Generic
+	 * System Framebuffers (sysfb) will already register a platform
+	 * device and pass that screen_info as platform_data to a driver
+	 * that can scan-out using the system provided framebuffer.
+	 */
+	if (sysfb_handles_screen_info())
+		return -ENODEV;
+
 	if (!fb->physical_address)
 		return -ENODEV;
 
-- 
2.46.0

