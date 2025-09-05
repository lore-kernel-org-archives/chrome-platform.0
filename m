Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57B025C81B
	for <chrome-platform@lists.linux.dev>; Fri,  5 Sep 2025 10:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757068477; cv=none; b=kECHmWRqrh6wzY+EwrpNraqFfIKYvyz7x/xNVzbO0bjNr+qNlrwHkTNbsOczi7tcA/gTmLpHEcaW+8OlprwoHcTfE8bnpr/m1A0hR8LYhfkvNM9ZodIKH0ukZFU1dgcxOwfA53aoF5rp08HZBaOvImfYqa5rF+hmffK0mbXpIQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757068477; c=relaxed/simple;
	bh=krtE/M/T6FVFzWIDNJaaKaN0GxdmejHYr6+16ZgJbhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bv/OjcZfNdxICrpprHYkXSUTYf4BK7yYCskP9MNi5vOxPZoXfwzz4qTmeonLma52uEjhkqvRY3BIMorrxUlzdld4xYgOdAFjRw9ggIqMMkkbCw7bzhWxE2npEjgKpMfxJ3BQedpF7XleLC0IwSKP99H/um9zg83N4QZ49lXFa1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RSdGNeyd; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RSdGNeyd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757068475; x=1788604475;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=krtE/M/T6FVFzWIDNJaaKaN0GxdmejHYr6+16ZgJbhY=;
  b=RSdGNeyd7ysM2SwvX03PqB88rNVXNogVFJ2yFKpFEXtOg8R5WUvF3t9e
   hqrScNVf8TYmv5yMD/E9V6phptfML7agcaXbLZLmknnxPzUHT/EaW+tTw
   DpZ4FdqhsU0DpYJ4LmJTYLYGY5AItvGsvXA9mAv4PW02jZk+ZnYq2hIDd
   /Q1q4afwI4Y0eGJRxXNQcH1aO37KrvCd60ZljG8XVzxHAV9JO+QSSxToE
   sMx/sxXRj+9LUnGgr51OY5xtDW0cCgMrJKI+veIcf9WOyiV8IWzcFvv3M
   8rzUu1IN8Ifbqg0H+jt0e/aG0R/pTUAoLYK7tIVfPAxjv/MGLcxLmDN7S
   A==;
X-CSE-ConnectionGUID: 7cBwKguxTtGIHOTa81JO6Q==
X-CSE-MsgGUID: S4w/zG4LRpqHSCAqjUZU6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="59117542"
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; 
   d="scan'208";a="59117542"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 03:34:35 -0700
X-CSE-ConnectionGUID: DLpmhFP+R0etZ+/rrGqiCQ==
X-CSE-MsgGUID: wZoZ8lZsRc+CMgkOiw4CSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; 
   d="scan'208";a="172575102"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa009.fm.intel.com with SMTP; 05 Sep 2025 03:34:30 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 05 Sep 2025 13:34:29 +0300
Date: Fri, 5 Sep 2025 13:34:29 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] usb: typec: Expose alternate mode priority via
 sysfs
Message-ID: <aLq8tUogl67VptRC@kuha.fi.intel.com>
References: <20250825145750.58820-1-akuchynski@chromium.org>
 <20250825145750.58820-6-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825145750.58820-6-akuchynski@chromium.org>

On Mon, Aug 25, 2025 at 02:57:50PM +0000, Andrei Kuchynski wrote:
> This patch introduces a priority sysfs attribute to the USB Type-C
> alternate mode port interface. This new attribute allows user-space to
> configure the numeric priority of alternate modes managing their preferred
> order of operation.
> 
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> ---
>  Documentation/ABI/testing/sysfs-class-typec | 11 +++++++
>  drivers/usb/typec/class.c                   | 32 ++++++++++++++++++++-

Maybe patch 4/5 could be squashed into this patch, and I'm wondering
would it make sense to just keep the typec_mode_set_priority() in this
file (drivers/usb/typec/class.c).

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

