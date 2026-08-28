Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7266E3CB56D
	for <chrome-platform@lists.linux.dev>; Fri, 28 Aug 2026 06:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787899227; cv=none; b=uUwaadYPURUkLfJF08NWWUULwhnRLp67GBccrqvT3hei+OU7VMjniYGCXpUAKJ5E56hkIP5bAmUnA7iKyu/jYAhinGDOnlko/vf7N11wU5Q7QYCkHQ3RnykqKQdSmOvTNhlEmev6mU000KlDaAg50EVGXBS3vMg9pru47/S7IC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787899227; c=relaxed/simple;
	bh=9QvlRBJUdn2N3iAU+FRmGum1UMlhk2pHgIhQjwENwGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LFP4EuAvc8Xllk3kBRe7sKz0fs9s6okY+WUAIKQ5jof1kUwCegJCwQhfQJUJbOm77Bum3VViMmSMA/Lm8ZgBouYZR2uOHLRa4+WnbpTdR2ChdfY6eC1t1FRYxYHXCPNc9c7Sh4P0NZRKJquAjas0nQJKv2Gp9QtMD87fy+CKuxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mJk3CeTK; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mJk3CeTK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787899226; x=1819435226;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9QvlRBJUdn2N3iAU+FRmGum1UMlhk2pHgIhQjwENwGw=;
  b=mJk3CeTKBYPDv3vSQw18WcP/KMMheHzIoud4E4xz9fG7HEVu46DIZonI
   /298su59g/IvrmSAcNGGcAMbpM37J+xu7/hTtfPZ7B5RbwsDzp2L0IyYl
   56l6KHZbtBGiPhrPtq40Gxo/Mno6hCvjDqMSRXwNoTDR83LxuvR58TpRW
   h+7t9IO+PUi17JsyUaSaMiOqWtmejYb+9fRfxojMTkcVDIehn+YFA/CGn
   MdNfwtq0GCxC/A1LaimPuaP807e99g1iorb+0SEGHAU69X8q5BGPC7q3z
   RqQIuzis2qaqgPzYBvof6/N2jgTFTI19zVbB+vNC6+Z3H0YpnCCM4mOXz
   Q==;
X-CSE-ConnectionGUID: pfNXhv2FSYyMNGjVZ2zCQw==
X-CSE-MsgGUID: Mjkr4fGvRg2VQCsdc5wcVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88261040"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="88261040"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 23:40:25 -0700
X-CSE-ConnectionGUID: mK2sQyTwSWSIqCCAx4StHQ==
X-CSE-MsgGUID: 3ozsoMwcT5yZnVHFkjtDZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="268655173"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.34])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 23:40:22 -0700
Date: Fri, 28 Aug 2026 09:40:20 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Triet Hoang <triet.hoang.dev@gmail.com>
Cc: andy@kernel.org, bleung@chromium.org, chrome-platform@lists.linux.dev,
	dlechner@baylibre.com, groeck@chromium.org, jic23@kernel.org,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	nuno.sa@analog.com, tzungbi@kernel.org
Subject: Re: [PATCH v4] iio: cros_ec: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Message-ID: <apEtVIAPv07KFPQB@ashevche-desk.local>
References: <20260828021350.1666063-1-triet.hoang.dev@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828021350.1666063-1-triet.hoang.dev@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 28, 2026 at 09:13:49AM +0700, Triet Hoang wrote:
> Convert deprecated SIMPLE_DEV_PM_OPS() to DEFINE_SIMPLE_DEV_PM_OPS()
> and pm_sleep_ptr(). Also replace SIMPLE_DEV_PM_OPS() + EXPORT_SYMBOL_GPL()
> with EXPORT_GPL_SIMPLE_DEV_PM_OPS().
> 
> This allows us to drop the __maybe_unused annotations from the resume callback.
> This is a straightforward cleanup with no functional change intended.

LGTM now,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


