Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2CC18A95E
	for <chrome-platform@lists.linux.dev>; Wed,  4 Sep 2024 13:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725455613; cv=none; b=Tx3gk50HLl6prAnyiwpEbw0thZlep3fVi0/QiV/qW7kycx1Qc+XtaCmYu+tka4ry2lfo6KKFc3Db5isi6HAv74RCBdiLLqAJ+zhUoE/qaKjDqSo8zXONjsJ+jbJqaZc5OrXj/ZbUXml+Q4Cvz3B30enxgvzAjVzcZTFk0uyCFn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725455613; c=relaxed/simple;
	bh=zHIc1Xe49cAdQbrSE9iC8kis8SkfxhbbHfvV3kPeSfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e3JSoSDpbraAnCWBLnH5WxlHVpH8fH0uS+KVlgeHCqqbI76Il15/NfOg65z2duLfSUHfdWUkySzRbFhB5Ei1oyetYlqiItUNAv8FqlqoumwQfJCc01EUGQPTwkCoWQ+DaCGhBMXTQ2ud7lWQAV0CKE6QlkofC9JucdSlJsCOS+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tbu933Aq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tbu933Aq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725455612; x=1756991612;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zHIc1Xe49cAdQbrSE9iC8kis8SkfxhbbHfvV3kPeSfA=;
  b=Tbu933AqvgAgh+hSF1nNy9V8+bHfaf4Am+wgwyaFCbVM6qTlsI1pIyoO
   o2pTOy4I4t3UjEIu9JfwjSjiiyhYRNZZ/h9OyutFX38+Gr54xeR+XoQHz
   kSw4Zq+dRm99FRbg/e7Gj7Kne/elBnNuDkG6H1UZvYJ5ZZ3ZLF4pWfbit
   s723QLQRBHdNAo1aGzER/NjGRzbN2hI+Yna5DhU8Bk/730pZK9pXJG3Z7
   RzwuDbFTEKqTU8xx8gTe24uHlvYcQExJw0iKQeD5M3rJW52QrpURgOZCR
   dEVUCDTD7Mw38DWVrk1cTicx0a+C6XFjq0A0+NghOg2l4R5ZvPzQsHAvb
   w==;
X-CSE-ConnectionGUID: 2bNWT1PKTOibPWekvNxvwg==
X-CSE-MsgGUID: pvGukXeoQg6nJjODYxmN8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="27904059"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="27904059"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:13:31 -0700
X-CSE-ConnectionGUID: nqlk14NrR3qCkWhyjarSeQ==
X-CSE-MsgGUID: EbYFOQjIR46uSDvJ0f9PEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="69894307"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:13:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slpp5-000000054Ne-0cgl;
	Wed, 04 Sep 2024 16:13:23 +0300
Date: Wed, 4 Sep 2024 16:13:22 +0300
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
Subject: Re: [PATCH v6 05/12] regulator: Do pure DT regulator lookup in
 of_regulator_bulk_get_all()
Message-ID: <Zthc8r62z2eaR8k0@smile.fi.intel.com>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-6-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904090016.2841572-6-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 04, 2024 at 05:00:07PM +0800, Chen-Yu Tsai wrote:
> The to-be-introduced I2C component prober needs to enable regulator
> supplies (and toggle GPIO pins) for the various components it intends
> to probe. To support this, a new "pure DT lookup" method for getting
> regulator supplies is needed, since the device normally requesting
> the supply won't get created until after the component is probed to
> be available.
> 
> Convert the existing of_regulator_bulk_get_all() for this purpose.
> This function has no in-tree users, as the original patch [1] that
> used it was never landed. This patch changes the function ABI, but
> it is straightforward to convert users.
> 
> The underlying code that supports the existing regulator_get*()
> functions has been reworked in previous patches to support this
> specific case. An internal OF-specific version of regulator_get(),
> of_regulator_get_optional(), is added for this.
> 
> Also convert an existing usage of "dev && dev->of_node" to
> "dev_of_node(dev)".

> [1] https://lore.kernel.org/all/20231220203537.83479-2-jernej.skrabec@gmail.com/
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Make it Link tag.

  Link: https://lore.kernel.org/all/20231220203537.83479-2-jernej.skrabec@gmail.com/ [1]
  Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

-- 
With Best Regards,
Andy Shevchenko


