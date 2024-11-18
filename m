Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F674194C90
	for <chrome-platform@lists.linux.dev>; Mon, 18 Nov 2024 10:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731924609; cv=none; b=AOevtqqt+wEHsnyPr76rpj4jwo2CPAA1Kf+IbmncA/gi5/a0A/3+gHapQUo5k5xH4Xy9L1UDFIeoGEvBW/yUh1nWPzWr+kesI682fN62gQWwOqSRHaWbsdfiFPdmbfCySLb8VTRokuJtGc+9QAa4CdhWYmElT9Dvm1q5PJ+bXro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731924609; c=relaxed/simple;
	bh=5ZEjIWsEI0/tVQP3E06ZdjXqkBJT2vfSsRwTmsgeYbg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V/vENz8qFw0mI/EG7qczq7Jwfmm/PB7OBv4PQfSXjHFdeG83I/+0QfQU20weVte2p1Z9g6ru1DJf4N28o9B9M1N3sppx7MsE4HetfjvmiYs441rxboGz28qQgEa7AMs7W41lGOr0G+6vYNpEroGSY29oRMaRFos89NY7Mm6TVzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HzmI8EmP; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HzmI8EmP"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2feeb1e8edfso20411301fa.1
        for <chrome-platform@lists.linux.dev>; Mon, 18 Nov 2024 02:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731924606; x=1732529406; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UvhlZgzgDxMQLozpaQpaBRbppS3q/9Mpwy2g6yeeX2g=;
        b=HzmI8EmPjXdZCwl7c+J+Gr/ZDOEtQbQGMJviRxINz3O45h5e5hYi1jCEaIg7YQWUsh
         P3rHvDNs0WXBAuIGxWDErrU7jVsUID+MnrnlF8W/W6TxGuLcqZhMWJguonecmMBxvxJY
         r6Ww4RObX7M64b+rQ69uY1HMTEcGMUguBb7NI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731924606; x=1732529406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UvhlZgzgDxMQLozpaQpaBRbppS3q/9Mpwy2g6yeeX2g=;
        b=B515jbxTR88MSUf0e6bejFjVmP0Fq56IIsqQWPOqDA9JGs9ozj06RmxyQom0PhMerx
         LKAbffGU7K1y5F+RVaQzK9S9DTX/vMWzISgRo9nIAaayewtsx0Pd6QSJ2VbU8vC8X1fS
         YzAMrm44TDZ22OHvzbuFguKu1AJfsBpumPaNTxQsQGyMGF2UzkZpEuFpFV6aZqG8Myil
         4uwM3iEDpQaR1T5agt47QF+I9UtXU9OVwnmasUutIbXHH/ruSf9z3gdhbrRfMIYrXylV
         VqYi5EZT7IWNt2osd5APKH7xtr6uDq9YN2830tSJOVCu+NGr+OJrp+jbFLKziFOP/bhq
         O/dA==
X-Forwarded-Encrypted: i=1; AJvYcCUVgGS3nZn9YRiQhWn1XZ+/hO91mMjFT5jo0XCYiHCXuZt0zCLf6gRZSjwIeJO/bzR8SHVLfEYxB6h2dxtAU6c=@lists.linux.dev
X-Gm-Message-State: AOJu0YxVN/mkzFJCtFYf47CNJIaT0Q62gVSHeLehEraULoQ6wmYG+ivV
	C/eisewar6fUR+hnoDjM7QSn+kNkDOvMqTGd4WgJDFgvs9eh2T9IYqLzR4MFaqayadfRfu/c55Y
	eP+qbaT+3VvJV11pmPM0u7jbc3FH/UUuRaiM=
X-Google-Smtp-Source: AGHT+IFHMdc8+VJMKwLx0wnjVeTW3YqK2FwnPhXo+GJV3wNseaCvDPvR7y4K3nvoDoEmEl3KPB6KANMyHE20/F6iXfo=
X-Received: by 2002:a05:651c:905:b0:2fb:5206:1675 with SMTP id
 38308e7fff4ca-2ff606dccb7mr75024861fa.27.1731924605750; Mon, 18 Nov 2024
 02:10:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241115155234.1587589-1-ukaszb@chromium.org> <20241115155234.1587589-3-ukaszb@chromium.org>
 <jatq645z65hthaud4up6h6mxbggqpm73djtd6t3fxxkwccsifu@bb7bn24b7dak>
