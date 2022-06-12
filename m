Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4AD7C
	for <chrome-platform@lists.linux.dev>; Sun, 12 Jun 2022 17:44:57 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-f2cbceefb8so5745572fac.11
        for <chrome-platform@lists.linux.dev>; Sun, 12 Jun 2022 10:44:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xNhFuNm1nmnzKrxqQuO4XyzP0cAuS/p9Ps9ar4/pkNA=;
        b=sHI87RJphAeTcbnIoMYre5S5fUbSAUNGsH+AIoLI/j6y5HzRAc05hS+9ce/eCgRQkk
         VJ2fQrriEst1mF97Xws4SVCDB4DzfFit21ViSQRUbON40E69MutclI8922PUj0FEmM10
         EM5WMuVLgmOB/RVgtY7sBgsWQ96ysipDhGG+ad7iHo31qEgQt0IHHUEDZLjmN3rE5tcq
         c4xWpJeA8RrvYN+6hS9785riUqi8DIghFEFuXMFLm0KHnaXsQnOqo3b61qGxG5seMHlW
         D9FU9nj8crf7oILIR7SdGmyXCx1xsIm4rPGUO67M/VCPLkNGYpFSvjxg799HEm1nm1Kz
         oM2g==
X-Gm-Message-State: AOAM5310XHmpY0Mzjd+syrJp4Q8CbVqv7dR7NUMBWC5PQrwoD5u5JnEk
	KdxrgRmchI1lwHP2Qld7iAxQC3B3anc7xQ==
X-Google-Smtp-Source: ABdhPJzSMSH36ku78/OGXvq17GXCf0X7BXmgqGsEBGmQ2ouwMSX3gUS/+nUUwHRC65PI7gA3V0nf1A==
X-Received: by 2002:a05:6870:4188:b0:d9:eed0:5a41 with SMTP id y8-20020a056870418800b000d9eed05a41mr5618900oac.161.1655055896384;
        Sun, 12 Jun 2022 10:44:56 -0700 (PDT)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com. [209.85.210.43])
        by smtp.gmail.com with ESMTPSA id y20-20020aca4b14000000b003289f51c2d7sm2303644oia.34.2022.06.12.10.44.56
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jun 2022 10:44:56 -0700 (PDT)
Received: by mail-ot1-f43.google.com with SMTP id 111-20020a9d0378000000b0060c2db66d44so2995640otv.6
        for <chrome-platform@lists.linux.dev>; Sun, 12 Jun 2022 10:44:56 -0700 (PDT)
X-Received: by 2002:a81:4811:0:b0:30c:8021:4690 with SMTP id
 v17-20020a814811000000b0030c80214690mr60597100ywa.47.1655055588159; Sun, 12
 Jun 2022 10:39:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220610084545.547700-1-nuno.sa@analog.com> <20220610084545.547700-35-nuno.sa@analog.com>
 <YqNo6U8r80aNFzUr@spruce> <d083dd2c7e9e6eefb32124648a06799a9ebe8dfd.camel@gmail.com>
In-Reply-To: <d083dd2c7e9e6eefb32124648a06799a9ebe8dfd.camel@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 12 Jun 2022 19:39:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtLQOo2fiTHA-CBgWZE0hbPVUzv77sKrf_Qz8oHp7bkA@mail.gmail.com>
Message-ID: <CAMuHMdXtLQOo2fiTHA-CBgWZE0hbPVUzv77sKrf_Qz8oHp7bkA@mail.gmail.com>
Subject: Re: [PATCH 34/34] iio: inkern: fix coding style warnings
To: =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>
Cc: Joe Simmons-Talbott <joetalbott@gmail.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, chrome-platform@lists.linux.dev, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-iio@vger.kernel.org, 
	openbmc@lists.ozlabs.org, Cai Huoqing <cai.huoqing@linux.dev>, 
	Benjamin Fair <benjaminfair@google.com>, Jishnu Prakash <quic_jprakash@quicinc.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Amit Kucheria <amitk@kernel.org>, 
	Andy Gross <agross@kernel.org>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Benson Leung <bleung@chromium.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Christophe Branchereau <cbranchereau@gmail.com>, Patrick Venture <venture@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Nancy Yuen <yuenn@google.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Gwendal Grignou <gwendal@chromium.org>, 
	Saravanan Sekar <sravanhome@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Thara Gopinath <thara.gopinath@linaro.org>, Avi Fishman <avifishman70@gmail.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Jonathan Cameron <jic23@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Shawn Guo <shawnguo@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Fabio Estevam <festevam@gmail.com>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Eugen Hristev <eugen.hristev@microchip.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nuno,

On Fri, Jun 10, 2022 at 9:52 PM Nuno S=C3=A1 <noname.nuno@gmail.com> wrote:
> On Fri, 2022-06-10 at 11:53 -0400, Joe Simmons-Talbott wrote:
> > On Fri, Jun 10, 2022 at 10:45:45AM +0200, Nuno S=C3=A1 wrote:
> > > Just cosmetics. No functional change intended...
> > >
> > > Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>

> > > --- a/drivers/iio/inkern.c
> > > +++ b/drivers/iio/inkern.c
> > > @@ -45,13 +45,13 @@ int iio_map_array_register(struct iio_dev
> > > *indio_dev, struct iio_map *maps)
> > >         int i =3D 0, ret =3D 0;
> > >         struct iio_map_internal *mapi;
> > >
> > > -       if (maps =3D=3D NULL)
> > > +       if (!maps)
> > >                 return 0;
> > >
> > >         mutex_lock(&iio_map_list_lock);
> > > -       while (maps[i].consumer_dev_name !=3D NULL) {
> > > +       while (!maps[i].consumer_dev_name) {
> >
> > Shouldn't this be?:
> > while (maps[i].consumer_dev_name) {
>
> Ups... Nice catch! I was probably in bot mode already.

When making a change with no functional change intended, it is always
a good idea to compare the generated assembler before/after.  I.e.

    make drivers/iio/inkern.s
    mv drivers/iio/inkern.s drivers/iio/inkern.s.orig
    [make your change]
    make drivers/iio/inkern.s
    diff -u drivers/iio/inkern.s{.orig,}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
