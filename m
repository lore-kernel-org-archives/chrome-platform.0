Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.216.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794210021;
	b=P5V/6fs4aWEcb9d5TDUA0FAfn+myc2kzEeXMAqEHNjqc0VYCHXG+oG5tXed526hr2qxi
	 z+xvxQPWIwmmaOjSdc8nDKJEmN4XVvpdm7/xiRnyf7a0nP/543FJYlKeBaeMrMki1mW0Q
	 kRIULBOCOcE7RB3N1ppsFfimRwtn+ofYRTayzblwNIIzXTtF/ZqdzI1fS0gG4Sa9//7GD
	 eXHPdAfFXk55ntq9/KucARC+ptnDWy/FWu2Jvfw/teuXhoha99s63Lh8AWNWn0MuidOtB
	 +RVCWK85Fcmro4MHhCS0PgPCok5UsYvBD6RYXl6f8EKgryvT8elcjZHY8pOv0kHHXOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794210021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
	b=GThXXTfdPctS6t6ka1+yi8FeYkd4SqNhXPIWZz+pIFUOfd4l1sRCT6RbFXEKs5sUTqE7
	 S6GvuorSy/nTv851H7F8YA8UA9O5ZvTCN8bs0+9IRGJIfX6vudhiyTwPpyPAO3ZZzluIW
	 oUu7vBAGNMDeZjQic/ZeCXc1BP5iAESfiUPkBqtRiA3BngoWLU50aSO5MNIiA5b/RH5HO
	 mjNExejRNXbhIqDkhuKyj4FacPL6Evd6HNKAVhqwtAvOVOflC3Gx9635InOTiNGb5Osg0
	 73g7b9oD78p8Dln2GZh9dRq4X2/OBxigpmMdegabrfBBOOliA9TfhLA3hwDLkOG9cVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=moLMZJYa;
	arc=fail smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666C0606A325
	for <chrome-platform@lists.linux.dev>; Mon,  9 Nov 2026 07:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 666C0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=moLMZJYa
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b12cb3c37bso242210a91.2
        for <chrome-platform@lists.linux.dev>; Sun, 08 Nov 2026 23:40:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794210020; cv=none;
        d=google.com; s=arc-20260327;
        b=qdxc+GrqvmHZuxYmgM/3tPdx0Ob3F3KNbiMEHi27ClZQ01MyScUhuWbGRmRaRuqcxM
         JbePc4fyMiSdXu4iMzkaCGd1NHlfbuBBhT6SMKI68ctcIGWjQSnwAW6P+BVO7gdOxk66
         /Ge1qZUD7yOOna+7gtl0jWx3PYUUE73D8IexLflylUxD/jTPpLTR1r3bQLHnd3z0vwI7
         pWVK+TZ5IwpBH+AApK4kSptugYq84KdzgtUNh8Dz526oR6lqJgbyaOWmzcOVKdCLYa37
         dzei/Q4GMZDt4hTE1uiSZtHOulIZp54FpAHJWHTlisbDImbAMLbSUxi4fnU5v6IP4lF8
         OeHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
        fh=UsaZIcDoU+NnPx1Nt5an4X8KrXcgNm3KhFmI66m9p6A=;
        b=SPFMx7B1P+EYiPLRbOfWKni8eJFl7qPRVnevJkPVaPSRnnV5nbov7wJ+Al2DkE+3X6
         K1rlqjGLsusQfVBDHqBoUaEbyHHn8/n8zaXRd0c1aPXslcOH1hrE6cAkDMs2lS1XiW3F
         Dk8qv29i7UtGQNYqAOo304zFG0+2vXmpwKtbfLqe7smp5w3/kUMVizbdDBmsup2KAscL
         tKKCPLvKxedpGJ/4M8NSeNh7KGE24eNyuWz95cu1RZeEC78+89ttl9oR/X7GUZbjs8gb
         2cPWmZQMtV59a+F4LnNdxomOAmW7coysv3eo1ZVMALJQPDRmLxkCe4L+Wty/fgsjEfbR
         LHzQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794210020; x=1794814820; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
        b=moLMZJYatz9T+7XUTnn117JVrQGiNU2XzHCLKLoGltw3BQHMiSekbDsHI4RFRAlBEm
         mAYZ3QP1b7Z+JHge8gs3oxVCUloGoox3ez+b/xOD6XnSs1gjDDeqXlqU+y9D67EpLyb5
         ufbd13tvUtCwQhL5CwgVwtKuMrCBjqAVrZuxSDZZatN7YvmQd2BCVSOXkjTuLnU8FLoq
         K4p7gDl4dQTVQFA52Es3b9AISXDFIZekAHLyRAFeg9LeiXuwKr1pWV8L1wHqpFdccv1z
         u4ctAMqIMeNG6ctgrCbFlISFqLvCgHU8VY4sB1fPdb4EO9PR7OJhYPe7zq534DZSaC82
         aSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794210020; x=1794814820;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
        b=NxTwnpbkVPcYJtWCdwaAP3pbd9Qg2mDvVfX7E8NlmWCc89OJZb/vduJck9qDZmUr8i
         5C6ovc+ROLfP3BSNv2E1HvLDRM81S1/hqs2QTRuUfpYpLqcBgb2iaCea3zhCssI5elwT
         gqOdtbJg+OKBdGWu4hIHGpgkLstDIUTGJKZ6sH/04lpJg1F1lg7dw5RaPU3C+76Gtt5H
         DCKdwrWuvvmwQZ8OAbtbyzi1P6CwB+PDc6JixXF6JR38nkzzaPluhF9RDuPpc7ZdiQ9u
         PTiXzQd09Kzekd7HmM/Mq5ksj9bm2l1ORqfeygHy+USXvRB+hjsju88ZfALofmZ9IHcY
         RBNA==
