Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F236228E4
	for <chrome-platform@lists.linux.dev>; Thu, 16 Jun 2022 13:15:58 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id x38so2119028ybd.9
        for <chrome-platform@lists.linux.dev>; Thu, 16 Jun 2022 06:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fsun78rWieFnLaLeD83Q2xWjxjOs241/wdwG/0QCsic=;
        b=PZJxPerUVnWQ+ZJJXabeQPCvU+odG2XM/cCiTR2s9bg1u+Kq80JX5ApFI/RzXK0+5N
         91YSIyl3oArnIPhPglVuZa3e9yXet958I4d/aO29mbsfdc4wxqC+2Ha3GHxRa7P+C/W0
         /MeUW3hhtK1/8mt84BKomTg927useCl9wQUSKU9FmvhKIMrNLBmnrhUc6Q4NF8cAc8mk
         ISrwiouIgmkW9h2OrdhUIyQlvlxunlAeC03V1t+VlOn4UBEozATF/u6cpGazZNV0c/oJ
         OgqMMNyBlhjXRfOdGukXu/bRFb/aQF/PlDjPiPinMUucqHC6ndgFmuTlQ5RWfPsM5sUQ
         QFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fsun78rWieFnLaLeD83Q2xWjxjOs241/wdwG/0QCsic=;
        b=veG1yiT4UB1yVhyD/o5q9c7o8tpQp384W6ULcF7D7cOsL8iFtKL2qyG4zT9eMiG0zP
         xfc+2boMKnRyPnlVnRjhYhH/JH3b1NL+461ZCqqVq48DggqS1Gi+9dVarddc5D2KICzU
         ZNXMotFhP9jetPesK7hagfFEVB2cGnoZfQ8cFdXuioNXXHCAsiAPVVV42PATK22ddwHl
         2fFe4gspcBuxoygvFLNs2q42FR90ftpfn+qp4BWd4EU1AulptCh0TvOZVSLocrhrn4nx
         ORFH41lK2I4P6PXOOmXZO+S4+Q6lcJeEcSoyK95PnbQSEz4jgLE6YSNDDGvanNlZEZO/
         04xA==
X-Gm-Message-State: AJIora+xm1gox/o6I2skrzhhdO7fT4syPVSdiZYpTUmdx3k9SmisOc0S
	EmeI2VogRlpKXD/wO8qfoFSMcQeGZ+6qedoW+BbY9g==
X-Google-Smtp-Source: AGRyM1tKpRdJdPfQy0oaslWa7sXFz+A5JxujSmEL8Ch+XWKV8Tm8gJp6YIJusqmVvKOdq2xVRX8SI1z84IJEfDM3b38=
X-Received: by 2002:a25:3417:0:b0:664:aab3:7c44 with SMTP id
 b23-20020a253417000000b00664aab37c44mr5143357yba.533.1655385357716; Thu, 16
 Jun 2022 06:15:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220610084545.547700-1-nuno.sa@analog.com> <20220610084545.547700-31-nuno.sa@analog.com>
In-Reply-To: <20220610084545.547700-31-nuno.sa@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Jun 2022 15:15:46 +0200
Message-ID: <CACRpkdbTkyd0zwXU-7O-n3HejHhY+Vg-QKuSpatZ+O0QPgqbag@mail.gmail.com>
Subject: Re: [PATCH 30/34] iio: adc: qcom-spmi-vadc: convert to device properties
To: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: linux-imx@nxp.com, linux-renesas-soc@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
	openbmc@lists.ozlabs.org, Cai Huoqing <cai.huoqing@linux.dev>, 
	Benjamin Fair <benjaminfair@google.com>, Jishnu Prakash <quic_jprakash@quicinc.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Amit Kucheria <amitk@kernel.org>, Andy Gross <agross@kernel.org>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Benson Leung <bleung@chromium.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
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

On Fri, Jun 10, 2022 at 10:49 AM Nuno S=C3=A1 <nuno.sa@analog.com> wrote:

> Make the conversion to firmware agnostic device properties. As part of
> the conversion the IIO inkern interface 'of_xlate()' is also converted to
> 'fwnode_xlate()'. The goal is to completely drop 'of_xlate' and hence OF
> dependencies from IIO.
>
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
