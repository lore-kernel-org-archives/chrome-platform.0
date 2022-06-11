Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51471A21
	for <chrome-platform@lists.linux.dev>; Sat, 11 Jun 2022 15:41:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3327C34116;
	Sat, 11 Jun 2022 15:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654962099;
	bh=WarFohc9AefJgaCIQlkHm40D8Wfs78SeRMzjeAKfx4M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kEAxk8HVupWHd5I6Rj3KedDoeCuYF35epsuBXMhaICxi8INQwZtjIZMawVF8FvqtL
	 JPcIuigeGH61rUyJFpIQ1APrwxcyg8DSF3EgKwOxHckL1YXY7xOVDHIdeOu5tzXVgq
	 DkivCQ5HeT/G1bmC2YkjnLQeQ0BkJ1l5mnty48UCr5Tm0t3mxhiMb6yEOioh5dcz33
	 caK4CH3CSp1ReI734M0SGWDo4Q37NAu1Qq3WDwqs6+W9WhI3FwIshlZ9sSmhctKfxt
	 My8E4nxFNF+Ywe8ZGhtM8D6WeWRNRXgT+gplAgEQAtHoXXgPawUVc8mFYOo9J7E/Ie
	 Bi1QYaLlMhxLA==
Date: Sat, 11 Jun 2022 16:50:38 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, dl-linux-imx
 <linux-imx@nxp.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, linux-arm
 Mailing List <linux-arm-kernel@lists.infradead.org>,
 chrome-platform@lists.linux.dev, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, "moderated list:ARM/Mediatek SoC
 support\"         <linux-mediatek@lists.infradead.org>,
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
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 00/34] make iio inkern interface firmware agnostic
Message-ID: <20220611165038.669dd8e4@jic23-huawei>
In-Reply-To: <CAHp75VevzkT-WYz=BiWhDAETx==Sswe-rYCo_qxy7vyL2qRwVA@mail.gmail.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	<CAHp75VfhRoDupB2rFS+hg1zFN3=8RhnBcXrg0O72bKJYQz+8Kg@mail.gmail.com>
	<CAHp75VevzkT-WYz=BiWhDAETx==Sswe-rYCo_qxy7vyL2qRwVA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 10 Jun 2022 17:28:24 +0200
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Fri, Jun 10, 2022 at 4:48 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Fri, Jun 10, 2022 at 10:45 AM Nuno S=C3=A1 <nuno.sa@analog.com> wrot=
e: =20
>=20
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com> =20
>=20
> Ditto for patches 26-34.
>=20

I'm fine with all the patches I haven't commented on, but some
of the generic fwnode conversions are complex as such things go, so
more eyes on them and the core changes would be great.

Thanks,

Jonathan


