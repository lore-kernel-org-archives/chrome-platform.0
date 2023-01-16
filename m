Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05D17B
	for <chrome-platform@lists.linux.dev>; Mon, 16 Jan 2023 21:01:34 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 7A08D1FAA6;
	Mon, 16 Jan 2023 21:44:53 +0100 (CET)
Date: Mon, 16 Jan 2023 21:44:52 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, openbmc@lists.ozlabs.org,
	linux-imx@nxp.com, linux-stm32@st-md-mailman.stormreply.com,
	linux-iio@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-arm-msm@vger.kernel.org,
	Gwendal Grignou <gwendal@chromium.org>,
	Saravanan Sekar <sravanhome@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Thara Gopinath <thara.gopinath@linaro.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Benjamin Fair <benjaminfair@google.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Patrick Venture <venture@google.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Benson Leung <bleung@chromium.org>, Nancy Yuen <yuenn@google.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Zhang Rui <rui.zhang@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Christophe Branchereau <cbranchereau@gmail.com>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Avi Fishman <avifishman70@gmail.com>,
	Eugen Hristev <eugen.hristev@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Guenter Roeck <groeck@chromium.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Andy Gross <agross@kernel.org>, Amit Kucheria <amitk@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Jishnu Prakash <quic_jprakash@quicinc.com>
Subject: Re: [PATCH v3 12/15] iio: adc: qcom-spmi-adc5: convert to device
 properties
Message-ID: <20230116204452.il4gase2szipeexz@SoMainline.org>
References: <20220715122903.332535-1-nuno.sa@analog.com>
 <20220715122903.332535-13-nuno.sa@analog.com>
 <20220806192048.0ca41cc5@jic23-huawei>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220806192048.0ca41cc5@jic23-huawei>

On 2022-08-06 19:20:48, Jonathan Cameron wrote:
> On Fri, 15 Jul 2022 14:29:00 +0200
> Nuno Sá <nuno.sa@analog.com> wrote:
> 
> > Make the conversion to firmware agnostic device properties. As part of
> > the conversion the IIO inkern interface 'of_xlate()' is also converted to
> > 'fwnode_xlate()'. The goal is to completely drop 'of_xlate' and hence OF
> > dependencies from IIO.
> > 
> > Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> +CC Marijin who happend to post a patch for this driver that I just accepted
> and hence probably has hardware access.  Any chance of a test for this series?
> 
> If not, no problem as this is fairly mechanical and we have testing on some of
> the other drivers using the new code.
> 
> I'll probably queue this up in the meantime but it won't end up upstream
> for a few weeks yet.

Jonathan,

This CC just surfaced in my inbox while searching for our current
discussion around missing labels in qcom-spmi-vadc - and on the side a
userspace @xx label name ABI break (in qcom-spmi-adc5) caused by this
patch's fwnode_get_name change - we could've caught it if I had not
accidentally marked it as read and/or forgot about it.  My apologies.

- Marijn
