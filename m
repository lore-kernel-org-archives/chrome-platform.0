Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8911F93E
	for <chrome-platform@lists.linux.dev>; Sat, 14 Sep 2024 22:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726351741; cv=none; b=VlNAy6D3HPKsojXWioAd2HUuBDBCsMat6HiylUkFCFR72zcibHvVFYFM8ZipkFnogbmRcMVSVVG7OyEFbjiAEmgmfiu4n4VKNBXdORRUlL2QjO3JBF4RLoIdUtvoMsCfLfcr1VWJS2u4on3t7s7yMuX4aeAwWB5WBKSi+eqOcb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726351741; c=relaxed/simple;
	bh=3m1DCrSvQKjujDvwmkxK7th6xOLHKnS9HmMRPhoYvkE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M8XekLLnYPL25cmHk63rKmc6YXpu2q0dVVXjxOP+1/2VSFArzOLEa7Z67wy9B98BJ3D8rW5LmQUZKTBuQ03At4hm5V4ZlezzQ/x3OFISlMxiva43q6+I1VEKtFBrOuy7JFzReUsub4GGu7igLEJxIDZ9Qbfp7J4NzhbLM1yflU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nATyeeww; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nATyeeww"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f78b28ddb6so27283161fa.0
        for <chrome-platform@lists.linux.dev>; Sat, 14 Sep 2024 15:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726351737; x=1726956537; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiEB2J67EKAy/BEGMAFfw030z4rUaOkg2/WsC3ToBn4=;
        b=nATyeewwHpENIS0DG8t1ixJLUHULZlxYekc2WdV93JYebqSnxWHJYWLRtNXAzfMO0D
         L25KjJ7Vy2qslUf4DP1ldqZS2IfWeYt8gvsolvVpraV8CISZ1Pt0t+LlHG+Es/zgfn6o
         TbbEK566NzDzvz6AI+A3rR1lQW+QXdKM5WtYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726351737; x=1726956537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yiEB2J67EKAy/BEGMAFfw030z4rUaOkg2/WsC3ToBn4=;
        b=bZMVaJSv6Byf/D55XZpD77xYkvReBIlMAgzGDC+AHKZUBjva5VkKiuu561FRsCRkDN
         Nt1RxVLShz1OTsMhcN2n9Z/4gwGIAm54PDIsaPpKA1lNxGJ1TsgWP1Mvg7CvV+Ds6c1Y
         ShIpoOzSm0/CP3v3sJgk8QKL+n3U2Hrzw+HhlLBb3nPCPHUBLpZiR9f6Wyj9D63dAMua
         UqUwElCZghmYiLab/KrwSBWLbbInVQmhfm970u4xoj2ph1TVzmSE1oovrDVj6550AZY1
         8pBvS4vND3hsj/zldu6YwS7odbZQELgnhh0qcpEKtyqfRBsLQ70oxzez5HyrN0/LzLnP
         se0w==
X-Forwarded-Encrypted: i=1; AJvYcCVtBPUB4NTreyOCWbS8A8ujqMqDHdKS67ivh9DL0iw7jrFz2mUmBrWL6/Bxb932QYTvxcgMVMICzTTcVjtaEPY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyvq5yUIeTLOKL7abGSkdWaHbyya+yzZhMPmeRtSaBskVMVF53w
	qa5z/oAZnhIQAXqknjjv+q0aMFVaDvmBk++OqIcEPXNB2dF3cQh9bOnHlKy4E4Lm1FJQ+XuVZFd
	FLRCIP8f5FHlDqxyOn7mes37kfoWXC8xaPqg=
X-Google-Smtp-Source: AGHT+IGZPVT5JPb9fNFWNHiguDTtiBSmIx38CcaEKwJ+Ijj1Pen/2pppakRhdotesmo/nvup9+nR370ute1AVyZQSQE=
X-Received: by 2002:a05:6512:3e29:b0:52c:d76f:7f61 with SMTP id
 2adb3069b0e04-53678ff4d55mr6631566e87.56.1726351736897; Sat, 14 Sep 2024
 15:08:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240910101527.603452-1-ukaszb@chromium.org> <20240910101527.603452-7-ukaszb@chromium.org>
 <ZuGkMiE3sHOpo/Ci@kuha.fi.intel.com>
