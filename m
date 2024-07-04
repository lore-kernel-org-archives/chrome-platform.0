Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5404204F
	for <chrome-platform@lists.linux.dev>; Thu,  4 Jul 2024 18:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720116983; cv=none; b=VQYnI1X5XNhgmx6Ss62W1SrPcRToKXrzytJ9maWN2Tl29M9cGPLZyHPt4yewRdNvdBqwKdyv6EWEGe4gp5zB7JRBKypT2VH/Zr0eoDAFiX8VzyTUrv0dlIq0Men6Cl4V2+4+hQhdo9SHYMvp9PsNeGg1AjGNUq//wtYynHQsDcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720116983; c=relaxed/simple;
	bh=5d/dB4AsLDLrUV0iB98Gfxiyh26yO3HZ8Hx1w+E/ZNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RV2kMXjnZaxRc5qc8jsJ7jWL8o7fhNuwDlx/o4jLgo2kLrhHiroPzz2Cl4vp+5XYFZ1BL+UTy+JwIJmSYv+hrz89K6FxleTFlpLa0vn0W9AForLSMh3+bPA3k0M2NlOhnZ/FncgryCMg62fK9uyA9HonsOD7W7lwtvRO0HhdSf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=dYnVuHGX; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="dYnVuHGX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1720116978;
	bh=5d/dB4AsLDLrUV0iB98Gfxiyh26yO3HZ8Hx1w+E/ZNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dYnVuHGX5hdWPRFDaQopLHp/LP69wqpUd+usfunfEK/X/17gWqtMzdoHKz//7Gr1C
	 PFtoBAsH7OAy+0dwk3EYG82ysadfethxc45svz6nPUwD4EOqaGQlZWDNF/83ztVwaw
	 Ru/oLroh7CexjOHBCljggFDw2V3QGmr0RM0MVPh8=
Date: Thu, 4 Jul 2024 20:16:18 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Sebastian Reichel <sre@kernel.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] power: supply: cros_charge-control: Fix signedness bug
 in charge_behaviour_store()
Message-ID: <48a348a0-0489-45bb-874b-246c7683a5a5@t-8ch.de>
References: <ZoWKEs4mCqeLyTOB@stanley.mountain>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZoWKEs4mCqeLyTOB@stanley.mountain>

Hi Dan,

Thanks!

On 2024-07-04 10:20:03+0000, Dan Carpenter wrote:
> The C standard is vague about the signedness of enums, but in this case
> here, they are treated as unsigned so the error handling does not work.
> Use an int type to fix this.
> 
> Fixes: c6ed48ef5259 ("power: supply: add ChromeOS EC based charge control driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Acked-by: Thomas Weißschuh <linux@weissschuh.net>

> ---
>  drivers/power/supply/cros_charge-control.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/power/supply/cros_charge-control.c b/drivers/power/supply/cros_charge-control.c
> index 73d7f2dc0fa3..3183a13eefd0 100644
> --- a/drivers/power/supply/cros_charge-control.c
> +++ b/drivers/power/supply/cros_charge-control.c
> @@ -204,14 +204,13 @@ static ssize_t charge_behaviour_store(struct device *dev, struct device_attribut
>  {
>  	struct cros_chctl_priv *priv = cros_chctl_attr_to_priv(&attr->attr,
>  							       CROS_CHCTL_ATTR_CHARGE_BEHAVIOUR);
> -	enum power_supply_charge_behaviour behaviour;
>  	int ret;
>  
> -	behaviour = power_supply_charge_behaviour_parse(EC_CHARGE_CONTROL_BEHAVIOURS, buf);
> -	if (behaviour < 0)
> -		return behaviour;
> +	ret = power_supply_charge_behaviour_parse(EC_CHARGE_CONTROL_BEHAVIOURS, buf);
> +	if (ret < 0)
> +		return ret;
>  
> -	priv->current_behaviour = behaviour;
> +	priv->current_behaviour = ret;
>  
>  	ret = cros_chctl_configure_ec(priv);
>  	if (ret < 0)
> -- 
> 2.43.0
> 
