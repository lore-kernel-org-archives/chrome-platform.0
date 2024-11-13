Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9692C9A
	for <chrome-platform@lists.linux.dev>; Wed, 13 Nov 2024 06:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731480381; cv=none; b=fvTuQGVAvPnMF8K8+TjemVCfWGbHL89q56h634N4VSamc62rLEbvzfcwCWIJqtQFhXWPusuvlTdjGlM92qYKZZHkLTel9UadB0Ugpq/TnQK7e5PewEKredzuPO/VpB/cZ/MaXT/y4qPO+sjBvIURfy32pXZb09VlhiEA5zTLSVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731480381; c=relaxed/simple;
	bh=OmB2hlmnqQuFS/rWK43dcgbtrhh+iwWXMBm07OaA4rM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hxiLvI9q5tpWL7HgG97/xke8eSlvwTsP3N1OKLR8jTtkXvKAxtQ0ikli8BDHzRiJeUdQ7OcY7iXCAPhuyoRUrDeM8TKSbvbgFIMikvTb4FQlSTAhc6e5d42hHUBuDYltl4ASNsbbUoeqJfvTp4TV/7+BbNJez3UUbvfa7deGzag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZQbjQIm2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZQbjQIm2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DDC9C4CED2;
	Wed, 13 Nov 2024 06:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731480381;
	bh=OmB2hlmnqQuFS/rWK43dcgbtrhh+iwWXMBm07OaA4rM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZQbjQIm2HaFVGlsUF/KRyE/w+P/2a19Sq6LCap6a5cbILULj1Sut5zKcEahw6R3+g
	 UkVbGCsvLauYxqynm6U/Cx2CT994iGwnVbQIfAIOf4LrKCY6DSTYKy6LdQgEWcfR06
	 GONCuL3UdwIAo5RC0o2NvVxXp0uIa083n6IbufvQjLKa4WZIQO0ExFBqtfDf4r20WN
	 cl60rDMNCpQ3vthDRqS6fbgH3h6ngnWGBWOnrTasoozFdsPgRoMNd3HlNo/QUh8Cmo
	 Txtel8gY/AJFyXVK12bueWKpfWMFnGJP5uvyJsDFvnWzdIK5mIs9e/YhG2OOJLA5r+
	 bdcJ8u720QTHQ==
Date: Wed, 13 Nov 2024 06:46:18 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Brandon Casey <drafnel@gmail.com>
Cc: bleung@chromium.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH] platform/chrome: cros_kbd_led_backlight: support Google
 Link
Message-ID: <ZzRLOmDCOrCa5DJW@google.com>
References: <20241113023800.6263-1-drafnel@gmail.com>
 <20241113023800.6263-2-drafnel@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113023800.6263-2-drafnel@gmail.com>

On Tue, Nov 12, 2024 at 08:29:05PM -0600, Brandon Casey wrote:
> On the Google Pixel chromebook (aka Google Link), the keyboard led
> backlight has the ACPI device id "GGL0002".  Let's add it to the
> configuration array.

Why it can't be matched by "GOOG0002"? [1]  Have you tried to update your AP
firmware?

[1]: https://review.coreboot.org/c/coreboot/+/11478
