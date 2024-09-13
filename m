Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6307154BEA
	for <chrome-platform@lists.linux.dev>; Fri, 13 Sep 2024 21:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726263177; cv=none; b=mXUioddSFz3E5GQun6snVcW73n7B3IT/xdDn0SS3gKh9mbzbZtvZRn8LFZn1poVFRbekmY9zLrgvieAfJM5FIP9QGalcoTyyFXju/15qr/yQoeOwsbI4ZrZV+6QchwAbGyrxhfUE8fDBqL4bGQ1r2o9ZHBtLZuIKOIKpmRHGdpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726263177; c=relaxed/simple;
	bh=4UwXVn3VjGHTV9K0yYJ+/4sQY1rIjdE/3NLygsvBHHc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EFSTP0QAw7CChz1T7jWE2+hFDbFCpFqjaFWQ6fhz5v8AphjfBahOqFkpK3SWuKki8beQPQC/IJxrC2jINa1bppZGLYZTrrVdkCJl7KqHtn7EwpRemRVrp/Xa6aLOrS7O/hdTa7I7fQiufGaoEpFB7mytYrALbGk9nLz9vNwuHEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ffb41vkI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ffb41vkI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726263174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zq/XGfhuxnu2xqsl1VfuSOlwQfCDeWHk07eSBLjaxgY=;
	b=ffb41vkI/wFdwPy1rzUEHi8MGKIXb+XI0XwWXLR4Vn5z6U7KdHJ8T6uhWHztDr2e/mefv0
	YMTDtovNIwWRn9Mo45Q988zjxVHzLBEB/d+NJDveHSqvOCaE6z6j710C0K0lgm+a+7Njie
	NO3xF6cwwnUftu7ii6r9hMHMWJuswBE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-T3hz0yUNN3-W-PAY_kN9cw-1; Fri, 13 Sep 2024 17:32:53 -0400
X-MC-Unique: T3hz0yUNN3-W-PAY_kN9cw-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-374c434b952so579450f8f.1
        for <chrome-platform@lists.linux.dev>; Fri, 13 Sep 2024 14:32:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726263172; x=1726867972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zq/XGfhuxnu2xqsl1VfuSOlwQfCDeWHk07eSBLjaxgY=;
        b=do2b/pYhjBVebr16jxhBpMVPyRYZMIE8KmXBrpYgqRRtJAAO1A13cVS7fWQ1+cXYQU
         oaJ10AY29rjyDYz4RqAhP1khxcY6/6e/DdVpis0iLHdxY/gQZDRoLU9M5Ui3vQWy8aOf
         F05k0+HPT6+K8/7VTDRhIr/P6jufbQJHJi0SkWrnlCgEtloTjh0oh0PY83rK6+Vn+dBe
         ShE+fkkc7L5OOSl0b11hWQpMLsa8c9WXNHnh9OUTxXJJMdfSFzhJi796Y+JZn5vVxSwo
         9cPTdoQtiSPrqtj6+QqG+VBQ/doBrEjM136nYEp2h/Lsp1n+BJuE5LiGK2Qgfs4bYdVE
         cGOg==
X-Forwarded-Encrypted: i=1; AJvYcCVdzxLO5P7JjjckSSDZU4oNQ6mvK8As4Vwgp4QKwPwGrnrLRkfHDciZD4kjvYYFQhZWKBA89AdLWxGESndJodk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzLxMT9Bw9IDl8Ed4hhLGCZpOA922IaAIG0xwTAK/Ukq6LsZIs8
	qaqxRAu+k4lEqnf24dflC1FpC0FS9Zmj+OfEcw0H9kXMHa6ucFc6P2qK0aBJou9BuRktZ0Fl9NR
	p78x/hg9qbewTo/Buazvbsfiwb21f3qmHaufjy+ShWXxakdOylAVIJQqnDpGQs4c3tw==
X-Received: by 2002:a5d:4388:0:b0:368:5b0c:7d34 with SMTP id ffacd0b85a97d-378d61e2c14mr2554797f8f.22.1726263172214;
        Fri, 13 Sep 2024 14:32:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEyVfX5FD6HqnGhKNhramC2RAHdl6F32DVAZO0vkVjMaGBuk7aa+lbQRZkWnexB34MoaO9XQ==
X-Received: by 2002:a5d:4388:0:b0:368:5b0c:7d34 with SMTP id ffacd0b85a97d-378d61e2c14mr2554779f8f.22.1726263171717;
        Fri, 13 Sep 2024 14:32:51 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cc01a8ee7sm142234035e9.0.2024.09.13.14.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 14:32:51 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Julius Werner <jwerner@chromium.org>,
	Hugues Bruant <hugues.bruant@gmail.com>,
	intel-gfx@lists.freedesktop.org,
	Brian Norris <briannorris@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	Borislav Petkov <bp@alien8.de>,
	chrome-platform@lists.linux.dev,
	Javier Martinez Canillas <javierm@redhat.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH v3] firmware: coreboot: Don't register a pdev if screen_info data is present
Date: Fri, 13 Sep 2024 23:32:29 +0200
Message-ID: <20240913213246.1549213-1-javierm@redhat.com>
X-Mailer: git-send-email 2.46.0
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

Changes in v3:
- Fix coreboot spelling to be all in lowercase (Julius Werner).

Changes in v2:
- Declare the struct screen_info as constant variable (Thomas Zimmermann).
- Use screen_info_video_type() instead of checking the screen_info video
  types directly (Thomas Zimmermann).
- Fix missing "device" word in a comment (Brian Norris).
- Fix some mispellings in a comment (Brian Norris).
- Change error code returned from -EINVAL to -ENODEV (Brian Norris).

 drivers/firmware/google/framebuffer-coreboot.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/firmware/google/framebuffer-coreboot.c b/drivers/firmware/google/framebuffer-coreboot.c
index daadd71d8ddd..f722292e7684 100644
--- a/drivers/firmware/google/framebuffer-coreboot.c
+++ b/drivers/firmware/google/framebuffer-coreboot.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/platform_data/simplefb.h>
 #include <linux/platform_device.h>
+#include <linux/screen_info.h>
 
 #include "coreboot_table.h"
 
@@ -27,8 +28,10 @@ static int framebuffer_probe(struct coreboot_device *dev)
 	int i;
 	u32 length;
 	struct lb_framebuffer *fb = &dev->framebuffer;
+	const struct screen_info *si = &screen_info;
 	struct platform_device *pdev;
 	struct resource res;
+	unsigned int type;
 	struct simplefb_platform_data pdata = {
 		.width = fb->x_resolution,
 		.height = fb->y_resolution,
@@ -36,6 +39,20 @@ static int framebuffer_probe(struct coreboot_device *dev)
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
+	type = screen_info_video_type(si);
+	if (type)
+		return -ENODEV;
+
 	if (!fb->physical_address)
 		return -ENODEV;
 
-- 
2.46.0

