Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37946FC9
	for <chrome-platform@lists.linux.dev>; Mon, 15 May 2023 07:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 458FAC433EF;
	Mon, 15 May 2023 07:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684135313;
	bh=MQDfGwDuD9yddotZ+AyoI3cIq+8mZI4lvGjlEdCGq+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ex5sf5vOR9Bo4V8Tc4hzYHJ5zA+MIrgXBsAcGZ4ke9QmA2wI/ZguBDsp3R8SgnrBX
	 VdkGldzDRg/ZrZJ5NH1D4Mp1X0V1pepfv5xzb5Wj96se1rwnxBldt96ondp2xeulhC
	 EI6cxr4WxGldPR0g2VnCJWRQodlzB3NO033DGqB6rUcR0dMX0du9wOuz1M7COFH1Y6
	 3cJkCmXnOSywYLzH4qXuz+EJkh7rQHJi0T4nuuSjM6lGkwPiNdnL7CcA787uSZFbCn
	 4ZpS9EZKj2f1/sijBcLd7Ev6skYCli1ZMbNzUzIoAEKSoXszmru2UQk3VnFxSNTyfc
	 dTX56nn4jGR1g==
Date: Mon, 15 May 2023 15:21:50 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: "kernelci.org bot" <bot@kernelci.org>
Cc: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
	chrome-platform@lists.linux.dev, eballetbo@gmail.com,
	bleung@chromium.org, groeck@chromium.org, pmalani@chromium.org
Subject: Re: chrome-platform/for-kernelci cros-ec: 10 runs, 2 regressions
 (v6.4-rc1-1-gc9f9c6c875d14)
Message-ID: <ZGHdjqL9Nvg3eTBt@google.com>
References: <645d7c69.170a0220.4056f.f4f3@mx.google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <645d7c69.170a0220.4056f.f4f3@mx.google.com>

On Thu, May 11, 2023 at 04:38:17PM -0700, kernelci.org bot wrote:
> chrome-platform/for-kernelci cros-ec: 10 runs, 2 regressions (v6.4-rc1-1-gc9f9c6c875d14)
> 
> Regressions Summary
> -------------------
> 
> platform                     | arch  | lab           | compiler | defconfig                  | regressions
> -----------------------------+-------+---------------+----------+----------------------------+------------
> mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chromebook | 1          
> mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chromebook | 1          
> 
>   Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernelci/kernel/v6.4-rc1-1-gc9f9c6c875d14/plan/cros-ec/
> 
>   Test:     cros-ec
>   Tree:     chrome-platform
>   Branch:   for-kernelci
>   Describe: v6.4-rc1-1-gc9f9c6c875d14
>   URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
>   SHA:      c9f9c6c875d14a107dabcf4579fcab95ed30af31
> 
>   Test suite revisions:
>     cros-ec-tests
>       URL:  https://github.com/kernelci/cros-ec-tests.git
>       SHA:  fad9423ae3c64bfd48c207de34a1177000d45fa8 

The 2 regressions are persistent after chrome-platform rebased to v6.4-rc1.
I am investigating them.
