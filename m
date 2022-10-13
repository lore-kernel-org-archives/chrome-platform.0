Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D5B20E2
	for <chrome-platform@lists.linux.dev>; Thu, 13 Oct 2022 04:29:07 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-136b5dd6655so1062333fac.3
        for <chrome-platform@lists.linux.dev>; Wed, 12 Oct 2022 21:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
         :from:references:in-reply-to:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYIIq0zO9axQJUK4FF0gEw5z0+wm+xs5xbHKpjK1nxE=;
        b=aeRtqd2Sh3gnMbaYcXg+1q+5/bEdCg3LbB9VVrDjLOskPXni1TjtP+R2a1fMZ0D2xQ
         5v+cLRSwJTv6bGpPDqXn72QFCQ1umXDphtFov4hsKy8L+fE2nsHpINSRlgB/7hP3M+WE
         51FqSr1Ing7WnFu+YdZQ/wAoKOQlQbPnlNJ+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
         :from:references:in-reply-to:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SYIIq0zO9axQJUK4FF0gEw5z0+wm+xs5xbHKpjK1nxE=;
        b=UE7afZI+g45JA6mKT939Gf+ntbk+kkULkWoCVRtl8ym+TPM4YmLfMjLV2mzC9kgLfP
         SpLmJKlSL4GxuSSopR26vM8O/bjhd/iaRZoIKoKcCkRdRqPVNywtthDWmk9+68HlKLkb
         HdM5kdeXXwfe0hFzJJLAzaQCNFT9hsNCE3THUe9MQSm7N7r5cl6iUbDg4DFzU2TSqW+G
         4KnVmTZDdPTMMDwG8510u4f4ja+PXPizndFhhgBYXCN0uE9A0VVTypcM55MzESma/g3M
         k7pUxkHkNG6EU55g13EgJ7DfSJeyWRy1bE3BkVmdb2+KaU7gFuCfqhZk7Y9fLNhzPR7F
         xLoA==
X-Gm-Message-State: ACrzQf3JsPYsWnef0qfCYfhLso9JadYtN9ew6OH0wWNVW11Ix+pB913D
	ilCtGIUyKiNVjwSHj2L5owVXwYAxpGgQnA==
X-Google-Smtp-Source: AMsMyM6dqcHqK+ANsbkKQwIXhaCyhmW2nmlWoiTcHaDJqQR8hdcQsmd2pu4G199j/yb17mHxqcBfzw==
X-Received: by 2002:a05:6870:8895:b0:136:ea9f:81b6 with SMTP id m21-20020a056870889500b00136ea9f81b6mr4455701oam.36.1665635345694;
        Wed, 12 Oct 2022 21:29:05 -0700 (PDT)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com. [209.85.161.54])
        by smtp.gmail.com with ESMTPSA id o185-20020acaf0c2000000b0035418324b78sm7342858oih.11.2022.10.12.21.29.04
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 21:29:04 -0700 (PDT)
Received: by mail-oo1-f54.google.com with SMTP id c13-20020a4ac30d000000b0047663e3e16bso579052ooq.6
        for <chrome-platform@lists.linux.dev>; Wed, 12 Oct 2022 21:29:04 -0700 (PDT)
X-Received: by 2002:a4a:c11a:0:b0:480:6f49:51c8 with SMTP id
 s26-20020a4ac11a000000b004806f4951c8mr7835433oop.47.1665635343943; Wed, 12
 Oct 2022 21:29:03 -0700 (PDT)
Received: from 190990251477 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Oct 2022 21:29:03 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Y0Z++9QUAOOUAQrj@google.com>
References: <20221012040918.272582-1-dcallagh@chromium.org>
 <20221012040918.272582-2-dcallagh@chromium.org> <Y0Z++9QUAOOUAQrj@google.com>
