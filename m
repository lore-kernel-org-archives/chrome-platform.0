Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661A97A
	for <chrome-platform@lists.linux.dev>; Mon, 11 Jul 2022 14:05:51 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id h17so7214313wrx.0
        for <chrome-platform@lists.linux.dev>; Mon, 11 Jul 2022 07:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=OpuAbJzOZmkFVUVRYRfhJb2EZ79ErPrcazI4dJRRIZw=;
        b=AxqKn1jFCUvR9r8eF6G9LQNJai0j26cooZSTaW/y5LjqtvcEM/8McIf/+yQzlzaUFd
         LwcEnbV3x0T98SP3+BJlr0dZ/4NoEFEHYkvinYuvlXRJ/rScOUvz84TzCH0CqciB5xr3
         70JCY+zxyG19vqUL7fnu7cTlKI0FIx088QGgbn+DUglz7JpgcVQ5PpQGbQcOhaZFlPbl
         Sj/1dCgEulNZFTYu6gtOT+azXEODMFcBsZXMw1Holn5VdIjBppSACDRDbXOOwlKV+GrT
         gUqBD8ESK3VZeUfDigHKr2IQSaYpAIV6HBehOLe57cJG8VwM+8e6vaZ86/RiS+6W3xCR
         PgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=OpuAbJzOZmkFVUVRYRfhJb2EZ79ErPrcazI4dJRRIZw=;
        b=zo7iutcXWwOLZtYs0ixKL90J0UJels/R8jerz7VHPKnVMTWLCJ9ybfbkqCEhuVkVqq
         /kO4lefx7a+y7y/RiZCC7j87q0GUhjBmIKRCVnU364OvsiIfrRPZReKJU18dfjWe/a2Z
         mkVbHLPpGNnydGh6va3wtxeAzvHNTTTC6BRC/Nj/IPYhsHzZXT481cqmVAYo/gYaQ6ZM
         UxJDl2wvpOyq0KDCrbObGXCTqMbg5kgVumteN6JlasZjdQI/u+x5dlXHDM5ppupC6sr3
         //5MHjqKQ7l7XJdaHUMFF2/YOrezNhAGJh8B1cCwaqJ6DnO2gnswb5WEzHBSXpIhagia
         YOzg==
X-Gm-Message-State: AJIora+VzFYfCKmyuvQdt27Se91e54+3NM3ZmGe6QZWCdvn+V1rczIY4
	+vXnXttG+Ux+m0pbA9BrxYg=
X-Google-Smtp-Source: AGRyM1vjxZ3LaYt2iroYaYC6yqBPM5QdYtXuGkJjk8H9N1njA0MUYRP5ggIbz4O4J7Zmd/vjCEw/YA==
X-Received: by 2002:adf:f581:0:b0:21d:1e01:e9b7 with SMTP id f1-20020adff581000000b0021d1e01e9b7mr16555540wro.529.1657548349537;
        Mon, 11 Jul 2022 07:05:49 -0700 (PDT)
Received: from p200300f6ef036f005de6a4d0d791ed01.dip0.t-ipconnect.de (p200300f6ef036f005de6a4d0d791ed01.dip0.t-ipconnect.de. [2003:f6:ef03:6f00:5de6:a4d0:d791:ed01])
        by smtp.gmail.com with ESMTPSA id g1-20020a05600c000100b00397623ff335sm6700494wmc.10.2022.07.11.07.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 07:05:49 -0700 (PDT)
