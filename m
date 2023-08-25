Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F467E0
	for <chrome-platform@lists.linux.dev>; Fri, 25 Aug 2023 03:03:43 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2bcc14ea414so6876041fa.0
        for <chrome-platform@lists.linux.dev>; Thu, 24 Aug 2023 20:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692932621; x=1693537421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPWKG3dxbHkGwyax5DQ9915q417h/RTACGkSmV/shts=;
        b=LqkMuwDrmmcQtKK2i46vuP6VTHOk+2bs/Wza6BVmRC4sZfzm4IbYxxTqdsdWgfpZFD
         YJeZ3LaQT53JHeqcQ5yxcfpTgYYmkM612E67b6cMVGeLXNSKVglf+rGmVioxdzrDsM5Y
         jJGRwXLDmeCsINRJWN7z9wZ3JpEyOFaqcGU5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692932621; x=1693537421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CPWKG3dxbHkGwyax5DQ9915q417h/RTACGkSmV/shts=;
        b=JPto0NtVgRIPsHbAAnzDfnDT6IwOo6zDTx8h7VUuVXerCgp9VURXInTBoU36BtfxJA
         dm1mQn5YZ040NHNfrKL8T7O5PQL37+X1jNquBM07T7I4YrT6QnoJCsnR4fTiQYPzk+4Z
         YQX2FQdUJ4kH4Eo84Fwv6YbK/qPBTABkxOBz52qQXjdb+18UtqCYZCmW923EJKDCcq4I
         s1fut7YCD/BXMmfUx865iko936n1/FNQ519zIAHMgaEK5cxpSb4aTC/HfJAqPyfrm3i+
         ZjeWf6Ui1VVwTUBo/DnnAJrMsks6xFin76lJ4xvIHiwkVJiJnj+63EMB0KWlvADQb90K
         H+jA==
X-Gm-Message-State: AOJu0Yy2HQHN9Uk2+lWDQ/rhaiB9rkEClKxruiFFTlU3JUlbXfVrGARf
	Oe5vpcQDnN4YFr/BKQtd4iQSBJW8YmFZtlRU1vfF4A==
X-Google-Smtp-Source: AGHT+IGepd8funMGv1ExI6nQq12P8J1miSkohbjj4Ha0OzZTPpjs4rKMBTlcYvBBfK46alWKRfXBKiiITlRClrjRBHU=
X-Received: by 2002:a2e:a418:0:b0:2bc:d6a8:1ef2 with SMTP id
 p24-20020a2ea418000000b002bcd6a81ef2mr7416257ljn.12.1692932621292; Thu, 24
 Aug 2023 20:03:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230814043140.1108917-1-rekanorman@chromium.org>
 <20230814043140.1108917-8-rekanorman@chromium.org> <a834b202-7d5c-2a04-fc69-1913cd063a67@xs4all.nl>
 <CABXOdTdkBM70i=cbBak99ph=P0roaRvhiRpE8O7t4JNkGWUDAw@mail.gmail.com>
In-Reply-To: <CABXOdTdkBM70i=cbBak99ph=P0roaRvhiRpE8O7t4JNkGWUDAw@mail.gmail.com>
From: Reka Norman <rekanorman@chromium.org>
Date: Fri, 25 Aug 2023 13:03:29 +1000
Message-ID: <CAEmPcwu_31jEv4ATAxyHsc8JcWMUBcvaAVtfmXOKvX33-DuK-g@mail.gmail.com>
Subject: Re: [PATCH 7/9] media: cros-ec-cec: Allow specifying multiple HDMI connectors
To: Guenter Roeck <groeck@google.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Neil Armstrong <narmstrong@baylibre.com>, 
	Daisuke Nojiri <dnojiri@chromium.org>, Stefan Adolfsson <sadolfsson@google.com>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 21, 2023 at 11:15=E2=80=AFPM Guenter Roeck <groeck@google.com> =