From: Dan Callaghan <dcallagh@chromium.org>
User-Agent: alot/0.10
Date: Wed, 12 Oct 2022 21:29:03 -0700
X-Gmail-Original-Message-ID: <CAL=kDigzLLfqxJyGCon3Tk6jHH0r=Zw9ZJDT0LL4Rcr8tmmppw@mail.gmail.com>
Message-ID: <CAL=kDigzLLfqxJyGCon3Tk6jHH0r=Zw9ZJDT0LL4Rcr8tmmppw@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] platform/chrome: add a driver for HPS
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: chrome-platform@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, 
	=?UTF-8?B?U2FtaSBLecO2c3RpbMOk?= <skyostil@chromium.org>, 
	Benson Leung <bleung@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Excerpts from Tzung-Bi Shih=E2=80=99s message of 2022-10-12 19:46:51 +1100:
> On Wed, Oct 12, 2022 at 03:09:18PM +1100, Dan Callaghan wrote:
> > ---
>
> It doesn't need a cover letter if the series only has 1 patch in general.
> Instead, it could put additional information (and changelogs) after "---"=
.

Understood, I'll omit the cover letter in future postings.

> > diff --git a/drivers/platform/chrome/cros_hps_i2c.c b/drivers/platform/=
chrome/cros_hps_i2c.c
> [...]
> > +static int hps_i2c_probe(struct i2c_client *client)
> > +{
> > +     struct hps_drvdata *hps;
> > +     int ret;
> > +
> > +     hps =3D devm_kzalloc(&client->dev, sizeof(*hps), GFP_KERNEL);
> > +     if (!hps)
> > +             return -ENOMEM;
> > +
> > +     memset(&hps->misc_device, 0, sizeof(hps->misc_device));
>
> The memset can be dropped.  `hps` is z-allocated.

I'll take this out.

> > +     hps->misc_device.parent =3D &client->dev;
> > +     hps->misc_device.minor =3D MISC_DYNAMIC_MINOR;
> > +     hps->misc_device.name =3D "cros-hps";
> > +     hps->misc_device.fops =3D &hps_fops;
> > +
> > +     i2c_set_clientdata(client, hps);
> > +     hps->client =3D client;
>
> To be neat, I would prefer to insert a blank line here.

Sure, will add one.

> > +     hps->enable_gpio =3D devm_gpiod_get(&client->dev, "enable", GPIOD=
_OUT_HIGH);
> > +     if (IS_ERR(hps->enable_gpio)) {
> > +             ret =3D PTR_ERR(hps->enable_gpio);
> > +             dev_err(&client->dev, "failed to get enable gpio: %d\n", =
ret);
> > +             return ret;
> > +     }
> > +
> > +     ret =3D misc_register(&hps->misc_device);
> > +     if (ret) {
> > +             dev_err(&client->dev, "failed to initialize misc device: =
%d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     hps_set_power(hps, false);
>
> IIUC, the GPIO will raise to HIGH in the first place, and then fall
> to LOW until here.  Is it an expected behavior?  How about gpiod_get()
> with GPIOD_OUT_LOW?

It might seem a little unusual, but it is intentional. The enable line is
already high when we enter the kernel from firmware. Acquiring the GPIO
line with GPIOD_OUT_HIGH preserves its existing state (high) in case later
steps fail.

We power off the periphal only once the driver is successfully bound and ha=
s
taken control of its power state.

> > +static int hps_i2c_remove(struct i2c_client *client)
> > +{
> > +     struct hps_drvdata *hps =3D i2c_get_clientdata(client);
> > +
> > +     pm_runtime_disable(&client->dev);
> > +     misc_deregister(&hps->misc_device);
> > +     hps_set_power(hps, true);
>
> Why does it need to raise the GPIO again when removing the device?

Similar to the above, we want to preserve the default power state
(i.e. powered on) whenever the driver is not bound to the device.

This behaviour made sense to us mainly because we were originally controlli=
ng
the peripheral entirely from userspace, so it was always powered on by defa=
ult.

Do you think this behaviour is acceptable, or do we need to change it?

--=20
Dan Callaghan <dcallagh@chromium.org>
Software Engineer, Google
