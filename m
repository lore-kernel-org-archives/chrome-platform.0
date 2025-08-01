Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACEA1F4C8C
	for <chrome-platform@lists.linux.dev>; Fri,  1 Aug 2025 08:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754036543; cv=none; b=A4sLFzE4RybEpndPS1DEe1DTeMMcGdOgV4tWDE1DKgNE3QCXopnky5X2ndTfCQvkhCDBzne3Dy/GhNOHi2YE9zI2qypi5BxP90nxx74Dezelo8XRAU4UBn75c/koCCBicfN4OyPoloIDIrtWtBYA7E5BlaVa0lwMmUpTVcmyWoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754036543; c=relaxed/simple;
	bh=62JODJWTYXZrT+JjxYngid7aMT7KpwdYa47tFarBAYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GUJp3qD6EWlrkKbGYMk+PRL9Ea1viRO05M0rOq5EuGqeo2dawjeHjcBHCWziSLfV7iI0wwnKZT3qO0EmFG88AO7p2zjk33DaedMco+edsBS6eV/K9aova11shyjGBFTI25LuFVrIL52VpDDo6DELMSnmO9bEwPy7iiUf9ViFeco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=F/mvdyfW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="F/mvdyfW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92E7FC4CEF4;
	Fri,  1 Aug 2025 08:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1754036543;
	bh=62JODJWTYXZrT+JjxYngid7aMT7KpwdYa47tFarBAYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F/mvdyfWg7mXGfybNNgD3ki1GUDuX/0qNfzWiH4aS2nwyOdOkw09iHrGpnyIo3akU
	 pDLsjRcHRyzqCwe+zNRXhx110JkPmCZD3iBRQI2jD7oNxYGem8cu0KQ5ibFiLSQ1D1
	 XjBOejM2MQ/Svnbazw6mb4K6nw17h9MFYH7ByGiA=
Date: Fri, 1 Aug 2025 10:22:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, dawidn@google.com, chrome-platform@lists.linux.dev,
	mhiramat@kernel.org
Subject: Re: [PATCH v3 5/8] platform/chrome: Introduce cros_ec_device_alloc()
Message-ID: <2025080101-iron-yelp-82c5@gregkh>
References: <20250721044456.2736300-1-tzungbi@kernel.org>
 <20250721044456.2736300-6-tzungbi@kernel.org>
 <2025072114-unifier-screen-1594@gregkh>
 <aIIDz_qtbRjZB8Sg@google.com>
 <2025072428-marathon-anemia-c9f6@gregkh>
 <aII10fnhJRDeGSHI@google.com>
 <2025072537-sanction-overload-8acd@gregkh>
 <aIxsA3-y75nE01U_@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIxsA3-y75nE01U_@google.com>

On Fri, Aug 01, 2025 at 07:25:55AM +0000, Tzung-Bi Shih wrote:
> On Fri, Jul 25, 2025 at 06:58:23AM +0200, Greg KH wrote:
> > On Thu, Jul 24, 2025 at 01:32:01PM +0000, Tzung-Bi Shih wrote:
> > > On Thu, Jul 24, 2025 at 12:36:18PM +0200, Greg KH wrote:
> > > > NEVER attempt to increment/decrement refcounts on open/release.  That
> > > > way lies madness and should not be needed at all, the underlying
> > > > infrastructure should keep things working properly here, right?
> > > [...]
> > You are attempting to have one reference count for one object that has
> > different lifecycles.  That doesn't work well, if at all.  See the
> > numerous talks at the Linux Plumbers conference over the past few years
> > about why this is a "bad idea" and for ideas on how to redesign it to
> > fix the issue.
> > 
> > Hint, 2 objects, different reference counts :)
> 
> Referenced the talk [1] and its related works and hope I understand it
> correctly.
> 
> [1] https://lpc.events/event/17/contributions/1627/
> 
> Summarize the proposed fix and I hope it makes sense:
> 
> Introduce a new helper: ref_proxy for managing "weak" references to the
> object that may be gone at any time.  `ref` is the target pointer (i.e.
> the resource) which could be released asynchronously (from the resource
> consumers' point of view).  The struct ref_proxy_struct is for resource
> providers and is only freed on dropping the final reference.

<snip>

Nice!  At a quick glance, this does look like what we need (and if it
helps, matches what was just done in the Rust kernel apis, right?)

Want to turn this into something real and submit it for review after you
test it out with your driver to see if it does work?

thanks,

greg k-h
