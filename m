Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F042570
	for <chrome-platform@lists.linux.dev>; Thu,  7 Apr 2022 16:49:11 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id n19-20020a9d7113000000b005cd9cff76c3so4302699otj.1
        for <chrome-platform@lists.linux.dev>; Thu, 07 Apr 2022 09:49:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=W9Hs+gnhjn+YVFkRSWJCDbSOkGyWB/bGPp9Wsa3Ssvo=;
        b=w6i0AccUtkcf86ToVRc7LbWfV/VcwwjhzspKkdpFN11hJdYsyHpWRsvED/I8868/kh
         CIbUpp0FhD33y+AD4/GYmx3l4pB4METmkhnH3DBePGdmXMTCbKK52mdK5pE74LOUegrn
         oAchNVXypybYVMWQIJ129L3ZNHnjOcau9+nUgefPa/CSwFQB+MAn4835toTdARy4eJ8F
         Lwb0FvYCBCxUcF8W4l0Lx2T+tsX+LRNc1LoBPK8lB/fwELAZ4aTZdcHfA5zHWq8o8nPw
         ixRVf42KnVT0VhbUm3dtyRt0R+UOf5c0Ef8bTON/NH9VcBsxbW++lIyVEzuEoqddOrJJ
         t/VA==
X-Gm-Message-State: AOAM532zBj/+o/GUEjfRzjYLadCDgJ1B31lPQj0u33tsjXdUWLQ7YZUv
	f2cH/lUshY9xf+6nRIxtHg==
X-Google-Smtp-Source: ABdhPJwtMm69VAvbQPAQ41G9xgsuOi4yyFdqa/5hxgMvXOSvRMkU3dG5e/0MEKC0tS0NXw25Es2XZw==
X-Received: by 2002:a9d:20e2:0:b0:5c9:2edb:af8e with SMTP id x89-20020a9d20e2000000b005c92edbaf8emr5228736ota.325.1649350150961;
        Thu, 07 Apr 2022 09:49:10 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q11-20020a05683033cb00b005e686fd52d6sm4950701ott.17.2022.04.07.09.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 09:49:10 -0700 (PDT)
Received: (nullmailer pid 1386536 invoked by uid 1000);
	Thu, 07 Apr 2022 16:49:09 -0000
Date: Thu, 7 Apr 2022 11:49:09 -0500
From: Rob Herring <robh@kernel.org>
To: Fabio Baltieri <fabiobaltieri@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Thierry Reding <thierry.reding@gmail.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>, chrome-platform@lists.linux.dev, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: update google,cros-ec-pwm
 documentation
Message-ID: <Yk8WBXBH53rtZsBF@robh.at.kernel.org>
References: <20220331125818.3776912-1-fabiobaltieri@chromium.org>
 <20220331125818.3776912-4-fabiobaltieri@chromium.org>
 <Yk20uTE/Vdm2c6jI@robh.at.kernel.org>
 <Yk73f9yyxy5LBC+V@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yk73f9yyxy5LBC+V@google.com>

On Thu, Apr 07, 2022 at 02:38:55PM +0000, Fabio Baltieri wrote:
> Hi Rob,
> 
> On Wed, Apr 06, 2022 at 10:41:45AM -0500, Rob Herring wrote:
> > On Thu, Mar 31, 2022 at 12:58:17PM +0000, Fabio Baltieri wrote:
> > > Update google,cros-ec-pwm node documentation to mention the
> > > google,use_pwm_type property.
> > > 
> > > Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> > > ---
> > >  .../devicetree/bindings/pwm/google,cros-ec-pwm.yaml         | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml b/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
> > > index 4cfbffd8414a..9c895c990ed8 100644
> > > --- a/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
> > > +++ b/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
> > > @@ -19,6 +19,12 @@ description: |
> > >  properties:
> > >    compatible:
> > >      const: google,cros-ec-pwm
> > > +
> > > +  google,use-pwm-type:
> > > +    description:
> > > +      Use PWM types (CROS_EC_PWM_DT_<...>) instead of generic channels.
> > > +    type: boolean
> > 
> > Either do a new compatible string if the cell interpretation is mutually 
> > exclusive (channel number vs. type) or split the number space for the 
> > 1st cell between type and channel number. IOW, set a bit (31?) to 
> > signify the number is a type, not a channel.
> 
> Split the number space was my first (tentative) implementation as well,
> but it turns out that the PWM subsystem really wants channels to be
> zero-based[1], so I don't think flags or bitmasks are really an option.

Fix the PWM subsystem then...

> New compatible sounds good though, I'll rework a v3 with that change.
> 
> Thanks!
> Fabio
> 
> [1] https://elixir.bootlin.com/linux/v5.17/source/drivers/pwm/core.c#L423
> 
> -- 
> Fabio Baltieri
