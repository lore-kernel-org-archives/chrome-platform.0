Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E211B7474
	for <chrome-platform@lists.linux.dev>; Fri, 20 Jan 2023 22:05:22 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id o7so6946909ljj.8
        for <chrome-platform@lists.linux.dev>; Fri, 20 Jan 2023 14:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=47bQYYvwoc4QnN6fF+m3+7Uy31DycYW7WL3pijAuHrc=;
        b=KvPPeMjcYz60GhdROsv9YwE8uv6xdcPv1k4AoX89i567SWpqXcTQSLDK/flblBKQaK
         cfAwGOzXB55ObBgNsuBR/aS/ZWS73BbHA/j30YrvThOJ8sklQ4vSCuYCTT8/aQzKd7x0
         ED9B0EpAuuFXHRhyTAE2rYJAIefWE3cRMQT+JXdOSX+nqVPxt1tECmSugDkFBGKmqaIe
         6MDATr+REE+laIkFeEGl7Baxej1BF+lzV1ySkQv7XTAq7tOHtm6EgBpTeWGjnRwbXi4k
         o/CUW40k/L54EJCQepVRJ5CWNNQh0cJ5hbe2XRT19mSa+4VgezmJ8OO8kHFU25o+EiBV
         +VwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47bQYYvwoc4QnN6fF+m3+7Uy31DycYW7WL3pijAuHrc=;
        b=nDXl/yDoufi4gjacANy4GzDJhQLOmlEsW6S+eV4FQK+lJsyt4HK3UVDJ6ZAi9OCrgF
         5A2d/HUz2atb+/vW0Ag12bK/1Tjj8I+ya/6Yqf0GwR9KFOyWqpRXoWPhYE9cTfnP7mQ0
         Iyhonm9JG8eU2sxijx8YmKFkBZQ0ls84CCg37myP5jO/up+3TaOiG+abPlflWZ5apNb1
         hOp//xJV+7TDifio0MAg+/q+of2RonmgSK3EFOUAFt3IJRPmfhBDn7rHe2uwxilvym8E
         lksjek1Vx3rjF7NcKuqmcwkymXgHnmv0hpJgWl5buF6pZaZepNwppP1AiyK+rGO92aSg
         PcpQ==
X-Gm-Message-State: AFqh2kq3iijT4LrGPkEdG+sYCHkVkeMYdSy5SOZHtWl7ckuRFTK7hUlo
	lkvV2JBBqx81/GKbVLAKeV4VMpAPEJBA/Uh84s0=
X-Google-Smtp-Source: AMrXdXsEvy2zUx8pBtqvlaMNQXcMQiU5wj9qFfZWFmAJ8mJ3iDwd2PNDfGEnDLQioMNqbk8VGMyCnxB99EQkJx6YjZ8=
X-Received: by 2002:a2e:b752:0:b0:28b:77fd:d92b with SMTP id
 k18-20020a2eb752000000b0028b77fdd92bmr1424117ljo.86.1674252320747; Fri, 20
 Jan 2023 14:05:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230118184413.395820-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230118184413.395820-1-krzysztof.kozlowski@linaro.org>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Fri, 20 Jan 2023 23:05:09 +0100
Message-ID: <CANk7y0jpC4Hz5cEzdO2WQkRbqNfBKKgKXTrL142D5Ldr_dhBjA@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: iio: drop unneeded quotes
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Lucas Stankus <lucas.p.stankus@gmail.com>, Dmitry Rokosov <ddrokosov@sberdevices.ru>, 
	Alexandru Tachici <alexandru.tachici@analog.com>, Marcelo Schmitt <marcelo.schmitt1@gmail.com>, 
	Renato Lui Geh <renatogeh@gmail.com>, Eugen Hristev <eugen.hristev@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
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
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 18, 2023 at 7:44 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
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

For ti,tmp117.yaml
Reviewed-by: Puranjay Mohan <puranjay12@gmail.com>
