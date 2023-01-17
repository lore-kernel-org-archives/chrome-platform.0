Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52D91FC2
	for <chrome-platform@lists.linux.dev>; Tue, 17 Jan 2023 09:06:42 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id g10so15699694qvo.6
        for <chrome-platform@lists.linux.dev>; Tue, 17 Jan 2023 01:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqiw1Vgwv9XN5UDZwZy7V1JCvqxayLwD+czwSJLGNXc=;
        b=Psgp67/kfCGo58IHNa1lEyOJXoWCpIR5x85MyyrDJoXfgixTFZiJwrgG6Z2AKRakmp
         zghbXg9ARJQlDo0kuxxNRWw3M6aIX9M3KaMcEbqpsTruamXxCyM3x3174jsLZIlnXDie
         S48FGLNi233/D0l7kHrnvDZo41pYXtWdvW2tcymtnhTIoNSiNIu1XoexByALK95nBW/h
         UkMtL3a9O7pfEmje61zV8JRPCXDyVy9Co2tfLOTiZyo6y0yRklbOxNq8m6Rco6jq/Y1y
         SOBAC54b+oXTSLnVDm3LckhRwCnjLlFPEywDcVrPLfUTS5sN1M/bNX0iGc2OQmErXu4P
         rcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zqiw1Vgwv9XN5UDZwZy7V1JCvqxayLwD+czwSJLGNXc=;
        b=e7wgT/5ZBI5IHJi5gUFDxdwHuE2mL0uQwMy4uh9Lp+M9rypqxslT3cbt5R1UjTM4fX
         qQF5AQBJkNIPiZqtr6tf01PYfpwLNeiYUVV4Q6Noq89MkcQJ37Qk1+QMGqOe6bfvoOAF
         M7oaSbOMSfHg0Tcs//ZqDiKfj5gFJma/m88U9A0XK0aRUe1Dy9VN+tCBB5BhncvHfYHS
         Ku8HvkULL/uQtOk2sR01iRrVfltZ6L2a5q5HUjS/7jC2el/KMMdBCPoo9RBlJ8SyaCKi
         wHJzfnAk6XIrqkUFZXh+PGilOtKY+mNbuFDE6+WYzUNiPIT11RSPV1jABSIQLUU5PqtI
         8wrw==
X-Gm-Message-State: AFqh2kpQytZA61qF85WgZagjTOp+Le0hFJHyqAtRoiNoGEh9uuTn1GNC
	Pmfj6RJkUNCKt/gxmb4hS/eRm16Y+7x9hiYgnkI=
X-Google-Smtp-Source: AMrXdXugvDqNOWGB6Kj/gk3CK1DdfaCjiiHjRVIVFmtT0b0bZ7ODJdy3/f2SSMatSgKUUAIIRvAhojzcRgzJa2YLUfg=
X-Received: by 2002:a05:6214:418e:b0:532:2c82:95ac with SMTP id
 ld14-20020a056214418e00b005322c8295acmr149506qvb.97.1673946401725; Tue, 17
 Jan 2023 01:06:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220715122903.332535-1-nuno.sa@analog.com> <20220715122903.332535-13-nuno.sa@analog.com>
 <20220806192048.0ca41cc5@jic23-huawei> <20230116204452.il4gase2szipeexz@SoMainline.org>
 <CAHp75VdX9sFgn9STyzwcDCK1KYbU00ejFNcEP3FVnLk5J=Pktg@mail.gmail.com>
In-Reply-To: <CAHp75VdX9sFgn9STyzwcDCK1KYbU00ejFNcEP3FVnLk5J=Pktg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 17 Jan 2023 11:06:05 +0200
Message-ID: <CAHp75VdTftm1BE21rH1HVHiwUye-0Dvc66uCK2LE2qF4_zA6hg@mail.gmail.com>
Subject: Re: [PATCH v3 12/15] iio: adc: qcom-spmi-adc5: convert to device properties
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	openbmc@lists.ozlabs.org, linux-imx@nxp.com, 
	linux-stm32@st-md-mailman.stormreply.com, linux-iio@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-arm-msm@vger.kernel.org, 
	Gwendal Grignou <gwendal@chromium.org>, Tomer Maimon <tmaimon77@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Tali Perry <tali.perry1@gmail.com>, Benjamin Fair <benjaminfair@google.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Patrick Venture <venture@google.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Benson Leung <bleung@chromium.org>, 
	Nancy Yuen <yuenn@google.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Christophe Branchereau <cbranchereau@gmail.com>, Cai Huoqing <cai.huoqing@linux.dev>, 
	Avi Fishman <avifishman70@gmail.com>, Eugen Hristev <eugen.hristev@microchip.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Paul Cercueil <paul@crapouillou.net>, Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Andy Gross <agross@kernel.org>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Haibo Chen <haibo.chen@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2023 at 10:53 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Jan 16, 2023 at 10:44 PM Marijn Suijten
> <marijn.suijten@somainline.org> wrote:
> >
> > On 2022-08-06 19:20:48, Jonathan Cameron wrote:
> > > On Fri, 15 Jul 2022 14:29:00 +0200
> > > Nuno S=C3=A1 <nuno.sa@analog.com> wrote:
> > >
> > > > Make the conversion to firmware agnostic device properties. As part=
 of
> > > > the conversion the IIO inkern interface 'of_xlate()' is also conver=
ted to
> > > > 'fwnode_xlate()'. The goal is to completely drop 'of_xlate' and hen=
ce OF
> > > > dependencies from IIO.
> > > >
> > > > Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> > > > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > > > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > > +CC Marijin who happend to post a patch for this driver that I just a=
ccepted
> > > and hence probably has hardware access.  Any chance of a test for thi=
s series?
> > >
> > > If not, no problem as this is fairly mechanical and we have testing o=
n some of
> > > the other drivers using the new code.
> > >
> > > I'll probably queue this up in the meantime but it won't end up upstr=
eam
> > > for a few weeks yet.
> >
> > Jonathan,
> >
> > This CC just surfaced in my inbox while searching for our current
> > discussion around missing labels in qcom-spmi-vadc - and on the side a
> > userspace @xx label name ABI break (in qcom-spmi-adc5) caused by this
> > patch's fwnode_get_name change - we could've caught it if I had not
> > accidentally marked it as read and/or forgot about it.  My apologies.
>
> Does the following addition to the top of the
> adc5_get_fw_channel_data() fix the issue?
>
> +       name =3D devm_kasprintf(adc->dev, GFP_KERNEL, "%pfwP", fwnode);
> +       if (!name)
> +               return -ENOMEM;

Okay, it probably the same, so it might need additional code to

+ name[strchrnul(name, '@') - name] =3D '\0';

--=20
With Best Regards,
Andy Shevchenko
