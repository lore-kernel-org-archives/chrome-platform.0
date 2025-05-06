Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352E02D4B65
	for <chrome-platform@lists.linux.dev>; Tue,  6 May 2025 02:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746499784; cv=none; b=safXDw9dTMLZGr1Y4oJOb0TWUHKq36icHgfugHbQXRVqb8OZgRmvUWiaP2SSJ+930uZ9ZUvADbEcrHeAYf5PUkY6SNYJwG56INoOWtGx0NxU1txusGWffRTsBnXoexQ8lMq6ONbr/7xlHn0y5rTv3WvisvPOq2OvvqWyyJfC0FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746499784; c=relaxed/simple;
	bh=BVcS6y/RkytdfYbg6aiFphNw4k53SlFmqyW2ahlf+8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nCpuwj/+Urav5Mgs3y8dHsLQfLEXEBCuOWtmzXXep2Kb+5r2Vx4/reBF1WKuR4UYdM6A707oDNRGFCEqnzhJzBh6DUhn69MkrsdyX6aOOkjxw5lGa+KGGvAV2LhG6FQlIuHhTmmKO8JU8KDDxevRGl3EVgjXM07eTUGoMEHNwvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SdYqJgOQ; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SdYqJgOQ"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so4871982b3a.1
        for <chrome-platform@lists.linux.dev>; Mon, 05 May 2025 19:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746499782; x=1747104582; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q0+JSDpYT5BNX3k6gPTP+QpNOml9kj6YJgCfvY0JCRs=;
        b=SdYqJgOQUE8sg3hIJ7vQwe3Y2cgACg+JabSw6dK4WHk+tm0Ny7IkRrg0UxIawctXP9
         xeWDhgu0UPtJuLH6WgA6jDslyX/rk8dd2OKSYeXJ6dggc2oedjPOnrHNsqeqUO7aGtSE
         65ljN9r9t65u6kSHWSzkcAiAQvb80e/JoXKjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746499782; x=1747104582;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q0+JSDpYT5BNX3k6gPTP+QpNOml9kj6YJgCfvY0JCRs=;
        b=kjLHa2bYG7EDhXBNwsvogQ/Y6FS7nJi41dY/JC5VegeGkwYudPZ19t3GAeu81gGBud
         YpY2QhluUfsMrb/YOM+Fm+61nOPYE8u9RUa9m38QmA03k/pos/Gj7CzLKEkG57FNidet
         2rBe2nFhXR2Pe0CMZzPwOdENEp8C+06ZTLvTkrtuoLFXZnREo3czBoHMNjv5a2FIEA+f
         j+O6L74ANN5VczTU7sB3cqeNjS870BgnD3aCEBU0lm2qs9UjZzPJJJXxzh4nCR/Y2NZ3
         TR44cOFsxG+fuXf+M5GhXEvj7W28iEzc5p5ed+WE5SLgb4SzebqAAMye5zsuHBN98oy8
         KH+A==
X-Forwarded-Encrypted: i=1; AJvYcCVK08j2DxKQZWi1nNWGuClUIaA71io26/+W9065nGC18E/Q/XKZyymyoE41exIMdaksoTJeq6WttXQs2cchv0Q=@lists.linux.dev
X-Gm-Message-State: AOJu0Yycb478wRR3uHu6DDx1fQ3Wy25KTTKmahrPnu8HVAZfU+4mqtKs
	nRgC7+Pj2c6F+0OWw0SnJC6btemPDA2BOm7WnNt6F5yMF8nE1RmALNNVPZ0vkQ==
X-Gm-Gg: ASbGncsLWTEhfj9GOwRr+q8f2AoVQZP/hSdmGP4n5HTB0jIGFmOSFXIkFFF/R+cXYuO
	R1W3Y1seJJcgOGrDyoqDH5FombQne2JGjF0q8ReQcGK/yYfFuQdlTVPqCfdOVclwYzFTq3KcEJC
	VLxv8bK151CSwyho34myJtVsdvQ46BQ1OWaHf0hH0Be1BQhP6DJRe2Vwp+Ro6m9FB9NwXfWxgcW
	g7oUqY3OjxWjatLWyqU9KCFQ4BFmm1vJwOtr9AJVkaaBxqZFT5f0DhAnYaoy1cnfn4pwsA7Byud
	6C8JGEWO6XjXWd1ohRnFX/a1dZaz2SQ7pA==
X-Google-Smtp-Source: AGHT+IEEZ1PfoCNd1C1LjNnH37ZRF5k8qCVtLcVSMSDNAUIZcoEsuzle0aPuWxV/v0FJ4LrYSFQ+Ew==
X-Received: by 2002:a05:6a20:2d2b:b0:1f5:619a:8f75 with SMTP id adf61e73a8af0-20e96108b51mr15452923637.2.1746499782489;
        Mon, 05 May 2025 19:49:42 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:d4bd:e7e5:608:dbd7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3c6b6d8sm6384494a12.69.2025.05.05.19.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 19:49:42 -0700 (PDT)
Date: Tue, 6 May 2025 10:49:37 +0800
From: Sung-Chi Li <lschyi@chromium.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: (cros_ec) register fans into thermal
 framework cooling devices
