Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5D81F9A89
	for <chrome-platform@lists.linux.dev>; Thu, 20 Feb 2025 13:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740058810; cv=none; b=jsEEbIza77LOzxm82dNv6FMZrgFZH7N+0Li2ag8i4qwBICYYu4UUJM7KvcC41rZD7Va31scK5WcOzMpndxUxI4FqdpvYWl0YF9pCpIHRwoqn4PmQ3KGNVP4aWf85fyNBjRXGK1wQ8bU9yxtsphPuABm2Ru3pZ0W6SbAPGZOnFiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740058810; c=relaxed/simple;
	bh=YHiEwZjQAEX3AGU4xj8gssFAfSoCb1JqMeq59o4wcrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=huulqyjIZMj+3+Vbfe+4MSub3w+8qMRA8H8QFslYjN/PnqO428pcLmXeRH51De68Md+QCPy0W0Cy/LH8aUvt3w4Ei3EQBp4HB1ppMPQbQ3rqxIRisTb8zEHypcjUDuTMliDIj6blKHWP5G31wD9HifE+Lg98rtOyzANhCrNPXII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BJyDQ0s/; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BJyDQ0s/"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2fc32756139so1465962a91.1
        for <chrome-platform@lists.linux.dev>; Thu, 20 Feb 2025 05:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740058808; x=1740663608; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ML1/0H9YV2GOwGv9BI0hsA2CQR0qo+3F7StWZRVvACg=;
        b=BJyDQ0s/VPNN1uKVTb8/9rCxh4df7F8ymWT+jWBHD5mZJHjgcHraiT5mo9J8K9iO3N
         jQMBiyO9l6anN2y4Yj9uZyGOu9RJATmVtE46R0GXgiu7zyYvlHtTnJuFXyRkM1C9ze4u
         M76W2WwOvh08rEUQ++C0B++gVGwjVblPHEkMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740058808; x=1740663608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ML1/0H9YV2GOwGv9BI0hsA2CQR0qo+3F7StWZRVvACg=;
        b=ppXQvSpUvwT9vL2JJL0vlNHdPyffvvesnKFykxFEo6x/0Pni+KVBvDQyzevaMQWPma
         aGMMCEbmyztk/cIeycpGDxfob8raz+JVZIeAmXAtNYogkmObz0OSBaKfgGmoLQLDp47A
         lY6av++xVTT4hB0s4PzFb4mr3YjtHXAIQfJYmWhDGyTDvKWtNI4LFZK17A0NVCp5iqfp
         fjHGRQ5/JDFSGDYwvNxfCEh6P/hrlXAg1Zn3R0M57oaLHidi7Jkc9oJD5Lr25xxzKARs
         cCAIB0pwT5wxZ7yWbzLmcXojLRN1QW1+drb+YIb+Od9HQGLB+EMdthtfqCZlp0looQ5G
         8Xng==
X-Forwarded-Encrypted: i=1; AJvYcCU0VKXo4PzR1LhMCpDJA+IbUkHLsttDMiAFZ3MaMlXwtJjQF6yHSZ/toiPkpALyFf3qgq2UHkRCzR29aTwrgdo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyyPhR3gpmhuQAgDrLZ/HCHwvbeoiIyQ/KFVaEWRwYItXBxX5lc
	tKHCPEQiHcMsED8e2M3J8msFIkf6lynGED188RoVSA9vBxgTEQxk/VpUrXxW6WMnq9cR2ulPhEP
	CgAcCTnnwdasyPJdQC/EihSfEjx7QiYccNztV
X-Gm-Gg: ASbGncvqxQs0/m6b5KJvw6uBlrfvcJrjd5yCGI+QAoiCPxd3MyEqHNHu+qovMH8c2f9
	peJ8tZKoICssYYAD9sc4cqMyJVgYLxCeWcD1oajrsVVSQvCgqQva3WzdZhKi5YF4isny6ZHW9LJ
	Qsx0W/b2OxKy632iPvo6/KBl0=
X-Google-Smtp-Source: AGHT+IEL5keA+PapFixcBrr6dT8RQR/4gBofNZ3DcuRjKbHdgZu0h93rSpNvZX8XRvTFUH8ttG3sMUe4HE8dka1DC4I=
X-Received: by 2002:a17:90b:1e09:b0:2fa:1451:2d56 with SMTP id
 98e67ed59e1d1-2fc41045074mr33941390a91.25.1740058808515; Thu, 20 Feb 2025
 05:40:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250210130419.4110130-1-akuchynski@chromium.org> <Z7SYg8HaSVx9QyH9@tzungbi-laptop>
In-Reply-To: <Z7SYg8HaSVx9QyH9@tzungbi-laptop>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Thu, 20 Feb 2025 13:39:57 +0000
X-Gm-Features: AWEUYZldFkmbJpsZ2rH52bgIzXaIk8HNEGPbISy_CZuCvZhPJJ9k0ZHwzqAkiuE
Message-ID: <CAMMMRMfYWqGEJDmMaPQFjQFeUhWJ4wVp-xy2TTdAhp3gRv-n8g@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Add support for setting
 USB mode via sysfs
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Prashant Malani <pmalani@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, chrome-platform@lists.linux.dev, 
	Jameson Thies <jthies@google.com>, =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2025 at 2:26=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Mon, Feb 10, 2025 at 01:04:19PM +0000, Andrei Kuchynski wrote:
> > +static int cros_typec_enter_usb_mode(struct typec_port *tc_port, enum =
usb_mode mode)
> > +{
> > +     struct cros_typec_port *port =3D typec_get_drvdata(tc_port);
> > +     struct ec_params_typec_control req =3D {
> > +             .port =3D port->port_num,
> > +             .command =3D (mode =3D=3D USB_MODE_USB4) ?
> > +                     TYPEC_CONTROL_COMMAND_ENTER_MODE : TYPEC_CONTROL_=
COMMAND_EXIT_MODES,
> > +             .mode_to_enter =3D CROS_EC_ALTMODE_USB4
>
> The symbol `CROS_EC_ALTMODE_USB4` doesn't exist.  On a related note, woul=
dn't
> it always enter CROS_EC_ALTMODE_USB4 if the value is hard-coded here?
>

CROS_EC_ALTMODE_USB4 is defined in drivers/platform/chrome/cros_ec_typec.h.
TYPEC_CONTROL_COMMAND_ENTER_MODE command will be sent only if
mode =3D=3D USB_MODE_USB4 because EC currently only supports entering USB4 =
mode.
Otherwise, TYPEC_CONTROL_COMMAND_EXIT_MODES is sent, and the mode_to_enter
field is irrelevant for this command.

> > @@ -84,6 +102,13 @@ static int cros_typec_parse_port_props(struct typec=
_capability *cap,
> >               cap->prefer_role =3D ret;
> >       }
> >
> > +     if (fwnode_property_present(fwnode, "usb2-port"))
> > +             cap->usb_capability |=3D USB_CAPABILITY_USB2;
> > +     if (fwnode_property_present(fwnode, "usb3-port"))
> > +             cap->usb_capability |=3D USB_CAPABILITY_USB3;
> > +     if (fwnode_property_present(fwnode, "usb4-port"))
> > +             cap->usb_capability |=3D USB_CAPABILITY_USB4;
>
> Are these defined somewhere?  E.g. the bindings?

Unfortunately, property names are set in the ACPI firmware in the same way.
