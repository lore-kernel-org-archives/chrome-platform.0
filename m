Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CFC62D
	for <chrome-platform@lists.linux.dev>; Mon, 29 May 2023 04:13:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E3B9C433D2;
	Mon, 29 May 2023 04:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685333597;
	bh=uskfSfulA8rSKgayNamRK9w7GPcGS4LT1ycjuOHH8R8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hOjQaboJnP5lHCd9r/5mDDwo171P1v1u3hB92VU5RuAZsCJTWAxkT0mloc8Czj4JM
	 9n/MEr/KfSjEW3aRJ6ZO/4CfbwqZd5s+PM1CiwPgwE9lihvQhxryHBIjXjO/KntcIs
	 9bL/54qRbF+mQZNQZX1rh+b9moziFaCPPvOY+VjUuZcXl3wkW7qodJHEDkV9RtF+ux
	 JNnqD8TJwXTTLyhmCsj+r6Pk23KudUdZNhGqFKB+K2ADiWV4/q4fjiaIyxSqGrvgdt
	 oiN5SogGBct03ehZuFRztoZOIG6P3Brd2ZQ/fKxS+JZlJe3TdY2RmsNE0rGKVqaKig
	 4dsgVK4RJ8f1w==
Date: Mon, 29 May 2023 12:13:13 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: "kernelci.org bot" <bot@kernelci.org>
Cc: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
	chrome-platform@lists.linux.dev, eballetbo@gmail.com,
	bleung@chromium.org, groeck@chromium.org, pmalani@chromium.org
Subject: Re: chrome-platform/for-kernelci cros-ec: 10 runs, 3 regressions
 (v6.4-rc1-4-gf5bb4e381290)
Message-ID: <ZHQmWcc/d+rcAJnx@google.com>
References: <64741d34.630a0220.738c6.b8cc@mx.google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64741d34.630a0220.738c6.b8cc@mx.google.com>

On Sun, May 28, 2023 at 08:34:12PM -0700, kernelci.org bot wrote:
> chrome-platform/for-kernelci cros-ec: 10 runs, 3 regressions (v6.4-rc1-4-gf5bb4e381290)
> 
> Regressions Summary
> -------------------
> 
> platform                     | arch  | lab           | compiler | defconfig                  | regressions
> -----------------------------+-------+---------------+----------+----------------------------+------------
> mt8173-elm-hana              | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chromebook | 1          

The failure isn't persistent.  It passes in a re-run.

> mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chromebook | 1          
> mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chromebook | 1          

The fix is pending [1].

[1]: https://cgit.freedesktop.org/drm-misc/commit/?id=1464e48d69ab7a50a377c9d39f5e5eb3cee2722e
