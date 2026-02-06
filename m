Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD172E9733
	for <chrome-platform@lists.linux.dev>; Fri,  6 Feb 2026 09:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770369681; cv=none; b=prodvKWlkr+CUMLnunZhIncMjtpA5WJHB9GEvoF0+DJ4wwZQ3ngK3knJhyqARBGlgYU8O2NxfI4hlvHuoyH9xqdTGQCFXO6sLpv1RZu/SbbudJFnq+sn3/Gehbaou0t5e+45OcAQaRKAXwkuIUjYpXT9w7QmP776lJ0V78miFLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770369681; c=relaxed/simple;
	bh=x8dctDvGGSLGb9dLz3H3RqvhSiBz7lp1ZxXTlJQf+pU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NJznrxjCmA3jjvDp7gOUgATT04Fi9QsPMW+ZzfqvF2yEU82GDlUcpoCe/GiBYlrpgcuI1T3MS0dfpUToJvUiNPEHywb2DmG9UYzZtkKbjnZtKXFjjqzcGwieuS+9bg9N7ezD4hPOPAsAD2xCAbyTKWnnIwpmRNOoUkWnq54sXzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LivoEBMP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LivoEBMP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E6C0C116C6;
	Fri,  6 Feb 2026 09:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770369681;
	bh=x8dctDvGGSLGb9dLz3H3RqvhSiBz7lp1ZxXTlJQf+pU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LivoEBMPkNeEBiAnuHruIxsBX5CmL6w/22z0dImWMb3nHIcaLqchr9QT3fcIw/net
	 irLQL9tdlyParu60ZzeCBK13nCyLQ797jUOqnNNxtKEYClVWxw96suBCj4MsdkloUJ
	 45IvWewGxf6Gq2NSQ8hqpcKPP3lS9ZTbh0lARpr8lF6/lLTCszVp/MPkIkrMjUHRat
	 f9+wHmpgdtQf/xs+H/rbQscY5ZjM2wVd/ldF8iBNCb6ketZZjmFxO30Qjs7jDMcGS2
	 zO8ZY86SBsZhzQKdlfTkWlnwGBg6xH6NXFxTcU2pGBk5MFfas+gdPXQCr8Y6C8u/G2
	 HnNuN20QJjkBw==
Date: Fri, 6 Feb 2026 09:21:17 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: briannorris@chromium.org, jwerner@chromium.org, javierm@redhat.com,
	samuel@sholland.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
	chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 12/12] drm/sysfb: corebootdrm: Support panel
 orientation
Message-ID: <aYWyjQinUu3akCuV@google.com>
References: <20260203135519.417931-1-tzimmermann@suse.de>
 <20260203135519.417931-13-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203135519.417931-13-tzimmermann@suse.de>

On Tue, Feb 03, 2026 at 02:52:31PM +0100, Thomas Zimmermann wrote:
> Add fields and constants for coreboot framebuffer orientation. Set
> corebootdrm's DRM connector state from the values. Not all firmware
> provides orientation, so make it optional. Systems without, continue
> to use unknown orientation.
> 
> v3:
> - comment on _HAS_ORIENTATION semantics (Tzung-Bi)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Julius Werner <jwerner@chromium.org>

For include/linux/coreboot.h,
Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
