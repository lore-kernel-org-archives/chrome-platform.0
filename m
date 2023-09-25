Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB31179B4
	for <chrome-platform@lists.linux.dev>; Mon, 25 Sep 2023 19:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695670076; x=1727206076;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G+AzBDEkkM1eADSIyN25cfwmNNwetV4UoEJVlZExwOM=;
  b=mcSKsmK+fvuttnbkFwZlr9HijaeSkU58RIqhNI378gs8Mz+17hRYBbxI
   olrH0fBAUxu7h5xiAVDOh/OcH34QnNEzYYE9p9NW9q6OpY37M+yfV6boQ
   tIDA0v08CPutNM+zStsjSwJivnpbfssDqUZqq3usoGWRg3u4jiPq25Ur8
   fxxFhU+bPw5L/JaKrEcdBpwQd8YUFx/JHyLeAgOsxf10rGvgEy9k0D8eh
   5prpuycCMfCAFU4MHrSu1ZTH5ytAwWD5iFnplk2MjvqsSbCSBNb6PZRGW
   sh8Oj2KS4kqeDxmPAoOudSSg9rA31RJXcRJ4W8E3G15jRuZfEggaZqNVy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="384123238"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="384123238"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 12:27:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="995506037"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="995506037"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 12:27:53 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC0)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qkrFG-00000000Q7q-3Fmf;
	Mon, 25 Sep 2023 22:27:50 +0300
Date: Mon, 25 Sep 2023 22:27:50 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Patel, Utkarsh H" <utkarsh.h.patel@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
	"pmalani@chromium.org" <pmalani@chromium.org>,
	"chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>,
	"bleung@chromium.org" <bleung@chromium.org>
Subject: Re: [PATCH v4 4/5] platform/chrome: cros_ec_typec: Add Displayport
 Alternatemode 2.1 Support
Message-ID: <ZRHfNoiDazz1ZDtD@smile.fi.intel.com>
References: <20230920023243.2494410-1-utkarsh.h.patel@intel.com>
 <20230920023243.2494410-5-utkarsh.h.patel@intel.com>
 <ZQsE5hgm4qYpr/My@smile.fi.intel.com>
 <CY4PR11MB0037E70612B8067062AC1C40A9FCA@CY4PR11MB0037.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY4PR11MB0037E70612B8067062AC1C40A9FCA@CY4PR11MB0037.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 25, 2023 at 03:54:40PM +0000, Patel, Utkarsh H wrote:

...

> > > +	/**
> > 
> > Are you sure?
> > 
> > > +	 * Get cable VDO for thunderbolt cables and cables with DPSID but
> > does not
> > > +	 * support DPAM2.1.
> > > +	 */
> > 
> Yes, there are TBT3 cables which advertise DPSID but does not provide any DP
> capabilities in the DP discover mode VDO but does support UHBR.  In that
> case, need to use TBTSID and use capabilities from TBT discover mode VDO.

My comment was against the style of the comment, not about content.

...

> > You can also make it a bit more readable with (use better names if you think it's
> > needed)
> > 
> > 	u32 signalling = 0;
> > 	u32 cable_type = 0;
> 
> In v2 version of this patch I had them but there was feedback to remove extra
> variables and use them inline. 

OK!

-- 
With Best Regards,
Andy Shevchenko


