Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F353A19413C
	for <chrome-platform@lists.linux.dev>; Mon, 18 Nov 2024 11:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731928712; cv=none; b=AGDgrJk1YyPFKpWba2jnOB0E4HYj+gFMIcd/ujCbJMC4juiJ6NnZ/OeHt2AgolXoHdaoKNqWaV8lLOxhzg5yGLmYtFfMN+cAorydvFZLUCkgJjplq05YwsDUYylS2Vx8NYSDSDflRjh/oI3vBlHRW21JroYvV9ZNzfp+ASeQLjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731928712; c=relaxed/simple;
	bh=ZGIhe8xusgzvwSFz+jUB1irbOzMJHGPp+onr5lsnVtg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JCrUnE0NTzlDh91vViKyMkhgv6kg5qedXqCRFz1Crmj+Y7XYZxWAQuSAK53wGGlSVtkmzf07pq2wSokEDuPE8besbp8RTwfims4qQNMLi0djvIZYnTMFMG2rtZ4JHScn0jVUuptlXLzETn2or33Gjhb6pyOGns+JhHH0qaCpkHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=g8LYgp7v; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="g8LYgp7v"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539f8490856so3022337e87.2
        for <chrome-platform@lists.linux.dev>; Mon, 18 Nov 2024 03:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731928709; x=1732533509; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5eZYuS229f+THP5IvlrHUv+ubqkbKYI8d08SCtRwUto=;
        b=g8LYgp7vGnIxDC0CnOCAarRFRDBWloPdn56wRdCiayhqEDrCxlcZnybe5gbMUAZAH8
         Cc8z0KQp1C9mnOmwvlIpFZKNMQWZzaTKxF07g/37A+F+Q9evfGipDAnzkDCuPzUgC5vZ
         w9v5P29t9ZIAm9x4KOI5rQUe7mpDRTN4uCqwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731928709; x=1732533509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5eZYuS229f+THP5IvlrHUv+ubqkbKYI8d08SCtRwUto=;
        b=Gk0idNoueNy/LC4OMILeD2RAoPt3+fiAHKyed8aNUB5pjMrtAvJRH9iy/QeeGJh/YV
         H4IaeV+P4HHiqBqx0h569/IOOwKh0wmp3FSiizQYl4IugFkUf8b90MN8T4yL8hpUZosO
         AgjNGDTjQiWPP74yuIADsz/FQ8RJeKBZQQtu3RpYSq/RyNHl7TUFrBG535MQv+bUtoxJ
         39XIsV75LfjrslE92fjXvhbawBNPC4nZROSIQ6NabYx9wMuQqdGOCT+rznmpmxlgMtT4
         4r3WTGfqoz8xa3QKHpXvA5uAyRy9F3YAul21HcEjTya6QiQ5lOUHVGJm/NCr3HYHVeMF
         ut/g==
X-Forwarded-Encrypted: i=1; AJvYcCWlb12izICUrUMxWuYHl9Hc7bOEBUyWNJJzdvZBUL5k1UvoGBy+oOJMPLs2go/2vLd1VnbNxrtkX6e6fri8lSI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzeK4T5fGX5bJ6B/UwroIl1CSE0Rlikskn0Htdz6HsFnKOg9qre
	uYV6FfdPR2nI1wKrfIf1/sGzcMitW/iH1nyBr0KB7a9PkiAstUAXrgcQj+aqgyFHgpuAdHitCt1
	VbsH5HHDc5qBIjR/ZVBuhDFPEGAfMKeuXavk=
