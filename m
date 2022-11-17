Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A473E8C03
	for <chrome-platform@lists.linux.dev>; Thu, 17 Nov 2022 19:07:26 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id h10so1841574qvq.7
        for <chrome-platform@lists.linux.dev>; Thu, 17 Nov 2022 11:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yHYRcTipzM47knbePTHd/ie8Ck2A5SKKV8ESqwlnOtY=;
        b=W9P6vA4Tiz/HB/i/EepgGHpkHSl6POMEQm+D8yyx/iP4YBCUu/MvMrIraFC8gfsPgp
         GHp5VnikeQpAOJKBMww/eEaB+5FgF9fhp4RGJBpSdSXdHa4XPJmDCSXNPuZNxlHdylQu
         zuXc4X9GoiDgE0QTmaaWl4bHB5GBj9Pi1Feiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yHYRcTipzM47knbePTHd/ie8Ck2A5SKKV8ESqwlnOtY=;
        b=aeQuLZl7e86XqrcDX5AVlOwp4V/PrthTt49VbvNqwIDLsNeR4IsoGG6bY35DfBrcy1
         4+/On7JSRTD8+M6/v5n0lJMvhgjeiEgCXKOa+FcOcNHOabCwfjIGJ2JsvLyN9NncSmLJ
         p+v/j1sEUIAImLvmL05o9TALp75Ru3lNjoAHoO+kWiqJW2BDni40RV49J+TA7AEswfhE
         MaWE7KdAsf26rLW/QkxchL3MHFuZ68WS5EkmWWFTpXHfKQqUqOCHeDAg3hxkyIit+SZQ
         CZsV/dJKdUfr5VbiHDmy3yP3iADo5H/Cpdsx8SqD7Gp/E3g0K+BobDGfCvkukuTLKr5b
         /UUg==
X-Gm-Message-State: ANoB5pmf+eii2GEdflLimqBLP62y+JBdc/Jw/UlntITjBCuWDCxZ6Lld
	1xEZAS+pgYB7eKksicaZ4jcal3lIlNeBKsRDdvoNDA==
X-Google-Smtp-Source: AA0mqf4KxjDHVzF5BUSbXfvFkB9fivn/e2meVzMBemBqR0rE0AWjmRGNf20zLiGnnfc+giTfchG/g45hRUqqjOVqhV0=
X-Received: by 2002:a05:6214:1e2:b0:4c6:8f31:2dea with SMTP id
 c2-20020a05621401e200b004c68f312deamr2225243qvu.127.1668712045536; Thu, 17
 Nov 2022 11:07:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221117080823.77549-1-yuancan@huawei.com>
In-Reply-To: <20221117080823.77549-1-yuancan@huawei.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Thu, 17 Nov 2022 11:07:14 -0800
Message-ID: <CACeCKafbbVsLrprzvVzsVgUUwExf==Ck-SOhQ2RCZbMVAnHuJg@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_usbpd_notify: Fix error handling in cros_usbpd_notify_init()
To: Yuan Can <yuancan@huawei.com>
Cc: bleung@chromium.org, gwendal@chromium.org, jflat@chromium.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Yuan,

On Thu, Nov 17, 2022 at 12:10 AM Yuan Can <yuancan@huawei.com> wrote:
>
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

Can you provide details regarding why cros_usbpd_notify_acpi_driver registration
is failing on your system (logs or other details) ?

Thanks,

- Prashant
