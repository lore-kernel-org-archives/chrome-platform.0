Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93FC2C1B8;
	Thu,  8 Feb 2024 04:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707365312; cv=none; b=sEp5lOuVevMZkaI97A1+G6HmT6+WFlT85+GPi9pON1cTYb/NhxkjJ/7ceW7iZTMn2njuf1fJf+/bzAnKr1KFdiK/4wv79vMqj0UfZTCN2s5/xgNUXeYWTcwbygYyeTuSn2Zt2FscP+z++5plOM5v2MouViYxAc5Kx0AjAE+60s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707365312; c=relaxed/simple;
	bh=NkAI6H35ROaFu13zo+RHURA61NgMQ5XNqRAfgGx1xd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T19VL8n48Aa9P++mQkRD8KETUXroFRvu93mKaMOirdshAefIdqsY8+gtV7Rli+Sj9ct55u+bSZp1cHAqSKxeWKBKS3VfdLEabTuPjm7Y6jOdAQ4UlF7bZDiPcyzkrBAf9p9vIg9NieskhA8MfmYKchlZCLtxemcMAKPUcKUefhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TF3W8wo+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TF3W8wo+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707365311; x=1738901311;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NkAI6H35ROaFu13zo+RHURA61NgMQ5XNqRAfgGx1xd4=;
  b=TF3W8wo+GIXO/AHH86IkOwD1W4HqqA+rvf3Q0OYJrbAWNsPG+WD9cdG0
   DdpIKb0fsXBhP6P6ceuLEeeWuE7knyIKJxHtcFq/uKRd7s2uBJLcH1WuW
   yQn54TjKRi9Mfb796nCHuE+7G52I2+WZDICJ2AW04BZRz/oEW2lQg1dFe
   6zXL3288UqO3k1JI4ntjadUbFPV6DGOpi32RoVcrFl4YIyDKrwnfddIal
   k3bgJLGg6+qwTzn4a/FCFh61NDVdYYh91orGIgzLmJCnQP+u0h0sELhOn
   aXgoPRLXl7xQLqLGtBeIBQr0OCew2/pYIu9KOkGtUrLg+xH7xEoslnJgJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="11775900"
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="11775900"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 20:08:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="1531966"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Feb 2024 20:08:24 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXvi3-0003LK-2f;
	Thu, 08 Feb 2024 04:08:23 +0000
Date: Thu, 8 Feb 2024 12:07:40 +0800
From: kernel test robot <lkp@intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Prashant Malani <pmalani@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Emilie Roberts <hadrosaur@google.com>,
	"Nyman, Mathias" <mathias.nyman@intel.com>,
	"Regupathy, Rajaram" <rajaram.regupathy@intel.com>,
	"Radjacoumar, Shyam Sundar" <ssradjacoumar@google.com>,
	Samuel Jacob <samjaco@google.com>, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	Uday Bhat <uday.m.bhat@intel.com>
Subject: Re: [PATCH 2/2] platform/chrome: cros_ec_typec: Make sure the USB
 role switch has PLD
Message-ID: <202402081136.sve0cViZ-lkp@intel.com>
References: <20240207145851.1603237-3-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240207145851.1603237-3-heikki.krogerus@linux.intel.com>

Hi Heikki,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus chrome-platform/for-next chrome-platform/for-firmware-next driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.8-rc3 next-20240207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heikki-Krogerus/usb-roles-Link-the-switch-to-its-connector/20240207-230017
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20240207145851.1603237-3-heikki.krogerus%40linux.intel.com
patch subject: [PATCH 2/2] platform/chrome: cros_ec_typec: Make sure the USB role switch has PLD
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240208/202402081136.sve0cViZ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240208/202402081136.sve0cViZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402081136.sve0cViZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/chrome/cros_ec_typec.c: In function 'cros_typec_parse_port_props':
>> drivers/platform/chrome/cros_ec_typec.c:75:34: error: invalid use of undefined type 'struct acpi_device'
      75 |                 if (adev && !adev->pld_crc)
         |                                  ^~
   drivers/platform/chrome/cros_ec_typec.c:76:29: error: invalid use of undefined type 'struct acpi_device'
      76 |                         adev->pld_crc = to_acpi_device_node(fwnode)->pld_crc;
         |                             ^~
   drivers/platform/chrome/cros_ec_typec.c:76:68: error: invalid use of undefined type 'struct acpi_device'
      76 |                         adev->pld_crc = to_acpi_device_node(fwnode)->pld_crc;
         |                                                                    ^~


vim +75 drivers/platform/chrome/cros_ec_typec.c

    23	
    24	#define DP_PORT_VDO	(DP_CONF_SET_PIN_ASSIGN(BIT(DP_PIN_ASSIGN_C) | BIT(DP_PIN_ASSIGN_D)) | \
    25					DP_CAP_DFP_D | DP_CAP_RECEPTACLE)
    26	
    27	static int cros_typec_parse_port_props(struct typec_capability *cap,
    28					       struct fwnode_handle *fwnode,
    29					       struct device *dev)
    30	{
    31		struct fwnode_handle *sw_fwnode;
    32		const char *buf;
    33		int ret;
    34	
    35		memset(cap, 0, sizeof(*cap));
    36		ret = fwnode_property_read_string(fwnode, "power-role", &buf);
    37		if (ret) {
    38			dev_err(dev, "power-role not found: %d\n", ret);
    39			return ret;
    40		}
    41	
    42		ret = typec_find_port_power_role(buf);
    43		if (ret < 0)
    44			return ret;
    45		cap->type = ret;
    46	
    47		ret = fwnode_property_read_string(fwnode, "data-role", &buf);
    48		if (ret) {
    49			dev_err(dev, "data-role not found: %d\n", ret);
    50			return ret;
    51		}
    52	
    53		ret = typec_find_port_data_role(buf);
    54		if (ret < 0)
    55			return ret;
    56		cap->data = ret;
    57	
    58		/* Try-power-role is optional. */
    59		ret = fwnode_property_read_string(fwnode, "try-power-role", &buf);
    60		if (ret) {
    61			dev_warn(dev, "try-power-role not found: %d\n", ret);
    62			cap->prefer_role = TYPEC_NO_PREFERRED_ROLE;
    63		} else {
    64			ret = typec_find_power_role(buf);
    65			if (ret < 0)
    66				return ret;
    67			cap->prefer_role = ret;
    68		}
    69	
    70		/* Assing the USB role switch the correct pld_crc if it's missing. */
    71		sw_fwnode = fwnode_find_reference(fwnode, "usb-role-switch", 0);
    72		if (!IS_ERR_OR_NULL(sw_fwnode)) {
    73			struct acpi_device *adev = to_acpi_device_node(sw_fwnode);
    74	
  > 75			if (adev && !adev->pld_crc)
    76				adev->pld_crc = to_acpi_device_node(fwnode)->pld_crc;
    77			fwnode_handle_put(sw_fwnode);
    78		}
    79	
    80		cap->fwnode = fwnode;
    81	
    82		return 0;
    83	}
    84	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