X-Google-Smtp-Source: AGHT+IFkJ85OQjVPqi3f79lpLk46OcG59EwbnaVLX/swNpcI9CwUfyzApyQSNqW5vYoIkuInnT8brnszIe1gc3mKgxQ=
X-Received: by 2002:a19:5f03:0:b0:53d:abc8:b6d7 with SMTP id
 2adb3069b0e04-53dabc8b729mr3828087e87.7.1731928709128; Mon, 18 Nov 2024
 03:18:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241115155234.1587589-1-ukaszb@chromium.org> <20241115155234.1587589-3-ukaszb@chromium.org>
 <jatq645z65hthaud4up6h6mxbggqpm73djtd6t3fxxkwccsifu@bb7bn24b7dak>
 <CALwA+NZ16WigkZuTwsRzDNC96OOR=+ZA-_UxtMq=fTWJ23a_Ag@mail.gmail.com>
 <CAA8EJprRQuXtGwiDeOiS56Nq=RW3p82-LTWGt8RervqGwP-=Vw@mail.gmail.com>
 <CALwA+NbUCstuayfm3ag-mBBRus1y-RM53auVFfffE_1OcW2zzA@mail.gmail.com> <CAA8EJppJ6FKDRvZg0WHk7+uygFTUDKqBnx0swQ=A_E7WiUQUdA@mail.gmail.com>
