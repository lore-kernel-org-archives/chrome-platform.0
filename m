Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F3C3B1EFE;
	Thu, 18 Jun 2026 08:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781772043; cv=none; b=tcyB9L0/4snvYHKSf+b95c8jw2Y2gIg4rygl3O9TsGgdvKv31lKpYmobk4N9RWocwX04ehuEUo4ImN8aeusX6rMkfd1TCFHk2U2kEJQ5m0SULeTjBxJXlKm8WrlfUDK5GjTMxIpOVsh/cGPFAQog3zXYOA+LU8ui+V+P/QAVlbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781772043; c=relaxed/simple;
	bh=m/x3t1EwXKfQnF8D/EE1mE91etARjfR2JAtKwz1Zc/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=INRxG1ReSuKx7vg3ajgY90Rv75HUR3fTN5LLzo4+bYzPE2H7FcM/eWi4Ymq2WQoE/cxpb07lMxJrwSSBsl8PHAN8knU2LUPETOyo1F4XtlSJcycKMnxWp1f7b7lkjtJdh0c0PkBFPb8XuQkWVzVV207OiE6fiFwkOlVYHU5MKho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CKZes8CG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CKZes8CG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B74681F000E9;
	Thu, 18 Jun 2026 08:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781772042;
	bh=ADKgt6OmdSQftpGxREjRImVRevD2+bK0DbWDcomubSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CKZes8CG/LSQ0WluKwo4Ghg1ex8VaBCxj//V79tIffnFeKGiCC5wt+NxDQphX6aHm
	 xctc971Y1H1+tkogyvTzjisyWN650oj3SE/XxkYWnxyiUpGjm5tR63u1yD7LF6X8rG
	 qpdq2xpPQYA1OgCqGOcNMesG68LHN9jSflrDX0hrzI4eaWXur2K3WsbpTmsyjQPznD
	 J9ur/XMt4oJeeH0nYXB0a+5A+l2QN8NIUi6eByImMSPLIflItpAHRX7mTDVIDvAXyn
	 8CFCz9g41pezqaZJsYRaCVg9uhIClPUqg+On8olG4Sf+ROTMCav/Wk1mIK3fmxt5c6
	 HLfEoE6xZzgUg==
Date: Thu, 18 Jun 2026 09:40:37 +0100
From: Lee Jones <lee@kernel.org>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Gwendal Grignou <gwendal@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mfd: cros_ec: Read EC features during probe to
 catch transfer error
Message-ID: <20260618084037.GA1672911@google.com>
References: <20260608211518.2214740-1-akuchynski@chromium.org>
 <20260608211518.2214740-3-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608211518.2214740-3-akuchynski@chromium.org>

On Mon, 08 Jun 2026, Andrei Kuchynski wrote:

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
> Fix this by explicitly calling the newly introduced cros_ec_read_features()
> function. If the transfer fails, abort the broken device initialization.
> Move the initialization of class_dev before this call to prevent a missing
> release() callback warning on the error path.
> 
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> ---
>  drivers/mfd/cros_ec_dev.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> index 39430dd44e30c..a8c6300248d59 100644
> --- a/drivers/mfd/cros_ec_dev.c
> +++ b/drivers/mfd/cros_ec_dev.c
> @@ -203,6 +203,17 @@ static int ec_device_probe(struct platform_device *pdev)
>  	ec->features.flags[1] = -1U; /* Not cached yet */
>  	device_initialize(&ec->class_dev);
>  
> +	/*
> +	 * Add the class device
> +	 */
> +	ec->class_dev.class = &cros_class;
> +	ec->class_dev.parent = dev;
> +	ec->class_dev.release = cros_ec_class_release;
> +
> +	retval = cros_ec_read_features(ec);

This depends on the other patch.

Once it's been Reviewed / Acked, I'd be happy to take both and submit an IB.

> +	if (retval < 0)
> +		goto failed;
> +
>  	for (i = 0; i < ARRAY_SIZE(cros_mcu_devices); i++) {
>  		/*
>  		 * Check whether this is actually a dedicated MCU rather
> @@ -220,13 +231,6 @@ static int ec_device_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	/*
> -	 * Add the class device
> -	 */
> -	ec->class_dev.class = &cros_class;
> -	ec->class_dev.parent = dev;
> -	ec->class_dev.release = cros_ec_class_release;
> -
>  	retval = dev_set_name(&ec->class_dev, "%s", ec_platform->ec_name);
>  	if (retval) {
>  		dev_err(dev, "dev_set_name failed => %d\n", retval);
> -- 
> 2.54.0.1032.g2f8565e1d1-goog
> 

-- 
Lee Jones
