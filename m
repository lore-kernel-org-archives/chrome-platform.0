Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EF6311C38
	for <chrome-platform@lists.linux.dev>; Wed, 25 Feb 2026 21:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772054828; cv=none; b=AfD+NyZ0MlbsVWGCEb0IjEHwmcDGupW/e3Fm9Y2uuIXJQRcUwwrMXLMOFbVqjzT0U7Qb/CPnq6V5g+jB8Q2tjLBFg0ayjU4nP18bEFIEmtb5D+MyVP8HtcytHU2FaPDOzBweHF0ryiO2iPRrRw9IIYjSErtFiI5Zs+3o2dhG6m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772054828; c=relaxed/simple;
	bh=yGGMDF5JAAyQ7t/X+LED3I2wNOi+oFXMl1uT9N+vUHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UGXhb2TLJSVdwfOKoTKngcDyjApB+2S24UesQYy36GcoUaP7jP1CdUNshn9JydxLgTytaJyFFMQZ9il0Ey4csk7f5zpKaGP0vbk0qLhXI+5hSuP2UX1JC37HHUbiVBxZXh3mzPezBfI3WvRz6Jh7BuYITFdeUhhqd/a0MJYP03k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=QztS+Ln3; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="QztS+Ln3"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-463967f35d7so132157b6e.1
        for <chrome-platform@lists.linux.dev>; Wed, 25 Feb 2026 13:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772054825; x=1772659625; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6qd3od5gT9Y56WsM6DlqnASWYdZTTGBmXPSgA7J3iS4=;
        b=QztS+Ln3cKv67X3oioAg+EIDDYHSV35JUR6XEGahZX6TtIkDzwSji7hqc6ojErwQLy
         mjTfCIk690Z1rG3pTpyOiMtaEoEpc1MK1S7GIlji10GwNnAJOeBqun2Bij5D7Ys9oSNs
         9F4skP4HpcplbNrLEeBguRXYljODjfZ+4eiVMuCEaYqPCguq+Ner9o22TXfGds8g6VFT
         uTfR3GtHuKS49bHCVOW8ITI1R6S2ipXSJJ5jIsfnmX4LOj9zZo1RgQj0dOdw3H8lfJXO
         l/untvncyP9l8UZtE+fvXt5CNAfCgkX+4diyb0vLLtwIimcASq+RANsqhmjn73PmBSAp
         dh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772054825; x=1772659625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6qd3od5gT9Y56WsM6DlqnASWYdZTTGBmXPSgA7J3iS4=;
        b=APH/7Bv2aTlQxZFpYxBVua24nhmQecHNWaqAWhQz3PjeiQgJcbMgeqKxznhRxg1pJr
         3ojuwcRog3TTNeTaM2C6KP/bRpAlB6KeWTFkgRYeJJLo65WzLYzBO0aTh687Qj2a4htY
         u5VRlZPxqs92Ecj/HViUQD19+wx3MrhDxVjswPuLRJp6W4n6sLu6xqlRczEbBy73V+yb
         GOoXY/eRqN4ch/ssNHiN8NhkHoNgoocQUu9l59YUW8wkmg7z/WY4TPK7hqI7PcIdRZG8
         P41zL90cZ+MQos5q93MI+2EDKZFXX5tEHp1Jt6joGZgIQlfA/jjtNCqajudvl6L2SIiE
         JcjA==
X-Forwarded-Encrypted: i=1; AJvYcCVAHsv59qe4sjmp307qSf4654lVV0nX1BmtZfLVAw9Y2tnf/kL+pUQAk7bRvn+tMuNsJK5lChbwS0Vjz7gTxx0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzFvxvB4ft6E6da26wq3PjmSdxzy3KfCKILlYIt+87yK32nPASJ
	tF1AjEYynU1hOTNToV/tielBi9BLB1vzVKBTF0/wkAuxi+mQKRrhQy4+HHswnanICQo=
X-Gm-Gg: ATEYQzwdXgThVLiPOj57NDC1qX70oz+BWLJK/StwbjQEqUZDZIXJw+eSXYshu9zn4lr
	DXzz1qQ5FG5lPcAE2d9aVhcA4xxqqzqJczhroiIzGgNINUM1OIi3DEljLCkDPTpCaf5sIl4SV6M
	pNL/lWh7nHZspsDQG/A+lCSrte5GhS8NZQ72UNevRgqXTNSUUxlskk9jGa/14t9nMNx4FbRgxjh
	UsGyUw/nmEfAcXV+e1LHRJRHlODkbUkQzWd2r/gJILDqB4Gl5ucHSyJIz9r7zs5vn0h4aJR4xlY
	okpBpUv4fy96owKZ5MhWjEznVAUXu07OCSUyVQEeakralMgLZLkM1UIErlJrGtSF/5sb7b+WCm2
	Cvp26usmqRJhlJjWt6mQyvl/Ynb8/cNQmohQSXoifhCjS8X9h1+89vj5M1Y9Rw2UhycJB0aLhk3
	TQYayunv6RX2UJIHPKYC4mxyJTjtmu73Lz1psGJeVmlEhOb8Ccgb8gZk8ZICmVUH4JwV17X0Q=
