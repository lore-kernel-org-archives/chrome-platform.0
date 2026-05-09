Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC2E2C029D;
	Sat,  9 May 2026 09:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778319657; cv=none; b=tf/NEHtgirvl7H6ICcCKOkSCj5BeUonQrNqPF5BS1r8bP7sUspArKZnszZG3PmcHfoyRtUM27JrMDFiiS1xKhw9KqPmtjJuvAiA9bRULoqA3t2ZeS6+WYJZbeIWPGU603y5Jqb7OYaNMN/Iwga1DDmp0iNTHinlIbrSINM1XndU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778319657; c=relaxed/simple;
	bh=eu/lBfUsfMMtybQyBQT7GvYUpd7RFGykR0ce5/brGcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q0qng6KG2xF/TxjEOx1+vabvqhZA2kk3TpacBlUmR2bz9Gy/XPLq+V5HGNs1VSyhHQMypBEAC6ZjMrid2hT81/a+w6kAnlik0P89XL1HBlO43gasVPh2Ob89pzChtdAZLEJEbMDBmbXp3vjlAXnuVXhxaLfDL/91MRRJS9xaC6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JoQYFCw9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JoQYFCw9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B48C2BCB2;
	Sat,  9 May 2026 09:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778319657;
	bh=eu/lBfUsfMMtybQyBQT7GvYUpd7RFGykR0ce5/brGcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JoQYFCw94yOxfd2vM7Uk8CPPcPAZEvw33VwTFQv6wQ16Uz8GXEVUDGGOIpTO4hCn3
	 /WztZ6XheiCf9F6/lXF5f73M2cqt9gJ+TD9EAC+vOIWvvOsmlrtMBfR+UCsB5sTGTX
	 U6pjiJAYX2mU5MausI2zvuj+zKh4w/M3RAtGBmtX9hNw0Tl2ZORayFn4OzNx3Qo6jo
	 lgwZDOqhDM9Dk87gZyW1a/ckMYF6UNq3s44L7Lvb0a1mY2mZZXWq/zLeoM+wMnCbbK
	 l1nbbHwCjGyZqEY/9cIUjI43RT5sI2nPTG8G8FsN59vFJtG4ChiZJ7Yjxf0LfDAgNR
	 hYZk8wLAq8pvg==
Date: Sat, 9 May 2026 17:40:52 +0800
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
Message-ID: <af8BJCaJYVBr_P3u@tzungbi-laptop>
References: <20260427134659.95181-1-tzungbi@kernel.org>
 <20260427134659.95181-4-tzungbi@kernel.org>
 <20260428160956.GC718365@nvidia.com>
 <af2vHu9AiSeGyp01@google.com>
 <20260508115444.GA9887@nvidia.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508115444.GA9887@nvidia.com>

On Fri, May 08, 2026 at 08:54:44AM -0300, Jason Gunthorpe wrote:
> On Fri, May 08, 2026 at 09:38:38AM +0000, Tzung-Bi Shih wrote:
> 
> > I see this as the cost for synchronizing file operations with misc driver
> > registration, as previously mentioned in [2], which I believe is necessary
> > to prevent the race conditions.  I'm open to discussing potential
> > optimizations or alternative approaches if you have suggestions.
> 
> I think the past threads had many different ideas, I don't know why
> you choose to present this with something that is clearly acceptable..

In previous discussions, we explored using `inode->i_cdev`[3], but that
proved infeasible for misc devices[4].  Since all misc drivers share a
single cdev, we cannot use that approach to store per-miscdevice context.
This led us to the current design.

[3] https://lore.kernel.org/all/20251021121536.GG316284@nvidia.com
[4] https://lore.kernel.org/all/aQ1xfHuyg1y8eJQ_@google.com

> 
> The drivers ops lookup needs to be O(1) on the system call path.

Achieving O(1) lookup is currently infeasible for the misc subsystem.
This is because misc devices use the minor number[5] as a search key to
determine which miscdevice the file operation is tied to, which
inherently involves a linear search.

[5] https://elixir.bootlin.com/linux/v7.0/source/drivers/char/misc.c#L127
