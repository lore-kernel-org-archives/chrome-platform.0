Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1897232E753
	for <chrome-platform@lists.linux.dev>; Mon, 26 Jan 2026 10:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769423129; cv=none; b=GKIsR/gy3HD7iKnwqUadco6Z+4QI9iVY49wNRrjtDDLw6RXK+lI2V2/1b0svKVITmWE48ecpPGIPS/jHNLpR1p/bmfGr+Uo6o+0rq9V315OfpppWJJL2cAOds3CNj1FMUUPxdgfaje8Gz35nC3WKQfQ7SqQ6eyooNXGbdHNJVAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769423129; c=relaxed/simple;
	bh=k4BEYmlrJjPzcSm3s4NR5SWjHIJkO61F9VNbirwpf/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T92YJ2lK5C1LI37Rnw0ZOuZ3JlcJ4zuSgHVax3XU7zS5W1c03qO1PS/OCs9pKa4z5CoK375kDwlGGUh/qJ8o1hoyovz2fNaGKx9FnSRt65cZjiPHDRpIqVLdfS99afQAQEU4M16ZLHJsJ5g6vh33/pVIXa37rqTCX1r9+NAJusE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tvv/5shH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tvv/5shH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24A5BC19422;
	Mon, 26 Jan 2026 10:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769423128;
	bh=k4BEYmlrJjPzcSm3s4NR5SWjHIJkO61F9VNbirwpf/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tvv/5shHuumZ/dj/d0agLeHzI640BR3/h6H9idK91IxGKaR16nMdihZFpUFkBkJxz
	 Ddpxx9MY4Q5xJpvBCA4G7tdsR6qulnT+YihbUistwFaBrlOGyRGUBH0uVDE2r3uIsy
	 bM3ingp6iVgp9u+KBeJrz8qbPEX6RGhBwJSU3wwUsFZGsfn6bzH9N9naGSxjJmXdWk
	 yyS/tS1+5xGOQPauRW3gLxeQGDtyxxwVK65hlcoaHsh2u0Vmxot1pCo7RnrhGkOOpm
	 towMH3RFEp96g68+zKROaARZ23h7pKBVfRB+37J6fE17IsC9Kb1719T8osPPAHsYy1
	 9G3MoHC9/y/jw==
Date: Mon, 26 Jan 2026 10:25:25 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: briannorris@chromium.org, jwerner@chromium.org, javierm@redhat.com,
	samuel@sholland.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
	chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 07/12] firmware: google: Clean up include statements
 in coreboot_table.h
Message-ID: <aXdBFdl3TUxP_cVG@google.com>
References: <20260115082128.12460-1-tzimmermann@suse.de>
 <20260115082128.12460-8-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115082128.12460-8-tzimmermann@suse.de>

On Thu, Jan 15, 2026 at 08:57:17AM +0100, Thomas Zimmermann wrote:
> Include <linux/mod_devicetable.h> from source files and only forward-
> declare struct coreboot_device_id in coreboot_table.h.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
