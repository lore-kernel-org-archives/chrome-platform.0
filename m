Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732348;
	b=lnYKub4at3xDWs9+s6TNNBjIjuOZHtYz0W/d6dr7z0QKPm6GMf38LDZ0Ks7vqHZP7Fgd
	 EfbP6AGsr2Ec6I+Bs3CvwnZu36r5j47ZDbKSwoGsXL6DRj7vghFtA/ysfl/PY50LLwtBs
	 qijeWEpF7JQFLE9qxsUbWuavUuZ+QvOviMVBWcg08LZi//x2dvyfI2RPW8YU1CHO/0TbJ
	 jNt9R9WFFRNPAuMT+g+dI39GDHcpukgU245GRKSzqIWBfaqNPgIdF7lJ3SM7TQO3i3VYD
	 FuoTV/omQe6oa7zuAWCIKd59imfJ8n7FyYpMs4jBHJGbbeL9Y2nniMoIT5QNjT0YUWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=J7X+N3b/Iozr8Iw7Q9vLqcq+wqZH/CWnHiKVeMbKEmo=;
	b=SN9b5nO+BLIWTheyMpwgQAl4bTDbXSZM79s1eC69Fu062y5WzfC9/2tl1Y6SyfgCggtK
	 Pcerh94F2nC5ChOTdIvdxb3IIFZ4pRTwRBnKraYvAyGAKwcpyRbR6jkUhtQpBlhisDr+S
	 uXH7JgADh99NDmLz0Wd2Yd1jTxCl5XoH3sEWSixi8iUpZABR+uqfDQg1ReoF3H2D6qeKJ
	 1QxpNU77sMUTKa9TUvUk4D2JCHqcyYGJYupLjRavFXzJeSvgFpTbc8Kj7gokmxUnbq6wP
	 XNW5coe0k3bCCq23OWPg13c0X+QlixfmKV5jii8Tok9kFuIUorSgNYfnmUz0DwaQUzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YXYDOqR3;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBF7606A324
	for <chrome-platform@lists.linux.dev>; Tue,  3 Nov 2026 18:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FBF7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YXYDOqR3
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso7522357eec.0
        for <chrome-platform@lists.linux.dev>; Tue, 03 Nov 2026 10:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793732347; x=1794337147; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J7X+N3b/Iozr8Iw7Q9vLqcq+wqZH/CWnHiKVeMbKEmo=;
        b=YXYDOqR3YTdWjVjMiPqhMmCqYc/01K0PVfuT0MGChqZe9l7AweO69fkSNMx/9KMTE3
         KDn90CTQ8H/P3GB0Nw8wvWWu18E1L1kbeanSnVSOjen1TLCZGEfpt/8cCBR6DfejvXKD
         y6syQk1Le3oFzhMwsJwPM5RHAosnmsomfnPRXyCKE06jn2LBpK++90DvFyqZLROXzyJI
         FDBGusogPlLdXGGYNa0wxHPIenvxGmSJMLkQEV/Lf3Dlnp/Cg1MrDkjgdnVNYTf8f62N
         OHWgJgqg2+c98A67ynn60QZve8Fwy9qy94fJMCSqRQTKf1aee9h77hegeiwBGwaIhAJb
         Fnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793732347; x=1794337147;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J7X+N3b/Iozr8Iw7Q9vLqcq+wqZH/CWnHiKVeMbKEmo=;
        b=axLK1YoVzHs2+hKjdeucN8Lryfo2+A/FoO6CUYqJ/5rxXjPJZ41d3jW+wJdIOVdWXc
         ukO6eGvxl4jnEiRuMf6lUMlQMIOaxhVh9JjpBJcAUakdZhbbhmU5e7TqAWZRRrZUjjX7
         CTZ4srhxT8oUnvDV8oKPwMdJPuZSEjwRFivXsKIKpoMyVN1NIACmYlydzAzR8Hg+xpw9
         NPtbGV94vlDaWJWZwbz/tXSth5NMnITbe01ii1/isI0x4c+qKn5aWbxu0A73J43fMD/F
         WTFcDYO6J1g0Yqt426OHAB+6wshMaweeqb9ZADyk7GBkD6rA7mRbOqPP4wrdcHxFyRJW
         wo4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwLeGRHmJEuhInTf8H9ubznjiJkCz5KKn2eWdozi4F4cQ/Td79YC7FIOQ3YDoc6WUrEUUe3xF5E6Ua8xLOLr8E=@lists.linux.dev
