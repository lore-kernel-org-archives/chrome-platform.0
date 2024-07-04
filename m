Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79E83AC0F
	for <chrome-platform@lists.linux.dev>; Thu,  4 Jul 2024 18:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720116524; cv=none; b=le37aV9tmOgtBBlACG+XCFRCT0GITZV0bqXnpVpWS/F1d1F3JAN9srX9SW41v6dygudt76rIh1+nQyb8AifjYTbU43g5Bro59LLnqoMjHztuZrp7w+ZZDfKbvFuH4Q4V0zRTTzHVV7YPw3MpUCIrCpASPMQKi5TTLBzCkn4mG/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720116524; c=relaxed/simple;
	bh=GB4KD8f901t5iIa4Lo9/h/m/e1PzSvkWWJu8FZJh4Mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQyiIkObsODvJQgxgSPprVNfLhfknDpW2l72XPepKHklUX8OwfXyOBrLPXD777ri3AVfVIQ1vAEQlA2SwsyOBUVGYSGg//hDxWZ69M+Rx/87y7NiKt3qsYo1r4eRXgCVaDlzYOdx1gHd0ktNmBCcrJCY1PU8WGTWOPjJP4enACM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=tglOtiNK; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="tglOtiNK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1720116519;
	bh=GB4KD8f901t5iIa4Lo9/h/m/e1PzSvkWWJu8FZJh4Mg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tglOtiNKI/+aEVy7VJhazzTkbW2LcZMPeECwybr6+pZXma2fLGz/0nQHt1nQimJCw
	 aWf0rIN1qcNRD2zAun/NiGYo3WGjWHcerIpyF8Pl11kfZK876DvzGlRvN2kuZpGdSf
	 oX5QkgHogJ51XVkwjP0JjD4XKdnfTkHZ7igsQAQ4=
Date: Thu, 4 Jul 2024 20:08:39 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: chrome-platform@lists.linux.dev
Subject: Re: [bug report] power: supply: add ChromeOS EC based charge control
 driver
Message-ID: <e9990411-e834-4269-b2c1-5ce9a6c80f52@t-8ch.de>
References: <8af72a2f-60c4-454a-a930-b951325db5ea@stanley.mountain>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8af72a2f-60c4-454a-a930-b951325db5ea@stanley.mountain>

Hi Dan,

On 2024-07-04 10:20:14+0000, Dan Carpenter wrote:
> Hello Thomas Weißschuh,
> 
> Commit c6ed48ef5259 ("power: supply: add ChromeOS EC based charge
> control driver") from Jun 30, 2024 (linux-next), leads to the
> following Smatch static checker warning:
> 
> 	drivers/power/supply/cros_charge-control.c:318 cros_chctl_probe()
> 	error: buffer overflow 'priv->attributes' 3 <= 3
> 
> drivers/power/supply/cros_charge-control.c
>     304 
>     305         dev_dbg(dev, "Command version: %u\n", (unsigned int)priv->cmd_version);
>     306 
>     307         priv->cros_ec = cros_ec;
>     308         priv->device_attrs[CROS_CHCTL_ATTR_START_THRESHOLD] =
>     309                 (struct device_attribute)__ATTR_RW(charge_control_start_threshold);
>     310         priv->device_attrs[CROS_CHCTL_ATTR_END_THRESHOLD] =
>     311                 (struct device_attribute)__ATTR_RW(charge_control_end_threshold);
>     312         priv->device_attrs[CROS_CHCTL_ATTR_CHARGE_BEHAVIOUR] =
>     313                 (struct device_attribute)__ATTR_RW(charge_behaviour);
>     314         for (i = 0; i < _CROS_CHCTL_ATTR_COUNT; i++) {
>     315                 sysfs_attr_init(&priv->device_attrs[i].attr);
>     316                 priv->attributes[i] = &priv->device_attrs[i].attr;
>     317         }
> --> 318         priv->attributes[_CROS_CHCTL_ATTR_COUNT] = NULL;
>                                  ^^^^^^^^^^^^^^^^^^^^^^
> The ->attributes[] array has _CROS_CHCTL_ATTR_COUNT elements so this is an out
> of bounds write.

Thanks for the report.
This was also already reported by Nathan Chancellor at [0],
and should be fixed in current chrome-platform/for-next.

>     319         priv->group.is_visible = cros_chtl_attr_is_visible;
>     320         priv->group.attrs = priv->attributes;
>     321 
>     322         priv->battery_hook.name = dev_name(dev);
>     323         priv->battery_hook.add_battery = cros_chctl_add_battery;
>     324         priv->battery_hook.remove_battery = cros_chctl_remove_battery;
>     325 
>     326         priv->current_behaviour = POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO;
>     327         priv->current_start_threshold = 0;
>     328         priv->current_end_threshold = 100;
>     329 
>     330         /* Bring EC into well-known state */
>     331         ret = cros_chctl_configure_ec(priv);
>     332         if (ret < 0)
>     333                 return ret;
>     334 
>     335         return devm_battery_hook_register(dev, &priv->battery_hook);
>     336 }
> 
> regards,
> dan carpenter

[0] https://lore.kernel.org/all/20240702-cros_charge-control-fix-clang-array-bounds-warning-v1-1-ae04d995cd1d@kernel.org/
