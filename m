Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7095B17C1
	for <chrome-platform@lists.linux.dev>; Mon,  3 Oct 2022 09:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664789979; x=1696325979;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=sXZaQocFXY9yjGwvBQtBsjXvYzr4OXfPV0g7Jm5zPAQ=;
  b=Qw34of6DY6clGO9CdRVckD/6Tjrn26rQUBXG6R7M+CRY8F9it1iG2A58
   scpv+pKZ1Mqsd8mR/wGNZ4FQptz+Fn6l9hq6Fh/iFYdPxpbpSooIrR6aW
   N5ENRB9Q8ELV5Z4e95ZMGe9rMG1ythse9U4siW5QhO5Wnh7jqUygH/OHF
   UsIY/gW4B5uctdu77daudrDSTg+gzVq0aqWn67pu4TLCvSWHtMricuhEv
   UHCC3O6mrdfNRB0iAA5Z70tsiLIpDYmDshnb22kr+o+31NcSRmkIk6AG8
   G26Eez65ysNCUt0jcufYrk9ohXD7MAvUhlZXKZ7TxxAPQ4LXJOAig7nZ0
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="301311666"
X-IronPort-AV: E=Sophos;i="5.93,365,1654585200"; 
   d="scan'208";a="301311666"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2022 02:39:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="727691643"
X-IronPort-AV: E=Sophos;i="5.93,365,1654585200"; 
   d="scan'208";a="727691643"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 03 Oct 2022 02:39:32 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ofHv8-001Rh9-19;
	Mon, 03 Oct 2022 12:39:30 +0300
Date: Mon, 3 Oct 2022 12:39:30 +0300
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
Message-ID: <Yzqt0o0yWsfCGQ6I@smile.fi.intel.com>
References: <cover.1664782676.git.mazziesaccount@gmail.com>
 <63f54787a684eb1232f1c5d275a09c786987fe4a.1664782676.git.mazziesaccount@gmail.com>
 <YzqgqERDTLVkJH67@smile.fi.intel.com>
 <b36ee317-abfe-9f55-70b5-bbf3138f50c0@gmail.com>
 <7ae09809-4f3c-9872-5a87-0a05e73d39b4@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7ae09809-4f3c-9872-5a87-0a05e73d39b4@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Oct 03, 2022 at 12:02:56PM +0300, Matti Vaittinen wrote:
> On 10/3/22 11:58, Matti Vaittinen wrote:
> > On 10/3/22 11:43, Andy Shevchenko wrote:
> > > On Mon, Oct 03, 2022 at 11:13:53AM +0300, Matti Vaittinen wrote:

...

> > > > +            attr[ARRAY_SIZE(iio_buffer_attrs) + i] =
> > > > +                (struct attribute *)&id_attr->dev_attr.attr;
> > > 
> > > ...and explicit casting here. Isn't attr is already of a struct
> > > attribute?
> > 
> > I am glad you asked :)
> > This is one of the "things" I was not really happy about. Here we hide
> > the fact that our array is full of pointers to _const_ data. If we don't
> > cast the compiler points this out. Old code did the same thing but it
> > did this by just doing a memcpy for the pointers - which I personally
> > consider even worse as it gets really easy to miss this. The cast at
> > least hints there is something slightly "fishy" going on.
> > 
> > My "gut feeling" about the correct fix is we should check if some
> > attributes in the array (stored to the struct here) actually need to be
> > modified later (which I doubt). If I was keen on betting I'd bet we
> > could switch the struct definition to also contain pointers to const
> > attributes. I am afraid this would mean quite a few more changes to the
> > function signatures (changing struct attribute * to const struct
> > attribute *) here and there - and possibly also require some changes to
> > drivers. Thus I didn't even look at that option in the scope of this
> > fix. It should probably be a separate refactoring series. But yes - this
> > cast should catch attention as it did.
> > 
> 
> Actually, now that you pointed it out - do you think this would warrant a
> FIXME comment?

Makes sense to me, but I'm not a maintainer of IIO :-)

-- 
With Best Regards,
Andy Shevchenko


