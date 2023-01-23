Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592F57C
	for <chrome-platform@lists.linux.dev>; Mon, 23 Jan 2023 20:21:15 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id k44-20020a9d19af000000b00683e176ab01so8004973otk.13
        for <chrome-platform@lists.linux.dev>; Mon, 23 Jan 2023 12:21:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mr/peXg3iK9f7Aw5h5gPRIJPOxe93cL+xJQ1s//fQlg=;
        b=6aw9GT2qrttZ330uTU6OD+/SMWGyRkEqnhsH/g7SvFm0Y0wnJuRTfd1vHmDYoDrg3g
         LSZUZxYjEryVwTGT5rIpJf5JSFsvw/f8bPKyNRp/zrQYO87NIU4iiow9RrdNk8O78sJY
         005qlnZ8CPFm0PWMbdjfASARc8oXOpgR+cS0GjP5GQp1monQdo2LmuiZRb1MkmILi0kf
         1o103nHx6T74Cs6nFgyHwy/LIxzYl7VnzM++YoKiqoa9orVT6tLa+LwJYA8wcNIZ8oPF
         jbi4mIwKzfWIGlGPNy7NoQ1x64HnsPdsZWrDACHZPyU1yQa/8btxyt95Wt2IaQK4e65K
         ltGA==
X-Gm-Message-State: AFqh2kqt9VN8eV4uwwvRsCVF4RpmklatqczYpyu4eazYE9ThoEGcRQ8B
	cECsFJ96xVDyUhgzh/nvQ27zu0P6eg==
X-Google-Smtp-Source: AMrXdXulR+j0z8S//w5zkUvbJ/5d+atzZyf8exjuefCvS2FYb1oZTNJnqHAYF39sn6MNSTozYMuPdg==
X-Received: by 2002:a9d:798d:0:b0:684:eca3:fa4a with SMTP id h13-20020a9d798d000000b00684eca3fa4amr13677320otm.31.1674505274364;
        Mon, 23 Jan 2023 12:21:14 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g1-20020a9d5f81000000b0068687c98725sm71931oti.62.2023.01.23.12.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 12:21:13 -0800 (PST)
Received: (nullmailer pid 2459145 invoked by uid 1000);
	Mon, 23 Jan 2023 20:21:11 -0000
Date: Mon, 23 Jan 2023 14:21:11 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, Kent Gustavsson <kent@minoris.se>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, linux-iio@vger.kernel.org, 
	Harald Geyer <harald@ccbib.org>, Dragos Bogdan <dragos.bogdan@analog.com>, 
	Lucas Stankus <lucas.p.stankus@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	chrome-platform@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>, 
	Sankar Velliangiri <navin@linumiz.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
	Eugene Zaikonnikov <ez@norophonic.com>, Guenter Roeck <groeck@chromium.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Philippe Reynes <tremyfr@yahoo.fr>, 
	", Linus Walleij" <linus.walleij@linaro.org>, Alexandru Tachici <alexandru.tachici@analog.com>, 
	Robert Yang <decatf@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Alexandru Lazar <alazar@startmail.com>, Matt Ranostay <matt.ranostay@konsulko.com>, 
	Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, Andreas Klinger <ak@it-klinger.de>, 
	Marcelo Schmitt <marcelo.schmitt1@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Dmitry Rokosov <ddrokosov@sberdevices.ru>, Artur Rojek <contact@artur-rojek.eu>, 
	Nishant Malpani <nish.malpani25@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, 
	Eugen Hristev <eugen.hristev@microchip.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Stefan Popa <stefan.popa@analog.com>, Sean Nyekjaer <sean@geanix.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Stefan Agner <stefan@agner.ch>, 
	linux-kernel@vger.kernel.org, Daniel Baluta <daniel.baluta@nxp.com>, 
	Renato Lui Geh <renatogeh@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Marcus Folkesson <marcus.folkesson@gmail.com>, Oleksij Rempel <linux@rempel-privat.de>, 
	Benson Leung <bleung@chromium.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Phil Reid <preid@electromag.com.au>, 
	linux-fbdev@vger.kernel.org, kernel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, 
	Caleb Connolly <caleb.connolly@linaro.org>, Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 1/5] dt-bindings: iio: drop unneeded quotes
Message-ID: <167450527140.2459087.12632188984291690101.robh@kernel.org>
References: <20230118184413.395820-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118184413.395820-1-krzysztof.kozlowski@linaro.org>


On Wed, 18 Jan 2023 19:44:09 +0100, Krzysztof Kozlowski wrote:
> Cleanup by removing unneeded quotes from refs and redundant blank lines.
> No functional impact except adjusting to preferred coding style.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/iio/accel/memsensing,msa311.yaml  | 5 ++---
>  Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml | 2 +-
>  Documentation/devicetree/bindings/iio/adc/adi,ad7292.yaml | 2 +-
>  .../devicetree/bindings/iio/adc/atmel,sama5d2-adc.yaml    | 2 +-
>  Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml | 4 ++--
>  .../devicetree/bindings/iio/adc/ingenic,adc.yaml          | 4 ++--
>  .../devicetree/bindings/iio/adc/microchip,mcp3911.yaml    | 4 ++--
>  .../devicetree/bindings/iio/adc/renesas,rzg2l-adc.yaml    | 2 +-
>  .../devicetree/bindings/iio/adc/samsung,exynos-adc.yaml   | 2 +-
>  .../devicetree/bindings/iio/adc/st,stm32-adc.yaml         | 8 ++++----
>  .../devicetree/bindings/iio/adc/ti,ads131e08.yaml         | 2 +-
>  Documentation/devicetree/bindings/iio/adc/ti,tsc2046.yaml | 2 +-
>  .../devicetree/bindings/iio/dac/lltc,ltc1660.yaml         | 4 ++--
>  .../devicetree/bindings/iio/dac/lltc,ltc2632.yaml         | 4 ++--
>  .../devicetree/bindings/iio/dac/st,stm32-dac.yaml         | 4 ++--
>  Documentation/devicetree/bindings/iio/imu/st,lsm6dsx.yaml | 2 +-
>  .../devicetree/bindings/iio/temperature/ti,tmp117.yaml    | 6 +++---
>  17 files changed, 29 insertions(+), 30 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
