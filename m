Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99202575
	for <chrome-platform@lists.linux.dev>; Thu, 24 Nov 2022 12:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669292702; x=1700828702;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KrpjK4F7jdU1QpIQ8SnZenQcGxWFonbm3xOqctiSeP0=;
  b=VQtvDs3M3fdriBiHb7ozyisrU/NjKsLwOEsg+3WAqcoySg1/Anp3VSmQ
   ewTGrQEXo9OxD3JFmnOLv44xw/X2ba8ggfDWN5L8wbKDKmE2agBJTom6t
   Xqg4voWITk859bD4iBjPE0vjdspgIqXuRgaKGyrKd6rUVc1HF7Ew/sznx
   GPs6HtXhEpClQ713gN/DG5GkCONdqMcWrIRN/J3aL8eKqp19GXLlktuNb
   H9kIkfmq1Pj2ywp60YP8SmejFeB/6DkPDglaPDVYhCY3/juMq1BfRu/wD
   dHVnVjehgRj7YnhWYHC7QlYEre8hw9wNFCd56Cw9mcCK9fXmeZJL4HMA5
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="314325798"
X-IronPort-AV: E=Sophos;i="5.96,190,1665471600"; 
   d="scan'208";a="314325798"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2022 04:25:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="592905313"
X-IronPort-AV: E=Sophos;i="5.96,190,1665471600"; 
   d="scan'208";a="592905313"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 24 Nov 2022 04:24:52 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1oyBHd-00Gjxg-1Q;
	Thu, 24 Nov 2022 14:24:49 +0200
Date: Thu, 24 Nov 2022 14:24:49 +0200
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
Subject: Re: [PATCH v6 2/7] platform/chrome: cros_ec_typec: Purge blocking
 switch devlinks
Message-ID: <Y39ikbcqx5/pEc64@smile.fi.intel.com>
References: <20221124102056.393220-1-treapking@chromium.org>
 <20221124102056.393220-3-treapking@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221124102056.393220-3-treapking@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Nov 24, 2022 at 06:20:51PM +0800, Pin-yen Lin wrote:
> From: Prashant Malani <pmalani@chromium.org>
> 
> When using OF graph, the fw_devlink code will create links between the
> individual port driver (cros-ec-typec here) and the parent device for
> a Type-C switch (like mode-switch). Since the mode-switch will in turn
> have the usb-c-connector (i.e the child of the port driver) as a
> supplier, fw_devlink will not be able to resolve the cyclic dependency
> correctly.
> 
> As a result, the mode-switch driver probe() never runs, so mode-switches
> are never registered. Because of that, the port driver probe constantly
> fails with -EPROBE_DEFER, because the Type-C connector class requires all
> switch devices to be registered prior to port registration.
> 
> To break this deadlock and allow the mode-switch registration to occur,
> purge all the usb-c-connector nodes' absent suppliers. This eliminates
> the connector as a supplier for a switch and allows it to be probed.

...

> +	/*
> +	 * OF graph may have set up some device links with switches, since connectors have their
> +	 * own compatible. Purge these to avoid a deadlock in switch probe (the switch mistakenly
> +	 * assumes the connector is a supplier).
> +	 */

A bit too long lines...

> +	if (dev->of_node)

Why do you need this check?

> +		device_for_each_child_node(dev, fwnode)
> +			fw_devlink_purge_absent_suppliers(fwnode);

-- 
With Best Regards,
Andy Shevchenko


