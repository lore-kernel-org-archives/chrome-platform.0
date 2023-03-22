Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942263222
	for <chrome-platform@lists.linux.dev>; Wed, 22 Mar 2023 14:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679495450; x=1711031450;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YpXIfF5+mJiCxg+eDEG0Br0ZjXo5m0PVri6m2PIOARM=;
  b=g2VxFApae/w/PFADkZKvwHSOeWfJYHlP1I692nFeaYe2JgB5VRjFsu4M
   ji0htw4XkWDe8HqvDo2sJbqEwkO3jRBtYloHznCQB2ZAtQV7wFGGuOEYF
   8WfNW1h7WIB+KI1pJ9Z8i43q6Rv3jTAm0MDq2waDJRdJUMvFikb0hzNv4
   hiHaMHsGex7AT3kHKg29B30qy/VuslL0edsydZWOXlZ/7/jfOOmq1jAR6
   Xh+c3Kn7oQnnMXuZa4EJQ3T2UPZiy1R18bxspNGgmaLmXMO6oK1DzcMfl
   zqkgm2m33eltQx/z+AgYIpxP4lU2KSG7NlMn1BgCAqzqBzgdWpYQmG8HV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="323070999"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="323070999"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 07:30:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="632010777"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="632010777"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 22 Mar 2023 07:30:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pezTy-007AGy-0O;
	Wed, 22 Mar 2023 16:30:30 +0200
Date: Wed, 22 Mar 2023 16:30:29 +0200
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
	Guenter Roeck <groeck@chromium.org>, Xin Ji <xji@analogixsemi.com>,
	linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>, linux-acpi@vger.kernel.org,
	Javier Martinez Canillas <javierm@redhat.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>, Lyude Paul <lyude@redhat.com>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Allen Chen <allen.chen@ite.com.tw>, dri-devel@lists.freedesktop.org,
	Marek Vasut <marex@denx.de>, Stephen Boyd <swboyd@chromium.org>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v14 10/10] drm/bridge: it6505: Register Type C mode
 switches
Message-ID: <ZBsRBV9dw+mb5ZxZ@smile.fi.intel.com>
References: <20230322104639.221402-1-treapking@chromium.org>
 <20230322104639.221402-11-treapking@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322104639.221402-11-treapking@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Mar 22, 2023 at 06:46:39PM +0800, Pin-yen Lin wrote:
> Register USB Type-C mode switches when the "mode-switch" property and
> relevant port are available in Device Tree. Configure the "lane_swap"
> state based on the entered alternate mode for a specific Type-C
> connector, which ends up updating the lane swap registers of the it6505
> chip.

...

> +	struct device_node *port_node = of_graph_get_port_by_id(dev->of_node, 1);
> +	struct drm_dp_typec_switch_desc *switch_desc = &it6505->switch_desc;
> +	int ret;
> +	u32 dp_lanes[4];
> +	unsigned int i, num_lanes;
> +
> +	ret = drm_dp_register_typec_switches(dev, &port_node->fwnode,
> +					     &it6505->switch_desc, it6505,
> +					     it6505_typec_mux_set);
> +	if (ret)
> +		return ret;
> +
> +	it6505->port_data = devm_kcalloc(dev, switch_desc->num_typec_switches,
> +					 sizeof(struct it6505_typec_port_data),
> +					 GFP_KERNEL);
> +	if (!it6505->port_data) {
> +		ret = -ENOMEM;
> +		goto unregister_mux;
> +	}

A couple of the similar comments as per previous similar patch.

...

>  	/* get extcon device from DTS */
>  	extcon = extcon_get_edev_by_phandle(dev, 0);
> -	if (PTR_ERR(extcon) == -EPROBE_DEFER)
> -		return -EPROBE_DEFER;
> -	if (IS_ERR(extcon)) {
> -		dev_err(dev, "can not get extcon device!");
> -		return PTR_ERR(extcon);
> +	ret = PTR_ERR_OR_ZERO(extcon);
> +	if (ret == -EPROBE_DEFER)
> +		return ret;

> +

Unnecessary blank line.

> +	if (ret) {
> +		if (ret != -ENODEV)
> +			dev_warn(dev, "Cannot get extcon device: %d\n", ret);
> +
> +		it6505->extcon = NULL;
> +	} else {
> +		it6505->extcon = extcon;

...

> +	ret = it6505_register_typec_switches(dev, it6505);
> +	if (ret != -ENODEV)
> +		dev_warn(dev, "Didn't register Type-C switches, err: %d\n", ret);

> +

Unnecessary blank line.

> +	if (ret && !it6505->extcon) {
> +		dev_err(dev, "Both extcon and Type-C switch are not registered.\n");
> +		return -EINVAL;

Why not return ret here?

> +	}

-- 
With Best Regards,
Andy Shevchenko


