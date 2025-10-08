Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FE72F746D
	for <chrome-platform@lists.linux.dev>; Wed,  8 Oct 2025 12:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759925427; cv=none; b=YvzC/MYgOb6s/TDcgmmmxa+GyilT0iOX7IMxLIhxUl0/M/vHcpEvbjgnm8ZPX0O8FWY8G/PB3FDwGWG8mi+iuLZ8pdkCJb+mAWuYI6fFIiqVnDEUbr00QIYTnepeBskIHQAPKKlg0Jlyumze5OFMYJCfwJiYWyh3DP3/hR+v0nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759925427; c=relaxed/simple;
	bh=0Og/Yv2H3UYrtZ3KU1pRcOJr3otOKEz6cpop2r3nnpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJu1CDoMurGfwqcxE6q4lcM0p0VnyvIZjQwkYCny/ENIwEdsEGi33m0XzBEHJJgTujviFZVNvYaM1cOMG4b3XUNqwYZCZxHkJ6Onej+z+9YYwxCW8uUYQXFJycz+NJL/jeWr9pf6Z7JBIzB/3+DZU4EWbFVCHxGRV66xlbJa5pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R7j9ED6w; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R7j9ED6w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759925425; x=1791461425;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0Og/Yv2H3UYrtZ3KU1pRcOJr3otOKEz6cpop2r3nnpQ=;
  b=R7j9ED6w/DgX0avUOCKEw3G7qz63LD1TzOMR4X895T/KAQn9UEzz57rT
   +w4kmixdS9VwLc0rZtdrgarHeHvdHSuyV6aIOfWhbbynZ7YaW9Jx9mug0
   EaUeWojRy7MecsWxG5VoU7n1w/3AqgjUrQKORQ2FU4QZKxMpulFym9BGc
   8ro6Euh0PrFBK0N1V0RkiB6tcL8pNh7tcs9lmsWF4i2kVBlePdjNO7/dJ
   WJt34ki9Kp5vLD7szamGyI5w4j4s7KNHsrNB9CiorhzRPuZhDKP8/iE4G
   aw/vz6kpcy76FdnOMRsVKHkkLOKIpTCd/ZcHqU3/4X8zMaoPl+9Q8n9mZ
   Q==;
X-CSE-ConnectionGUID: rMovdwVOTc+eQrSVBM19cQ==
X-CSE-MsgGUID: xkxvoq47SfGWroobn83s/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="72375315"
X-IronPort-AV: E=Sophos;i="6.19,323,1754982000"; 
   d="scan'208";a="72375315"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2025 05:10:25 -0700
X-CSE-ConnectionGUID: zCMM01epQqOAsrjnyC85Fg==
X-CSE-MsgGUID: wflDQcoZR7+Y2QBt5yi1Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,323,1754982000"; 
   d="scan'208";a="211370462"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO kuha.fi.intel.com) ([10.124.220.169])
  by fmviesa001.fm.intel.com with SMTP; 08 Oct 2025 05:10:20 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 08 Oct 2025 15:10:19 +0300
Date: Wed, 8 Oct 2025 15:10:19 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Jameson Thies <jthies@google.com>
Cc: akuchynski@chromium.org, abhishekpandit@chromium.org,
	krzk+dt@kernel.org, robh@kernel.org, bleung@chromium.org,
	ukaszb@chromium.org, tzungbi@kernel.org, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] mfd: cros_ec: Don't add cros_ec_ucsi if it is
 defined in OF or ACPI
Message-ID: <aOZUq6K8bZtciL6Q@kuha.fi.intel.com>
References: <20251001193346.1724998-1-jthies@google.com>
 <20251001193346.1724998-4-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001193346.1724998-4-jthies@google.com>

On Wed, Oct 01, 2025 at 07:33:43PM +0000, Jameson Thies wrote:
> On devices with a UCSI PPM in the EC, check for cros_ec_ucsi to be
> defined in the OF device tree or an ACPI node. If it is defined by
> either OF or ACPI, it does not need to be added as a subdevice of
> cros_ec_dev.
> 
> Signed-off-by: Jameson Thies <jthies@google.com>
> ---
>  drivers/mfd/cros_ec_dev.c | 40 ++++++++++++++++++++++++++++++++++-----
>  1 file changed, 35 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> index dc80a272726b..b0523f6541d2 100644
> --- a/drivers/mfd/cros_ec_dev.c
> +++ b/drivers/mfd/cros_ec_dev.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2014 Google, Inc.
>   */
>  
> +#include <linux/acpi.h>
>  #include <linux/dmi.h>
>  #include <linux/kconfig.h>
>  #include <linux/mfd/core.h>
> @@ -131,11 +132,6 @@ static const struct cros_feature_to_cells cros_subdevices[] = {
>  		.mfd_cells	= cros_ec_rtc_cells,
>  		.num_cells	= ARRAY_SIZE(cros_ec_rtc_cells),
>  	},
> -	{
> -		.id		= EC_FEATURE_UCSI_PPM,
> -		.mfd_cells	= cros_ec_ucsi_cells,
> -		.num_cells	= ARRAY_SIZE(cros_ec_ucsi_cells),
> -	},
>  	{
>  		.id		= EC_FEATURE_HANG_DETECT,
>  		.mfd_cells	= cros_ec_wdt_cells,
> @@ -177,6 +173,16 @@ static const struct mfd_cell cros_ec_vbc_cells[] = {
>  	{ .name = "cros-ec-vbc", }
>  };
>  
> +static int ucsi_acpi_match(struct device *dev, const void *data)
> +{
> +	struct acpi_device_id ucsi_acpi_device_ids[] = {
> +		{ "GOOG0021", 0 },
> +		{"", 0},
> +	};
> +	return !!acpi_match_device(ucsi_acpi_device_ids, dev);
> +}
> +
> +
>  static void cros_ec_class_release(struct device *dev)
>  {
>  	kfree(to_cros_ec_dev(dev));
> @@ -264,6 +270,30 @@ static int ec_device_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	/*
> +	 * FW nodes can load cros_ec_ucsi, but early PDC devices did not define
> +	 * the required nodes. On PDC systems without FW nodes for cros_ec_ucsi,
> +	 * the driver should be added as an mfd subdevice.
> +	 */
> +	if (cros_ec_check_features(ec, EC_FEATURE_USB_PD) &&
> +	    cros_ec_check_features(ec, EC_FEATURE_UCSI_PPM)) {
> +		struct device *acpi_dev = device_find_child(ec->ec_dev->dev,
> +							    NULL,
> +							    ucsi_acpi_match);
> +
> +		if (!!acpi_dev) {
> +			put_device(acpi_dev);

If you are not using that for anything, then couldn't you just use
acpi_dev_found("GOOG0021") ?

Can there be multiple UCSI interfaces on these systems?

thanks,

> +		} else if (!of_find_compatible_node(NULL, NULL,
> +						    "google,cros-ec-ucsi")) {
> +			retval = mfd_add_hotplug_devices(
> +				ec->dev, cros_ec_ucsi_cells,
> +				ARRAY_SIZE(cros_ec_ucsi_cells));
> +			if (retval)
> +				dev_warn(ec->dev,
> +				    "failed to add cros_ec_ucsi: %d\n", retval);
> +		}
> +	}
> +
>  	/*
>  	 * UCSI provides power supply information so we don't need to separately
>  	 * load the cros_usbpd_charger driver.
> -- 
> 2.51.0.618.g983fd99d29-goog

-- 
heikki
