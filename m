Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2D6337BBC
	for <chrome-platform@lists.linux.dev>; Fri,  9 Jan 2026 10:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767954254; cv=none; b=F0mOEC8sZbH8Rp0GXjucMlmlIbu7VLmEJ0QEEyWopM1ixNsntvquwsPJr0eAPUXTDTo7fKUaYtjxBkmz38jVoA7hJUUNs6w1fO5frhY77yphPpUdI2PvKTDZvHFmNOhzMgU201/RzJrukSSdl4d6AYNq35FH8CKjx3l1PidKjs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767954254; c=relaxed/simple;
	bh=RSrb7wrlsStx+tKOcLplcHBZ93zpsrLUr8d+3pJDxQ8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CBUclItr6YAiB8peUSxHcfDe5J/6o22r4g+gP6w7dkvcB2pVxXo1GrdcLxgbhWO9AT4kvL+CjtHORi3wfZBQT07Pg4iw+k2Ary56CQvoFoQmN0PqYJulXqES1A1rIueQSNj6mvq0ETN3jGYYDICJDvvyVx2ndsE8NUPKR4W8mVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KF9tGq8w; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KF9tGq8w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767954252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pym140T9WEuciOsv6f5sDVH99vBIoa9ppIjVo6ZnmJc=;
	b=KF9tGq8wix9it49Kt6UYaschTsAN1E+zBQWmljlQpG6k9oj1etSN9s+XG08k91ZjF7jHBA
	iG92Vxf7geCDwA1lZIeyzL25GDFafp/C3WxijJjWwt3Uiikg8vWNHf+8rzF3BN1OKzpXg8
	1d5fKnjyxuwHaso2aby/VKLLuQdb9Xw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-GcQ_WK_iN7mmEYS6RnTAag-1; Fri, 09 Jan 2026 05:24:11 -0500
X-MC-Unique: GcQ_WK_iN7mmEYS6RnTAag-1
X-Mimecast-MFC-AGG-ID: GcQ_WK_iN7mmEYS6RnTAag_1767954250
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-477964c22e0so22956395e9.0
        for <chrome-platform@lists.linux.dev>; Fri, 09 Jan 2026 02:24:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767954250; x=1768559050;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pym140T9WEuciOsv6f5sDVH99vBIoa9ppIjVo6ZnmJc=;
        b=KIATrEHakwKkSyQyZAgahbI9XzNSuTa4GKf1EvyMhk4E9F8KV3FeUsJux+YfMCTCJ+
         nTp+eDUCxIV9x148zMVhPNE0/UcWbAb26PxspkHWY9JApo4KJXyLP9626LKmB+sJ8fPW
         o5wfR/eB9YLZanyY5q+TPuhVZ1X3x94jxknTF06NBT5gFo70oAevo2SVuA/kiinmXb+Y
         eEHs7uIOzmxsgqxBpdO5hqDXWeNZRhb+neluR+Aa0m6LoLUqaDe/D6DvfmELry+kISWM
         8hT8CYL0jKJ5R2OiyNGIvBQ3RlSkMJYc+8LTsBn3IdPplYqHzQdJrcpSZ0t6lUkBVEjG
         T1iw==
X-Gm-Message-State: AOJu0YycYK4Kojsl4fwqcvGxQzpviL+Dh4PxUEA5K0bMPb4DGD2J6VV3
	g7Lu7Zt94ygNaspJq2PGP5qS+z/8lo1KbciHsH9UAip6sYTUcGfqNE2N844+J7SeSfzVA5meZwX
	vbIPl+RumVUu/v+pDbQCfSXSORJCFV9Td3skrB3O+P36fyDBOwslGXptJtkEPu07mSRDipg==
X-Gm-Gg: AY/fxX4jJ6QeBxsrO0axINm9QscaXCvwNuM8n5b3x+mHyrsXnFF3JdFU+DJ6vHgJvVB
	8Di8oYmsAsgUos5BEjSLH0U2LWqXoXDalGVJDk/Vwg8wPtZGahiTPzdn0O/6pZUld4n60Ydqh/Y
	Yp/qagRr9aIURvA/nd8G/3gAMf8J7yfuMhxoHiPvmUY3gq7h/21oIuXtylfTmoWDhHUG+cmfYd1
	zmG78DJH7fwBefj3X96giuRMxqmpQjmj39UsYqxGJ5xugnstvpklKeNOiZvTOWmSYaFYcSbS2OH
	yqz35IhPjLYJOpQnzjoYztj5PboH0vmqc4vYkEuiOetGH+rinIccAUJQopV/Nl29eDpaNTABdQ3
	tmATOkGlMLxvNo8/iyLkx3KqwMUfwqZp35Vf4AQgm0bnDgI+oRG68MCURXpTCiB2jZRWv
X-Received: by 2002:a7b:c358:0:b0:477:a71c:d200 with SMTP id 5b1f17b1804b1-47d7f616248mr101203955e9.11.1767954249741;
        Fri, 09 Jan 2026 02:24:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhHr+oRWV9twPID3yI7aHXNGJDxSzEl4qHGGDumKDgymP0EGzgtIzqbhIhrME3WHKV5ytk6w==
X-Received: by 2002:a7b:c358:0:b0:477:a71c:d200 with SMTP id 5b1f17b1804b1-47d7f616248mr101203795e9.11.1767954249369;
        Fri, 09 Jan 2026 02:24:09 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f70bc4fsm196128645e9.15.2026.01.09.02.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 02:24:08 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, tzungbi@kernel.org,
 briannorris@chromium.org, jwerner@chromium.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/8] firmware: google: Init coreboot bus with
 subsys_initcall()
In-Reply-To: <20260108145058.56943-3-tzimmermann@suse.de>
References: <20260108145058.56943-1-tzimmermann@suse.de>
 <20260108145058.56943-3-tzimmermann@suse.de>
Date: Fri, 09 Jan 2026 11:24:07 +0100
Message-ID: <87qzrzf5iw.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2rnufvnnzrjUy74ll-LyunzH2IPlVEKVX17baC6KgJ4_1767954250
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Using module_init()/device_initcall() is too late to initialize
> the coreboot bus, as there might already be drivers that depend
> on it.
>
> So far this hasn't been a problem, as coreboot controls all device
> creation. Initializing the coreboot bus earlier in subsys_initcall()
> will allow for external coreboot drivers to register themselves
> with device_initcall(). Prepares coreboot to support additional
> coreboot drivers from other subsystems.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/firmware/google/coreboot_table.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/google/coreboot_table.c b/drivers/firmware/google/coreboot_table.c
> index c34426e5002d..3bee22d2a7b3 100644
> --- a/drivers/firmware/google/coreboot_table.c
> +++ b/drivers/firmware/google/coreboot_table.c
> @@ -268,7 +268,7 @@ static void __exit coreboot_table_driver_exit(void)
>  	bus_unregister(&coreboot_bus_type);
>  }
>  
> -module_init(coreboot_table_driver_init);
> +subsys_initcall(coreboot_table_driver_init);
>  module_exit(coreboot_table_driver_exit);
>  
>  MODULE_AUTHOR("Google, Inc.");
> -- 
> 2.52.0
>

I agree and is also consistent to the init call level used by EFI, PSCI,
SCMI, DMI, etc.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

