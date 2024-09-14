Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88711754B
	for <chrome-platform@lists.linux.dev>; Sat, 14 Sep 2024 23:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726357432; cv=none; b=ka9I0q43Y8yuB2VSqvlj+LdDFB5t2mffmTqEUiaABGDPSGCqFIjjjQ9yC6DWkIGIWKQEudY3+XqgkAQa23zAI6oxTiUt4eAcA2NQv5kt92UkedheRfTnKrmR5FZFTqsn6GiPxKWLElgPgQPbnjp9FY8mKqU23M/28oQzNML8N44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726357432; c=relaxed/simple;
	bh=t1aExyFjz98/zA5xARPP+uj1Od5zhESbswgoCwcbbZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R2Vu+avy792WXeCoZGOAAkLCeQ6rSU1zkyVWcwDpvVLOk3wVUH1X3UKfeHGpUHGW47/oCVrTmAWjoc2u+MGOMtyXcm0bfa8vjGodl3MUnD1O28rsEXsj+RGdB7jO4ZaEcuu5tCSos3BMEYSh9xC/9vpmcosUgZV8WjhwDdMqkNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jmqAmLId; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jmqAmLId"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f74e468baeso24419121fa.2
        for <chrome-platform@lists.linux.dev>; Sat, 14 Sep 2024 16:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726357429; x=1726962229; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xGYWLlguSdnKQtisEXngNTszohi1t3W+x1ViuQ9Aq3c=;
        b=jmqAmLIdqHP/iHSVSJTwfK0oMJE+it7xqbJ4xb//CDfuiO6VdByLmclqbuVcCQhV6J
         gjT6yvNTPA/eUos8nrQI1L34azzmtxqfE29Uha/UZNEfinBuiT4OoYDLseM+EaZ/xsjS
         P25ckZTBGLW0JKugeyO6dbPw/kUdloqHSm7Zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726357429; x=1726962229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xGYWLlguSdnKQtisEXngNTszohi1t3W+x1ViuQ9Aq3c=;
        b=AsY8+GKDjYGPVkLOmDo9j4vIsr2F4O2qgi3xk+8wb9M97zkw72FbFJDq/n85W/aH4o
         o4tfKuZ8jHgUGqiKxy3ZKnVJx/PpUQSH/uIDWath8GVGt6G+b2mYhK+D8PB2tPF5BVXO
         g7H6gX4/KkfYla7PleTr+Pymp7s29LSgoEhR3gsgX6SmddziE5Y26vllNEN6Pnt45rfh
         WQc9Pr/dBvj3vLQRuRmF9xGEtgaZDfOtdKxCF1QrZrf/RDttA+ll1fggdN3UwUXsCI4T
         eGewqkbKpuVLYYCvF99doqxNuO4A78cGFIdjDFQNhet9fZa+DrNpfjeXwvkQtyuaiAV/
         f3Jg==
X-Forwarded-Encrypted: i=1; AJvYcCVVWcpd1+A+euakuxPl3jkf3YlkAJPclP1nvSLXOoMSN+61IFJXTaw1dBwA1oMKpYeSiV7DTJDsM/zA9RM9DTQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzFGjXEdUWvxFOhpSdxaE+Kxem17YCZi8T3h84OhqB+74FViJI2
	Zf4uDNBfIAlEed/GEaCmuBXxQ1oEdjW7GDsa/BHkdpQMVDt+WYQONqq9a9Wx6x3m846L/gsHaRf
	s/J++/qAhSC5B5pibTVsBH1JT4wGFK6eYilw=
X-Google-Smtp-Source: AGHT+IE/h8etWleI1971X/m56jcmQZ1SGmNJF4Yoxv61MOhR7T+Z3qSUcd4rmrhLXNVUkw0nSqhkEbXct45s8k02zBQ=
X-Received: by 2002:a05:6512:138a:b0:533:4477:28a2 with SMTP id
 2adb3069b0e04-5367fecbf90mr3951036e87.16.1726357428129; Sat, 14 Sep 2024
 16:43:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240910101527.603452-1-ukaszb@chromium.org> <20240910101527.603452-4-ukaszb@chromium.org>
 <lqs2y5gvsaij5rg4o4krruseuijinqgzky6kiorjegham4aumq@fx2doq5j7wkq>
 <CALwA+NYC82pJHGmZXnOsWJvg0yJb3aKjLi7V32Kgb9QPtZQTyg@mail.gmail.com> <CAA8EJppnpu86PzwrsLmjA-3gR-ybaaX49d9uZe4iCUeVnTuCfA@mail.gmail.com>
In-Reply-To: <CAA8EJppnpu86PzwrsLmjA-3gR-ybaaX49d9uZe4iCUeVnTuCfA@mail.gmail.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Sun, 15 Sep 2024 01:43:34 +0200
Message-ID: <CALwA+NbwMigbV+WQV=Jm4JVApWQO6XOh0Yx-QdVsnf8L9Qrh=g@mail.gmail.com>
Subject: Re: [PATCH v6 3/8] usb: typec: ucsi: Implement ChromeOS UCSI driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Pavan Holla <pholla@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 15, 2024 at 1:03=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Sun, 15 Sept 2024 at 01:50, =C5=81ukasz Bartosik <ukaszb@chromium.org>=
 wrote:
