Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFD77B
	for <chrome-platform@lists.linux.dev>; Wed, 23 Nov 2022 08:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669193345; x=1700729345;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fgOfapqW2CoqDrEhOH22xK8eCPNP5ZTokn6bHwFpdvA=;
  b=LDh9ZkR+BwzdEgWU44n0NDYLby3y4C0PmqfvNQznwvmwXiznLzbb7GQA
   Y7ydRCHTbGN2QBAoGSfwG/Pd9+QTc6YailhJYBQ11pU3kwTE5iMPIZSFh
   RnmQINlij1Mvmveeapn3c2TlLIRsD3u7hWKsJLlH5iO7UTTusCbsUB+7g
   7rowVD/KSDrGV2lxGqgyLRh/I3rln1NU2qATy8fhMeCwdChgaeHd6zl/e
   kynzp5anCdvPmL9NHoHvfZsYdP7Uyx4GzRRdl7fxOsDP/Q+ol2VanbqMc
   zdvA+eYqkIEiIXuftFvEwJbSAlZknJ/Nf1InD+X+ZWzYn9cQKtJ2lVHFp
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="311645463"
X-IronPort-AV: E=Sophos;i="5.96,186,1665471600"; 
   d="scan'208";a="311645463"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2022 00:49:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="784160188"
X-IronPort-AV: E=Sophos;i="5.96,186,1665471600"; 
   d="scan'208";a="784160188"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 23 Nov 2022 00:49:01 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 23 Nov 2022 10:49:01 +0200
Date: Wed, 23 Nov 2022 10:49:01 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev, Benson Leung <bleung@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>
Subject: Re: [PATCH 1/2] usb: typec: Add helper to get partner device struct
Message-ID: <Y33efUCVpkgpQz0O@kuha.fi.intel.com>
References: <20221121201337.2772216-1-pmalani@chromium.org>
 <20221121201337.2772216-2-pmalani@chromium.org>
 <Y3ydPqkxxQCSGGp7@kuha.fi.intel.com>
 <CACeCKaeCA3+0BVyUO72HvUbV7mcjEcGT4uXnA2X8=CUdjdtOuQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACeCKaeCA3+0BVyUO72HvUbV7mcjEcGT4uXnA2X8=CUdjdtOuQ@mail.gmail.com>

On Tue, Nov 22, 2022 at 11:05:04AM -0800, Prashant Malani wrote:
> Hi Heikki,
> 
> Thanks for reviewing the patch.
> 
> On Tue, Nov 22, 2022 at 1:58 AM Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
> >
> > Let's not loose the protection around these devices unless there is no
> > other way, and in this case there is.
> >
> > Please just create a wrapper for usb_power_delivery_register() instead:
> >
> > struct usb_power_delivery *
> > typec_partner_usb_power_delivery_register(struct typec_partner *partner,
> >                                           struct usb_power_delivery_desc *desc)
> > {
> >         return usb_power_delivery_register(&partner->dev, desc);
> > }
> > EXPORT_SYMBOL_GPL(typec_partner_usb_power_delivery_register);
> 
> Sounds good. I'll send a v2 with the above change as patch 1 (instead
> of the current patch 1).
> 
> I will list you as the "Suggested-by" tag (but please let me know if
> you'd like attribution stated differently).

Thanks. Suggested-by is the correct tag IMO.

cheers,

-- 
heikki
