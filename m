Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FAF2DA76B
	for <chrome-platform@lists.linux.dev>; Sat, 17 Jan 2026 19:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768677958; cv=pass; b=ua9mlqi+Uj33+G8t00tGpADja7Lnj8sbcknNCrCw44mYXCIXusmsd+rVRNWGV05KosP31Xu8UMO3Ck0OIfRBEWEpbsT8WGCVfLNehmlmwgjsBdOXFWpgS2q/392vlw577pHTAtCinJfw8i2rYcj60zpTW8mpy94gTOoibhol3No=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768677958; c=relaxed/simple;
	bh=0UZQyoykIJiZ7b4ClPwl/sKurHIXkd2YT1kBf1pKo6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AmX1dHxM1qZcInhcH/ofqCy8fNUoThdiD/CFCVjRKhfrIKFzm+2EZeRwUox5Q0YarYMrB76Tf2rOXeE9Q4dB2sCsNbBr6voEGlb/3xedvKz2YSNrYc2gKK3WzPBAJRqnrkEalZLUqSD8LtuqEPcMjWTxuh50OAbOx7tZb8IMlFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NokT0Yyk; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NokT0Yyk"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a0a95200e8so20182795ad.0
        for <chrome-platform@lists.linux.dev>; Sat, 17 Jan 2026 11:25:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768677956; cv=none;
        d=google.com; s=arc-20240605;
        b=Vh21/I3Y+OyFDXE/lSUePDRfiiApvbfxbz03T2EVB/zXep615QKRuIQ3/LVhVMcPBe
         4jh9PjqCgB0PwYAtPdhv7lngqG3JyBpXPkAOEm6Lyhg/UpydhYxZoboXJ2JxIdqRUtoG
         HfetHsvZFMoJuv8ozrG+mQUd0/9XqwlK6R1hi77NFl600/BoWmVD2PxZEpuaK/F+E8D3
         XPzFcMoUjMZ4xasxKk6kMmcJYt1HH7ICUXAptbOPf4HhDwbRG9IfEwsNm4Fuz0nahf3G
         AUi9e61SaostorjJa5wfU/lvGK/zsCubxixwBsb0021ZUhnFmsBoukGtcpzYZ8xs2nvc
         Yaow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uXE9ck+/xO1bAjz7BogwfP+zPVi5FjXpQB7uUHVi0rA=;
        fh=humzUsp3GMnW5sl56G1BH+2WsiOcgj3mvdT2wnf2p3k=;
        b=AwA97pBrsMqBHzPcWlif3C9apAKqxq5gN/zmN4bfpX4mukcSm2mqoihq0rzox33n6/
         255OuDIlr9lDAWg8TBoRAyI+AMBovvwtyn9xBICO7RvbPlZrDGIAYs2kAYgcgYzrW+iZ
         tLWRWx6h/XhcCqiuHPJu8paD42YKgdgWh1NJLgvg5GboqQR2M9ks/uJ2EUCFASbOR4LU
         qryCfVjCjdnmDh1Sbyiz2gtJGnoriCK1PH5oY3mFqGmmpSgLTa9cGLZVckSsvOM/ouIl
         EbLH67vnErbPhxUiadg9udaGP1avfftrWY/gvSlPod2AyE1HgA+7it+F61uM2sfMhVwt
         pKcg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768677956; x=1769282756; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXE9ck+/xO1bAjz7BogwfP+zPVi5FjXpQB7uUHVi0rA=;
        b=NokT0YykPxbR50RJfOyqjDhs0pEfFhTY7GEV8tOBJO+vSMvsKm1sdjH+sV3XF0ihd/
         MbwQe2gI+ygtRh+FxluJ8Xj+fDkUrEf2pSW9iK3eqT2sqsGNiRPQRKqSmKjknpwUj9mf
         52aqvkBFxuYWMLiIQtJXohb8agstkf6Qy4JtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768677956; x=1769282756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uXE9ck+/xO1bAjz7BogwfP+zPVi5FjXpQB7uUHVi0rA=;
        b=nNCcLBX4ZJX4AeA5AsIvv3Y7KMYx3GjgJRy82WwPKlZDVCBe/psOmXC69eh1cF5tj3
         1CvH6wG5/H+SXBTf6vm1hzWDd22XXTPWeqPT1C7IGowbAp9tKSR65GG8pqtDr0oCno/M
         sc7zs5CUcu//uxPQjuFbCMmNoR0yA5uU+vpNSxbYvvsBLNMu1ooyhEiFS8Yx6RKOfdNy
         3asLHW/QqPnfSmxOsEEr7resOf2F1ITtN5/EVL57pe7r4EEpc1XoRHJUIDdSCJad9J7e
         gOnm+XOroIZX42iRnznOzAwwPKmj2iaIpPRlVEmcSPc5x3MAMkM2y5Yn6EiMcmpFex2Z
         2STg==
