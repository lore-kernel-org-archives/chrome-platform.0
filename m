Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB12B19CD03
	for <chrome-platform@lists.linux.dev>; Sat, 17 Jan 2026 01:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768613917; cv=pass; b=DTnKJcgH2mrxG/gKuw7y04PKDnZQfLd9uNHeCHF31qnSE0lJWQPXE8UI9ptnyFwhNl4uxyYjIe1+dkNnYLkDvTJJIpxSgipHMSE0VzrElMwUc8hlpyCYtkDyIsBUvlGx70zWNFFB8vtEkw193VNCy+bxk9gFk8wJcAgyvApD+RE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768613917; c=relaxed/simple;
	bh=Q2H6+0pE8e3uoQpkc0zERECrSC6JdDUg6MWzO/WBO/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FjY/VJI6R0kJ72chMpILAtsVRjAZp8kHRE2fWQRj/lB06IFG11x8ISFprqh7fsfJSYRqt8dfwPP4lI9sHKRDnBUwb38PCvuEg4ZWTtXH40+8uTrqzzWyG7TYKcdjDu6iGnyTRfNVx0jIGOEISVKXqAl3E1mdKhota51naxzqH3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fR2PHfXx; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fR2PHfXx"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-50299648ae9so102811cf.1
        for <chrome-platform@lists.linux.dev>; Fri, 16 Jan 2026 17:38:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768613915; cv=none;
        d=google.com; s=arc-20240605;
        b=Mq/6hjGjkT1vDH/HvWJmJkOirfCwyPzIxsrXAFqAGPbSv2e7xIhwt6oCxF6cA2yYoe
         Fg63APG8zpdmDeN6vXMxm1i6fFY02WSha5tuBWFRmyQkkTBdoI9uyYGFRaRndMhy1n5s
         OvPX68d8qk7+4rLRY8wkBTvXW5ISXanUMwpmamGVmFCCmcGDRMUiRgBwbd7orI6hbn4o
         s1eI0T9cvq0oJTL+znWhsKTQ6DX7Ed7SRUAmjNa1oaTWy/SowsgE+0+OVX5OMg8KLAhD
         fzlT++aV6QK3lR+Xwi5O/PKlievHOObzBlxA6lgTyzBfiKtMEQJoT22kDNDQZxhmKUc5
         Jlkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Q2H6+0pE8e3uoQpkc0zERECrSC6JdDUg6MWzO/WBO/A=;
        fh=bdN+jr3QAif74EO6WMeTD63MbuywjXFGtH3l1Xk9aTk=;
        b=WQx0SNmWGC8fXaXwMGlrx8Jl6ACmea56MWUmNCQ4U1LwpHYZbgMsXEuCcPvKSM6vAn
         1CpSaTYEB41qzzf8thTwxgMO7GEKBAMQZjBUHqq7SfPjjRaZ7MIK2rXgVmkiydkYacJT
         y2oKP52oXyB1Q+bSSCD9/gY7/vWd5TJPRierD0PocsIIj6CHybgIXJNCCmY2LxaZ0YA7
         8OIZRwDM6aDm+Q/49CBTLcXx9wW9xx6PmcDsjnWfkPwyl9TPvNc9ti6PqJwRKLQYrwjb
         sA3PCTii609kyudIm2483wGI82Mm5Xh7mhJmFPfmYsQ4JLu5jVspVRJpQQKFEdSzg401
         uSlg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768613915; x=1769218715; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2H6+0pE8e3uoQpkc0zERECrSC6JdDUg6MWzO/WBO/A=;
        b=fR2PHfXx41d7k5Btk6z1tLaXHqx++4wB1h1iwV/B7T6/oU6vglOhHOaKeJMZ24Svh1
         V+QrB9tkGd8hEQ/UjV+N0J6AQ7SYhH0/cS9SIxt2pqM67FC1kfiPhllEGoOnC+LmIUaS
         HzxbqWYgViqUdLfnzWOYj1cVplnR45BfAdxHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768613915; x=1769218715;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2H6+0pE8e3uoQpkc0zERECrSC6JdDUg6MWzO/WBO/A=;
        b=vuhtBvbIRwQXWrAn5Q19hjj1mW4ZAIDqirfLjVeeTVgNhvswEizKB8y5RamQgXLPMz
         BEQBxuYyoOwQkx5EmmSZNvSjgG8ZueK51vTLMCLGH/xgFOiscNd82hoGAuCFygAv+AiG
         QqXhgfZ0l0N2LoSgM+1RTGx0eAPM6RT/FTQQ+N1MsMggnus58lLMvFpHsuKwo8J/+uWH
         0Nc0wqAiEfADetN0CAcC1U7SHoo6X3W5Kc1Ys0KS577SQhZRa16svRAHVpmlfduAvF19
         zbJMr/aUkYarxDNmOnvUgD+idGk1OgXfiY2cpOw9avYzENcYBx2OkrLdLPRJ+UO1Dtew
         1uMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFpZm6OopJHQYQcvqbycdtseg40jZ8khcdUFPor8qcv4dwIc4dqfm+q3C684wCq8i1LGToLaywZ1ZFG4Dmjvc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyl+Zizq1OMSNcLaebLlJqux62i2mCPvzucPrYuJPUgQAe4eOKD
	UlAgmB475skliYQIcGo2p3B7AP76eZlcAlVo23EMguh4hdioWtZ0ABrXgDceA0VImHN8q7uvwMR
	RWJVLnY7hbHRJKjYkpDeHNPkKi1gL/NkqKW3GzkBI
