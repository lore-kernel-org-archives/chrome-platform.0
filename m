Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284221DA627
	for <chrome-platform@lists.linux.dev>; Wed,  4 Sep 2024 13:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725457334; cv=none; b=svYUkAdOHtPp5ZVZikexOjobLGe2s2DO7dFeSZBPGtZ9kMfwkabUBq5bDFDB07fASPP9/VxXXJWCoIJ45T5q0fN6rgxLcaPT7bj5YN5K6lrwR+sC3nNo06QXFW7EvwFsCXJe4lQczAccDDuLfJlkuvthqcrR3itGOmpcMfKxHoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725457334; c=relaxed/simple;
	bh=NINj+1oq4hrfppG9fWwkMRuDXoIUekzuXgqNElLQs0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a7RzAJpDtFCJigVpYYlth4MFtjrltyBjYZTnXDq1ZJZmtf/ts3ks3UIZQGMg5k6f52PGS/pmjkQYc1Cu+IWwOWTQ6mdSMFxwzk3gzguw/Bin9K9YZ095X8scYuhYdtnHrTW2XkkUnOd1OuOZzzocoYnCp34bUywVCoGrPkGk6g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ExMSmYtE; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ExMSmYtE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725457333; x=1756993333;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NINj+1oq4hrfppG9fWwkMRuDXoIUekzuXgqNElLQs0M=;
  b=ExMSmYtEjiTuTRLZRzTjdiRp1iqMaRKxxr+CZJBn9TOMALh7LjWIqB3i
   UWbAqTpTf+CTWIuwPWOQlAGujo0xYqfCOk1IOjxKABX+z5bZt1s7xbwQX
   um1ZDH6Tcb+5267BZC1dUD92ovPe1m3kjWdv8vm0VkkhtJfrZguYJqzME
   bl3bGiesMXzGGIqpWJr8wkhHocaWdg69r5cw8N3LglnUpxxjU3LYDN5ip
   rK5UiWdy9iNZrug4ZARsnVbXj69E5kRVnAI64qOgSYB3uziWYSm1CLpAZ
   X8sj2UIfHRmfbSogYe/UZOuNU75mbwdTh1tt1HN/YEnaj6MiykraymEhd
   g==;
X-CSE-ConnectionGUID: YbMQ/8mbT+extv8uG02yGQ==
X-CSE-MsgGUID: i1GezGvIQ6ucH9l72YLDFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24070507"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="24070507"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:42:12 -0700
X-CSE-ConnectionGUID: 9OjySTKyQw6NDxzamnIErA==
X-CSE-MsgGUID: 0+LQUU0fQKa5kG2MyEgvgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="65618042"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:42:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slqGq-000000054o4-3OEs;
	Wed, 04 Sep 2024 16:42:04 +0300
Date: Wed, 4 Sep 2024 16:41:36 +0300
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
Subject: Re: [PATCH v6 07/12] i2c: core: Remove extra space in Makefile
Message-ID: <ZthjkJwtpz9gU9hI@smile.fi.intel.com>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-8-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904090016.2841572-8-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 04, 2024 at 05:00:09PM +0800, Chen-Yu Tsai wrote:
> Some lines in the Makefile have a space before tabs. Remove those.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


