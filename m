Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E684EA2
	for <chrome-platform@lists.linux.dev>; Thu, 30 Jun 2022 08:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656577633; x=1688113633;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qi9li/NCV765ItXQMioKvs0Czkex9a7+A1S0LgmtYeY=;
  b=BwEjKK1mowEF+BjqYbyPOC7zAvt6oWo1iXgXFMWGQZlVU1IG9nmYrKRg
   iuKWGWfa/hr/A1Knrbj32zttGyx3ZMY99pEbYGiQGoNnuOJ2gTQC5rLmk
   6nGHpcU01cfLnDMMHhIlw0BajKAHFO+L5c0E8iMwUCIJsBTvRgW3/TkDJ
   ETLeKWbs7gxhgTQ9kRmwS361m2NQjMPPp6Pa4T0SApkGLkxBEkMXb5/1R
   77d+2eGzYVrGfFlu6AksiHvbQF58bPeQnJfUCBgP4zsU0+7/gr947bsUA
   brkwMTff2iakubdJCeUQy/6it16+nMt/wmWhmd48sxBcMPeOLySFOE8Ei
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="271052691"
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; 
   d="scan'208";a="271052691"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2022 01:27:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; 
   d="scan'208";a="733545706"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 30 Jun 2022 01:27:08 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 30 Jun 2022 11:27:07 +0300
Date: Thu, 30 Jun 2022 11:27:07 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev, bleung@chromium.org,
	Daisuke Nojiri <dnojiri@chromium.org>,
	"Dustin L. Howett" <dustin@howett.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 2/9] usb: typec: Add retimer handle to port
Message-ID: <Yr1eW1gHR7LGP70Y@kuha.fi.intel.com>
References: <20220629233314.3540377-1-pmalani@chromium.org>
 <20220629233314.3540377-3-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220629233314.3540377-3-pmalani@chromium.org>

Hi,

On Wed, Jun 29, 2022 at 11:32:20PM +0000, Prashant Malani wrote:
> Similar to mux and orientation switch, add a handle for registered
> retimer to the port, so that it has handles to the various switches
> connected to it.
> 
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> ---
>  drivers/usb/typec/class.c | 8 ++++++++
>  drivers/usb/typec/class.h | 1 +
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 2fa0b3718d23..2bc5fbdb25dd 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -12,6 +12,7 @@
>  #include <linux/slab.h>
>  #include <linux/usb/pd_vdo.h>
>  #include <linux/usb/typec_mux.h>
> +#include <linux/usb/typec_retimer.h>
>  
>  #include "bus.h"
>  #include "class.h"
> @@ -2249,6 +2250,13 @@ struct typec_port *typec_register_port(struct device *parent,
>  		return ERR_PTR(ret);
>  	}
>  
> +	port->retimer = typec_retimer_get(&port->dev);
> +	if (IS_ERR(port->retimer)) {
> +		ret = PTR_ERR(port->retimer);
> +		put_device(&port->dev);
> +		return ERR_PTR(ret);
> +	}
> +
>  	ret = device_add(&port->dev);
>  	if (ret) {
>  		dev_err(parent, "failed to register port (%d)\n", ret);

I think you need to release the reference with typec_retimer_put() in
typec_release().

I guess we can look handle this later, but there can actually be two
onboard retimers for each connector.

thanks,

> diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
> index 1bb1da124109..97520406929e 100644
> --- a/drivers/usb/typec/class.h
> +++ b/drivers/usb/typec/class.h
> @@ -55,6 +55,7 @@ struct typec_port {
>  	enum typec_orientation		orientation;
>  	struct typec_switch		*sw;
>  	struct typec_mux		*mux;
> +	struct typec_retimer		*retimer;
>  
>  	const struct typec_capability	*cap;
>  	const struct typec_operations   *ops;

-- 
heikki
