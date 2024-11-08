Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8471E47A1
	for <chrome-platform@lists.linux.dev>; Fri,  8 Nov 2024 11:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731066115; cv=none; b=mCK/Q+qoF3o6po9RU5r7m11glqRZeGPeiBJJAMm5r0oc6IA3WeCspNHuXeHnSp6g1sSfngvAkltcEajB3xve3NLWTvT9i9SF5FyHmzeY1VnpMiCaEXL/LMP24qfYRUQ6lgYaFnoTlpIwD/MbqCX/yV552NUmu5p0MA0D+IOcKxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731066115; c=relaxed/simple;
	bh=TXkIOp3uyndyYEvkJuBG+geJwUkD2tQM/QMtnBrWWOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aWDG8XKyhVlyH1w4+5Qmedg1VdNsERiI+oElewEcimGsaYtlkQ9OsOFHj3X0J7xOgEzKirXCfm1hqVYCJSwme2PUrxE8AymTz2xPJFFqro0YXUDkluv5Cb2q7ZF/1+QeohzJeL/MJc4cduKSZLm3g7wEQWWHxggEdw6dgM9pQb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gMWo1Hiu; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gMWo1Hiu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731066110; x=1762602110;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TXkIOp3uyndyYEvkJuBG+geJwUkD2tQM/QMtnBrWWOY=;
  b=gMWo1HiuNLoFzgA4a00C1bBgXuT+C2avHQCw7YhdIFwrOGuFVkHeOFO5
   hPj+zbXhuFWhwX6ZbGHfY/rtL0RPqxedCDekdVw6jl7kjPdZSwFYaynK0
   QHEc659AzLWqHGenTR9ZtRiNWx93lkOzvU1yw8LzoQxuzXJvavBInFKah
   kk+K2sHdsgn1QPrsDvYeCne6EfqT8swVH0qyu7ZLgtZbW/O57bWhMSIUx
   chM8CENgHjkAJeaJXaXNnRYvRGX8Nw7u5DjcRa9SIVDJSABy3hf9VXHZo
   ivtaPmd3AMmyv7iqafEd0lOrSmfE4Yei5mrt7DVX67VlSdTpEUWAsDPUb
   w==;
X-CSE-ConnectionGUID: Fu0d2R6PRc2EadsQrV9f7Q==
X-CSE-MsgGUID: XEqQZ0HwSgiDCsOQSxNS3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="30831452"
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="30831452"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 03:41:50 -0800
X-CSE-ConnectionGUID: JDD+C71jRSyE5UvjICiUiw==
X-CSE-MsgGUID: wtSH8iCNQliNxB3KdiB8CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="123041995"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa001.jf.intel.com with SMTP; 08 Nov 2024 03:41:46 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 08 Nov 2024 13:41:44 +0200
Date: Fri, 8 Nov 2024 13:41:44 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: tzungbi@kernel.org, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev, jthies@google.com,
	akuchynski@google.com, pmalani@chromium.org,
	dmitry.baryshkov@linaro.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/7] usb: typec: Only use SVID for matching altmodes
Message-ID: <Zy34-G0uOUyA6EQc@kuha.fi.intel.com>
References: <20241107193021.2690050-1-abhishekpandit@chromium.org>
 <20241107112955.v3.1.Ie0d37646f18461234777d88b4c3e21faed92ed4f@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107112955.v3.1.Ie0d37646f18461234777d88b4c3e21faed92ed4f@changeid>

