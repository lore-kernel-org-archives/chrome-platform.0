Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878491C32
	for <chrome-platform@lists.linux.dev>; Sat, 14 Sep 2024 23:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726354996; cv=none; b=u2Bt2IbPWJDiyogVX2oCnPjyCpJ24JR/dDSR0QeE/R1cmOO5UW2n3kt26CxFj9tSFr/5HRwyqarJbVRim896GeYzQjEuZeVVnC2pOv5lNb5XK1kIVn8l7i2gINvGEflJCH/jpqmV21aJA2Fn7UjCct28v9tEQGjvLaIP5312bLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726354996; c=relaxed/simple;
	bh=AX642FPQAF+jwwNFq0NxNHKGMH9LO/iepwtGfe9mOOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oB9YcNVnBCFLiqyZPYDvAGcHOdU+AqEMjJJGLA/m3TqpWkAT4YXJNkvMrJZ0LREcE2DFGvllS0zqnpwIGTbjCMpBFcwk0cohj78l8pYAKCktQC8QB4aNC7YrvNUubIf2KikIHa2s4FkylqNfhF6+nf5boKkT67t6bZPj0GGzFnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t6WhG6dw; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t6WhG6dw"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6d6e2b2fbc4so26981867b3.0
        for <chrome-platform@lists.linux.dev>; Sat, 14 Sep 2024 16:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726354993; x=1726959793; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCF3AAbev9u0VzJuDMboPBSEdmZxlXbuMDidstgTqwQ=;
        b=t6WhG6dwWDepNK68qj7vuAarP4wxxkUc4VXDgxT2dWtq1bXSYkdJCekCuhxetQ53BP
         xgJVbdnxF0O7C1hIFFIYv9sQ/6/yDoWJUQEP0wgWak1V4lPdrIejG3mj77hiWttVp4he
         +VAKTlJJhD5oNzg4dTIiK/4nN8zMm2/lTbtog6Q4PSCPmMebP3gmLZQMCr744hTz2rBH
         YyaCNlJC6ZlatkkunO/kwIFi+FfP2Ohcl76oYRlL+luG49TFCdpNBDsbIfb5LB9sATr6
         cDNXj43JI1nz/cd2+A/RBos+ctZCF3SFGjzzSEgTXppkBywGhZpUqEAOXE5nvgTlRjIy
         eEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726354993; x=1726959793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VCF3AAbev9u0VzJuDMboPBSEdmZxlXbuMDidstgTqwQ=;
        b=TtEOim4lu1ZKVfqqSTBUsIZdLcZ7OuTUjf/ZdTRxvvitpAz6EzgyYFIKaf4HjQb4Tx
         w87AfWmukcba5D/1yvLkYvjNVrRbfH0WszwlnN9Iwh1t9oOqE5IWzLF0vJwVuv7WXlQ3
         AMMD7ZCMktRurS5BMncdambEBM/ruoILXW2+PyEHHgLhznfFloY0IrClfGDuacGAKiM1
         zurGJ7MBlRY5HymMeMjdE5M1AndJVPdaAxIjHbWYKUXz0OJdi1+tkFNTn5LRYaJU2Pon
         T28oIWCQkvdY4xvHI+fga9skTu/rVRWZFi4wuYtx1pZQijY5ZpQbT9DHmRpUigPuYN0U
         yjfA==
X-Forwarded-Encrypted: i=1; AJvYcCWb27AqmG7BZMy3vUgMfY+yz23/RCHvCG5ZoK9XNCvzjKf8W2zX0/E3gjyFjyazLmKGicljCOjrNNsUsyGBpXw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6bc0iZ8dd8mnWkT0wxXFaFqmdF4ku+diGZkzJVQKX4tzqTMTx
	j3oN4xIxDW1e1NumqyVtfCc/B8rGFvA5HXy36PJMFsgmKMVJjsEeH6rUuAa2eZKh7z+be/seNGc
	G6zPkpZ8WOfat25pYDx54ltJ/yfBN7RJQ2WASvQ==
X-Google-Smtp-Source: AGHT+IFnt8IbdGzxQVWJEiIIZgjpBXksyZuPv/8Yi7+whze4IscOZ0mLkc6XqAySdpFJsFHRBmj6tVOMN53xrXH0eX4=
X-Received: by 2002:a05:690c:64c5:b0:6db:d0dd:13b4 with SMTP id
 00721157ae682-6dbd0dd14b6mr61093867b3.44.1726354993363; Sat, 14 Sep 2024
 16:03:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240910101527.603452-1-ukaszb@chromium.org> <20240910101527.603452-4-ukaszb@chromium.org>
 <lqs2y5gvsaij5rg4o4krruseuijinqgzky6kiorjegham4aumq@fx2doq5j7wkq> <CALwA+NYC82pJHGmZXnOsWJvg0yJb3aKjLi7V32Kgb9QPtZQTyg@mail.gmail.com>
