Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C847F3
	for <chrome-platform@lists.linux.dev>; Thu,  8 Dec 2022 09:25:18 +0000 (UTC)
Received: from [192.168.231.135] (unknown [213.194.155.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: rcn)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D079D6602BE0;
	Thu,  8 Dec 2022 09:25:15 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670491516;
	bh=MkUP74WA6Lhg2LBTpzTlpCkJMul0UecweqS9u3N0T+Y=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=liLyrsLbHMr8EaIc3fremyPxMufcAqPnDgPnnBvneqa6XwUZBDiKCLKkGpGH8kX+s
	 9jhFrS/vzXQIrURWRfJltjQytKNa5BAChS+huFysk7nkS8ZVEJknsO+qpy1XgrGzv7
	 21vphI172Eh4189RAl6N0wwZkfZfmryGqTDlkJBJCfzMBfdN+zdRWjUJhqFeEa/rai
	 uSijTMIwtW3ujou2U04KRKF7O9XBFvW0egG0KPvPiF3ZhL1QVNyJM2h55qH0CAm3Us
	 JO8hMXiV0rQmUmLu0AFgsYrHJU0qh91UB5GNiH0RHAdn7jp4okPS8s65qKxT2Swcfo
	 oTcMHuCR1DArw==
Message-ID: <233c8754-f848-3c92-de8e-5a6b4818143a@collabora.com>
Date: Thu, 8 Dec 2022 10:25:12 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: chrome-platform/for-kernelci cros-ec: 8 runs, 8 regressions
 (tag-chrome-platform-for-v6.2-2-g5990db2d66b3)
Content-Language: en-US
To: kernelci-results@groups.io, bot@kernelci.org,
 kernel-build-reports@lists.linaro.org, chrome-platform@lists.linux.dev,
 eballetbo@gmail.com, bleung@chromium.org, groeck@chromium.org,
 pmalani@chromium.org
References: <63916948.170a0220.3dbdf.426e@mx.google.com>
From: =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>
In-Reply-To: <63916948.170a0220.3dbdf.426e@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/12/22 5:34, KernelCI bot wrote:
> chrome-platform/for-kernelci cros-ec: 8 runs, 8 regressions (tag-chrome-platform-for-v6.2-2-g5990db2d66b3)
> 
> Regressions Summary
> -------------------
> 
> platform                     | arch   | lab           | compiler | defconfig                    | regressions
> -----------------------------+--------+---------------+----------+------------------------------+------------
> asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-chromebook | 1
> hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-chromebook | 2
> hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-chromebook | 2
> rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfig+arm64-chromebook   | 2

Reported in https://github.com/kernelci/kernelci-project/issues/145

> sc7180-trogdo...zor-limozeen | arm64  | lab-collabora | gcc-10   | defconfig+arm64-chromebook   | 1

Reported in https://github.com/kernelci/kernelci-project/issues/147

Cheers,
Ricardo
