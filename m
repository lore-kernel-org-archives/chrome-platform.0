Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26627280024
	for <chrome-platform@lists.linux.dev>; Thu, 14 Aug 2025 09:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755163473; cv=none; b=jeFtuTi0SFdEWOmwy0ZwQvejvTIxwO4PdEhCbrjjU6TVfcAqAFavtXoYz+ibHuW55cVP6pZCxjBH0ogriI7stVqisfdw1eAebxqraCl1cvSbXuC729bBnXL1/OAtY9XKec9ydVP9fcm2uJSs5mVWF2+5NPi6V11P5GyGTUqEXoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755163473; c=relaxed/simple;
	bh=es8C2fk1+jaHuHBVh/mMoO9yPYI5kHDPOEGFjnMQLa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rKpoZcpcnW/C2nV1R2HWi++HRsy3TtKLndzoMsIs2TYL/UNvMnu+x4FtSawG9jG0682UfKs23IvAcEMIcsR4DghR1JQRW96SBSJokvDEYgVPsW0t9+D2avwNEok9rMhgXwYvyV0MlWY/ZvuNA2Zb47HURrBxdwOelNKFG553oqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hNZlI4Gb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hNZlI4Gb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6217C4CEED;
	Thu, 14 Aug 2025 09:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755163472;
	bh=es8C2fk1+jaHuHBVh/mMoO9yPYI5kHDPOEGFjnMQLa4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hNZlI4GbVq3vITxTy+Ollo7yrvpQntyTUTJkZvWSnwfGrlbTMA/idaeg0mDKM/kdR
	 /NPD1QTapbEGU8ukeEfLWJ/7qSi3A2yfq2r1kUx8fjfEdA8ykKm8feiIK7Y29HT2+m
	 1mLOx5ndlJlQOzEt9q9D9oSNgiKziGHrIijXc6Tkcy3sOShJLtEhHpzfE215tJx8rv
	 vARqu+z9iB2ZGQ6blQnzjYl3WEX4pNiKAqLe5q75VU43hR5Yc7AfpoIYB6K9AJHFQK
	 q6HvMPnrzU4LJ1WX8rKhpNLfgrcCro/7UgmxD5/qxghfd73Py2OYj+51YPB0LbgXYq
	 RsGSFKwyNHbvg==
Date: Thu, 14 Aug 2025 09:24:29 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: bleung@chromium.org, dawidn@google.com, chrome-platform@lists.linux.dev,
	mhiramat@kernel.org
Subject: Re: [PATCH v3 5/8] platform/chrome: Introduce cros_ec_device_alloc()
Message-ID: <aJ2rTW3HbRab87cw@google.com>
References: <20250721044456.2736300-6-tzungbi@kernel.org>
 <2025072114-unifier-screen-1594@gregkh>
 <aIIDz_qtbRjZB8Sg@google.com>
 <2025072428-marathon-anemia-c9f6@gregkh>
 <aII10fnhJRDeGSHI@google.com>
 <2025072537-sanction-overload-8acd@gregkh>
 <aIxsA3-y75nE01U_@google.com>
 <2025080101-iron-yelp-82c5@gregkh>
 <aIx9vDcqdX8WBTmh@google.com>
 <2025080159-grandma-overpass-bc1e@gregkh>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025080159-grandma-overpass-bc1e@gregkh>

On Fri, Aug 01, 2025 at 09:50:01AM +0100, Greg KH wrote:
> On Fri, Aug 01, 2025 at 08:41:32AM +0000, Tzung-Bi Shih wrote:
> > On Fri, Aug 01, 2025 at 10:22:18AM +0200, Greg KH wrote:
> > > On Fri, Aug 01, 2025 at 07:25:55AM +0000, Tzung-Bi Shih wrote:
> > > > On Fri, Jul 25, 2025 at 06:58:23AM +0200, Greg KH wrote:
<snip>
> > > 
> > > Nice!  At a quick glance, this does look like what we need (and if it
> > > helps, matches what was just done in the Rust kernel apis, right?)
> > 
> > Thanks for the review.  I'd need to check.  I wasn't aware of what was just
> > done in the Rust kernel APIs.
> 
> Take a look at that, if there's any way it can align up with what the
> rust code does, if possible, that would be good as we all are going to
> be crossing between the two different languages a lot :)

I'd still need some time to find and look at the relevant Rust code (language
and overall status of Rust kernel API-wise).  I guess they should spread in
rust/kernel/device.rs and rust/kernel/devres.rs?

> 
> > > Want to turn this into something real and submit it for review after you
> > > test it out with your driver to see if it does work?
> > 
> > Have tested on the draft version and it works.  Will consolidate the patches
> > and send them for further reviews.
> 
> Great!  No rush, we can't do anything until after -rc1 is out.

While I'm still finding and looking at the Rust part, sent a version [1] for
review first.

[1] https://lore.kernel.org/chrome-platform/20250814091020.1302888-1-tzungbi@kernel.org/
