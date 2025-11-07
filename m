Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D0230C361;
	Fri,  7 Nov 2025 07:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762501199; cv=none; b=USWmvSNrOJjokbmHFVBvZge6h0jYBU0CTFL/49xPVfubPz3Dg2ujgs7kuAZF/xAlmR2tNilpwOCCWwZzgXW6MdRbuVpBzYGYZ47aKBHqXgUjGy+Qr3taSAMBnJLO5ipCv/O8seFrhDIWwOq434cUu4EG/ylgg4kYWLpEOHeih7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762501199; c=relaxed/simple;
	bh=rlFu4NnKhWDiOltMj3WmHjKk2Ajfi86cpMomLpc6bKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ifmejfutStRYPZPAotD5VVqtrjkMqG2E3JEt4Y+gF/Qw2SOblHyyCUAuQ/mSSmScWldRX7Yfx8NupEPSweib7wTynncjivehXbFl9hZK5ef7IXRR+nutDpxP0flIamIHmvgV6vTNdtpCOfCev0pZf/+e6s5svNq0DbQKC9R5oo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BKCTsZ/4; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BKCTsZ/4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762501198; x=1794037198;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rlFu4NnKhWDiOltMj3WmHjKk2Ajfi86cpMomLpc6bKs=;
  b=BKCTsZ/4n74gh9ceEbEWP3BOkiG5pIkHwJQTpWzdu9NUkzSYte8yc1ox
   AFlW/ieYmXA2mrwQ7wzdS85wTJFT8ZWJjc1xRxsbekmlUA7DcpAQO965N
   9VapszJ664Iokg/h1aqgStqivvhcyiwErlr/W1/DI+HEWxRhofB4UIvY4
   +Vtm4itf0aT6ZXdKCmh4jX6LsRnU++B5oRS6fnIx0mRUixfzbUP5rftjX
   lkWuyFl/t55jR1ulDxykiiOQ5qXQiKOhCcctisTqqiSSLLh89Yu6M2jTR
   Caw7dxv4MXYvWegGzBi8HxKbdAQKM+SOQ2uQhULW5OLfaPazWIiITFzO6
   Q==;
X-CSE-ConnectionGUID: DlbJ+sCpRreZV1PaZaELag==
X-CSE-MsgGUID: 4NocEvtgS128xeV5sShdyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="76000882"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="76000882"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 23:39:57 -0800
X-CSE-ConnectionGUID: +0ucQ30lRcOw0tdX7J+Pew==
X-CSE-MsgGUID: 7Q7bjwH1TD6MzSF2xpzWww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="192070285"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 06 Nov 2025 23:39:53 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHH4Y-000UqK-24;
	Fri, 07 Nov 2025 07:39:50 +0000
Date: Fri, 7 Nov 2025 15:39:05 +0800
From: kernel test robot <lkp@intel.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>, Benson Leung <bleung@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-kselftest@vger.kernel.org, tzungbi@kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v6 1/2] platform/chrome: Protect cros_ec_device lifecycle
 with revocable
Message-ID: <202511071536.lzOOC7SE-lkp@intel.com>
References: <20251106152602.11814-2-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106152602.11814-2-tzungbi@kernel.org>

Hi Tzung-Bi,

kernel test robot noticed the following build errors:

[auto build test ERROR on chrome-platform/for-next]
[also build test ERROR on chrome-platform/for-firmware-next driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.18-rc4 next-20251107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tzung-Bi-Shih/platform-chrome-Protect-cros_ec_device-lifecycle-with-revocable/20251106-233349
base:   https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next
patch link:    https://lore.kernel.org/r/20251106152602.11814-2-tzungbi%40kernel.org
patch subject: [PATCH v6 1/2] platform/chrome: Protect cros_ec_device lifecycle with revocable
config: arc-randconfig-r072-20251107 (https://download.01.org/0day-ci/archive/20251107/202511071536.lzOOC7SE-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251107/202511071536.lzOOC7SE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511071536.lzOOC7SE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from gpio-cros-ec.c:18:
>> include/linux/platform_data/cros_ec_proto.h:15:10: fatal error: linux/revocable.h: No such file or directory
      15 | #include <linux/revocable.h>
         |          ^~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +15 include/linux/platform_data/cros_ec_proto.h

    10	
    11	#include <linux/device.h>
    12	#include <linux/lockdep_types.h>
    13	#include <linux/mutex.h>
    14	#include <linux/notifier.h>
  > 15	#include <linux/revocable.h>
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
