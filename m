Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293A84A2C
	for <chrome-platform@lists.linux.dev>; Wed,  4 Sep 2024 13:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725455774; cv=none; b=nRLF/aUN0SaRrOOZnGkMukcBaReZgC48Ly/dQ35vhybc9M9X0YD8MhMDfm3wwYeAozqTLODMp+hIyD2Vy533DXPl9SpMG6LURW8SjT1+BAWBAUbePnp31KVYGAD5V3YmCStYwpvhhjdui6j1D0jfoggte6VRXEpEWjT6GK7v2wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725455774; c=relaxed/simple;
	bh=5RTrK2A/7XPuuwlK3ZUuX4mnuUZD8sPxcvFgKwNLL/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YE6r+DvN75xDQuT2AXGyfU5uGCc9xZw8uBBSKLtNr/+ik5rA47MrspMF7g1pk4HYvneXn9u4vONn6ZrvnusZLk4G5N4G6iy8trN1bzTVjbIgah/Umf6Bwi2wQ5zKqVYq/8/hA53fd1Brgzat8tLdoQYfeMKKSPoxXIY+5uJIbQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QcIDUmiv; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QcIDUmiv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725455773; x=1756991773;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5RTrK2A/7XPuuwlK3ZUuX4mnuUZD8sPxcvFgKwNLL/4=;
  b=QcIDUmivxUAgHh4a+2fwCM2RxzltbsOp6SQx/Vx/TP96+hICVirLd9og
   kombYNS3HNTU7W6RuEEhMnk81VqjyDIc4weaWXZDmfwh0Nq4HfkIMbP3t
   u0ekOWXVsKgSEFisCH1EBqHZQemQ2NkBZtlJSU9TuAe0Le5FZAVucJkJS
   eERj+soN7RLQal4EGa7vWZSQ/4byfo0Gql9Q3fN3zyWNUYZw4r44phudE
   XL8j5iWt52YRhr0fZ6BqzuB9aDOIIlkYWD5z9f8eGDnpMkR0ZDV/MHxUB
   DUlTVyf2xM5nJhOdTpMH9th7Yxb2MDvAQk0ekxJ7cb+U1bJtFprJWTQsR
   g==;
X-CSE-ConnectionGUID: sAXKtI6xS82bv89cTRG3lA==
X-CSE-MsgGUID: FMlbLHV5RIGSphY1KPCYHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="35275476"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="35275476"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:15:23 -0700
X-CSE-ConnectionGUID: VaOsEGIpSXuEKg1mjvoXOg==
X-CSE-MsgGUID: aTQ1ZcVKQp+mUqWGC6vE7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="65608995"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:15:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slpqe-000000054Q5-02f2;
	Wed, 04 Sep 2024 16:15:00 +0300
Date: Wed, 4 Sep 2024 16:14:59 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v6 03/12] regulator: Move OF-specific regulator lookup
 code to of_regulator.c
Message-ID: <ZthdU6UGlM75GJVj@smile.fi.intel.com>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-4-wenst@chromium.org>
 <ZthcBpx8WFIvsrJj@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZthcBpx8WFIvsrJj@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 04, 2024 at 04:09:26PM +0300, Andy Shevchenko wrote:
> On Wed, Sep 04, 2024 at 05:00:05PM +0800, Chen-Yu Tsai wrote:

> > +static struct device_node *of_get_child_regulator(struct device_node *parent,
> > +						  const char *prop_name)
> > +{
> > +	struct device_node *regnode = NULL;

> > +	struct device_node *child = NULL;

Btw, redundant assignment here, as child will be assigned anyway AFAIR.

> > +	for_each_child_of_node(parent, child) {
> 
> > +		regnode = of_parse_phandle(child, prop_name, 0);
> > +		if (!regnode) {
> > +			regnode = of_get_child_regulator(child, prop_name);
> > +			if (regnode)
> > +				goto err_node_put;
> > +		} else {
> > +			goto err_node_put;
> > +		}
> 
> I know this is just a move of the existing code, but consider negating the
> conditional and have something like
> 
> 		regnode = of_parse_phandle(child, prop_name, 0);
> 		if (regnode)
> 			goto err_node_put;
> 
> 		regnode = of_get_child_regulator(child, prop_name);
> 		if (regnode)
> 			goto err_node_put;
> 
> > +	}
> > +	return NULL;
> > +
> > +err_node_put:
> > +	of_node_put(child);
> > +	return regnode;
> > +}

-- 
With Best Regards,
Andy Shevchenko


