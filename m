Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404B123C4
	for <chrome-platform@lists.linux.dev>; Tue, 21 Feb 2023 11:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676980509; x=1708516509;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QCQCaIZW5z5pVDWUHNmY/rYFh3F6mLZ18lRrmfZVXQI=;
  b=MIs9sfRNw7TqSMAU2tdsUW2iYp91/h/bW/HIxgelsjkZQtrfMsi+sX0L
   08dzTFhbZWTIGQtqibs0cm5+4g60lt0hWjW/vYLGrmRs+gcpShuj66fPt
   wWSWTutEXY9dKm4eiEgwhVOuRqWlFEYBp2mZEhHVOy5GK3b/JgPix0DMK
   UVTKe9+yM11FDj3hE+4pitGnNe7ck8mOVoTEzA9T+IoFUkqJ66K5OiNf9
   9HXNnRfafni2tgF+fgXTfpwIZlxfS62PKiIt0Bq84NndeE1QZ5Ipfj5ab
   FTmxDmzq+idRbcorR0DlQaGtGeX5Bprfjyj9ZFf9UN259YYCOU0nRXHQ9
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="418835406"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="418835406"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 03:55:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="845656952"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="845656952"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 21 Feb 2023 03:55:00 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pUREW-009wQN-25;
	Tue, 21 Feb 2023 13:54:56 +0200
Date: Tue, 21 Feb 2023 13:54:56 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pin-yen Lin <treapking@chromium.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
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
	Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org,
	Hsin-Yi Wang <hsinyi@chromium.org>, Marek Vasut <marex@denx.de>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, Xin Ji <xji@analogixsemi.com>,
	Lyude Paul <lyude@redhat.com>, Allen Chen <allen.chen@ite.com.tw>,
	devicetree@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	chrome-platform@lists.linux.dev,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-acpi@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v12 10/10] drm/bridge: it6505: Register Type C mode
 switches
Message-ID: <Y/SxEEwDFI2CWMv3@smile.fi.intel.com>
References: <20230221095054.1868277-1-treapking@chromium.org>
 <20230221095054.1868277-11-treapking@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221095054.1868277-11-treapking@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Feb 21, 2023 at 05:50:54PM +0800, Pin-yen Lin wrote:
> Register USB Type-C mode switches when the "mode-switch" property and
> relevant port are available in Device Tree. Configure the "lane_swap"
> state based on the entered alternate mode for a specific Type-C
> connector, which ends up updating the lane swap registers of the it6505
> chip.

...

> +static void it6505_typec_ports_update(struct it6505 *it6505)
> +{
> +	int i;

unsigned?

(and just note that here you have already blank line which is good)

> +	/* Check if both ports available and do nothing to retain the current one */
> +	if (it6505->port_data[0].dp_connected && it6505->port_data[1].dp_connected)
> +		return;
> +
> +	for (i = 0; i < 2; i++) {
> +		if (it6505->port_data[i].dp_connected)
> +			it6505->lane_swap = it6505->port_data[i].lane_swap;
> +	}
> +}


,,,

> +	it6505->port_data[port->port_num].dp_connected =
> +		state->alt && state->alt->svid == USB_TYPEC_DP_SID &&
> +		state->alt->mode == USB_TYPEC_DP_MODE;

Split first parameter?

...

> +	it6505->port_data = devm_kcalloc(
> +		dev, switch_desc->num_typec_switches,

Strange indentation.

> +		sizeof(struct it6505_typec_port_data), GFP_KERNEL);

> +

Redundant blank line.

> +	if (!it6505->port_data) {
> +		ret = -ENOMEM;
> +		goto unregister_mux;
> +	}

...

> +		num_lanes = fwnode_property_count_u32(fwnode, "data-lanes");
> +
> +		if (num_lanes < 0) {
> +			dev_err(dev,
> +				"Error on getting data lanes count from %pfwP: %d\n",
> +				fwnode, num_lanes);
> +			ret = num_lanes;
> +			goto unregister_mux;
> +		}

Same two comments as per previous patch of similar semantics.

-- 
With Best Regards,
Andy Shevchenko


