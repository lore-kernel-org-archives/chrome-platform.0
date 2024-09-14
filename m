Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1E68172D
	for <chrome-platform@lists.linux.dev>; Sat, 14 Sep 2024 22:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726354255; cv=none; b=lWsfHZhV6iysuj0hVXZcejRX0n4kYsihx2A5uDFsafFCrylZ+ZTKmi5ppFQE9fGWRs/xAtC8GX93sZitk7m64wZF+vjq7tHkS/wZfAWWNquyTNbFbxbMFhHDlTXVAV4yVHFL3zTbP4vI87LW5izWspNAHBrtMeYEAxvRKwt7xxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726354255; c=relaxed/simple;
	bh=S9HU9A3lPtzTNeq4ddVzQze48B6GFWPbaPeZIHmXB7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hqZpP327qwqVaPKXIVh+n2Dv936wyPRISekKNGVZYPNX/bz4GuuM/3uv3iEnOJ/AplHNQzs38Ih/3rUpiuuGTvdhd/z1+Mhq+q6vZdo6ZRFI97q11+/Z6hhBTnB8dUOn9/4FIfNmcLMG97auh12goi0lQPon0zVRQtj0lAunsvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Iu0SiE84; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Iu0SiE84"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5365d3f9d34so2316687e87.3
        for <chrome-platform@lists.linux.dev>; Sat, 14 Sep 2024 15:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726354252; x=1726959052; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62inOTway/l0D+2heaR3dRkFm4XqFBMQDZkBsi6BCHk=;
        b=Iu0SiE84eeDnAJUOMFLYdvmZnjnyoOmYz2665Y7v8jSrLdPxwRmysZoapOM1GtTgW6
         ETvm+DIeimVA0kuIZKCQTH+4+HR668BDZcCgyJm8emX/NFx48QA+LENyGu/h6Jzz6LLc
         yJB2VjhBdEsy/QVTz37FCAS2nULQCBuJ/Bqko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726354252; x=1726959052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=62inOTway/l0D+2heaR3dRkFm4XqFBMQDZkBsi6BCHk=;
        b=RQWdfOxYfEoavs+HJK0X9JLLAglvOx/FXmANaOG4oHBbuPkvTmN4PtkxELz4lMbh9/
         jF+2jcuO9CtI3q+6B+F7b5ReC7XBv74vpp8crHdEnXpoSkWtLJkvf0nOWNPL2WYY3NUw
         CPQalK3FyK6Y8/K2NozeuCTSn+VuLf6PXRo8TBhBsoHNYTfMInLqZ2qyzKJSgkPE7L/v
         zOCVuRmUFZCs4fQ9/hQGn/hPmchylLFHB5XBuRtCDkDZ0GrNn10lnuTG5BdvAcnpGJw2
         Fpm9bMqOkC7PaePtfwSJI5SkDnsVTCHwJa+yQBAKUHvGbC3xem+aeTCUfkA474vw5I9B
         4FSA==
X-Forwarded-Encrypted: i=1; AJvYcCU/2pns58doT67vvOhNO+bJ6yWuRmIUK/DLw5xzWXDQRm2wMoKbiE8mLKMJgCyqC9BctJW2Nsi8bfjasWZ3uf8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0gDaFxsZcXOoHHKXiFSdD03u82Soa3G3Dz8Jsg7kSY0a9ALN/
	wwc5G8yf/m66zfWX1uil+tXNgjCjGj2BMYVvsPNBF3VZR1wPbfcqm8mWvlmkrHscecG8Cn0f58n
	bOGLF4LPOjlPNl3mXy3b/f2PKVzn6DTCsZGE=
X-Google-Smtp-Source: AGHT+IEc4RdKBXOCSqDC8u5a2JxIpm+YVo48e3SZAmCsKbKsH4DKCR21dvHv7YXXSfvjxJOkFstGQ5S8nAUNXnuJVnE=
X-Received: by 2002:a05:6512:a8d:b0:530:e323:b1d0 with SMTP id
 2adb3069b0e04-5367feba0a6mr3570682e87.9.1726354251818; Sat, 14 Sep 2024
 15:50:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240910101527.603452-1-ukaszb@chromium.org> <20240910101527.603452-4-ukaszb@chromium.org>
 <lqs2y5gvsaij5rg4o4krruseuijinqgzky6kiorjegham4aumq@fx2doq5j7wkq>
