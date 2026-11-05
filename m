Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.92.39.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793846397;
	b=gx2pZgnFwgp4GEXwd5RNNLY0bAtHxQh/DJp77/I/zK7NuguHyZgWrRxUrX1DFkFhfoK1
	 iqQx9qyb/uwY4BExSsaOvc0VKQCEL/RXCnIZpYTJD+LN0nZ6RSlfcIy8GB4U9de/h9lOT
	 5vPuZVFJOA/kvz/ojK2iScPlTYKDs47srZZlgA65oPplXa365MeMxR0DXt7RsueDac4Nt
	 HMrRGUbWZZpiXykjkDNpK2Om23A4z9+VVE7SXJ8oVuntqw3oZNJNl4layRfm+jEwQ61Lr
	 wYZ97TFrOuZrCYruo8c6cCTlSW5ltB//EEAR8tKqOl/G5Ewsvm0CI9U495CCXDGJwJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793846397;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=8nHg2KK9YdUFsDyCN5OyhUk3RMp8EQBW/fDZ8x8OirA=;
	b=L+tF8cUi8vKhrg6CQxRKT0MbjZd9slnbLEWPp/QUy1uhdpcaMGUr7VDYsoEdYJURmIlZ
	 8w5zIC+p34Gkgwy6o3hWBUoyrbD23IDq4+SWBwPIGQdQhHlxQuOJsc2NvR5s4gCoVHiBe
	 DFmNO5iGuTQU5rcPw9HBTuiSU87QURffqNVy0ptTzuulwgFTvonybSvbUJIEif9spSc4t
	 gyfUihFK2UGnar3lkAyCa6+uEoqIPUMhNgbNhf/YwKqs4WZsBlzLhjN/prs14+BXFG8uN
	 z/cFMm/gzKXE/5uD2ZET9Dccy8/0JIUza1fVdcpDC/m+aWBkKsd6d018ogIUrfgcGRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Nqz4+xih;
	arc=none smtp.remote-ip=54.92.39.34
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4996C606D80A
	for <chrome-platform@lists.linux.dev>; Thu,  5 Nov 2026 02:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4996C606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Nqz4+xih
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793846386;
	bh=8nHg2KK9YdUFsDyCN5OyhUk3RMp8EQBW/fDZ8x8OirA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=Nqz4+xihSRA/SOazc9ytMPaaon6hM2Zpa/k876GDLA/rAvSdmROK7bgusiNH5yJRm
	 MxDa4YviOx4vP5CKZmEuJc3kfvwqLKu/L2OohyPYk21mJnJpm1Y7KU5OpOGkVf3+ti
	 zev+B3KBBNrXf3bQvlO8tLbPTEvcdSoXebx80EGI=
X-QQ-mid: zesmtpsz9t1793846385tf96fa952
X-QQ-Originating-IP: J+L2j4Y4mzSPrUfJi3bnLL1YOptBIpz78FNjPpcaSco=
Received: from mail-pj1-f47.google.com ( [209.85.216.47])
	by bizesmtp.qq.com (ESMTP) with SMTP id 0
	for <chrome-platform@lists.linux.dev>; Thu, 05 Nov 2026 10:39:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10348480576769336074
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so1102397a91.0
        for <chrome-platform@lists.linux.dev>; Wed, 04 Nov 2026 18:39:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzjk2/66GCB9BIxYU/jvJnqASv/+Q1J/6qvAULiCSt7imuXFHvrRwuZ9Ot8naE2txdRsaj2JHKLmN1sXhnJweI=@lists.linux.dev
X-Gm-Message-State: APuU4Z8TO0Ww1b645SPykv8dZCsTLIlx2+mTaZEnlA1zjVfHOdGSUb4p
	yOAdRtGdI4UyC8ni2xjt55ae82wRTXP2gET0G6MFcwWWfEQea5/1N1kWqmX/6Sk6UGBaBxC3D6g
	9fQDceoS0+631sa87ekxHLdYwPoDePow=