Message-ID: <aBl4wcX889otz_ms@google.com>
References: <20250502-cros_ec_fan-v2-0-4d588504a01f@chromium.org>
 <20250502-cros_ec_fan-v2-3-4d588504a01f@chromium.org>
 <b2432c5c-2589-4cfe-821f-47e5128af2d0@t-8ch.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b2432c5c-2589-4cfe-821f-47e5128af2d0@t-8ch.de>

On Sat, May 03, 2025 at 09:27:18AM +0200, Thomas Weißschuh wrote:
> On 2025-05-02 13:34:47+0800, Sung-Chi Li via B4 Relay wrote:
> > From: Sung-Chi Li <lschyi@chromium.org>
> > 
> > Register fans connected under EC as thermal cooling devices as well, so
> > these fans can then work with the thermal framework.
> > 
> > During the driver probing phase, we will also try to register each fan
> > as a thermal cooling device based on previous probe result (whether the
> > there are fans connected on that channel, and whether EC supports fan
> > control). The basic get max state, get current state, and set current
> > state methods are then implemented as well.
> > 
> > Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
> > ---
> >  Documentation/hwmon/cros_ec_hwmon.rst |  2 ++
> >  drivers/hwmon/cros_ec_hwmon.c         | 66 +++++++++++++++++++++++++++++++++++
> >  2 files changed, 68 insertions(+)
> > 
> > diff --git a/Documentation/hwmon/cros_ec_hwmon.rst b/Documentation/hwmon/cros_ec_hwmon.rst
> > index 5b802be120438732529c3d25b1afa8b4ee353305..82c75bdaf912a116eaafa3149dc1252b3f7007d2 100644
> > --- a/Documentation/hwmon/cros_ec_hwmon.rst
> > +++ b/Documentation/hwmon/cros_ec_hwmon.rst
> > @@ -27,3 +27,5 @@ Fan and temperature readings are supported. PWM fan control is also supported if
> >  the EC also supports setting fan PWM values and fan mode. Note that EC will
> >  switch fan control mode back to auto when suspended. This driver will restore
> >  the fan state before suspended.
> > +If a fan is controllable, this driver will register that fan as a cooling device
> > +in the thermal framework as well.
> > diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> > index c5e42e2a03a0c8c68d3f8afbb2bb45b93a58b955..abfcf44fb7505189124e78c651b0eb1e0533b4e8 100644
> > --- a/drivers/hwmon/cros_ec_hwmon.c
> > +++ b/drivers/hwmon/cros_ec_hwmon.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/platform_data/cros_ec_commands.h>
> >  #include <linux/platform_data/cros_ec_proto.h>
> > +#include <linux/thermal.h>
> 
> Needs a dependency on CONFIG_THERMAL.
> 

I think adding the `if (!IS_ENABLED(CONFIG_THERMAL))` you suggested is
sufficient, and turning on or off CONFIG_THERMAL both can compile, so I'll only
add the guarding statement in the `cros_ec_hwmon_register_fan_cooling_devices`.

> > +
> > +	if (!priv->fan_control_supported)
> > +		return;
> > +
> > +	for (i = 0; i < EC_FAN_SPEED_ENTRIES; i++) {
> > +		if (!(priv->usable_fans & BIT(i)))
> > +			continue;
> > +
> > +		cpriv = devm_kzalloc(dev, sizeof(*cpriv), GFP_KERNEL);
> > +		if (!cpriv)
> > +			return;
> > +
> > +		cpriv->hwmon_priv = priv;
> > +		cpriv->index = i;
> > +		devm_thermal_of_cooling_device_register(
> > +			dev, NULL, devm_kasprintf(dev, GFP_KERNEL, "cros-ec-fan%zu", i), cpriv,
> 
> What happens for multiple/chained ECs? If both provide sensors the
> thermal device names will collide.
> 

How about changing the "cros-ec-fan%zu" to "%s-fan%zu", which prefixes the
`dev_name()`? Here is an example from a device: cros-ec-hwmon.12.auto-fan0.

> Error handling for devm_kasprintf() is missing.
> 

Thank you for catching this, I will skip registering that device if the
devm_kasprintf() fails.

> > +			&cros_ec_thermal_cooling_ops);
> 
> Error handling for devm_thermal_of_cooling_device_register() is missing.
> 

I think we should continue registering other fans, so maybe we add a warning
here if the registration fails?

> > +	}
> > +}
> > +
> >  static int cros_ec_hwmon_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> > @@ -402,6 +467,7 @@ static int cros_ec_hwmon_probe(struct platform_device *pdev)
> >  	cros_ec_hwmon_probe_fans(priv);
> >  	priv->fan_control_supported =
> >  		cros_ec_hwmon_probe_fan_control_supported(priv->cros_ec);
> > +	cros_ec_hwmon_register_fan_cooling_devices(dev, priv);
> >  
> >  	hwmon_dev = devm_hwmon_device_register_with_info(dev, "cros_ec", priv,
> >  							 &cros_ec_hwmon_chip_info, NULL);
> > 
> > -- 
> > 2.49.0.906.g1f30a19c02-goog
> > 
> > 
