Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E8A7C
	for <chrome-platform@lists.linux.dev>; Mon, 23 Jan 2023 20:21:33 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1442977d77dso15346008fac.6
        for <chrome-platform@lists.linux.dev>; Mon, 23 Jan 2023 12:21:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIXb14l8qXPqTW/PtL9Jyd2nlt/GYyXK1O+1ZgxBBnc=;
        b=o7o2tpcBrcSUDZAHi8r3zHnMIbH45ahnwqRa6zpFFoCtdxiifZibQdxSQ+DJ8kCvpO
         vVIkj6noquAaGhviEjIpwOibB81hsfkXi2Z8zA8pxviSYdI9uylEdtI5dfsCsyg01UI5
         lMRT5mJRbFdTFSqrPD87QhbgAWUHs1cmILYJnEi/GejjTs9K+wLnkLxulmGTAHEtpcFm
         J2OGSvgeOYnk/rmgdeOSxbwCqGBcrO3v/gDd++QBGTsKdBz/7Y3iMzeAcQbezg4klJzw
         Y/XvhZ9iwlfIUFTzCmU/JiSfreXweLwGPPV+q/S2cwsdEMmWXQteTDu7hKlg3wXgxdGY
         4M5w==
X-Gm-Message-State: AFqh2kqD8TbtA/a2e6zU62f56lhH11Ub8+S/zhHf1EMx07CdwW8WQ7jh
	EufyzMpu8TGRLnjTiuPDRw==
X-Google-Smtp-Source: AMrXdXuK8kDdEc2x7uYT25rzCUabXOb/nurq2zZCYeuPju4G3OhwCu+TOZB5uMPQMcHtcgqdDT83XQ==
X-Received: by 2002:a05:6870:3d96:b0:14f:eb44:afde with SMTP id lm22-20020a0568703d9600b0014feb44afdemr13270485oab.26.1674505292384;
        Mon, 23 Jan 2023 12:21:32 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id o41-20020a056870912900b0015f9cc16ef7sm7295004oae.46.2023.01.23.12.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 12:21:31 -0800 (PST)
Received: (nullmailer pid 2459648 invoked by uid 1000);
	Mon, 23 Jan 2023 20:21:30 -0000
Date: Mon, 23 Jan 2023 14:21:30 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Stephen Boyd <swboyd@chromium.org>, 
	Dragos Bogdan <dragos.bogdan@analog.com>, devicetree@vger.kernel.org, 
	Rob Herring <robh+dt@kernel.org>, Eugen Hristev <eugen.hristev@microchip.com>, 
	", Jean-Baptiste Maneyrol" <jmaneyrol@invensense.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Artur Rojek <contact@artur-rojek.eu>, Stefan Popa <stefan.popa@analog.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Andreas Klinger <ak@it-klinger.de>, Marcus Folkesson <marcus.folkesson@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, Lars-Peter Clausen <lars@metafoo.de>, 
	linux-samsung-soc@vger.kernel.org, Nishant Malpani <nish.malpani25@gmail.com>, 
	", Michael Hennerich" <Michael.Hennerich@analog.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	chrome-platform@lists.linux.dev, Kent Gustavsson <kent@minoris.se>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Alexandru Lazar <alazar@startmail.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lucas Stankus <lucas.p.stankus@gmail.com>, 
	Alexandru Tachici <alexandru.tachici@analog.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Robert Yang <decatf@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, linux-iio@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Philippe Reynes <tremyfr@yahoo.fr>, 
	Oleksij Rempel <linux@rempel-privat.de>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Dmitry Rokosov <ddrokosov@sberdevices.ru>, linux-kernel@vger.kernel.org, 
	Guenter Roeck <groeck@chromium.org>, Sean Nyekjaer <sean@geanix.com>, 
	Matt Ranostay <matt.ranostay@konsulko.com>, 
	"linux-renesas-soc@vger.kernel.org , Stefan Agner" <stefan@agner.ch>, Marcelo Schmitt <marcelo.schmitt1@gmail.com>, 
	linux-fbdev@vger.kernel.org, Renato Lui Geh <renatogeh@gmail.com>, 
	Phil Reid <preid@electromag.com.au>, Harald Geyer <harald@ccbib.org>, 
	Sankar Velliangiri <navin@linumiz.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Eugene Zaikonnikov <ez@norophonic.com>, kernel@pengutronix.de, 
	Caleb Connolly <caleb.connolly@linaro.org>, Rui Miguel Silva <rmfrfs@gmail.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com, 
	Puranjay Mohan <puranjay12@gmail.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH 2/5] dt-bindings: iio: minor whitespace cleanups
Message-ID: <167450528964.2459590.15791649664134666125.robh@kernel.org>
References: <20230118184413.395820-1-krzysztof.kozlowski@linaro.org>
 <20230118184413.395820-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118184413.395820-2-krzysztof.kozlowski@linaro.org>


On Wed, 18 Jan 2023 19:44:10 +0100, Krzysztof Kozlowski wrote:
> Drop redundant blank lines and add such when needed.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/iio/dac/adi,ad5380.yaml        | 1 +
>  .../bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml    | 1 -
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
