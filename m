Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8DB7C
	for <chrome-platform@lists.linux.dev>; Fri, 10 Jun 2022 15:06:24 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id me5so53504499ejb.2
        for <chrome-platform@lists.linux.dev>; Fri, 10 Jun 2022 08:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rmSZhFt+L2EkdTfA4PhCKlZgd+Ko2Rb6WSrQZb1cOCI=;
        b=qCr8IJLDkZnLtvz4aw+Xn5xelUdctRwoMbU2miyXWPJSzLZTJK2NeLG1JzUB9nU2nE
         5/RMCchvqx1ozjmNfNiBY4sJPZPjH7Ea5MpV7IYxt94+qFzIQuzmrr/zYYAP+dIEnmfQ
         0fNqjCzWxWfSnGY9kbiR2idz19Ic+Z0cFo4bKxJeyYNHmLilyZVs6SAOptiXPyxSMutY
         Q7ONB7ISiyNGWXXWBalOU8nD+18nZBZ9WdCwlSDCAAdrCEX08bVOGzs/5dUYND/pccgd
         ragBkS8mjJZY0gn+bjB5N+tuF1Ez2mGm8CSLoHNzEXhhSe1/Zmu/grPIAqadHgCBJWvt
         dswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rmSZhFt+L2EkdTfA4PhCKlZgd+Ko2Rb6WSrQZb1cOCI=;
        b=Qdw5/lFzwJPz9BtBcW2X5kb9dsAoowVdGJNN/OgMMyD/4BY0qVvvVxt8rUNMS/N9e/
         fI0M+ehd43bL0snwxkyeGuUcjVaeGUE9f9Ihpw5Ft65l2FhTbBvwYlfOAyW8/AWhZMIb
         q5T4wxcIQ9/3nopiyC/9vlz2NmNqAilRngd/cfGv1XZjhiV9wHii4q1YcH0fFOYNiJnv
         hpxMOqnmHNXWHyMDYRKEp5v/zUJRrAxgIxsWOiLaMG910SNqz0CJpE6BU+LL9mx2SYzQ
         5XEAMDpBTJl73NuF3Ebh5HlJja2HxFG6lcoYk8jUwrHNHdHx+20cqdjZ900BBq6GqE2e
         OCxg==
X-Gm-Message-State: AOAM530mlcsM7SU7bOFXWvPdMSBQS4ZQzN0SIuadPfCr4MGCj0WH0wli
	5IW8g5XNDUdNFQ44SbovEFL9/Rg2dH4rtm9MtJs=
X-Google-Smtp-Source: ABdhPJxLQGYHGj7gcyVcctXCwCgpnEr2cRyaoQ3/TTAEPMeK3HCToHy6/n79bgCvIjvr7StG2KRTs/e28PmBV+zKUAU=
X-Received: by 2002:a17:906:c7c1:b0:711:d2e9:99d0 with SMTP id
 dc1-20020a170906c7c100b00711d2e999d0mr23093435ejb.639.1654873582571; Fri, 10
 Jun 2022 08:06:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220610084545.547700-1-nuno.sa@analog.com> <20220610084545.547700-23-nuno.sa@analog.com>
In-Reply-To: <20220610084545.547700-23-nuno.sa@analog.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 10 Jun 2022 17:05:45 +0200
Message-ID: <CAHp75VcPoZ4FKTwDN_F76EZAcWYzAe1CHmuRuaP0wg3BgmPtfA@mail.gmail.com>
Subject: Re: [PATCH 22/34] iio: inkern: only return error codes in
 iio_channel_get_*() APIs
To: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: dl-linux-imx <linux-imx@nxp.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, chrome-platform@lists.linux.dev, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>, 
	OpenBMC Maillist <openbmc@lists.ozlabs.org>, Cai Huoqing <cai.huoqing@linux.dev>, 
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
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Jonathan Cameron <jic23@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Shawn Guo <shawnguo@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Fabio Estevam <festevam@gmail.com>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Eugen Hristev <eugen.hristev@microchip.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 10, 2022 at 10:48 AM Nuno S=C3=A1 <nuno.sa@analog.com> wrote:
>
> APIs like of_iio_channel_get_by_name() and of_iio_channel_get_all() were
> returning a mix of NULL and error pointers being NULL the way to
> "notify" that we should do a "system" lookup for channels. This make
> it very confusing and prone to errors as commit dbbccf7c20bf
> ("iio: inkern: fix return value in devm_of_iio_channel_get_by_name()")
> proves. On top of this, patterns like 'if (channel !=3D NULL) return chan=
nel'
> were being used where channel could actually be an error code which
> makes the code hard to read.

...

>                 np =3D np->parent;
>                 if (np && !of_get_property(np, "io-channel-ranges", NULL)=
)
> -                       return NULL;
> +                       return chan;

Shouldn't it return a dedicated error code and not some arbitrary one?
It may be I missed something and chan has a correct error code in this
case...

...

> +       if (nummaps =3D=3D 0)       /* return -ENODEV to search map table=
 */

Comment is superfluous, the next line is self-explaining.

> +               return ERR_PTR(-ENODEV);

...

> -               if (channel !=3D NULL)
> +               if (!IS_ERR(channel) || PTR_ERR(channel) =3D=3D -EPROBE_D=
EFER)

Btw, in the GPIO library we have a macro or inliner (don't remember)
that represents such a conditional.
Perhaps make it (if it's a macro) global, or introduce an inline in IIO?

Okay, it's here:
https://elixir.bootlin.com/linux/v5.19-rc1/source/drivers/gpio/gpiolib.h#L1=
79

It's similar, but not the same, so just play with an idea to introduce
something in this file, maybe it's worth doing this, maybe not.

--=20
With Best Regards,
Andy Shevchenko
