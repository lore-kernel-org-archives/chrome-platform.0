Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1247F3
	for <chrome-platform@lists.linux.dev>; Thu,  8 Dec 2022 09:20:36 +0000 (UTC)
Received: from [192.168.231.135] (unknown [213.194.155.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: rcn)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 63B126602BE1;
	Thu,  8 Dec 2022 09:20:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670491229;
	bh=z24AHnTKGFNtiNtyl7FLjWOJyq4qMc8FOWicMZtCqSI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=bKxIeV+7GBmjEonKI1Cjiir54w5E2BZFoyoFdBvhMQnhIY+W9EKOujlQRX1QKSgT8
	 OYKJFL94eY0XjRKGqGOUhPgdKObSdNkylboW9juQsVez5MEWISNRPJizSNbqgKA4Os
	 RQ6aPT0NgZnGyBUyrDu+ap8lg0AgpWlFs0UlLBJeJrF1rQHe7dsKUou3FucCLSuVSD
	 /LQ9RyvmQgCKP+5BZr652T34ME06iPgFeqKpPFYPrC2B6qrg3YOQIZnBundaYvDAZL
	 sNeuJC3ac3hK4q/mGW5adDE+8NVgdJcC0Dtbgm+NWsLeXvcz4A3v3mt4lCz/zY49SS
	 OhvmjNreZoRbw==
Message-ID: <3f26eff1-28a1-59ea-f5fa-143a526bb976@collabora.com>
Date: Thu, 8 Dec 2022 10:20:25 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: chrome-platform/for-kernelci baseline: 88 runs, 6 regressions
 (tag-chrome-platform-for-v6.2-2-g5990db2d66b3)
Content-Language: en-US
To: kernelci-results@groups.io, bot@kernelci.org,
 kernel-build-reports@lists.linaro.org, chrome-platform@lists.linux.dev,
 eballetbo@gmail.com, bleung@chromium.org, groeck@chromium.org,
 pmalani@chromium.org
References: <63915ebc.170a0220.13f37.38b9@mx.google.com>
From: =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>
In-Reply-To: <63915ebc.170a0220.13f37.38b9@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/12/22 4:49, KernelCI bot wrote:
> chrome-platform/for-kernelci baseline: 88 runs, 6 regressions (tag-chrome-platform-for-v6.2-2-g5990db2d66b3)
> 
> Regressions Summary
> -------------------
> 
> platform                     | arch  | lab           | compiler | defconfig                  | regressions
> -----------------------------+-------+---------------+----------+----------------------------+------------
> mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chromebook | 1

Reported in https://github.com/kernelci/kernelci-project/issues/143

> rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chromebook | 4

Reported in https://github.com/kernelci/kernelci-project/issues/142

> sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chromebook | 1

Reported in https://github.com/kernelci/kernelci-project/issues/147


Cheers,
Ricardo
