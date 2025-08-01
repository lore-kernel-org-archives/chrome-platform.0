Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C69B14F70
	for <chrome-platform@lists.linux.dev>; Fri,  1 Aug 2025 08:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754038206; cv=none; b=so5gDe56E8DLUU4OsSeQZlHmM3cdzH/Hu5n4UKaxg1dT3qyPxgEqeTKUcgLCC80iXBxbc6/UD4N70KkhrEFuEmIK+TkHZAwxFARXIBusFQzN59RBNyUVB2MPNy5bWkQDMH+TERMdRulJIk0uJmWLrHiRIBpqhSF3fNIArTEFCxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754038206; c=relaxed/simple;
	bh=NX0fh48UqKbXVvlmTjdDU0l9HQmcecA4liNgOzUzOZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tfGFPnRe20BG7L3eBxuM8znuMLvYEWf9D9ZSLLQMWVyBDnR6/5GWwIeGiT726zAL4bSIvjWGhus49E6w+K2J5yfVvbxShJ/wfJ4NqD+PWOOJrITn+6QWZ4oLpsmwy95mJj1JtcY38Shec674wu4kD/HaV57EdeywaKO7WuSAv44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Yd7RYfyv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Yd7RYfyv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55881C4CEE7;
	Fri,  1 Aug 2025 08:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1754038205;
	bh=NX0fh48UqKbXVvlmTjdDU0l9HQmcecA4liNgOzUzOZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yd7RYfyvO4bWltNGbMtcBgC5+gPUUv8HSK+pKn+mvL5FzM2Li3FlV83o8mlJWkutQ
	 HxcKbO3trB/6Q9T5IP+8GDGEDNq/ISMET43sI5NDSJoRvbr7hextVn32jxMXaYYveE
	 9xoXc+g2HDx2MF3glP9TisIRWAB3vUnbmPFye1lo=
Date: Fri, 1 Aug 2025 09:50:01 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, dawidn@google.com, chrome-platform@lists.linux.dev,
	mhiramat@kernel.org
Subject: Re: [PATCH v3 5/8] platform/chrome: Introduce cros_ec_device_alloc()
Message-ID: <2025080159-grandma-overpass-bc1e@gregkh>
References: <20250721044456.2736300-1-tzungbi@kernel.org>
 <20250721044456.2736300-6-tzungbi@kernel.org>
 <2025072114-unifier-screen-1594@gregkh>
 <aIIDz_qtbRjZB8Sg@google.com>
 <2025072428-marathon-anemia-c9f6@gregkh>
 <aII10fnhJRDeGSHI@google.com>
 <2025072537-sanction-overload-8acd@gregkh>
 <aIxsA3-y75nE01U_@google.com>
 <2025080101-iron-yelp-82c5@gregkh>
 <aIx9vDcqdX8WBTmh@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIx9vDcqdX8WBTmh@google.com>

On Fri, Aug 01, 2025 at 08:41:32AM +0000, Tzung-Bi Shih wrote:
> On Fri, Aug 01, 2025 at 10:22:18AM +0200, Greg KH wrote:
> > On Fri, Aug 01, 2025 at 07:25:55AM +0000, Tzung-Bi Shih wrote:
> > > On Fri, Jul 25, 2025 at 06:58:23AM +0200, Greg KH wrote:
> > > > On Thu, Jul 24, 2025 at 01:32:01PM +0000, Tzung-Bi Shih wrote:
> > > > > On Thu, Jul 24, 2025 at 12:36:18PM +0200, Greg KH wrote:
> > > > > > NEVER attempt to increment/decrement refcounts on open/release.  That
> > > > > > way lies madness and should not be needed at all, the underlying
> > > > > > infrastructure should keep things working properly here, right?
> > > > > [...]
> > > > You are attempting to have one reference count for one object that has
> > > > different lifecycles.  That doesn't work well, if at all.  See the
> > > > numerous talks at the Linux Plumbers conference over the past few years
> > > > about why this is a "bad idea" and for ideas on how to redesign it to
> > > > fix the issue.
> > > > 
> > > > Hint, 2 objects, different reference counts :)
> > > 
> > > Referenced the talk [1] and its related works and hope I understand it
> > > correctly.
> > > 
> > > [1] https://lpc.events/event/17/contributions/1627/
> > > 
> > > Summarize the proposed fix and I hope it makes sense:
> > > 
> > > Introduce a new helper: ref_proxy for managing "weak" references to the
> > > object that may be gone at any time.  `ref` is the target pointer (i.e.
> > > the resource) which could be released asynchronously (from the resource
> > > consumers' point of view).  The struct ref_proxy_struct is for resource
> > > providers and is only freed on dropping the final reference.
> > 
> > <snip>
> > 
> > Nice!  At a quick glance, this does look like what we need (and if it
> > helps, matches what was just done in the Rust kernel apis, right?)
> 
> Thanks for the review.  I'd need to check.  I wasn't aware of what was just
> done in the Rust kernel APIs.

Take a look at that, if there's any way it can align up with what the
rust code does, if possible, that would be good as we all are going to
be crossing between the two different languages a lot :)

> > Want to turn this into something real and submit it for review after you
> > test it out with your driver to see if it does work?
> 
> Have tested on the draft version and it works.  Will consolidate the patches
> and send them for further reviews.

Great!  No rush, we can't do anything until after -rc1 is out.

thanks,

greg k-h
