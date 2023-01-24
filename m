Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC607C
	for <chrome-platform@lists.linux.dev>; Tue, 24 Jan 2023 07:40:19 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so12176868wma.1
        for <chrome-platform@lists.linux.dev>; Mon, 23 Jan 2023 23:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mqgrYYoh+EWOFvzfNiDUZjtAea3Dxak9qwqCg1uYmZs=;
        b=Iw6RmCnB7UYWK7kSGR74JYXm36gVuMD2oo69ktEWRjIlPFJ3uJKXdHINKBsnvNa20K
         a6s62IgiALmtBdqhwlm38anPhhtKphIymExmhaarIuTy5WOIM18iqW5M2vQxqHzOL0Ob
         VAB6f44+e/uitx/Jz2LE91zlKQvD1trBEC6H52BTjjkr5zt9DXFqLogf95s7DRDamiLv
         gqhITmZDiJjRp2ecP1LeQh4bcxQTtGI8kgAgNoKpRi6J+fZglBjyXPY071TJYlGDxZ1S
         RZt2VXIe0bs3W7Tit02TVq/emcJZk9j7wxUZP38Q6Kord2ejBzNtOJgfb7krcUMQvKSX
         XXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mqgrYYoh+EWOFvzfNiDUZjtAea3Dxak9qwqCg1uYmZs=;
        b=wd/iQoVgBbCPd3VUAjp31ca4bQ7k3GpekuII6iuMiRkeWWG+ko1lXM9Te8kBVleTfa
         IJIWAZftmIuLsaqVZXmBenY381Mj7nvBi1ejU6JM02kBhb7yBg/ahU3/WJVpv14q2AMs
         MNPaK1akLGSH/BEyJ+lEO4jAPNzqYJyYYQ4awOmD28P1lptfAQVS5fLYFYTaS8MtCnQ3
         cFfvXFWANtq1zsI5sf0cTs+g9qSxyM10FxnDTC3Gwr/eC37LIjDXdv0vOEMFQdaiRfQi
         SZ9TAaoaByJfhyO/aGwIooP+UxDUnWeQLB/Qze1Sp6JJkA3gPEo7OSEHeSTbuuxjZhTl
         hKTw==
X-Gm-Message-State: AFqh2krXOea8HPXZilW5tDalO4GyUSUnmM9w+471ke4jAVktNuCUTUw9
	6NNhyh0tBhuQ+aWmoz8kUm2R+A==
X-Google-Smtp-Source: AMrXdXvjUqFczdJEB1osktna21bsflhjC5XBWkXYjahNjJYeA03Is1n5wsbfsMieycER48v2a2JOKg==
X-Received: by 2002:a1c:4b09:0:b0:3db:f0a:8726 with SMTP id y9-20020a1c4b09000000b003db0f0a8726mr23769294wma.28.1674546018235;
        Mon, 23 Jan 2023 23:40:18 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i10-20020a1c3b0a000000b003dc0c5e257esm1480972wma.39.2023.01.23.23.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 23:40:17 -0800 (PST)
Message-ID: <d6be59b8-b0e1-172d-0d04-f18dca1e1342@linaro.org>
Date: Tue, 24 Jan 2023 08:40:13 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 3/5] dt-bindings: iio: correct node names in examples
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lucas Stankus <lucas.p.stankus@gmail.com>,
 Puranjay Mohan <puranjay12@gmail.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 Alexandru Tachici <alexandru.tachici@analog.com>,
 Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
 Renato Lui Geh <renatogeh@gmail.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Andreas Klinger <ak@it-klinger.de>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kent Gustavsson <kent@minoris.se>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Oleksij Rempel <linux@rempel-privat.de>, kernel@pengutronix.de,
 =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>,
 Nishant Malpani <nish.malpani25@gmail.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Dragos Bogdan
 <dragos.bogdan@analog.com>, Jean-Baptiste Maneyrol
 <jmaneyrol@invensense.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Stefan Popa <stefan.popa@analog.com>, Robert Yang <decatf@gmail.com>,
 Sean Nyekjaer <sean@geanix.com>, Artur Rojek <contact@artur-rojek.eu>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Philippe Reynes
 <tremyfr@yahoo.fr>, Alexandru Lazar <alazar@startmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Stefan Agner
 <stefan@agner.ch>, Daniel Baluta <daniel.baluta@nxp.com>,
 Harald Geyer <harald@ccbib.org>, Eugene Zaikonnikov <ez@norophonic.com>,
 Phil Reid <preid@electromag.com.au>,
 Matt Ranostay <matt.ranostay@konsulko.com>,
 Stephen Boyd <swboyd@chromium.org>, Sankar Velliangiri <navin@linumiz.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev
References: <20230118184413.395820-1-krzysztof.kozlowski@linaro.org>
 <20230118184413.395820-3-krzysztof.kozlowski@linaro.org>
 <20230121171709.5eb75e94@jic23-huawei>
 <45b9b378-6619-c47a-b5ea-6b6b7edca785@linaro.org>
 <20230122170105.6a1a9766@jic23-huawei>
 <20230123203341.GA2459877-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230123203341.GA2459877-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/01/2023 21:33, Rob Herring wrote:
until we've documented something. Otherwise,
> we may be just changing things twice. We have the list in the spec, but 
> really I'd like that in schema form. We'd also need to figure out how to 
> use that. There's always going to be odd things which we don't have any 
> defined name.
> 
> For now, I'd just do 's/_/-/'.

I'll send a v2 with fixes.

Best regards,
Krzysztof

