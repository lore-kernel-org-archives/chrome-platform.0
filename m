Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A362DCC02
	for <chrome-platform@lists.linux.dev>; Fri, 23 May 2025 03:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747971518; cv=none; b=D27HVeDlBf/HVUpZmXtpSpoVwk25S1BJwualpntNAtc9hvnv75+0zaDIpCckqlrPb2D0ODFAY9LbFZ9ingDajgDmYbHuGA9WmobUOOwaQ3ugduoN4tRMXKtwEfLOAT2THV5QJPMOWILseoUh8Rg4H9rPnU7/WBbJV8KQjirOT88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747971518; c=relaxed/simple;
	bh=gY81IBqdr2MJJpdeAjhACwU/lqkhSINg2XzYOOt5NjA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rv6sAKiEBJLNpJGFTLTLjkCvUu0olbe4BzF58wY4nfPxx/k0z61j758X2QNsnYFjTW6gDLlG5DG7RqJ1DVKjQB9ABhO+sBTe3D3z8GcJ9Zl7cy9KdZy9QXgKx/hDIU6ugflt5MbCA5tUG7dTGGkfQxNCNwN1J5kAdagEnXdFhhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c77hfNWe; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c77hfNWe"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so100437715e9.2
        for <chrome-platform@lists.linux.dev>; Thu, 22 May 2025 20:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747971515; x=1748576315; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8E8fs4w9nbh5X9DvFltT69S7NoWxtHx4dMDftWnVp0=;
        b=c77hfNWeXG8/c+U0Aun2N2IlPiPXH39ZikyhcvaMVVMPoBPDbWns3cJsT+tDheHB36
         xfjAMtoCm9p4BymUw4fGTN3wqjrsVDzNziO+ULpq/nInJFqYyvTUZPw7MpLpqiMni4Dw
         4oBgpaJJYdglGJoZdiVwRWmZrNLc22vRRUvaWyEV9ZNsY9gkjqexYtf+eA0b4rjsmPTI
         7eS1JcpbAYT72mdNanMltRfNop/jabZJvWP/1uad6lHPDFQnShH9g98q3dv+1VyMXlH+
         LKNa1h75ZUNulQYB0q4+WdMMaGpl/BvJq5Az2szQisxWr2/6xCLvdmyH8TiZeL8MNLM6
         Vagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747971515; x=1748576315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b8E8fs4w9nbh5X9DvFltT69S7NoWxtHx4dMDftWnVp0=;
        b=rvXPlKAwfNXX0i7f1LGweLiWBeshuOmq1e7RnAwG4NxPhHLDUIegyasZIrhbkGuXD1
         PwX+ajLEOOLPneRennz0vi56zaN2+rCtaxZGlr87lEHqioPdw8NC2eo3mWucPaPVKKJU
         ZNwGERGvLea4Uts9VCfwXACVMwI7/8gEv2v3MYflyEKNVyWqnNMxdn672Eo/7wE1gI6j
         OqG27urFZX4VnGTFu2GrXpQdtHlg0FkR5gGgD8blu2H14QG9snT+4phkozae7dp8Qu6F
         PpMKlPEpwoM+v1Cepgm0BBGubR5kYfita2PlCC9p5dZT4IOWcNwa4tMjDTLDA5k+aIs3
         4pTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfZwAR8fcAmfzTVlt5ROILAg3Hk1wnUtmdS7Y6aN8hSid2W1A4GR8h2Qvgvy0J4XKS9oT+9WhbiNRDLYgMpVg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwooSh37VCVbPze1WT9expEJ/0qxbw20zlAnn2nyzgC/RTtGf8m
	CwdUAeQtRRYOlAXEpdk1F1nladDRXFbLWteyVFqkwy+13r42jsU5JRQJLC0bVEeGMnf27rAFBzm
	j2AQyKSMkyk7RSySHh0k59nj0P3GGczaFahRcNbkZ
X-Gm-Gg: ASbGncvcelkf/c96iJlMbMaM09ER77QuegJk8+tOBrrRTllPYKUwp/h30SK+pm/ZM9Z
	FTLOOWJd2dqfgnwDOQCdHr0QagG1uQwLgrV5tWeQSUl3jqAN/ZDWy9fu/IKjr641afJL/JaHW1U
	opFglgwMTkygQinBcLfBxUdfn83Zp3+WsGcFTYWpENPls5nHHRN67y1vvjY0qp3DAqXMR3VG3ja
	bn2
