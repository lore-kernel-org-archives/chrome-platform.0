Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C112226AA83
	for <chrome-platform@lists.linux.dev>; Thu, 21 Aug 2025 14:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755786012; cv=none; b=dKfa4R+mS90Q/7nnI41WVWpJCWf4GNBdFwpmRZ47SIKjx4efhGCFZ6KwEEeKlR52fbdYhNN+jUOw3mHIrp+ay3M0cY316vvrNcP17rTtF+1AuwkqGsBHZk6iIWt/Pd+JNosD5IXW8um+15TiRO8A8bAKwYd6MilRMBPJhOkAtmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755786012; c=relaxed/simple;
	bh=1TGQbSNXcYAwYgKdfFoYVGYgfusyVauvVnseKMDM9gU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d3X427nfapVRKOxIeKw4cZgVEHKmJU6VTHp0Em03IfVLcboJbB9mGkXrQKI/zV/CgfWbh7/7WfX0E5kKfiLvObUfjJg27ZcE2KqvLClDsQ4QkqZFpFFCDfbAslBO1BXP6rc/BAVeI9s4t2pzQnWuuwbrnbvgcK890ZiNck670Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JyiSg5fX; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JyiSg5fX"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-323266b1d1aso764947a91.0
        for <chrome-platform@lists.linux.dev>; Thu, 21 Aug 2025 07:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755786009; x=1756390809; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdSdCc6sEwtZ8z33Ieo6BIkuzQuw7IgeQtd7fNjTH7I=;
        b=JyiSg5fXjRQzq6WTRfKhrsdpMCJ43P8LQwC4Q9hzxbOoI2xW+VU2KdfDE5Q7OT+00z
         9JwYtpIytWgBHNXE1/+ySRmJMq59FYmX9lYUuhVgwo6qcZyOkw0iGrGPxpu4r8Hlmtz6
         ttCjV43A2c2U7kGnxKapLT6laFUJ5dKx5YcpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755786009; x=1756390809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vdSdCc6sEwtZ8z33Ieo6BIkuzQuw7IgeQtd7fNjTH7I=;
        b=OML0XkkXY15M9kBxF3elMI7WPuKUpdYMteC//Ww5YMRgGb+lkwPyBn4iwXJirn99/x
         Qd3JfU75rIpA/QLpZEVRsX18Wz+QV8scXZmau3pfb3LMB4xBIMITKZBlB6v6mCAr1auA
         5wq+W/X9t6qJXkHgFxMNjIleAKDW0K6usei3/vqwIILJNSct2SBKfP9YSLQu1fHrO6hr
         WUZ04jLeNSdPBejKvtFnq0petDCGKrPiOzwCqt4kpzl/jqI8B1rONAaZ6xaoVVLJAUVW
         5/TLV8GexjsojGiPm4oXX6QxNAJtYlUF8HUCOCmEbO6uibezjsTPCWRveEF62a9iDVFi
         rwwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXytvugvgJEn0oVzpuoFr+jIaw2tYbO7eqsbXbSWOeunpJp8nWrSfALMQx/l2ad/MWwE3E3amXGny97BC1liP4=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywi4pYPJSlVq52gw88ju9jAUoJf1bCpEmtJOspSqA1tl360MHRo
	a/lbzAVkY44EGO+crHcUIykAVfugrn0i9RVu0s6PBJFnBHwb8tZn9m9sCZ34Us+AYuhZ4hVjl9I
	Hlm8dwv1W7hE6J+mECSMFcG9l1vMZVpaE4SH5vr4o
X-Gm-Gg: ASbGncuVO+eHQoKM+CdaID+leaXY5wqRR+rFOUe7S/av3cc/WpHy6iCv94Ku86l20je
	l0gZO8PX6bCEtGSoeHLvh/slD7jj2CHH8X6mQEVjOe4JRBHd3p2DLhNhKuXlXpRW8an+16PbCZ8
	Xyuqc8z880N3jrhzPWYlk5aHQyeML/wbO0+AGpUwYJ8zMTIeyJCi9TnUYvPIKQDsqrr98faRwc8
	jIsV26p4B33cBVub14AoC9hyndi5kvWPgRE29LilBcJwxqDNQ6Obg==
