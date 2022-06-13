Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E672110D
	for <chrome-platform@lists.linux.dev>; Mon, 13 Jun 2022 07:12:06 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id b142so3441536qkg.2
        for <chrome-platform@lists.linux.dev>; Mon, 13 Jun 2022 00:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=CARzOhYa0Bq3oLzQ6+ESrz053Opffty25qsyQWttPZQ=;
        b=fuFLE6ojAwwBY6HRW/sl+mBfTTz+LdXGpDMqdxjgdWrNoiqWPoQLpoZK2MnjvYpdKu
         o7ESKst7fcbjeRLJPRkelk8JHg04HXhHzPx68PUQnP8ixvV3C5uBT/exerZWuktMfDhy
         eoHLkCNo8JB4jPJ/e46Iy1ZrWMDM3lG83ldbu3if1vbYILWQa3UFymWttNUN9Nb8vHHF
         tHZ7EpJoMKN76oyUKYN4pnVJ9lZQ4osh52Dhd3wAaWeL1G+2daJVm/91q8o8BgWfTNrS
         8TLZOCczUGoZ2+xgzyl1rZsTt+a1oEE/4zxMw/vnlYI8/xye32Z1VTuoJ0kU1l8C9T+W
         v+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=CARzOhYa0Bq3oLzQ6+ESrz053Opffty25qsyQWttPZQ=;
        b=4L9+npqqmVBrakOM3q36zTlxDszXDvsPeVRyzznaiZUWodRAsbuqguUdHQaUd9kKRf
         lYNn3BJYVmQSRiXWWseTTVoJwJmFywK6vDs2MW7NXDqQp6HsGjFb4klmmPps78mJi2lv
         GvvPD4TqDm4gygUggFPhKO2dBqJKBSXOCdW+uOfjFBkoM0lRdihqrSXR6nuSuJW7LC+r
         zBMOeaoqH48wEhQm8X8ilRY4GEVRgQX+fsslwHoILDlqAnxan6H9yWrhgD0KcMz5bo/V
         /Xsu2bhow/RRcVJcF8uCGCUzd+VlhvxL+QkWOLugTmwR0EJj0A7ESlCDLj98iX7EKHvM
         29Ww==
X-Gm-Message-State: AOAM533HbJMSvE/mr1T8WdK1vP0vasDUCJhoYrDZJ1WdioUGtpfG+mXp
	pV+1C3IwxlI9QDWZagF1fPc=
X-Google-Smtp-Source: ABdhPJzc/vmaIzEeciICJuA01Ad/d12ZQRxfA8OgCOgQaNlGi51nGR9xlGw91C/jhdHMCbHPMs7fyA==
X-Received: by 2002:a37:4054:0:b0:6a7:8358:2d72 with SMTP id n81-20020a374054000000b006a783582d72mr3743018qka.414.1655104325361;
        Mon, 13 Jun 2022 00:12:05 -0700 (PDT)
Received: from p200300f6ef062c0090c03b551078f99d.dip0.t-ipconnect.de (p200300f6ef062c0090c03b551078f99d.dip0.t-ipconnect.de. [2003:f6:ef06:2c00:90c0:3b55:1078:f99d])
        by smtp.gmail.com with ESMTPSA id t5-20020a05620a450500b006a79f9d6521sm68333qkp.74.2022.06.13.00.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 00:12:04 -0700 (PDT)
Message-ID: <0871a5e498b0bfdce379523a03352da96fddc9cb.camel@gmail.com>
Subject: Re: [PATCH 24/34] iio: inkern: move to fwnode properties
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>, dl-linux-imx <linux-imx@nxp.com>, Linux-Renesas
 <linux-renesas-soc@vger.kernel.org>, "open list:BROADCOM NVRAM DRIVER"
 <linux-mips@vger.kernel.org>, linux-arm Mailing List
 <linux-arm-kernel@lists.infradead.org>, chrome-platform@lists.linux.dev,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, ARM/Mediatek "SoC
 support         <linux-mediatek@lists.infradead.org>,	
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
Date: Mon, 13 Jun 2022 09:13:00 +0200
In-Reply-To: <20220611163257.6c0b847e@jic23-huawei>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	 <20220610084545.547700-25-nuno.sa@analog.com>
	 <CAHp75Vf6dYFR8TESk6oj=SFiXmw-tBAa9Fz-jhRk57ARumxzhA@mail.gmail.com>
	 <97b9278953d923008a4c1230ca9bd354117e7213.camel@gmail.com>
	 <20220611163057.2e2606aa@jic23-huawei>
	 <20220611163257.6c0b847e@jic23-huawei>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sat, 2022-06-11 at 16:32 +0100, Jonathan Cameron wrote:
