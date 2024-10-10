Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5DE38DE1
	for <chrome-platform@lists.linux.dev>; Thu, 10 Oct 2024 15:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728573384; cv=none; b=uvBZ/hvRf5nUddztRC0AA0x+DveYx1TAUURReJ6leqSxGKlh5Oyu1xzjgNFiqpaRiFE6puwzNwe6h0PM1wZXTo+A4h5skS3Lz+7annbnwWBnvXY/ap4fnd7VfrCHv62vetegQv9W6/VVvRnFoRZFwGjHvw7C1WNxW6xSCy5Worg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728573384; c=relaxed/simple;
	bh=3r7XjWCd7n9+cKPDndkUACyizjbXDe/S2rPom65uPUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXKiSf3/9bThjzqGOoZd6EIxBK1qKn2ShNb9qdDBJ/cH5ob+JZL3zYCWy/ORxj5wJ9wSU9C8FYv/CymlAy5XlhcaiJGxW4A79n4QDSiPorOUqK73dJef6YV3Yy5pHkTktuZuOtbjRoCA/Bqtz+KGZxMyCIMbBgukMyiI4EEqaQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aDKhUki1; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aDKhUki1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728573383; x=1760109383;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3r7XjWCd7n9+cKPDndkUACyizjbXDe/S2rPom65uPUI=;
  b=aDKhUki1LFSCDxmxuMyNa0ekR+Mmmlz3cVhVUxfVCRzR14arOG++WTq3
   fTe/C4zsYf70EpKaDKEl2PTtzt0ymc8iqEGG8kUHH+tIl2c867e2Zr0A8
   xxXTPA6lzSDd/aG/TJoDt6XI/QA3eY2aRbq6Zr5Ml8PHtquuNI+O34Zf5
   pS7hKkcGvxqaDawyd0dl0aB+I9Ig93kwhF3ywWSCtm5vgtOUZkakqV3n5
   1I/WDAenB/QkMEjBvWgG2Nx06DH4tHY+2f5vUihRmtb7THA2sHVjBBm0c
   ZolTVwuDh2oZriXRikUg1AWh0blrwpC6myR4REfgQgVGMKjRFXD6ykwEJ
   g==;
X-CSE-ConnectionGUID: vMT1txADQR+OoYyOOVMB5g==
X-CSE-MsgGUID: NKCkhdSuTXetlGRkQ2rMVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27810878"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="27810878"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 08:16:17 -0700
X-CSE-ConnectionGUID: TnDZstXQSZeeixD90okhAA==
X-CSE-MsgGUID: ALlT+SXEQ2qwUWC6WyZnRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="81439049"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 08:16:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1syutc-00000001Zgw-2s69;
	Thu, 10 Oct 2024 18:16:08 +0300
Date: Thu, 10 Oct 2024 18:16:08 +0300
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
Subject: Re: [PATCH v8 4/8] i2c: Introduce OF component probe function
Message-ID: <ZwfvuA2WhD_0P3gL@smile.fi.intel.com>
References: <20241008073430.3992087-1-wenst@chromium.org>
 <20241008073430.3992087-5-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008073430.3992087-5-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Oct 08, 2024 at 03:34:23PM +0800, Chen-Yu Tsai wrote:
> Some devices are designed and manufactured with some components having
> multiple drop-in replacement options. These components are often
> connected to the mainboard via ribbon cables, having the same signals
> and pin assignments across all options. These may include the display
> panel and touchscreen on laptops and tablets, and the trackpad on
> laptops. Sometimes which component option is used in a particular device
> can be detected by some firmware provided identifier, other times that
> information is not available, and the kernel has to try to probe each
> device.
> 
> This change attempts to make the "probe each device" case cleaner. The
> current approach is to have all options added and enabled in the device
> tree. The kernel would then bind each device and run each driver's probe
> function. This works, but has been broken before due to the introduction
> of asynchronous probing, causing multiple instances requesting "shared"
> resources, such as pinmuxes, GPIO pins, interrupt lines, at the same
> time, with only one instance succeeding. Work arounds for these include
> moving the pinmux to the parent I2C controller, using GPIO hogs or
> pinmux settings to keep the GPIO pins in some fixed configuration, and
> requesting the interrupt line very late. Such configurations can be seen
> on the MT8183 Krane Chromebook tablets, and the Qualcomm sc8280xp-based
> Lenovo Thinkpad 13S.
> 
> Instead of this delicate dance between drivers and device tree quirks,
> this change introduces a simple I2C component probe function. For a
> given class of devices on the same I2C bus, it will go through all of
> them, doing a simple I2C read transfer and see which one of them responds.
> It will then enable the device that responds.
> 
> This requires some minor modifications in the existing device tree. The
> status for all the device nodes for the component options must be set
> to "fail-needs-probe". This makes it clear that some mechanism is
> needed to enable one of them, and also prevents the prober and device
> drivers running at the same time.

Fresh reading of the commit message make me think why the firmware or
bootloader on such a device can't form a dynamic OF (overlay?) to fulfill
the need?

Another question is that we have the autoprobing mechanism for I2C for ages,
why that one can't be (re-)used / extended to cover these cases?

...

> +#ifndef _LINUX_I2C_OF_PROBER_H
> +#define _LINUX_I2C_OF_PROBER_H

Missing kconfig.h.

> +struct device;
> +struct device_node;
> +
> +/**
> + * struct i2c_of_probe_ops - I2C OF component prober callbacks
> + *
> + * A set of callbacks to be used by i2c_of_probe_component().
> + *
> + * All callbacks are optional. Callbacks are called only once per run, and are
> + * used in the order they are defined in this structure.
> + *
> + * All callbacks that have return values shall return %0 on success,
> + * or a negative error number on failure.
> + *
> + * The @dev parameter passed to the callbacks is the same as @dev passed to
> + * i2c_of_probe_component(). It should only be used for dev_printk() calls
> + * and nothing else, especially not managed device resource (devres) APIs.
> + */
> +struct i2c_of_probe_ops {
> +	/**
> +	 * @enable: Retrieve and enable resources so that the components respond to probes.
> +	 *
> +	 * Resources should be reverted to their initial state before returning if this fails.
> +	 */
> +	int (*enable)(struct device *dev, struct device_node *bus_node, void *data);
> +
> +	/**
> +	 * @cleanup_early: Release exclusive resources prior to enabling component.
> +	 *
> +	 * Only called if a matching component is actually found. If none are found,
> +	 * resources that would have been released in this callback should be released in
> +	 * @free_resourcs_late instead.
> +	 */
> +	void (*cleanup_early)(struct device *dev, void *data);
> +
> +	/**
> +	 * @cleanup: Opposite of @enable to balance refcounts and free resources after probing.
> +	 *
> +	 * Should check if resources were already freed by @cleanup_early.
> +	 */
> +	void (*cleanup)(struct device *dev, void *data);
> +};
> +
> +/**
> + * struct i2c_of_probe_cfg - I2C OF component prober configuration
> + * @ops: Callbacks for the prober to use.
> + * @type: A string to match the device node name prefix to probe for.
> + */
> +struct i2c_of_probe_cfg {
> +	const struct i2c_of_probe_ops *ops;
> +	const char *type;
> +};
> +
> +#if IS_ENABLED(CONFIG_OF_DYNAMIC)
> +
> +int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cfg, void *ctx);
> +
> +#endif /* IS_ENABLED(CONFIG_OF_DYNAMIC) */
> +
> +#endif /* _LINUX_I2C_OF_PROBER_H */

-- 
With Best Regards,
Andy Shevchenko


