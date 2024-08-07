Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EE01C37B0
	for <chrome-platform@lists.linux.dev>; Wed,  7 Aug 2024 12:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723035113; cv=none; b=rtN4xtQFkZSzHcxWe6b0bt/f8ZYGTdH0QrRIQLNjV7HUky4f9XzVp35EOYvo4bP6TnholL4ICdJn7iP7DZN5OG4qPTPzy9Ib4A+cbxyL77quraHmIdEATbgnACheVh/XSsoGCpgtm1YjTVjXHOzVQdYvRH+a6n5kFr/KHd38ibc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723035113; c=relaxed/simple;
	bh=ddJUq3I1rhLMUst2NR8tzACupkGZjpUGiKhRPT0jaQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nvkE2dMcMrjb44Nta882W3dob3nNtqkDgEBLE+ZMBx+Xcmh8CJGJrhiokrcikpRvvMGjRb0AE6z0Leii4plOl+9LNDOqxuIBO6gqbYFGMpF0fNJjNelHfSspODbYLygWeH8d8gPU/pzccC5nKaPLQcQqu5o0lUzHzPhAow/IGqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZSRPOFmZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZSRPOFmZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC49C32782;
	Wed,  7 Aug 2024 12:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723035113;
	bh=ddJUq3I1rhLMUst2NR8tzACupkGZjpUGiKhRPT0jaQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZSRPOFmZml93pidg1grCHAU6lBtJdy65UNaITswVAE3vwH/LrntZJyT9iltieynta
	 B4zIP8HupdtKJ5Zb9CeT0ZukuYR5vduS1I9KGj6qyGOSjg4LnYdXG9+edxq5R8z9+V
	 KLsDjaV6tsnmIWdnsHzmXHgt8BHedfMy4AsQeqgnJH36yHLDGmOR9F40qJfgUNkJwF
	 vwg+9sWdf6wf9QGV6y6dAOtQXwhJKNrIdtbINqO1NLCNBYxbVNchDNHvwpAZKoPH39
	 TYT4VYZSXHc18m4a3RCpNtSnpwTzAD183/WhErmlF0chSldG8Au5kNftWW/xMHFV8v
	 2aTdKD9fpM7AQ==
Date: Wed, 7 Aug 2024 20:51:49 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: "Dustin L. Howett" <dustin@howett.net>
Cc: Guenter Roeck <groeck@chromium.org>, Alexandru Stan <ams@frame.work>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	chrome-platform@lists.linux.dev, Kieran Levin <ktl@frame.work>
Subject: Re: [PATCH] platform/chrome: cros_ec_lpc: switch primary DMI data
 for Framework Laptop
Message-ID: <ZrNt5VVQ8bOOedL4@tzungbi-laptop>
References: <20240806-platform-chrome-cros_ec_lpcs-change-the-default-disposition-of-the-framework-laptop-v1-1-09e0d602b215@howett.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240806-platform-chrome-cros_ec_lpcs-change-the-default-disposition-of-the-framework-laptop-v1-1-09e0d602b215@howett.net>

On Tue, Aug 06, 2024 at 09:54:09PM -0500, Dustin L. Howett wrote:
> Framework Computer appears to be moving away from the Microchip embedded
> controller seen in the Framework Laptop 13 with Intel Core 11th, 12th
> and 13th generation processors. All newer models use a Nuvoton NPCX
> embedded controller.
> 
> Changing the default DMI match for Framework's products to match their
> newer product lines will reduce churn in this part of the cros_ec_lpc
> driver.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

Thanks!

[1/1] platform/chrome: cros_ec_lpc: switch primary DMI data for Framework Laptop
      commit: 62be134abf4250474a7a694837064bc783d2b291
