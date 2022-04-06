Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B677333E0
	for <chrome-platform@lists.linux.dev>; Wed,  6 Apr 2022 15:41:47 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id v75so2804378oie.1
        for <chrome-platform@lists.linux.dev>; Wed, 06 Apr 2022 08:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CSjXS3liiZsQ5y+dsNvQXrAg4KGiXpv7ZiLu0UE4ATo=;
        b=AKMFWP7s6MQDT38Uzgw6kVRK82l8+dTvuA5sXE0lQ3zSUmTOpL5B0KgFIUCFmTaFpt
         B3wE3f7sikalLax8AgO7QK4Z0wtI1KrIOzHlnlzEvills6r3PtUAaIMk5nUyxPQyCUVg
         vUN1zBxS7aTqvs4Gx+5SE1e1xg+PCYAd8dEZfYQGLW6tB2e72Y1HbOGhGNS5cX9HsFQu
         IM4KRY7rD80Y6x2t9gP5/NvTHQcaIrwR8njX4WFz/miu/8RRJlsnaScpjxW0yEeNzRzM
         V/mW4sK/3c+2Hww1egRMfn/dflXSyvWJrt71j7YD6NyRnI7pgQkfc/wcmG2wKng92T6H
         WB4A==
X-Gm-Message-State: AOAM531baQuRg1b1UJIwRr5Nv5v2W5ubvL+RjTrmTHFprR0kRzSDidyt
	hW0KFvWOounXobx7LTpixw==
X-Google-Smtp-Source: ABdhPJxbIZn0sFuEhJ20HhaeEdyTBrFvADnchwCiV0ko8mITBghdswBGY+ASd5Yd9f7doax3tDWvbg==
X-Received: by 2002:a05:6808:144a:b0:2ef:9fa2:ba7f with SMTP id x10-20020a056808144a00b002ef9fa2ba7fmr3693043oiv.88.1649259706857;
        Wed, 06 Apr 2022 08:41:46 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v13-20020a4ae6cd000000b00328882a2388sm6181366oot.14.2022.04.06.08.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 08:41:46 -0700 (PDT)
Received: (nullmailer pid 2298416 invoked by uid 1000);
	Wed, 06 Apr 2022 15:41:45 -0000
Date: Wed, 6 Apr 2022 10:41:45 -0500
From: Rob Herring <robh@kernel.org>
To: Fabio Baltieri <fabiobaltieri@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Thierry Reding <thierry.reding@gmail.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>, chrome-platform@lists.linux.dev, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: update google,cros-ec-pwm
 documentation
Message-ID: <Yk20uTE/Vdm2c6jI@robh.at.kernel.org>
References: <20220331125818.3776912-1-fabiobaltieri@chromium.org>
 <20220331125818.3776912-4-fabiobaltieri@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220331125818.3776912-4-fabiobaltieri@chromium.org>

On Thu, Mar 31, 2022 at 12:58:17PM +0000, Fabio Baltieri wrote:
> Update google,cros-ec-pwm node documentation to mention the
> google,use_pwm_type property.
> 
> Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> ---
>  .../devicetree/bindings/pwm/google,cros-ec-pwm.yaml         | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml b/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
> index 4cfbffd8414a..9c895c990ed8 100644
> --- a/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
> +++ b/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
> @@ -19,6 +19,12 @@ description: |
>  properties:
>    compatible:
>      const: google,cros-ec-pwm
> +
> +  google,use-pwm-type:
> +    description:
> +      Use PWM types (CROS_EC_PWM_DT_<...>) instead of generic channels.
> +    type: boolean

Either do a new compatible string if the cell interpretation is mutually 
exclusive (channel number vs. type) or split the number space for the 
1st cell between type and channel number. IOW, set a bit (31?) to 
signify the number is a type, not a channel.

Rob
