Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA201DF6C
	for <chrome-platform@lists.linux.dev>; Mon, 29 Jun 2026 03:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782702144; cv=none; b=JR2M33h2dvr7ScAHyALs6a1iO5rWFlIAcAHGPx99rcKY6811/en7EMsknwH8ZvXeykklPfYFt8uK/dcsQ4giE8VabX+zo3/7vRD3/g+IvgtRIVmvRupM/WmdZweUCjsL704UyY6gl6hl1dVDesHnFf6XaZYADwh/6OqNrxl/zzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782702144; c=relaxed/simple;
	bh=i2/yRiSksc7TXlQJ4QYXWjDzygl+LHTEAX730qvojWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b2sYgfuDcqIAuCxt3qRkk0mhS0h2/mS4AX3ipYywYWeS4m1aIlV4WvrFeElLVWygeis+in3JxjUlEdEnaSpRGijLJ13Cb7fBYnBff3gNYJ66KQCk2wL+Fw/sy0d5tJ1PE0HYlxXJbhXxbZ+WNZfmyVE5Hat7K7cLCeNZ0huFnUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NrQ15SVl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NrQ15SVl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B0661F000E9;
	Mon, 29 Jun 2026 03:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782702143;
	bh=ge+HwM3cOBj/2unsLmtjGjipyGQixa+Ot1WCZ1gfy+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NrQ15SVlTEVzWHdMXF7uUJu97XPTCL6R4X3q2XnuZCNC+pNQ3vEdt6E43Eiaxb7Qv
	 EkAvaHPr1tCXf8j/t6iVs5aD8dfSoE1Fype69b5tbc2k6NeNJDH4dG0b/sK4xIIleL
	 SgMKFFqoJBT/Trpmb751s0D2qKV1EflgBGRn9UXL8KsIR+pDjFjh96DNR4RHzL9wIM
	 hk569ynv7LqVvj57x0eEDjivL2RNR67q4vvlzDSwBU3QLaqGZTwxp1BBLPqzRccnhu
	 pzrsr0EJ1cTlaAV/UPAKt4ZeBU9t/049AW9ykYtN80oDUbwrbbZHCAjZZQQslU6LaP
	 bX64gXBYmFAEA==
Date: Mon, 29 Jun 2026 03:02:20 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev
Subject: Re: [PATCH] platform/chrome: of_hw_prober: Use dumb trackpad prober
 for Spherion
Message-ID: <akHgPBS7_EjxWMeC@google.com>
References: <20260625060859.1020483-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625060859.1020483-1-wenst@chromium.org>

On Thu, Jun 25, 2026 at 02:08:58PM +0800, Chen-Yu Tsai wrote:
> The trackpad power supply on Spherion is the system common 3.3V power
> rail. This is always on as long as the main processor is running.
> 
> Switch to the dumb trackpad prober since it does not need to manage
> the power rail.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform/chrome: of_hw_prober: Use dumb trackpad prober for Spherion
      commit: 10a1e8c3539039c4c9de4783a683e8e01a3dee8d

Thanks!
