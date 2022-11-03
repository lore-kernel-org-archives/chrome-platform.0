Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110FF7488
	for <chrome-platform@lists.linux.dev>; Thu,  3 Nov 2022 14:56:57 +0000 (UTC)
Received: from [192.168.231.135] (unknown [213.194.153.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: rcn)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B32C36602955;
	Thu,  3 Nov 2022 14:56:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667487415;
	bh=B9FshpsvDRPYLwB85IgNrohaRIuwt37+axiqWz1+Ryk=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=UqIzZHRLIdVLHICSH/IZs2NQg5M9HK5o327YLtHiOkgPN9Za0SaBF92FuV4mzfIJy
	 MhYIhXA2XPuQmvWSmpWVVVbSsZBQglb/aD0hx1lbcYXM59x+oe7v9FKR9YJd/gdm3l
	 TtijJxk0DtKnkCp0xQEyjpKpNC+NdZ+zqsoZ8/fG34veM7ui5Dwyu+2Knnz+fu+tkx
	 HY1W/Kd6rr6EdISIvDA5hN99XrbKdlZWybJjDvL0cAPCv4hOdsALhuKfV+WGiX6Ohs
	 I+AFlQMLTCWgmQYLOY4Ld1Hh/IJoDUuWyQ3B6/d81dIV15nH24pCSpMBx1uw7NA7O5
	 QPhaS6JJnkxKg==
Message-ID: <61cd97fe-60d3-1b7b-6c68-53e3e4fed7f7@collabora.com>
Date: Thu, 3 Nov 2022 15:56:51 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: chrome-platform/for-kernelci baseline: 93 runs, 7 regressions
 (v6.1-rc1-12-g52f572342440)
Content-Language: en-US
To: "kernelci.org bot" <bot@kernelci.org>,
 kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
References: <63625738.620a0220.d2e29.f2f7@mx.google.com>
From: =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>
In-Reply-To: <63625738.620a0220.d2e29.f2f7@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/11/22 12:40, kernelci.org bot wrote:
> platform                     | arch  | lab           | compiler | defconfig                  | regressions
> -----------------------------+-------+---------------+----------+----------------------------+------------
> sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chromebook | 1
> 
>    Details:     https://kernelci.org/test/plan/id/63624cfa62bf868a8ae7db62
> 
>    Results:     0 PASS, 1 FAIL, 0 SKIP
>    Full config: defconfig+arm64-chromebook
>    Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>    Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v6.1-rc1-12-g52f572342440/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-sc7180-trogdor-lazor-limozeen.txt
>    HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v6.1-rc1-12-g52f572342440/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-sc7180-trogdor-lazor-limozeen.html
>    Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20221024.1/arm64/rootfs.cpio.gz
> 
> 
>    * baseline.login: https://kernelci.org/test/case/id/63624cfa62bf868a8ae7db63
>          new failure (last pass: v6.1-rc1-6-g18ffa74c2259)

This is not a real regression but a problem that LAVA is having
sometimes parsing the output of the trogdor console due to timing
issues / race conditions. The Collabora LAVA team is aware of
this and looking for solutions.

Cheers,
Ricardo
