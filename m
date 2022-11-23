Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D1E1C26
	for <chrome-platform@lists.linux.dev>; Wed, 23 Nov 2022 08:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669193667; x=1700729667;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VZbmJPZfndM+pgDfB8pn/QDgWDK1DpcXGRSBx6vCr6Q=;
  b=iG2lVp6AFd1tO0MOVR9VzV1ZjtpKhauRKk2esWlTFlSKWVkrxUgXEzCf
   8ZRPp3KVAhvpr2tY3Qr8hVPT1AIJfSl8A6E0obOlvz9vBY3jRPG2Fixxd
   fbcQjJ8gZhTZdURskxcAivV0JX8lc52XlualJHSsq9VBpizZSwAgAWJgE
   IQVJvm9rfc0Gjl+2c5kgmUs5zq60+mPiPuO8TBaHMHrkVf/yzwZAvw60l
   PCBOtQ0w8jeyK/KZa9HGM4Bh4G9xUZZdCB3v9pvKOPV8W8acZWOkooe8q
   8htq6ZAp1TpQRTtaC9q3YEAZJErunfJR0hN6RQMmf4FoXfIBCWDd0tRsf
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="314051784"
X-IronPort-AV: E=Sophos;i="5.96,186,1665471600"; 
   d="scan'208";a="314051784"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2022 00:54:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="784161624"
X-IronPort-AV: E=Sophos;i="5.96,186,1665471600"; 
   d="scan'208";a="784161624"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 23 Nov 2022 00:54:23 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 23 Nov 2022 10:54:23 +0200
Date: Wed, 23 Nov 2022 10:54:23 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev, Benson Leung <bleung@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>
Subject: Re: [PATCH v2 2/2] platform/chrome: cros_ec_typec: Set parent of
 partner PD object
Message-ID: <Y33fv3YXz8YNKqv8@kuha.fi.intel.com>
References: <20221122220538.2991775-1-pmalani@chromium.org>
 <20221122220538.2991775-3-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221122220538.2991775-3-pmalani@chromium.org>

On Tue, Nov 22, 2022 at 10:05:37PM +0000, Prashant Malani wrote:
> In order to tell what Type-C device a PD object belongs to, its parent
> needs to be set. Use the Type-C partner USB PD registration wrapper
> to set the parent appropriately for PD objects which are created for
> connected Type-C partners.
> 
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> 
> Changes since v1:
> - Use wrapper function introduced in Patch1 (v2).
> - Update commit message to reflect that we are using the wrapper.
> 
>  drivers/platform/chrome/cros_ec_typec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> index 2a7ff14dc37e..d5bc4021aca2 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -968,7 +968,7 @@ static void cros_typec_register_partner_pdos(struct cros_typec_data *typec,
>  	if (!resp->source_cap_count && !resp->sink_cap_count)
>  		return;
>  
> -	port->partner_pd = usb_power_delivery_register(NULL, &desc);
> +	port->partner_pd = typec_partner_usb_power_delivery_register(port->partner, &desc);
>  	if (IS_ERR(port->partner_pd)) {
>  		dev_warn(typec->dev, "Failed to register partner PD device, port: %d\n", port_num);
>  		return;

thanks,

-- 
heikki
