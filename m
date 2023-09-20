Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C491D37176
	for <chrome-platform@lists.linux.dev>; Wed, 20 Sep 2023 14:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695220972; x=1726756972;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xD+kCDuKOctFEp9FrRuO8zEdKonGQP5B7ih1GY4kA0s=;
  b=J7dCDQnt7QMV+o5Wq3ibNZJXfwF4hOcg9kD80TDVPd//L+gAhfgyMEwD
   XEJ2hEyKu/nBGfcTPvZa5WeEbhNFXLeQ511Vjg2L0qSP1nIJRt+gXKeT6
   JBJnANc8cUTujiBIUPN9+ndj0P36wUS0oQMKZ86wCB9efJpVae+VCPgDq
   CWb935o4RgFPBzvl95Bc2NPJBIhRyMpiowjh1IJ+IYigRGQzUaw1QaTxC
   zo3JUPduTV8WrXeVGuR3k8mFZL6Qf92ztmit9PgiugdKiL+vDY6LA0Ddc
   aO6CaUYqb5Us8lqj1kLMuBeCkLgirCIoPtiLtaIJ+Fnm0Ig4m2MPMr3gg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="365294447"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="365294447"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 07:42:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="816931136"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="816931136"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 07:42:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC0)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qiyPe-0000000Fs3W-43Nz;
	Wed, 20 Sep 2023 17:42:46 +0300
Date: Wed, 20 Sep 2023 17:42:46 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Utkarsh Patel <utkarsh.h.patel@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	heikki.krogerus@linux.intel.com, pmalani@chromium.org,
	chrome-platform@lists.linux.dev, bleung@chromium.org
Subject: Re: [PATCH v4 4/5] platform/chrome: cros_ec_typec: Add Displayport
 Alternatemode 2.1 Support
Message-ID: <ZQsE5hgm4qYpr/My@smile.fi.intel.com>
References: <20230920023243.2494410-1-utkarsh.h.patel@intel.com>
 <20230920023243.2494410-5-utkarsh.h.patel@intel.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920023243.2494410-5-utkarsh.h.patel@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Sep 19, 2023 at 07:32:42PM -0700, Utkarsh Patel wrote:
> Displayport Alternatemode 2.1 requires cable capabilities such as cable
> signalling, cable type, DPAM version which then will be used by mux
> driver for displayport configuration. These capabilities can be derived
> from the Cable VDO.

...

> +	/**

Are you sure?

> +	 * Get cable VDO for thunderbolt cables and cables with DPSID but does not
> +	 * support DPAM2.1.
> +	 */

...

> +	if (cable_dp_vdo & DP_CAP_DPAM_VERSION) {
> +		dp_data.conf |= cable_dp_vdo;
> +	} else if (cable_tbt_vdo) {
> +		dp_data.conf |=  TBT_CABLE_SPEED(cable_tbt_vdo) << DP_CONF_SIGNALLING_SHIFT;
> +
> +		/* Cable Type */
> +		if (cable_tbt_vdo & TBT_CABLE_OPTICAL)
> +			dp_data.conf |= DP_CONF_CABLE_TYPE_OPTICAL << DP_CONF_CABLE_TYPE_SHIFT;
> +		else if (cable_tbt_vdo & TBT_CABLE_RETIMER)
> +			dp_data.conf |= DP_CONF_CABLE_TYPE_RE_TIMER << DP_CONF_CABLE_TYPE_SHIFT;
> +		else if (cable_tbt_vdo & TBT_CABLE_ACTIVE_PASSIVE)
> +			dp_data.conf |= DP_CONF_CABLE_TYPE_RE_DRIVER << DP_CONF_CABLE_TYPE_SHIFT;
> +	} else if (PD_IDH_PTYPE(port->c_identity.id_header) == IDH_PTYPE_PCABLE) {
> +		dp_data.conf |= VDO_TYPEC_CABLE_SPEED(port->c_identity.vdo[0]) <<
> +				DP_CONF_SIGNALLING_SHIFT;
> +	}

You can also make it a bit more readable with (use better names
if you think it's needed)

	u32 signalling = 0;
	u32 cable_type = 0;

	...

	if (cable_dp_vdo & DP_CAP_DPAM_VERSION) {
		dp_data.conf |= cable_dp_vdo;
	} else if (cable_tbt_vdo) {
		signalling = TBT_CABLE_SPEED(cable_tbt_vdo);

		/* Cable Type */
		if (cable_tbt_vdo & TBT_CABLE_OPTICAL)
			cable_type = DP_CONF_CABLE_TYPE_OPTICAL;
		else if (cable_tbt_vdo & TBT_CABLE_RETIMER)
			cable_type = DP_CONF_CABLE_TYPE_RE_TIMER;
		else if (cable_tbt_vdo & TBT_CABLE_ACTIVE_PASSIVE)
			cable_type = DP_CONF_CABLE_TYPE_RE_DRIVER;
	} else if (PD_IDH_PTYPE(port->c_identity.id_header) == IDH_PTYPE_PCABLE) {
		signalling = VDO_TYPEC_CABLE_SPEED(port->c_identity.vdo[0]);
	}

	dp_data.conf |= signalling << DP_CONF_SIGNALLING_SHIFT;
	dp_data.conf |= cable_type << DP_CONF_CABLE_TYPE_SHIFT;

-- 
With Best Regards,
Andy Shevchenko


