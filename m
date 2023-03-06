Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C44833E8
	for <chrome-platform@lists.linux.dev>; Mon,  6 Mar 2023 11:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678103521; x=1709639521;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+vJI7YuA2cKvI0b1Mt8oP5n5z7Z9J/WAV96Z+3jwwp0=;
  b=Dl8dFu/h2HW8FVT9o7Cv6EoU1USbZkmES1i5rdKx/coJbJy4gZmOH2Ij
   aMfuTE43lBohuz8LLn7WzyK11PFWWkyv1WueZzFfxJNZFJBzKjljpXV7a
   gJSV/R+OOskN1nrJ1wOeeVXJoEukcB8L+54Px9QnZSYBA6pT/plT1LPD2
   R82v4LXOa9BSL+Z+QaL/o7TZjF5jjnuamhJ3FjizCIXa+QkHfTQ3amIDp
   xcn1CYo+/twQE3ybvydk5ipGEb56pqfpf7q3Vj5mAC1VN0//lurmsBSpv
   3pZ2ee61FBzVX1VndLVZU+ebX03vBGIJGgI+wHqWDF97qOK/WxGzxzjXm
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="421805989"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="421805989"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 03:51:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="678444901"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="678444901"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 06 Mar 2023 03:51:48 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pZ9NY-00GKgD-22;
	Mon, 06 Mar 2023 13:51:44 +0200
Date: Mon, 6 Mar 2023 13:51:44 +0200
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
	Javier Martinez Canillas <javierm@redhat.com>,
	Lyude Paul <lyude@redhat.com>, linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	chrome-platform@lists.linux.dev,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Marek Vasut <marex@denx.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
	devicetree@vger.kernel.org, Allen Chen <allen.chen@ite.com.tw>,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Stephen Boyd <swboyd@chromium.org>, linux-acpi@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v13 05/10] drm/bridge: anx7625: Check for Type-C during
 panel registration
Message-ID: <ZAXT0JFjERb8Q36f@smile.fi.intel.com>
References: <20230303143350.815623-1-treapking@chromium.org>
 <20230303143350.815623-6-treapking@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230303143350.815623-6-treapking@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Mar 03, 2023 at 10:33:45PM +0800, Pin-yen Lin wrote:
> The output port endpoints can be connected to USB-C connectors.
> Running drm_of_find_panel_or_bridge() with such endpoints leads to
> a continuous return value of -EPROBE_DEFER, even though there is
> no panel present.
> 
> To avoid this, check for the existence of a "mode-switch" property in
> the port endpoint, and skip panel registration completely if so.

...

> +	port_node = of_graph_get_port_by_id(np, 1);
> +	count = typec_mode_switch_node_count(&port_node->fwnode);

Do you need to drop reference count here?
(I don't know myself, so, please check this)

If no, patch LGTM.

> +	if (count)
> +		return 0;

-- 
With Best Regards,
Andy Shevchenko


