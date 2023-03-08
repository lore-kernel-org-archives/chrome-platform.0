Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF04179CD
	for <chrome-platform@lists.linux.dev>; Wed,  8 Mar 2023 15:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678289367; x=1709825367;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=owSbRjkEpcd2ZX2bKJCsdkpjfymuIBaOdUaiCK1wEwU=;
  b=ZPi1UkLm76tKzD7s71J28I9jze6tz0N8amdW/21CLwFwTprTffTMELD9
   NAz4kWoM+jHRvvBcsHQBeZzb3JGrLXsIiQ0QQeP6RMq0zJLzR70+/oY1b
   br8qiJo04aZ7EXH1P3Dg9Fx8jUOfphk98xr2Wu18GkDDktx40/Cw5euRa
   WdfPNpDXWrl+YOiwICyp6bDASpKRETU8//s0ytKqDO6IWXRSVE/u8U9Yu
   ke16McbSCUomStofI1KBO+wiyhD9QcbOL/n0pViWwYfLRnO58MGtaJixR
   6C3iMWtBGa8B9+SFxeWb1IpEM/PuwyKiY/dyqdMwo0uSg3/WQqbp39IET
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="315840378"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="315840378"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 07:29:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="922819997"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="922819997"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 08 Mar 2023 07:28:58 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pZvip-00HUHL-09;
	Wed, 08 Mar 2023 17:28:55 +0200
Date: Wed, 8 Mar 2023 17:28:54 +0200
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
	Alex Deucher <alexander.deucher@amd.com>,
	Douglas Anderson <dianders@chromium.org>,
	Imre Deak <imre.deak@intel.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v13 03/10] drm/display: Add Type-C switch helpers
Message-ID: <ZAiptm03HzQila0M@smile.fi.intel.com>
References: <20230303143350.815623-1-treapking@chromium.org>
 <20230303143350.815623-4-treapking@chromium.org>
 <ZAXTVCAQpHvSj+6C@smile.fi.intel.com>
 <CAEXTbpf4zM+70BCef6rdfz35TQnQ+ozaXAvOaEZVnqqe6MDOOg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEXTbpf4zM+70BCef6rdfz35TQnQ+ozaXAvOaEZVnqqe6MDOOg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Mar 08, 2023 at 06:20:14PM +0800, Pin-yen Lin wrote:
> On Mon, Mar 6, 2023 at 7:49 PM Andy Shevchenko
> > On Fri, Mar 03, 2023 at 10:33:43PM +0800, Pin-yen Lin wrote:

...

> > > +     switch_desc->typec_ports = devm_kcalloc(dev, switch_desc->num_typec_switches,
> > > +                                             sizeof(struct drm_dp_typec_port_data),
> > > +                                             GFP_KERNEL);
> > > +     if (!switch_desc->typec_ports)
> > > +             return -ENOMEM;
> >
> > How often this function _can_ be called during the runtime?
> > If it's _possible_ to call it infinite times, consider *not* using devm.
> 
> I would expect this function to be only called during driver probing,
> and this is the case for the current users in this series. So I think
> this is only called once if EPROBDE_DEFER doesn't count.

No, deferred probe is not counted.

Can you add a word somewhere in the comment(?) to make this clear?

-- 
With Best Regards,
Andy Shevchenko