X-Google-Smtp-Source: AGHT+IEJaEktgtgyt9q3yUhzR2G7nmOfMZxNVT3kv4+VFkzgEKvvFdgM7p2S4DqKo4aPHY84alinuUOiJAp/QCa7Z58=
X-Received: by 2002:a05:6000:4383:b0:3a2:561a:41f1 with SMTP id
 ffacd0b85a97d-3a4c20ef539mr1184990f8f.12.1747971514663; Thu, 22 May 2025
 20:38:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250521235108.2088274-1-gwendal@google.com> <aC6dLPFopj8lL_kE@google.com>
In-Reply-To: <aC6dLPFopj8lL_kE@google.com>
From: Gwendal Grignou <gwendal@google.com>
Date: Thu, 22 May 2025 20:38:22 -0700
X-Gm-Features: AX0GCFu_BZF3aBPGImWHmjWLu1DHuR7AqS4yOljLRbGRRdxyI2Gte9UZr1OzD6I
Message-ID: <CAMHSBOX9sZYMysbdv2Qt7h-R+1TMSjnr3kCfo3LnmcRfBfdOwA@mail.gmail.com>
Subject: Re: [PATCH v2] iio: cros_ec_sensors: add cros_ec_activity driver
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Gwendal Grignou <gwendal@chromium.org>, jic23@kernel.org, chrome-platform@lists.linux.dev, 
	linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 8:42=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Wed, May 21, 2025 at 04:51:08PM -0700, Gwendal Grignou wrote:
> > diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_activity.c b/dr=
ivers/iio/common/cros_ec_sensors/cros_ec_activity.c
> > [...]
> > +/*
> > + * cros_ec_sensors_activity - Driver for activities/gesture recognitio=
n.
>
> s/sensors//.

Done.
>
>
> > +static int cros_ec_write_event_config(struct iio_dev *indio_dev,
> > [...]
> > +     switch (chan->type) {
> > +     case IIO_PROXIMITY:
> > +             st->core.param.set_activity.activity =3D
> > +                     MOTIONSENSE_ACTIVITY_BODY_DETECTION;
> > +             break;
> > +     case IIO_ACTIVITY:
> > +             if (chan->channel2 =3D=3D IIO_MOD_STILL) {
> > +                     st->core.param.set_activity.activity =3D
> > +                             MOTIONSENSE_ACTIVITY_SIG_MOTION;
> > +             } else {
> > +                     dev_warn(&indio_dev->dev, "Unknown activity: %d\n=
",
> > +                              chan->channel2);
> > +             }
> > +             break;
> > +     default:
> > +             dev_warn(&indio_dev->dev, "Unknown channel type: %d\n",
> > +                      chan->type);
> > +     }
> > +     st->core.param.set_activity.enable =3D state;
> > +
> > +     ret =3D cros_ec_motion_send_host_cmd(&st->core, 0);
> > +
> > +     mutex_unlock(&st->core.cmd_lock);
> > +     return ret;
>
> If either activity or channel type is unknown, does it still need to send
> the host command for writing the config?
Fixed: argument checking now done in one place.

>
>
> > +static int cros_ec_sensors_probe(struct platform_device *pdev)
> > [...]
> > +     /*
> > +      * List all available activities
> > +      */
> > +     st->core.param.cmd =3D MOTIONSENSE_CMD_LIST_ACTIVITIES;
> > +     ret =3D cros_ec_motion_send_host_cmd(&st->core, 0);
> > +     if (ret)
> > +             return ret;
> > +     activities =3D st->core.resp->list_activities.enabled |
> > +                  st->core.resp->list_activities.disabled;
> > +     nb_activities =3D hweight_long(activities) + 1;
>
> See review comments for v1 too.  Moving the line just right before the
> following devm_kcalloc() for `st->channels` makes more sense.
Done.
>
> > +
> > +     if (!activities)
> > +             return -ENODEV;
> > +
> > +     /* Allocate a channel per activity and one for timestamp */
> > +     st->channels =3D devm_kcalloc(dev, nb_activities,
> > +                                 sizeof(*st->channels), GFP_KERNEL);
> > +     if (!st->channels)
> > +             return -ENOMEM;
> > +
> > +     channel =3D &st->channels[0];
> > +     index =3D 0;
> > +     for_each_set_bit(i, &activities, BITS_PER_LONG) {
> > +             channel->scan_index =3D index++;
>
> This doesn't look correct.  It generates some unused `index` if the activ=
ity
> is unknown.
>
> Moving the statement to the end of loop?  See review comments for v1 too.
I now understand the v1 comments. Fixed.
