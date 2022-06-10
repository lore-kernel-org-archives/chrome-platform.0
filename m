Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DE97C
	for <chrome-platform@lists.linux.dev>; Fri, 10 Jun 2022 15:21:10 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id y32so43359711lfa.6
        for <chrome-platform@lists.linux.dev>; Fri, 10 Jun 2022 08:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=H+ga1sC9+ntYYTy6ffK9GjlUeE88A0FzNz+Ar82l8uE=;
        b=QuszwAyXszuHI8ReemXfLsvKVbRYP/Ciej6NodQS4f4DxB0dYCz1JKt3Z8KqRQdbVX
         Jqbo5bZLYC1v1EbQmqJbF588+MBvfJAEhBinRuB3cCDUahi9/8/q3PAe0W2Vgs45ckLW
         /hiuFN/v5rZ/itjafx60G3maggGA2cuzdXxWkUwbpLNnOq8CiWcKz0KQDvAWhjQwa/9r
         QOtElc4xrfhvBjGu9rsXtW8n9+fhA5ojdEZ/+ut9V4+pZWnRJ1pOf+C00H4egWSGhIy5
         cr1goHKSiGEFoiuomtuXSN8DfgxD+HYZKIUFs35eLE9qua0p+q3zFgLJ1Xe+CnTMsAx4
         6A2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=H+ga1sC9+ntYYTy6ffK9GjlUeE88A0FzNz+Ar82l8uE=;
        b=wsv0eylqdHs6e87H6WVHnbx+1JhR8DZhmULiJJW/qbXPyC4x42FEJOE53BTEVru00f
         jVIw/CeP/6PUMMjsHSdK52957a0r+GAcG0VdwgcSeZQMtGewnofk3FX+bDPcj16T9rva
         L5cWuYCILkRqrFjlpCdBv0KHB3W92tn1GkYh+ujwqgtz71xpNsV2vmgk8tFKp8nqOfTc
         uwrHgW1jN7q+uynEEfzhaEbdFEUpRzaro5TaKkkQv3qDvTcJz/FU3SnWutipdmSm6f2U
         4BE5QfPc9gk/Ec420b39YP6/pnNfWXMsC48uAobbmnX6iyWbpkVe8+loAYJ3MUKbup1G
         A4xg==
X-Gm-Message-State: AOAM532H51Jiw5Lnsdd9SiiPwUm2NJxqetKtlca66HddJ138PFlKdSVM
	LlDQ9RaaY4U/3X661dzwar36YUpOc7+hRWcMgRw=
X-Google-Smtp-Source: ABdhPJy+kvE8MxchmBmksNafSpi+qANBoJkttBTTtDBUpDtpcRk/iOf7pFYhhSUgUCkmvGrvjJK5StTzheGUp//PDx4=
X-Received: by 2002:a05:6512:308c:b0:479:54c2:c91 with SMTP id
 z12-20020a056512308c00b0047954c20c91mr13940269lfd.565.1654874468712; Fri, 10
 Jun 2022 08:21:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220610084545.547700-1-nuno.sa@analog.com> <20220610084545.547700-26-nuno.sa@analog.com>
In-Reply-To: <20220610084545.547700-26-nuno.sa@analog.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 10 Jun 2022 17:20:28 +0200
Message-ID: <CAHp75VdYsPAS_1KZCrWvK5=By020Xxtw_FtogZwJQ=Srajdjbg@mail.gmail.com>
Subject: Re: [PATCH 25/34] thermal: qcom: qcom-spmi-adc-tm5: convert to IIO
 fwnode API
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
> Make usage of the new firmware agnostic API
> 'devm_of_iio_channel_get_by_name()' to get the IIO channel.

_of_ ?!

--=20
With Best Regards,
Andy Shevchenko
