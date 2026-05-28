Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5312EAB6F;
	Thu, 28 May 2026 02:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779934892; cv=none; b=kHn5+O1hdImru5xBK0iu88PxpvYCe9d7dMV/gSdn7lxYtErCn9dNWsYtVjjzN8R/orSaC+5KtYrBbVEta2ByQwKdPWUfboXvUzkkJ+5VZABkKabSufR4kSp9r5bS9wt8pSWhinBc1wY32CHClTbJs9UULVhIcetGQx6VimKn9ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779934892; c=relaxed/simple;
	bh=0OED0lfZr9XZ3YDASuGxGAcPIVLpDeS4lY7VloRJR9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qp5Z4GI6AWvOfIpx6QrNLmLfa0QPTUkOaQZfGn9SfXL/xF5wcgDiEFB6bOb0QmgKYFiPrJW/vkODANiW7OYiXtF3DwLldppHGrHExL32M3Fj4/z1iJ6KyWldvg8vG3Tp05HMmGB1VipCQVHZ+PgbGSKqaPb/JLrllfr/Q1WiqEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b0QSABRj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b0QSABRj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD511F000E9;
	Thu, 28 May 2026 02:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779934891;
	bh=JhtpjdRAzzBUgS2p7Ni7BH7nAbaIVZYpmSfVqNMQq+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b0QSABRj6T5za7soT0rRbRFMeEyHSO/YOUVKbxxprt7jFaa4gCDmon48j24ytc/To
	 YwlpnGsITjpMbxqUa/3mdp7yAtt6U6rkyIBdxvqDHPjn3yLa/hG2v0MmTbZi017q/a
	 vTcVN714Z8nP13hmjrA5lG2j88UE5DrO7hGn9CdMGBImBHki10WxnNIzmrSDV2mso4
	 IOsf3XHYqB7VZFfNJeUN7eIu/RojqrSNdmkgTXTDQLW3c947T7MNuLzlrREH6oawYR
	 Z+Fkuc46aa7WOA2dq3DetRiC6AtCdBwPwZyrr6M4Fj4zRc87HZlAGIPfgxx8wPuWdf
	 MnFV3rkJxSxaQ==
Date: Thu, 28 May 2026 02:21:28 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>, Jason Gunthorpe <jgg@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] platform/chrome: cros_ec_chardev: Fix a potential
 UAF
Message-ID: <ahemqFEFo2x2qVWY@google.com>
References: <20260525052654.4076429-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525052654.4076429-1-tzungbi@kernel.org>

On Mon, May 25, 2026 at 05:26:50AM +0000, Tzung-Bi Shih wrote:
>   This series addresses a potential Use-After-Free error when a device is
> deregistered while file operations are still in progress or files remain
> open in cros_ec_chardev.
> 
> - Patches 1 to 3 are preparation steps in cros_ec_chardev driver.  They
>   introduce reference counting for platform driver data and an event
>   relayer.  This removes the direct access to `ec_dev->event_notifier`
>   in `cros_ec_chardev_release()`.
> - Patch 4 introduces a rwsem for protecting `ec_dev` to prevent the UAF
>   error.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/4] platform/chrome: cros_ec_chardev: Introduce chardev_data
      commit: 5ad1406881102bc3e94fd25311d1728dfaf435a2
[2/4] platform/chrome: cros_ec_chardev: Move data to chardev_pdata
      commit: 74aa0d4008051878c632530f2a2c13cff8e9b171
[3/4] platform/chrome: cros_ec_chardev: Add event relayer
      commit: 6c1977b1f760d7ec71da78781f1d9eeb7a0e21f2
[4/4] platform/chrome: cros_ec_chardev: Introduce rwsem for protecting ec_dev
      commit: 77750c0d8d837f59ad6ecde0157fd245ff3f3421

Thanks!
