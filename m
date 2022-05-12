Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED483FF5
	for <chrome-platform@lists.linux.dev>; Thu, 12 May 2022 23:45:00 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id z2so13163428ejj.3
        for <chrome-platform@lists.linux.dev>; Thu, 12 May 2022 16:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6tUe0F63ZYrn0Y1fh/u+GXJuGNWxIjIBVNzjlEOaooc=;
        b=UcB1On1JxLd4Xr6oYtsXWZupWxYqMCZH1DBzRfH5Xtc4P7FFr1vR6KaXACJwSe1f/g
         KvqeAf29DU3OTlhjJ5j9Hh/gjB7I2d4tZVR10BKtMkVIaQP0pXjgWy/sN2EtFKps8mL6
         Y+T5mwgLwBToRztodmGegISZ3vYDIqtuHQ3is=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6tUe0F63ZYrn0Y1fh/u+GXJuGNWxIjIBVNzjlEOaooc=;
        b=gNC6lFaLaaiHa7XpdZX40yb2jog3bfSGbXX780s63nGno0GBZsYwTQ6VzhjWARfMi+
         mfYsySY7a71P+rIDh6HQdpGsF1rpl/3bshEDTUDNMYW6VhWvwsGcgrGaQirxo53be0ok
         HMY8kGeV+wM1SMB75sJMY5nOSP4BMT538O4HLAv4hpMtb7Sd6h6TCei6lufCf1JNV2Nq
         z30oesAi3VPqQusUMwRPBtReZN9+kwf/wLbEzteZ/Jwjn7N9wYKlzOn/w0nZnsJdRZxG
         XqxZjDwkQ3D6iy0azW+GEj9R8zr6KqOOdOq0ZdPCAqKtHorQ6dTka6YHBWBeKA4sj7Pk
         WD0Q==
X-Gm-Message-State: AOAM53212LflUPv4hf7fncbHHRuthIS8+U/Cfqo+r2UK2POifKTJ1hiv
	L8XV4wwDZG52eE4bd4Sy0qn6MW24SovvFamy9QU=
X-Google-Smtp-Source: ABdhPJz9dMVRmnKauxUdGW7sHVdb2Mg8NY7acJhzzZGS+Oua7CqeTmrClPzgHNw00jdcqnONIy11Wg==
X-Received: by 2002:a17:906:dc93:b0:6f4:6a27:41ed with SMTP id cs19-20020a170906dc9300b006f46a2741edmr1987182ejc.36.1652399099166;
        Thu, 12 May 2022 16:44:59 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id b18-20020a056402279200b0042617ba63b1sm205640ede.59.2022.05.12.16.44.56
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 May 2022 16:44:57 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id c190-20020a1c35c7000000b0038e37907b5bso6050498wma.0
        for <chrome-platform@lists.linux.dev>; Thu, 12 May 2022 16:44:56 -0700 (PDT)
X-Received: by 2002:a7b:c4c8:0:b0:394:26c5:b79e with SMTP id
 g8-20020a7bc4c8000000b0039426c5b79emr1988820wmk.15.1652399096143; Thu, 12 May
 2022 16:44:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220512013921.164637-1-swboyd@chromium.org> <20220512013921.164637-3-swboyd@chromium.org>
In-Reply-To: <20220512013921.164637-3-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 May 2022 16:44:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XfmU1GhXZPvUMoh9dqs8iei6s+0gu6Mve-aQ33A+7m3g@mail.gmail.com>
Message-ID: <CAD=FV=XfmU1GhXZPvUMoh9dqs8iei6s+0gu6Mve-aQ33A+7m3g@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] dt-bindings: cros-ec: Reorganize property availability
To: Stephen Boyd <swboyd@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	patches@lists.linux.dev, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, chrome-platform@lists.linux.dev, 
	Guenter Roeck <groeck@chromium.org>, Craig Hesling <hesling@chromium.org>, 
	Tom Hughes <tomhughes@chromium.org>, Alexandru M Stan <amstan@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
	Benson Leung <bleung@chromium.org>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, May 11, 2022 at 6:39 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Various properties in the cros-ec binding only apply to different
> compatible strings. For example, the interrupts and reg property are
> required for all cros-ec devices except for the rpmsg version. Add some
> conditions to update the availability of properties so that they can't
> be used with compatibles that don't support them.
>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: <devicetree@vger.kernel.org>
> Cc: <chrome-platform@lists.linux.dev>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Craig Hesling <hesling@chromium.org>
> Cc: Tom Hughes <tomhughes@chromium.org>
> Cc: Alexandru M Stan <amstan@chromium.org>
> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  .../bindings/mfd/google,cros-ec.yaml          | 39 +++++++++++++------
>  1 file changed, 27 insertions(+), 12 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> index 99eda9ab0651..409ecef967ce 100644
> --- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> +++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> @@ -148,18 +148,33 @@ patternProperties:
>  required:
>    - compatible
>
> -if:
> -  properties:
> -    compatible:
> -      contains:
> -        enum:
> -          - google,cros-ec-i2c
> -          - google,cros-ec-rpmsg
> -then:
> -  properties:
> -    google,cros-ec-spi-pre-delay: false
> -    google,cros-ec-spi-msg-delay: false
> -    spi-max-frequency: false
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          not:
> +            contains:
> +              const: google,cros-ec-spi
> +    then:
> +      properties:
> +        controller-data: false
> +        google,cros-ec-spi-pre-delay: false
> +        google,cros-ec-spi-msg-delay: false
> +        spi-max-frequency: false
> +
> +  - if:
> +      properties:
> +        compatible:
> +          not:
> +            contains:
> +              const: google,cros-ec-rpmsg
> +    then:
> +      properties:
> +        mediatek,rpmsg-name: false
> +
> +      required:
> +        - reg
> +        - interrupts

Is it worth having an "else" clause here? to explicitly make
"mediatek,rpmsg-name" required for mediatek?

In any case, this seems right from my (albeit) limited yaml knowledge
and seems like an improvement.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