In-Reply-To: <ZuGkMiE3sHOpo/Ci@kuha.fi.intel.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Sun, 15 Sep 2024 00:08:45 +0200
Message-ID: <CALwA+Nb6zWe-WOgcu8-ni5OCx9XxerVhi76fZze2KP_kmFVonA@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] usb: typec: cros_ec_ucsi: Add netlink
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Pavan Holla <pholla@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 4:09=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi,
>
> On Tue, Sep 10, 2024 at 10:15:25AM +0000, =C5=81ukasz Bartosik wrote:
> > Add netlink to ChromeOS UCSI driver to allow forwarding
> > of UCSI messages to userspace for debugging and testing
> > purposes.
>
> Why does this need to be cros_ec specific?
>

You're right. Netlink does not have to be cros_ec_ucsi specific.
Would you like to have netlink in typec_ucsi ?

> > Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > ---
> >  MAINTAINERS                                   |  4 +-
> >  drivers/usb/typec/ucsi/Makefile               |  4 +-
> >  .../{cros_ec_ucsi.c =3D> cros_ec_ucsi_main.c}   | 66 +++++++++++++-
> >  drivers/usb/typec/ucsi/cros_ec_ucsi_nl.c      | 87 +++++++++++++++++++
> >  drivers/usb/typec/ucsi/cros_ec_ucsi_nl.h      | 52 +++++++++++
> >  5 files changed, 209 insertions(+), 4 deletions(-)
> >  rename drivers/usb/typec/ucsi/{cros_ec_ucsi.c =3D> cros_ec_ucsi_main.c=
} (79%)
> >  create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi_nl.c
> >  create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi_nl.h
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index d084f32208f0..2afb406a24ce 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -5305,7 +5305,9 @@ M:      Abhishek Pandit-Subedi <abhishekpandit@ch=
romium.org>
> >  M:   =C5=81ukasz Bartosik <ukaszb@chromium.org>
> >  L:   chrome-platform@lists.linux.dev
> >  S:   Maintained
> > -F:   drivers/usb/typec/ucsi/cros_ec_ucsi.c
> > +F:   drivers/usb/typec/ucsi/cros_ec_ucsi_main.c
> > +F:   drivers/usb/typec/ucsi/cros_ec_ucsi_nl.c
> > +F:   drivers/usb/typec/ucsi/cros_ec_ucsi_nl.h
> >  F:   drivers/usb/typec/ucsi/cros_ec_ucsi_trace.h
> >
> >  CHRONTEL CH7322 CEC DRIVER
> > diff --git a/drivers/usb/typec/ucsi/Makefile b/drivers/usb/typec/ucsi/M=
akefile
> > index be98a879104d..82d960394c39 100644
> > --- a/drivers/usb/typec/ucsi/Makefile
> > +++ b/drivers/usb/typec/ucsi/Makefile
> > @@ -21,5 +21,7 @@ obj-$(CONFIG_UCSI_ACPI)                     +=3D ucsi=
_acpi.o
> >  obj-$(CONFIG_UCSI_CCG)                       +=3D ucsi_ccg.o
> >  obj-$(CONFIG_UCSI_STM32G0)           +=3D ucsi_stm32g0.o
> >  obj-$(CONFIG_UCSI_PMIC_GLINK)                +=3D ucsi_glink.o
> > -obj-$(CONFIG_CROS_EC_UCSI)           +=3D cros_ec_ucsi.o
> >  obj-$(CONFIG_UCSI_LENOVO_YOGA_C630)  +=3D ucsi_yoga_c630.o
> > +
> > +obj-$(CONFIG_CROS_EC_UCSI)           +=3D cros_ec_ucsi.o
> > +cros_ec_ucsi-y                               :=3D cros_ec_ucsi_main.o =
cros_ec_ucsi_nl.o
> > diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/=
ucsi/cros_ec_ucsi_main.c
> > similarity index 79%
> > rename from drivers/usb/typec/ucsi/cros_ec_ucsi.c
> > rename to drivers/usb/typec/ucsi/cros_ec_ucsi_main.c
> > index 70185616ec86..008b61921278 100644
> > --- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> > +++ b/drivers/usb/typec/ucsi/cros_ec_ucsi_main.c
> > @@ -19,6 +19,7 @@
> >  #define CREATE_TRACE_POINTS
> >  #include "ucsi.h"
> >  #include "cros_ec_ucsi_trace.h"
> > +#include "cros_ec_ucsi_nl.h"
> >
> >  /*
> >   * Maximum size in bytes of a UCSI message between AP and EC
> > @@ -43,6 +44,43 @@ struct cros_ucsi_data {
> >       unsigned long flags;
> >  };
> >
> > +/*
> > + * When set to true the cros_ec_ucsi driver will forward all UCSI mess=
ages
> > + * exchanged between OPM <-> PPM to userspace through netlink
> > + */
> > +static bool is_ap_sniffer_en;
> > +
> > +static ssize_t enable_ap_sniffer_show(struct device *dev,
> > +                                   struct device_attribute *attr,
> > +                                   char *buf)
> > +{
> > +     return sprintf(buf, "%d\n", is_ap_sniffer_en);
> > +}
> > +
> > +static ssize_t enable_ap_sniffer_store(struct device *dev,
> > +                                    struct device_attribute *attr,
> > +                                    const char *buf, size_t count)
> > +{
> > +     u8 value;
> > +
> > +     if (kstrtou8(buf, 0, &value))
> > +             return -EINVAL;
> > +
> > +     is_ap_sniffer_en =3D value ? 1 : 0;
> > +     return count;
> > +}
> > +
> > +static DEVICE_ATTR_RW(enable_ap_sniffer);
> > +
> > +static struct attribute *cros_ec_ucsi_attrs[] =3D {
> > +     &dev_attr_enable_ap_sniffer.attr,
> > +     NULL
> > +};
> > +
> > +static const struct attribute_group cros_ec_ucsi_attrs_grp =3D {
> > +     .attrs =3D cros_ec_ucsi_attrs,
> > +};
>
> Undocumented sysfs entry.
>

