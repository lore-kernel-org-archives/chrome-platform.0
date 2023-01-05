Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7E2D51E
	for <chrome-platform@lists.linux.dev>; Thu,  5 Jan 2023 15:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672933295; x=1704469295;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d4iSIbg1kqd9LpwkZrol2ctpuIJk0HeuCSrnRj6kN8U=;
  b=KVBXpyujVgtmHXrhLuqsERL37AtmDHF5/VWfzsbnYSZkjO23+I3O3/Sq
   hDiNRN9jfFLML9UieL7XHVIwUmcFxtRQ7l8x3opqru3pSEJ9ws527ooJ6
   cwMNYAC6GsF3OMuPQYA82UKJVV5QKaHg9E6iroKg4yjnu3Ctup3ZGPN1I
   6AqCvcIMQGHaLJ/0TvNrpaN9pMKN7j3YPX8w5poomSYegtfVtFQsKdhb9
   2xqN2nQB2wH1LS4ppmg0D2yWSkHIg8kjGP9YNtJPeaIMUDIlcLY5gIC7e
   +myrB0cbsmLTor+UDTTbZTpltSO6/Xs2g8tYZVfdej75kWTzm10X1+lzC
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="319941835"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; 
   d="scan'208";a="319941835"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2023 07:41:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="744308148"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; 
   d="scan'208";a="744308148"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Jan 2023 07:41:20 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pDSMm-004p6S-1s;
	Thu, 05 Jan 2023 17:41:16 +0200
Date: Thu, 5 Jan 2023 17:41:16 +0200
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
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Xin Ji <xji@analogixsemi.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Hsin-Yi Wang <hsinyi@chromium.org>, linux-kernel@vger.kernel.org,
	Allen Chen <allen.chen@ite.com.tw>, linux-acpi@vger.kernel.org,
	Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
	chrome-platform@lists.linux.dev,
	Javier Martinez Canillas <javierm@redhat.com>,
	Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
	Stephen Boyd <swboyd@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Imre Deak <imre.deak@intel.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Kees Cook <keescook@chromium.org>,
	Khaled Almahallawy <khaled.almahallawy@intel.com>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	shaomin Deng <dengshaomin@cdjrlc.com>
Subject: Re: [PATCH v7 3/9] drm/display: Add Type-C switch helpers
Message-ID: <Y7bvnOLcuJvvp/v1@smile.fi.intel.com>
References: <20230105132457.4125372-1-treapking@chromium.org>
 <20230105132457.4125372-4-treapking@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105132457.4125372-4-treapking@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Jan 05, 2023 at 09:24:51PM +0800, Pin-yen Lin wrote:
> Add helpers to register and unregister Type-C "switches" for bridges
> capable of switching their output between two downstream devices.
> 
> The helper registers USB Type-C mode switches when the "mode-switch"
> and the "data-lanes" properties are available in Device Tree.

...

> +	port_data->typec_mux = typec_mux_register(dev, &mux_desc);
> +	if (IS_ERR(port_data->typec_mux)) {
> +		ret = PTR_ERR(port_data->typec_mux);
> +		dev_err(dev, "Mode switch register for port %d failed: %d\n",
> +			port_num, ret);
> +	}
> +
> +	return ret;

...

> +	struct device_node *sw;

> +	int ret = 0;

It's easy to break things if you squeeze more code in the future in this
function, so I recommend to split assignment to be closer to its first user
(see below).

> +	for_each_child_of_node(port, sw) {
> +		if (of_property_read_bool(sw, "mode-switch"))
> +			switch_desc->num_typec_switches++;
> +	}
> +
> +	if (!switch_desc->num_typec_switches) {
> +		dev_warn(dev, "No Type-C switches node found\n");

> +		return ret;

return 0;

> +	}
> +
> +	switch_desc->typec_ports = devm_kcalloc(
> +		dev, switch_desc->num_typec_switches,
> +		sizeof(struct drm_dp_typec_port_data), GFP_KERNEL);
> +
> +	if (!switch_desc->typec_ports)
> +		return -ENOMEM;

> +	/* Register switches for each connector. */
> +	for_each_child_of_node(port, sw) {
> +		if (!of_property_read_bool(sw, "mode-switch"))
> +			continue;
> +		ret = drm_dp_register_mode_switch(dev, sw, switch_desc, data, mux_set);
> +		if (ret) {
> +			dev_err(dev, "Failed to register mode switch: %d\n", ret);
> +			of_node_put(sw);
> +			break;
> +		}
> +	}

> +	if (ret)
> +		drm_dp_unregister_typec_switches(switch_desc);
> +
> +	return ret;

Why not adding a goto label?

		ret = drm_dp_register_mode_switch(dev, sw, switch_desc, data, mux_set);
		if (ret)
			goto err_unregister_typec_switches;

	return 0;

err_unregister_typec_switches:
	of_node_put(sw);
	drm_dp_unregister_typec_switches(switch_desc);
	dev_err(dev, "Failed to register mode switch: %d\n", ret);
	return ret;

-- 
With Best Regards,
Andy Shevchenko