X-Google-Smtp-Source: AGHT+IEM3XPbTHByoiCZun4dj8efSaZNwLp3Hlum29XsE5UAtKvi/jloqwgDc44XSZWztVSVyI1iCjK2uhPpPIo+vP8=
X-Received: by 2002:a17:90b:3bc5:b0:321:4182:2b9e with SMTP id
 98e67ed59e1d1-324ed09612emr4228539a91.12.1755786008932; Thu, 21 Aug 2025
 07:20:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250814184455.723170-1-akuchynski@chromium.org>
 <20250814184455.723170-2-akuchynski@chromium.org> <aKWpI0RhPR2mFlql@kuha.fi.intel.com>
In-Reply-To: <aKWpI0RhPR2mFlql@kuha.fi.intel.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Thu, 21 Aug 2025 16:19:56 +0200
X-Gm-Features: Ac12FXxNBZ21VY5QqnSzQ4sZ97eKb-66iED2WdLpg2CP9xg85i8cPERoB_qk5SE
Message-ID: <CAMMMRMeqAToQ=iAjLrT64q3g+e_K_3Mqp4uh3LNnULMTJeY-iw@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] usb: typec: Add alt_mode_override field to port property
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, "Christian A. Ehrhardt" <lk@c--e.de>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 12:53=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Thu, Aug 14, 2025 at 06:44:51PM +0000, Andrei Kuchynski wrote:
> > This new field in the port properties dictates whether the Platform Pol=
icy
> > Manager (PPM) allows the OS Policy Manager (OPM) to change the currentl=
y
> > active, negotiated alternate mode.
> >
> > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > ---
> >  drivers/usb/typec/class.c | 14 +++++++++++---
> >  drivers/usb/typec/class.h |  2 ++
> >  include/linux/usb/typec.h |  1 +
> >  3 files changed, 14 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> > index 67a533e35150..a72325ff099a 100644
> > --- a/drivers/usb/typec/class.c
> > +++ b/drivers/usb/typec/class.c
> > @@ -459,9 +459,16 @@ static umode_t typec_altmode_attr_is_visible(struc=
t kobject *kobj,
> >       struct typec_altmode *adev =3D to_typec_altmode(kobj_to_dev(kobj)=
);
> >
> >       if (attr =3D=3D &dev_attr_active.attr)
> > -             if (!is_typec_port(adev->dev.parent) &&
> > -                 (!adev->ops || !adev->ops->activate))
> > -                     return 0444;
> > +             if (!is_typec_port(adev->dev.parent)) {
> > +                     struct typec_partner *partner =3D
> > +                             to_typec_partner(adev->dev.parent);
>
> That looks a bit unnecessary. Also, can't the altmode be a plug alt mode?
>
> > +                     struct typec_port *port =3D
> > +                             to_typec_port(partner->dev.parent);
> > +
> > +                     if (!port->alt_mode_override || !adev->ops ||
> > +                             !adev->ops->activate)
> > +                             return 0444;
> > +             }
>
> How about:
>
>         struct typec_altmode *adev =3D to_typec_altmode(kobj_to_dev(kobj)=
);
>         struct typec_port *port =3D typec_altmode2port(adev);
>
>         if (attr =3D=3D &dev_attr_active.attr) {
>                if (!is_typec_port(adev->dev.parent)) {
>                         if (!port->alt_mode_override || !adev->ops || !ad=
ev->ops->activate)
>                                 return 0444;
>                 }
>         }
>

I completely missed typec_altmode2port function.
Thank you!

> >       return attr->mode;
> >  }
> > @@ -2681,6 +2688,7 @@ struct typec_port *typec_register_port(struct dev=
ice *parent,
> >       }
> >
> >       port->pd =3D cap->pd;
> > +     port->alt_mode_override =3D cap->alt_mode_override;
>
> This needs to be enabled by default:
>
>         port->alt_mode_override =3D !cap->no_mode_control;
>

Agreed.  I'll make it enabled by default.

> >       ret =3D device_add(&port->dev);
> >       if (ret) {
> > diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
> > index db2fe96c48ff..f05d9201c233 100644
> > --- a/drivers/usb/typec/class.h
> > +++ b/drivers/usb/typec/class.h
> > @@ -80,6 +80,8 @@ struct typec_port {
> >        */
> >       struct device                   *usb2_dev;
> >       struct device                   *usb3_dev;
> > +
> > +     bool                            alt_mode_override;
>
> s/alt_mode_override/mode_control/ ?
>

Agreed. mode_control is a clearer name.

Thank you for your review!


Andrei
