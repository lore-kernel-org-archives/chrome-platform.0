Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5407EF
	for <chrome-platform@lists.linux.dev>; Fri, 13 Jan 2023 16:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673629065; x=1705165065;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=93weZf/KV1XKc7pLT/H8eSFp0TBy5wZsPNjCGdWOgIg=;
  b=cy+ixoguk2R1lf3JwpOEuYJeu5nxS5xpvJp8i6Kzu2ivjvxmId03dYqF
   pfsIWJ8wgNalgbgjEr5vY8drofacBZH7BOkTEgKlZ5/+TZ4Dhb2cDSL7+
   FHbZRJHHZds1ZjtlFLPhxLZDahZa0B9rFTwV8QrjNNUwO1y7n2nEPFnPe
   NxbOrdp+NNjU82rfDGBe0KaVEM8F/6zlaGU9MNw4MOmzFYIvQSfhaqmIw
   QmGXwWoUFGaP0iY08HOMPp8bxlF93+s0mqgTb+BTDNXxhvIQUCvrFhjtC
   Jg4Kp09c+o+IxHu8SCYpZsoG9ld9qtr61srDmcb4fuFOwXuS2sbyq2z7v
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="304418913"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; 
   d="scan'208";a="304418913"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2023 08:57:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="800643053"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; 
   d="scan'208";a="800643053"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 13 Jan 2023 08:57:22 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pGNMk-008iZv-1X;
	Fri, 13 Jan 2023 18:57:18 +0200
Date: Fri, 13 Jan 2023 18:57:18 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Pin-yen Lin <treapking@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <robert.foss@linaro.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Marek Vasut <marex@denx.de>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Javier Martinez Canillas <javierm@redhat.com>,
	Lyude Paul <lyude@redhat.com>, chrome-platform@lists.linux.dev,
	Xin Ji <xji@analogixsemi.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org, Allen Chen <allen.chen@ite.com.tw>,
	linux-acpi@vger.kernel.org, Hsin-Yi Wang <hsinyi@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Imre Deak <imre.deak@intel.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Kees Cook <keescook@chromium.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	shaomin Deng <dengshaomin@cdjrlc.com>
Subject: Re: [PATCH v10 3/9] drm/display: Add Type-C switch helpers
Message-ID: <Y8GNbjTKGRg5WWCe@smile.fi.intel.com>
References: <20230112042104.4107253-1-treapking@chromium.org>
 <20230112042104.4107253-4-treapking@chromium.org>
 <Y8EjIKEHqcj3htqC@kuha.fi.intel.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8EjIKEHqcj3htqC@kuha.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Jan 13, 2023 at 11:23:44AM +0200, Heikki Krogerus wrote:
> On Thu, Jan 12, 2023 at 12:20:58PM +0800, Pin-yen Lin wrote:

...

> > +		dev_err(dev, "Failed to read the data-lanes variable from %s: %d\n",
> > +			node->name, ret);
> 
> 			fwnode_get_name(fwnode), ret);

Or even %pfwP ?

...

> > +	snprintf(name, sizeof(name), "%s-%u", node->name, port_num);
> 
> 	snprintf(name, sizeof(name), "%s-%u", fwnode_get_name(fwnode), port_num);

Ditto.

-- 
With Best Regards,
Andy Shevchenko


