Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A4225393B
	for <chrome-platform@lists.linux.dev>; Mon, 23 Feb 2026 07:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771832610; cv=none; b=keTcIobM1petdAffao261Rwt1Ck8yizgQowvZUKEoEM9aWtMSn06YQHGBoDvqcGyJSY/1xYVWz6D4omtvB4RHPipZ8i+bvpYHC6c8SXDoMp3XlWThcbv2RVRL0w1PXdgX0D69PjxksJlhxS9E2zH+hFJHrqnjHXD5bBMaEUgDhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771832610; c=relaxed/simple;
	bh=zxpTjnAx28auicqJX/WEiGZbkW9ydG+3UGzjYbMd9Rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P8k7+Mo7c7sFTXh8sEYMkh5GGLd03gfWp34dGcoOfY7qF8NMFrq+9r5m8w1ncXJPrRsogKRMGeLzoyWhabt9PRDarT+7kT88s0CUguUqGlDLGZl+UXbPfRQsl+vA/DUq+uuPPCUQR3B4gbbUhVruZ1yykAPkAsAxOtZgGv1edGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hNHblH+B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hNHblH+B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D1FC116C6;
	Mon, 23 Feb 2026 07:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771832609;
	bh=zxpTjnAx28auicqJX/WEiGZbkW9ydG+3UGzjYbMd9Rk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hNHblH+BoPww+ww/XZShRoT9RjjkIBoe3QCiXaBLsN/SAE8tw1hGLPhUNXZWEOujK
	 axFdyi45Vh0dPISCECwag1OZqd0FMIF7Jz/acm/zmh2xLFx4AsZlHF63JiAxaVVXcK
	 l87Ajun0pRwCtvMVzrCX9cYm/foiUmYz6kQak+IVpS0VEzIHWF5CtPc7LcenKS5Zj7
	 GwBZIRxqkBIRYayXLP79fcO+7mmyJajjPeZmZgbOyfWL/k+PJlQx9Af8U/X+H4FXoQ
	 z0yUU93EY5i5nGWTFeLmxCUL2njLOLGqT5mP+UoPuBSBlcS5OG6RQfnrsvW/e4VLG0
	 dDvXZXodo2diw==
Date: Mon, 23 Feb 2026 15:43:26 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Gwendal Grignou <gwendal@chromium.org>
Cc: chrome-platform@lists.linux.dev, Gwendal Grignou <gwendal@google.com>
Subject: Re: [PATCH] platform/chrome: lightbar: Optimize command size
Message-ID: <aZwFHuA2wWm-xng0@tzungbi-laptop>
References: <20260204035036.697955-1-gwendal@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204035036.697955-1-gwendal@google.com>

On Tue, Feb 03, 2026 at 07:50:36PM -0800, Gwendal Grignou wrote:
> Enabling tracing with:
> echo 1 > /sys/kernel/debug/tracing/events/cros_ec/cros_ec_request_start/enable
> 
> To monitor the command and response size. The defaults are 194 and 128 respectively:
> cros_ec_request_start: version: 0, offset: 0, command: EC_CMD_LIGHTBAR_CMD, outsize: 194, insize: 128
> 
> Reduce the sizes to the expected subcommands.
>
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform/chrome: lightbar: Optimize command size
      commit: 286386820d524a76647b8a1de9e4122270da6975

Thanks!
