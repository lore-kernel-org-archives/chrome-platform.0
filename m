Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66C0355F3A
	for <chrome-platform@lists.linux.dev>; Fri, 29 May 2026 05:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780033059; cv=none; b=PFNQudzV4SzGHq1PjlnySeDXpWBe9m5+VMi7w0OgA9NHQfa4W6WTHh1PLnC6g9uiLW2H+ilIvIQi6eAaKCeYixR25BZ4Wjxfym0jYTOh+T4zVAEuzKLBVLeEZRQ1Dve3GWHIzZiEfwnz1eruBHDHnX5nTpJ43D3pvf0fa/vE8UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780033059; c=relaxed/simple;
	bh=K9WFXYzbsh/m8MeVFM605XIzF/P2IVFKg/UbAV0bTwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ulhG7EKiAaZ26E3N26L6//6YcPb9oGNLKsfN9UeOpdXx9BOvlzMbl1CVlB9nZYQZsl30LY/84cSPG63srI0eVYGMKgiTgmKy9Uy88rQrkzIE9W5BCfhHFQzdJkUeHqRmS/FViTEbjeZx5obiXrrHww54YywOdOj1zdtoJqyrUsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=V1ULx6J6; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="V1ULx6J6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1780033049;
	bh=K9WFXYzbsh/m8MeVFM605XIzF/P2IVFKg/UbAV0bTwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V1ULx6J63x00ZcpTIHpyIveQoPgwr3fV5mUZ8DoaZvOYEqOIBBnhwFSU9+fBg8dTD
	 hGFpTIqJ5vRadA3wL9ERyuxNhtRsmx3wPt5KJv7i/t+LvTqwFcr4D209c18RZW44X0
	 Y2Tj17vAfR6FVhogv8kREUOpHKawmLcGEZHxkzoY=
Date: Fri, 29 May 2026 07:37:28 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Benson Leung <bleung@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] hwmon: cros_ec: Drop unused assignment of
 platform_device_id driver data
Message-ID: <fe146f93-f2c7-406a-9364-f226e93435ae@t-8ch.de>
References: <cover.1779894738.git.u.kleine-koenig@baylibre.com>
 <972c9998054c7944f63266819d6fb08b36edb5c5.1779894738.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <972c9998054c7944f63266819d6fb08b36edb5c5.1779894738.git.u.kleine-koenig@baylibre.com>

On 2026-05-27 17:15:52+0200, Uwe Kleine-König (The Capable Hub) wrote:
> The driver explicitly set the .driver_data member of struct
> platform_device_id to zero without relying on that value. Drop this
> unused assignments.
> 
> While touching this array unify spacing and 

> use named initializers for .name.

Not sure why this is better.

> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

... but it doesn't really matter, so:
Acked-by: Thomas Weißschuh <linux@weissschuh.net>

> ---
>  drivers/hwmon/cros_ec_hwmon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> index 7c308b0a4b9e..f6cf254395a8 100644
> --- a/drivers/hwmon/cros_ec_hwmon.c
> +++ b/drivers/hwmon/cros_ec_hwmon.c
> @@ -654,8 +654,8 @@ static int cros_ec_hwmon_resume(struct platform_device *pdev)
>  }
>  
>  static const struct platform_device_id cros_ec_hwmon_id[] = {
> -	{ DRV_NAME, 0 },
> -	{}
> +	{ .name = DRV_NAME },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(platform, cros_ec_hwmon_id);
>  
> -- 
> 2.47.3
> 
