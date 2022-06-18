Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1830E7B
	for <chrome-platform@lists.linux.dev>; Sat, 18 Jun 2022 14:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A4D6C3411A;
	Sat, 18 Jun 2022 14:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655560813;
	bh=nbedwoOGsiHqIewd4JSYwDo9aXnZoWduwriV5wUz5B4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nu2K7HRaJKWv24RQuqt8MSBkiDuEZYqIxcm0jNK8uVBeW1Xsv1qk5hRN3HoinemIG
	 yTR4SBgT+FwFNvEKaIwC+hiGFha6+LEBlq/49oXgmjFRrdRtQ2QLBjAzJRxOpQHOJS
	 XxbrUDYc7cSdN8iKaIrwU1k445tKr+Hzs2SqzbIyfutKBehB4W1B3MBy0KlDX3vxcQ
	 RXvsmYLcHxMGBC8p06WN5eGI0dY1vWpdHXWVHdfo+28MeaDUcCKxoHahuZ+oKlcXG+
	 weXfg3Ekyu4hnOqooBzaq8TN4k2YcipDM8yeO/+M8yc491g7FaRsB5ABD4SQItSn7R
	 InY0ZcJpjGMcw==
Date: Sat, 18 Jun 2022 15:09:30 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, dl-linux-imx <linux-imx@nxp.com>, Linux-Renesas
 <linux-renesas-soc@vger.kernel.org>, "open list:BROADCOM NVRAM DRIVER"
 <linux-mips@vger.kernel.org>, linux-arm Mailing List
 <linux-arm-kernel@lists.infradead.org>, chrome-platform@lists.linux.dev,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, "ARM/Mediatek
 \"SoC support        " <linux-mediatek@lists.infradead.org>,	
 ""linux-stm32@st-md-mailman.stormreply.com, linux-arm-msm	
 ""<linux-arm-msm@vger.kernel.org>, linux-iio 
 ""<linux-iio@vger.kernel.org>,	OpenBMC Maillist 
 ""<openbmc@lists.ozlabs.org>, Cai Huoqing	<cai.huoqing@linux.dev>, 
 ""Benjamin Fair <benjaminfair@google.com>, Jishnu	Prakash 
 ""<quic_jprakash@quicinc.com>, Linus Walleij	 ""<linus.walleij@linaro.org>,
 Lars-Peter Clausen <lars@metafoo.de>,	 ""Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Amit Kucheria	 ""<amitk@kernel.org>, Andy
 Gross <agross@kernel.org>, Michael  ""Hennerich
 <Michael.Hennerich@analog.com>, Haibo Chen  ""<haibo.chen@nxp.com>, Benson
 Leung <bleung@chromium.org>,  Rafael  ""J.Wysocki  <rafael@kernel.org>,
 Alexandre Belloni  ""<alexandre.belloni@bootlin.com>, Christophe
 Branchereau	 ""<cbranchereau@gmail.com>, Patrick Venture
 <venture@google.com>, Arnd	 ""Bergmann <arnd@arndb.de>, Nancy Yuen
 <yuenn@google.com>, Sascha  ""Hauer	<s.hauer@pengutronix.de>, Daniel
 Lezcano  ""<daniel.lezcano@linaro.org>,	Gwendal Grignou
 <gwendal@chromium.org>,  "Saravanan "Sekar	<sravanhome@gmail.com>, Tali
 Perry <tali.perry1@gmail.com>,  ""Maxime	Coquelin
 <mcoquelin.stm32@gmail.com>, Paul Cercueil	 ""<paul@crapouillou.net>, Thara
 Gopinath <thara.gopinath@linaro.org>,  ""Avi	Fishman
 <avifishman70@gmail.com>, Lorenzo Bianconi  ""<lorenzo@kernel.org>,	Claudiu
 Beznea <claudiu.beznea@microchip.com>,  ""Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabrice Gasnier  ""<fabrice.gasnier@foss.st.com>,
 Matthias Brugger  ""<matthias.bgg@gmail.com>, Tomer Maimon
 <tmaimon77@gmail.com>, Bjorn  ""Andersson <bjorn.andersson@linaro.org>,
 Nicolas Ferre  ""<nicolas.ferre@microchip.com>, Zhang Rui
 <rui.zhang@intel.com>,  "Shawn "Guo <shawnguo@kernel.org>, Guenter Roeck
 <groeck@chromium.org>,  ""Fabio Estevam <festevam@gmail.com>, Olivier
 Moysan	 ""<olivier.moysan@foss.st.com>, Eugen Hristev	
 ""<eugen.hristev@microchip.com>, Miquel Raynal	
 ""<miquel.raynal@bootlin.com>" <>
