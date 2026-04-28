Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3861394786;
	Tue, 28 Apr 2026 02:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777344302; cv=none; b=V8FepVWldbfuBJYlngY6IcByfkGq71O9IpmhWwTgZptMDtniWUgqRQ3lo+pmZFrccAM2Quy6SA+OMmhxw3U+8/UTitpD/Stz7G/835U/r5VakyoHib8vstFmDaaKqiiaxvU5lTPSCYb5C20+Zj9Ofb5vnUbrdSFgixHXOcppc4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777344302; c=relaxed/simple;
	bh=v0MzbtTf1ZHqfSXYCLMrRWhMNKBtIe1krG4+L/OtlrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g/AbEmeM/7I7jFYBE+HFonVBenpx6zPFDi4DEiE5CfMfSivxoYue5N+twhyogLV8jh7C/AeuIX+K6gJCqdMQMUYPUN9mVMz246eWg3YJf4UoqtvEM4NWP8U3KBgnMZ3C9itEbymviVI0a44XcjpPkHsHby8nGpncm5NsYQ8tIhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aey4K0Pa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aey4K0Pa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7869BC19425;
	Tue, 28 Apr 2026 02:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777344302;
	bh=v0MzbtTf1ZHqfSXYCLMrRWhMNKBtIe1krG4+L/OtlrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aey4K0PauBGwPXjcjVHpANnm3z6CN9lT4NtRNW6UYzgZxT7O8TgFMZ8lMNIWGfsTz
	 vY8QvPu6fd1M0ReIBODHb+GViFc/4vb8894AVIftf22fSNRNuIPaO7CyFfCUUkALA3
	 YieABdGuHa/yxuoTOu4BZOcOv6GA79xYUlL/6H6086oKZnFVjP/ZZvzIabMmgHxIRF
	 5GQ7XnvDBchXevgb7h6G+JLmJZDH8OZTiQpRZ7pGwFuvxhCSUHH3wnAYoeuAUYeYs9
	 vm5sgk3f19W1csGj+QLMyr8b3m0jnE732o0wHpFn0FntT1z8J4u9DTEzCv7WOPzOE2
	 lAGo1cuIbKXHg==
Date: Tue, 28 Apr 2026 02:44:59 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Titouan Ameline de Cadeville <titouan.ameline@gmail.com>
Cc: briannorris@chromium.org, jwerner@chromium.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: google: add bounds checks in
 coreboot_table_populate()
Message-ID: <afAfK_uK0tir4a9z@google.com>
References: <20260426214739.117131-1-titouan.ameline@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260426214739.117131-1-titouan.ameline@gmail.com>

On Sun, Apr 26, 2026 at 11:47:39PM +0200, Titouan Ameline de Cadeville wrote:
> coreboot_table_populate() iterates over firmware-provided table entries
> with no validation that the entries stay within the mapped memory region.
> A corrupt table with a large entry->size advances ptr_entry past the
> mapped region, causing an out-of-bounds read on the next iteration.
> 
> Add a check before dereferencing ptr_entry to ensure the entry header
> is readable, and a second check after reading entry->size to ensure the
> full entry stays within the mapped region.
> 
> Pass len from coreboot_table_probe() into coreboot_table_populate() to
> make the mapped region size available for validation.

To be fair, the `len` is also from the firmware.  If it's corrupted as well,
the out-of-bounds read could still happen.

> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-firmware-next

[1/1] firmware: google: add bounds checks in coreboot_table_populate()
      commit: 7b1a1af4556a4f95ef273e91435fe804cbfcd223

Thanks!