X-Gm-Gg: AY/fxX7EQJLUisplSL8iXlajbRnOugaJYj3L4ZIKz/aWNBx5FK+t3gytUauYxvSkKkD
	062dZrWwDY1Ghy2/hTJ7BFJWSn+vPUWmWZCctrd9xs0Z1OJ+1teS3ob+Nf/4dHwckRe9MGLVqvz
	myqP49jAN687zpDoAsSFgAvGk4Xymd+rIpDIRyIjmgzXZJGKC8I88XeSKgKwmbBDJ/ZhOe8SbG8
	iUB3dScJtMH2hWDuqeiWAGcnNNvOWI6Cqdt914vSrgG9UJTswJbtJPpByJ6jlBISbpe
X-Received: by 2002:a05:622a:1814:b0:4ed:70d6:6618 with SMTP id
 d75a77b69052e-502afa0309emr3897331cf.10.1768613914449; Fri, 16 Jan 2026
 17:38:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260115082128.12460-1-tzimmermann@suse.de> <20260115082128.12460-6-tzimmermann@suse.de>
 <CAODwPW_n=LfW+az4v8XecrzAksFmP+0U-9ELb_TrVtLL4EGk9w@mail.gmail.com> <fcc432e7-308b-4d8f-8c26-355409f1bd94@suse.de>
In-Reply-To: <fcc432e7-308b-4d8f-8c26-355409f1bd94@suse.de>
From: Julius Werner <jwerner@chromium.org>
Date: Fri, 16 Jan 2026 17:38:21 -0800
X-Gm-Features: AZwV_QhDDCK-DGc4x628xsP0tH7-ZhZPoyw46AeE0cQf_kwRGLLjJJb8oiibhxw
Message-ID: <CAODwPW-8MP2Ps8J6DV7K3CeTMGC_HFyb32P3Tj6__nZ5w3nxCQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] firmware: google: framebuffer: Fix dependencies
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Julius Werner <jwerner@chromium.org>, tzungbi@kernel.org, briannorris@chromium.org, 
	javierm@redhat.com, samuel@sholland.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
	chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

> Corebootdrm already depends on the CONFIG_GOOGLE_FRAMEBUFFER, which is
> standard behavior for all kernel drivers (i.e., drivers depending on
> architectural options). Having dependencies in the other direction
> creates a circular dependency, which Kconfig doesn't handle.

Yes, okay, I think that makes sense. I thought `DRM_SIMPLEDRM` was
some sort of more general option that the DRM subsystem is enabled,
but I guess it was just the driver that you now replaced with
DRM_COREBOOTDRM, and I understand that you can't have a circular
dependency there.

> But
> generally speaking, what's the point of having that framebuffer backend
> code then? I tried to remove it, but it is supposed to remain. But it
> would not serve a purpose other than creating the platform device for
> the actual driver. I'm confused about the reason for this design.

I thought the point was just to have a place to put that `if
(sysfs_handles_screen_info()) return -ENODEV;`? (That and that PCI
parent device thing you're doing where I don't really understand the
code enough to know what it's for.)

If you can put that line directly in corebootdrm_probe() instead (and
bind it directly to the coreboot bus device), then that's perfectly
fine by me too, and then you can get rid of framebuffer-coreboot.c. I
just assumed that there was some reason I don't have the expertise to
understand for why you couldn't do that.

My earlier concern here was just about not putting that line into
coreboot_table_populate(), because then you would be preventing the
creation of the sysfs node for that coreboot table entry, while all
other entries that don't have associated drivers are still there (and
that seems inconsistent).
