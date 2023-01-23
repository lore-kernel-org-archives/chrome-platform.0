Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D812880A
	for <chrome-platform@lists.linux.dev>; Mon, 23 Jan 2023 20:47:07 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id r9so11468988oie.13
        for <chrome-platform@lists.linux.dev>; Mon, 23 Jan 2023 12:47:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xLghjk06txc21TL6jUAE/A4E0QaZ29dI9auCG3vhDo=;
        b=Sn/GfDtbJfINuCiM7d2+ocOF6dVMEVz7ljmdzZCMpbC1qnLLTC+G3ObOUriCaMv8VF
         GB9HX2DDMzQ1wS5s9A/6GkwADI7WbWkyiZdW9T5pnjvJZFd5+P6FynwxtKksaMwQRH6T
         gGiiyiAR0VUmU7B2In7bc3DovxDqfxNaIrmfh0ipS6HAMzb35JXAaQkkeg96RHt+GVx2
         AVhDljJ2M+K6Y+YCEwhepupq43vgj3i/OSSUzQN6ds2lLsR2XgRB2Bn9tHEXTPeA2yMU
         ILADULcr1g8hsT5ad2c5iO6rAyuJ8V52r859dcZJrUzlxvT7bPeCpPZdCAbc2bH3QJS+
         c4Gg==
X-Gm-Message-State: AFqh2kpqtth4qmHEaigxY+U06AtSO0hqOb2SxM1e4p9Uhnm1Ry8aOtD0
	ow6W4BCSnQWE2L7RYbM5/A==
X-Google-Smtp-Source: AMrXdXs0GdZyBepqCdjPw6vuhi4kiXTC6MdsciMg0KU1dm35ma/15bsTbV/dQtJ+tboBuLEeFGalFQ==
X-Received: by 2002:aca:6205:0:b0:365:648:3a5d with SMTP id w5-20020aca6205000000b0036506483a5dmr12623568oib.42.1674506826206;
        Mon, 23 Jan 2023 12:47:06 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id i11-20020aca2b0b000000b00369a721732asm155293oik.41.2023.01.23.12.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 12:47:05 -0800 (PST)
Received: (nullmailer pid 2494593 invoked by uid 1000);
	Mon, 23 Jan 2023 20:47:03 -0000
Date: Mon, 23 Jan 2023 14:47:03 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Lucas Stankus <lucas.p.stankus@gmail.com>, Puranjay Mohan <puranjay12@gmail.com>, 
	Dmitry Rokosov <ddrokosov@sberdevices.ru>, Alexandru Tachici <alexandru.tachici@analog.com>, 
	Marcelo Schmitt <marcelo.schmitt1@gmail.com>, Renato Lui Geh <renatogeh@gmail.com>, 
	Eugen Hristev <eugen.hristev@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Andreas Klinger <ak@it-klinger.de>, 
	Marcus Folkesson <marcus.folkesson@gmail.com>, Kent Gustavsson <kent@minoris.se>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Oleksij Rempel <linux@rempel-privat.de>, 
	kernel@pengutronix.de, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Nishant Malpani <nish.malpani25@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
	Dragos Bogdan <dragos.bogdan@analog.com>, 
	Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Stefan Popa <stefan.popa@analog.com>, Robert Yang <decatf@gmail.com>, 
	Sean Nyekjaer <sean@geanix.com>, Artur Rojek <contact@artur-rojek.eu>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Philippe Reynes <tremyfr@yahoo.fr>, 
	Alexandru Lazar <alazar@startmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Caleb Connolly <caleb.connolly@linaro.org>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Stefan Agner <stefan@agner.ch>, Daniel Baluta <daniel.baluta@nxp.com>, Harald Geyer <harald@ccbib.org>, 
	Eugene Zaikonnikov <ez@norophonic.com>, Phil Reid <preid@electromag.com.au>, 
	Matt Ranostay <matt.ranostay@konsulko.com>, Stephen Boyd <swboyd@chromium.org>, 
	Sankar Velliangiri <navin@linumiz.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH 5/5] dt-bindings: iio: cleanup examples - indentation
Message-ID: <20230123204703.GA2479312-robh@kernel.org>
References: <20230118184413.395820-1-krzysztof.kozlowski@linaro.org>
 <20230118184413.395820-5-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118184413.395820-5-krzysztof.kozlowski@linaro.org>

On Wed, Jan 18, 2023 at 07:44:13PM +0100, Krzysztof Kozlowski wrote:
> Use 4-space indentation (for cases when it is neither 4 not 2 space).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

[...]

> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml
> index 1d965124c488..04b12146959e 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml
> @@ -120,5 +120,5 @@ examples:
>          adi,rejection-60-Hz-enable;
>          adi,buffer-enable;
>          adi,burnout-currents-enable;
> -        };
> +      };

Indentation needs adjusting.

Otherwise,

Acked-by: Rob Herring <robh@kernel.org>
