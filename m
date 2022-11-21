Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD667E
	for <chrome-platform@lists.linux.dev>; Mon, 21 Nov 2022 07:27:51 +0000 (UTC)
Received: from [192.168.231.135] (unknown [213.194.153.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: rcn)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E36B1660294D;
	Mon, 21 Nov 2022 07:27:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669015668;
	bh=hNU7dgWwvCxNbDsalwA2siVuBbqISTMScB6KgdfYX9g=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=E3eECJMzNz51UnZyuvo7I35DRijzjUZkCdnimYGDJFJuIg5ACkGRwns6cb0NVqyx3
	 ZTbu4P+3rNGBx/DbsCmarRR+RZYYS1u71hk9LOSR1AAskP/4gkJlAkgOQ7MlDOxVcH
	 Efkt2NWmbI/zkZTCHIyhaOkP3kNtezXw5IY3TOKDydZGnaHWi6trh7wNp/hK8sSbAi
	 DxdQtn5aeZXCXiEFhO0Ysc9a8FT9h7iccar2HqZkwewozjhnbqu/c9eq4LgCV8Ujr4
	 T97OIX9uJqQuwuUAisHWPRHAV/I2NIt3+oYLJ1nOrB6X7HHRYhLyiO/TcdnpzUOkNL
	 ee1lD8w+vlznA==
Message-ID: <2a9362e4-e793-3333-50a7-1b185a1c47f3@collabora.com>
Date: Mon, 21 Nov 2022 08:27:45 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: chrome-platform/for-kernelci baseline: 102 runs, 6 regressions
 (v6.1-rc1-14-geba771858c2d)
Content-Language: en-US
To: "kernelci.org bot" <bot@kernelci.org>,
 kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
References: <63789721.170a0220.56d90.8424@mx.google.com>
From: =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>
In-Reply-To: <63789721.170a0220.56d90.8424@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Some additional info about these regressions:

On 19/11/22 9:43, kernelci.org bot wrote:

> platform                     | arch  | lab           | compiler | defconfig                  | regressions
> -----------------------------+-------+---------------+----------+----------------------------+------------
> mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chromebook | 1
> 
>    Details:     https://kernelci.org/test/plan/id/63788de1ef2d2b8b992abd08
> 
>    Results:     0 PASS, 1 FAIL, 0 SKIP
>    Full config: defconfig+arm64-chromebook
>    Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>    Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v6.1-rc1-14-geba771858c2d/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
>    HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v6.1-rc1-14-geba771858c2d/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
>    Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20221107.1/arm64/rootfs.cpio.gz
> 
> 
>    * baseline.login: https://kernelci.org/test/case/id/63788de1ef2d2b8b992abd09
>          failing since 79 days (last pass: tag-chrome-platform-for-v5.20-2-gddffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483)

The boot process seems to hang during driver probing and the
system doesn't reach the login prompt. More detailed testing
might point to the panfrost driver as the culprit since v6.0, as
using the same kernel with the same configuration except
disabling CONFIG_DRM_PANFROST makes it reach the loging prompt.


>   
> 
> 
> platform                     | arch  | lab           | compiler | defconfig                  | regressions
> -----------------------------+-------+---------------+----------+----------------------------+------------
> rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chromebook | 4
> 
>    Details:     https://kernelci.org/test/plan/id/63788ef9e66068606e2abd59
> 
>    Results:     85 PASS, 7 FAIL, 0 SKIP
>    Full config: defconfig+arm64-chromebook
>    Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>    Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v6.1-rc1-14-geba771858c2d/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin.txt
>    HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v6.1-rc1-14-geba771858c2d/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin.html
>    Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20221107.1/arm64/rootfs.cpio.gz
> 
> 
>    * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id/63788ef9e66068606e2abd7b
>          failing since 227 days (last pass: v5.17-rc1-10-g0ef49b25b7cc, first fail: v5.18-rc1-1-gbf84b10d9901d)

Both the cros-ec accelerator and gyroscope tests fail because the
IIO ABI has changed slightly since 6.0. For instance, the
`deviceX/location` sysfs attribute has disappeared. This will
keep failing unless the test is updated to be compatible with the
new ABI.

Cheers,
Ricardo