X-Forwarded-Encrypted: i=1; AL+hErHGNPRKXRG3RzNHOrxk3HfNd8RwdSxP9u3Fs/kFAjV77bAhU9h+p/0qXrG/fCATy4OS6ks79fsrwlyseCtnwnk=@lists.linux.dev
X-Gm-Message-State: APuU4Z/KAQjBo71I82v9UZ1eGBhvLJN+xhwakbTwBpI1OKQaPZG+Hi1o
	dk20yMqnhFfCUFTcuWJc5AuLflelR3hAVYEVJiCTavB8iG+G4qeDvRd7c2Qid+2+qpuPCVGeC1f
	phiQfOFfb4BLfV+U6RZza6EcF+02WsH4=
X-Gm-Gg: AYBFou0GeEKMzqo36ssuV6BUVwm6die9GwblJKh1oh4dZjWUq+yE77Ijbdz2HRW3x07
	BoPiFVve8uMPCOgI5WZItYavqaASxDCNgDIz9D+QUG0D6jAJK8oKG6lQfpoTOkaBWAikpw54/uX
	WNHuEpXiRd+LImOqFQyzfP71odJY/YhfxIJzliE0rMLSM+r0nItDOLC/oPayPuBGF+InlyIlucs
	+3eR9CYHoMLp0C9MtNGzJmdPxp9tyB9BJ0ARr6fI8sYtypgkpuwV48kH9WyBqc2jmaOuBWXCeTW
	lKGlzeEiAivhodOpJtgpfQSrVHxuLqNQGbyt4LFJMxjK9C376WWw4XHtL3/yyVS/4rp0a6123ne
	sokSuBNsdnEXOtx3yyJncZ0J7A2jMfqIuUaM=
X-Received: by 2002:a17:90b:384c:b0:3ad:a270:a623 with SMTP id
 98e67ed59e1d1-3b12d107e44mr3364118a91.4.1794210019701; Sun, 08 Nov 2026
 23:40:19 -0800 (PST)
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261102135330.2493332-1-robh@kernel.org> <CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
In-Reply-To: <CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Mon, 9 Nov 2026 15:39:42 +0800
X-Gm-Features: AclHuK_dnPMk52UN3-2_wspDGRy5a6s-cwmnh8paY6ZY-G54Qz5KZ0bygsAWCVc
Message-ID: <CAAfSe-shr1+0YpxEvf+4k+DyGe3==PUiD72CwjE+RC4gX-ShiQ@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable

On Thu, 5 Nov 2026 at 10:39, Chunyan Zhang
<chunyan.zhang@linux.spacemit.com> wrote:
>
> On Mon, 2 Nov 2026 at 21:53, Rob Herring (Arm) <robh@kernel.org> wrote:
> >
> > Unit-addresses by default (and most commonly) are hexadecimal. There's =
a
> > number of cases using decimal patterns. Fix all of them, limiting the
> > pattern to match the 'reg' limits if there are any.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
>
> [snip]
>
> > diff --git a/Documentation/devicetree/bindings/thermal/sprd-thermal.yam=
l b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> > index afa551f6185f..222d70baef1e 100644
> > --- a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> > +++ b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> > @@ -47,7 +47,7 @@ properties:
> >      const: 0
> >
> >  patternProperties:
> > -  "^([a-z]*-)?sensor(-section)?@[0-9]+$":
> > +  "^([a-z]*-)?sensor(-section)?@[0-9a-f]+$":
>
> Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>

Following up on Andy's note about this:

Please disregard my Reviewed-by. Even though I did look at some of
the other hunks, given that I'm not familiar with the other hardware,
I don't feel comfortable giving a whole-patch Reviewed-by out of
caution. And since I'm no longer the SPRD maintainer, an Acked-by
wouldn't be appropriate either. So withdrawing is the best option =E2=80=94
sorry for the inconvenience.

Thanks,
Chunyan
