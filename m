Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A7C154C0B
	for <chrome-platform@lists.linux.dev>; Mon, 14 Oct 2024 11:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728904576; cv=none; b=j8bWpH9Co5tLio2m/iCNKZk1qwbUBupZ7sUoJ2A8oBKuI/Q0S/NNJGCfGB2RqDoSue/poEex8cZGYP3MvpyL/20FOm46LyBOTKBoLxZpXe01qSEEUdj+2b3FXIIJFT49XhjU7u8WCIKAsXEEZMytsWCRgAiwsoTS64X0w3G4Zjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728904576; c=relaxed/simple;
	bh=diqbe8v7QmoEpj4SUWtjif2WUvBD6+uTDFf6w7M0FM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ctWYxSkuse/AEIpriYU0bxcCv9q6app+0rntLoezvoOMM6F9+2vZQT/w2oHbvZ87wOAt3FtKP9MSvjKMUpgTMOiaD5fHUQKFJ/uIt4iz7I0uIU51Jp5x3X3J4vBBrOzOq0/CjmFNsuDJhO8X2JUAsTISNws1qE7aN2bJGg2urkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b4+9STBI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b4+9STBI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728904575; x=1760440575;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=diqbe8v7QmoEpj4SUWtjif2WUvBD6+uTDFf6w7M0FM8=;
  b=b4+9STBItQlhN7zDuwM/DLAVYpa4GO3yHXw0KDjFPKVCszy/5haZAqZ+
   vv4zEA2OqXhJv94FNPOBx8a36HPKztPIvXycuun23f3nJxOmI9wNp+POU
   lBtTgmPqyeg/WCPP8AApvStTCVt95Qgo34ooLt9Swd0hRAQQaFYFOSB/a
   8mQIOyra6QlO3enFn/PIXjcCwChoDscEli7E6TpFEE59Zt/rmJWmIaNLN
   EYdZYs0DQA1DHxXXrSlMjyzmN2flSE+YIGqfBBbS3ScCPbMYYZprpIukO
   BQZyzGJNu3lvDsSL2IoroJZjYW3YOITWf9DprAp6B5yFoDQQYKz2zGvOF
   g==;
X-CSE-ConnectionGUID: nT89tU5cSH+7JyG8VgfQfQ==
X-CSE-MsgGUID: UarIo7Y2RMyYHmNNFpzlcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45721220"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="45721220"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 04:16:14 -0700
X-CSE-ConnectionGUID: F7kxP5ktT96AFNZ0M+Zjdg==
X-CSE-MsgGUID: 14W+s8UkRyyg6QVnDq6lyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="77171383"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 04:16:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t0J3W-00000002sPr-1VL8;
	Mon, 14 Oct 2024 14:16:06 +0300
Date: Mon, 14 Oct 2024 14:16:06 +0300
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
Message-ID: <Zwz9djqb0Q6Ujmo_@smile.fi.intel.com>
References: <20241008073430.3992087-1-wenst@chromium.org>
 <20241008073430.3992087-5-wenst@chromium.org>
 <ZwfvuA2WhD_0P3gL@smile.fi.intel.com>
 <CAGXv+5Hm62hFsF27B-cEWTJ_AKrhcfCPaqR7BxmpwnjABzwHTQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5Hm62hFsF27B-cEWTJ_AKrhcfCPaqR7BxmpwnjABzwHTQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Oct 14, 2024 at 11:53:47AM +0800, Chen-Yu Tsai wrote:
> On Thu, Oct 10, 2024 at 11:16 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Oct 08, 2024 at 03:34:23PM +0800, Chen-Yu Tsai wrote:

...

> > Fresh reading of the commit message make me think why the firmware or
> > bootloader on such a device can't form a dynamic OF (overlay?) to fulfill
> > the need?
> 
> The firmware / bootloader on existing devices are practically not upgradable.
> On the other hand, the kernel is very easy to upgrade or swap out.
> 
> For said shipped devices, there is also nothing to key the detection
> off of besides actually powering things up and doing I2C transfers,
> which takes time that the firmware has little to spare. We (ChromeOS)
> require that the bootloader jump into the kernel within 1 second of
> power on. That includes DRAM calibration, whatever essential hardware
> initialization, and loading and uncompressing the kernel. Anything
> non-essential that can be done in the kernel is going to get deferred
> to the kernel.
> 
> Also, due to project timelines oftentimes the devices are shipped with a
> downstream kernel with downstream device trees. We don't want to tie the
> firmware too tightly to the device tree in case the downstream stuff gets
> reworked when upstreamed.

Okay, I was always under impression that DT has at least one nice feature in
comparison with ACPI that it can be replaced / updated in much quicker /
independent manner. What you are telling seems like the same issue that
ACPI-based platforms have. However, there they usually put all possible devices
into DSDT and firmware enables them via run-time (ACPI) variables. Are you
trying to implement something similar here?

...

> > Another question is that we have the autoprobing mechanism for I2C for ages,
> > why that one can't be (re-)used / extended to cover these cases?
> 
> I haven't looked into it very much, but a quick read of
> Documentation/i2c/instantiating-devices.rst suggests that it's solving
> a different problem?
> 
> In our case, we know that it is just one of a handful of possible
> devices that we already described in the device tree. We don't need
> to probe the full address range nor the full range of drivers. We
> already have a hacky workaround in place, but that mangles the
> device tree in a way that doesn't really match the hardware.
> 
> The components that we are handling don't seem to have any hardware
> ID register, nor do their drivers implement the .detect() callback.
> There's also power sequencing (regulator and GPIO lines) and interrupt
> lines from the device tree that need to be handled, something that is
> missing in the autoprobe path.
> 
> Based on the above I don't think the existing autoprobe is a good fit.
> Trying to shoehorn it in is likely going to be a mess.
> 
> Doug's original cover letter describes the problem in more detail,
> including why we think this should be done in the kernel, not the
> firmware:
> https://lore.kernel.org/all/20230921102420.RFC.1.I9dddd99ccdca175e3ceb1b9fa1827df0928c5101@changeid/

Perhaps it needs to be summarised to cover at least this question along with
the above?

-- 
With Best Regards,
Andy Shevchenko


