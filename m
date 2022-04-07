Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCB02563
	for <chrome-platform@lists.linux.dev>; Thu,  7 Apr 2022 14:38:59 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id k124-20020a1ca182000000b0038c9cf6e2a6so3846330wme.0
        for <chrome-platform@lists.linux.dev>; Thu, 07 Apr 2022 07:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+HrqUl2stcAnQOvkV/cLC8sh1bdsuE9uaYRM3SC8TAI=;
        b=QC/NBWbz8s242GqiqGVCxZjqkf65n2BOMSMdySwx5OMCnmpmfgmy2Gl0mqkViPk58A
         B0hFl228YREAAGFp1bTWTBF48v9/vcamAwhlivD7F9RoAWhkxTVUUszkElVwniFp+KSW
         153YOYtKLxloRx116E1JbzBPjjKXbUaIisB8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+HrqUl2stcAnQOvkV/cLC8sh1bdsuE9uaYRM3SC8TAI=;
        b=hnbP3EUFJ5dkPj7HseXd3GMFHJogZKCg86jDnAp/PmCTcjCFKlJg6vNUVBnV5IT+M8
         Bz8DIhnrOqlTnbhU/1THU5HYk2oItvonLhtTfc9Se39kqJIS0pQAxQ1rC+s9/CnoJd5A
         Zb4vhtGXPfnacqFBJBnFIYo/4A5RlmeatSVKx/7Za5/Vh6VtqqrPL7JC4zV2Qy0X2yiq
         XH9HqnOej45AaTWet0q90CHEgXb/7Guir3oktcTGpOgMteshdbJKJ30yBpGZpITXztlc
         Do4OVK90gkCSO/ldEl9co+3Bw3gnFjLHezncVC4r5dHYo4hS1iZ0YGBjbm8/u9elzwec
         PQXg==
X-Gm-Message-State: AOAM531gCM6u+dpQlXWWXBUhyflE262BT8tIeOhY+BcfvSKXsxwBIP1l
	xUegMAS++mJe9ZOG3uoNooQjlg==
X-Google-Smtp-Source: ABdhPJxSm1o4AJPWmwSiOwXUcoOrfrDDoE6QavOVO+5QTW+urJsTAfmBJCV6RwoUxCRXXNUmmjXF1A==
X-Received: by 2002:a1c:f605:0:b0:37b:b5de:89a0 with SMTP id w5-20020a1cf605000000b0037bb5de89a0mr12345916wmc.88.1649342337820;
        Thu, 07 Apr 2022 07:38:57 -0700 (PDT)
Received: from google.com ([37.228.205.1])
        by smtp.gmail.com with ESMTPSA id bg8-20020a05600c3c8800b0038e4c5967besm7983010wmb.3.2022.04.07.07.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 07:38:57 -0700 (PDT)
Date: Thu, 7 Apr 2022 14:38:55 +0000
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
Message-ID: <Yk73f9yyxy5LBC+V@google.com>
References: <20220331125818.3776912-1-fabiobaltieri@chromium.org>
 <20220331125818.3776912-4-fabiobaltieri@chromium.org>
 <Yk20uTE/Vdm2c6jI@robh.at.kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yk20uTE/Vdm2c6jI@robh.at.kernel.org>

Hi Rob,

On Wed, Apr 06, 2022 at 10:41:45AM -0500, Rob Herring wrote:
> On Thu, Mar 31, 2022 at 12:58:17PM +0000, Fabio Baltieri wrote:
> > Update google,cros-ec-pwm node documentation to mention the
> > google,use_pwm_type property.
> > 
> > Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> > ---
> >  .../devicetree/bindings/pwm/google,cros-ec-pwm.yaml         | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml b/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
> > index 4cfbffd8414a..9c895c990ed8 100644
> > --- a/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
> > +++ b/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
> > @@ -19,6 +19,12 @@ description: |
> >  properties:
> >    compatible:
> >      const: google,cros-ec-pwm
> > +
> > +  google,use-pwm-type:
> > +    description:
> > +      Use PWM types (CROS_EC_PWM_DT_<...>) instead of generic channels.
> > +    type: boolean
> 
> Either do a new compatible string if the cell interpretation is mutually 
> exclusive (channel number vs. type) or split the number space for the 
> 1st cell between type and channel number. IOW, set a bit (31?) to 
> signify the number is a type, not a channel.

Split the number space was my first (tentative) implementation as well,
but it turns out that the PWM subsystem really wants channels to be
zero-based[1], so I don't think flags or bitmasks are really an option.

New compatible sounds good though, I'll rework a v3 with that change.

Thanks!
Fabio

[1] https://elixir.bootlin.com/linux/v5.17/source/drivers/pwm/core.c#L423

-- 
Fabio Baltieri
