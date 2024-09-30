Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE4315C3
	for <chrome-platform@lists.linux.dev>; Mon, 30 Sep 2024 01:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727660360; cv=none; b=KGarepxEp9sM76KhobFjfdXZ5McEB+L6i7w5Uq6vKevyrEtQrIeGzFzi8x/a4kT7lVwegjjiFles9q3FWzKNk/JAgjHVUBz3aaEbJ7nnhsj5e4gkfL4ol4N0FWP4FdTQuaXRF6kKLSjXgfSLzGNYQPtZou3OO4hMGINpvwhujKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727660360; c=relaxed/simple;
	bh=Y1ff75jI4diW0z1H2zFxxz7Kyb8nqSKgsqTYxu4ElI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T+fGcZow+SVkuPAa7ALnAmD3Yx2clpapjEcjU6TOShjH80FIOFk4hwthnvRshGi/gjKif5dmMSwMdJQMwhojH3bIyOC/mpt1K2k6sJ7FXmBDZEY/dn+vVt3RxnEg7GR7XccYnbOcu63jgsDGg17XB7ZUgj5HgfTLpUyMazFYjMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DxhbJ3ba; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DxhbJ3ba"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD60BC4CEC5;
	Mon, 30 Sep 2024 01:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727660359;
	bh=Y1ff75jI4diW0z1H2zFxxz7Kyb8nqSKgsqTYxu4ElI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DxhbJ3baFil22Guq67r4bB/DDE0fujECQbB7RKbPHhlWpo1fhrHjwnIy5zadxKmYg
	 +IYqIjOSeOGEPFBcB6+z6l/yVozIVY93xZOIuXaRxcKWpYBudiBwxKU/it+59tOOJp
	 Q2YGpYim3pHS+agbJq/mqKtgjF2TxoKmixfVV2Wji7asmZm6vPDCK5K0vYqrAWrME6
	 Ko1nnzLXZyt3hpk5ihRtY6+T4JFX+KVo/nBBzuxmSUuRR3DUJWGj1QHd5ffeChUlq0
	 RbDQGvLm5/jDT4T+VHQKr6ZXp/zKuYXDqPnw3byS1OwfLz+etMhLaPE2KiorQkzPBw
	 7JL7IbnQ7sAxw==
Date: Mon, 30 Sep 2024 01:39:16 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Dan Callaghan <dcallagh@chromium.org>,
	Sami =?iso-8859-1?Q?Ky=F6stil=E4?= <skyostil@chromium.org>,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH] platform/chrome: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
Message-ID: <ZvoBRGnCFNYpBJHQ@google.com>
References: <20240920151445.499933-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240920151445.499933-2-u.kleine-koenig@baylibre.com>

On Fri, Sep 20, 2024 at 05:14:44PM +0200, Uwe Kleine-König wrote:
> These drivers don't use the driver_data member of struct i2c_device_id,
> so don't explicitly initialize this member.
> 
> This prepares putting driver_data in an anonymous union which requires
> either no initialization or named designators. But it's also a nice
> cleanup on its own.
>
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform/chrome: Drop explicit initialization of struct i2c_device_id::driver_data to 0
      commit: 7cbf28998d737e04c4872cfeedd1a546d22cfb44

Thanks!
