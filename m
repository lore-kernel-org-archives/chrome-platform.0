Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6671F1117
	for <chrome-platform@lists.linux.dev>; Tue, 22 Nov 2022 09:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669111106; x=1700647106;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ub2ULHl6Lnt9vs3IfOcNn6hW23qKp2CpnI2lQIsoK2c=;
  b=j7vpYC73i410jNReDdzDOefATfZdJ2cfq9CioKyew0mkjcs3/Szvn7L/
   yZzpbeU30lI9bju0mEkOx2IRfXAU3BVajmDcaoEVSVF9fCT+/JYzFswcx
   jpq8NNEGRnsnMiYROeQ1hsgH8Iw6suF76AUU441AGIl329Q3wv2JCAKOp
   8vWr8A6V4OusA2Hkd7HPPCbEw2jFuOUJR+1a7x0lFrAXjdC5BcZe1LogR
   dKMOW5OHFKb2iG+Cd8cUZeB8h3x9mtULRoWRjsb7wvDrbGvUYpQZ0lRdU
   y3wUT9R6yFoT+eCloVJZFfqflrsciVbhTs/prAMD1/oaIA62JkaNCeyt5
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="340647270"
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; 
   d="scan'208";a="340647270"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2022 01:58:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="783788444"
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; 
   d="scan'208";a="783788444"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 22 Nov 2022 01:58:22 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 22 Nov 2022 11:58:22 +0200
Date: Tue, 22 Nov 2022 11:58:22 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev, Benson Leung <bleung@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>
Subject: Re: [PATCH 1/2] usb: typec: Add helper to get partner device struct
Message-ID: <Y3ydPqkxxQCSGGp7@kuha.fi.intel.com>
References: <20221121201337.2772216-1-pmalani@chromium.org>
 <20221121201337.2772216-2-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221121201337.2772216-2-pmalani@chromium.org>

Hi Prashant,

On Mon, Nov 21, 2022 at 08:13:35PM +0000, Prashant Malani wrote:
> +/**
> + * typec_partner_to_dev - Get the device struct of a USB Type-C partner.
> + * @partner: USB Type-C Partner
> + *
> + * Returns a pointer to the device struct or NULL.
> + */
> +struct device *typec_partner_to_dev(struct typec_partner *partner)
> +{
> +	return partner ? &partner->dev : NULL;
> +}
> +EXPORT_SYMBOL_GPL(typec_partner_to_dev);

Let's not loose the protection around these devices unless there is no
other way, and in this case there is.

Please just create a wrapper for usb_power_delivery_register() instead:

struct usb_power_delivery *
typec_partner_usb_power_delivery_register(struct typec_partner *partner,
                                          struct usb_power_delivery_desc *desc)
{
        return usb_power_delivery_register(&partner->dev, desc);
}
EXPORT_SYMBOL_GPL(typec_partner_usb_power_delivery_register);

thanks,

-- 
heikki
