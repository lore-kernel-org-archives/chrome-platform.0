Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2FE153BF0
	for <chrome-platform@lists.linux.dev>; Mon, 21 Jul 2025 05:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753076871; cv=none; b=ts9acQKj67xBjT3jCqZ0WLP/oWoz7dPaGVo6ichR9Vsbm8e0T7hvQld1waqEneQ8imUviictIkpLGn+jKMCgQhP75sFx1xcYhaU19KKsT1NL+TXRI1NA2L6FQ1yi3u2RhCqD5TxHkAaeSgcSX+rMKX6q1FtSz7ZC+XO4BaXh9MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753076871; c=relaxed/simple;
	bh=k9Ih+8hEpTTNEr3993Tj0e45hZvFuo09eoEDFHxwUCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WU6Ow6/UFeOhG4yLxBfYpUlqY2JGlY5BUCIXzY8BBsLXXyRqrT/qZ5APcpc+hjzAfdwJEVN/LLsvR3LxkQ1qYx7v9O3JoSR4u+2HaSUqXYF86WhRf+WJ2rowD8drpRLK0pU8lfpHyo+bfgM1VkpAYHRDcw4Wh4noh68KJGURiDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GnuhFByJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GnuhFByJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 728F0C4CEF1;
	Mon, 21 Jul 2025 05:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753076870;
	bh=k9Ih+8hEpTTNEr3993Tj0e45hZvFuo09eoEDFHxwUCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GnuhFByJw7tNDSlcnr6pSJW5BElwlZGAsojG1qy23TFAuN/NHb98WbVIfG0gOnUCI
	 YsrVCt/J7C7NqEnMR5U2zsvbPHKLDeggU1UBXNi7TI68THD7h7PVCVNtXZA0uwlrB6
	 bX1qvvJKD0QDCYmNMdn/XyWcYhlER85ihvPhjaXc=
Date: Mon, 21 Jul 2025 07:47:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, dawidn@google.com, chrome-platform@lists.linux.dev
Subject: Re: [PATCH v3 4/8] platform/chrome: Disallow sending commands
 through unregistered ec_dev
Message-ID: <2025072109-grafting-exemption-6f59@gregkh>
References: <20250721044456.2736300-1-tzungbi@kernel.org>
 <20250721044456.2736300-5-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721044456.2736300-5-tzungbi@kernel.org>

On Mon, Jul 21, 2025 at 04:44:52AM +0000, Tzung-Bi Shih wrote:
> Return earlier if attempting to send commands through an unregistered
> struct cros_ec_device.

Why would it ever be "uregistered"?

> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> Changes from v2 (https://patchwork.kernel.org/project/chrome-platform/patch/20250708080034.3425427-4-tzungbi@kernel.org/):
> - Use atomic_t for `registered` so that it doesn't need to be handled with
>   locks.
> - Add new helper function cros_ec_device_registered().
> 
>  drivers/platform/chrome/cros_ec.c           |  5 +++++
>  drivers/platform/chrome/cros_ec_proto.c     | 17 +++++++++++++++++
>  include/linux/platform_data/cros_ec_proto.h |  4 ++++
>  3 files changed, 26 insertions(+)
> 
> diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
> index fd58781a2fb7..42512e2b4f65 100644
> --- a/drivers/platform/chrome/cros_ec.c
> +++ b/drivers/platform/chrome/cros_ec.c
> @@ -9,6 +9,7 @@
>   * battery charging and regulator control, firmware update.
>   */
>  
> +#include <linux/atomic.h>
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/of_platform.h>
> @@ -200,6 +201,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
>  	if (!ec_dev->dout)
>  		return -ENOMEM;
>  
> +	atomic_set(&ec_dev->registered, 1);
>  	lockdep_register_key(&ec_dev->lockdep_key);
>  	mutex_init(&ec_dev->lock);
>  	lockdep_set_class(&ec_dev->lock, &ec_dev->lockdep_key);
> @@ -300,6 +302,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
>  
>  	return 0;
>  exit:
> +	atomic_set(&ec_dev->registered, 0);
>  	platform_device_unregister(ec_dev->ec);
>  	platform_device_unregister(ec_dev->pd);
>  	mutex_destroy(&ec_dev->lock);
> @@ -318,6 +321,8 @@ EXPORT_SYMBOL(cros_ec_register);
>   */
>  void cros_ec_unregister(struct cros_ec_device *ec_dev)
>  {
> +	atomic_set(&ec_dev->registered, 0);
> +
>  	if (ec_dev->mkbp_event_supported)
>  		blocking_notifier_chain_unregister(&ec_dev->event_notifier,
>  						   &ec_dev->notifier_ready);
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index 3e94a0a82173..ee3050ffe226 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -3,6 +3,7 @@
>  //
>  // Copyright (C) 2015 Google, Inc
>  
> +#include <linux/atomic.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/limits.h>
> @@ -656,6 +657,11 @@ int cros_ec_cmd_xfer(struct cros_ec_device *ec_dev, struct cros_ec_command *msg)
>  {
>  	int ret;
>  
> +	if (!cros_ec_device_registered(ec_dev)) {
> +		dev_err(ec_dev->dev, "unregistered ec_dev; cannot send command\n");
> +		return -ENODEV;
> +	}
> +
>  	mutex_lock(&ec_dev->lock);
>  	if (ec_dev->proto_version == EC_PROTO_VERSION_UNKNOWN) {
>  		ret = cros_ec_query_all(ec_dev);
> @@ -1153,5 +1159,16 @@ int cros_ec_get_cmd_versions(struct cros_ec_device *ec_dev, u16 cmd)
>  }
>  EXPORT_SYMBOL_GPL(cros_ec_get_cmd_versions);
>  
> +/**
> + * cros_ec_device_registered - Check if the ec_dev is registered.
> + *
> + * @ec_dev: EC device
> + */
> +bool cros_ec_device_registered(struct cros_ec_device *ec_dev)
> +{
> +	return atomic_read(&ec_dev->registered) == 1;
> +}
> +EXPORT_SYMBOL_GPL(cros_ec_device_registered);

This isn't going to do what you think it does :(

Hint, the state can change right after you call this, making it
pointless.

If you really need this (and huge hint, I do not think you do, as
something must be wrong if you ever need it), use a lock properly, not
just an atomic value, as that doesn't work here at all, and is kind of
pointless.

So step back, what exactly is the problem here that you are trying to
solve with this?

thanks,

greg k-h