In-Reply-To: <lqs2y5gvsaij5rg4o4krruseuijinqgzky6kiorjegham4aumq@fx2doq5j7wkq>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Sun, 15 Sep 2024 00:50:40 +0200
Message-ID: <CALwA+NYC82pJHGmZXnOsWJvg0yJb3aKjLi7V32Kgb9QPtZQTyg@mail.gmail.com>
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

On Thu, Sep 12, 2024 at 2:58=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, Sep 10, 2024 at 10:15:22AM GMT, =C5=81ukasz Bartosik wrote:
> > From: Pavan Holla <pholla@chromium.org>
> >
> > Implementation of a UCSI transport driver for ChromeOS.
> > This driver will be loaded if the ChromeOS EC implements a PPM.
> >
> > Signed-off-by: Pavan Holla <pholla@chromium.org>
> > Co-developed-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > ---
> >  MAINTAINERS                           |   7 +
> >  drivers/usb/typec/ucsi/Kconfig        |  13 ++
> >  drivers/usb/typec/ucsi/Makefile       |   1 +
> >  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 273 ++++++++++++++++++++++++++
> >  4 files changed, 294 insertions(+)
> >  create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi.c
> >
>
> [...]
>
> > +
> > +static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd)
> > +{
> > +     struct cros_ucsi_data *udata =3D ucsi_get_drvdata(ucsi);
> > +     bool ack =3D UCSI_COMMAND(cmd) =3D=3D UCSI_ACK_CC_CI;
> > +     int ret;
> > +
> > +     if (ack)
> > +             set_bit(ACK_PENDING, &udata->flags);
> > +     else
> > +             set_bit(COMMAND_PENDING, &udata->flags);
> > +
> > +     ret =3D cros_ucsi_async_control(ucsi, cmd);
> > +     if (ret)
> > +             goto out;
> > +
> > +     if (!wait_for_completion_timeout(&udata->complete, WRITE_TMO_MS))
> > +             ret =3D -ETIMEDOUT;
> > +
> > +out:
> > +     if (ack)
> > +             clear_bit(ACK_PENDING, &udata->flags);
> > +     else
> > +             clear_bit(COMMAND_PENDING, &udata->flags);
> > +     return ret;
> > +}
> > +
> > +struct ucsi_operations cros_ucsi_ops =3D {
> > +     .read_version =3D cros_ucsi_read_version,
> > +     .read_cci =3D cros_ucsi_read_cci,
> > +     .read_message_in =3D cros_ucsi_read_message_in,
> > +     .async_control =3D cros_ucsi_async_control,
> > +     .sync_control =3D cros_ucsi_sync_control,
>
> Please use ucsi_sync_control_common instead.
>

I will use ucsi_sync_control_common. Thanks for pointing it out.

> > +};
> > +
> > +static void cros_ucsi_work(struct work_struct *work)
> > +{
> > +     struct cros_ucsi_data *udata =3D container_of(work, struct cros_u=
csi_data, work);
> > +     u32 cci;
> > +
> > +     if (cros_ucsi_read_cci(udata->ucsi, &cci))
> > +             return;
> > +
> > +     if (UCSI_CCI_CONNECTOR(cci))
> > +             ucsi_connector_change(udata->ucsi, UCSI_CCI_CONNECTOR(cci=
));
> > +
> > +     if (cci & UCSI_CCI_ACK_COMPLETE &&
> > +         test_and_clear_bit(ACK_PENDING, &udata->flags))
> > +             complete(&udata->complete);
> > +     if (cci & UCSI_CCI_COMMAND_COMPLETE &&
> > +         test_and_clear_bit(COMMAND_PENDING, &udata->flags))
> > +             complete(&udata->complete);
>
> ucsi_notify_common(). Why are you ignoring these functions?
>

I have missed these common functions mainly because our baseline is on
the v6.6 kernel. I will use ucsi_notify_common() however I noticed one
major difference. The ucsi_notify_common() uses test_bit while above
we use test_and_clear_bit. I will send a separate commit to change
test_bit->test_and_clear_bit in the ucsi_notify_common() because usage
of test_and_clear_bit fixes possible race condition.

Thanks,
Lukasz

> --
> With best wishes
> Dmitry