On Thu, Nov 07, 2024 at 11:29:54AM -0800, Abhishek Pandit-Subedi wrote:
> Mode in struct typec_altmode is used to indicate the index of the
> altmode on a port, partner or plug. It is used in enter mode VDMs but
> doesn't make much sense for matching against altmode drivers or for
> matching partner to port altmodes.
> 
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> 
> Changes in v3:
> - Removed mode from altmode device ids
> - Updated modalias for typecd bus to remove mode
> - Re-ordered to start of series
> 
> Changes in v2:
> - Update altmode_match to ignore mode entirely
> - Also apply the same behavior to typec_match
> 
>  drivers/usb/typec/altmodes/displayport.c | 2 +-
>  drivers/usb/typec/altmodes/nvidia.c      | 2 +-
>  drivers/usb/typec/bus.c                  | 6 ++----
>  drivers/usb/typec/class.c                | 4 ++--
>  scripts/mod/devicetable-offsets.c        | 1 -
>  scripts/mod/file2alias.c                 | 4 +---
>  6 files changed, 7 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> index 2f03190a9873..3245e03d59e6 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -791,7 +791,7 @@ void dp_altmode_remove(struct typec_altmode *alt)
>  EXPORT_SYMBOL_GPL(dp_altmode_remove);
>  
>  static const struct typec_device_id dp_typec_id[] = {
> -	{ USB_TYPEC_DP_SID, USB_TYPEC_DP_MODE },
> +	{ USB_TYPEC_DP_SID },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(typec, dp_typec_id);
> diff --git a/drivers/usb/typec/altmodes/nvidia.c b/drivers/usb/typec/altmodes/nvidia.c
> index fe70b36f078f..2b77d931e494 100644
> --- a/drivers/usb/typec/altmodes/nvidia.c
> +++ b/drivers/usb/typec/altmodes/nvidia.c
> @@ -24,7 +24,7 @@ static void nvidia_altmode_remove(struct typec_altmode *alt)
>  }
>  
>  static const struct typec_device_id nvidia_typec_id[] = {
> -	{ USB_TYPEC_NVIDIA_VLINK_SID, TYPEC_ANY_MODE },
> +	{ USB_TYPEC_NVIDIA_VLINK_SID },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(typec, nvidia_typec_id);
> diff --git a/drivers/usb/typec/bus.c b/drivers/usb/typec/bus.c
> index aa879253d3b8..ae90688d23e4 100644
> --- a/drivers/usb/typec/bus.c
> +++ b/drivers/usb/typec/bus.c
> @@ -454,8 +454,7 @@ static int typec_match(struct device *dev, const struct device_driver *driver)
>  	const struct typec_device_id *id;
>  
>  	for (id = drv->id_table; id->svid; id++)
> -		if (id->svid == altmode->svid &&
> -		    (id->mode == TYPEC_ANY_MODE || id->mode == altmode->mode))
> +		if (id->svid == altmode->svid)
>  			return 1;
>  	return 0;
>  }
> @@ -470,8 +469,7 @@ static int typec_uevent(const struct device *dev, struct kobj_uevent_env *env)
>  	if (add_uevent_var(env, "MODE=%u", altmode->mode))
>  		return -ENOMEM;
>  
> -	return add_uevent_var(env, "MODALIAS=typec:id%04Xm%02X",
> -			      altmode->svid, altmode->mode);
> +	return add_uevent_var(env, "MODALIAS=typec:id%04X", altmode->svid);
>  }
>  
>  static int typec_altmode_create_links(struct altmode *alt)
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 4b3047e055a3..febe453b96be 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -237,13 +237,13 @@ static int altmode_match(struct device *dev, void *data)
>  	if (!is_typec_altmode(dev))
>  		return 0;
>  
> -	return ((adev->svid == id->svid) && (adev->mode == id->mode));
> +	return (adev->svid == id->svid);
>  }
>  
>  static void typec_altmode_set_partner(struct altmode *altmode)
>  {
>  	struct typec_altmode *adev = &altmode->adev;
> -	struct typec_device_id id = { adev->svid, adev->mode, };
> +	struct typec_device_id id = { adev->svid };
>  	struct typec_port *port = typec_altmode2port(adev);
>  	struct altmode *partner;
>  	struct device *dev;
> diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
> index 9c7b404defbd..d3d00e85edf7 100644
> --- a/scripts/mod/devicetable-offsets.c
> +++ b/scripts/mod/devicetable-offsets.c
> @@ -237,7 +237,6 @@ int main(void)
>  
>  	DEVID(typec_device_id);
>  	DEVID_FIELD(typec_device_id, svid);
> -	DEVID_FIELD(typec_device_id, mode);
>  
>  	DEVID(tee_client_device_id);
>  	DEVID_FIELD(tee_client_device_id, uuid);
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index c4cc11aa558f..218ccb7150bf 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -1343,14 +1343,12 @@ static int do_tbsvc_entry(const char *filename, void *symval, char *alias)
>  	return 1;
>  }
>  
> -/* Looks like: typec:idNmN */
> +/* Looks like: typec:idN */
>  static int do_typec_entry(const char *filename, void *symval, char *alias)
>  {
>  	DEF_FIELD(symval, typec_device_id, svid);
> -	DEF_FIELD(symval, typec_device_id, mode);
>  
>  	sprintf(alias, "typec:id%04X", svid);
> -	ADD(alias, "m", mode != TYPEC_ANY_MODE, mode);
>  
>  	return 1;
>  }
> -- 
> 2.47.0.277.g8800431eea-goog

-- 
heikki
