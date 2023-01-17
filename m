Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C581FC2
	for <chrome-platform@lists.linux.dev>; Tue, 17 Jan 2023 08:53:57 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id d13so21172611qvj.8
        for <chrome-platform@lists.linux.dev>; Tue, 17 Jan 2023 00:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dseOSX2zTH+XeCQ35kHO/8kj0vzRJ47S5eW+pnauFVw=;
        b=IN1tCeVLnwqol5mOOyaSKxyI6kXzBL3oblSeLXVIqXyUFgWIwbZ0AEzA8olwW7upIy
         FObicSGhLmkCghdvzFXSEJAyGxharJCShW7z0r+lEuvRAdFgw/Mxnef/EERBExtq8sMy
         Mcp+PQsHnyA392QlG4twkaHS5FodAKoH3B3yaJJT0FBlqe7JmvyILW6DXybR86bCuoQC
         UqoyUTTaZe3pVph9PjUnNC+gdZK/JhrtzzJA5+OSVpLY72U3uaJRq46DnYklrCW6khCa
         fPiWIzKX0q18Q1gHryK2/LjCQP56sP8q10LYVdVfp1q/DwJiFCOzLG6iIT0dwfrQWPTz
         2MNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dseOSX2zTH+XeCQ35kHO/8kj0vzRJ47S5eW+pnauFVw=;
        b=vLbxZoVRQatkA/DsKcsppjfapvSVKxB9917VpeOUPDqWp4XMzA1aS8QRg1js0wuiuh
         SgfpJ0GSa5Jt0AAn7H1zR8mKA0PJu982v+WXnUvDvUn4PK3HssXdSgEaO+6b1vtJ16wf
         cH6bWVAsfCTLKPp+A710QVeoXay1vEin33/UkfUkJJ2aNIlh87xs1hs16z/Bnchz2BNu
         BgKbDgyh+zX9GzI1TCAAcDEznuDrI1oXr5jTZgpdjo+LuSO1u4UvQ7SL9MWb7v94V176
         K1o95cGpv9r9fftYHX1IjSFHpDOuLRLCeyh5yGUm/UZIno7NGGYTse1eyDddbjmkSE9D
         rFQg==
X-Gm-Message-State: AFqh2kqafZSIMevauVNGbDq1spPulgsZClhh/z7h47YCTMXy8B97HaLs
	1XDWSOJg1Tn+eirzsasCvRmfaLyXv7my9SSTjSI=
X-Google-Smtp-Source: AMrXdXvLiqXj9jIN/w78ICHR0nICmfROd8xLwBZS8MBQVeGvCEuFhhD92MzOr0asWEhyUaMDPd3N/hzGbdM64AxxTSk=
X-Received: by 2002:a0c:f6c2:0:b0:532:2dd4:fea3 with SMTP id
 d2-20020a0cf6c2000000b005322dd4fea3mr144148qvo.48.1673945635919; Tue, 17 Jan
 2023 00:53:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220715122903.332535-1-nuno.sa@analog.com> <20220715122903.332535-13-nuno.sa@analog.com>
 <20220806192048.0ca41cc5@jic23-huawei> <20230116204452.il4gase2szipeexz@SoMainline.org>
In-Reply-To: <20230116204452.il4gase2szipeexz@SoMainline.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 17 Jan 2023 10:53:19 +0200
Message-ID: <CAHp75VdX9sFgn9STyzwcDCK1KYbU00ejFNcEP3FVnLk5J=Pktg@mail.gmail.com>
Subject: Re: [PATCH v3 12/15] iio: adc: qcom-spmi-adc5: convert to device properties
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	openbmc@lists.ozlabs.org, linux-imx@nxp.com, 
	linux-stm32@st-md-mailman.stormreply.com, linux-iio@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-arm-msm@vger.kernel.org, 
	Gwendal Grignou <gwendal@chromium.org>, Saravanan Sekar <sravanhome@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Tali Perry <tali.perry1@gmail.com>, 
	Thara Gopinath <thara.gopinath@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Benjamin Fair <benjaminfair@google.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Patrick Venture <venture@google.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Benson Leung <bleung@chromium.org>, Nancy Yuen <yuenn@google.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Zhang Rui <rui.zhang@intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Christophe Branchereau <cbranchereau@gmail.com>, 
	Cai Huoqing <cai.huoqing@linux.dev>, Avi Fishman <avifishman70@gmail.com>, 
	Eugen Hristev <eugen.hristev@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Lars-Peter Clausen <lars@metafoo.de>, 
	Guenter Roeck <groeck@chromium.org>, Paul Cercueil <paul@crapouillou.net>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Andy Gross <agross@kernel.org>, 
	Amit Kucheria <amitk@kernel.org>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Jishnu Prakash <quic_jprakash@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 16, 2023 at 10:44 PM Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2022-08-06 19:20:48, Jonathan Cameron wrote:
> > On Fri, 15 Jul 2022 14:29:00 +0200
> > Nuno S=C3=A1 <nuno.sa@analog.com> wrote:
> >
> > > Make the conversion to firmware agnostic device properties. As part o=
f
> > > the conversion the IIO inkern interface 'of_xlate()' is also converte=
d to
> > > 'fwnode_xlate()'. The goal is to completely drop 'of_xlate' and hence=
 OF
> > > dependencies from IIO.
> > >
> > > Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> > > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > +CC Marijin who happend to post a patch for this driver that I just acc=
epted
> > and hence probably has hardware access.  Any chance of a test for this =
series?
> >
> > If not, no problem as this is fairly mechanical and we have testing on =
some of
> > the other drivers using the new code.
> >
> > I'll probably queue this up in the meantime but it won't end up upstrea=
m
> > for a few weeks yet.
>
> Jonathan,
>
> This CC just surfaced in my inbox while searching for our current
> discussion around missing labels in qcom-spmi-vadc - and on the side a
> userspace @xx label name ABI break (in qcom-spmi-adc5) caused by this
> patch's fwnode_get_name change - we could've caught it if I had not
> accidentally marked it as read and/or forgot about it.  My apologies.

Does the following addition to the top of the
adc5_get_fw_channel_data() fix the issue?

+       name =3D devm_kasprintf(adc->dev, GFP_KERNEL, "%pfwP", fwnode);
+       if (!name)
+               return -ENOMEM;

--=20
With Best Regards,
Andy Shevchenko
