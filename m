Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E1023243D
	for <chrome-platform@lists.linux.dev>; Wed, 15 Jan 2025 01:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736904681; cv=none; b=ZbSzWr8cGnu7TRidNP5Aw7GylO2JeCjOFXRurENkFYdMju1jxaX3ga4R0quACeLF74IzRY/Y56qI7603YzExtN5jcEWr8IlY4vatEHCqgrrVxrnrrMJaBvVn/JsUIUdLoMtMzx9irHW0Zj12L4dPy4ZNiw31cpQ31bOEjHYh41g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736904681; c=relaxed/simple;
	bh=QcGGu6abWiB0gSGQoZESVZ4X97xjr9NNgwYPtwM4KwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uqGV3zXSyWBiWbUQPGGyDW7Vq/Xy6tfM10OtG6UegFpOG04eGMNsJixwNNYlfBNtV98k3qIA3rhDN9ClMIuzSCp8bSDuuu2k6rrcMrWyrOfyvIVi4hKE0AeH0rKLzE0gGK1HK/LZy1ib76BokuBrhaLZUT2RBfVbINxpv8TI9b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tsTgU/yo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tsTgU/yo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5102AC4CEDD;
	Wed, 15 Jan 2025 01:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736904681;
	bh=QcGGu6abWiB0gSGQoZESVZ4X97xjr9NNgwYPtwM4KwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tsTgU/yoo4BTShvOQPqXRdilpXaEott8Acvq0mlGRAGNxTeEODZFNqErTSPutAsBO
	 to/UZwyF7C3ASraix9qfugcghVC6Yn/xo6Je32Tl82gV/+/FJPJeXSEQAsf+EDJkq3
	 PH1AeuD5VQo+ozbfK5Z+MscBsoTZA+Wz/REwuJeCb8xgy51pGwwDjoMV1OUPthuB3D
	 3VXmmZV16tFmFIUs0lw/jNTgoyd0s+H55QoK1S2KFPTXLCu+ckJCioXAsgamaBDu9X
	 LFV01PYDDimJd/PoUXsifUkaPtiOylx4Z2xxa6+9aUrBwc0SwikgStrYlWnlDYbvqn
	 XfBtT0L4c8jEA==
Date: Wed, 15 Jan 2025 01:31:18 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Gwendal Grignou <gwendal@chromium.org>
Cc: chrome-platform@lists.linux.dev
Subject: Re: [PATCH] platform/chrome: cros_ec_lpc: Handle EC without CRS
 section
Message-ID: <Z4cP5hBnnCOMLefI@google.com>
References: <20250114202122.2352277-1-gwendal@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114202122.2352277-1-gwendal@chromium.org>

On Tue, Jan 14, 2025 at 12:21:22PM -0800, Gwendal Grignou wrote:
> Fix logic to support GOOG0004 device without CRS section.
> Instead of failing, assume there are not memory mapped EC registers.
>
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform/chrome: cros_ec_lpc: Handle EC without CRS section
      commit: fccebbdde2067e359f01382a72c31ed2af7acbac

Thanks!
