Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA09811
	for <chrome-platform@lists.linux.dev>; Fri,  6 May 2022 12:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651841252; x=1683377252;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lgRANVpIeYbETu3AmcMFp1S7V1/cZNNLTeeu8Vwuz7k=;
  b=HSre+qRr9XmW7kgG4b62f8dToHUTXyl6XPBR6BEaefkNPyQnzUoH/8Gd
   khtDW3lVW3DEaADC3FXCPVm/SX3jpuwKTL/RyWWGFzqfz/6nxbETWatQC
   f1B0zbr9QeEdGSNtISkmFWrlYNDIGflnd3jYnkjcmLnh8+/s2XbS5c2IB
   hOkyqZTLWWxBka8YGbMMCrKU+q5i3Mz/icfEqXp4wKljx3GXpTIcyGE61
   8bnFPqjlw3v88EtqM7AjJ46LgKMB7hfhkakGBMUeKESFJOKVIn/Lnimjc
   oX23sLLriLcSPcxlMfen4kzjG7OMLJk5upSHrkp0EQuOHDMnyeOqThmZV
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="268352707"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="268352707"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2022 05:47:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="518024373"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 May 2022 05:47:25 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nmxMi-000DTo-H2;
	Fri, 06 May 2022 12:47:24 +0000
Date: Fri, 6 May 2022 20:47:07 +0800
From: kernel test robot <lkp@intel.com>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Enric Balletbo i Serra <eballetbo@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kbuild-all@lists.01.org, usama.anjum@collabora.com,
	Collabora Kernel ML <kernel@collabora.com>, groeck@chromium.org,
	dtor@chromium.org, gwendal@chromium.org, vbendeb@chromium.org,
	andy@infradead.org, Ayman Bagabas <ayman.bagabas@gmail.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	=?utf-8?B?Qmxhxb4=?= Hrastnik <blaz@mxxn.io>,
	Darren Hart <dvhart@infradead.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jeremy Soller <jeremy@system76.com>, Mattias Jacobsson <2pi@mok.nu>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Rajat Jain <rajatja@google.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v9] platform/chrome: Add ChromeOS ACPI device driver
Message-ID: <202205062057.LDuKncYN-lkp@intel.com>
References: <YnTw/iQ1Asjjmsb9@debian-BULLSEYE-live-builder-AMD64>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YnTw/iQ1Asjjmsb9@debian-BULLSEYE-live-builder-AMD64>

Hi Muhammad,

I love your patch! Perhaps something to improve:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on chrome-platform/for-next v5.18-rc5 next-20220506]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Muhammad-Usama-Anjum/platform-chrome-Add-ChromeOS-ACPI-device-driver/20220506-175951
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20220506/202205062057.LDuKncYN-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4f6407962feddc57bc7c80e5b29d5d339a1dba6c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Muhammad-Usama-Anjum/platform-chrome-Add-ChromeOS-ACPI-device-driver/20220506-175951
        git checkout 4f6407962feddc57bc7c80e5b29d5d339a1dba6c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/platform/chrome/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:15,
                    from drivers/platform/chrome/chromeos_acpi.c:13:
   drivers/platform/chrome/chromeos_acpi.c: In function 'chromeos_acpi_device_probe':
>> drivers/platform/chrome/chromeos_acpi.c:253:40: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'unsigned int' [-Wformat=]
     253 |                 dev_warn(&(pdev->dev), "Only %ld GPIO attr groups supported by the driver out of total %d.\n",
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:146:61: note: in expansion of macro 'dev_fmt'
     146 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   drivers/platform/chrome/chromeos_acpi.c:253:17: note: in expansion of macro 'dev_warn'
     253 |                 dev_warn(&(pdev->dev), "Only %ld GPIO attr groups supported by the driver out of total %d.\n",
         |                 ^~~~~~~~
   drivers/platform/chrome/chromeos_acpi.c:253:48: note: format string is defined here
     253 |                 dev_warn(&(pdev->dev), "Only %ld GPIO attr groups supported by the driver out of total %d.\n",
         |                                              ~~^
         |                                                |
         |                                                long int
         |                                              %d
   At top level:
   drivers/platform/chrome/chromeos_acpi.c:259:36: warning: 'chromeos_device_ids' defined but not used [-Wunused-const-variable=]
     259 | static const struct acpi_device_id chromeos_device_ids[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~


vim +253 drivers/platform/chrome/chromeos_acpi.c

   244	
   245	static int chromeos_acpi_device_probe(struct platform_device *pdev)
   246	{
   247		chromeos_acpi_gpio_groups = get_gpio_pkg_num(&pdev->dev);
   248	
   249		/* If platform has more GPIO attribute groups than the number of
   250		 * groups this driver supports, give out a warning message.
   251		 */
   252		if (chromeos_acpi_gpio_groups > (ARRAY_SIZE(chromeos_acpi_all_groups) - 2))
 > 253			dev_warn(&(pdev->dev), "Only %ld GPIO attr groups supported by the driver out of total %d.\n",
   254				 (ARRAY_SIZE(chromeos_acpi_all_groups) - 2), chromeos_acpi_gpio_groups);
   255		return 0;
   256	}
   257	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