Subject: Re: [PATCH 24/34] iio: inkern: move to fwnode properties
Message-ID: <20220618150930.5e9f8d01@jic23-huawei>
In-Reply-To: <0871a5e498b0bfdce379523a03352da96fddc9cb.camel@gmail.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	<20220610084545.547700-25-nuno.sa@analog.com>
	<CAHp75Vf6dYFR8TESk6oj=SFiXmw-tBAa9Fz-jhRk57ARumxzhA@mail.gmail.com>
	<97b9278953d923008a4c1230ca9bd354117e7213.camel@gmail.com>
	<20220611163057.2e2606aa@jic23-huawei>
	<20220611163257.6c0b847e@jic23-huawei>
	<0871a5e498b0bfdce379523a03352da96fddc9cb.camel@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 13 Jun 2022 09:13:00 +0200
Nuno S=C3=A1 <noname.nuno@gmail.com> wrote:

> On Sat, 2022-06-11 at 16:32 +0100, Jonathan Cameron wrote:
> > On Sat, 11 Jun 2022 16:30:57 +0100
> > Jonathan Cameron <jic23@kernel.org> wrote:
> >  =20
> > > On Fri, 10 Jun 2022 22:01:09 +0200
> > > Nuno S=C3=A1 <noname.nuno@gmail.com> wrote:
> > >  =20
> > > > On Fri, 2022-06-10 at 17:19 +0200, Andy Shevchenko wrote:=C2=A0  =20
> > > > > On Fri, Jun 10, 2022 at 10:48 AM Nuno S=C3=A1 <nuno.sa@analog.com>
> > > > > wrote:=C2=A0=C2=A0=C2=A0  =20
> > > > > >=20
> > > > > > This moves the IIO in kernel interface to use fwnode
> > > > > > properties and
> > > > > > thus
> > > > > > be firmware agnostic.
> > > > > >=20
> > > > > > Note that the interface is still not firmware agnostic. At
> > > > > > this
> > > > > > point we
> > > > > > have both OF and fwnode interfaces so that we don't break any
> > > > > > user.
> > > > > > On
> > > > > > top of this we also want to have a per driver conversion and
> > > > > > that
> > > > > > is the
> > > > > > main reason we have both of_xlate() and fwnode_xlate()
> > > > > > support.=C2=A0=C2=A0=C2=A0  =20
> > > > >=20
> > > > > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > > > > Thanks!
> > > > >=20
> > > > > A few nit-picks below, though.
> > > > > =C2=A0=C2=A0=C2=A0  =20
> > > ...
> > >  =20
> > > > =C2=A0  =20
> > > > > =C2=A0=C2=A0=C2=A0  =20
> > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D of_parse_phandle_=
with_args(np, "io-channels",
> > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 "#io-channel-cells",
> > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 index, &iiospec);
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D fwnode_property_g=
et_reference_args(fwnode, "io-
> > > > > > channels",
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "#=
io-
> > > > > > channel-
> > > > > > cells", 0,
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in=
dex,
> > > > > > &iiospec);
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err)
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 return err;
> > > > > >=20
> > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 idev =3D bus_find_device(=
&iio_bus_type, NULL,
> > > > > > iiospec.np,
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 idev =3D bus_find_device(=
&iio_bus_type, NULL,
> > > > > > iiospec.fwnode,
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iio_dev_node_match);=C2=A0=C2=A0=
=C2=A0  =20
> > > > >=20
> > > > > Wondering if this
> > > > > https://elixir.bootlin.com/linux/v5.19-rc1/C/ident/bus_find_devic=
e_by_fwnode
> > > > > can be utilized (yes, I noticed iio_device_type above).=C2=A0=C2=
=A0=C2=A0  =20
> > > >=20
> > > > Hmm, at first glance I would say we can use it. AFAICT, we are
> > > > already
> > > > grabbing a node which contains "#io-channel-cells" which is very
> > > > indicative that is an IIO device. I also find it very unlikely to
> > > > have
> > > > two IIO devices with the same fwnode (I guess it would be an
> > > > issue even
> > > > in the old code) and even more unlikely two devices of diferent
> > > > types
> > > > with the same fwnode?=C2=A0  =20
> > >=20
> > > If we are talking struct iio_dev instances, then there are quite a
> > > few cases
> > > where there are multiple with the same fwnode.=C2=A0 We had to do that
> > > pre
> > > multiple buffers being introduced so it's fairly common, though not
> > > in
> > > ADCs which is probably why we haven't seen breakage here. Not sure
> > > how
> > > broken things already are as a result or if any of those devices
> > > (most
> > > IMUs) provide #io-channel-cells etc.=C2=A0 I'd put that breakage down=
 as
> > > one to look into if anyone every hits it or one of us is bored
> > > enough
> > > to poke at it.=C2=A0 (superficially I think we'd have to check all
> > > matches
> > > for an xlate success). =20
> >=20
> > Having said that adding a warning comment here, so we remember this
> > is
> > a potential issue would be great.
> >  =20
>=20
> can add the warning... And AFAIU, we can go with Andy suggestion right?

Yes, I think so...   Might chance my mind when I see the code though :)

Jonathan



>=20
> - Nuno S=C3=A1
>=20