I will document the new sysfs entry.

> >  static int cros_ucsi_read(struct ucsi *ucsi, unsigned int offset, void=
 *val,
> >                         size_t val_len)
> >  {
> > @@ -65,6 +103,9 @@ static int cros_ucsi_read(struct ucsi *ucsi, unsigne=
d int offset, void *val,
> >               return ret;
> >       }
> >
> > +     if (is_ap_sniffer_en)
> > +             nl_cros_ec_bcast_msg(NL_CROS_EC_TO_PPM, NL_CROS_EC_RD, of=
fset,
> > +                                  val, val_len);
> >       trace_cros_ec_opm_to_ppm_rd(offset, val, val_len);
> >       return 0;
> >  }
> > @@ -101,6 +142,9 @@ static int cros_ucsi_async_control(struct ucsi *ucs=
i, u64 cmd)
> >               return ret;
> >       }
> >
> > +     if (is_ap_sniffer_en)
> > +             nl_cros_ec_bcast_msg(NL_CROS_EC_TO_PPM, NL_CROS_EC_WR,
> > +                                  req->offset, (u8 *) &cmd, sizeof(cmd=
));
> >       trace_cros_ec_opm_to_ppm_wr(req->offset, &cmd, sizeof(cmd));
> >       return 0;
> >  }
> > @@ -144,6 +188,8 @@ static void cros_ucsi_work(struct work_struct *work=
)
> >       struct cros_ucsi_data *udata =3D container_of(work, struct cros_u=
csi_data, work);
> >       u32 cci;
> >
> > +     if (is_ap_sniffer_en)
> > +             nl_cros_ec_bcast_msg(NL_CROS_EC_TO_OPM, 0, 0, NULL, 0);
> >       trace_cros_ec_ppm_to_opm(0);
> >
> >       if (cros_ucsi_read_cci(udata->ucsi, &cci))
> > @@ -229,13 +275,29 @@ static int cros_ucsi_probe(struct platform_device=
 *pdev)
> >               return ret;
> >       }
> >
> > +     ret =3D nl_cros_ec_register();
> > +     if (ret) {
> > +             dev_err(dev, "failed to register netlink: error=3D%d", re=
t);
> > +             cros_ucsi_destroy(udata);
> > +             return ret;
> > +     }
> > +
> > +     ret =3D sysfs_create_group(&dev->kobj, &cros_ec_ucsi_attrs_grp);
> > +     if (ret) {
> > +             dev_err(dev, "failed to register sysfs group: error=3D%d"=
, ret);
> > +             cros_ucsi_destroy(udata);
> > +             return ret;
> > +     }
> > +
> >       return 0;
> >  }
> >
> > -static void cros_ucsi_remove(struct platform_device *dev)
> > +static void cros_ucsi_remove(struct platform_device *pdev)
> >  {
> > -     struct cros_ucsi_data *udata =3D platform_get_drvdata(dev);
> > +     struct cros_ucsi_data *udata =3D platform_get_drvdata(pdev);
>
> Please merge that change into the patch 3/8.
>

I will merge this change to the"usb: typec: ucsi: Implement ChromeOS
UCSI driver".

Thanks,
Lukasz



> > +     sysfs_remove_group(&pdev->dev.kobj, &cros_ec_ucsi_attrs_grp);
> > +     nl_cros_ec_unregister();
> >       ucsi_unregister(udata->ucsi);
> >       cros_ucsi_destroy(udata);
> >  }
>
> thanks,
>
> --
> heikki
