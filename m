Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829767A
	for <chrome-platform@lists.linux.dev>; Wed, 23 Feb 2022 22:57:08 +0000 (UTC)
Received: from [185.156.123.69] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1nN0ZC-0005UO-OL; Wed, 23 Feb 2022 23:57:02 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Lee Jones <lee.jones@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Thierry Reding <thierry.reding@gmail.com>, Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: pwm: google,cros-ec: include generic pwm schema
Date: Wed, 23 Feb 2022 23:57:00 +0100
Message-ID: <3248917.W5uN0jUHDo@phil>
In-Reply-To: <YhX7UZSDaqNyD1rV@google.com>
References: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com> <20220214081916.162014-2-krzysztof.kozlowski@canonical.com> <YhX7UZSDaqNyD1rV@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Lee,

Am Mittwoch, 23. Februar 2022, 10:16:01 CET schrieb Lee Jones:
> On Mon, 14 Feb 2022, Krzysztof Kozlowski wrote:
> 
> > Include generic pwm.yaml schema, which enforces PWM node naming.  Keep
> > the old name in bindings as deprecated.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > ---
> >  Documentation/devicetree/bindings/mfd/google,cros-ec.yaml    | 4 ++++
> 
> Acked-by: Lee Jones <lee.jones@linaro.org>

what is your expectation regarding this patch?

Are you planning to merge it or are you expecting this to go through
some other tree?

The binding-change here is backward-comaptible in that the old
node-name is still in it, only marked as deprecated, so in theory
this patch should be able to be applied on its own without
causing defects.


Heiko

> 
> >  .../devicetree/bindings/pwm/google,cros-ec-pwm.yaml          | 5 ++++-
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> 




