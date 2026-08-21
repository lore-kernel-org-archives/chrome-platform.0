Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC4A2DC321
	for <chrome-platform@lists.linux.dev>; Fri, 21 Aug 2026 16:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328107; cv=none; b=YLtszsTAsOXdADg3NX3S2qI3fy69ykkv2z1LmzQcKnlY1vAYzFU7aSn4z+wq5j6ZXJ4mZIgmHfczDWQrlh6VW6FvgCQXuu1wbgx1pgVXBk77zo9YLI6nJpT8tbDuWZ/mNwOVR1rb/02lSrLxkxA3ZLCi77tKEKNgQ3lWHm8Zixk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328107; c=relaxed/simple;
	bh=wemf2gE1hMWZpseJAaIDabprgBcaAwrypXd9wmjRVu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iUQYQy8XV5mcV+JFnPgl7BFJ4HrZxyZs3YTGzKNVaF/kglBVuD18Nqh1PnyTgfFfhE5ZPsYmMImAAPoeaIdiJVWACwulSuqIrsRJlU6iRCPGRyuVNGLk5r+OxfI74LRkGcNaiU060JWNGNwcryz0s+wsYrx2W3cEjNq677FzsO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ipff3FId; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ipff3FId"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787328106; x=1818864106;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wemf2gE1hMWZpseJAaIDabprgBcaAwrypXd9wmjRVu4=;
  b=Ipff3FIdUo9oZZ65w3Zhhtu5GJTfSsS+DgtNavUKJ68qMTnQ3QY4PGCy
   xYgd2/SvinuEHpTIueeBI5OPGSvcPKmpu6e3QogmlFhtea1ibGF27b5jT
   O5D+fJaVqTqUjlxk8km9yC2O2GLhmFeM6SEc+JH4wxvpKw4bp2FY4u8/1
   6JGi7JN1iWIjI6/Ov1h+34F91Tb4NzLqq+US9E8W1N/HlinHsAbgVvcWu
   MBRPkWo5hmVjj7Ejcaq+0UlzjTkrRhRjCO3wW0AN+PcrlQfGkmxky/dOM
   MpXGXvp9b1ReNXAmlDFvz65hEHmLLGQDRaghqVwdjkEnHUKoVIy8ak78W
   w==;
X-CSE-ConnectionGUID: Kzbl8ApyRaiTprPKM9FI6Q==
X-CSE-MsgGUID: MoUcaNcHQeuReYHfpKy97w==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="91754587"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="91754587"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 09:01:31 -0700
X-CSE-ConnectionGUID: svu2B3YeRaCL420nD9FP5w==
X-CSE-MsgGUID: 4cfsBc4yQv6vVinIoG4vtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="266979842"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.241])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 09:01:27 -0700
Date: Fri, 21 Aug 2026 19:01:25 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Triet Hoang <triet.hoang.dev@gmail.com>
Cc: andy@kernel.org, bleung@chromium.org, chrome-platform@lists.linux.dev,
	dlechner@baylibre.com, groeck@chromium.org, jic23@kernel.org,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	nuno.sa@analog.com
Subject: Re: [PATCH] iio: cros_ec: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Message-ID: <aoh2VZ5nrZIPQUt2@ashevche-desk.local>
References: <aohUjlM5QZ7BLob3@ashevche-desk.local>
 <20260821140451.3969-1-triet.hoang.dev@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821140451.3969-1-triet.hoang.dev@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 21, 2026 at 02:04:50PM +0000, Triet Hoang wrote:
> On Fri, 21 Aug 2026 16:37:18 +0300, Andy Shevchenko wrote:
> > There is a macro that combines DEFINE + EXPORT.
> 
> Thanks for reviewing. Should I send the v2 with the update?

v2 should incorporate the requested changes.

> > There is room on the lines to make them longer a bit.
> > 
> >   Convert the deprecated SIMPLE_DEV_PM_OPS to DEFINE_SIMPLE_DEV_PM_OPS
> >   and pm_sleep_ptr().
> > 
> >   This lets us drop the __maybe_unused annotations from the resume callbacks,
> >   and reduces kernel size in case CONFIG_PM or CONFIG_PM_SLEEP is disabled.
> 
> With the new commit that you have suggested.

It should be a new version of the same change, but with the comments being
addressed.

-- 
With Best Regards,
Andy Shevchenko