wrote:
>
> On Mon, Aug 21, 2023 at 2:12=E2=80=AFAM Hans Verkuil <hverkuil-cisco@xs4a=
ll.nl> wrote:
> >
> > Hi Reka,
> >
> > On 14/08/2023 06:29, Reka Norman wrote:
> > > Update the cec_dmi_match_table to allow specifying multiple HDMI
> > > connectors for each device.
> > >
> > > Signed-off-by: Reka Norman <rekanorman@chromium.org>
> > > ---
> > >
> > >  .../media/cec/platform/cros-ec/cros-ec-cec.c  | 47 +++++++++++------=
--
> > >  1 file changed, 28 insertions(+), 19 deletions(-)
> > >
> > > diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drive=
rs/media/cec/platform/cros-ec/cros-ec-cec.c
> > > index c68ed5d4bda0..f2f397d9a6d8 100644
> > > --- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> > > +++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> > > @@ -284,38 +284,41 @@ static SIMPLE_DEV_PM_OPS(cros_ec_cec_pm_ops,
> > >  #if IS_ENABLED(CONFIG_PCI) && IS_ENABLED(CONFIG_DMI)
> > >
> > >  /*
> > > - * The Firmware only handles a single CEC interface tied to a single=
 HDMI
> > > - * connector we specify along with the DRM device name handling the =
HDMI output
> > > + * Specify the DRM device name handling the HDMI output and the HDMI=
 connector
> > > + * corresponding to each CEC port. The order of connectors must matc=
h the order
> > > + * in the EC (first connector is EC port 0, ...), and the number of =
connectors
> > > + * must match the number of ports in the EC (which can be queried us=
ing the
> > > + * EC_CMD_CEC_PORT_COUNT host command).
> > >   */
> > >
> > >  struct cec_dmi_match {
> > >       const char *sys_vendor;
> > >       const char *product_name;
> > >       const char *devname;
> > > -     const char *conn;
> > > +     const char *conns[EC_CEC_MAX_PORTS];
> >
> > Since EC_CEC_MAX_PORTS is 16, this will waste a lot of space here.
> >
> > I would suggest creating a separate define (CEC_MAX_PORTS?) that is set
> > to 2 and is the max port that is actually used.
> >
>
> Possibly it could also be declared as const char * const ** and be
> terminated with NULL (though that would require {{ "Port B", NULL } in
> the declarations). Not sure which one is better.

I went with Guenter's suggestion. Let me know what you think.

>
> Guenter
>
> > When you get the actual number of ports from the EC you can check if
> > CEC_MAX_PORTS isn't too small and return an error if it is.
> >
> > You can use CEC_MAX_PORTS here and in the ports array of struct cros_ec=
_cec.
> >
> > Regards,
> >
> >         Hans
> >
> > >  };
> > >
> > >  static const struct cec_dmi_match cec_dmi_match_table[] =3D {
> > >       /* Google Fizz */
> > > -     { "Google", "Fizz", "0000:00:02.0", "Port B" },
> > > +     { "Google", "Fizz", "0000:00:02.0", { "Port B" } },
> > >       /* Google Brask */
> > > -     { "Google", "Brask", "0000:00:02.0", "Port B" },
> > > +     { "Google", "Brask", "0000:00:02.0", { "Port B" } },
> > >       /* Google Moli */
> > > -     { "Google", "Moli", "0000:00:02.0", "Port B" },
> > > +     { "Google", "Moli", "0000:00:02.0", { "Port B" } },
> > >       /* Google Kinox */
> > > -     { "Google", "Kinox", "0000:00:02.0", "Port B" },
> > > +     { "Google", "Kinox", "0000:00:02.0", { "Port B" } },
> > >       /* Google Kuldax */
> > > -     { "Google", "Kuldax", "0000:00:02.0", "Port B" },
> > > +     { "Google", "Kuldax", "0000:00:02.0", { "Port B" } },
> > >       /* Google Aurash */
> > > -     { "Google", "Aurash", "0000:00:02.0", "Port B" },
> > > +     { "Google", "Aurash", "0000:00:02.0", { "Port B" } },
> > >       /* Google Gladios */
> > > -     { "Google", "Gladios", "0000:00:02.0", "Port B" },
> > > +     { "Google", "Gladios", "0000:00:02.0", { "Port B" } },
> > >       /* Google Lisbon */
> > > -     { "Google", "Lisbon", "0000:00:02.0", "Port B" },
> > > +     { "Google", "Lisbon", "0000:00:02.0", { "Port B" } },
> > >  };
> > >
> > >  static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
> > > -                                             const char **conn)
> > > +                                             const char * const **co=
nns)
> > >  {
> > >       int i;
> > >
> > > @@ -332,7 +335,7 @@ static struct device *cros_ec_cec_find_hdmi_dev(s=
truct device *dev,
> > >                       if (!d)
> > >                               return ERR_PTR(-EPROBE_DEFER);
> > >                       put_device(d);
> > > -                     *conn =3D m->conn;
> > > +                     *conns =3D m->conns;
> > >                       return d;
> > >               }
> > >       }
> > > @@ -346,7 +349,7 @@ static struct device *cros_ec_cec_find_hdmi_dev(s=
truct device *dev,
> > >  #else
> > >
> > >  static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
> > > -                                             const char **conn)
> > > +                                             const char * const **co=
nns)
> > >  {
> > >       return ERR_PTR(-ENODEV);
> > >  }
> > > @@ -388,7 +391,7 @@ static int cros_ec_cec_get_write_cmd_version(stru=
ct cros_ec_cec *cros_ec_cec)
> > >  static int cros_ec_cec_init_port(struct device *dev,
> > >                                struct cros_ec_cec *cros_ec_cec,
> > >                                int port_num, struct device *hdmi_dev,
> > > -                              const char *conn)
> > > +                              const char * const *conns)
> > >  {
> > >       struct cros_ec_cec_port *port;
> > >       int ret;
> > > @@ -406,7 +409,13 @@ static int cros_ec_cec_init_port(struct device *=
dev,
> > >       if (IS_ERR(port->adap))
> > >               return PTR_ERR(port->adap);
> > >
> > > -     port->notify =3D cec_notifier_cec_adap_register(hdmi_dev, conn,
> > > +     if (!conns[port_num]) {
> > > +             dev_err(dev, "no conn for port %d\n", port_num);
> > > +             ret =3D -ENODEV;
> > > +             goto out_probe_adapter;
> > > +     }
> > > +
> > > +     port->notify =3D cec_notifier_cec_adap_register(hdmi_dev, conns=
[port_num],
> > >                                                     port->adap);
> > >       if (!port->notify) {
> > >               ret =3D -ENOMEM;
> > > @@ -435,10 +444,10 @@ static int cros_ec_cec_probe(struct platform_de=
vice *pdev)
> > >       struct cros_ec_cec *cros_ec_cec;
> > >       struct cros_ec_cec_port *port;
> > >       struct device *hdmi_dev;
> > > -     const char *conn =3D NULL;
> > > +     const char * const *conns =3D NULL;
> > >       int ret;
> > >
> > > -     hdmi_dev =3D cros_ec_cec_find_hdmi_dev(&pdev->dev, &conn);
> > > +     hdmi_dev =3D cros_ec_cec_find_hdmi_dev(&pdev->dev, &conns);
> > >       if (IS_ERR(hdmi_dev))
> > >               return PTR_ERR(hdmi_dev);
> > >
> > > @@ -460,7 +469,7 @@ static int cros_ec_cec_probe(struct platform_devi=
ce *pdev)
> > >
> > >       for (int i =3D 0; i < cros_ec_cec->num_ports; i++) {
> > >               ret =3D cros_ec_cec_init_port(&pdev->dev, cros_ec_cec, =
i,
> > > -                                         hdmi_dev, conn);
> > > +                                         hdmi_dev, conns);
> > >               if (ret)
> > >                       goto unregister_ports;
> > >       }
> >
