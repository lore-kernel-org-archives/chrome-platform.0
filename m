Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11ED213BAFA
	for <chrome-platform@lists.linux.dev>; Thu, 26 Sep 2024 14:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727362105; cv=none; b=ZF+zRxJ72zMKbOoJmBQK2d6LBcAEDa0JAfiPYxtSTB6HHomZhUBeCzr3TQ+mHSIw33IhJfncE4kk+kz/1h2gd3DCZB0+6SM32UtVK75Uo2W5YDmdJvd6U1zMM6DoSzYcNnjnvF5KSe6K3GvzYWANcwZU3cPM0bz/mI2/cGUpcjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727362105; c=relaxed/simple;
	bh=M+XzZ7nnLUifFtSzgHO0NMUxOPUBrHR9RZqh7ZvU6yE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QpB9T3AFy1xWp7ADDZRYMMEFI2J2kK88MNrk+svMGh39uesTn9cb5A34XuPwDuLByyrMmsMIPukvEgBDgux8RKRXPjiVCD5MdjR2PcwvRNuVb+VHVhlyHuUn9OgVVxj7ICEBmCNFF6wTbwKLgegJ82Qm9+IifFWw1OkjKxAFp/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VoV3Hl2Q; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VoV3Hl2Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727362103; x=1758898103;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M+XzZ7nnLUifFtSzgHO0NMUxOPUBrHR9RZqh7ZvU6yE=;
  b=VoV3Hl2QHCwu/9l0PBsu4XX9mqmia4WHzOQ6iP5ubutRypN06k1jC2ZU
   jPA+Zk7q5+4wVxNA4aPnpabDMlSlqCxp5R2WVT8tGauMWccDJNMBXBYXm
   UimAULKmmqvvpEAW1+Z8h1XWMxlP0N25l37NcDA133OUKwEhmGvA7dbly
   P6tcY+DJasK8uhMSfr0c1+GQfp8HZHiSl2rpihGUHrIimUoujZx9NVKMM
   LXAEd840b2FTbdkLSE6nbB44w4aOrodEbhrKZQ2O7x5ZQMfKktJ5AbEEb
   E6qTPaeDhQDHrlRd01F+mdU9Fsgipzh9qp5Pyz4JblKQ3RbfDThdb1oCX
   A==;
X-CSE-ConnectionGUID: I2UjfDGAR2qcrGgXLhfb0Q==
X-CSE-MsgGUID: CfHIt+WUREC3mJ3k+3/9zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="30348883"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="30348883"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 07:48:22 -0700
X-CSE-ConnectionGUID: vx6LghjxTsOoW9x3ErR3Gw==
X-CSE-MsgGUID: EIbLKUf4TmK9YsnVoZKjRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="72178782"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa009.fm.intel.com with SMTP; 26 Sep 2024 07:48:19 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 26 Sep 2024 17:48:18 +0300
Date: Thu, 26 Sep 2024 17:48:18 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: tzungbi@kernel.org, jthies@google.com, pmalani@chromium.org,
	akuchynski@google.com, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/8] platform/chrome: cros_ec_typec: Update partner
 altmode active
Message-ID: <ZvV0Mj8WRVi2VUM-@kuha.fi.intel.com>
References: <20240925162513.435177-1-abhishekpandit@chromium.org>
 <20240925092505.5.I083bf9188947be8cb7460211cfdf3233370a28f6@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925092505.5.I083bf9188947be8cb7460211cfdf3233370a28f6@changeid>

On Wed, Sep 25, 2024 at 09:25:06AM -0700, Abhishek Pandit-Subedi wrote:
> Mux configuration is often the final piece of mode entry and can be used
> to determine whether a partner altmode is active. When mux configuration
> is done, use the active port altmode's SVID to set the partner active
> field for all partner alt modes.
> 
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> ---
> 
>  drivers/platform/chrome/cros_ec_typec.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> index 4d305876ec08..6c0228981627 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -618,6 +618,7 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
>  	};
>  	struct ec_params_usb_pd_mux_ack mux_ack;
>  	enum typec_orientation orientation;
> +	struct cros_typec_altmode_node *node, *n;
>  	int ret;
>  
>  	ret = cros_ec_cmd(typec->ec, 0, EC_CMD_USB_PD_MUX_INFO,
> @@ -676,6 +677,16 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
>  			port->mux_flags);
>  	}
>  
> +	/* Iterate all partner alt-modes and set the active alternate mode. */
> +	list_for_each_entry_safe(node, n, &port->partner_mode_list, list) {
> +		if (port->state.alt != NULL &&
> +		    node->amode->svid == port->state.alt->svid) {
> +			typec_altmode_update_active(node->amode, true);
> +		} else {
> +			typec_altmode_update_active(node->amode, false);
> +		}
> +	}

This can be done in the alt mode drivers.

thanks,

-- 
heikki
