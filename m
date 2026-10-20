Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792487537;
	b=5VcLDCy1TeMrvADBFWkAWxozXu/02G5dwZFZeqwKDQQLeHdBZ/5hbbt6BDIlA2+gNNas
	 WbMBLyOyMGTce3ahADIKdjz9O6p/uBvgMVuOMSW4So39cz4gKaE+/ivLvvPl4NPc6hvf9
	 FJf8iwRqW4/YQz+fBUomVGp5aioSQkXESY3/+QwniUvNdPPeDrHjiyYcwxayflzwwVAL8
	 yzP7HI0MB0uISqxvLU9N547WocvFKzBCBVVHGkm4ndrgAT34LZjRPOuyCVDGAdUD2ntgO
	 uG67//EVIZHC4pgI2h7q9ihFC7WTQ+yAkuylVvqCVshKjGXl8HNipYzpuqNomRzmmMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+0miwbCIaCKh5q7AF0F/HV/CbvqoWL0JqaAGadHmiHg=;
	b=XwVnyiuOTrA3GsMOKM/8eoTCfvMDdkzeqmsbUyM/OCMyLL/+GJq1a38hyWI2rf+IhJHH
	 PIfxXv6XRNERgsQRHJVd7c3tFpfhx5DSza/JpB2ezt25N+oq43Cf7VwAzREdMXx3bxK0s
	 cXq7DNHwUX7NNOuVU8sdAfuF3moP7RRzEpLuaL5w9nn3izfoWW5y6qP73Q/xgt0csI8ce
	 uH63FUNd7x9nX5UHM6XhfoCuJHxKajT/hgRodjyfYsHIEE0e5AUZYiq2NllPfzHKhDb5B
	 autZ9+nOvgnoidC8yt4ZRFbrGKqOqBhSSuIdPxRG5hlUg6GPEoQJ0yLN7Aq61JxdfQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="IigO81X/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99B8606A31E
	for <chrome-platform@lists.linux.dev>; Tue, 20 Oct 2026 09:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E99B8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IigO81X/
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so1202615a91.1
        for <chrome-platform@lists.linux.dev>; Tue, 20 Oct 2026 02:12:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792487535; cv=none;
        d=google.com; s=arc-20260327;
        b=Mx0aQKjyQ0nMHZT81OLySeAr6TMOchm6fEgSFksCO1PEBwdi4A/EGq0QwLFG/0J3ek
         3FfOH7wD4D3pUbS8Fv/Jn7E/iLdqjoG7Ih2ah5shPA/eMQkPMVJb1PIBcWwvaLV/BbKq
         eAFIaA9My2LYvkIZ1ZQFnQoF0FwHb1fMMAi5lfBRx46j7VxoQTweebuCNedQFlF5aLEC
         NFOzjMbx3l91QXBrN1sTv74wXZA8BLQ3GaKWNUEF0pGijzCILoia26usBMecv1avt47A
         U94pW3DVayvJ4ZG0l8hpGt5Nwjh/oKRC7TKrgWshBk163o+8Ade7H4+j6U+ZvcNoQBGQ
         LWPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+0miwbCIaCKh5q7AF0F/HV/CbvqoWL0JqaAGadHmiHg=;
        fh=Dln6w95GhtdwM5/gnTqsIwc14Paf5jsiNoVcsxiWZeU=;
        b=bytjCibJh0g1U9i/+QSe+TC/pgYvDFGHU0dfR0oBl1zfNYoXrpuVm6JQALw4xSk1k3
         P8afmLjYsq91IhGaTA/J13JCB6G5Ma70G5MoSfB+1WHNTy/4qPe9+sw7BX0I9PZ9Ixil
         1ls7yL10VskGiKoRD8i1OO277veEXMkdIZHb0FQl8o7+e3KMSRwbk9I25oZxFpVtG5EA
         6UiWunUjrj6PfahZsWatEJWGxU/EOEfYv5bDCciqI4TccZLpOLk4lrJm9A18EeA8FV1i
         93DvDyDHFAN+Uw9DE1pU/rFC8zVEmNvGs/uPpEc7WIbC0Lanq0CRL1s55cLXAHsPAJrI
         6hNg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792487535; x=1793092335; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+0miwbCIaCKh5q7AF0F/HV/CbvqoWL0JqaAGadHmiHg=;
        b=IigO81X/a2r/ZiUKnSfcA5AZMIbrlDhCO/1KIqhLkkaD4H0XLDT3aBxGOC9W2R4juP
         q9Ptl+79CKic7s/IjW3Qf//4P6CuuUUqh9xEibh6nq1UYu+pYIUswsrpb0C/9X1BY0Ip
         3h1hxEMrHvCvkGCw0PYi/Yzk75tpqYOCqs+KY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792487535; x=1793092335;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+0miwbCIaCKh5q7AF0F/HV/CbvqoWL0JqaAGadHmiHg=;
        b=Hpat6AGvBiqMf9hsEM9TQz1cb+RQGwU7Ss1Ie6r54DixVJQbaEbMT31+GHfqmOtIbv
         bptnUgGv5ai5g0X5fB5imR4CnWGz5eYDLOQlgU8O9oXYhh8fJf5WQXsFTVNI2SC98rYO
         GvhvyQ7ODjmMfgK1YOZE5sqDpC+ivSi3eAT0kW106kQcG41KzFR+lA0IAuLbcd0g1qmv
         AXdxeQtje8WSJFBtWxvfX8M5LjvPAxjxb5kDGX5165Ihv9xTxQvE91Ub3tqsbjXw2NJ4
         Zi8L5ahpWO/j24i071xIfmopHApvw+jpWe8AP49rJesWD2P0Ae7Gyv4vpyduiAmgyHan
         Xqow==
