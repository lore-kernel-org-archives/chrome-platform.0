Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B540817C1
	for <chrome-platform@lists.linux.dev>; Mon,  3 Oct 2022 09:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664790133; x=1696326133;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5g0KdDz+yWE3/smCFgpv/AmpQhtjfHFM8QG3/rIgCUE=;
  b=b017ZbEyIBehpk0Pzx6uWsjY/eKUw0pDURo2m2ii6rNSLsXtF7TVB6Hd
   uXu0HKJBqXRpqAfByhbAM09C5w2Ii3cgQnxjvx9oEvBv13DUtyX5Q9Z90
   hCl2QSr3Z0nUDtn5K7wnOSUmkq+R9UIttymRXnOFudRqa/g42FvK0DAlK
   WMFElclRvLc7QkMHdB/2+RGhpmK6QqbqTF09mOrgxsqy3MhFE0FzEeuXY
   k8/JokmOFPiVGS+fW+mrzfX24FSnAt2AuGACllfjyI6D1luij3ggiCKbG
   jl1VtAIYFXigg0t51GbvJn7eZJ568Tcz1i79J4/pVGwJvOxwOIGTRJU4U
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="366634986"
X-IronPort-AV: E=Sophos;i="5.93,365,1654585200"; 
   d="scan'208";a="366634986"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2022 02:42:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="574567543"
X-IronPort-AV: E=Sophos;i="5.93,365,1654585200"; 
   d="scan'208";a="574567543"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 03 Oct 2022 02:42:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ofHxd-001Rjr-12;
	Mon, 03 Oct 2022 12:42:05 +0300
Date: Mon, 3 Oct 2022 12:42:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Eugen Hristev <eugen.hristev@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Alexandru Ardelean <alexandru.ardelean@analog.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Paul Cercueil <paul@crapouillou.net>,
	Mihail Chindris <mihail.chindris@analog.com>,
	Gwendal Grignou <gwendal@chromium.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev
Subject: Re: [RFT PATCH v3 10/10] iio: Don't silently expect attribute types
Message-ID: <YzqubeAnrH5FJ0vA@smile.fi.intel.com>
References: <cover.1664782676.git.mazziesaccount@gmail.com>
 <63f54787a684eb1232f1c5d275a09c786987fe4a.1664782676.git.mazziesaccount@gmail.com>
 <YzqgqERDTLVkJH67@smile.fi.intel.com>
 <b36ee317-abfe-9f55-70b5-bbf3138f50c0@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b36ee317-abfe-9f55-70b5-bbf3138f50c0@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Oct 03, 2022 at 11:58:35AM +0300, Matti Vaittinen wrote:
> On 10/3/22 11:43, Andy Shevchenko wrote:
> > On Mon, Oct 03, 2022 at 11:13:53AM +0300, Matti Vaittinen wrote:

...

> > > +		for (i = 0, id_attr = buffer->attrs[i];
> > > +		     (id_attr = buffer->attrs[i]); i++)
> > 
> > Not sure why we have additional parentheses...
> 
> Because gcc warns about the assignment and suggests adding parenthesis if we
> don't.

Ah, this is a condition, so that's why compiler wants to have a _result_ of
the assignment and not the ambiguous thingy.

Btw, have you considered to switch to in-loop iterator definitions as we do
in many other places? Also, it might make sense to introduce for_each_...
type of macro helper if the loop is used more than once.

-- 
With Best Regards,
Andy Shevchenko


