Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC31D196C6C
	for <chrome-platform@lists.linux.dev>; Mon, 18 Nov 2024 11:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731928128; cv=none; b=bJ5YEOoMgPX96ApkShryQwvFUkvZDySWT1hQOpVa5N1OJWtxGU4lIAWRMHziWBAk+PWipKEtPu/UpFMVUHTy8KRI6/5pufSHMVcvjowVPsGtUVHaHy/G+qvPUrQxoMjo1S7FcPurkuf6ShlPPps5vZr/DpBhM7PzNBBU69TGEH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731928128; c=relaxed/simple;
	bh=GIGXLhpGYFJ36e482ZkI73T6d/fnt2kKm19d0EnGvps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O25ZCjw1jDtEafbzhvSGb4dBMNX33jjdnkK8W3KqV7NgZB+iBBwSXYYI6QwnfhjwMMbSkeBacJmBHuX7r5d74qRmJbLOHwo+duWpivkVIDSUliGs01iWNVIwuMhgD67zuB5HqupMkAJ7vQGuBDf0E5S2X1qoSMaDhwoZ1wdIvv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=drhkN6yQ; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="drhkN6yQ"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e9f69cc576so29509257b3.0
        for <chrome-platform@lists.linux.dev>; Mon, 18 Nov 2024 03:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731928126; x=1732532926; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DsAtCK9NssIxKHqoRp7NCGTjsqhi7e9zqen/JC6zMQs=;
        b=drhkN6yQlOKgemede4a7dvJsSd/fXEY/JRACILUDM786zFnk8OmkGvKPNSk+eHvmQ0
         WSP0hrmXWhe9eX6+fvrSMjq8DaYXO17CP7HveItQWYZLuIkBZB0UNSAplP8kakN66cGk
         hRG+HnkMhbjTlikxoBqUbPff5JUXCpsjibt/qvsIxSnEfx8rb4FGDKCgRqiIWtbqPAdC
         gDmwg5+Tb7498bYYT1nXSeRx7OReWS6Ygs30Ym3cN6/iAnRK0gwIQ/UGR263g/R9ezuv
         8ihiUCjCP6cxpqaKqfBPUUFp1+EdEjCxs5C0J92P9csjfM5Pr4i46W+bPfIQwN4KEoNQ
         UGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731928126; x=1732532926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DsAtCK9NssIxKHqoRp7NCGTjsqhi7e9zqen/JC6zMQs=;
        b=WbFRSX9u5KIlHhZlBblp7V3jv+fDkPuibmIKNAFp5kA2doAEAdn4RftGv0y8qLnYcu
         /fGoMCvR8s27A0E1mf2rSJXvWZLCQqf72gN7iZRBaKDOblTOJJNrOCt9tFcGufdBrR6O
         a2QpokidYAwn3FO5PtZOfPz7kU2A0SVDTB5LNwMRSn+KES8pMbxWdHSAK2pr4zQ5OI/x
         vWL7P+uRc4dvmY4ZYOdD5ADE6r5a+88tNVtDZDGGPavinrjD+JW/3ICWJYlziw2wiEF4
         c6bvxSgUrCOF+qc9Ytc/51GZd2krPL5s86RxqK2CW74LYQGAhx/CmIATAip0dtJDmM76
         20KA==
X-Forwarded-Encrypted: i=1; AJvYcCX9SqqOgbzJ9TkRhvRbNrqysD+ZWsosqHzwqjXVUthOkzSwpomPl/6tMoj8DPuO59W+miHBfSx7NrP50nAIf9w=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyp789SNMW0YTxpPQP6M+3xXJC8izqnhcavgatypkDIioPeWVGp
	GTM45ueFqsSm8WT7TkiJOur/CTRgmNIonJcoLC/tHsTFTkVUZCNdvlSzt7JUkoHE+QEvpuH1n9J
	Idp4vT5F4XJcoMeAg9sjAKwofxnARvauUBBtM+A==
X-Google-Smtp-Source: AGHT+IHEKbtJ5omlswJMvlw54VfzYtUla5X1/Y0ijXF8AixmmE3u30aSFWYpJPi2J1OeY4EHkd/gYXQEXeEhk+M2oQ4=
X-Received: by 2002:a05:690c:30e:b0:6e3:2e50:8c0c with SMTP id
 00721157ae682-6ee55ee937emr124851687b3.41.1731928125798; Mon, 18 Nov 2024
 03:08:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241115155234.1587589-1-ukaszb@chromium.org> <20241115155234.1587589-3-ukaszb@chromium.org>
 <jatq645z65hthaud4up6h6mxbggqpm73djtd6t3fxxkwccsifu@bb7bn24b7dak>
 <CALwA+NZ16WigkZuTwsRzDNC96OOR=+ZA-_UxtMq=fTWJ23a_Ag@mail.gmail.com>
 <CAA8EJprRQuXtGwiDeOiS56Nq=RW3p82-LTWGt8RervqGwP-=Vw@mail.gmail.com> <CALwA+NbUCstuayfm3ag-mBBRus1y-RM53auVFfffE_1OcW2zzA@mail.gmail.com>