>  2 files changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
> index 38e101c17a00..dab3e4e727b6 100644
> --- a/Documentation/ABI/testing/sysfs-class-typec
> +++ b/Documentation/ABI/testing/sysfs-class-typec
> @@ -162,6 +162,17 @@ Description:	Lists the supported USB Modes. The default USB mode that is used
>  		- usb3 (USB 3.2)
>  		- usb4 (USB4)
>  
> +		What:		/sys/class/typec/<port>/<alt-mode>/priority
> +Date:		July 2025
> +Contact:	Andrei Kuchynski <akuchynski@chromium.org>
> +Description:
> +		Displays and allows setting the priority for a specific alt-mode.
> +		When read, it shows the current integer priority value. Lower numerical
> +		values indicate higher priority (0 is the highest priority).
> +		If the new value is already in use by another mode, the priority of the
> +		conflicting mode and any subsequent modes will be incremented until they
> +		are all unique.
> +
>  USB Type-C partner devices (eg. /sys/class/typec/port0-partner/)
>  
>  What:		/sys/class/typec/<port>-partner/accessory_mode
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 9f86605ce125..aaab2e1e98b4 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -19,6 +19,7 @@
>  #include "bus.h"
>  #include "class.h"
>  #include "pd.h"
> +#include "mode_selection.h"
>  
>  static DEFINE_IDA(typec_index_ida);
>  
> @@ -445,11 +446,34 @@ svid_show(struct device *dev, struct device_attribute *attr, char *buf)
>  }
>  static DEVICE_ATTR_RO(svid);
>  
> +static ssize_t priority_store(struct device *dev,
> +			       struct device_attribute *attr,
> +			       const char *buf, size_t size)
> +{
> +	unsigned int val;
> +	int err = kstrtouint(buf, 10, &val);
> +
> +	if (!err) {
> +		typec_mode_set_priority(to_typec_altmode(dev), val);
> +		return size;
> +	}
> +
> +	return err;
> +}
> +
> +static ssize_t priority_show(struct device *dev,
> +			      struct device_attribute *attr, char *buf)
> +{
> +	return sprintf(buf, "%u\n", to_typec_altmode(dev)->priority);
> +}
> +static DEVICE_ATTR_RW(priority);
> +
>  static struct attribute *typec_altmode_attrs[] = {
>  	&dev_attr_active.attr,
>  	&dev_attr_mode.attr,
>  	&dev_attr_svid.attr,
>  	&dev_attr_vdo.attr,
> +	&dev_attr_priority.attr,
>  	NULL
>  };
>  
> @@ -459,11 +483,15 @@ static umode_t typec_altmode_attr_is_visible(struct kobject *kobj,
>  	struct typec_altmode *adev = to_typec_altmode(kobj_to_dev(kobj));
>  	struct typec_port *port = typec_altmode2port(adev);
>  
> -	if (attr == &dev_attr_active.attr)
> +	if (attr == &dev_attr_active.attr) {
>  		if (!is_typec_port(adev->dev.parent)) {
>  			if (!port->mode_control || !adev->ops || !adev->ops->activate)
>  				return 0444;
>  		}
> +	} else if (attr == &dev_attr_priority.attr) {
> +		if (!is_typec_port(adev->dev.parent) || !port->mode_control)
> +			return 0;
> +	}
>  
>  	return attr->mode;
>  }
> @@ -2491,6 +2519,8 @@ typec_port_register_altmode(struct typec_port *port,
>  		to_altmode(adev)->retimer = retimer;
>  	}
>  
> +	typec_mode_set_priority(adev, 0);
> +
>  	return adev;
>  }
>  EXPORT_SYMBOL_GPL(typec_port_register_altmode);
> -- 
> 2.51.0.rc2.233.g662b1ed5c5-goog
> 

-- 
heikki
