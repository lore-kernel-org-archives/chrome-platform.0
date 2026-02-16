Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B27B2FFDD5
	for <chrome-platform@lists.linux.dev>; Mon, 16 Feb 2026 10:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771237535; cv=none; b=hzo09HfHitT29EK+KE0XPq+SL4AhPbCqD2qZqrvHyOaWdWrNYwKr2Cf/bGvAu7BqDJoWO+eGtXqpdF+aViGboMjqnj66EEa8QGNuByXBkOr+QUHt6vYW3VOv7pf9ywi6JXiZcXYMDrBXFUEwPAZ+R0R9R3ukCrZPp/Ktbh8DnvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771237535; c=relaxed/simple;
	bh=d8Viq65c3Tbe2umtsyi0kD+iC6Naf9TsV8lvDE1zvJs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=l0aJ0sEvMvQ+fvon3GMTeIUnr4AYl8NaPRgcQ0LoPx6EZxCAjBRG4NqgqCqzMXJDB4kULcQ2nhT3/++IIlptwwxH6sX0QznSCFUq34R6zQw32bV+9Y13WQaDofyL2r/mfN2U15OiBjwcvcqxRuaYXmCobp9F5hpOQ989U3gut0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Elgdwj62; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Elgdwj62"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771237532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qkkyUWFiOiR4ybl48uLvGZuH0EeXWDQWG9ZNGd0RJ4M=;
	b=Elgdwj6253W7LCzdQRjdf8YU+qqThcotLwhq119EgRI2wzmO5/mBEhAZUomdVNBocayTq7
	yxaRCnVX+/6HfRNAHRp87qLgHItS1iwRXzU4sHMfHhzr3WKXJQsXM2D6hE2hNksGXEwkCc
	4kB1dSoQqiQ8I0j4D1qV3PEUNB01QT0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-so7cRHPTNeK7is69Ea1AQg-1; Mon, 16 Feb 2026 05:25:31 -0500
X-MC-Unique: so7cRHPTNeK7is69Ea1AQg-1
X-Mimecast-MFC-AGG-ID: so7cRHPTNeK7is69Ea1AQg_1771237530
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4836cc0b38eso19681445e9.2
        for <chrome-platform@lists.linux.dev>; Mon, 16 Feb 2026 02:25:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771237530; x=1771842330;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qkkyUWFiOiR4ybl48uLvGZuH0EeXWDQWG9ZNGd0RJ4M=;
        b=NxZ7mhKHdaNX4lqWsykBGw2Js0Rkp49j7RRPFEi48toCW8WlTMmY+FvKSDDqm0p9d2
         unNsIFUAyInUzSNySCPCvy9E4ypOwRD4puk0T6oTQZalBGhnpM7O7J8fQm/psSOxDWQo
         eC8bq1qnTOG8Ng9UcqrQCl0id1VbH5JUfUCK49papt8VKDgmm/wrrj42cjAmU0iu7fUs
         htWEXbMTcuLk3i9lHgbD2jj1dwGFt/7SRujNHu4s4mJR32lmLgr+FfoUGfGXX8xjXP7J
         Ug2NGuRH/b+YMG/b03leRsxd3rzgf6ZZ55+1mrN4L3qD0RciiZ2tg739Kl4ltKglQYYf
         3gQA==
X-Gm-Message-State: AOJu0Yye8w9MHO6qIbAvYvfkvHpsrz6vf+HvkMMAg+AracE9ulqcJdHs
	LreIXi2MylwRINSha+iREDqYmmD4OabZsZqTTkAaD5omI7qjZ71BD8e7sHu2+UGiXoDGvmkwI0f
	VFs8CfILjVUoHWLhYE58FEheIx9NFk+BoXViWkFforusZKWYlYlvISNkxRo7BYiq3Sd4szg==
X-Gm-Gg: AZuq6aL7S6KCZU5P3YQAuVNLj3+Fia15LtAdfMlEwGdARM8ptpFuGwbYKEuLM83ddmd
	HgihoBif1wwEvJ0cpzVyqa9jIV0Qw2yXsiBPrv84hSESh5jCgIPYSAM47wQkVlrdGiyigy4cPHu
	/96gYwZRXTlDNIBS+201TmG1tRqA1sqjZjHVGW+FZ86UkbDCJftIDt3x74fjfoWzwQprmCRvZHT
	fXu2rdH0t/aCzi7krAs3HujvwFogpGaGDyJL692GeA3wJha7LBRVqcs/ooP+Tct051ArHG48tta
	2aWMSOX40Q8pe+LvVbVJcBZ4F4aEBAPN7R819zuTusqgDOxGdwXkAupy3dAM9JLpPyhEtCgjYAJ
	scMXNr3bv3aOa66SHr2wUKESKAiHSfKxqUD26ysygKhwMLUyAZIn39YJcdtzLTAvmE17T49BX/I
	QcbSJb
X-Received: by 2002:a05:600c:34c3:b0:483:3d42:d04f with SMTP id 5b1f17b1804b1-48373a7b7bcmr166696615e9.37.1771237529671;
        Mon, 16 Feb 2026 02:25:29 -0800 (PST)
X-Received: by 2002:a05:600c:34c3:b0:483:3d42:d04f with SMTP id 5b1f17b1804b1-48373a7b7bcmr166696295e9.37.1771237529230;
        Mon, 16 Feb 2026 02:25:29 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48370a5ca56sm117723755e9.3.2026.02.16.02.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 02:25:27 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, tzungbi@kernel.org,
 briannorris@chromium.org, jwerner@chromium.org, samuel@sholland.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 11/12] drm/sysfb: corebootdrm: Add DRM driver for
 coreboot framebuffers
In-Reply-To: <20260203135519.417931-12-tzimmermann@suse.de>
References: <20260203135519.417931-1-tzimmermann@suse.de>
 <20260203135519.417931-12-tzimmermann@suse.de>
Date: Mon, 16 Feb 2026 11:25:26 +0100
Message-ID: <87ecml6l49.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: abbsSS9loaR6JXPoirKQfFcRGk8It1tfSqMngA4gs2E_1771237530
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Add corebootdrm, a DRM driver for coreboot framebuffers. The driver
> supports a pre-initialized framebuffer with various packed RGB formats.
> The driver code is fairly small and uses the same logic as the other
> sysfb drivers. Most of the implementation comes from existing sysfb
> helpers.
>
> Until now, coreboot relied on simpledrm or simplefb for boot-up graphics
> output. Initialize the platform device for corebootdrm in the same place
> in framebuffer_probe(). With a later commit, the simple-framebuffer should
> be removed.
>
> v3:
> - comment on _HAS_LFB semantics (Tzung-Bi)
> - fix typo in commit description (Tzung-Bi)
> - comment on simple-framebuffer being obsolete for coreboot
> v2:
> - reimplement as platform driver
> - limit resources and mappings to known framebuffer memory; no
>   page alignment
> - create corebootdrm device from coreboot framebuffer code
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Julius Werner <jwerner@chromium.org>
> ---

The driver looks good to me. I couldn't spot anything wrong on it.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