X-Forwarded-Encrypted: i=1; AKwUvBxxfXqp68eXwpLPxFpG0Ww2CK7ftB4h7+LmrFpiaCtaxutOvry0Uogt5vOwW513Fy1JNZ//zfVByI5y5CKTP6c=@lists.linux.dev
X-Gm-Message-State: AFq9FYKiQbdsSjLo0zggkFUhAFzQknQdv84I1xm7Ylp8O8lvdpiEHauG
	dWsJuEhcQbB3KdST3+VC3GrEv8ixGFsfUERoUkzsTjx7qp0ryEqs3g+L4i4qs6yXt5AQ5e8On44
	+ZDuKkFXWC0OjtpceSH63PtQjQwNMGxRzyCiS+9j1H/1DbhC7swBd6yzT
X-Gm-Gg: AYBFou2JK1TV9JQ+RZ6txho2v/Gbd8mX2Xd2nZI/4jPm7IC4edo4BcxB6npcfnFbRPg
	0PI6WOb1qkcmLpD7bvj++rsb+DYzsG7lra9A7mSFw4CqWd73KqgWXQ6zzTXuvKINZG6ZZJKt3gy
	qHZ3y+OysSOgpktVwM2bmFkV+v5Ji0fsNt/R8pwhdkAmvA/j6j3EBz8sJ1sdFb3pKGO4FURoPfP
	kssJIdVk6YPq2KpjcPIaH5PXVu1n/XeYCrdbJ0+pqjtxppaxd7c694sS8WRtd5/0EDc9VdHUz/F
	/6oyuvpOX97Zv8nA6HFZ8FGJyJo150DMhPkON+NAqQdjlOZ/coZ3JymDSHZj4xo8vT6c+Ol+etv
	3JSDz83CkNIrSn2gobrehh7az+1NqQeN8dmk2MfF3/0t10ZvxPl2mlf+cD3vKvijrTfs5gFu7vV
	Etoa98pHbkQ6Y4riae
X-Received: by 2002:a17:90a:e7ca:b0:3a0:a912:e759 with SMTP id
 98e67ed59e1d1-3acef13520emr9447751a91.25.1792487535269; Tue, 20 Oct 2026
 02:12:15 -0700 (PDT)
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261008134056.3816556-1-akuchynski@chromium.org>
 <20261008134056.3816556-2-akuchynski@chromium.org> <atDD1RHZylPRZtP8@google.com>
In-Reply-To: <atDD1RHZylPRZtP8@google.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Tue, 20 Oct 2026 11:12:03 +0200
X-Gm-Features: AclHuK9IYpMzXWdPe6Jo19INJMjEcYp-ZRO8wDzzMHxFoGJh5R845Ed5okhpKjk
Message-ID: <CAMMMRMd6qd7-kBEOs8L2f4u_Pd9WbDc0dwM1MD2mrKTN9CzPEQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] platform/chrome: cros_ec_typec: Enforce
 priority-based mode selection
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jameson Thies <jthies@google.com>, Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 2:15=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Thu, Oct 08, 2026 at 01:40:55PM +0000, Andrei Kuchynski wrote:
> > diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform=
/chrome/cros_ec_typec.c
> ...
> > +/* Delay between mode entry/exit attempts, ms */
> > +static const unsigned int mode_selection_delay =3D 1000;
> > +/* Timeout for a mode entry attempt, ms */
> > +static const unsigned int mode_selection_timeout =3D 4000;
>
> Couldn't they be macros?

