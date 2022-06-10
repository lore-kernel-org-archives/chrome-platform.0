Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B427A7A
	for <chrome-platform@lists.linux.dev>; Fri, 10 Jun 2022 19:42:37 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id n28so207591edb.9
        for <chrome-platform@lists.linux.dev>; Fri, 10 Jun 2022 12:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Y54GLtlH6LdYaPPW/vT7zN8oinpgFewT/Kozy6U1sr8=;
        b=iWSpr/Kt7gr1R9ypw8jSjj+iOo2ix1stq9TO7FQZo6FT8oajeYFmxMX5790+z+QVIw
         C7Ph+qzRUt7nF1vNHdfJ0/2YZ2pZ+XOQ62dOWxjQJtnhLEBN5faftDizO1QR7VcaY1th
         B2gMlUAyrnpPEnSuXIjg0v7ebGj0D7jFND7r5/1yIqLtNPorMEV563M1TGbB6y5QzIzb
         69uRffN14fsfXA3NOeVWJp0NxUn7g4a5ccquY7moBAfqWHgcOt7DGfcfretFbABXDM7C
         mJOIUP9o2bGzA7CZMkUvUUHb0Oaw59fP1sckcKbdvg0t/ddeKFE7FxUbxOVDoWa0tvSp
         3ktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Y54GLtlH6LdYaPPW/vT7zN8oinpgFewT/Kozy6U1sr8=;
        b=tS8hPTFxMRUoLKLyv53Tqaq3DY5V0C85pS78XhcaaV74DWqcV6olmbhbSzB/y5CcAj
         JOA6FbL1J4DnQNHNAJ0+KpqIfeXd2adg15kB3zOPNkEQKaTClANnsJt3iwZgjnm6WtlC
         E1BPoCIfnNLAwKz7Cz8E5TzhAcV64QiOnax1ZawDTDcDDDcoTFb41Ps7lBMHExChWSOi
         nmMh0vkcIw5O601DJMh7j0aLf03gbeiarmWgEEWvG7rSpM8ayGpWPU2gjpFl1aN9PgeL
         fnA7vpAK1/ou3kpN9w495/xxqHm1a2e5+zzijLk4GHXjzUMjZoXXaI0OjPIYAlR8TMVP
         zu7A==
X-Gm-Message-State: AOAM532BTcld02+QB+55FrHEu6PK6/8BETElkqCyIJofoKWcC1xMuOlk
	nKdvlS1bJ3KvXWeWYn/+Q4c=
X-Google-Smtp-Source: ABdhPJzmp7JEbyf5YC9B40GJWfUYSStWlZjAXDQjdn7K/oR4H50lmJrnbL72tBcPT/obo+EANAlJ1A==
X-Received: by 2002:a05:6402:5c9:b0:420:aac6:257b with SMTP id n9-20020a05640205c900b00420aac6257bmr52750712edx.128.1654890155771;
        Fri, 10 Jun 2022 12:42:35 -0700 (PDT)
Received: from ?IPv6:2001:a61:136e:3c01:8bd4:cf6f:76f1:a861? ([2001:a61:136e:3c01:8bd4:cf6f:76f1:a861])
        by smtp.gmail.com with ESMTPSA id nd28-20020a170907629c00b00706c50870a0sm4261637ejc.194.2022.06.10.12.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 12:42:35 -0700 (PDT)
Message-ID: <b2260504dce967f3ce8b0bee190ab81464b01f3f.camel@gmail.com>
Subject: Re: [PATCH 25/34] thermal: qcom: qcom-spmi-adc-tm5: convert to IIO
 fwnode API
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Nuno =?ISO-8859-1?Q?S=E1?=
	 <nuno.sa@analog.com>
Cc: dl-linux-imx <linux-imx@nxp.com>, Linux-Renesas
 <linux-renesas-soc@vger.kernel.org>, "open list:BROADCOM NVRAM DRIVER"
 <linux-mips@vger.kernel.org>, linux-arm Mailing List
 <linux-arm-kernel@lists.infradead.org>, chrome-platform@lists.linux.dev,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
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
 Alexandre Belloni <alexandre.belloni@bootlin.com>,  Christophe Branchereau
 <cbranchereau@gmail.com>, Patrick Venture <venture@google.com>, Arnd
 Bergmann <arnd@arndb.de>, Nancy Yuen <yuenn@google.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Gwendal Grignou <gwendal@chromium.org>, Saravanan Sekar
 <sravanhome@gmail.com>, Tali Perry <tali.perry1@gmail.com>,  Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Thara Gopinath <thara.gopinath@linaro.org>, Avi Fishman
 <avifishman70@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Claudiu
 Beznea <claudiu.beznea@microchip.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Tomer Maimon
 <tmaimon77@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,  Jonathan Cameron
 <jic23@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Shawn Guo
 <shawnguo@kernel.org>, Guenter Roeck <groeck@chromium.org>, Fabio Estevam
 <festevam@gmail.com>, Olivier Moysan <olivier.moysan@foss.st.com>, Eugen
 Hristev <eugen.hristev@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>
Date: Fri, 10 Jun 2022 21:42:33 +0200
In-Reply-To: <CAHp75VdYsPAS_1KZCrWvK5=By020Xxtw_FtogZwJQ=Srajdjbg@mail.gmail.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	 <20220610084545.547700-26-nuno.sa@analog.com>
	 <CAHp75VdYsPAS_1KZCrWvK5=By020Xxtw_FtogZwJQ=Srajdjbg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 2022-06-10 at 17:20 +0200, Andy Shevchenko wrote:
> On Fri, Jun 10, 2022 at 10:48 AM Nuno Sá <nuno.sa@analog.com> wrote:
> > 
> > Make usage of the new firmware agnostic API
> > 'devm_of_iio_channel_get_by_name()' to get the IIO channel.
> 
> _of_ ?!
> 

Clearly not :)... Will fix it on v2

- Nuno Sá

