Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F6F1DFFD
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jan 2025 02:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736303167; cv=none; b=nPXDNpT1Z3wFLjACwIIg5xt+wkMLEvLbbLOn5DekDX2n7mSWhcVevuz2XumB2Y4oN1xMyVWoAscBYKoxBG8fSUhQh/SIoeFrOk6SUCWtrte9FVxV0X+MvizL4MY3cOPwW0U2jS7ZDdWqyxIw3TKxOZyYiKZ+Kv2F8hB6BXru/CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736303167; c=relaxed/simple;
	bh=b2iNNU52Y9gjfWvopfgBwrUQ8eNML/Csd8ZaJiSY1AA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F5GSRlXRMY2hTj6K4q4HDPLeFt7YBqGVqmL6FdU1iyxf2TfNOp9L+9+jXFu7L66xowt/0My8H9mNY+/4I0KIc8fT52jdPIclxaWqDNlGdklQKkgNZ9wH3Nw0eIV2XQU+aeWbTrNpKZ1wxiEtKlYckXFc3QueL1HKwlD/jnrnAcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hMsTcQe5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hMsTcQe5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46336C4CED6;
	Wed,  8 Jan 2025 02:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736303167;
	bh=b2iNNU52Y9gjfWvopfgBwrUQ8eNML/Csd8ZaJiSY1AA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hMsTcQe50Xj+VOHuYgnbrBFXbN4ZnlAbDYa09LHG1SmTxVEGxUsB1HCrnQ5KMyJ3G
	 4X4uo4w+8S+nJY9FHM3kxjQIzuyXbMob+yeCflSFBakwIN2LT6aG2BOP6eg9T8EXEp
	 b4ZeDHvbl4WkWTle59SIVs6Xk96GPMXCOBkvA3GZJomtXys7NReIKKTpt/s+8OUn6r
	 ITRYORyCzNtM1j5oeNXxqJkric13O8M/WpanLGK1C5z/XJSq7gkJLaiVXblBKwLiIU
	 G/FpCACFY9tGeMtwY3I+2bt71yEtgnRD8Iv9hu5aVwmi0y86mrvdQP8e+vYTyXCqzh
	 xh844fR9fJ2ow==
Date: Wed, 8 Jan 2025 02:26:04 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Gwendal Grignou <gwendal@chromium.org>
Cc: bleung@chromium.org, chrome-platform@lists.linux.dev, dustin@howett.net,
	ben@jubnut.com
Subject: Re: [PATCH v3 0/2] Add support for IO memory mapped EC
Message-ID: <Z33iPIaUNFnOYQpk@google.com>
References: <20250107174514.2748108-1-gwendal@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107174514.2748108-1-gwendal@chromium.org>

On Tue, Jan 07, 2025 at 09:45:12AM -0800, Gwendal Grignou wrote:
> Some EC - Realtek - have their register IO mapped by the BIOS -
> coreboot. They are not using the well know io register.
> 
> The memory mapping information is retrieved through the ACPI CRS
> resource, and is used to access the registers.
> 
> To ease the support of these ECs, the global structure and accessor
> funcions are now aware of the EC device private structure.
>
> [...]

Have removed the redundant title prefix "FROMLIST" and fixed a minor typo.

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/2] platform/chrome: cros_ec_lpc: Merge lpc_driver_ops into ec private structure
      commit: 58517215304b6113beaa3a319ed19cdd9f8fbcc1
[2/2] platform/chrome: cros_ec_lpc: Support direct EC register memory access
      commit: be4fccb5e1fb5c732f2868b9a278e71d9be0283c

Thanks!
