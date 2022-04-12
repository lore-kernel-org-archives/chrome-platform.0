Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23ABC7B
	for <chrome-platform@lists.linux.dev>; Tue, 12 Apr 2022 08:41:02 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id m33-20020a05600c3b2100b0038ec0218103so1139321wms.3
        for <chrome-platform@lists.linux.dev>; Tue, 12 Apr 2022 01:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JVS8yoTed/57DjCwKIW1A/c1IofL37wt+tYJEPzUAmU=;
        b=Z+VbZn7FPHNe/GBsQyuivnzzgGzYvxBZDES1LMjk+AMruKFaWMliPs/DaWe4wQcj1V
         Z46VUcXBRlve5tWnD6t/jEuT+5XKFrUE5df/ekH+6vCNCqWOXn6MuAX1Kaz4F4MRmb0u
         prutTbcdiNtijUHwv3SzkXxA25iy5vFpLZA4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JVS8yoTed/57DjCwKIW1A/c1IofL37wt+tYJEPzUAmU=;
        b=JdEsmLZ15kpRuKGEzCwqnQ/dTtADvLAtzi9J1trwdpTlVC7wAE8ZI+GFnY+henxZgL
         j7GKPgo6+TiEILG8xtNA7I9P600+3E/PdrnKf8duPGizxgbVaYS7nqalcRUwayaGuytH
         4+KEBBj/JSxJLh1ivdbEcni9Rl9v9qVOc6SlPAdAqVg+gn6RInIxqcgoQEKHjYq9wYKe
         vAbFTQu3iHKKgBdSbgUp3DMwNxQB/kAxLNsC98tL5CYC1rRZynczEBe/TpxR8sDd6Gbt
         LpLId/Rd2gnswipqDfknBqKBx0XL1Wou2FJYq9Ne0heiLmmeI8lo4IBlFFmeohj/taCW
         BsfQ==
X-Gm-Message-State: AOAM530xrkDOOVK7J1LwEFKUqzDhHwrUuuH5mvwTGmMD1rZFI5G8NkUF
	1U1R+BeKnr9Rpux2g5E9oBdqUQ==
X-Google-Smtp-Source: ABdhPJyHye7sxKTODHYVlr0Iw88mdVOrIKEdTmPAKEL4TcsxZIZQomuSpVY1efYdnCyhwPqDkolHGQ==
X-Received: by 2002:a05:600c:1c0e:b0:38c:ae37:c1d2 with SMTP id j14-20020a05600c1c0e00b0038cae37c1d2mr2964820wms.205.1649752861339;
        Tue, 12 Apr 2022 01:41:01 -0700 (PDT)
Received: from google.com ([37.228.205.1])
        by smtp.gmail.com with ESMTPSA id h10-20020a05600c144a00b0038ccc75a6adsm1769601wmi.37.2022.04.12.01.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 01:41:00 -0700 (PDT)
Date: Tue, 12 Apr 2022 08:40:58 +0000
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	chrome-platform@lists.linux.dev, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] drivers: pwm: pwm-cros-ec: add channel type
 support
Message-ID: <YlU7GoSYMPapAsVv@google.com>
References: <20220411152114.2165933-1-fabiobaltieri@chromium.org>
 <20220411152114.2165933-3-fabiobaltieri@chromium.org>
 <YlUq8W+xjdxqYCo5@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YlUq8W+xjdxqYCo5@google.com>

Hi Tzung-Bi,

On Tue, Apr 12, 2022 at 03:32:01PM +0800, Tzung-Bi Shih wrote:
> On Mon, Apr 11, 2022 at 03:21:12PM +0000, Fabio Baltieri wrote:
> > Add support for EC_PWM_TYPE_DISPLAY_LIGHT and EC_PWM_TYPE_KB_LIGHT pwm
> > types to the PWM cros_ec_pwm driver. This allows specifying one of these
> > PWM channel by functionality, and let the EC firmware pick the correct
> > channel, thus abstracting the hardware implementation from the kernel
> > driver.
> > 
> > To use it, define the node with the "google,cros-ec-pwm-type"
> > compatible.
> 
> Not sure whether you decide to leave the prefix as is or not[1], just another
> reminder: to be neat, suggest to remove "drivers: " prefix from the commit
> title.

Sorry I messed up there, fixed in on the wrong branch and then forgot to
re-fix it once I moved to the wrong one -- I'll make sure to get that
right now, thanks for your patience.

> 
> [1]: https://patchwork.kernel.org/project/chrome-platform/patch/20220331125818.3776912-3-fabiobaltieri@chromium.org/
> 
> > +#ifdef CONFIG_OF
> > +static const struct of_device_id cros_ec_pwm_of_match[] = {
> > +	{
> > +		.compatible = "google,cros-ec-pwm",
> > +	},
> > +	{
> > +		.compatible = "google,cros-ec-pwm-type",
> > +		.data = OF_CROS_EC_PWM_TYPE,
> > +	},
> > +	{},
> > +};
> > +MODULE_DEVICE_TABLE(of, cros_ec_pwm_of_match);
> > +#else
> > +#define cros_ec_pwm_of_match NULL
> > +#endif
> > +
> >  static int cros_ec_pwm_probe(struct platform_device *pdev)
> >  {
> >  	struct cros_ec_device *ec = dev_get_drvdata(pdev->dev.parent);
> >  	struct device *dev = &pdev->dev;
> > +	const struct of_device_id *id;
> >  	struct cros_ec_pwm_device *ec_pwm;
> >  	struct pwm_chip *chip;
> >  	int ret;
> > @@ -251,17 +312,27 @@ static int cros_ec_pwm_probe(struct platform_device *pdev)
> >  	chip = &ec_pwm->chip;
> >  	ec_pwm->ec = ec;
> >  
> > +	id = of_match_device(cros_ec_pwm_of_match, dev);
> > +	if (id && id->data == OF_CROS_EC_PWM_TYPE)
> > +		ec_pwm->use_pwm_type = true;
> > +
> [...]
> > -#ifdef CONFIG_OF
> > -static const struct of_device_id cros_ec_pwm_of_match[] = {
> > -	{ .compatible = "google,cros-ec-pwm" },
> > -	{},
> > -};
> > -MODULE_DEVICE_TABLE(of, cros_ec_pwm_of_match);
> > -#endif
> > -
> 
> Use dev->driver->of_match_table to access the table so that the table
> declaration doesn't actually need a move.  Instead, the helper function
> of_device_get_match_data() is preferred.
> 
> Alternatively, it could use
> of_device_is_compatible(..."google,cros-ec-pwm-type") so that it doesn't
> need to introduce OF_CROS_EC_PWM_TYPE and reduce some bits.  I would prefer
> this way.

That's a very good point, should simplify things a fair bit, did not
realize of_device_is_compatible() was an option somehow, will rework it
for that and send a v4 soon. Thanks for the pointer.

Fabio

-- 
Fabio Baltieri
