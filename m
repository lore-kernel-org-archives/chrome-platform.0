Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0FB7B
	for <chrome-platform@lists.linux.dev>; Sat, 18 Jun 2022 13:54:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5A83C3411A;
	Sat, 18 Jun 2022 13:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655560474;
	bh=pEznlvbLCZMIZNrAGFvIthCC7BXrhairfIEqdywRBMA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GxhaPL32MMwD2706Sgr0GI/8Mp639UZnJ/ycF0FAHU3CsKxLwYzNMZLBY46ng/Cl6
	 cA2tu+QHDcQ8szJt/XGkInJSooj3a8X6Z1+plT7627KxxpiLc29CdY5kWroUwI8a+x
	 hooq9bpCJ0AR9emay7LD7rtZfEpWlUKjW/+2wuflJJ8FqazBIbIKr+lZJFjX5Q55nJ
	 tiMMkcQQQ6AkUozXeP6350UGS9sK9EWEJVaxD1Gi+gcvZcYiKq9bE9qvY2Sl8Ib6BE
	 oLDu0po4j9wgXmjAX9w74l2+KupzYd9kZ4nW7FUXvm5f6jOVFEW79O2m2kE4U8KvNx
	 YWwjBtPyUuy9w==
Date: Sat, 18 Jun 2022 15:03:40 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, dl-linux-imx <linux-imx@nxp.com>, Linux-Renesas
 <linux-renesas-soc@vger.kernel.org>, "open list:BROADCOM NVRAM DRIVER"
 <linux-mips@vger.kernel.org>, linux-arm Mailing List
 <linux-arm-kernel@lists.infradead.org>, chrome-platform@lists.linux.dev,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, "moderated
 list:ARM/Mediatek SoC support\"        
 <linux-mediatek@lists.infradead.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-msm
 <linux-arm-msm@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Cai Huoqing
 <cai.huoqing@linux.dev>, Benjamin Fair <benjaminfair@google.com>, Jishnu
 Prakash <quic_jprakash@quicinc.com>, Linus Walleij
 <linus.walleij@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Amit Kucheria <amitk@kernel.org>,
 Andy Gross <agross@kernel.org>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Haibo Chen <haibo.chen@nxp.com>, Benson
 Leung <bleung@chromium.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Christophe Branchereau
 <cbranchereau@gmail.com>, Patrick Venture <venture@google.com>, Arnd
 Bergmann <arnd@arndb.de>, Nancy Yuen <yuenn@google.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Gwendal Grignou <gwendal@chromium.org>, Saravanan Sekar
 <sravanhome@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Thara
 Gopinath <thara.gopinath@linaro.org>, Avi Fishman <avifishman70@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Tomer Maimon
 <tmaimon77@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Zhang Rui
 <rui.zhang@intel.com>, Shawn Guo <shawnguo@kernel.org>, Guenter Roeck
 <groeck@chromium.org>, Fabio Estevam <festevam@gmail.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Eugen Hristev <eugen.hristev@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 20/34] iio: inkern: only relase the device node when
 done with it
Message-ID: <20220618150340.64e639df@jic23-huawei>
In-Reply-To: <5e81f73b996de80445c2e905c44ebb18c63a739b.camel@gmail.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	<20220610084545.547700-21-nuno.sa@analog.com>
	<CAHp75VcdwjTYDF2c-StsL7-pLKtV3vGxinX8+1nJydqB_WNXiA@mail.gmail.com>
	<ef73aa5801ae1c8078e6a930f22feb6214038176.camel@gmail.com>
	<20220611155902.2a5a7738@jic23-huawei>
	<5e81f73b996de80445c2e905c44ebb18c63a739b.camel@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 13 Jun 2022 09:20:26 +0200
Nuno S=C3=A1 <noname.nuno@gmail.com> wrote:

