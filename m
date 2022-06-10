Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BCF7C
	for <chrome-platform@lists.linux.dev>; Fri, 10 Jun 2022 14:45:56 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id o7so20625182eja.1
        for <chrome-platform@lists.linux.dev>; Fri, 10 Jun 2022 07:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KoDE34zocTcx3MPzWCnR4QwZS2ytF1uI72CoiLyAcyQ=;
        b=cPMR1qwhgBciQ4QuFRIqiyeHmWI4Ln4CHN421omnkh7YH9MB7rz/jhyXlDcjROB6tT
         JiSpoNNM1qEgfFc/7U9Bzbww3hRJhk8lPntDxUJBZ89txLcz/l4eIrftQGXd/SjihNQ3
         DYhEWO3cPHerQ6tMoyNMwIS+iCRH+4RQ3UEZLVQEmS5QOfbNGv833fIl2ncEf4jXl14U
         yi4+tL0c+r7c5GU8P4oAYYhsdlfSHRZE9gQECvEhxRs3N2lDYwzDcaqkKjAEBpHjgt9p
         K0sdA/V/R/iXE5p8XbseNASd66P628xRR1EgKSZHtqMGGV6sRCzr4iT7MWyT+gB6Znn7
         cYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KoDE34zocTcx3MPzWCnR4QwZS2ytF1uI72CoiLyAcyQ=;
        b=NZ30Ic/P+BnLV7+foXQdn0CPCxLaj/81rqXMXNsINvJ92D/uh3wFVslirSkNSsIxVG
         v3wYZ+5Aya+pAX2VQQdMoFGOz5BfjJC4Uv2s1bpdJvSfhYCsf0phl+2bo7LDI0xo2nb6
         YZ5nhn2ocLsEPW+Exx1nMBhRvloOJFoes26u/UqzxqQQ4KcXCY83WzbyhvNoSw2REi8B
         x+riLHRdXjxmFMAmIYj369UGgiX4AyxtawqWyla+AiWUmfpsCobRucitmE/714fB931x
         O272DuHUu7l5MSvLtS0+kLP1LpwSBEzfUPvx5w4slsyOZ1Rw5lnfFq2b0Zc7T4aP+O0m
         Vpjg==
X-Gm-Message-State: AOAM530vMpMKsc6cqClvZqm5h4a0iNhyvJnxZj186h8YXGJLbHm9cIpM
	hZSQ2hfARJnpA8oUI19+KkK5HZxoWBXGLxWB/24=
X-Google-Smtp-Source: ABdhPJxizt9m4eKBTNu+PJtwHNsl6LS2ZuZ/AzA8lc7FGXQyzDHIdcU8VIdIbeQpqLpHnNiy07ZL4b6rgaPhYce2N3E=
X-Received: by 2002:a17:906:1193:b0:70d:cf39:a4db with SMTP id
 n19-20020a170906119300b0070dcf39a4dbmr35595214eja.44.1654872354568; Fri, 10
 Jun 2022 07:45:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220610084545.547700-1-nuno.sa@analog.com> <20220610084545.547700-7-nuno.sa@analog.com>
In-Reply-To: <20220610084545.547700-7-nuno.sa@analog.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 10 Jun 2022 16:45:07 +0200
Message-ID: <CAHp75VcU-oV4is_y9=oaOx2ugvTEOy53h2wvbd3-Z9_gv5Y=zA@mail.gmail.com>
Subject: Re: [PATCH 06/34] iio: adc: ingenic-adc: explicitly add proper header files
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

On Fri, Jun 10, 2022 at 10:46 AM Nuno S=C3=A1 <nuno.sa@analog.com> wrote:
>
> Do not trust the fact that iio.h includes of.h which in turn includes
> all the headers we are relying on.
>
> The ultimate goal is to actually drop of.h from iio.h.

...

>  #include <linux/mod_devicetable.h>
>  #include <linux/mutex.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/of.h>

Ordering (from the context I don't see it's messed up already)

--=20
With Best Regards,
Andy Shevchenko
