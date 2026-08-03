Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FA221D591;
	Mon,  3 Aug 2026 03:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785726667; cv=none; b=Ljc7XwBRsVshgJVROKznVvxHjtsJBwYAZnTGNiXGQGVd4RIKOl98Z6d7p4whTbx3pj/mVrdia2pIUrzwFzuyMV2cAcyhvECcd7R55SvHwDbh2b8jY/2bxTpejWHk01KtWzxGEiY001bjzwd8ZKQEJIixRbJ6NTOHyWSKmQqHmBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785726667; c=relaxed/simple;
	bh=5xMrJy0mFGFmXr+kEpKZ24JY49czSXODW9c3MQHEZSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ACiyUSafx60x9t0EixiY03e4KIuokdSg2k3VXDLvBEUCHRG8v0g+3ffPaOLC7DbRTUisf3Hip+Q2YqZ6YtOaoJp7OsjoIbouLAlorYZEzHkBvRowVMPuxcM54hrW07eFuCHIOgDFhi7547/pqWgZg+PZR8iMqHW5VKxt3odl4OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mLm9YzJ9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mLm9YzJ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D85121F000E9;
	Mon,  3 Aug 2026 03:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785726665;
	bh=L36ozbsOhdGhMEZTKd0dqmV8iBx/LJAFr/WlbzGFTZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mLm9YzJ9DBuA9fgtKwNKVvBn/NY0tRfitlKiMgkBpoH/nhXZAGcVqce+ubwDLhHFZ
	 Gp7KLBz0zbbio7ZwBMKsvVzYPzUiuqOFDL7dp89zLuyDzVZBiuw2F9w8xEaf0i4ImG
	 FY3YsN7ZKC2d5y7bGBa3g0h5AkKRRwgp1co41Y/s03sRROrGdLDgmjWVCeuhjnqyMi
	 yBMpWqwhqtCr4riwNd3/eIK7j8qnLZqZB2QB0ev7jBNjys39hxSsXzfpOvz+GKBiuc
	 aqdIUnnWyucheLSxm3J+NNgOzFDUexB3TT2sKmMJvJA9ayqGf3bmML1OXlW9Q0+ljO
	 NjMiKjWAkT5yw==
Date: Mon, 3 Aug 2026 03:11:02 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
Cc: Thierry Escande <thierry.escande@collabora.com>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: google: coreboot: validate table bounds
Message-ID: <anAGxkdxO9TofqdB@google.com>
References: <20260801165651.42172-1-acharyalaxman8848@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801165651.42172-1-acharyalaxman8848@gmail.com>

On Sat, Aug 01, 2026 at 10:41:51PM +0545, Laxman Acharya Padhya wrote:
> The existing coreboot_table_populate() bounds checks limit individual
> entries to the mapped length.
> However, coreboot_table_probe() replaces the platform resource length with
> header and table sizes supplied by firmware before mapping the full table.
> 
> A malformed table can overflow the 32-bit size addition or advertise an
> extent beyond the resource, causing the driver to map and parse memory
> outside the resource. A resource shorter than the fixed header is also
> mapped as though it contained a complete header.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-firmware-next

[1/1] firmware: google: coreboot: validate table bounds
      commit: a58a57a1076f8c5dae0327e3710899478c3be901

Thanks!