> On Sat, 2022-06-11 at 15:59 +0100, Jonathan Cameron wrote:
> >=20
> > +Cc Mark Brown for a query on ordering in device tree based SPI
> > setup.
> >=20
> > On Fri, 10 Jun 2022 22:08:41 +0200
> > Nuno S=C3=A1 <noname.nuno@gmail.com> wrote:
> >  =20
> > > On Fri, 2022-06-10 at 16:56 +0200, Andy Shevchenko wrote: =20
> > > > On Fri, Jun 10, 2022 at 10:48 AM Nuno S=C3=A1 <nuno.sa@analog.com>
> > > > wrote:=C2=A0  =20
> > > > >=20
> > > > > 'of_node_put()' can potentially release the memory pointed to
> > > > > by
> > > > > 'iiospec.np' which would leave us with an invalid pointer (and
> > > > > we
> > > > > would
> > > > > still pass it in 'of_xlate()'). As such, we can only release
> > > > > the
> > > > > node
> > > > > after we are done with it.=C2=A0  =20
> > > >=20
> > > > The question you should answer in the commit message is the
> > > > following:
> > > > "Can an OF node, attached to a struct device, be gone before the
> > > > device itself?" If it so, then patch is good, otherwise there is
> > > > no
> > > > point in this patch in the first place.
> > > > =C2=A0  =20
> > >=20
> > > Yeah, I might be wrong but from a quick look... yes, I think the
> > > node
> > > can be gone before the device. Take a look on the spi or i2c
> > > of_notify
> > > handling and you can see that the nodes are get/put on the
> > > add/remove
> > > notifcation. Meaning that the node lifespan is not really attached
> > > to
> > > the device lifespan. If it was, I would expect to see of_node_put()
> > > on
> > > the device release() function... =20
> >=20
> > I had a look at spi_of_notify() and indeed via
> > spi_unregister_device()
> > the node is put just before device_del() so I agree that at first
> > glance
> > it seems like there may be a race there against the useage here.
> > Mark (+CC) out of interest why are the node gets before the
> > device_add()
> > in spi_add_device() called from of_register_spi_device() but the
> > matching
> > node puts before the device_del() in spi_unregister_device()?
> > Seems like inconsistent ordering...
> >=20
> > Which is not to say we shouldn't fix the IIO usage as this patch
> > does!
> >  =20
>=20
> Just to add something that came to my attention. In the IIO case, it
> does not even matter if the parent device has the OF node lifetime
> "linked" to it (as it actually happens for platform devices). The
> reason is that iio_dev only has a weak reference to it's parent and (I
> think) the parent can actually go away while the iio_dev is still
> around (eg: someone has an open fd to the iio_dev cdev).

I chased through this as well and agree. The device_del()
hiding in cdev_device_del() will drop the parent reference on the parent.

I'm not sure it actually maters much though given almost all of_node
useage is not tied up with the anything that might be using the iio_dev
after the iio_device_unregister() call.

Maybe there is a race condition somewhere...

>=20
> > >=20
> > > Again, I might be wrong and I admit I was not sure about including
> > > this
> > > patch because it's a very unlikely scenario even though I think, in
> > > theory, a possible one. =20
> >=20
> > The patch is currently valid even if it's not a 'real' bug.
> > Given we are doing a put on that device_node, it makes sense for that
> > to occur after the local use has finished - we shouldn't be relying
> > on
> > what happens to be the case for lifetimes today.
> >=20
> > Now, I did wonder if any drivers actually use it in their xlate
> > callbacks.
> > One does for an error print, so this is potentially real (if very
> > unlikely!)
> >=20
> > This isn't a 'fix' I'd expect to rush in, or necessarily backport to
> > stable
> > but I think it's a valid fix.
> >  =20
>=20
> Should I drop the fixes tag?
>=20
Keep the tag. It's a fix, just a low priority one.

Jonathan

> - Nuno S=C3=A1
>=20
>=20
>=20
>=20