X-Received: by 2002:a05:6870:2188:b0:3e8:8e56:671a with SMTP id 586e51a60fabf-4157b210230mr8655778fac.54.1772054824819;
        Wed, 25 Feb 2026 13:27:04 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:146:def2:caeb:cb1f? ([2600:8803:e7e4:500:146:def2:caeb:cb1f])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4160cf2572bsm64198fac.2.2026.02.25.13.27.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 13:27:04 -0800 (PST)
Message-ID: <120c7f33-4ca1-4d35-ac1b-b65362f1adfc@baylibre.com>
Date: Wed, 25 Feb 2026 15:27:01 -0600
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] iio: Rename 'sign' field to `format` in struct
 iio_scan_type
To: Francesco Lavra <flavra@baylibre.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Lucas Stankus <lucas.p.stankus@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Puranjay Mohan <puranjay@kernel.org>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Ramona Gradinariu <ramona.gradinariu@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Petre Rodan <petre.rodan@subdimension.ro>,
 Dan Robertson <dan@dlrobertson.com>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, Jiri Kosina <jikos@kernel.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>,
 Esteban Blanc <eblanc@baylibre.com>, Jorge Marques
 <jorge.marques@analog.com>, Sergiu Cuciurean <sergiu.cuciurean@analog.com>,
 Dragos Bogdan <dragos.bogdan@analog.com>,
 Alisa-Dariana Roman <alisa.roman@analog.com>,
 Trevor Gamblin <tgamblin@baylibre.com>, Renato Lui Geh
 <renatogeh@gmail.com>, Eugen Hristev <eugen.hristev@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andreas Klinger
 <ak@it-klinger.de>, Paul Cercueil <paul@crapouillou.net>,
 Ramona Bolboaca <ramona.bolboaca@analog.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kent Gustavsson <kent@minoris.se>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Matteo Martelli <matteomartelli3@gmail.com>,
 Marius Cristea <marius.cristea@microchip.com>,
 Heiko Stuebner <heiko@sntech.de>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Kurt Borja <kuurtb@gmail.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
 <jpaulo.silvagoncalves@gmail.com>, =?UTF-8?Q?Leonard_G=C3=B6hrs?=
 <l.goehrs@pengutronix.de>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Haibo Chen <haibo.chen@nxp.com>, Salih Erim <salih.erim@amd.com>,
 Conall O'Griofa <conall.ogriofa@amd.com>, Michal Simek
 <michal.simek@amd.com>, Gustavo Silva <gustavograzs@gmail.com>,
 Tomasz Duszynski <tduszyns@gmail.com>, Roan van Dijk <roan@protonic.nl>,
 Jyoti Bhayana <jbhayana@google.com>, Mariel Tinaco
 <Mariel.Tinaco@analog.com>, Nishant Malpani <nish.malpani25@gmail.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Alex Lanzano
 <lanzano.alex@gmail.com>, Jagath Jog J <jagathjog1996@gmail.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Remi Buisson <remi.buisson@tdk.com>, Christian Eggers <ceggers@arri.de>,
 Mudit Sharma <muditsharma.info@gmail.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, =?UTF-8?Q?Ond=C5=99ej_Jir?=
 =?UTF-8?Q?man?= <megi@xff.cz>, Song Qiang <songqiang1304521@gmail.com>,
 Dixit Parmar <dixitparmar19@gmail.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
 linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260225100421.2366864-1-flavra@baylibre.com>
 <20260225101735.2368252-1-flavra@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260225101735.2368252-1-flavra@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/25/26 4:17 AM, Francesco Lavra wrote:
> This field is used to differentiate between signed and unsigned integers.
> A following commit will extend its use to in order to add support for non-
> integer scan elements; therefore, change its name from 'sign' to a more
> generic 'format'.
> 

Maybe Jonathan is OK with doing this all at once, but another alternative
could be to introduce a union to allow both names at the same time, then
we could make the change more gradually.