In-Reply-To: <CAA8EJppJ6FKDRvZg0WHk7+uygFTUDKqBnx0swQ=A_E7WiUQUdA@mail.gmail.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Mon, 18 Nov 2024 12:18:17 +0100
Message-ID: <CALwA+Nbdah1SML92GPtsYmVKmPzTLTGSu1kuphp+PDGuERT27A@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] usb: typec: ucsi: Implement ChromeOS UCSI driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Pavan Holla <pholla@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2024 at 12:08=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, 18 Nov 2024 at 12:38, =C5=81ukasz Bartosik <ukaszb@chromium.org> =
wrote:
> >
> > On Mon, Nov 18, 2024 at 11:21=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Mon, 18 Nov 2024 at 12:10, =C5=81ukasz Bartosik <ukaszb@chromium.o=
rg> wrote:
> > > >
> > > > On Fri, Nov 15, 2024 at 6:00=E2=80=AFPM Dmitry Baryshkov
> > > > <dmitry.baryshkov@linaro.org> wrote:
> > > > >
> > > > > On Fri, Nov 15, 2024 at 03:52:33PM +0000, =C5=81ukasz Bartosik wr=
ote:
> > > > > > From: Pavan Holla <pholla@chromium.org>
> > > > > >
> > > > > > Implementation of a UCSI transport driver for ChromeOS.
> > > > > > This driver will be loaded if the ChromeOS EC implements a PPM.
> > > > > >
> > > > > > Signed-off-by: Pavan Holla <pholla@chromium.org>
> > > > > > Co-developed-by: Abhishek Pandit-Subedi <abhishekpandit@chromiu=
m.org>
> > > > > > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.=
org>
> > > > > > Co-developed-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > > > > > Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > > > > > ---
> > > > > >  MAINTAINERS                           |   7 +
> > > > > >  drivers/usb/typec/ucsi/Kconfig        |  13 ++
> > > > > >  drivers/usb/typec/ucsi/Makefile       |   1 +
> > > > > >  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 248 ++++++++++++++++++=
++++++++
> > > > > >  4 files changed, 269 insertions(+)
> > > > > >  create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi.c
> > > > >
> > > > > > +static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd)
> > > > > > +{
> > > > > > +     return ucsi_sync_control_common(ucsi, cmd);
> > > > > > +}
> > > > > > +
> > > > > > +struct ucsi_operations cros_ucsi_ops =3D {
> > > > > > +     .read_version =3D cros_ucsi_read_version,
> > > > > > +     .read_cci =3D cros_ucsi_read_cci,
> > > > > > +     .read_message_in =3D cros_ucsi_read_message_in,
> > > > > > +     .async_control =3D cros_ucsi_async_control,
> > > > > > +     .sync_control =3D cros_ucsi_sync_control,
> > > > >
> > > > > .sync_control =3D ucsi_sync_control_common,
> > > > >
> > > >
> > > > I will change.
> > > >
> > > > > > +};
> > > > > > +
> > > > >
> > > > > [...]
> > > > >
> > > > > > +
> > > > > > +static int __maybe_unused cros_ucsi_suspend(struct device *dev=
)
> > > > > > +{
> > > > > > +     struct cros_ucsi_data *udata =3D dev_get_drvdata(dev);
> > > > > > +
> > > > > > +     cancel_work_sync(&udata->work);
> > > > > > +
> > > > > > +     return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static void __maybe_unused cros_ucsi_complete(struct device *d=
ev)
> > > > > > +{
> > > > > > +     struct cros_ucsi_data *udata =3D dev_get_drvdata(dev);
> > > > > > +
> > > > > > +     ucsi_resume(udata->ucsi);
> > > > > > +}
> > > > > > +
> > > > > > +static const struct dev_pm_ops cros_ucsi_pm_ops =3D {
> > > > > > +#ifdef CONFIG_PM_SLEEP
> > > > > > +     .suspend =3D cros_ucsi_suspend,
> > > > > > +     .complete =3D cros_ucsi_complete,
> > > > > > +#endif
> > > > >
> > > > > SET_SYSTEM_SLEEP_PM_OPS ? Or even better, DEFINE_SIMPLE_DEV_PM_OP=
S() ?
> > > > >
> > > > > What is the reason for using complete() instead of resume()?
> > > > >
> > > >
> > > > Due to change in
> > > > https://lore.kernel.org/linux-usb/20240910101527.603452-1-ukaszb@ch=
romium.org/T/#m25bc17cc0a8d30439830415018c7f44f342900d1
> > > > we moved from using macro SIMPLE_DEV_PM_OPS and resume() to complet=
e().
> > > > Per Heikki's suggestion I also squashed this change into "usb: type=
c:
> > > > ucsi: Implement ChromeOS UCSI driver".
> > >
> > > Neither original patch, nor this one document, why this is necessary
> > >
> >
> > The https://lore.kernel.org/linux-usb/20240910101527.603452-1-ukaszb@ch=
romium.org/T/#m25bc17cc0a8d30439830415018c7f44f342900d1
> > commit messages says:
> > "On platforms using cros_ec_lpc, resume is split into .resume_early
> > and .complete.
> > To avoid missing EC events, use .complete to schedule work when resumin=
g."
> >
> > I will add this as a comment on top of cros_ucsi_pm_ops struct.
> > Do you find it sufficient ?
>
> IMHO, no
>

Ok. If you please tell me what is not clear or missing in this
explanation in your opinion
then I will update it.

Thanks,
Lukasz

> >
> > Thanks,
> > Lukasz
> >
> > > >
> > > > Thank you,
> > > > Lukasz
> > > >
> > > > > > +};
> > > > > > +
> > > > > > +static const struct platform_device_id cros_ucsi_id[] =3D {
> > > > > > +     { KBUILD_MODNAME, 0 },
> > > > > > +     {}
> > > > > > +};
> > > > > > +MODULE_DEVICE_TABLE(platform, cros_ucsi_id);
> > > > > > +
> > > > > > +static struct platform_driver cros_ucsi_driver =3D {
> > > > > > +     .driver =3D {
> > > > > > +             .name =3D KBUILD_MODNAME,
> > > > > > +             .pm =3D &cros_ucsi_pm_ops,
> > > > > > +     },
> > > > > > +     .id_table =3D cros_ucsi_id,
> > > > > > +     .probe =3D cros_ucsi_probe,
> > > > > > +     .remove =3D cros_ucsi_remove,
> > > > > > +};
> > > > > > +
> > > > > > +module_platform_driver(cros_ucsi_driver);
> > > > > > +
> > > > > > +MODULE_LICENSE("GPL");
> > > > > > +MODULE_DESCRIPTION("UCSI driver for ChromeOS EC");
> > > > > > --
> > > > > > 2.47.0.338.g60cca15819-goog
> > > > > >
> > > > >
> > > > > --
> > > > > With best wishes
> > > > > Dmitry
> > >
> > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
>
>
> --
> With best wishes
> Dmitry