In-Reply-To: <CALwA+NYC82pJHGmZXnOsWJvg0yJb3aKjLi7V32Kgb9QPtZQTyg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 15 Sep 2024 02:03:01 +0300
Message-ID: <CAA8EJppnpu86PzwrsLmjA-3gR-ybaaX49d9uZe4iCUeVnTuCfA@mail.gmail.com>
Subject: Re: [PATCH v6 3/8] usb: typec: ucsi: Implement ChromeOS UCSI driver
To: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Pavan Holla <pholla@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 15 Sept 2024 at 01:50, =C5=81ukasz Bartosik <ukaszb@chromium.org> w=
rote:
>
> On Thu, Sep 12, 2024 at 2:58=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Tue, Sep 10, 2024 at 10:15:22AM GMT, =C5=81ukasz Bartosik wrote:
> > > From: Pavan Holla <pholla@chromium.org>
> > >
> > > Implementation of a UCSI transport driver for ChromeOS.
> > > This driver will be loaded if the ChromeOS EC implements a PPM.
> > >
> > > Signed-off-by: Pavan Holla <pholla@chromium.org>
> > > Co-developed-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > > Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > > ---
> > >  MAINTAINERS                           |   7 +
> > >  drivers/usb/typec/ucsi/Kconfig        |  13 ++
> > >  drivers/usb/typec/ucsi/Makefile       |   1 +
> > >  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 273 ++++++++++++++++++++++++=
++
> > >  4 files changed, 294 insertions(+)
> > >  create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi.c
> > >
> >
> > [...]
> >
> > > +
> > > +static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd)
> > > +{
> > > +     struct cros_ucsi_data *udata =3D ucsi_get_drvdata(ucsi);
> > > +     bool ack =3D UCSI_COMMAND(cmd) =3D=3D UCSI_ACK_CC_CI;
> > > +     int ret;
> > > +
> > > +     if (ack)
> > > +             set_bit(ACK_PENDING, &udata->flags);
> > > +     else
> > > +             set_bit(COMMAND_PENDING, &udata->flags);
> > > +
> > > +     ret =3D cros_ucsi_async_control(ucsi, cmd);
> > > +     if (ret)
> > > +             goto out;
> > > +
> > > +     if (!wait_for_completion_timeout(&udata->complete, WRITE_TMO_MS=
))
> > > +             ret =3D -ETIMEDOUT;
> > > +
> > > +out:
> > > +     if (ack)
> > > +             clear_bit(ACK_PENDING, &udata->flags);
> > > +     else
> > > +             clear_bit(COMMAND_PENDING, &udata->flags);
> > > +     return ret;
> > > +}
> > > +
> > > +struct ucsi_operations cros_ucsi_ops =3D {
> > > +     .read_version =3D cros_ucsi_read_version,
> > > +     .read_cci =3D cros_ucsi_read_cci,
> > > +     .read_message_in =3D cros_ucsi_read_message_in,
> > > +     .async_control =3D cros_ucsi_async_control,
> > > +     .sync_control =3D cros_ucsi_sync_control,
> >
> > Please use ucsi_sync_control_common instead.
> >
>
> I will use ucsi_sync_control_common. Thanks for pointing it out.
>
> > > +};
> > > +
> > > +static void cros_ucsi_work(struct work_struct *work)
> > > +{
> > > +     struct cros_ucsi_data *udata =3D container_of(work, struct cros=
_ucsi_data, work);
> > > +     u32 cci;
> > > +
> > > +     if (cros_ucsi_read_cci(udata->ucsi, &cci))
> > > +             return;
> > > +
> > > +     if (UCSI_CCI_CONNECTOR(cci))
> > > +             ucsi_connector_change(udata->ucsi, UCSI_CCI_CONNECTOR(c=
ci));
> > > +
> > > +     if (cci & UCSI_CCI_ACK_COMPLETE &&
> > > +         test_and_clear_bit(ACK_PENDING, &udata->flags))
> > > +             complete(&udata->complete);
> > > +     if (cci & UCSI_CCI_COMMAND_COMPLETE &&
> > > +         test_and_clear_bit(COMMAND_PENDING, &udata->flags))
> > > +             complete(&udata->complete);
> >
> > ucsi_notify_common(). Why are you ignoring these functions?
> >
>
> I have missed these common functions mainly because our baseline is on
> the v6.6 kernel.

Please, don't send patches based on the old kernels. The development
should be done on the tip of the maintainer's tree.

> I will use ucsi_notify_common() however I noticed one
> major difference. The ucsi_notify_common() uses test_bit while above
> we use test_and_clear_bit. I will send a separate commit to change
> test_bit->test_and_clear_bit in the ucsi_notify_common() because usage
> of test_and_clear_bit fixes possible race condition.

Ack, thanks!

--=20
With best wishes
Dmitry