In-Reply-To: <jatq645z65hthaud4up6h6mxbggqpm73djtd6t3fxxkwccsifu@bb7bn24b7dak>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Mon, 18 Nov 2024 11:09:54 +0100
Message-ID: <CALwA+NZ16WigkZuTwsRzDNC96OOR=+ZA-_UxtMq=fTWJ23a_Ag@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] usb: typec: ucsi: Implement ChromeOS UCSI driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Pavan Holla <pholla@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2024 at 6:00=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, Nov 15, 2024 at 03:52:33PM +0000, =C5=81ukasz Bartosik wrote:
> > From: Pavan Holla <pholla@chromium.org>
> >
> > Implementation of a UCSI transport driver for ChromeOS.
> > This driver will be loaded if the ChromeOS EC implements a PPM.
> >
> > Signed-off-by: Pavan Holla <pholla@chromium.org>
> > Co-developed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > Co-developed-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > ---
> >  MAINTAINERS                           |   7 +
> >  drivers/usb/typec/ucsi/Kconfig        |  13 ++
> >  drivers/usb/typec/ucsi/Makefile       |   1 +
> >  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 248 ++++++++++++++++++++++++++
> >  4 files changed, 269 insertions(+)
> >  create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi.c
>
> > +static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd)
> > +{
> > +     return ucsi_sync_control_common(ucsi, cmd);
> > +}
> > +
> > +struct ucsi_operations cros_ucsi_ops =3D {
> > +     .read_version =3D cros_ucsi_read_version,
> > +     .read_cci =3D cros_ucsi_read_cci,
> > +     .read_message_in =3D cros_ucsi_read_message_in,
> > +     .async_control =3D cros_ucsi_async_control,
> > +     .sync_control =3D cros_ucsi_sync_control,
>
> .sync_control =3D ucsi_sync_control_common,
>

I will change.

> > +};
> > +
>
> [...]
>
> > +
> > +static int __maybe_unused cros_ucsi_suspend(struct device *dev)
> > +{
> > +     struct cros_ucsi_data *udata =3D dev_get_drvdata(dev);
> > +
> > +     cancel_work_sync(&udata->work);
> > +
> > +     return 0;
> > +}
> > +
> > +static void __maybe_unused cros_ucsi_complete(struct device *dev)
> > +{
> > +     struct cros_ucsi_data *udata =3D dev_get_drvdata(dev);
> > +
> > +     ucsi_resume(udata->ucsi);
> > +}
> > +
> > +static const struct dev_pm_ops cros_ucsi_pm_ops =3D {
> > +#ifdef CONFIG_PM_SLEEP
> > +     .suspend =3D cros_ucsi_suspend,
> > +     .complete =3D cros_ucsi_complete,
> > +#endif
>
> SET_SYSTEM_SLEEP_PM_OPS ? Or even better, DEFINE_SIMPLE_DEV_PM_OPS() ?
>
> What is the reason for using complete() instead of resume()?
>

Due to change in
https://lore.kernel.org/linux-usb/20240910101527.603452-1-ukaszb@chromium.o=
rg/T/#m25bc17cc0a8d30439830415018c7f44f342900d1
we moved from using macro SIMPLE_DEV_PM_OPS and resume() to complete().
Per Heikki's suggestion I also squashed this change into "usb: typec:
ucsi: Implement ChromeOS UCSI driver".

Thank you,
Lukasz

> > +};
> > +
> > +static const struct platform_device_id cros_ucsi_id[] =3D {
> > +     { KBUILD_MODNAME, 0 },
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(platform, cros_ucsi_id);
> > +
> > +static struct platform_driver cros_ucsi_driver =3D {
> > +     .driver =3D {
> > +             .name =3D KBUILD_MODNAME,
> > +             .pm =3D &cros_ucsi_pm_ops,
> > +     },
> > +     .id_table =3D cros_ucsi_id,
> > +     .probe =3D cros_ucsi_probe,
> > +     .remove =3D cros_ucsi_remove,
> > +};
> > +
> > +module_platform_driver(cros_ucsi_driver);
> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_DESCRIPTION("UCSI driver for ChromeOS EC");
> > --
> > 2.47.0.338.g60cca15819-goog
> >
>
> --
> With best wishes
> Dmitry
