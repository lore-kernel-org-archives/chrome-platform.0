Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619212D594F
	for <chrome-platform@lists.linux.dev>; Wed, 10 Sep 2025 19:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757532908; cv=none; b=FZBb0wM+Xid8MRD4wexnYT+AzgvV/iRUG5IK6iQdtq3PTeL/Xk8vDdVHO3lmy6G1EHgFE0MTeM3c9iHimCr1Z1ZVyccdS2bqRCj7Dt5TBkQt/HHYtGr3hwxqtmQHSLvef7bht3u0yJdSVdB6F+lq4hAbCfcU5cLgbRfV82ZS6TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757532908; c=relaxed/simple;
	bh=CsZgHZkr4tn7L9FbK2mdWISDN6hWIqOwGACNjs21v8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n2jDHlNC5D5I5ZUXuktrTSCygRLBUc4uzwrQ/29rmFkeqQVysy5YQSMpUsiweMZEHPKmkuyRIzh14nHTmgmm8kRJp7DWmFaKI4nrlNbUPy38VDF9nH7cMGrTnsVIfisjmlLm0D6FjHr9FxFu07ox0WXGHkmwBHOUqP0q8R4EsAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KyYDmkoq; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KyYDmkoq"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b4fb8d3a2dbso4743112a12.3
        for <chrome-platform@lists.linux.dev>; Wed, 10 Sep 2025 12:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757532907; x=1758137707; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zaN2dDw0Si752HU39sC2oh3UCwyC8xRttQsbnNuAuQ0=;
        b=KyYDmkoq4rqz+i+r/lyYV7dJiK432oTozf0gut9AlxDcbWz4Vr49u8yWCALc4IA7tK
         r6lvOdyV+oCa//vDh/FUmVFTckKS6Vci1j3Li3PkGdVm/or48HZS2ELu7/ZbwwDrKz1T
         pwV11Mk3gdyXo5CqA4xKWp2gLRU50AyQnXR30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757532907; x=1758137707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zaN2dDw0Si752HU39sC2oh3UCwyC8xRttQsbnNuAuQ0=;
        b=nlBPJdXnbKw4vwRTVZNIjyOtQNPg7Hm8mDCom1PIZbUxlWTaePMYYqj7AovzJimJzR
         0IYzz/ldWB+cAEukDQ9yAUVRf+sMaibDnGU+Fo7XTZ3hj0sLUcBQbv04KjzePgpCE6uI
         PFQFz1YBqdN2rMFdsu1FNKGQOUszJ/pamGAW4mp0/DWpcVs3AzoOX6LZEM7njWrW47XW
         CNzGlk5RPA45P2sCVmU4JxKUchhEkleaRtUrDxcD5cyPslOFHPCnsXOWsZGsaZR5HTa+
         92lc1Qr2VqyrTlNncORrVttHzAcFvh164BdnFxtuq+KssRMDFSbstj8YTrE4Bfxd3av4
         45FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgmjdWWA35SZegiTUapRZFxNNYw6ziVZBPt/puu1Buay2gM2qYu9vCzqPM9RCnFQiyiLh0nLt2W9BUzrFqh38=@lists.linux.dev
X-Gm-Message-State: AOJu0YzAJwh5L++K1LBJMa+pj97fWfr6AYHt+m2TZBCIiohTK5O3Azfh
	q17s6/L+XTQxO4O1zRd96NrdVQcP419Qgze0nseSoRYDDBPBvac4SqYMC0g7i7FKwRgGVFuZR9X
	H/pJfKXLDi6a4qOQlg093cdj6tjUhMF0Ib/D6azll
X-Gm-Gg: ASbGncusfgn2OCYkmBS/oHfZkfmg0LpFJsgL9jp0K9AH4h08Wv7wLGEEv9aDpBHE3l0
	l1T5KuR/t+kbIclv6BcSSw5aNs0FBtMMxvufsWbePvP7NDsuPNjjr2SBTM3uazdqEv7He7UPiZD
	DcS0O/AySUmat7jbxq6C0EsTiVRt1ufCnraymY2Ldk/AV3gVQAHUmrISPyiZJHGQJ9QpwTHuvUR
	V6fQ8Y3xaP+lZPGrENuM9a6GZuwZyGfiivHKxCCAQ9A4Q==