> >
> > On Thu, Sep 12, 2024 at 2:58=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Tue, Sep 10, 2024 at 10:15:22AM GMT, =C5=81ukasz Bartosik wrote:
> > > > From: Pavan Holla <pholla@chromium.org>
> > > >
> > > > Implementation of a UCSI transport driver for ChromeOS.
> > > > This driver will be loaded if the ChromeOS EC implements a PPM.
> > > >
> > > > Signed-off-by: Pavan Holla <pholla@chromium.org>
> > > > Co-developed-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > > > Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > > > ---
> > > >  MAINTAINERS                           |   7 +
> > > >  drivers/usb/typec/ucsi/Kconfig        |  13 ++
> > > >  drivers/usb/typec/ucsi/Makefile       |   1 +
> > > >  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 273 ++++++++++++++++++++++=
++++
> > > >  4 files changed, 294 insertions(+)
> > > >  create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi.c
> > > >
> > >
> > > [...]
> > >
> > > > +
> > > > +static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd)
> > > > +{
> > > > +     struct cros_ucsi_data *udata =3D ucsi_get_drvdata(ucsi);
> > > > +     bool ack =3D UCSI_COMMAND(cmd) =3D=3D UCSI_ACK_CC_CI;
> > > > +     int ret;
> > > > +
> > > > +     if (ack)
> > > > +             set_bit(ACK_PENDING, &udata->flags);
> > > > +     else
> > > > +             set_bit(COMMAND_PENDING, &udata->flags);
> > > > +
> > > > +     ret =3D cros_ucsi_async_control(ucsi, cmd);
> > > > +     if (ret)
> > > > +             goto out;
> > > > +
> > > > +     if (!wait_for_completion_timeout(&udata->complete, WRITE_TMO_=
MS))
> > > > +             ret =3D -ETIMEDOUT;
> > > > +
> > > > +out:
> > > > +     if (ack)
> > > > +             clear_bit(ACK_PENDING, &udata->flags);
> > > > +     else
> > > > +             clear_bit(COMMAND_PENDING, &udata->flags);
> > > > +     return ret;
> > > > +}
> > > > +
> > > > +struct ucsi_operations cros_ucsi_ops =3D {
> > > > +     .read_version =3D cros_ucsi_read_version,
> > > > +     .read_cci =3D cros_ucsi_read_cci,
> > > > +     .read_message_in =3D cros_ucsi_read_message_in,
> > > > +     .async_control =3D cros_ucsi_async_control,
> > > > +     .sync_control =3D cros_ucsi_sync_control,
> > >
> > > Please use ucsi_sync_control_common instead.
> > >
> >
> > I will use ucsi_sync_control_common. Thanks for pointing it out.
> >
> > > > +};
> > > > +
> > > > +static void cros_ucsi_work(struct work_struct *work)
> > > > +{
> > > > +     struct cros_ucsi_data *udata =3D container_of(work, struct cr=
os_ucsi_data, work);
> > > > +     u32 cci;
> > > > +
> > > > +     if (cros_ucsi_read_cci(udata->ucsi, &cci))
> > > > +             return;
> > > > +
> > > > +     if (UCSI_CCI_CONNECTOR(cci))
> > > > +             ucsi_connector_change(udata->ucsi, UCSI_CCI_CONNECTOR=
(cci));
> > > > +
> > > > +     if (cci & UCSI_CCI_ACK_COMPLETE &&
> > > > +         test_and_clear_bit(ACK_PENDING, &udata->flags))
> > > > +             complete(&udata->complete);
> > > > +     if (cci & UCSI_CCI_COMMAND_COMPLETE &&
> > > > +         test_and_clear_bit(COMMAND_PENDING, &udata->flags))
> > > > +             complete(&udata->complete);
> > >
> > > ucsi_notify_common(). Why are you ignoring these functions?
> > >
> >
> > I have missed these common functions mainly because our baseline is on
> > the v6.6 kernel.
>
> Please, don't send patches based on the old kernels. The development
> should be done on the tip of the maintainer's tree.
>

I should have been more specific. I always rebase to the latest
upstream kernel and fix any
conflicts and compilation errors before sending patches to upstream
review. But living on a daily
basis on the v6.6 kernel caused me to miss the common function you pointed =
out.

Thanks,
Lukasz



> > I will use ucsi_notify_common() however I noticed one
> > major difference. The ucsi_notify_common() uses test_bit while above
> > we use test_and_clear_bit. I will send a separate commit to change
> > test_bit->test_and_clear_bit in the ucsi_notify_common() because usage
> > of test_and_clear_bit fixes possible race condition.
>
> Ack, thanks!
>
> --
> With best wishes
> Dmitry
