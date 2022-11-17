Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904428C03
	for <chrome-platform@lists.linux.dev>; Thu, 17 Nov 2022 19:15:17 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id y203so2696689pfb.4
        for <chrome-platform@lists.linux.dev>; Thu, 17 Nov 2022 11:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PWt1rVyqX0/Uv1KTAFzd1LKGWkQ28B+P01vHwgU68T0=;
        b=GyuhcaXpVTZDA+lyFQ8DbqePF4AxXQ2uFCADJVi6t0NeUFcU5JhGC+8/GGGZV4NYXg
         ycDCJvee11SLCaJ3hfcjz1DBqwcrDxlAkRahstw1YTZ8mLm5TljzfquLwPxGBivsLFfQ
         +Mj1CqmjOtK18fiH0pBD2JrHeo+1Jg5ancbHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PWt1rVyqX0/Uv1KTAFzd1LKGWkQ28B+P01vHwgU68T0=;
        b=BM/PH2XR4SfFVCUyij7Vm/hoGJ7/zxyFQQlOLBE13AaLtnkxxAL+FOtAzoq+dLGYl/
         OTHyyX04mYqKJv4w+clvqBH5rSaTfTLe8tq7z3erEMzBQvocUN1q6BMkXNReYTSiLECP
         viPinW5NkKkhFJ9untO/EfgpD3sdkRZiiLbdZeek4GqcDUFkN5zEbrrgNhLTSgewsO+p
         5b4V6lDWE31z0e5dtGvLnVtf5rxcaZUhzFAw03kFGrM/RQGru8UIqb0wzuw7gSbTPfDH
         nW3EFADE+L9iUYj/OtHpJMoV7+d3MGn/UyzTEK/eodYjZe52Mu1zY9PX3MIe80pQuCjs
         W5qg==
X-Gm-Message-State: ANoB5pn64wWZiLsXrE7wAPyYqoHvqWfOATMcFMGfk8TyCz102/gOi9TU
	eGUCpHqdCtdQwl4TAV591i9Buw==
X-Google-Smtp-Source: AA0mqf44gozpWBV0AhqlNj+M9Adg7Ll42NnPPPWLow1AeTIFXckNPSFC0T+A1D3JdBesI00tRVslOg==
X-Received: by 2002:a63:27c6:0:b0:46a:e818:b622 with SMTP id n189-20020a6327c6000000b0046ae818b622mr3252938pgn.550.1668712516982;
        Thu, 17 Nov 2022 11:15:16 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:d1e8:472c:ff8:18d6])
        by smtp.gmail.com with ESMTPSA id ij23-20020a170902ab5700b0017f7c4e2604sm1670376plb.296.2022.11.17.11.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 11:15:16 -0800 (PST)
Date: Thu, 17 Nov 2022 11:15:14 -0800
From: Brian Norris <briannorris@chromium.org>
To: Yuan Can <yuancan@huawei.com>
Cc: pmalani@chromium.org, bleung@chromium.org, gwendal@chromium.org,
	jflat@chromium.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH] platform/chrome: cros_usbpd_notify: Fix error handling
 in cros_usbpd_notify_init()
Message-ID: <Y3aIQtnxQCeA4FEy@google.com>
References: <20221117080823.77549-1-yuancan@huawei.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221117080823.77549-1-yuancan@huawei.com>

On Thu, Nov 17, 2022 at 08:08:23AM +0000, Yuan Can wrote:
> The following WARNING message was given when rmmod cros_usbpd_notify:
> 
>  Unexpected driver unregister!
>  WARNING: CPU: 0 PID: 253 at drivers/base/driver.c:270 driver_unregister+0x8a/0xb0
>  Modules linked in: cros_usbpd_notify(-)
>  CPU: 0 PID: 253 Comm: rmmod Not tainted 6.1.0-rc3 #24
>  ...
>  Call Trace:
>   <TASK>
>   cros_usbpd_notify_exit+0x11/0x1e [cros_usbpd_notify]
>   __x64_sys_delete_module+0x3c7/0x570
>   ? __ia32_sys_delete_module+0x570/0x570
>   ? lock_is_held_type+0xe3/0x140
>   ? syscall_enter_from_user_mode+0x17/0x50
>   ? rcu_read_lock_sched_held+0xa0/0xd0
>   ? syscall_enter_from_user_mode+0x1c/0x50
>   do_syscall_64+0x37/0x90
>   entry_SYSCALL_64_after_hwframe+0x63/0xcd
>  RIP: 0033:0x7f333fe9b1b7
> 
> The reason is that the cros_usbpd_notify_init() does not check the return
> value of platform_driver_register(), and the cros_usbpd_notify can
> install successfully even if platform_driver_register() failed.
> 
> Fix by checking the return value of platform_driver_register() and
> unregister cros_usbpd_notify_plat_driver when it failed.

On first glance, the last part looked wrong (if register() fails, we
don't need to call unregister()), but these are two different drivers
getting registered. Looks good to me, then.

> Fixes: ec2daf6e33f9 ("platform: chrome: Add cros-usbpd-notify driver")
> Signed-off-by: Yuan Can <yuancan@huawei.com>

Reviewed-by: Brian Norris <briannorris@chromium.org>

> ---
>  drivers/platform/chrome/cros_usbpd_notify.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/chrome/cros_usbpd_notify.c b/drivers/platform/chrome/cros_usbpd_notify.c
> index 4b5a81c9dc6d..10670b6588e3 100644
> --- a/drivers/platform/chrome/cros_usbpd_notify.c
> +++ b/drivers/platform/chrome/cros_usbpd_notify.c
> @@ -239,7 +239,11 @@ static int __init cros_usbpd_notify_init(void)
>  		return ret;
>  
>  #ifdef CONFIG_ACPI
> -	platform_driver_register(&cros_usbpd_notify_acpi_driver);
> +	ret = platform_driver_register(&cros_usbpd_notify_acpi_driver);
> +	if (ret) {
> +		platform_driver_unregister(&cros_usbpd_notify_plat_driver);
> +		return ret;
> +	}
>  #endif
>  	return 0;
>  }
> -- 
> 2.17.1
> 
> 