X-Received: by 2002:a17:90b:562d:b0:3ad:a462:f07f with SMTP id
 98e67ed59e1d1-3ae8982c1ffmr16206466a91.45.1793846382617; Wed, 04 Nov 2026
 18:39:42 -0800 (PST)
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261102135330.2493332-1-robh@kernel.org>
In-Reply-To: <20261102135330.2493332-1-robh@kernel.org>
From: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>
Date: Thu, 5 Nov 2026 10:39:06 +0800
X-Gmail-Original-Message-ID: <872B2B4EAE847E62+CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
X-Gm-Features: AclHuK-lEE7dv-iC1Lsio6aPGOufL5hgelB1hFojisk2-zoMsjC0hhsp9HraOXA
Message-ID: <CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Use hex unit address patterns
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Jiri Pirko <jiri@resnulli.us>, 
	Ivan Vecera <ivecera@redhat.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Lee Jones <lee@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Shawn Guo <shawnguo@kernel.org>, 
	Chanh Nguyen <chanh@os.amperecomputing.com>, Alistair Francis <alistair@alistair23.me>, 
	Julius Werner <jwerner@chromium.org>, Paul Cercueil <paul@crapouillou.net>, 
	Dmitry Osipenko <digetx@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Ray Jui <ray.jui@broadcom.com>, 
	Scott Branden <scott.branden@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sound@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-tegra@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MyM5EdrZ1RnuUwIDbCrkivS4MT+pkp45QzhyOyQAaPnaYCAOz6fu3Rmm
	z8XUyuNqFirsT5HDyGn2FDxoJfQOZnYVj9mMq2Mt7GhggNhYQ7i+UQ1iF3YRGxiB3UQ0Ew2
	RFnZXebBwenb6L0QHhKLJpI3cCye7YCew+xP/PoZQyUlAW3VTtdb7zLl2RO7yxp/dQi6WVP
	qKctTx+XHrXga9yVsP3WVudeujO657ZQshsxUQinGt1H+I/Nx1+1xs594mRlgGBFNk6tomE
	SEpmF7DbrvDdwecCyuzM4vmIczHEtshv6FWY3gSE1WKkDWr1HT+CepeM4D566uNLsSYsQyC
	goORvVj/IqM2eg8sloBxNQEuv0wnlCLu7S0S+ayAZh9NVgZLEwGkXli61v2jjf0qofz6yXI
	kE8LVjNGche6V7+02bLa1HuWi35MNvxizo7wZPPuwzNpXN7uguc6bMAIhm3lNKNRiFnJJag
	WvOlBdToG1p3bhLGp4SVTfXim2qM22V4lJhAgs4OM6ffXFZu4x1GzxTCJnR6+9TzSnib/bP
	C6Gj43+eCBfrtpx7Zxdi7BRT7vm+pk7DUE3dJEKGzHp5suhDYxXncx7Ho5hL8WqVt61PUxb
	GPEu/UKzTHoxTkqxvHgmG2RYVx6WDRczz4jiY3+yqzh9xTPB6pjOIfKKTF7r70qmluIBs7Z
	XD1EC0NM7fv7nx/FE+c5TsCmXSIsu5w1ZY6DXYNKv5EnUT0UfFvYajrzT/14gyQliybCsb7
	KUpKcCAhRwPQYaxU8hMCZYY3IE5ew1nSn6lKO58gCVeX2xRmcMIUXU264sHWbzBENisDqWA
	nWZz+/xBmv2Skf0NdX8h3YkToIQ8HD8tdIWbWbGZpooWM6F6h5B5NPTE4xa0mchucRHx7sJ
	XR3TDU9UWHkcY3ig8llOJxdXgfu0t4tePcGhJPvYugvt+SMP1WdPnS5qHz9O/mGi0nMqPUg
	xxlFn1Um/i1OpiulQutKdvz73vtAgIDxKn29Nv/KolEhv+17mwdt/o6ICtWAfxNsTtrFjyz
	u5N5oETnJc5X6hcI5lqI4NA+4GNTaGSXyl5qBu6jh/hI1/XcrI
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

On Mon, 2 Nov 2026 at 21:53, Rob Herring (Arm) <robh@kernel.org> wrote:
>
> Unit-addresses by default (and most commonly) are hexadecimal. There's a
> number of cases using decimal patterns. Fix all of them, limiting the
> pattern to match the 'reg' limits if there are any.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

[snip]

> diff --git a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> index afa551f6185f..222d70baef1e 100644
> --- a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> @@ -47,7 +47,7 @@ properties:
>      const: 0
>
>  patternProperties:
> -  "^([a-z]*-)?sensor(-section)?@[0-9]+$":
> +  "^([a-z]*-)?sensor(-section)?@[0-9a-f]+$":

Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>

Thanks,
Chunyan
