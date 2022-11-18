Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20FFA473
	for <chrome-platform@lists.linux.dev>; Fri, 18 Nov 2022 20:11:29 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id jr19so3862081qtb.7
        for <chrome-platform@lists.linux.dev>; Fri, 18 Nov 2022 12:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPFJ1XmOxzRcxvK8XpOebsBs8p6fSN1mOp6wSD9Nx7s=;
        b=lOTDsGw4vYRXDry3c5SlueBq9GAV3EeB7N2mdQKZe1VVIhb8wiRgfyKgIory6K0hkL
         ZAgZ7G8pIuZ+pgV7aZDC86AgW0Y/9kBNJGhO81WjlQopltELrp+iG9SxxlyJh7Yv2BG+
         IEPNPTSCbWtTzbHa/Y5H9ELunOo6bvQ+NFYfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KPFJ1XmOxzRcxvK8XpOebsBs8p6fSN1mOp6wSD9Nx7s=;
        b=g62fFywCBchf1FGLysUQbQk70+yTJOF5A24qtbGa0/YhY2PMMbrtiGA5m/rx9P98yQ
         t++Bq+rfdeVN6Iw4tK5yLbw8g9RvMXaO8nsylo8g/WAUJPZmJFLaKpi/ISavCUmGkKX8
         sTYxDARERwl/gQRlukzAhVwa5WCBmg1+GP7iQoceeWGN41vvr3lKpUdSgTVJ5t0txmGY
         3df5Eguy9QgbD7Hzpas50HEVNdEFZO/Z9sd01ZeeNIediyeX1Ag160HlSnqhGsVHOO9R
         6MFL7FFkdP/T8mIWEqw9wKfQ4dIEMwZHS4OsTnL+jaHVEo3/TXsTkInoX+HA4sQzLi+o
         ygWg==
X-Gm-Message-State: ANoB5pnsWGpT/imOvMouIHsqr36zqvudfBAoR9CIoGvVAeLPXv7HUNBp
	804+Gh8xnKaf1Df2L7mvOVV7Gbh4P4iWIxiMulbnRA==
X-Google-Smtp-Source: AA0mqf7GrGGsafZ7chhiY5vpiDtDNL9MQoVmY50K6U5nvWOqF8rWSsPqdIkbVgGUu2x4m8OO658Jv5lkYp9yOSI2Dyc=
X-Received: by 2002:ac8:7255:0:b0:3a4:fffe:aab5 with SMTP id
 l21-20020ac87255000000b003a4fffeaab5mr8196737qtp.503.1668802288813; Fri, 18
 Nov 2022 12:11:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221117080823.77549-1-yuancan@huawei.com> <CACeCKafbbVsLrprzvVzsVgUUwExf==Ck-SOhQ2RCZbMVAnHuJg@mail.gmail.com>
 <2d89c054-9962-bd8a-9180-6a72545cf7e8@huawei.com>
In-Reply-To: <2d89c054-9962-bd8a-9180-6a72545cf7e8@huawei.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Fri, 18 Nov 2022 12:11:17 -0800
Message-ID: <CACeCKaevCdGYkC0+3rj3THJrabHC-j=qxHbCaCDZExoh4rH-Rg@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_usbpd_notify: Fix error handling in cros_usbpd_notify_init()
To: Yuan Can <yuancan@huawei.com>
Cc: bleung@chromium.org, gwendal@chromium.org, jflat@chromium.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2022 at 2:18 AM Yuan Can <yuancan@huawei.com> wrote:
>
>
> =E5=9C=A8 2022/11/18 3:07, Prashant Malani =E5=86=99=E9=81=93:
> > Hi Yuan,
> >
> > On Thu, Nov 17, 2022 at 12:10 AM Yuan Can <yuancan@huawei.com> wrote:
> >> The reason is that the cros_usbpd_notify_init() does not check the ret=
urn
> >> value of platform_driver_register(), and the cros_usbpd_notify can
> >> install successfully even if platform_driver_register() failed.
> >>
> >> Fix by checking the return value of platform_driver_register() and
> > Can you provide details regarding why cros_usbpd_notify_acpi_driver reg=
istration
> > is failing on your system (logs or other details) ?
>
> The reason could be an OOM happend when platform_driver_register() tries
> to allocate memory,
>
> a simple call graph:
>
>   platform_driver_register()
>     driver_register()
>       bus_add_driver()
>         dev =3D kzalloc(...) # OOM happened
>

Sure, but is that what you're seeing? Can you share logs from your repro ca=
se?

I've got no problems with the change itself, but find the
platform_driver_register()
failure to be quite odd here.

Thanks,
