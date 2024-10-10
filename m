Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EF315CD49
	for <chrome-platform@lists.linux.dev>; Thu, 10 Oct 2024 15:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728574351; cv=none; b=YeBY+UW5J1ewPv6qI9f7yK7l4x4iO7ee3WuHCT7qUwXGD+u2p4FoyAge35I72zHVaFTqAF6+sK9HifDXcZdsSKkmnRmS5oeSZCSLoQV5k0nGzSypkiP6tMABy3izPhkXCpx3+Wi0zlRyiA+cgKtoWVHAdRDhrAjpKGi+0MR3i4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728574351; c=relaxed/simple;
	bh=MP15bS4w3vSqH5JjlnyEj+lJuyt5Y2WkrfBOlfGovZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HwViEJ3AMTVygkWJv2Htr6AyFAz4stlGOAN2BuNlPd5+kcPYVFSEIYcDHGme+utqdzF58fLZK01b7gtUNoHS0zPp+Ja79RZih+otRQcKJMcgm/Mp3+DyV2bl5SMpPzbLvRvBoPpnmkwNIrvIbuhuCnEzYPJr4yh3aLuqBjDIqf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WCa0Ki/B; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WCa0Ki/B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728574350; x=1760110350;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MP15bS4w3vSqH5JjlnyEj+lJuyt5Y2WkrfBOlfGovZ8=;
  b=WCa0Ki/BoQYDzCz8SX+PVANmnRLewA4AvohLu1oICGXgUaxRqtPLN8Gx
   keKs57kCLLd6UkbWZoJDV2whPiJkHHM3TU7lKbvv13DoDLkF4FLlEGpA7
   a4PRc7sp93bFRdp/e35riIuX6hOUMh2R/QnzCvx1OiXCy3ukGwobn0f5Y
   q9gLHObhzTHc8wKccm2TNV8EvnubkLM0SbHxn9eHIM2x513VR695iE8Vt
   pj6Axfs8bDM0Fz1FT95saJRln0dy2BQ1wZpdeDIeQFc3lPMU69d+UPaWa
   Tu2Hn1y1dvAGckZOpc09+E+ura7dhSkovYyo24dvklA4/LlMHrBzTAmVt
   w==;
X-CSE-ConnectionGUID: hC8VuqGWRliCqZRxldqzeA==
X-CSE-MsgGUID: wqYgUFEuR76y3DuJduMtNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="45456267"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="45456267"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 08:32:30 -0700
X-CSE-ConnectionGUID: 8qbP8zovS+qEoDxs1TzEVw==
X-CSE-MsgGUID: BDJjDco/TJayOTFrgGJreA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="76828992"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 08:32:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1syv9K-00000001Zwx-1c2G;
	Thu, 10 Oct 2024 18:32:22 +0300
Date: Thu, 10 Oct 2024 18:32:22 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v8 7/8] platform/chrome: Introduce device tree hardware
 prober
Message-ID: <ZwfzhsvlPrxMi61j@smile.fi.intel.com>
References: <20241008073430.3992087-1-wenst@chromium.org>
 <20241008073430.3992087-8-wenst@chromium.org>
 <Zwfy6ER6sbr_QxsY@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zwfy6ER6sbr_QxsY@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Oct 10, 2024 at 06:29:44PM +0300, Andy Shevchenko wrote:
> On Tue, Oct 08, 2024 at 03:34:26PM +0800, Chen-Yu Tsai wrote:

...

> > +static const struct chromeos_i2c_probe_data chromeos_i2c_probe_dumb_touchscreen = {
> > +	.cfg = &(const struct i2c_of_probe_cfg) {
> 
> Perhaps you can introduce something like
> 
> #define DEFINE_I2C_OF_PROBE_CFG(_type_, _ops_)		\
> 	(struct ...) {					\
> 		.ops = _ops_,				\
> 		.type = #_type_,			\
> 	}
> 
> and use it here as
> 
> 	.cfg = DEFINE_I2C_OF_PROBE_CFG(touchscreen, NULL),
> 
> > +		.type = "touchscreen"
> 
> Ditto.

This was for leaving trailing comma.

> > +	}
> 
> Ditto.
> 
> > +};
> > +
> > +static const struct i2c_of_probe_cfg chromeos_i2c_probe_simple_trackpad_cfg = {
> > +	.ops = &i2c_of_probe_simple_ops,
> > +	.type = "trackpad"
> 
> Leave a comma.
> 
> > +};

...

> > +	.cfg = &chromeos_i2c_probe_simple_trackpad_cfg,
> 
> 	.cfg = DEFINE_I2C_OF_PROBE_CFG(trackpad, i2c_of_probe_simple_ops),
> 
> Or even
> 
> #define DEFINE_I2C_OF_PROBE_CFG_SIMPLE(_type_)			\
> 	DEFINE_I2C_OF_PROBE_CFG(type, &i2c_of_probe_simple_ops)

With that also looking at the above

#define DEFINE_I2C_OF_PROBE_CFG_NONE(_type_)				\
	DEFINE_I2C_OF_PROBE_CFG(type, NULL)

-- 
With Best Regards,
Andy Shevchenko