> On Sat, 11 Jun 2022 16:30:57 +0100
> Jonathan Cameron <jic23@kernel.org> wrote:
>=20
> > On Fri, 10 Jun 2022 22:01:09 +0200
> > Nuno S=C3=A1 <noname.nuno@gmail.com> wrote:
> >=20
> > > On Fri, 2022-06-10 at 17:19 +0200, Andy Shevchenko wrote:=C2=A0=20
> > > > On Fri, Jun 10, 2022 at 10:48 AM Nuno S=C3=A1 <nuno.sa@analog.com>
> > > > wrote:=C2=A0=C2=A0=C2=A0=20
> > > > >=20
> > > > > This moves the IIO in kernel interface to use fwnode
> > > > > properties and
> > > > > thus
> > > > > be firmware agnostic.
> > > > >=20
> > > > > Note that the interface is still not firmware agnostic. At
> > > > > this
> > > > > point we
> > > > > have both OF and fwnode interfaces so that we don't break any
> > > > > user.
> > > > > On
> > > > > top of this we also want to have a per driver conversion and
> > > > > that
> > > > > is the
> > > > > main reason we have both of_xlate() and fwnode_xlate()
> > > > > support.=C2=A0=C2=A0=C2=A0=20
> > > >=20
> > > > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > > > Thanks!
> > > >=20
> > > > A few nit-picks below, though.
> > > > =C2=A0=C2=A0=C2=A0=20
> > ...
> >=20
> > > =C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0=20
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D of_parse_phandle_wi=
th_args(np, "io-channels",
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "#io-channel-cells",
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 index, &iiospec);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D fwnode_property_get=
_reference_args(fwnode, "io-
> > > > > channels",
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "#io-
> > > > > channel-
> > > > > cells", 0,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 index=
,
> > > > > &iiospec);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 return err;
> > > > >=20
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 idev =3D bus_find_device(&i=
io_bus_type, NULL,
> > > > > iiospec.np,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 idev =3D bus_find_device(&i=
io_bus_type, NULL,
> > > > > iiospec.fwnode,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iio_dev_node_match);=C2=A0=C2=A0=
=C2=A0=20
> > > >=20
> > > > Wondering if this
> > > > https://elixir.bootlin.com/linux/v5.19-rc1/C/ident/bus_find_device_=
by_fwnode
> > > > can be utilized (yes, I noticed iio_device_type above).=C2=A0=C2=A0=
=C2=A0=20
> > >=20
> > > Hmm, at first glance I would say we can use it. AFAICT, we are
> > > already
> > > grabbing a node which contains "#io-channel-cells" which is very
> > > indicative that is an IIO device. I also find it very unlikely to
> > > have
> > > two IIO devices with the same fwnode (I guess it would be an
> > > issue even
> > > in the old code) and even more unlikely two devices of diferent
> > > types
> > > with the same fwnode?=C2=A0=20
> >=20
> > If we are talking struct iio_dev instances, then there are quite a
> > few cases
> > where there are multiple with the same fwnode.=C2=A0 We had to do that
> > pre
> > multiple buffers being introduced so it's fairly common, though not
> > in
> > ADCs which is probably why we haven't seen breakage here. Not sure
> > how
> > broken things already are as a result or if any of those devices
> > (most
> > IMUs) provide #io-channel-cells etc.=C2=A0 I'd put that breakage down a=
s
> > one to look into if anyone every hits it or one of us is bored
> > enough
> > to poke at it.=C2=A0 (superficially I think we'd have to check all
> > matches
> > for an xlate success).
>=20
> Having said that adding a warning comment here, so we remember this
> is
> a potential issue would be great.
>=20

can add the warning... And AFAIU, we can go with Andy suggestion right?

- Nuno S=C3=A1

