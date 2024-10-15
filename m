Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16ED1B3958
	for <chrome-platform@lists.linux.dev>; Tue, 15 Oct 2024 17:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729012556; cv=none; b=Q7wPQn35OuamDQpcggrsqE7Nifr5zWdphw7tNLhAa28fBDc1Xn+rIcA/LXBqYFmPAdNb/EwNieilCMrrnRgub6mto7mwWs0po5YoCHssvhdpLzN2uU9DiD7LD2nSUQ15f/GxxIkudaoNqlziuadspZkUQ1lAsuKz3GGADchn2gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729012556; c=relaxed/simple;
	bh=+/+0BhPojIHFNgOforTl89snsfDQj6+V5T2edsFQXrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FdZcY35rcI4UIhQykr3DjDRT92nO+k6Q2an098GT+plz9ya9V/2r7IMIYmW05rI8GQ9Y9dYhntsUucolZU/S7dV5tcEB4GtzW/+kxWpvIotk9AcrdssjrE+TCHDd0BS+kWnYaWF00jBK6TfUXI2s7+CWqHcfM+HI+eRQsFH2/gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qkDPvTdQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qkDPvTdQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF3C8C4CEC6;
	Tue, 15 Oct 2024 17:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729012556;
	bh=+/+0BhPojIHFNgOforTl89snsfDQj6+V5T2edsFQXrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qkDPvTdQIqOHaa4/d8NLC2scmIvPkzEMlKOPRoV+5/nxwju+LCCAavg3WR2Ty5Oll
	 GgNwExP941H17XOBughLqgsPr0nIHV7qsXqTzhCwOZDMaASIaiiWliQUzY8v0WTkuB
	 BOnEG6oA1CP0wXN9JEsmV8PzjA/R8KP8trRV5+IM=
Date: Tue, 15 Oct 2024 19:15:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yuan Can <yuancan@huawei.com>
Cc: tzungbi@kernel.org, briannorris@chromium.org, jwerner@chromium.org,
	adurbin@chromium.org, furquan@chromium.org, rajatja@chromium.org,
	groeck@chromium.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH] firmware: google: Unregister driver_info on failure
Message-ID: <2024101544-defender-rename-4607@gregkh>
References: <20241015131344.20272-1-yuancan@huawei.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015131344.20272-1-yuancan@huawei.com>

On Tue, Oct 15, 2024 at 09:13:44PM +0800, Yuan Can wrote:
> When platform_device_register_full() returns error, the gsmi_init() returns
> without unregister gsmi_driver_info, fix by add missing
> platform_driver_unregister() when platform_device_register_full() failed.
> 
> Fixes: 8942b2d5094b ("gsmi: Add GSMI commands to log S0ix info")
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---
>  drivers/firmware/google/gsmi.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/google/gsmi.c b/drivers/firmware/google/gsmi.c
> index d304913314e4..24e666d5c3d1 100644
> --- a/drivers/firmware/google/gsmi.c
> +++ b/drivers/firmware/google/gsmi.c
> @@ -918,7 +918,8 @@ static __init int gsmi_init(void)
>  	gsmi_dev.pdev = platform_device_register_full(&gsmi_dev_info);
>  	if (IS_ERR(gsmi_dev.pdev)) {
>  		printk(KERN_ERR "gsmi: unable to register platform device\n");
> -		return PTR_ERR(gsmi_dev.pdev);
> +		ret = PTR_ERR(gsmi_dev.pdev);
> +		goto out_unregister;
>  	}
>  
>  	/* SMI access needs to be serialized */
> @@ -1056,10 +1057,11 @@ static __init int gsmi_init(void)
>  	gsmi_buf_free(gsmi_dev.name_buf);
>  	kmem_cache_destroy(gsmi_dev.mem_pool);
>  	platform_device_unregister(gsmi_dev.pdev);
> -	pr_info("gsmi: failed to load: %d\n", ret);
> +out_unregister:
>  #ifdef CONFIG_PM
>  	platform_driver_unregister(&gsmi_driver_info);
>  #endif
> +	pr_info("gsmi: failed to load: %d\n", ret);
>  	return ret;
>  }
>  
> -- 
> 2.17.1
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