X-Gm-Message-State: APuU4Z+TWQo+p7cqUspVTnsDJOOFyPac2aqy4uyxc4fwJMxY3LbeBOrb
	2UtUVIqKVQ5jB9dEeutAF6NHleHV0iE99sCrd1YLWCpL3DGGnVnM+PDq
X-Gm-Gg: AYBFou1H3gIDVL+XC24KQuwkRAQxBOBlwhbAqLLUdcfMhmmDg9CsH7W9vDiVhMDeY1H
	SPfbQAA97vIMSswogpUjjqHZm68ym1DlBwx613/m7FT0COrT/Rv9TdVgMpd7hXR7HSrgfrQ7j4K
	My8PN82jz+mRQft4Qxxr9mZDbDKBsRSS27jZe+nQKoBVif/kCe8EDM7fyDeKhNHc5qWnyRNsKne
	IlBG12b2uWd6XeY+QOX2M+0vSAVAepQASvSNOP76aL65aS24DyeB/VnRgEbonQNPBcGDlhYHvNb
	s/cpsHdM+H6Ou5VSGeHWazdb0HWOQfhvpNEqVkdCyEjNnrIwb3iJ0EnfL13Wu7QHjOC6dW3j+NE
	vDLd4tRdm4zrNYRof7e6dsVTSNR2KOIF2p1bkvnd8bjRHAHgBREO2CweVcX3b4x0YMuL7hW8CRa
	JimXAQsUN9DlVedxo3BzJ94EZoyezkokVltGaaFBnqn3O/1F0ybvG7Y8nUMHCBc5DXSMR/sTYb2
	H7S/BdzWQoAmTZ6wUusbecNYlbynLDFK2DV2yz2Xx7FjHOyC4xEX/9ynEPb1TH+mZQc7rsf6BJz
	5NsRQ6XctjM8SxYoCoOT7AGA8Ao9bl6TohKHV7gSpReaZ1rvUbPmtTzGEOY+tIy+x5R/
X-Received: by 2002:a05:7300:7b81:b0:351:7ec1:a92c with SMTP id 5a478bee46e88-36a42431768mr30787340eec.28.1793732346941;
        Tue, 03 Nov 2026 10:59:06 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:88b4:22ec:d621:c1b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b3b7esm49159eec.28.2026.11.03.10.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:59:06 -0800 (PST)
Date: Tue, 3 Nov 2026 10:58:59 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, 
	Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Lee Jones <lee@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Shawn Guo <shawnguo@kernel.org>, 
	Chanh Nguyen <chanh@os.amperecomputing.com>, Alistair Francis <alistair@alistair23.me>, 
	Julius Werner <jwerner@chromium.org>, Paul Cercueil <paul@crapouillou.net>, 
	Dmitry Osipenko <digetx@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Ray Jui <ray.jui@broadcom.com>, 
	Scott Branden <scott.branden@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, chrome-platform@lists.linux.dev, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sound@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-tegra@vger.kernel.org, mfd@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-phy@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Use hex unit address patterns
Message-ID: <auou2CBiiR6zA0G0@google.com>
References: <20261102135330.2493332-1-robh@kernel.org>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102135330.2493332-1-robh@kernel.org>

On Mon, Nov 02, 2026 at 07:53:22AM -0600, Rob Herring (Arm) wrote:
> Unit-addresses by default (and most commonly) are hexadecimal. There's a
> number of cases using decimal patterns. Fix all of them, limiting the
> pattern to match the 'reg' limits if there are any.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/display/xylon,logicvc-display.yaml      |  2 +-
>  .../devicetree/bindings/dpll/dpll-device.yaml        |  2 +-
>  .../bindings/embedded-controller/google,cros-ec.yaml |  4 ++--
>  .../intel,ixp4xx-network-processing-engine.yaml      |  2 +-
>  Documentation/devicetree/bindings/gpio/gpio-mxs.yaml |  4 ++--
>  .../devicetree/bindings/hwmon/maxim,max31790.yaml    |  2 +-
>  .../devicetree/bindings/iio/adc/st,stm32-adc.yaml    |  2 +-
>  .../bindings/iio/adc/st,stm32-dfsdm-adc.yaml         |  6 +++---
>  .../bindings/input/touchscreen/cypress,tt21000.yaml  |  2 +-

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com> # for input

Thanks.

-- 
Dmitry
