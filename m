Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A41D395
	for <chrome-platform@lists.linux.dev>; Fri, 19 May 2023 03:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A6DC433EF;
	Fri, 19 May 2023 03:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684465222;
	bh=xF8EtCPp8YjapEhXULnE1IzePtr6GR3mGCBLEB4YcHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BQxxIQuTfYIioAJDQJHIb9eiobY0uCQd9Mpm9B+ATPqboGgABolIlH8oYMKZbt5Gy
	 NIFelpIo0TaNDIaCTJejfjrDIjwN5tZhp7b3DWtuCoaE1kwGn+W6tGfKwaaHY9zNup
	 0lFSP0Q9fh24dSVOvptoXAlSPw5HGhYNmlkERlHIMJ0ZuLl5nT1Ih65SZMlUv402NV
	 eDtCHhGSb4kWFsuBni15Z3si7eDfF29N26Gc9Ei966jdl1EaZW/vvMqzsKYdcz3UNh
	 yw2QqE5tkaBWd+uO87vTtg+LJzV3SpiyUkMWGnIVFjrsdErPulYXTIFM+Wc0rm32n1
	 u25nKqFunzNIA==
Date: Fri, 19 May 2023 11:00:19 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: "kernelci.org bot" <bot@kernelci.org>
Cc: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
	chrome-platform@lists.linux.dev, eballetbo@gmail.com,
	bleung@chromium.org, groeck@chromium.org, pmalani@chromium.org
Subject: Re: chrome-platform/for-kernelci cros-ec: 10 runs, 2 regressions
 (v6.4-rc1-1-gc9f9c6c875d14)
Message-ID: <ZGbmQ/S6npIewkMQ@google.com>
References: <645d7c69.170a0220.4056f.f4f3@mx.google.com>
 <ZGHdjqL9Nvg3eTBt@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZGHdjqL9Nvg3eTBt@google.com>

On Mon, May 15, 2023 at 03:21:50PM +0800, Tzung-Bi Shih wrote:
> On Thu, May 11, 2023 at 04:38:17PM -0700, kernelci.org bot wrote:
> > chrome-platform/for-kernelci cros-ec: 10 runs, 2 regressions (v6.4-rc1-1-gc9f9c6c875d14)
> > 
> > Regressions Summary
> > -------------------
> > 
> > platform                     | arch  | lab           | compiler | defconfig                  | regressions
> > -----------------------------+-------+---------------+----------+----------------------------+------------
> > mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chromebook | 1          
> > mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chromebook | 1          
> > 
> >   Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernelci/kernel/v6.4-rc1-1-gc9f9c6c875d14/plan/cros-ec/
> > 
> >   Test:     cros-ec
> >   Tree:     chrome-platform
> >   Branch:   for-kernelci
> >   Describe: v6.4-rc1-1-gc9f9c6c875d14
> >   URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
> >   SHA:      c9f9c6c875d14a107dabcf4579fcab95ed30af31
> > 
> >   Test suite revisions:
> >     cros-ec-tests
> >       URL:  https://github.com/kernelci/cros-ec-tests.git
> >       SHA:  fad9423ae3c64bfd48c207de34a1177000d45fa8 
> 
> The 2 regressions are persistent after chrome-platform rebased to v6.4-rc1.
> I am investigating them.

FTR, the 2 regressions are the same root cause.  The proposed patch [1] fixes
the issue.

[1]: https://lore.kernel.org/dri-devel/20230518193902.891121-1-nfraprado@collabora.com/
