Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E7E365
	for <chrome-platform@lists.linux.dev>; Tue,  1 Nov 2022 05:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EF85C433C1;
	Tue,  1 Nov 2022 05:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667280736;
	bh=1dCBuQ9n2S/byCJgu/FWkyZlxOFd8kI13nXkIQw00Jc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BIingfoT/88zEoHvE2jndRKvlGxhNPA0ksQoEJsnkuJ0GlFmMHsBLAubUyhQWbSv9
	 afHvKGqYQw/Uu0WwWBVN6/3fwc8b/r+1eordWhMXxcOamiIgkZ7nJp2jX9VXocEc9E
	 /H+D+kda6Ho/zN9ouAnYIN+Z813djKPU0piCxjlGXbDsLsGtyuRO/9cSolzeBJ4R6X
	 EyEbu+lyXw9c+FocIYOmXlXGNM/Q0TiAx5uOPjm+rl1y8IYcfOWR0pRePZNF/c1PjH
	 K2CLLasxRRom79nWbyjetBb7UJoyXYv/XfMPd1W2aON3JgbQkOb4NSvda2yfoiMQH9
	 YZG3fvb8WmlmQ==
Date: Tue, 1 Nov 2022 13:32:12 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Brian Norris <briannorris@chromium.org>
Cc: Mark Brown <broonie@kernel.org>, kernelci-results@groups.io,
	"kernelci.org bot" <bot@kernelci.org>,
	kernel-build-reports@lists.linaro.org,
	chrome-platform@lists.linux.dev, eballetbo@gmail.com,
	bleung@chromium.org, groeck@chromium.org, pmalani@chromium.org
Subject: Re: chrome-platform/for-kernelci baseline: 98 runs, 5 regressions
 (v6.1-rc1-5-g27b86a65cd16)
Message-ID: <Y2CvXBE414t3sqDC@google.com>
References: <635f6274.170a0220.79b7b.5d1a@mx.google.com>
 <CA+ASDXPHbdh=_s4qiZbCQz0_VbFuh_gKvsq=mWFZ5QY-QUPKAA@mail.gmail.com>
 <Y2BAGBVik+VvLTwF@sirena.org.uk>
 <Y2BKg6gefPQ9BUAc@google.com>
 <Y2BRxJ/qrl9cjWbK@sirena.org.uk>
 <Y2BcAFf77/JMQxYR@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2BcAFf77/JMQxYR@google.com>

On Mon, Oct 31, 2022 at 04:36:32PM -0700, Brian Norris wrote:
[...]
> ...but still, it's kinda sad that we've bothered to set up all this "CI"
> and then nobody paid any attention :( I only noticed because I recently
> subscribed to chrome-platform@lists.linux.dev.

I do notice that the kernelci reported test failures/regressions for
chrome-platform repo.  I only raised my hand in some private sessions
instead of public mailing lists.

For now, I only see build results (e.g. [1]) as a signal to move patches
from "for-kernelci" to "for-next" branches; and ignore the regression ones
temporarily.

The LAVA lab "lab-collabora" was setup by Collabora; and it has been
un-maintained for a long while.  In order to troubleshooting, I thought
we need to access the LAVA dispatcher and boards (at least from SSH).
But it seems only Collabora folks have the permission to access them.

In either cases, we should figure out a way to make the "CI" back to work.
I will seek for Collabora folks' help.

[1]: https://lore.kernel.org/chrome-platform/63609caf.620a0220.bd35e.9c8e@mx.google.com/T/#u