In-Reply-To: <CALwA+NbUCstuayfm3ag-mBBRus1y-RM53auVFfffE_1OcW2zzA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 18 Nov 2024 13:08:34 +0200
Message-ID: <CAA8EJppJ6FKDRvZg0WHk7+uygFTUDKqBnx0swQ=A_E7WiUQUdA@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] usb: typec: ucsi: Implement ChromeOS UCSI driver
To: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Pavan Holla <pholla@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 18 Nov 2024 at 12:38, =C5=81ukasz Bartosik <ukaszb@chromium.org> wr=
ote:
>
> On Mon, Nov 18, 2024 at 11:21=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Mon, 18 Nov 2024 at 12:10, =C5=81ukasz Bartosik <ukaszb@chromium.org=
> wrote:
> > >
> > > On Fri, Nov 15, 2024 at 6:00=E2=80=AFPM Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > > >
> > > > On Fri, Nov 15, 2024 at 03:52:33PM +0000, =C5=81ukasz Bartosik wrot=
e:
> > > > > From: Pavan Holla <pholla@chromium.org>
> > > > >
> > > > > Implementation of a UCSI transport driver for ChromeOS.
> > > > > This driver will be loaded if the ChromeOS EC implements a PPM.
> > > > >
> > > > > Signed-off-by: Pavan Holla <pholla@chromium.org>
> > > > > Co-developed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.=
org>
> > > > > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.or=
g>
> > > > > Co-developed-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > > > > Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > > > > ---
> > > > >  MAINTAINERS                           |   7 +
> > > > >  drivers/usb/typec/ucsi/Kconfig        |  13 ++
> > > > >  drivers/usb/typec/ucsi/Makefile       |   1 +
> > > > >  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 248 ++++++++++++++++++++=
++++++
> > > > >  4 files changed, 269 insertions(+)
> > > > >  create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi.c
> > > >
> > > > > +static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd)
> > > > > +{
> > > > > +     return ucsi_sync_control_common(ucsi, cmd);
> > > > > +}
> > > > > +
> > > > > +struct ucsi_operations cros_ucsi_ops =3D {
> > > > > +     .read_version =3D cros_ucsi_read_version,
> > > > > +     .read_cci =3D cros_ucsi_read_cci,
> > > > > +     .read_message_in =3D cros_ucsi_read_message_in,
> > > > > +     .async_control =3D cros_ucsi_async_control,
> > > > > +     .sync_control =3D cros_ucsi_sync_control,
> > > >
> > > > .sync_control =3D ucsi_sync_control_common,
> > > >
> > >
> > > I will change.
> > >
> > > > > +};
> > > > > +
> > > >
> > > > [...]
> > > >
> > > > > +
> > > > > +static int __maybe_unused cros_ucsi_suspend(struct device *dev)
> > > > > +{
> > > > > +     struct cros_ucsi_data *udata =3D dev_get_drvdata(dev);
> > > > > +
> > > > > +     cancel_work_sync(&udata->work);
> > > > > +
> > > > > +     return 0;
> > > > > +}
> > > > > +
> > > > > +static void __maybe_unused cros_ucsi_complete(struct device *dev=
)
> > > > > +{
> > > > > +     struct cros_ucsi_data *udata =3D dev_get_drvdata(dev);
> > > > > +
> > > > > +     ucsi_resume(udata->ucsi);
> > > > > +}
> > > > > +
> > > > > +static const struct dev_pm_ops cros_ucsi_pm_ops =3D {
> > > > > +#ifdef CONFIG_PM_SLEEP
> > > > > +     .suspend =3D cros_ucsi_suspend,
> > > > > +     .complete =3D cros_ucsi_complete,
> > > > > +#endif
> > > >
> > > > SET_SYSTEM_SLEEP_PM_OPS ? Or even better, DEFINE_SIMPLE_DEV_PM_OPS(=
) ?
> > > >
> > > > What is the reason for using complete() instead of resume()?
> > > >
> > >
> > > Due to change in
> > > https://lore.kernel.org/linux-usb/20240910101527.603452-1-ukaszb@chro=
mium.org/T/#m25bc17cc0a8d30439830415018c7f44f342900d1
> > > we moved from using macro SIMPLE_DEV_PM_OPS and resume() to complete(=
).
> > > Per Heikki's suggestion I also squashed this change into "usb: typec:
> > > ucsi: Implement ChromeOS UCSI driver".
> >
> > Neither original patch, nor this one document, why this is necessary
> >
>
> The https://lore.kernel.org/linux-usb/20240910101527.603452-1-ukaszb@chro=
mium.org/T/#m25bc17cc0a8d30439830415018c7f44f342900d1
> commit messages says:
> "On platforms using cros_ec_lpc, resume is split into .resume_early
> and .complete.
> To avoid missing EC events, use .complete to schedule work when resuming.=
"
>
> I will add this as a comment on top of cros_ucsi_pm_ops struct.
> Do you find it sufficient ?

IMHO, no

>
> Thanks,
> Lukasz
>
> > >
> > > Thank you,
> > > Lukasz
> > >
> > > > > +};
> > > > > +
> > > > > +static const struct platform_device_id cros_ucsi_id[] =3D {
> > > > > +     { KBUILD_MODNAME, 0 },
> > > > > +     {}
> > > > > +};
> > > > > +MODULE_DEVICE_TABLE(platform, cros_ucsi_id);
> > > > > +
> > > > > +static struct platform_driver cros_ucsi_driver =3D {
> > > > > +     .driver =3D {
> > > > > +             .name =3D KBUILD_MODNAME,
> > > > > +             .pm =3D &cros_ucsi_pm_ops,
> > > > > +     },
> > > > > +     .id_table =3D cros_ucsi_id,
> > > > > +     .probe =3D cros_ucsi_probe,
> > > > > +     .remove =3D cros_ucsi_remove,
> > > > > +};
> > > > > +
> > > > > +module_platform_driver(cros_ucsi_driver);
> > > > > +
> > > > > +MODULE_LICENSE("GPL");
> > > > > +MODULE_DESCRIPTION("UCSI driver for ChromeOS EC");
> > > > > --
> > > > > 2.47.0.338.g60cca15819-goog
> > > > >
> > > >
> > > > --
> > > > With best wishes
> > > > Dmitry
> >
> >
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry
