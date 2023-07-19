Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2FC17D0
	for <chrome-platform@lists.linux.dev>; Wed, 19 Jul 2023 02:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 593BEC433C8;
	Wed, 19 Jul 2023 02:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689732326;
	bh=0Z8nly4sCBSjn9JLpjlwIiG5kKFr0ypzfwrwYkLyCNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IDY1ZLGtApmiEzFza/BMWIKCn3RmQjmcmVpWBwMvqbmf1esAixgt3k5U71YpUfPJW
	 /24+kxakZiuV2VIXm6LZR+pBWyXg3xgu5xQOLb5A3crK1UrvWC2ad9B5vtYk7lQx3d
	 kvVA1g5K2/XX8QHBiD/j4M10fKULL2PM3NjL8LtvQKc8lMlEDvB4mQoHlEyPx8vj2B
	 McWV8OReJIJM5Avg22askcOQ7kcbooimboPUy7oITsqbNDhuVtYJDmLRZL8e6ITXC+
	 7dAOXYJZCv5sQjZQeHexeBgrcI8RikeCJxaw1ZZ/7BqHD/P+2F3iClmZbeKaY0LFBs
	 qgPZd7Z92hOnA==
Date: Wed, 19 Jul 2023 10:05:23 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: "kernelci.org bot" <bot@kernelci.org>
Cc: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
	chrome-platform@lists.linux.dev, eballetbo@gmail.com,
	bleung@chromium.org, groeck@chromium.org, pmalani@chromium.org
Subject: Re: chrome-platform/for-kernelci baseline: 78 runs, 8 regressions
 (v6.5-rc1-1-ga6edd5f5d9cc)
Message-ID: <ZLdE40YySsdVI7je@google.com>
References: <64b6537f.a70a0220.ace6e.2884@mx.google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64b6537f.a70a0220.ace6e.2884@mx.google.com>

On Tue, Jul 18, 2023 at 01:55:27AM -0700, kernelci.org bot wrote:
> chrome-platform/for-kernelci baseline: 78 runs, 8 regressions (v6.5-rc1-1-ga6edd5f5d9cc)
> 
> Regressions Summary
> -------------------
> 
> platform                     | arch   | lab           | compiler | defconfig                    | regressions
> -----------------------------+--------+---------------+----------+------------------------------+------------
> asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-chromebook | 1          
> asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-chromebook | 1          
> fsl-ls2088a-rdb              | arm64  | lab-nxp       | gcc-10   | defconfig                    | 1          
> hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-chromebook | 1          
> hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-chromebook | 1          
> lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-chromebook | 1          
> sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfig                    | 1          
> sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfig                    | 1          
> 
>   Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernelci/kernel/v6.5-rc1-1-ga6edd5f5d9cc/plan/baseline/

"baseline.bootrr.deferred-probe-empty" failures.

The error message:
<3>[    4.322265] snd_hda_intel 0000:00:0e.0: Cannot probe codecs, giving up

Will take a look on it later.
