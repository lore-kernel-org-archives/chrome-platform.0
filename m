Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8635F36BCF5;
	Fri, 17 Apr 2026 07:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776412343; cv=none; b=OKievo8N1vQQ7xQRSS4kkpUUgAISAWaAD75qLmE0Cpd1U9wWvQct/qUhyxSceAnf8v8M3EcVC53/pnUesR8eMLAh9XmrHn+xH2HYYvnuywIGetifrYud1s9Xo9KjaZ5zshaU2qq4txHZbc9PoF/A/CIjAXSJc19ByUGN9zG2Wog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776412343; c=relaxed/simple;
	bh=/uecnCqjgyGlRr3YbSE/IG1XmSN5QUpGYNDoiYkBgdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MhSoNAs+tbXvVcBpEp1XuOiwwDx5WBNZroVSQE+cmHbxSbTnS115dOd0NI7mTs/F977yuzojwGZSryI32aqySgZ1GIPGtXHFXNeD289VsWlm1D9fN7WVJrwubwpuv4LRjptQvEanxq8SnCuYcr60qmupt1ksIdexEVWZYZuGnIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AdBS7SQo; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AdBS7SQo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776412342; x=1807948342;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/uecnCqjgyGlRr3YbSE/IG1XmSN5QUpGYNDoiYkBgdE=;
  b=AdBS7SQoa1TqBwlcR2RCNnN95jpo56l+o+rgeAUoIOjC/yIopEdyef3s
   i0kI2lku0aOW/99D3y+nAzevlUo8pCtk1OjMhgz7XI6EGtaz5/pXGxID+
   DwugNFcharkA1ntw2aygT+lgoTdF+xBlae9bLzzmFL2O24br7nAdfYD/N
   dKtjxvFF3MEg8hUyIVazTx614ime0UNC34ycYRDOVgPM0EBfFkdkc/vzH
   EXBhBETvLD9zQBtO4As3cz3PHFiEspeOODrTFsnspzinqdQWxGHszOgl5
   JAfHYhV03CbiM4D0eHs8LrkrDwJgBAA2+E5oMzerlTZG0uCjAIUkWEarg
   A==;
X-CSE-ConnectionGUID: qay6jWNUQqyYyGaPBHnhJA==
X-CSE-MsgGUID: 0ZlnBLoJT9KGhNll9Kx5wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="64963860"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="64963860"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 00:52:21 -0700
X-CSE-ConnectionGUID: 6JB0kbTWQQiCecVS7V0sLA==
X-CSE-MsgGUID: BdBBhy6BTeaRFZRLR5vNWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="229959698"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Apr 2026 00:52:18 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDdzr-00000000061-1QUl;
	Fri, 17 Apr 2026 07:52:15 +0000
Date: Fri, 17 Apr 2026 15:51:42 +0800
From: kernel test robot <lkp@intel.com>
To: Guangshuo Li <lgs201920130244@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Olof Johansson <olof@lixom.net>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: fix reference leak on failed device
 registration
Message-ID: <202604171521.d1s0T0Dr-lkp@intel.com>
References: <20260415175038.3633384-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415175038.3633384-1-lgs201920130244@gmail.com>

Hi Guangshuo,

kernel test robot noticed the following build errors:

[auto build test ERROR on chrome-platform/for-next]
[also build test ERROR on chrome-platform/for-firmware-next linus/master v7.0 next-20260416]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guangshuo-Li/platform-chrome-fix-reference-leak-on-failed-device-registration/20260416-135638
base:   https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next
patch link:    https://lore.kernel.org/r/20260415175038.3633384-1-lgs201920130244%40gmail.com
patch subject: [PATCH] platform/chrome: fix reference leak on failed device registration
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260417/202604171521.d1s0T0Dr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260417/202604171521.d1s0T0Dr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604171521.d1s0T0Dr-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/chrome/chromeos_pstore.c: In function 'chromeos_pstore_init':
>> drivers/platform/chrome/chromeos_pstore.c:131:17: error: 'ret' undeclared (first use in this function)
     131 |                 ret = platform_device_register(&chromeos_ramoops);
         |                 ^~~
   drivers/platform/chrome/chromeos_pstore.c:131:17: note: each undeclared identifier is reported only once for each function it appears in


vim +/ret +131 drivers/platform/chrome/chromeos_pstore.c

   119	
   120	static int __init chromeos_pstore_init(void)
   121	{
   122		bool acpi_dev_found;
   123	
   124		if (ecc_size > 0)
   125			chromeos_ramoops_data.ecc_info.ecc_size = ecc_size;
   126	
   127		/* First check ACPI for non-hardcoded values from firmware. */
   128		acpi_dev_found = chromeos_check_acpi();
   129	
   130		if (acpi_dev_found || dmi_check_system(chromeos_pstore_dmi_table)) {
 > 131			ret = platform_device_register(&chromeos_ramoops);
   132			if (ret)
   133				platform_device_put(&chromeos_ramoops);
   134	
   135			return ret;
   136		}
   137	
   138		return -ENODEV;
   139	}
   140	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
