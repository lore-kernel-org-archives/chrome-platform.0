Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6E5377556;
	Fri,  8 May 2026 09:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778233123; cv=none; b=VA0wkwMqqKJp/ItGXgLkOKSfK4DCFm8gMSFZFxZKK+vd8cgKSxYnloehXlIxI1ROD0+IBMlAFBr0hNRAx911m9l442/pqt2sssMw++3IZqJEzTf6thIHcg9A0iB3JmHfeZV+bV73z/HiAhp1RF1JmLiwSG0RupdUt2CNCu2oqVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778233123; c=relaxed/simple;
	bh=cVz9sCJiGA4Fn72ZZvPklRuHUrwgbnL0uVWWLaxfEX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N0Xs8pSPhahkVsOywM7A3Oyb4lG3jLc2ZOsT2QkPvYKjuJScia2thoQx2Rw85Q8wUlJCabvxqyLrD3em6dghsdChwHjGezn/PnXPD6sgjAL14emiNFah//fRzU5X47w7Wy57tklUdGtciBsWHZ09ZC1d/QKtvlXOyPfvEm2j+vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GAjImp7/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GAjImp7/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB511C2BCB0;
	Fri,  8 May 2026 09:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778233122;
	bh=cVz9sCJiGA4Fn72ZZvPklRuHUrwgbnL0uVWWLaxfEX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GAjImp7/0Nwpnc3jiNXYuB9R5rbStjf13nb0n6qpZOsVOQsyOUVP9yOfhgo5Ukx/8
	 rzuyH4ErjLJxw+hV4rVllNB00U5gJjCgCgFW6bq7EOjYQZNWHQJHuUhiavyVhkQIXT
	 +PbKFR7M8YffT7HtFi56sbV+anTnYOoHTuEcVnaJs4BOU7e5GKFe40s8szbwp5e5WG
	 T4uh7xgx8mymyr+0vIpUXj8o91nvKxwlbuG7TU0h4YcOg9rvfKgpeHg9xKhVccKRAq
	 GbfbqcAhkum1w4QXBub0vZKYmNon/jb3BuunXzTThIB85gonddo5IHnSzKGUggS9MS
	 dPeBsVTCXV3yA==
Date: Fri, 8 May 2026 09:38:38 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Johan Hovold <johan@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 3/8] char: misc: Introduce misc_sync_register()
Message-ID: <af2vHu9AiSeGyp01@google.com>
References: <20260427134659.95181-1-tzungbi@kernel.org>
 <20260427134659.95181-4-tzungbi@kernel.org>
 <20260428160956.GC718365@nvidia.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428160956.GC718365@nvidia.com>

On Tue, Apr 28, 2026 at 01:09:56PM -0300, Jason Gunthorpe wrote:
> On Mon, Apr 27, 2026 at 09:46:54PM +0800, Tzung-Bi Shih wrote:
> > Introduce misc_sync_register() to support synchronous file operations
> > for misc devices.  This aims to prevent Use-After-Free errors when a
> > device is deregistered while file operations are still in progress or
> > files are open.
> > 
> > It creates a synchronization context that wraps supported file
> > operations and ensures the device is still registered before invoking
> > the file operations.
> > 
> > The minor number is deferred from being freed immediately on
> > deregistration and is used as a primary key to search for the
> > synchronization context in `misc_sync_ctx_list` after the device is
> > unregistered.
> > 
> > Performance impact:
> > - All file operations are serialized by a global lock.
> > - All file operations perform a linear search to find the corresponding
> >   miscdevice.
> 
> This doesn't seem like a serious proposal, this is too much
> performance cost.

Thank you for the feedback.  I understand your concerns about the performance
cost, particularly regarding the global lock and linear search.

This is indeed a serious proposal, and I've dedicated time to developing and
testing it.  Our primary goal is to address a real-world UAF issue we've
encountered on our platforms by integrating a solution upstream, whether it
uses revocable mechanism[1] or not, rather than carrying downstream patches.

I see this as the cost for synchronizing file operations with misc driver
registration, as previously mentioned in [2], which I believe is necessary
to prevent the race conditions.  I'm open to discussing potential
optimizations or alternative approaches if you have suggestions.

[1] https://lore.kernel.org/all/20260427135841.96266-10-tzungbi@kernel.org
[2] https://lore.kernel.org/all/aTvTLpFmyVxanvYC@google.com
