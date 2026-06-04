Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CB5399019;
	Thu,  4 Jun 2026 15:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780588673; cv=none; b=sgjibbOFUvEj6a8hujRFKlE8T2yI/eMTXKNiiaNTmM7DlKFzlmXvC5v2cWdKBDeAxw31vPr0kg3QflaYB/jo5NbvCBnzx+W55SpkyxmKGNiZbZW062O+5DBe2uTbECe28yk5uf/pN+05eCUYAkEr5tFYplLgpzwDCZVU4rMAuF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780588673; c=relaxed/simple;
	bh=zPKtyGpXBuPx9YHH/6tBiBkRXI2sosBIMDgW+cqO+MU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R0pDLD9F3wDj2Y85sNWKggasUdWEIkmRp0kzVNIa2ceT6AigPQc4k4U9dFsCboukm62CsIwPWnCeEuEZUpghrhv7rbVv3BK3JTLo5r9LrH4HDsy/oQkWZokeVHGhwRxzW2JLQ50sT8wcXgCUN4WLWlyX9Dt7KIyxukJ1huHoAyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=USMfdf/9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="USMfdf/9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2321C1F00893;
	Thu,  4 Jun 2026 15:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780588671;
	bh=xU327mW5XOolwwnrKvFWmoR+5KZN6sah8v65izgcDIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=USMfdf/9NCdA0zkwydATA0HL73WCiHWVU1p7FnLrSM8B8c4XkLkKUCJadFeo17TwS
	 Xuf+ntaFCZd4mKuKEF24CfmYAofUuH8xSq8Sh98X34PF7LzoH1asIWSx11Cr9n/sbP
	 BEs/Ta5l/hHqYdxTvFvwakVIV6psMvn2tRRQ5E8Emea1NVnMaqfWosSSOBD97JcuJ/
	 WZmhidOM85gk+nCy7Sjk3hyU5KeEFomRGdGvHGPO9R6mnxUCwYO8ELaEdrUIk8Gdjs
	 YIS943w03KzF+ANlheyaXvxlp1UDdXKXBFpuh7gt0aQTdbker10W6FFpbUQf0rgam2
	 EXYKL0KxenqFQ==
Date: Thu, 4 Jun 2026 16:57:47 +0100
From: Lee Jones <lee@kernel.org>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Gwendal Grignou <gwendal@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: cros_ec: Read EC features during probe to catch
 transfer error
Message-ID: <20260604155747.GD4151951@google.com>
References: <20260522154456.1448170-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522154456.1448170-1-akuchynski@chromium.org>

On Fri, 22 May 2026, Andrei Kuchynski wrote:

> cros_ec_check_features() does not return an error if the underlying
> EC_CMD_GET_FEATURES command fails. Consequently, when the Fingerprint
> device fails to respond, the probe function ignores the failure and falls
> back to installing it as 'cros_ec' device instead of 'cros_fp'.
> This leads to a sysfs duplicate filename collision later when the real
> 'cros_ec' device attempts to register:
> 
>   cros-ec-spi spi5.0: EC failed to respond in time
>   cros-ec-dev.19.auto: cannot get EC features: -110
>   sysfs : cannot create duplicate filename '/class/chromeos/cros_ec'
>         : sysfs_do_create_link_sd+0x94/0xdc
>         : ec_device_probe+0x150/0x4f0
> 
> Fix this by extracting the feature reading logic into a new helper function
> cros_ec_read_features() and calling it during ec_device_probe().
> If the transfer fails, abort the broken device initialization.

You're doing 2 things here.  Move the function first, then add the new
call into MFD in a subsequent patch.

> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> ---
>  drivers/mfd/cros_ec_dev.c                   |  4 +++
>  drivers/platform/chrome/cros_ec_proto.c     | 30 +++++++++++++++------
>  include/linux/platform_data/cros_ec_proto.h |  2 ++
>  3 files changed, 28 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> index 39430dd44e30c..7810b1c871849 100644
> --- a/drivers/mfd/cros_ec_dev.c
> +++ b/drivers/mfd/cros_ec_dev.c
> @@ -203,6 +203,10 @@ static int ec_device_probe(struct platform_device *pdev)
>  	ec->features.flags[1] = -1U; /* Not cached yet */
>  	device_initialize(&ec->class_dev);
>  
> +	retval = cros_ec_read_features(ec);
> +	if (retval < 0)
> +		return retval;

You just leaked ec->class_dev.

	goto failed;  ?

> +
>  	for (i = 0; i < ARRAY_SIZE(cros_mcu_devices); i++) {
>  		/*
>  		 * Check whether this is actually a dedicated MCU rather
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index 1d8d9168ec1aa..724d1313f6b21 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -946,6 +946,27 @@ u32 cros_ec_get_host_event(struct cros_ec_device *ec_dev)
>  }
>  EXPORT_SYMBOL(cros_ec_get_host_event);
>  
> +/**
> + * cros_ec_read_features() - Read EC features
> + *
> + * @ec: EC device.
> + *
> + * Return: >= 0 on success, negative error number on failure.
> + */
> +int cros_ec_read_features(struct cros_ec_dev *ec)
> +{
> +	int ret = cros_ec_cmd(ec->ec_dev, 0, EC_CMD_GET_FEATURES + ec->cmd_offset,
> +			      NULL, 0, &ec->features, sizeof(ec->features));
> +
> +	if (ret < 0) {
> +		dev_warn(ec->dev, "cannot get EC features: %d\n", ret);
> +		memset(&ec->features, 0, sizeof(ec->features));
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(cros_ec_read_features);
> +
>  /**
>   * cros_ec_check_features() - Test for the presence of EC features
>   *
> @@ -960,17 +981,10 @@ EXPORT_SYMBOL(cros_ec_get_host_event);
>  bool cros_ec_check_features(struct cros_ec_dev *ec, int feature)
>  {
>  	struct ec_response_get_features *features = &ec->features;
> -	int ret;
>  
>  	if (features->flags[0] == -1U && features->flags[1] == -1U) {
>  		/* features bitmap not read yet */
> -		ret = cros_ec_cmd(ec->ec_dev, 0, EC_CMD_GET_FEATURES + ec->cmd_offset,
> -				  NULL, 0, features, sizeof(*features));
> -		if (ret < 0) {
> -			dev_warn(ec->dev, "cannot get EC features: %d\n", ret);
> -			memset(features, 0, sizeof(*features));
> -		}
> -
> +		cros_ec_read_features(ec);
>  		dev_dbg(ec->dev, "EC features %08x %08x\n",
>  			features->flags[0], features->flags[1]);
>  	}
> diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
> index 6ed1c4c5ce2ef..a1ccecf5e1f83 100644
> --- a/include/linux/platform_data/cros_ec_proto.h
> +++ b/include/linux/platform_data/cros_ec_proto.h
> @@ -271,6 +271,8 @@ int cros_ec_get_next_event(struct cros_ec_device *ec_dev,
>  
>  u32 cros_ec_get_host_event(struct cros_ec_device *ec_dev);
>  
> +int cros_ec_read_features(struct cros_ec_dev *ec);
> +
>  bool cros_ec_check_features(struct cros_ec_dev *ec, int feature);
>  
>  int cros_ec_get_sensor_count(struct cros_ec_dev *ec);
> -- 
> 2.54.0.746.g67dd491aae-goog
> 

-- 
Lee Jones
