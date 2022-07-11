Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62C87A
	for <chrome-platform@lists.linux.dev>; Mon, 11 Jul 2022 13:16:32 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-31d85f82f0bso12440997b3.7
        for <chrome-platform@lists.linux.dev>; Mon, 11 Jul 2022 06:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ECHKwgZspv8UJP39cVbtbsQnGobQ6/Wz0Usn92hQ97A=;
        b=ZCLmgeg2tag0WI6PMv2dX5P6iXXKcdTl5Rjn3td1aaWFfg1rfbsiHVRsa4MA7RVDPi
         yZda18xMSj7gVReNgpkVS3IYfW2y4Yq9wBa4dHtxiS4ukAsi/+lbDWOqaRNhryL27qRN
         M8fdWOoG7e31my6wi3XYydpQ2QFFja+qmUq57YGYfq84IG56VWa8Y58yfZEvxGNmkdeS
         ROcmY65fp6mPo55MlG8kVk6cUjR/y+GmDOpFEWJ/AXDhnsAinq1CBLWopeF8ovwQO9wL
         pbNewu1TdO3bS8ZUkDr6fOjwRalFcjVymsMPQXeHZi+UiTUoMir4hJJt3YfEmkDseAno
         V+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ECHKwgZspv8UJP39cVbtbsQnGobQ6/Wz0Usn92hQ97A=;
        b=xFeKoL8mgnvgbF2GxzDLYnvN1hc/zgFpYnxIFiM6fJXb54Njl3JCewBUKTHNXPTeNr
         YZvDg9SWo2g+U2/VHw4WxUNP4kAblpGbo8C8cheAjEpDD6PP64TPWKRsFC9ko9YDQ+B7
         S5X+0hwfI4mXHoM8g+EbwVonmzH0pfmdFzDBf0eLeDf9388EoIfAjBKQZqf8N4igywGY
         mBJ+6ItglNARmeeOeUAEniCrbtXCOP5WkGgLyemZXdHYTAUlbUvHFOoAzwN8xNXKvw3U
         2fg0GNGtpZ3F23XaH4vc9Z+3BgDqnI0hxcwY7c4PPhbTdQvqSV7fsHiuFMQnXcxsaFLO
         EhPA==
X-Gm-Message-State: AJIora9QrAfgmiKS3xT63BPtx0igHPDsc1PVq7haF70IMofa4m6CfdqL
	HgldNocS+EzR1hyZzs4CLLn2tMsW7UAMV2ZxV/DCmfPwfu+wZCBB
X-Google-Smtp-Source: AGRyM1s4R+hHsfAdGALiyefnWI51ka7x2bN1wgGP0eXwiLSnuO4ulGqtLU/InSVBkkY/IMtwOpEFg5YKLeC9E1Jy29w=
X-Received: by 2002:a81:108f:0:b0:31c:d7ae:9ff1 with SMTP id
 137-20020a81108f000000b0031cd7ae9ff1mr18792069ywq.18.1657545391770; Mon, 11
 Jul 2022 06:16:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220711123835.811358-1-nuno.sa@analog.com> <20220711123835.811358-16-nuno.sa@analog.com>
In-Reply-To: <20220711123835.811358-16-nuno.sa@analog.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 11 Jul 2022 15:15:55 +0200
Message-ID: <CAHp75VcnuAtc+n+nhQ16yP9S-veX2c6ruquSewtPJdcqQwpyAQ@mail.gmail.com>
Subject: Re: [PATCH v2 15/15] iio: inkern: fix coding style warnings
To: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-iio <linux-iio@vger.kernel.org>, chrome-platform@lists.linux.dev, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	linux-stm32@st-md-mailman.stormreply.com, Andy Gross <agross@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Benson Leung <bleung@chromium.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Zhang Rui <rui.zhang@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Eugen Hristev <eugen.hristev@microchip.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Benjamin Fair <benjaminfair@google.com>, 
	Nancy Yuen <yuenn@google.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Jishnu Prakash <quic_jprakash@quicinc.com>, Christophe Branchereau <cbranchereau@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Thara Gopinath <thara.gopinath@linaro.org>, Cai Huoqing <cai.huoqing@linux.dev>, 
	Fabio Estevam <festevam@gmail.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Shawn Guo <shawnguo@kernel.org>, Haibo Chen <haibo.chen@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Patrick Venture <venture@google.com>, 
	Amit Kucheria <amitk@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Paul Cercueil <paul@crapouillou.net>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Gwendal Grignou <gwendal@chromium.org>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Saravanan Sekar <sravanhome@gmail.com>, 
	Guenter Roeck <groeck@chromium.org>, Jonathan Cameron <jic23@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 11, 2022 at 2:40 PM Nuno S=C3=A1 <nuno.sa@analog.com> wrote:
>
> Just cosmetics. No functional change intended...

...

> -       if (name =3D=3D NULL && channel_name =3D=3D NULL)
> +       if (!name && !channel_name)
>                 return ERR_PTR(-ENODEV);

After this change in place, I think it's better to convert it to

  if (!(name || channel_name))

which shows intentions clearer.

--=20
With Best Regards,
Andy Shevchenko