Message-ID: <bb0aaee46261295e333c02d771a627d3695fdba2.camel@gmail.com>
Subject: Re: [PATCH v2 03/15] iio: inkern: only return error codes in
 iio_channel_get_*() APIs
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Nuno =?ISO-8859-1?Q?S=E1?=
	 <nuno.sa@analog.com>
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, Linux-Renesas
 <linux-renesas-soc@vger.kernel.org>,  "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, dl-linux-imx
 <linux-imx@nxp.com>,  "open list:BROADCOM NVRAM DRIVER"
 <linux-mips@vger.kernel.org>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-iio
 <linux-iio@vger.kernel.org>,  chrome-platform@lists.linux.dev, linux-arm
 Mailing List <linux-arm-kernel@lists.infradead.org>, 
 linux-stm32@st-md-mailman.stormreply.com, Andy Gross <agross@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, Benson Leung
 <bleung@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Tomer
 Maimon <tmaimon77@gmail.com>, Zhang Rui <rui.zhang@intel.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Eugen Hristev <eugen.hristev@microchip.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Benjamin Fair <benjaminfair@google.com>,
 Nancy Yuen <yuenn@google.com>, Fabrice Gasnier
 <fabrice.gasnier@foss.st.com>, Jishnu Prakash <quic_jprakash@quicinc.com>,
 Christophe Branchereau <cbranchereau@gmail.com>, Avi Fishman
 <avifishman70@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Michael
 Hennerich <Michael.Hennerich@analog.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@microchip.com>, Lars-Peter Clausen <lars@metafoo.de>, Thara
 Gopinath <thara.gopinath@linaro.org>, Cai Huoqing <cai.huoqing@linux.dev>,
 Fabio Estevam <festevam@gmail.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Shawn Guo <shawnguo@kernel.org>, Haibo Chen
 <haibo.chen@nxp.com>, Arnd Bergmann <arnd@arndb.de>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Patrick Venture <venture@google.com>, Amit
 Kucheria <amitk@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Paul Cercueil
 <paul@crapouillou.net>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Gwendal Grignou <gwendal@chromium.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>,  Saravanan Sekar <sravanhome@gmail.com>,
 Guenter Roeck <groeck@chromium.org>, Jonathan Cameron <jic23@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, Linus Walleij
 <linus.walleij@linaro.org>
Date: Mon, 11 Jul 2022 16:06:50 +0200
In-Reply-To: <CAHp75VcxcmH5QoheyERAXrUeqMtJidKLBYH1T6dr6vb7yGKqWg@mail.gmail.com>
References: <20220711123835.811358-1-nuno.sa@analog.com>
	 <20220711123835.811358-4-nuno.sa@analog.com>
	 <CAHp75VcxcmH5QoheyERAXrUeqMtJidKLBYH1T6dr6vb7yGKqWg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2022-07-11 at 15:29 +0200, Andy Shevchenko wrote:
> On Mon, Jul 11, 2022 at 2:38 PM Nuno S=C3=A1 <nuno.sa@analog.com> wrote:
> >=20
> > APIs like of_iio_channel_get_by_name() and of_iio_channel_get_all()
> > were
> > returning a mix of NULL and pointers with NULL being the way to
> > "notify" that we should do a "system" lookup for channels. This
> > make
> > it very confusing and prone to errors as commit 9f63cc0921ec
> > ("iio: inkern: fix return value in
> > devm_of_iio_channel_get_by_name()")
> > proves. On top of this, patterns like 'if (channel !=3D NULL) return
> > channel' were being used where channel could actually be an error
> > code
> > which makes the code hard to read.
> >=20
> > This change also makes some functional changes on how errors were
> > being
> > handled. In the original behavior, even if we get an error like '-
> > ENOMEM',
> > we still continue with the search. We should only continue to
> > lookup for
> > the channel when it makes sense to do so. Hence, the main error
> > handling
> > in 'of_iio_channel_get_by_name()' is changed to the following
> > logic:
> >=20
> > =C2=A0* If a channel 'name' is provided and we do find it via
> > 'io-channel-names', we should be able to get it. If we get any
> > error,
> > we should not proceed with the lookup. Moreover, we should return
> > an error
> > so that callers won't proceed with a system lookup.
> > =C2=A0* If a channel 'name' is provided and we cannot find it ('index <
> > 0'),
> > 'of_parse_phandle_with_args()' is expected to fail with '-EINVAL'.
> > Hence,
> > we should only continue if we get that error.
> > =C2=A0* If a channel 'name' is not provided we should only carry on wit=
h
> > the
> > search if 'of_parse_phandle_with_args()' returns '-ENOENT'.
> >=20
> > Also note that a system channel lookup is only done if the returned
> > error code (from 'of_iio_channel_get_by_name()' or
> > 'of_iio_channel_get_all()' is -ENODEV.
>=20
> LGTM (but I might miss something, it's a bit too many conditionals),
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>=20

Agreed. It ended up being more complicated than I thought...

- Nuno S=C3=A1
