Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1DF22B5AD
	for <chrome-platform@lists.linux.dev>; Mon, 16 Feb 2026 10:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771237653; cv=none; b=iGU/farGiKYD09YsFd7Udsc64k4d+ov5nX7GmazQEgE16Hidd5VM7p00B8uXocN1TLo8uRGIh+/1Hz4BCo2RHUvYJOB1V87vYRn+hBcrTnOA3j/9L5jP7Eb2QkDcRtniUEjx+wlijwfDBdZasPcpIPuQFtR1R9hOt4tKmaGP6Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771237653; c=relaxed/simple;
	bh=7JgpOgwagDam1yDAgEgP9xXqPhTh6+mLYFekup3pOJE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KBfHZu2TqQbGDgLWcWrKwEg+ToOFwbxkrYOhA92pWIWZZnZCLNKFuCo12m5Y0x6HQn4Lvm06vi+uKlcurK3XzdqlONGIryAx8ZY3lYj8yBYdGo9woaz14oDgDp91McFNT1VIWcAiNPhf+82hw+/ORTB5cz8iDtUvTvh2t33cP2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QoVCZpcx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QoVCZpcx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771237651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hk8CBoYpz3dwO5PhoMkU68RAZD40pLAZOBfvpSAMLv0=;
	b=QoVCZpcxkMpHDDTySVYhoYfW9ukq81DXHgQr/qIMQI1yTkY9imYFzHZcRuiUc70WQn9PqP
	buBhLLmNY3D2G/Eq2/zClJxw4PpOXu0kbZ7E11yGpFq4NBoOxkwoDURxOxvmDIYuhD9qdl
	0aZRw97x6Tpxro3z5KfNaCb4E5Fjipk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-t7Ud2JzZPqShipm5PC6nMQ-1; Mon, 16 Feb 2026 05:27:29 -0500
X-MC-Unique: t7Ud2JzZPqShipm5PC6nMQ-1
X-Mimecast-MFC-AGG-ID: t7Ud2JzZPqShipm5PC6nMQ_1771237649
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4836c819456so37538625e9.3
        for <chrome-platform@lists.linux.dev>; Mon, 16 Feb 2026 02:27:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771237649; x=1771842449;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hk8CBoYpz3dwO5PhoMkU68RAZD40pLAZOBfvpSAMLv0=;
        b=IXLm4xh8Rlh03Jvrfd/HdFLtlH2zyw0I9SIqfZRCq89S9SwbmRt+dgjHVBOIWVZZ6K
         rmFxrU6ws/1VNxNewQiPw156Ik9Dsz2sv9xT8v/GMC9mVit0X1kuPp3mfVuq5H1DCSKM
         8mQl9iudgYWiPwx0f9gP4w+jDYC3qlxG/GWXrWyvjfuhoDvgVPaRBn7+jO07fFNUfIm6
         PSSozHeQy654EsbRfZ0sgshVNiXae+OhZ2plnMXSmlIeZ+RWAvXLsqqOGhJUn23qRGyt
         fN9SPKbBfeH3dt52dMOyjsIVmPHbnz6C3ZpyA0MkSRVNBI06+5Ran9O+KcO4jkQks/Vo
         YHPg==
X-Gm-Message-State: AOJu0YxjLTcEAVoUFHWjPDnLkOcz1SWfiqX+uudN1ONXH9PJGAX2KqS6
	gGB65fyQCIrltYV8A6M/ma1rYdUdq7opy6Vh6iMa1rxhiNLedM62qJdnWlw3R2G/lzm2B0y9rWO
	Fa7EMQPDI2sWXjgj6biIkc2asO6e4GUdW6SlIzzSv/HMH6PNB/U/RYWnHACSdp95scVuoSg==
X-Gm-Gg: AZuq6aJTl+vFHTWtBb0sdex+orrpWqfNtzzzmHYmAIKBzcFoKtz3qN2qTeQWFmjjejN
	e4l5jq6r0p6XyWZ+5GumIGKgo2fDYmSNuMwdhwWZVQdbDOvMpdchWUjUss2THj9pT9yalzj2TNl
	IWfvMT1LYSm9ctx+DcFTitLRToOgGhVnpz47wW1rau6U2IgJvHLPjxf20Nt+7y3ppfhFCtd1h2b
	Wi6zPhmQE0si2tMzKoqVtrKe2O0gGimhHEKApf8nCygwkNpwTaoTglW9vjQLzaDTl2dKQrUD9N8
	vgJp+a5GinfkmwLorqIa2SXun9KSb8ZlRydMB+nzDF8rEPrhmOTolhgtg3mX4GailLdpo0Bpr5h
	8wjdqyUnI06Is0OnAs//xDaXRqF2CnaEjIKMFymFvOanOMVhVzyrx0lAAH+aQKpTP5shemP/jTj
	ctT7oN
X-Received: by 2002:a05:600c:8b4c:b0:480:5678:1fdd with SMTP id 5b1f17b1804b1-4837105240amr173558665e9.12.1771237648676;
        Mon, 16 Feb 2026 02:27:28 -0800 (PST)
X-Received: by 2002:a05:600c:8b4c:b0:480:5678:1fdd with SMTP id 5b1f17b1804b1-4837105240amr173558365e9.12.1771237648269;
        Mon, 16 Feb 2026 02:27:28 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483719b8e71sm236692635e9.2.2026.02.16.02.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 02:27:27 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, tzungbi@kernel.org,
 briannorris@chromium.org, jwerner@chromium.org, samuel@sholland.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 12/12] drm/sysfb: corebootdrm: Support panel orientation
In-Reply-To: <20260203135519.417931-13-tzimmermann@suse.de>
References: <20260203135519.417931-1-tzimmermann@suse.de>
 <20260203135519.417931-13-tzimmermann@suse.de>
Date: Mon, 16 Feb 2026 11:27:26 +0100
Message-ID: <87bjhp6l0x.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AdyY3IzQyvtdgSyOzqYTeskRMg2MI7sKTE752g-X-Yg_1771237649
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Add fields and constants for coreboot framebuffer orientation. Set
> corebootdrm's DRM connector state from the values. Not all firmware
> provides orientation, so make it optional. Systems without, continue
> to use unknown orientation.
>
> v3:
> - comment on _HAS_ORIENTATION semantics (Tzung-Bi)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Julius Werner <jwerner@chromium.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

