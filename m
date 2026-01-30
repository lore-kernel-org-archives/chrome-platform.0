Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBE32DECCB
	for <chrome-platform@lists.linux.dev>; Fri, 30 Jan 2026 08:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769761945; cv=none; b=s1AyA04RzHiwJef7vXWPprCLBGkAqvV+koWyD1NDrhKpMok4KLz38oh5wRuCbGPwYk401YeQufD0NLmutCMp7mdXO9Q+a/JbGYHxV0HiYUUSys8roHC3nrbzhDFWJ0OlTriDLO9iRANVZX/NaoALEekNzbwriVfxQOBPEa1Fwb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769761945; c=relaxed/simple;
	bh=GYa4n214HZl04R5cN0W77177lgycsAtTY+2CMmi1qfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d6dvPr8Tdkyjm3UVrpvEpTP8zIW51IlnMK0SCkzpeo0rQgNvgM8G6tfIATNaPwWuK7jxCjqM1NtCImuv1RIsxmbrk4CjeghnF4XWa5v/gPq0skaTYxvchZ4AP0UpFVexdtgjMKSdkTzo9NDFtfiCdCkEf8nx8BtSp6Nd7NnTmoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K/POK7y9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K/POK7y9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F65C4CEF7;
	Fri, 30 Jan 2026 08:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769761945;
	bh=GYa4n214HZl04R5cN0W77177lgycsAtTY+2CMmi1qfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K/POK7y9Tmal+YUw17G53DUZZUOsvhv2Y/TWyjLHdeFXOf7jHchh1/gSRZfxjm9Tq
	 sbjLv6vb9TSELOfVaE7lzfjtXbOS7jq6FOK84OWna2DNt113bZl9K1cBdg9J0WEKSN
	 5f3tNffyy60vtc8eLL+JkuMoIBO1R/4T4fcgnED6uOgn9f3SSUqzaXWg0aZIAO0/iI
	 Ws8RS9nU1A8md0wjA4NdS78G3e+Ob75VB6rZXanTClX/MWtLgkeZmIQpntVgkweQSQ
	 MD9zEDcrk7amGnAUPbaDWjzjAn+uiWU/+sjybkaPkrWoOotLBvbnu8Jlv55UsVopzn
	 rreOVFMRqzDpw==
Date: Fri, 30 Jan 2026 08:32:22 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Gwendal Grignou <gwendal@chromium.org>
Cc: chrome-platform@lists.linux.dev, Gwendal Grignou <gwendal@google.com>
Subject: Re: [PATCH v4 1/2] platform: chrome: lightbar: Report number of
 segments
Message-ID: <aXxslo2U6kGQqQTK@google.com>
References: <20260130081351.487517-1-gwendal@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130081351.487517-1-gwendal@google.com>

On Fri, Jan 30, 2026 at 12:13:50AM -0800, Gwendal Grignou wrote:
> Add attribue `num_segments` to return the number of exposed LED segments
> in the lightbar. It can be smaller than the number of physical leds in
> the lightbar.
> 
> Test: Check the attribute is present and returns a value when read.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/2] platform: chrome: lightbar: Report number of segments
      commit: 2d8251d98ce0be96d79aec708aa70cab2b4f6f17
[2/2] platform: chrome: lightbar: Add support for large sequence
      commit: 9600b8bdbfe48bb51865be743450160577d2bae2

Thanks!
