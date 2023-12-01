Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4088C59537
	for <chrome-platform@lists.linux.dev>; Fri,  1 Dec 2023 04:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ddJs38uT"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50abb83866bso2478370e87.3
        for <chrome-platform@lists.linux.dev>; Thu, 30 Nov 2023 20:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701405465; x=1702010265; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+jcpVk/CzMrLl1xGP/BznaGgT2T4KFEs7BkhiB0I8U=;
        b=ddJs38uTkyQyI06buhYZJuyL338N5DOKNKW/uyO+ZdYTFgh7N5rcsdaZszP5I13N8U
         CjsncaXZWh0YURZ1ZBoMz5eDKjXQYh2aTzPJTxJ9pWhsvm+q+P4gxZEVbBoyYlGPjik6
         bvzPf4AQoAVFA57g6z8yCG0gJ5BV/aNQCtJH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701405465; x=1702010265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+jcpVk/CzMrLl1xGP/BznaGgT2T4KFEs7BkhiB0I8U=;
        b=XMHv6AvLqxpY76ogfeex454FfUlxP6bsYz6ZGyV6OofHYJInMCmvj9umPs5uGsj3nY
         b55QE9uTKYqwaYIAkcOjOgDPag92AVVvD4e8wVzvGtFnPZ8MBFrDv9gzmM1CRdkwki75
         QrEgpAO842KD1RJlmUN8rpQc50UsSFrTI1zt3fLl0ffY/C9UQ+us6bUfoFCgskfqmevW
         ip4MXpm4skSGKQkNUHzvRcAfM4/JK5yEC8hbcvoe5LiMDKzvn4TKl7kqIvbdq7l3vGab
         EjRsDk1NWfxOv0gpe1KtMJ+PM38Dk3nlAxgkyIZnF6dInuVlB6CS0RPbEhnw+K6K2Lhr
         VT5A==
X-Gm-Message-State: AOJu0Yxdv1bi4QSnjdSf2YyzcVZws5VRVD7njVzmkcLtwxYwD//YgxIg
	0k9uTwz+FyY6lyv5Ce7y13uQCA/veKGQWTwPuZv/2g==
X-Google-Smtp-Source: AGHT+IHjtP70U0cou0Khp4frD8Bd9W2gzREg9o3JzohtHlJxZwZqTL81+2+AdCVmMC8QPCRHBgSKZ2QKlPiqh2l+Yf4=
X-Received: by 2002:ac2:46db:0:b0:50b:c2ed:e28a with SMTP id
 p27-20020ac246db000000b0050bc2ede28amr232773lfo.13.1701405465218; Thu, 30 Nov
 2023 20:37:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231130083333.932862-1-wenst@chromium.org> <2288442b-9002-4711-9b64-16b204f19985@linaro.org>
In-Reply-To: <2288442b-9002-4711-9b64-16b204f19985@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 1 Dec 2023 12:37:34 +0800
Message-ID: <CAGXv+5HwzSX=x_0u-95i1+q+xbstrCmuMxRoKXJwEL5ErnRgOQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mfd: cros-ec: Allow interrupts-extended property
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 4:52=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 30/11/2023 09:33, Chen-Yu Tsai wrote:
> > "interrupts-extended" provides a more concise way of describing externa=
l
> > GPIO interrupts.
> >
> > Allow using this instead of "interrupts" plus "interrupt-parent" for
> > cros-ec.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  .../devicetree/bindings/mfd/google,cros-ec.yaml          | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml =
b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> > index e1ca4f297c6d..e514eac9f4fc 100644
> > --- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> > @@ -75,6 +75,9 @@ properties:
> >    interrupts:
> >      maxItems: 1
> >
> > +  interrupts-extended:
> > +    maxItems: 1
> > +
>
> I don't understand why you need it. You already have interrupts there,
> so this is redundant. I suggest to drop the patch or provide real
> rationale (which I doubt you can get :) ).

I'm sorry, I should've included this in the commit message.

The other half of the patch gets rid of a DT validation fail when
interrupts-extended is used instead of interrupts:

.../arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: ec@0:
'interrupts' is a required property
    from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#


maxItems for interrupts-extended was included for completeness. Maybe it
isn't needed? But then how would the validator know how many items should
there be when interrupts-extended is used


Regards
ChenYu
