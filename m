Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F541A262F
	for <chrome-platform@lists.linux.dev>; Wed, 11 Sep 2024 13:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726060889; cv=none; b=ZrRUHUjM1K+ZjZEbsYLDLO5GrP8QiHHuh/ofZMEkLVlemQsqDawAYGlTYChKhbH/vFRIvI84T4oNr90+R1O94LDgD6VZ1UO+KFRn+Z1SV5aQToAUa++bLZE7p/UzDqW76LReqnqS91XvC87I94oxIbVoD4VmCWcYvpBKFDm4D8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726060889; c=relaxed/simple;
	bh=YQJ6Q/SuDS1rt4A1MRZokmYCYXRQSyj/hIhnwZJeLqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aj92Mo6/jyhDV5XKNorsB6p0LV7f95Xs0FJiP8mq8AYtls6FSahtY2uPpO6Va9RU+1t/BWrQSBJrZb/WgDif5bFE0CuIAoQ6G07LySZkNcA+lej99aACvbyN8Nv0shjgDa/OcX6HUu4bPMeFkrHPuWdMLFqvLCHWl9XxnfeUX50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bDiSBcbm; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bDiSBcbm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726060887; x=1757596887;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=YQJ6Q/SuDS1rt4A1MRZokmYCYXRQSyj/hIhnwZJeLqI=;
  b=bDiSBcbmNndSN2/OHDNayjYfewhEKWZqjrjcR2Un/MqPZOi1rNsRRoGE
   P/bxC/iFq//cfNGhFJLt2v4ShTJf7yeJwLsAQRC7huAdmM+emPj4/Usnu
   RPEetdEjIJ9B0bFJ3nqi7Th1dhNBgf5z/asagxZsnRhlDyI0h0Ng9CgPa
   7V2s9D2RnN15x5anlLQMHWv0S7BMn7qUKTeVpAfNRWuJ68TUtjWsyWBIi
   xigxGatA0Xy2gN5Ot0GNdHfw9efICowpmzAc1bwNCrvzTpDEBeZU59zMe
   0rsldAxB6n9uwKCO4JwE1bPh7ejcl8g75L3NwyxI3yMA4Qn5eTktJf7R3
   A==;
X-CSE-ConnectionGUID: hBKrAqykRneptcemzj9JVw==
X-CSE-MsgGUID: bhA7BRHMTIiSFgSkurjCng==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="28746254"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="28746254"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 06:21:00 -0700
X-CSE-ConnectionGUID: TrIKwP4URDKeZAAJQhCmKg==
X-CSE-MsgGUID: TlCTBzDkS/GESQelI6SmSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="90640397"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmviesa002.fm.intel.com with SMTP; 11 Sep 2024 06:20:56 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 11 Sep 2024 16:20:55 +0300
Date: Wed, 11 Sep 2024 16:20:55 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v6 4/8] usb: typec: cros_ec_ucsi: Use complete instead of
 resume
Message-ID: <ZuGZNyJkIreUhoc0@kuha.fi.intel.com>
References: <20240910101527.603452-1-ukaszb@chromium.org>
 <20240910101527.603452-5-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240910101527.603452-5-ukaszb@chromium.org>

Hi Łukasz,

On Tue, Sep 10, 2024 at 10:15:23AM +0000, Łukasz Bartosik wrote:
> From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> 
> On platforms using cros_ec_lpc, resume is split into .resume_early and
> .complete. To avoid missing EC events, use .complete to schedule work
> when resuming.
> 
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
> ---
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> index 20e608097fc6..422b3b14028c 100644
> --- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> +++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> @@ -241,15 +241,18 @@ static int __maybe_unused cros_ucsi_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int __maybe_unused cros_ucsi_resume(struct device *dev)
> +static void __maybe_unused cros_ucsi_complete(struct device *dev)
>  {
>  	struct cros_ucsi_data *udata = dev_get_drvdata(dev);
> -
> -	return ucsi_resume(udata->ucsi);
> +	ucsi_resume(udata->ucsi);
>  }
>  
> -static SIMPLE_DEV_PM_OPS(cros_ucsi_pm_ops, cros_ucsi_suspend,
> -			 cros_ucsi_resume);
> +static const struct dev_pm_ops cros_ucsi_pm_ops = {
> +#ifdef CONFIG_PM_SLEEP
> +	.suspend = cros_ucsi_suspend,
> +	.complete = cros_ucsi_complete,
> +#endif
> +};
>  
>  static const struct platform_device_id cros_ucsi_id[] = {
>  	{ KBUILD_MODNAME, 0 },

Please merge this into the previous patch.

thanks,

-- 
heikki