X-Forwarded-Encrypted: i=1; AJvYcCWiB1UkvslOJXNCOFbs4XqE2NSjutmdmPwYzita5kjIGilL8DmGKtcsoP0KlJRSu55oiFTCdU/lRpEFnWxlfJY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5IOmF/3Nt/3PNobb629QWpmZLV/8MSzxjoy68QY2Qt303pDXJ
	XaBN6NKrpa/j3pvMxT83AYSrtkrCCtweingmDe/LOnZfOXtO+wMa8KkPS8E1p7iNS7AMqnvuOm9
	X+NgxXTl5RtpeXCulixX3KWEDwCMilS7HMOojF9Do
X-Gm-Gg: AY/fxX6gPIwggsdb9RkwncLzXTCJZZocbi7eHO4ttM1SD3AFx84no1nt0848aBYlLRp
	etcEBqrQhAxZeG8myBjM6QCIbkKLvU7uAIPn10bhFeGRmWilihxeEuyHprKvGVB2c95OXuFmlwP
	ce2lN3GMSokWASN4z/8MwDpNAyppSO+mbcnU/2FSbJKJ62Y+BtaH0Re+XRUMCSXFwObl2LOBKBm
	B17STXorU8Ovd4GIBrWq29Pa/YmArnnn3qaREL2cFP7L0f6KreEf9wuWsNGBoV8Y1QKxg==
X-Received: by 2002:a17:902:cccb:b0:298:1013:9d11 with SMTP id
 d9443c01a7336-2a7175c13d4mr64148535ad.43.1768677955859; Sat, 17 Jan 2026
 11:25:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260113130536.3068311-1-akuchynski@chromium.org>
 <20260113130536.3068311-5-akuchynski@chromium.org> <aWj6vLt3iHXjuYjz@kuha>
In-Reply-To: <aWj6vLt3iHXjuYjz@kuha>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Sat, 17 Jan 2026 20:25:44 +0100
X-Gm-Features: AZwV_QhgbE2QsbeVVND6dJjvhFxBm4zfoPSb1JZWgMOyVpuLzYertv8DxJAioac
Message-ID: <CAMMMRMc2t=0CNR4VPURNuKu0YGRdXqWhXAppgR8jNLoJ_TCYVw@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] usb: typec: Expose alternate mode priority via sysfs
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	=?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Pooja Katiyar <pooja.katiyar@intel.com>, 
	Johan Hovold <johan@kernel.org>, Hsin-Te Yuan <yuanhsinte@chromium.org>, Madhu M <madhu.m@intel.com>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 3:34=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi Andrei,
>
> Tue, Jan 13, 2026 at 01:05:32PM +0000, Andrei Kuchynski kirjoitti:
> > This patch introduces a priority sysfs attribute to the USB Type-C
> > alternate mode port interface. This new attribute allows user-space to
> > configure the numeric priority of alternate modes managing their prefer=
red
> > order of operation. If a new priority value conflicts with an existing
> > mode's priority, the priorities of the conflicting mode and all subsequ=
ent
> > modes are automatically incremented to ensure uniqueness.
> >
> > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > Reviewed-by: Benson Leung <bleung@chromium.org>
> > ---
> >  Documentation/ABI/testing/sysfs-class-typec | 11 +++
> >  drivers/usb/typec/class.c                   | 90 ++++++++++++++++++++-
> >  include/linux/usb/typec_altmode.h           |  1 +
> >  3 files changed, 101 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentatio=
n/ABI/testing/sysfs-class-typec
> > index 38e101c17a004..737b76828b509 100644
> > --- a/Documentation/ABI/testing/sysfs-class-typec
> > +++ b/Documentation/ABI/testing/sysfs-class-typec
> > @@ -162,6 +162,17 @@ Description:     Lists the supported USB Modes. Th=
e default USB mode that is used
> >               - usb3 (USB 3.2)
> >               - usb4 (USB4)
> >
> > +What:                /sys/class/typec/<port>/<alt-mode>/priority
> > +Date:                July 2025
> > +Contact:     Andrei Kuchynski <akuchynski@chromium.org>
> > +Description:
> > +             Displays and allows setting the priority for a specific a=
lternate mode.
> > +             The priority is an integer in the range 0-255. A lower nu=
merical value
> > +             indicates a higher priority (0 is the highest).
> > +             If the new value is already in use by another mode, the p=
riority of the
> > +             conflicting mode and any subsequent modes will be increme=
nted until they
> > +             are all unique.
>
> Greg already told you to show the range somehow with this, so the
> total number of (so far known?) alternate modes. Maybe something like
> <index> / <total_num_altmodes> ?
>

