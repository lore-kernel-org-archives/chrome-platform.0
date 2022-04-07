Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9552564
	for <chrome-platform@lists.linux.dev>; Thu,  7 Apr 2022 19:36:49 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id n126-20020a1c2784000000b0038e8af3e788so2779026wmn.1
        for <chrome-platform@lists.linux.dev>; Thu, 07 Apr 2022 12:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qGHTBjiRtcoK9jZMs6uWmY+rq4X7h4rZUWallI+80rk=;
        b=ifLyrYtbKBJqpkzTY9qg722l/SIY+VrF14Uxn3pnIpElJGUIv5AXoPuWrtdw6E8UQO
         CWOo2cASB1LfSwFNARjJIYE/ZP/Tr2/b77q93Mqx+gLd9X6ddLDdE+9VXIl6GrO+egpH
         ZI/lRyEWI72uyYV21ynMw29jpOpY3Xd3iI5Tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qGHTBjiRtcoK9jZMs6uWmY+rq4X7h4rZUWallI+80rk=;
        b=1TqQjF4zMlxmz/eMpQAX8jujuleoi5E1SDW6pC3jFbXGqlgoK+rMzUPtx4nodiskw0
         TTTgAzQaiAE78DxnkUa7Jte2BH6WD29Sv1Dtis5u/Ft8Y5R7fN29QboxdNwLyYjwoaNP
         eRMUuQ3t9YZD30aICsfd+cPXZj/VnxfjRL7eY/Ops1dUB5h9umS3DNkqrrfzlrNfORJV
         e6YE1VdcgB9soqgZmGuRY6FSzMAppFlQNOjlCyZS1SF/mi20e1Aj31qXwfd8iQ8IkcE7
         o4naLbquQNQcPBXWJlfLKjsOzaLHghhzVQRYABRSGRj5OzH9Wn8FBwcg34sehTUYlXmS
         77jg==
X-Gm-Message-State: AOAM533b2HAVnTdQwRWYojs7D67Mly2avF305mOLn1/RunpxPMXVfyFq
	0wtxnTb3oTysid7loUoj24vGTA==
X-Google-Smtp-Source: ABdhPJx+12wcWZOcbrmvKuK8j5I5I1mjLJ9VSCFlv+v6bztKlefCbIiyzsVdaTWgA7j8hqSlure3UQ==
X-Received: by 2002:a05:600c:190e:b0:38c:b19d:59ff with SMTP id j14-20020a05600c190e00b0038cb19d59ffmr13592765wmq.1.1649360207781;
        Thu, 07 Apr 2022 12:36:47 -0700 (PDT)
Received: from google.com ([37.228.205.1])
        by smtp.gmail.com with ESMTPSA id j17-20020a05600c1c1100b0038e389ab62esm14469296wms.9.2022.04.07.12.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 12:36:47 -0700 (PDT)
Date: Thu, 7 Apr 2022 19:36:45 +0000
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Rob Herring <robh@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Lee Jones <lee.jones@linaro.org>, chrome-platform@lists.linux.dev,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: update google,cros-ec-pwm
 documentation
Message-ID: <Yk89TRQRpL1DIioa@google.com>
References: <20220331125818.3776912-1-fabiobaltieri@chromium.org>
 <20220331125818.3776912-4-fabiobaltieri@chromium.org>
 <Yk20uTE/Vdm2c6jI@robh.at.kernel.org>
 <Yk73f9yyxy5LBC+V@google.com>
 <Yk8WBXBH53rtZsBF@robh.at.kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yk8WBXBH53rtZsBF@robh.at.kernel.org>

On Thu, Apr 07, 2022 at 11:49:09AM -0500, Rob Herring wrote:
> On Thu, Apr 07, 2022 at 02:38:55PM +0000, Fabio Baltieri wrote:
> > Hi Rob,
> > 
> > On Wed, Apr 06, 2022 at 10:41:45AM -0500, Rob Herring wrote:
> > > On Thu, Mar 31, 2022 at 12:58:17PM +0000, Fabio Baltieri wrote:
> > > > Update google,cros-ec-pwm node documentation to mention the
> > > > google,use_pwm_type property.
> > > > 
> > > > Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> > > > ---
> > > >  .../devicetree/bindings/pwm/google,cros-ec-pwm.yaml         | 6 ++++++
> > > >  1 file changed, 6 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml b/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
> > > > index 4cfbffd8414a..9c895c990ed8 100644
> > > > --- a/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
> > > > +++ b/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
> > > > @@ -19,6 +19,12 @@ description: |
> > > >  properties:
> > > >    compatible:
> > > >      const: google,cros-ec-pwm
> > > > +
> > > > +  google,use-pwm-type:
> > > > +    description:
> > > > +      Use PWM types (CROS_EC_PWM_DT_<...>) instead of generic channels.
> > > > +    type: boolean
> > > 
> > > Either do a new compatible string if the cell interpretation is mutually 
> > > exclusive (channel number vs. type) or split the number space for the 
> > > 1st cell between type and channel number. IOW, set a bit (31?) to 
> > > signify the number is a type, not a channel.
> > 
> > Split the number space was my first (tentative) implementation as well,
> > but it turns out that the PWM subsystem really wants channels to be
> > zero-based[1], so I don't think flags or bitmasks are really an option.
> 
> Fix the PWM subsystem then...

It's a good design decision, allows for probe time validation and a good
debugfs interface, I'm happy to have this feature comply with it.

> 
> > New compatible sounds good though, I'll rework a v3 with that change.
> > 
> > Thanks!
> > Fabio
> > 
> > [1] https://elixir.bootlin.com/linux/v5.17/source/drivers/pwm/core.c#L423
> > 
> > -- 
> > Fabio Baltieri

-- 
Fabio Baltieri
