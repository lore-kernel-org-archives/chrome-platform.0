Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E97D19E81F
	for <chrome-platform@lists.linux.dev>; Fri,  1 Aug 2025 08:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754037700; cv=none; b=jKe6yc9UmNKt92zUCq/pTrDXmAeKubGkxlm8whqQ34o3ij+keDqz6PIspN53b3gNXn2UebDdkJTwtLsmTyZYMj3QSMO6Znp43M6GB2KSHEfI5w0NKp1POOdARALqnYoKAdSVjoXMXIJ56nfq8iNARd/QjhtMqnrUOmX6czb6uhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754037700; c=relaxed/simple;
	bh=G7p8QKV2xGfivzK9ra6T5g7WZqKqOrS8KbexVVWmJmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKeorMfr4eCIf+x4UpcP3B5vzkDkApCCUINkNLx3kz6L6RroEV6WTUqLkqXDDPgZOcxRNu5TwthEOOCLLEP/W4E26q997ybMRv+8KtK/AVj8zz+1gWCBNaHoFVi5tfgoOXhgz01ezr7qwCBvEFxNOEZzFqT0L1eEIXsteXX8seA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kPoTYqmj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kPoTYqmj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D83CC4CEE7;
	Fri,  1 Aug 2025 08:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754037695;
	bh=G7p8QKV2xGfivzK9ra6T5g7WZqKqOrS8KbexVVWmJmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kPoTYqmjzmVGGoK5Wq3/SdotDyVxq8vI81L7axu+BQuXnbaKUYqVvPRD8KIm3+V7f
	 EC5GMuDwLJU5DK4ndQ6cnmbnI+fQGU9m8rpwmRJzZPG5G3EQOdTq0Lr6yoSruUfiVy
	 X8xDk+WPTjDfN5bB9MfWoqx2CEcPqvdsWrRrJCrb5PYYW7SqScjcPW6kyGK4dasolN
	 i/He2kHqCn1GhrRj0B8x3JaSxyY7Rk5EEBhOVUMTshiDqGaV/AIfmo9oRqy6BpDIrs
	 Qxj3SFT51YD4hr+tdDIRYfB7LKSq4i/WMfF/Y/3nLpIdZXxxDA7NYEmYMrSKoppEzM
	 BuWXrEY4h9/tQ==
Date: Fri, 1 Aug 2025 08:41:32 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: bleung@chromium.org, dawidn@google.com, chrome-platform@lists.linux.dev,
	mhiramat@kernel.org
Subject: Re: [PATCH v3 5/8] platform/chrome: Introduce cros_ec_device_alloc()
Message-ID: <aIx9vDcqdX8WBTmh@google.com>
References: <20250721044456.2736300-1-tzungbi@kernel.org>
 <20250721044456.2736300-6-tzungbi@kernel.org>
 <2025072114-unifier-screen-1594@gregkh>
 <aIIDz_qtbRjZB8Sg@google.com>
 <2025072428-marathon-anemia-c9f6@gregkh>
 <aII10fnhJRDeGSHI@google.com>
 <2025072537-sanction-overload-8acd@gregkh>
 <aIxsA3-y75nE01U_@google.com>
 <2025080101-iron-yelp-82c5@gregkh>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025080101-iron-yelp-82c5@gregkh>

On Fri, Aug 01, 2025 at 10:22:18AM +0200, Greg KH wrote:
> On Fri, Aug 01, 2025 at 07:25:55AM +0000, Tzung-Bi Shih wrote:
> > On Fri, Jul 25, 2025 at 06:58:23AM +0200, Greg KH wrote:
> > > On Thu, Jul 24, 2025 at 01:32:01PM +0000, Tzung-Bi Shih wrote:
> > > > On Thu, Jul 24, 2025 at 12:36:18PM +0200, Greg KH wrote:
> > > > > NEVER attempt to increment/decrement refcounts on open/release.  That
> > > > > way lies madness and should not be needed at all, the underlying
> > > > > infrastructure should keep things working properly here, right?
> > > > [...]
> > > You are attempting to have one reference count for one object that has
> > > different lifecycles.  That doesn't work well, if at all.  See the
> > > numerous talks at the Linux Plumbers conference over the past few years
> > > about why this is a "bad idea" and for ideas on how to redesign it to
> > > fix the issue.
> > > 
> > > Hint, 2 objects, different reference counts :)
> > 
> > Referenced the talk [1] and its related works and hope I understand it
> > correctly.
> > 
> > [1] https://lpc.events/event/17/contributions/1627/
> > 
> > Summarize the proposed fix and I hope it makes sense:
> > 
> > Introduce a new helper: ref_proxy for managing "weak" references to the
> > object that may be gone at any time.  `ref` is the target pointer (i.e.
> > the resource) which could be released asynchronously (from the resource
> > consumers' point of view).  The struct ref_proxy_struct is for resource
> > providers and is only freed on dropping the final reference.
> 
> <snip>
> 
> Nice!  At a quick glance, this does look like what we need (and if it
> helps, matches what was just done in the Rust kernel apis, right?)

Thanks for the review.  I'd need to check.  I wasn't aware of what was just
done in the Rust kernel APIs.

> Want to turn this into something real and submit it for review after you
> test it out with your driver to see if it does work?

Have tested on the draft version and it works.  Will consolidate the patches
and send them for further reviews.