Thank you for the review, Heikki.

Greg asked me to define a range and document it. The range is 0 to 255.
I'm not sure if this range needs to be shown.
In our current userspace application, we strictly read/write 0/1 here.

> >  USB Type-C partner devices (eg. /sys/class/typec/port0-partner/)
> >
> >  What:                /sys/class/typec/<port>-partner/accessory_mode
> > diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> > index 0f12d6120511b..1fb5450c0a2f2 100644
> > --- a/drivers/usb/typec/class.c
> > +++ b/drivers/usb/typec/class.c
> > @@ -445,11 +445,88 @@ svid_show(struct device *dev, struct device_attri=
bute *attr, char *buf)
> >  }
> >  static DEVICE_ATTR_RO(svid);
> >
> > +static int increment_duplicated_priority(struct device *dev, void *dat=
a)
> > +{
> > +     if (is_typec_port_altmode(dev)) {
> > +             struct typec_altmode **alt_target =3D (struct typec_altmo=
de **)data;
> > +             struct typec_altmode *alt =3D to_typec_altmode(dev);
> > +
> > +             if (alt !=3D *alt_target && alt->priority =3D=3D (*alt_ta=
rget)->priority) {
> > +                     alt->priority++;
> > +                     *alt_target =3D alt;
> > +                     return 1;
> > +             }
> > +     }
> > +     return 0;
> > +}
> > +
> > +static int find_duplicated_priority(struct device *dev, void *data)
> > +{
> > +     if (is_typec_port_altmode(dev)) {
> > +             struct typec_altmode **alt_target =3D (struct typec_altmo=
de **)data;
> > +             struct typec_altmode *alt =3D to_typec_altmode(dev);
> > +
> > +             if (alt !=3D *alt_target && alt->priority =3D=3D (*alt_ta=
rget)->priority)
> > +                     return 1;
> > +     }
> > +     return 0;
> > +}
> > +
> > +static int typec_mode_set_priority(struct typec_altmode *alt, const u8=
 priority)
> > +{
> > +     struct typec_port *port =3D to_typec_port(alt->dev.parent);
> > +     const u8 old_priority =3D alt->priority;
> > +     int res =3D 1;
> > +
> > +     alt->priority =3D priority;
> > +     while (res) {
> > +             res =3D device_for_each_child(&port->dev, &alt, find_dupl=
icated_priority);
> > +             if (res) {
> > +                     alt->priority++;
> > +                     if (alt->priority =3D=3D 0) {
> > +                             alt->priority =3D old_priority;
> > +                             return -EOVERFLOW;
> > +                     }
> > +             }
> > +     }
> > +
> > +     res =3D 1;
> > +     alt->priority =3D priority;
> > +     while (res)
> > +             res =3D device_for_each_child(&port->dev, &alt,
> > +                             increment_duplicated_priority);
>
> Please align the code properly.
>

I will. Thanks for mentioning that.

> > +     return 0;
> > +}
> > +
> > +static ssize_t priority_store(struct device *dev,
> > +                            struct device_attribute *attr,
> > +                            const char *buf, size_t size)
> > +{
> > +     u8 val;
> > +     int err =3D kstrtou8(buf, 10, &val);
> > +
> > +     if (!err)
> > +             err =3D typec_mode_set_priority(to_typec_altmode(dev), va=
l);
> > +
> > +     if (!err)
> > +             return size;
> > +     return err;
>
> I know not everybody likes the ternary operator, but I would just
>
>         return err ?: size;
>

I like the ternary operator. But I might keep the current implementation.

Thanks,
Andrei
