Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022EE325485
	for <chrome-platform@lists.linux.dev>; Fri, 21 Aug 2026 13:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787319445; cv=none; b=LcPSKdvvyXwcxa0Qg6jCShk0Fgz+ky95a8JI8Ha5Gjn1Z136NN22Kuhem0jFmGRebMlEceWgwTARcZBXIwPjuJsA2XglSSSrQs0YylQ7hMaIzTds8LIqoQAV8SIrkPV0QGuHFbTjGz7EjvA1ya4B2rcuJ73Wv6FZF5YxlL1ITqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787319445; c=relaxed/simple;
	bh=O4Blr+OuZ0h6Ey5JuBp9JB/aCVFzNrvMMQqnb0y1pFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DSgZFTTnnJjyYyjjvEInjNQK7st0GQdQ1Ar72INzIUW7+uvWpL+imM44fIRpk3mJZ/+Kc6Z3nuWdfIN6zoA6e48kvKdaeUECMwBEP7miZDSH9sMKyjI8fX1VhQVQbN+opS9eKaKs+c4hd8bVYqCiYwspFtub9Vl2Vqjc0TbC670=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sx7l6tK4; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sx7l6tK4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787319444; x=1818855444;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O4Blr+OuZ0h6Ey5JuBp9JB/aCVFzNrvMMQqnb0y1pFs=;
  b=Sx7l6tK4vcn94BnD8Xl4AYR8yvK8MEewgOavL46Dy1vR/oJ+IuRJhmFW
   /RtcbateRRj4x1pcFcUCMAt4XCJQ4Dk9MNcTmxy6dksAr6JyUMxzD0XMT
   D6r3jjHJ6UJZTo2U7/6gXwv4NWyNLZDfEq0kRvF/EyuVXpxMdIFHl6Jnp
   VdeXJl4ePCWqgkhQguJKUDj9KATWnBofr9lLjo9lODwofYLP87chq3m+N
   yOKkFHfTALV5W0MAneGLM7hOkQTgcnkxaFfRpTmzqpgHNwV3/z6Yebl8r
   51eaYLgm7tcOHmMtO8K1udNZe4VE/D41O0Ys+Y1Mzh3ZdkpwdTUH9Pq74
   w==;
X-CSE-ConnectionGUID: i14w47BhSu2QzEXk7whPfQ==
X-CSE-MsgGUID: yR68MPi/Rry7QXoPSxLYYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="91545326"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="91545326"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 06:37:24 -0700
X-CSE-ConnectionGUID: TbTwezGjTmSdJBOS7WzOCw==
X-CSE-MsgGUID: M6BCuENGRzqW2rykjT5W3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="263706552"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.241])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 06:37:20 -0700
Date: Fri, 21 Aug 2026 16:37:18 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Triet Hoang <triet.hoang.dev@gmail.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
	andy@kernel.org, bleung@chromium.org, groeck@chromium.org,
	linux-iio@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: cros_ec: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Message-ID: <aohUjlM5QZ7BLob3@ashevche-desk.local>
References: <20260821014454.15960-1-triet.hoang.dev@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821014454.15960-1-triet.hoang.dev@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 21, 2026 at 08:44:54AM +0700, Triet Hoang wrote:
> Convert the deprecated SIMPLE_DEV_PM_OPS
> to DEFINE_SIMPLE_DEV_PM_OPS and pm_sleep_ptr().
> 
> This lets us drop the __maybe_unused annotations
> from the resume callbacks, and reduces kernel size
> in case CONFIG_PM or CONFIG_PM_SLEEP is disabled.

There is room on the lines to make them longer a bit.

  Convert the deprecated SIMPLE_DEV_PM_OPS to DEFINE_SIMPLE_DEV_PM_OPS
  and pm_sleep_ptr().

  This lets us drop the __maybe_unused annotations from the resume callbacks,
  and reduces kernel size in case CONFIG_PM or CONFIG_PM_SLEEP is disabled.


...

> -SIMPLE_DEV_PM_OPS(cros_ec_sensors_pm_ops, NULL, cros_ec_sensors_resume);
> +DEFINE_SIMPLE_DEV_PM_OPS(cros_ec_sensors_pm_ops, NULL, cros_ec_sensors_resume);
>  EXPORT_SYMBOL_GPL(cros_ec_sensors_pm_ops);

There is a macro that combines DEFINE + EXPORT.

-- 
With Best Regards,
Andy Shevchenko


