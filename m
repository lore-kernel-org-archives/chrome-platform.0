Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3972439B954
	for <chrome-platform@lists.linux.dev>; Thu, 25 Jun 2026 11:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782388378; cv=none; b=ZU0EeKDsNkgetMJx3bW2xw99R+2fW7j2Dn48wyLxLJ5Tv1zTkjEW2VwzE+Z5xiUfQP8/itI7LWdyAj5qiuEfpLBe/rZFPonsWCHzw+dk6WA6EjlprAz2BJTfbYOFmQCR5bZwVxoCdsImzBp3nvgre+mlw4dgxXftHX/AwiFU2GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782388378; c=relaxed/simple;
	bh=3sAE/VMNu80O+WfuSL5iBs98yx63G14GTapXzogclNE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=mCTIgL1TZOffuh7moDoedY3t3U0VCa7MmOtT6BRKaCW12WeLgfCCi0aTA+oHGh5mChTkqScluYZMb+v/wvQavQhaO9/lXSygTaqx6wQ1CE64zeJGrVp/2hZIub91kbhSWV5tCZC14SPhli3Cd0R2xL5KqS96uvIC0zKtCa3gaJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N6RBiN7A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aXZ8Qr81; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N6RBiN7A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aXZ8Qr81"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9jw9a1371445
	for <chrome-platform@lists.linux.dev>; Thu, 25 Jun 2026 11:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cxK7ioiXaD8p2DdI5Hqejs6IMcrdhSLYsitFgDmOuW0=; b=N6RBiN7Albr7Uwb+
	n9LHghEu0cWJcld+Y18GGJx4RSNXPR+QPqdi0sGQtKsplA3J9+KVRtzNs/+R6Uzc
	u8FXAmeRWpE6ASGQlk3AqY52m7yS0E6jWS8pDrXOEIsrIoz8LOaZBuBfgoHD6jXY
	Qict4Wr68n7NKH8daHgYRwSfumA6lel9MKUbYA4w9YVmGIGzpyMH2DkwLAoiraKI
	mDWKO2SbmiRVdT+Hs9KtO+RQ+ARGj2ju+DkCmeLBQWY8G1x1tPVwEas3slVp9bSq
	v1NkqMZ+xQc5l5cD8PGSjxxCsRjrwPAVKcyiK4vTELn81gS3jDWWtJT40eQcLntt
	YDABPQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ymv11s2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Thu, 25 Jun 2026 11:52:55 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8428419982eso2315403b3a.3
        for <chrome-platform@lists.linux.dev>; Thu, 25 Jun 2026 04:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782388375; x=1782993175; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cxK7ioiXaD8p2DdI5Hqejs6IMcrdhSLYsitFgDmOuW0=;
        b=aXZ8Qr81+goqof5cDW744WXHUVYaYJq4BRVEi9wJI0RLCsDtdUJ69QldUwzeYawwEX
         JiseNm8Ox5dSRif22Fv78juuI+ZWhpGvRqdy4a/z2afYQhQmh0tSfY4OO9I6xlfXsgvj
         ALzDnwi5B71Jh9xBouWK3qc2n08wWmCZ+EiCVo/Z72+m8Udu1No39S5ZxdqSKXUrC5oo
         EQydl2SEH6TLNWuSnCjH+M7h5kBmMwxf01rvIJlFsRPZ9/Yefn5NhbQBEYerlhN4fQyc
         Ewsit/VtCdu0rKhDiTBiy35RdTjjMeFKn+yKjwWbqf4Cq9ADhVMljlyOHBJ4P5xx50c9
         Xa6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782388375; x=1782993175;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cxK7ioiXaD8p2DdI5Hqejs6IMcrdhSLYsitFgDmOuW0=;
        b=XJ3guvilAh+2Dl3g0l3/FqjdfT6yu53HIUp2Xdbe1EwAYN6Hzv7YzlI4D5WgzIrbiz
         r7ieVNwJMJ2d7yxs8vBI4IHvVrE/rP/bfQNvSKeWApxRr8MZm3iUxCiQxmNnGh2HflcO
         GZArv0+JPZXaoILLp7OkSR/OOBTd/yxGWK7cckqVHJ6dw5ZY9bn9vdwfB55mQx3Tlfc1
         FMREFqa0Ev5U6qz5ptID+/V8WKS9ai6b+snX4/x6yPq5bCh+zm8fZ1p2oSAZXW9/BrMy
         QrqU1zO9Ak15o4pBsgGtsI6zbRVT7fDFnIx4LlFyo8ej/MY9pPf+Crtdl+D1gb+Om8Nz
         bH+Q==
X-Forwarded-Encrypted: i=1; AHgh+RpqK+f3IorACFToVH+hFq13tCaQRobeDM3YKyr2Qqcp1MvIfVZA0E0hqL0KlIjv+95Z8xUgKTkB9OW4cNpHrhQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxKbMxjC5nfV+rLHyeSjRbFolnFKdodSmKHq+NU+tFdAma4cn4E
	lXVdfAeZv6rr4dJw5sVCapGOA5IN/EoOXqgxNd89Cw0sAkG/YVid1unz86TECjSxWHFSQR0gdyI
	W+UEXqx3g8kCKr5SrlbIHs5X322ZPEbwH0VkPeXZodzfqsF4qw/JrVHs+bmyRUBjMXN8tVQ==
