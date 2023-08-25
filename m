Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452AE7E0
	for <chrome-platform@lists.linux.dev>; Fri, 25 Aug 2023 02:58:47 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2bcb89b476bso6665161fa.1
        for <chrome-platform@lists.linux.dev>; Thu, 24 Aug 2023 19:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692932325; x=1693537125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3zX4Zb+/ffsYg6eBe+TNid4MG/g6LStWIhoKJPVbas=;
        b=QF971O+bJsLvZ9A2DhNJTQBhjQiiG7vmdQxDxtALAwt1S3XJCKuBQWbZZMAeEWjHiY
         IOZcpB2pcxcDjQLP0j3gAakDNA7gfDXXNAV5n/R2bT2i1T6mcj4p7VP+RB6dGBz53Tba
         UBZFoyZNvcXAdk6SNSr6L4g+7vDHss0vKT7HE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692932325; x=1693537125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i3zX4Zb+/ffsYg6eBe+TNid4MG/g6LStWIhoKJPVbas=;
        b=IzpnSzDyKOuixKpClHJ67mI1dcP7LNeqBhM9m2bKifIoi0tWJneULJionKPZp5Gz11
         kdct0Ez764YI0TrRTy/5yGv6XHwL5Bmo1kt1VNDFhU2e6uffw5jFCxjqy0sSMSW+st6j
         19DuITc07d3VTsLNjd0mzxWSd4np9FgJYX5XDyzexXO+xeYGW3M2fsa3dC3ktiAv5uqr
         eQ+eqGbYooEsLPeLiLG0gXxT4VYxueEmXARsku6salc4gNpBtV+5OqZWAIBnvMVTDpRJ
         tYgVksFQRSeqIdpI+R604XEdIV8HwvuzNx60J3JxJqXvoSFIaHnX7zJ54qdirc3WlKQZ
         t/Vw==
X-Gm-Message-State: AOJu0YwY22ltcYfqtOGf4nGSNcWZpaj3P+JXzDUJxSYsSCUQvbXtnbcL
	T+ByJ5VQpo2RCRI/p0Gm31omJootKZsacRmMD3Rldg==
X-Google-Smtp-Source: AGHT+IFuAJ8RQxzqoJv6ilDeUOdyzRsdkgYgw1Ez/KEf+jHlvOd98qy2c7Bflc9X1+/D4C1D82gUS0YG3A1fj2lC6uU=
X-Received: by 2002:a2e:988d:0:b0:2b9:4413:864e with SMTP id
 b13-20020a2e988d000000b002b94413864emr12811186ljj.53.1692932325114; Thu, 24
 Aug 2023 19:58:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230814043140.1108917-1-rekanorman@chromium.org>
 <20230814043140.1108917-6-rekanorman@chromium.org> <67a1657a-e8f4-683c-375d-5ca6b1e75b9a@xs4all.nl>
In-Reply-To: <67a1657a-e8f4-683c-375d-5ca6b1e75b9a@xs4all.nl>
From: Reka Norman <rekanorman@chromium.org>
Date: Fri, 25 Aug 2023 12:58:32 +1000
Message-ID: <CAEmPcwssUgayw4B9Wemr818_zSQB5ir3Hpbvm5vFt8S7cLSE_g@mail.gmail.com>
Subject: Re: [PATCH 5/9] media: cros-ec-cec: Support multiple ports in MKBP cec_events
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Daisuke Nojiri <dnojiri@chromium.org>, 
	Stefan Adolfsson <sadolfsson@google.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

Thanks for the review.

On Mon, Aug 21, 2023 at 6:51=E2=80=AFPM Hans Verkuil <hverkuil-cisco@xs4all=
.nl> wrote:
>
> Hi Reka,
>
> On 14/08/2023 06:29, Reka Norman wrote:
> > Use the top four bits of the cec_events MKBP event to store the port
> > number.
> >
> > Signed-off-by: Reka Norman <rekanorman@chromium.org>
> > ---
> >
> >  drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 13 +++++++++++--
> >  include/linux/platform_data/cros_ec_commands.h   | 10 ++++++++++
> >  2 files changed, 21 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers=
/media/cec/platform/cros-ec/cros-ec-cec.c
> > index d674a432dfdd..eb4b778f83e9 100644
> > --- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> > +++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> > @@ -77,8 +77,17 @@ static void handle_cec_message(struct cros_ec_cec *c=
ros_ec_cec)
> >  static void handle_cec_event(struct cros_ec_cec *cros_ec_cec)
> >  {
> >       struct cros_ec_device *cros_ec =3D cros_ec_cec->cros_ec;
> > -     uint32_t events =3D cros_ec->event_data.data.cec_events;
> > -     struct cros_ec_cec_port *port =3D cros_ec_cec->ports[CEC_PORT];
> > +     uint32_t cec_events =3D cros_ec->event_data.data.cec_events;
> > +     int port_num =3D EC_MKBP_EVENT_CEC_GET_PORT(cec_events);
> > +     uint32_t events =3D EC_MKBP_EVENT_CEC_GET_EVENTS(cec_events);
> > +     struct cros_ec_cec_port *port;
> > +
> > +     if (port_num < 0 || port_num >=3D cros_ec_cec->num_ports) {
>
> Since cec_events is unsigned, then I would also keep port_num unsigned.
> Mixing signed and unsigned for bit shifting is a bit dangerous.
>
> That will also mean that you can skip the 'port_num < 0' check.

Done in v2.

>
> Regards,
>
>         Hans
>
> > +             dev_err(cros_ec->dev,
> > +                     "received CEC event for invalid port %d\n", port_=
num);
> > +             return;
> > +     }
> > +     port =3D cros_ec_cec->ports[port_num];
> >
> >       if (events & EC_MKBP_CEC_SEND_OK)
> >               cec_transmit_attempt_done(port->adap, CEC_TX_STATUS_OK);
> > diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/l=
inux/platform_data/cros_ec_commands.h
> > index 9a0c6e28f370..b7e8573a8a49 100644
> > --- a/include/linux/platform_data/cros_ec_commands.h
> > +++ b/include/linux/platform_data/cros_ec_commands.h
> > @@ -4440,6 +4440,16 @@ struct ec_response_i2c_passthru_protect {
> >
> >  #define MAX_CEC_MSG_LEN 16
> >
> > +/*
> > + * Helper macros for packing/unpacking cec_events.
> > + * bits[27:0] : bitmask of events from enum mkbp_cec_event
> > + * bits[31:28]: port number
> > + */
> > +#define EC_MKBP_EVENT_CEC_PACK(events, port) \
> > +             (((events) & GENMASK(27, 0)) | (((port) & 0xf) << 28))
> > +#define EC_MKBP_EVENT_CEC_GET_EVENTS(event) ((event) & GENMASK(27, 0))
> > +#define EC_MKBP_EVENT_CEC_GET_PORT(event) (((event) >> 28) & 0xf)
> > +
> >  /* CEC message from the AP to be written on the CEC bus */
> >  #define EC_CMD_CEC_WRITE_MSG 0x00B8
> >
>