X-Google-Smtp-Source: AGHT+IHcU/z69xvrbw57LzdGyVMdV8NdA7YqwzpxDCURSyY8jW/b/eLvZUrXOdxkZd3mY3GdzlFaYXFYXK/MVdtoUuA=
X-Received: by 2002:a17:903:1cd:b0:24b:270e:56f0 with SMTP id
 d9443c01a7336-25173118c26mr237438225ad.29.1757532906699; Wed, 10 Sep 2025
 12:35:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250905142206.4105351-1-akuchynski@chromium.org>
 <20250905142206.4105351-2-akuchynski@chromium.org> <2025091018-slather-dispose-015d@gregkh>
In-Reply-To: <2025091018-slather-dispose-015d@gregkh>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Wed, 10 Sep 2025 19:34:55 +0000
X-Gm-Features: Ac12FXwfN-e75qxmficq3kKl06l1JoLVbDE-L4oJXX6Yd_sZeBHeIpXc0h2q7D8
Message-ID: <CAMMMRMcqty7dC=UvwNZX90iVMnJATTPWYTf1fiee5_OoKfxSJA@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] usb: typec: Add mode_control field to port property
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, "Christian A. Ehrhardt" <lk@c--e.de>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 1:30=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Sep 05, 2025 at 02:22:02PM +0000, Andrei Kuchynski wrote:
> > This new field in the port properties dictates whether the Platform Pol=
icy
> > Manager (PPM) allows the OS Policy Manager (OPM) to change the currentl=
y
> > active, negotiated alternate mode.
> >
> > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > ---
> >  drivers/usb/typec/class.c | 9 ++++++---
> >  drivers/usb/typec/class.h | 2 ++
> >  include/linux/usb/typec.h | 2 ++
> >  3 files changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> > index 67a533e35150..9f86605ce125 100644
> > --- a/drivers/usb/typec/class.c
> > +++ b/drivers/usb/typec/class.c
> > @@ -457,11 +457,13 @@ static umode_t typec_altmode_attr_is_visible(stru=
ct kobject *kobj,
> >                                            struct attribute *attr, int =
n)
> >  {
> >       struct typec_altmode *adev =3D to_typec_altmode(kobj_to_dev(kobj)=
);
> > +     struct typec_port *port =3D typec_altmode2port(adev);
> >
> >       if (attr =3D=3D &dev_attr_active.attr)
> > -             if (!is_typec_port(adev->dev.parent) &&
> > -                 (!adev->ops || !adev->ops->activate))
> > -                     return 0444;
> > +             if (!is_typec_port(adev->dev.parent)) {
> > +                     if (!port->mode_control || !adev->ops || !adev->o=
ps->activate)
> > +                             return 0444;
> > +             }
> >
> >       return attr->mode;
> >  }
> > @@ -2681,6 +2683,7 @@ struct typec_port *typec_register_port(struct dev=
ice *parent,
> >       }
> >
> >       port->pd =3D cap->pd;
> > +     port->mode_control =3D !cap->no_mode_control;
> >
> >       ret =3D device_add(&port->dev);
> >       if (ret) {
> > diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
> > index db2fe96c48ff..c53a04b9dc75 100644
> > --- a/drivers/usb/typec/class.h
> > +++ b/drivers/usb/typec/class.h
> > @@ -80,6 +80,8 @@ struct typec_port {
> >        */
> >       struct device                   *usb2_dev;
> >       struct device                   *usb3_dev;
> > +
> > +     bool                            mode_control;
>
> Shouldn't this go up higher in this structure, to avoid the hole you
> created, and to take advantage of the existing hole?  Perhaps after
> orientation?
>

I will replace the variable.

Thanks,
Andrei