It is implemented as variables in cros_ec_ucsi.c, but they could be macros.
I will change this in v3.

>
> > @@ -421,7 +427,6 @@ static int cros_typec_register_port_altmodes(struct=
 cros_typec_data *typec,
> >               memset(&desc, 0, sizeof(desc));
> >               desc.svid =3D USB_TYPEC_TBT_SID;
> >               desc.mode =3D TBT_MODE;
> > -             desc.inactive =3D true;
>
> Why this is removed?  Per 1aede0698167 ("platform/chrome: cros_ec_typec:
> Disable tbt on port"), it disables entering TBT mode automatically.

If the ap_driven_altmode parameter is enabled, automatic activation of
both TBT and DP will be disabled via the mode_selection field. Consequently=
,
deactivating TBT via the inactive field is no longer necessary.
Alternative mode drivers within cros_ec_typec are no longer needed to
trigger activation.

>
> > @@ -940,6 +952,31 @@ static int cros_typec_register_altmodes(struct cro=
s_typec_data *typec, int port_
> >               goto err_cleanup;
> >       }
> >
> > +     /* Once all partner alt-modes are added, we should also trigger
> > +      * mode selection.
> > +      */
>
> For multiple line comments:
>
>     /*
>      * Once ...
>

Thanks, I will fix the comment formatting.

> > +     if (is_partner && typec->ap_driven_altmode) {
> > +             bool usb4_mode =3D (port->caps.usb_capability & USB_CAPAB=
ILITY_USB4) &&
> > +                     (PD_VDO_UFP_DEVCAP(port->p_identity.vdo[0]) & DEV=
_USB4_CAPABLE);
> > +
> > +             if (usb4_mode) {
> > +                     ret =3D cros_typec_enter_usb_mode(port->port, USB=
_MODE_USB4);
> > +                     if (ret < 0) {
> > +                             usb4_mode =3D false;
> > +                             dev_err(typec->dev,
> > +                                     "Unable to activate USB4 mode, po=
rt: %d\n", port_num);
> > +                     }
> > +             }
> > +             if (!usb4_mode) {
> > +                     ret =3D typec_mode_selection_start(port->partner,
> > +                                                      mode_selection_d=
elay,
> > +                                                      mode_selection_t=
imeout);
> > +                     if (ret < 0)
> > +                             dev_err(typec->dev,
> > +                                     "Unable to run mode selection, po=
rt: %d\n", port_num);
>
> Wouldn't it need to go to err_cleanup and return the ret?  Or, if they
> aren't considered as errors, dev_warn().

dev_warn() then. We definitely don't need an error path here.

>
> > diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/pla=
tform/chrome/cros_typec_altmode.c
> > index 66c546bf89b53..116329dd113f8 100644
> > --- a/drivers/platform/chrome/cros_typec_altmode.c
> > +++ b/drivers/platform/chrome/cros_typec_altmode.c
> > @@ -41,12 +41,16 @@ static void cros_typec_altmode_work(struct work_str=
uct *work)
> >  {
> >       struct cros_typec_altmode_data *data =3D
> >               container_of(work, struct cros_typec_altmode_data, work);
> > +     int ret;
> >
> >       mutex_lock(&data->lock);
> >
> > -     if (typec_altmode_vdm(data->alt, data->header, data->vdo_data,
> > -                           data->vdo_size))
> > +     ret =3D typec_altmode_vdm(data->alt, data->header, data->vdo_data=
,
> > +                             data->vdo_size);
> > +     if (ret) {
> >               dev_err(&data->alt->dev, "VDM 0x%x failed\n", data->heade=
r);
> > +             typec_altmode_state_update(data->port->partner, data->sid=
, ret);
> > +     }
>
> Wouldn't it need to update the state even if !ret?

No. The typec_altmode_state_update() reports whether the activation of
altmode has been completed or has failed.
If successful, typec_altmode_state_update() will be called from within
cros_typec_configure_mux().

Thanks,
Andrei
