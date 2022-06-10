Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96BC7C
	for <chrome-platform@lists.linux.dev>; Fri, 10 Jun 2022 14:56:40 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id n28so35643012edb.9
        for <chrome-platform@lists.linux.dev>; Fri, 10 Jun 2022 07:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=27H3ValQb+HBvUPzRu8Xf/glxEPwy0TQVzU1GqPnVOU=;
        b=eoLQQvbaXDJR95EC5g5LJ5CxHbAJV47MdiWWQDebUGy9Q4ljUChinzTC65zAyx9+cu
         P1TKzxsUNIbMO6DgJKWLF02va3yYhlizG8M969o8ytL6wp0eioeV35oB2ovGhpg0HL2J
         AtE27v900JQInLKWLqxjz95V4dBqhK4TH2d+FpSxvJHnaV2+W4R07LunLSpcHXFduZip
         CtWpeygUURiujmqCRQx07U09RQlXGX3kfWPB66KuMLyPm04qs+bAtSY+koRjNgs1IcDR
         1X5UPyx91NZwB8hqYfnf3lsrVd7c+3ZPhRnd7kjLUGHQEmxcvRwvNYyB/XfwXQBjPuch
         iMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=27H3ValQb+HBvUPzRu8Xf/glxEPwy0TQVzU1GqPnVOU=;
        b=oAM0bq9P7PZcRf6nQPu7jxT/A5NvKfanxmyThKcSd6juMK+HcIY+TBereRamFwAGdc
         lVs1Iqex3EJbhsO/Zafs/o0DKJzUwF5BYU0CnJBUlokaeFr0bDNRvJMMfVn6cifSGQ4E
         oQ/m9MEaIwsLRTvw1iOL7UCAeLVLmdlM4mdVuHpr7xRP3LEcADlhfgkSJwjs3fgeYdob
         by1JUoa3fLVDSUhQ2epDC7aTowPvmuWCAbWz/0IIBaj9j0e0yhDs6vL1V3YlkOGAaDbt
         7EBwm0+69tJGsBkSDDSoL9n4uPBMxse5QSuSKbT2ZnDKD6rcI9/MwThCKk0uojWC79gX
         N+3w==
X-Gm-Message-State: AOAM531JiCxoiNOXlhC2/+LMsGCbCtoeSTe2tQbYfstMpaPX8bECvbXc
	JwMo5ekAH2tDom1oAv8wrY4UBGinR/dt6kCjgis=
X-Google-Smtp-Source: ABdhPJy+4W6TzW/Fih8FB8596xZDMbGHtv+y8KFgg0s5ncZshszK0PY5LIku4jQLDiOJ5W3CjVR22n6jku9zOiOB+lo=
X-Received: by 2002:aa7:d303:0:b0:42d:d192:4c41 with SMTP id
 p3-20020aa7d303000000b0042dd1924c41mr52267347edq.178.1654872998983; Fri, 10
 Jun 2022 07:56:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220610084545.547700-1-nuno.sa@analog.com> <20220610084545.547700-21-nuno.sa@analog.com>
In-Reply-To: <20220610084545.547700-21-nuno.sa@analog.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 10 Jun 2022 16:56:02 +0200
Message-ID: <CAHp75VcdwjTYDF2c-StsL7-pLKtV3vGxinX8+1nJydqB_WNXiA@mail.gmail.com>
Subject: Re: [PATCH 20/34] iio: inkern: only relase the device node when done
 with it
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
> 'of_node_put()' can potentially release the memory pointed to by
> 'iiospec.np' which would leave us with an invalid pointer (and we would
> still pass it in 'of_xlate()'). As such, we can only release the node
> after we are done with it.

The question you should answer in the commit message is the following:
"Can an OF node, attached to a struct device, be gone before the
device itself?" If it so, then patch is good, otherwise there is no
point in this patch in the first place.

--=20
With Best Regards,
Andy Shevchenko