X-Gm-Gg: AfdE7cnntFHn9YJXkvpbzZeVx05NpJMBa7Zx5C6Ap5+0yrWJLwUaVrjt+wfECpcslnM
	84tJXuzduvgd1Q1n+EQ3p+7zcM5PWu7/2Sb0PpjnZ10xG70Oyrh2GwzED9fW3RSl37mb/Nu1QrC
	yXzsLcesabalkX/7BqIAi+JTMTahBR5NNmJunwJQBcrK30FAvWwaV689rDSXMfw/FLmQcU7pZpf
	yTMBjQ9AutOsN1rY9Y9Pke3dVCC8i+Ey1rVP2FzTfJJTn+BtjbB2s4xFrN3e9AqGvJQ4PxRWq2A
	HcDHbI8OX9mk2sB9fpG1dvnZmQClBFEm2rLXYxMUuvDJu19ALqnZEOh2u43xrHHqFEfAoomjNh/
	/wrHOI8C6KwLjK+M6LDSQo6Umq5SsCP1q9Llhl6pbiw==
X-Received: by 2002:a05:6a00:2187:b0:842:6849:2180 with SMTP id d2e1a72fcca58-845b3ae2581mr2805638b3a.37.1782388374805;
        Thu, 25 Jun 2026 04:52:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:2187:b0:842:6849:2180 with SMTP id d2e1a72fcca58-845b3ae2581mr2805609b3a.37.1782388374290;
        Thu, 25 Jun 2026 04:52:54 -0700 (PDT)
Received: from [10.218.33.235] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d8f2bsm4499571b3a.38.2026.06.25.04.52.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 04:52:53 -0700 (PDT)
Message-ID: <e0ee78e4-8001-4c7d-9284-9daf1c6bd3a2@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 17:22:47 +0530
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Subject: Re: [PATCH v11 6/7] power: reset: add PSCR NVMEM Driver for Recording
 Power State Change Reasons
To: Oleksij Rempel <o.rempel@pengutronix.de>,
        Sebastian Reichel <sre@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-pm@vger.kernel.org,
        =?UTF-8?Q?S=C3=B8ren_Andersen?= <san@skov.dk>,
        Guenter Roeck <groeck@chromium.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        chrome-platform@lists.linux.dev, umang.chheda@oss.qualcomm.com
References: <20250618120255.3141862-1-o.rempel@pengutronix.de>
 <20250618120255.3141862-7-o.rempel@pengutronix.de>
Content-Language: en-US
In-Reply-To: <20250618120255.3141862-7-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DqBmPm/+ c=1 sm=1 tr=0 ts=6a3d1697 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=PAdduzmm4c7iO6b64JwA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwMSBTYWx0ZWRfXz63h1jLzwMvL
 QTWySRpa/5O7PJ4GxDTCdPC+tnBQ1WuI+yPz0PaZoAHIx4RycoAxBw0KjLtd+6uBr8gcJUd1WJk
 K+z1tt2nHb4QinDXkCS5OtW1jTqj2mI=
X-Proofpoint-ORIG-GUID: gb52mNra2CiNBLUOiA0QvPeXRfD7v0Ti
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwMSBTYWx0ZWRfXxjv47AOw+yLh
 qVscrsQZMLa8x8Q2YmdkAzhcZIkCTTqXtTCmXkEsVDXpHtNel2sZErZLok7vk0gj67fH411Juh0
 CuIg9Z2Q4ZRKWajh/GN8N1inVouqZu71iOXy9g4E8QoQ36MQlHqz2/yvIKfNjQunS0t9VXrhvZD
 wcUSVoKvwD9g1Sh3N6T/wzDcRLQF53Xgu3G2M1cWZVnZUf4RxrqmDlLWycQqKZrFay0jh+GvMG0
 C8pjaWhTUos112372yP9Pzh6z54w/NGOF/4xUcTBRHx1bYuccSI4DBzmpPglPwHMub83uzT3moS
 GKX3eJ41vpBw19Li+TlAIn66FmT3pvJIYHvUW0yZo74KmVr/q0db39s54CtxRwVptdwL73sW8aE
 9xHS4vdCSJQ2629cFJM0l5mlwV2tr7U92zYUKlETM81t4DMfthJxcWOP9IbMcK1ji+6KRUSPBsi
 UX8vN5FsG9wdvv6pgjQ==
X-Proofpoint-GUID: gb52mNra2CiNBLUOiA0QvPeXRfD7v0Ti
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250101

Hi Oleksij,

On 18-Jun-25 5:32 PM, Oleksij Rempel wrote:
> This driver utilizes the Power State Change Reasons Recording (PSCRR)
> framework to store specific power state change information, such as
> shutdown or reboot reasons, into a designated non-volatile memory
> (NVMEM) cell.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
> changes v6:
> - rename pscr_reason to psc_reason
> changes v5:
> - avoid a build against NVMEM=m
> changes v4:
> - remove devicetree dependencies
> ---
>   drivers/power/reset/Kconfig       |  22 +++
>   drivers/power/reset/Makefile      |   1 +
>   drivers/power/reset/pscrr-nvmem.c | 254 ++++++++++++++++++++++++++++++
>   3 files changed, 277 insertions(+)
>   create mode 100644 drivers/power/reset/pscrr-nvmem.c

Tested-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>

I have tested this on Qualcomm's lemans-evk and monaco-evk platforms.

The testing was performed across the following scenarios:

Userspace sys node to set reboot parameter
- Tested the userspace node interface used to configure the reboot
   parameter confirmed that the parameter is applied correctly and
   visible post reboot by reading back the sysfs node.

Overtemperature shutdown
- Simulated fake over-temperature condition and verified that
   proper reason is being reflected in the sysfs node post reboot.

I did not observe any functional issues during testing on either of 
platforms.

Thanks for this patch - it is helpful for us as well.

Best regards,
Faruque Ansari <faruque.ansari@oss.qualcomm.com>
