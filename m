Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6731804A
	for <chrome-platform@lists.linux.dev>; Mon, 12 May 2025 07:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747035352; cv=none; b=SCbhNhX3NzgYKGT9PDfOUfbU4jADyXEklTxaBDIqv9MkhuJdfvsi/a4Oa6Wrn7GUWNC5KUORvsLcnaQiJ8Jys/JbgOW3PcBhITWvBcIORsF2Tm8M52INLiA0Lo5lEl1qzD1pobtGceGvJCeZRkB5SZEJJdr7YOQeJlM5FNycqhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747035352; c=relaxed/simple;
	bh=zThPDjsAtVrDoxY89PisLPnV3mz6OPMwqflpMidXKdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wa37ZzKA6Bv6xbFfl2KgW95AdSqzAZHxcWrrRVFVTrazCpynFRDURAfspOTpaKbL8iyffZ6NWGCKOyYdeiNlPgQniSnA6UTreZ7AtEHF3d6bQjUScomfG8+4BbTBM4d1iYDh+99D7wyPVDNFJZXNSYfh0sUYZmqULHQhA5zAh2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=TBV7i6gq; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="TBV7i6gq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1747035348;
	bh=zThPDjsAtVrDoxY89PisLPnV3mz6OPMwqflpMidXKdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TBV7i6gqVq6TeLRnHc1vsuBvzG00bAGXz3AmvZZ+Ro4djFoPH3FL5zC2QpKVmN93p
	 N2tip4L1hZgNYYgwuL5fYW4yBo6oGm+28ocvfkV3vXwIsbkRbRgJhvRTbKcEyCDC81
	 wlclcmPfmej/Wyi2hlEAs/wn+5sYQxgIPEOSJCag=
Date: Mon, 12 May 2025 09:35:47 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: lschyi@chromium.org
Cc: Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org, Sung-Chi Li <lschyi@google.com>
Subject: Re: [PATCH v3 3/3] hwmon: (cros_ec) register fans into thermal
 framework cooling devices
Message-ID: <7309c804-19e3-4715-b8c9-efa31c8ea9e1@t-8ch.de>
References: <20250512-cros_ec_fan-v3-0-a9f2b255f0cd@chromium.org>
 <20250512-cros_ec_fan-v3-3-a9f2b255f0cd@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512-cros_ec_fan-v3-3-a9f2b255f0cd@chromium.org>

On 2025-05-12 15:11:57+0800, Sung-Chi Li via B4 Relay wrote:
> From: Sung-Chi Li <lschyi@chromium.org>
> 
> Register fans connected under EC as thermal cooling devices as well, so
> these fans can then work with the thermal framework.
> 
> During the driver probing phase, we will also try to register each fan
> as a thermal cooling device based on previous probe result (whether the
> there are fans connected on that channel, and whether EC supports fan
> control). The basic get max state, get current state, and set current
> state methods are then implemented as well.
> 
> Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
> ---
>  Documentation/hwmon/cros_ec_hwmon.rst |  2 +
>  drivers/hwmon/cros_ec_hwmon.c         | 78 +++++++++++++++++++++++++++++++++++
>  2 files changed, 80 insertions(+)

<snip>

> +static void cros_ec_hwmon_register_fan_cooling_devices(struct device *dev,
> +						       struct cros_ec_hwmon_priv *priv)
> +{
> +	struct thermal_cooling_device *cdev;
> +	struct cros_ec_hwmon_cooling_priv *cpriv;
> +	size_t i;
> +	char *type;

Ordering.

> +
> +	if (!IS_ENABLED(CONFIG_THERMAL))
> +		return;
> +
> +	if (!priv->fan_control_supported)
> +		return;
> +
> +	for (i = 0; i < EC_FAN_SPEED_ENTRIES; i++) {
> +		if (!(priv->usable_fans & BIT(i)))
> +			continue;
> +
> +		cpriv = devm_kzalloc(dev, sizeof(*cpriv), GFP_KERNEL);
> +		if (!cpriv)
> +			return;

The failures are swallowed silently. They should be propagated.

> +
> +		type = devm_kasprintf(dev, GFP_KERNEL, "%s-fan%zu", dev_name(dev), i);
> +		if (!type)
> +			return;
> +
> +		cpriv->hwmon_priv = priv;
> +		cpriv->index = i;
> +		cdev = devm_thermal_of_cooling_device_register(dev, NULL, type, cpriv,
> +							       &cros_ec_thermal_cooling_ops);
> +		if (!cdev)

..._cooling_device_register() returns an error pointer on failure, not NULL.

> +			return;
> +	}
> +}
> +
>  static int cros_ec_hwmon_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -412,6 +489,7 @@ static int cros_ec_hwmon_probe(struct platform_device *pdev)
>  	cros_ec_hwmon_probe_temp_sensors(dev, priv, thermal_version);
>  	cros_ec_hwmon_probe_fans(priv);
>  	priv->fan_control_supported = cros_ec_hwmon_probe_fan_control_supported(priv->cros_ec);
> +	cros_ec_hwmon_register_fan_cooling_devices(dev, priv);
>  
>  	hwmon_dev = devm_hwmon_device_register_with_info(dev, "cros_ec", priv,
>  							 &cros_ec_hwmon_chip_info, NULL);
> 
> -- 
> 2.49.0.1015.ga840276032-goog
> 
> 
