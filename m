Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FEE757E0
	for <chrome-platform@lists.linux.dev>; Mon, 29 Jul 2024 04:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722228642; cv=none; b=TdoG74ydEaRxOqnHWt0+UXW20IGbCDWKx+qnL5wRSkNN3KXn2v09Xw1+THuTDyS6G6lKPGGTkCxo6tuB7hDS62GkpUPR1X/Ntmxk4yCymKQOrVrtP/zfe+calUUknHfGNRnelwSSRCsML/eyEn6EB/gYMut4PFKY4cNArwQ5a+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722228642; c=relaxed/simple;
	bh=nefRl4iejJtZdob1wxQX1au9yfsCcKm5/mXaADbXFZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KE1+SUxrYLQEvqGz0F0nGpJX1sfG8zgAotHN7iAZ3G5F3HUIFFHohMw5pLjevdsB2W2/cVl4v1LqQYXQ+OneotCuLV5xxFVK8P36RLAH8tRp17zJc1Je7LZVr4oQS68LdLZNxcOGvhNFlSOY6YAzrrxj7wOgLaoVQ2S07zyQoBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LaQBVkhM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LaQBVkhM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4D0DC32786;
	Mon, 29 Jul 2024 04:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722228642;
	bh=nefRl4iejJtZdob1wxQX1au9yfsCcKm5/mXaADbXFZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LaQBVkhMhmGsB8HZ7QFslrQZynLOuAtvh+VNvPPQ9h82i3EDd/CqMSUCcrUkrd+wR
	 a6gkfSo5ggPs3RpO3nb2d4Ug24KfDGgCcw9X6h9b5qH5lJoRwOruDX9XMO1L6r2rIs
	 HmqRohf71w894D5pdeYJbDFslUZTRcersVkjOZWxgvgjMeYQshwa023IWCK+oD7EYQ
	 /ayVflPglU5RbMGR+bId7rLPdWlzErRm6C/QIaxyn1m0/zcw+PKUsBl0u0Izr5PgWb
	 b45fznuN3hAUk1Dfs1tg40AUSJR82IT++vdaVzCLMFKljMDtW0H/yq9v4DbG2y0s2Y
	 VPdcVY5sFUAjw==
Date: Mon, 29 Jul 2024 04:50:38 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: "kernelci.org bot" <bot@kernelci.org>
Cc: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
	chrome-platform@lists.linux.dev, eballetbo@gmail.com,
	bleung@chromium.org, groeck@chromium.org, pmalani@chromium.org
Subject: Re: chrome-platform/for-next build: 5 builds: 1 failed, 4 passed
 (v6.11-rc1)
Message-ID: <Zqcfntpk-IduyAPI@google.com>
References: <66a71c71.170a0220.199d7a.14dc@mx.google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66a71c71.170a0220.199d7a.14dc@mx.google.com>

On Sun, Jul 28, 2024 at 09:37:05PM -0700, kernelci.org bot wrote:
> chrome-platform/for-next build: 5 builds: 1 failed, 4 passed (v6.11-rc1)
> 
> Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-next/kernel/v6.11-rc1/
> 
> Tree: chrome-platform
> Branch: for-next
> Git Describe: v6.11-rc1
> Git Commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
> Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
> Built: 3 unique architectures
> 
> Build Failure Detected:
> 
> arm64:
>     defconfig+arm64-chromebook: (gcc-12) FAIL

make[7]: *** No rule to make target '/tmp/kci/linux/build/firmware-files/mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg', needed by 'drivers/base/firmware_loader/builtin/mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg.gen.o'.

Does it need a manual update for rootfs?
