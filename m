Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14B0EEB2;
	Mon,  4 Aug 2025 13:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754312480; cv=none; b=SFOJTmG3JdxWOwPvXRG1JI16wkezEpxMiAqXaWTnet9PRnlPsoBoOBM6Z4czrXzr54+zbmpdYTvXh+45DTdpjMXpfo8e/jaMyqUn/b4Q+3Se59DSTEJYWHDYU3twrg15H/UfkPAGj5/1ffPlSHeqJjihi5NfVuBACqOikx55trk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754312480; c=relaxed/simple;
	bh=Hid3X110vD+PaqKN+lf+vdCxTrjDqH0gjrw2Ce/UfPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cMR86TC9VNLiv1V5xIjukCK35pNP3Ms6SGSbl3XrNRIE+b13IQzTuueZR6qnSMiUb6/Itc9KDpy9ikAyKeM3i3vC9gtn22VJTNbywiYVqUObTVvzmMhp4fDfWUnD0byTy1wVJqJwO5sLcoGga3OONYTM4ZcD4Okjz+JwAx03Ufw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mYW1LsKa; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mYW1LsKa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754312479; x=1785848479;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hid3X110vD+PaqKN+lf+vdCxTrjDqH0gjrw2Ce/UfPE=;
  b=mYW1LsKaAu4H+/V8wW91YFPAR5KoAjVVWdf0Wjgydia+AIzOQQZ9G8v6
   igVPMvy+5PzOTxjJWqWsgiQCPtK5POX2J1rZgeY0ubuGCoVf8eGv94L2f
   tr8VNmg7ayTe8uAHZY6yxBud7s4KItJvqV5GGDYamadod8aB0xpUnQXm1
   bJbfUwcHLOJll0B0FdDI8c5xiX6vEm09caeXEZ5bN2MHvntaLmrmFILEM
   9ULqkNWWg3gipHftQIbUN9qngc9UeHuYg4M/2Xa4k/PDsoOBLXo96FQ+q
   HoOwu42flBHn7e+sXMrwhtAMqjfQ8cAELpHb+D9Da5ZLb/7+3uO7M0S8C
   g==;
X-CSE-ConnectionGUID: UKO5NLq/T+Sy28JoKH73Fg==
X-CSE-MsgGUID: CXQV31oiSwe0SPcDTJAtzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="59189542"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="59189542"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 06:01:18 -0700
X-CSE-ConnectionGUID: G6BN1QhYTqaMOUKpjbHEFg==
X-CSE-MsgGUID: ta1RXwa3SbWiPiRjpJ8YUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="164153964"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 04 Aug 2025 06:01:15 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiuoS-000027-17;
	Mon, 04 Aug 2025 13:01:12 +0000
Date: Mon, 4 Aug 2025 21:00:38 +0800
From: kernel test robot <lkp@intel.com>
To: Andrei Kuchynski <akuchynski@chromium.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: Re: [PATCH v3 05/10] usb: typec: Implement automated mode selection
Message-ID: <202508042044.JDdEBQcS-lkp@intel.com>
References: <20250804090340.3062182-6-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250804090340.3062182-6-akuchynski@chromium.org>

Hi Andrei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus chrome-platform/for-next chrome-platform/for-firmware-next linus/master v6.16 next-20250804]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrei-Kuchynski/usb-typec-Add-alt_mode_override-field-to-port-property/20250804-170745
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20250804090340.3062182-6-akuchynski%40chromium.org
patch subject: [PATCH v3 05/10] usb: typec: Implement automated mode selection
config: i386-buildonly-randconfig-002-20250804 (https://download.01.org/0day-ci/archive/20250804/202508042044.JDdEBQcS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508042044.JDdEBQcS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508042044.JDdEBQcS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/usb/typec/mode_selection.c:49 Enum value 'MS_STATE_MAX' not described in enum 'ms_state'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
