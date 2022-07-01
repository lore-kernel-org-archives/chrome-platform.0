Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B92957EF
	for <chrome-platform@lists.linux.dev>; Fri,  1 Jul 2022 20:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656708015; x=1688244015;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q6mKAlBk7wC2AkSO50kZNFYbSomC+VdZmIY6FZvyguo=;
  b=n/mVkFRI+MEv0YcasrdwsMvxXh5huEKgVVayqPf+kO9ne7w7zqOWWYSj
   DouesYOzlMiOzk0fD5CtJ/CT1bJ755CLBLbh9xDU3j6X+Ufx0FDF1Z8IB
   jtHXUUwpzBmwz3V4qDm9ChJxDJrAAqL7imTjDO6s2fsPR3eSH1qFW6GLu
   eXHypcqAgAJpgrhqsfu8b9QwsQH/cpohsM77a12J7Fh2zC1llsyGO4NeT
   1ny++EXNgHrV/IPi+ZIvSRf8bnILC0nE0N6uHvmQQDqJ9ANEfvtXLwrHE
   8b2mbdJlfeeqckaU+gEjwTbRrH+G/yYIWFH+oB+w1R5gjh4IzKzRfNBf3
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10395"; a="282769936"
X-IronPort-AV: E=Sophos;i="5.92,238,1650956400"; 
   d="scan'208";a="282769936"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2022 13:40:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,238,1650956400"; 
   d="scan'208";a="596391810"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 01 Jul 2022 13:40:04 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o7NQp-000EL0-Jy;
	Fri, 01 Jul 2022 20:40:03 +0000
Date: Sat, 2 Jul 2022 04:39:06 +0800
From: kernel test robot <lkp@intel.com>
To: Tim Van Patten <timvp@google.com>, LKML <linux-kernel@vger.kernel.org>
Cc: kbuild-all@lists.01.org, robbarnes@google.com, rrangel@chromium.org,
	Tim Van Patten <timvp@google.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH] platform/chrome: cros_ec: Send host event for
 prepare/complete
Message-ID: <202207020433.aSSwzWJn-lkp@intel.com>
References: <20220701095421.1.I78ded92e416b55de31975686d34b2058d4761c07@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220701095421.1.I78ded92e416b55de31975686d34b2058d4761c07@changeid>

Hi Tim,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on chrome-platform/for-next]
[also build test ERROR on linus/master v5.19-rc4 next-20220701]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Tim-Van-Patten/platform-chrome-cros_ec-Send-host-event-for-prepare-complete/20220701-235602
base:   https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next
config: i386-randconfig-a001 (https://download.01.org/0day-ci/archive/20220702/202207020433.aSSwzWJn-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/46055ab1171506ae76daf77f7b880087c8a9119f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tim-Van-Patten/platform-chrome-cros_ec-Send-host-event-for-prepare-complete/20220701-235602
        git checkout 46055ab1171506ae76daf77f7b880087c8a9119f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/platform/chrome/cros_ec_lpc.c:553:20: error: 'cros_ec_lpc_suspend' undeclared here (not in a function); did you mean 'cros_ec_suspend'?
     553 |         .prepare = cros_ec_lpc_suspend,
         |                    ^~~~~~~~~~~~~~~~~~~
         |                    cros_ec_suspend
>> drivers/platform/chrome/cros_ec_lpc.c:554:21: error: 'cros_ec_lpc_resume' undeclared here (not in a function); did you mean 'cros_ec_lpc_remove'?
     554 |         .complete = cros_ec_lpc_resume
         |                     ^~~~~~~~~~~~~~~~~~
         |                     cros_ec_lpc_remove


vim +553 drivers/platform/chrome/cros_ec_lpc.c

   551	
   552	static const struct dev_pm_ops cros_ec_lpc_pm_ops = {
 > 553		.prepare = cros_ec_lpc_suspend,
 > 554		.complete = cros_ec_lpc_resume
   555	};
   556	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
