Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2CB4962E
	for <chrome-platform@lists.linux.dev>; Mon, 16 Sep 2024 11:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726484460; cv=none; b=qpAaxkJgU97HfTgoL8KB9dVfN+6WAzkfKKct1JXhoSZpidzyj6Yjb9nkUfNjt1PbT4KRZovcc3HVoARrp20z6dpAbMJyCgSjUZRQYjTjGVcULQ1ZOEhAnVZOdR7DJEz5W+P5qN9K0ozMQuDer3SvJXPO1nm4nMzG0E1kQIsLFTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726484460; c=relaxed/simple;
	bh=uPAoAp3jdhLurNPHVpZWvvplChtReKJvXxSCc+SLpr0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UBkm+FVg/DadmPkyiWfE3DQx0RoaMw64hj+njS3xM2KJTZvx4GiOsqUNVBMHK2/gAN73whePOHCh65dEpncLvSHj7L7njVriqN18WZorlM9+02qa3iMtCigdG0G314o2VFBI6zjn1UycuwNq3YVjnetDPbtXCtt8oxHYeC59Yzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NA9c8Nyz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NA9c8Nyz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726484456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6WU8wjEM5waBEtcNYw4l2YQcbb7TE6+vCphAyrZI7KM=;
	b=NA9c8NyzgZ29VrCooOFlbgfpwj75okR2bpowrxuLbrHmHIov/FuBr9+TR2aviz/+wX6e48
	IAag+zSrVk9NeMFEWNXVeCvAcnI/0IVvRVKw9VR0u/YL2a4MuzyF4ItOSn+6j3w3WslmR1
	ZE2yKSEErJGC5CpqPA2Kh6tLVzRT/NM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-ipHbBA4WMMyiWt02zKwo2Q-1; Mon, 16 Sep 2024 07:00:55 -0400
X-MC-Unique: ipHbBA4WMMyiWt02zKwo2Q-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42cb5f6708aso19004935e9.2
        for <chrome-platform@lists.linux.dev>; Mon, 16 Sep 2024 04:00:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726484454; x=1727089254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6WU8wjEM5waBEtcNYw4l2YQcbb7TE6+vCphAyrZI7KM=;
        b=XI0rcnn0a57wpw7GQyQwcequkEb2Cc61hTHQPpWw51c4S2FPHIzQpMD/GjLmbmDZG7
         e++soVzsS6nFjCjP+ZQ1rYVxvrOalth1s1rRfUGkMm3Aua3TUBzr1VEN/G9lNClNplBR
         F31uxA4c1SwnAYksRT4IapaHvRtVNMNsSzUyk31/RJwY1qzWQsLDveLxO7eA6lcWORGf
         bEr5QciLAkTlB4MW0Voe/7V+/3QMpZTr0P4M0TYdmE3Y3CwK/4sl64dbcffTrBGjYjOA
         o5Q6gDzS4R/28qVp1aIZHM78t3PeApt9+o3ybRgdQ1ZEqK4uSrJwrsmLYEqDLOoQHWoc
         adFg==
X-Forwarded-Encrypted: i=1; AJvYcCVnvQkUNbXnLNHjCD9fJXDz0OvysO7E0wsnPxWV9FW7XlGXg5oj3Ck4eil0wA3cSYc3O7G/cx/o6VA2ir1ke74=@lists.linux.dev
X-Gm-Message-State: AOJu0YyLwewUN69MRlrt+ruPLsOa0lQ54MFQgGY4EuuUFivwdqt1vJRP
	+ifEoy0CSIvdfa8rVuxo1hAMnDqJI/qShQN/Fmr+So8Zzv933j/LvupAyhUpJft7AanKN5pU3ww
	wPWlzzad2w4LI3bDP5kgVOiPTPN0dyDyoZg3HqxD8zhKzpkUb7SlYiiTfGBSX5pGfaQ==
X-Received: by 2002:a5d:5f56:0:b0:374:ca16:e09b with SMTP id ffacd0b85a97d-378d61d5073mr7098338f8f.9.1726484454302;
        Mon, 16 Sep 2024 04:00:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHL0bDYkRLWR54cWHoQ6srXlo7gK64jJb064BDuwwm746fvy1r250h1Ko4v03+pz4HMLbwFTg==
X-Received: by 2002:a5d:5f56:0:b0:374:ca16:e09b with SMTP id ffacd0b85a97d-378d61d5073mr7098298f8f.9.1726484453789;
        Mon, 16 Sep 2024 04:00:53 -0700 (PDT)
Received: from localhost ([195.166.127.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42da24274dfsm74035955e9.45.2024.09.16.04.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 04:00:53 -0700 (PDT)
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
	Alex Deucher <alexander.deucher@amd.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Helge Deller <deller@gmx.de>,
	Jani Nikula <jani.nikula@intel.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH v4 0/2] firmware: Avoid coreboot and sysfb to register a pdev for same framebuffer
Date: Mon, 16 Sep 2024 13:00:24 +0200
Message-ID: <20240916110040.1688511-1-javierm@redhat.com>
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

Hello,

This is v4 of a fix to prevent both coreboot and sysfb drivers to register
a platform device to setup a system framebuffer. It has been converted to
a series since contains changes for both drivers, to prevent build issues
on architectures that don't define a global struct screen_info.

Patch #1 adds a sysfb_handles_screen_info() helper that can be used by
drivers to check whether sysfb can use the data set in screen_info or not.

Patch #2 makes the framebuffer_coreboot driver to use that helper to know
if has to setup the system framebuffer or delegate that action to sysfb.

I haven't dropped the collected tags from patch #2 due the logic being
basically the same than in v3.

The patches have only been compiled tested because I don't have access to
a coreboot machine. Please let me know if you plan to merge both patches
through the chrome-platforms tree or if you prefer to get merged through
the drm-misc tree.

Best regards,
Javier

Changes in v4:
- New patch to add sysfb_handles_screen_info() helper (Thomas Zimmermann).
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

Javier Martinez Canillas (2):
  firmware: sysfb: Add a sysfb_handles_screen_info() helper function
  firmware: coreboot: Don't register a pdev if screen_info data is
    present

 .../firmware/google/framebuffer-coreboot.c    | 14 ++++++++++++++
 drivers/firmware/sysfb.c                      | 19 +++++++++++++++++++
 include/linux/sysfb.h                         |  7 +++++++
 3 files changed, 40 insertions(+)

-- 
2.46.0

