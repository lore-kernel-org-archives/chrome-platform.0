Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF942575
	for <chrome-platform@lists.linux.dev>; Thu, 24 Nov 2022 12:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669292637; x=1700828637;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ObxTC5S376qcP+jc5Vqug+j/70Vb8bRa53QKgt/sNI0=;
  b=Jc7tEklBcVaha6dTApgdUUdma1BTBDdQ8vZh4O0h90LfUNCi0g02WPnP
   z1bKnmYKtydFn/HDYn1Lowu6CLrjEdzTL4ag9a7sjSkC2WP4VTpEL77sM
   iPRaRusowpdlbMaryjRMAvddMpZf5vDrGhRWz8Z0PtIR7vRH02EccMstx
   B7zDPo9rPi4OhW4Soo6kYKbpZ2cXc00w8mzTrSbP66blpqybf/aqMaS/P
   IaxlcYLYlpoINscTaOsKUdFyaoDDNkNz9/881shXBFKe3g3w6CFzVfwAt
   1G8msJZjel022EKkd22zJ4BpLm1BVfZCWnmrQgZ30h9vXLSLZIBDoi9W6
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="378549328"
X-IronPort-AV: E=Sophos;i="5.96,190,1665471600"; 
   d="scan'208";a="378549328"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2022 04:23:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="642336159"
X-IronPort-AV: E=Sophos;i="5.96,190,1665471600"; 
   d="scan'208";a="642336159"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 24 Nov 2022 04:23:37 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1oyBGQ-00GjwQ-0y;
	Thu, 24 Nov 2022 14:23:34 +0200
Date: Thu, 24 Nov 2022 14:23:34 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pin-yen Lin <treapking@chromium.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <robert.foss@linaro.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Stephen Boyd <swboyd@chromium.org>, dri-devel@lists.freedesktop.org,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-acpi@vger.kernel.org,
	Marek Vasut <marex@denx.de>, Xin Ji <xji@analogixsemi.com>,
	Lyude Paul <lyude@redhat.com>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, Allen Chen <allen.chen@ite.com.tw>
Subject: Re: [PATCH v6 7/7] drm/bridge: it6505: Register Type C mode switches
Message-ID: <Y39iRg2TZCljOyNN@smile.fi.intel.com>
References: <20221124102056.393220-1-treapking@chromium.org>
 <20221124102056.393220-8-treapking@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221124102056.393220-8-treapking@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Nov 24, 2022 at 06:20:56PM +0800, Pin-yen Lin wrote:
> Register USB Type-C mode switches when the "mode-switch" property and
> relevant port are available in Device Tree. Configure the "lane_swap"
> state based on the entered alternate mode for a specific Type-C
> connector, which ends up updating the lane swap registers of the it6505
> chip.

...

>  config DRM_ITE_IT6505
>          tristate "ITE IT6505 DisplayPort bridge"
>          depends on OF
> +	depends on TYPEC || TYPEC=n
>  	select DRM_DISPLAY_DP_HELPER
>  	select DRM_DISPLAY_HDCP_HELPER
>  	select DRM_DISPLAY_HELPER

Something went wrong with the indentation. Perhaps you need to fix it first.

...

>  #include <drm/drm_edid.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_of.h>

Make it ordered?

...

> +struct it6505_port_data {

> +	bool dp_connected;

Perhaps make it last?

> +	struct typec_mux_dev *typec_mux;
> +	struct it6505 *it6505;
> +};

...

> +static void it6505_typec_ports_update(struct it6505 *it6505)
> +{
> +	usleep_range(3000, 4000);
> +
> +	if (it6505->typec_ports[0].dp_connected && it6505->typec_ports[1].dp_connected)
> +		/* Both ports available, do nothing to retain the current one. */
> +		return;
> +	else if (it6505->typec_ports[0].dp_connected)
> +		it6505->lane_swap = false;
> +	else if (it6505->typec_ports[1].dp_connected)
> +		it6505->lane_swap = true;
> +
> +	usleep_range(3000, 4000);
> +}

As per previous patch comments.

Also, comment out these long sleeps. Why they are needed.

...

> +		int ret = pm_runtime_get_sync(dev);
> +
> +		/*
> +		 * On system resume, mux_set can be triggered before
> +		 * pm_runtime_force_resume re-enables runtime power management.

We refer to the functions as func().

> +		 * Handling the error here to make sure the bridge is powered on.
> +		 */
> +		if (ret < 0)
> +			it6505_poweron(it6505);

This seems needed a bit more of explanation, esp. why you leave PM runtime
reference count bumped up.

...

> +	num_lanes = drm_of_get_data_lanes_count(node, 0, 2);
> +	if (num_lanes <= 0) {
> +		dev_err(dev, "Error on getting data lanes count: %d\n",
> +			num_lanes);
> +		return num_lanes;
> +	}
> +
> +	ret = of_property_read_u32_array(node, "data-lanes", dp_lanes, num_lanes);
> +	if (ret) {
> +		dev_err(dev, "Failed to read the data-lanes variable: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	for (i = 0; i < num_lanes; i++) {
> +		if (port_num != -1 && port_num != dp_lanes[i] / 2) {
> +			dev_err(dev, "Invalid data lane numbers\n");
> +			return -EINVAL;
> +		}

As per previous patch comments.

> +		port_num = dp_lanes[i] / 2;
> +	}

The above seems like tons of duplicating code that drivers need to implement.
Can we shrink that burden by adding some library functions?

-- 
With Best Regards,
Andy Shevchenko


