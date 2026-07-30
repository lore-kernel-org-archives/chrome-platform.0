Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F173FF1A9
	for <chrome-platform@lists.linux.dev>; Thu, 30 Jul 2026 10:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785408391; cv=none; b=PtLOOMBtQzxN4YzjtfMwTsSV80qKCByXVcgcooFXNg9gLzymzC59GpMFvXcRkeR+VuHTM8yVbVt1OmwQbIcjUnluuW5G5Jv/h2GaSv/D+hlCwd5eZcfAtCNFY03zmTurqvErjYPXGZIuaKaWoFBJwfAjjIvXisQa9XTaCnQxEVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785408391; c=relaxed/simple;
	bh=RKUXnkn3kG+KyzbpMHUFDJz3jceHXML2hV0X48H9lh8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LD6Dgg0Uhl8JRzEB0cwcv1W7TMQJ2+2UFuBYsJ3svUUhjsMT8MfX33oXEtAUdXpthkYR/k7Ww3KsNRvD4nk1sDH0VzjmU/f1Q6JuJ9yA5svh9jcYNnXBvd67kyPfHjDKYGeIjqi+7xISIZAy3abv+JfzWVVGXIuD5EaIxz4BQfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L6Kv9q5y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fxwQ1v99; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L6Kv9q5y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fxwQ1v99"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UA2UD9735221
	for <chrome-platform@lists.linux.dev>; Thu, 30 Jul 2026 10:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dFFXcMVLSjkSWsAM8kW8KeWkJEhI6rbMU10SrXB4XOs=; b=L6Kv9q5ykWcpSpo5
	OnY+12CFJe9Gz3+/LXgjEOR+FgI8fLrggsJR1nRxg6nmx6nVqt1IwygFqEaL7Zy8
	iYtUz9zi9KL/P3uiX46R+EevD8jtOPbi+s/QyJ55PmoUWlkjO+SYSETW4Y7qqV3p
	+i9OOpW3+9S680g/GnaaZEwpw27jtmP1pWsFn+wMhIJ7oKlhtRXt9136Yz4J76Ak
	uriZNdV4B4qIWOWpP0YbWi73astqaAmNYpNQLf5Ow8qydOn6dOOj+4a0EHST1pOe
	8hzAWWcDJ1a4Hzi8KGB1qDo9s08LTiXEDLq5Y0gZR0lMi/jBszjYJ5/IqO5h5sX4
	Mg01dw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr4a2g8a1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Thu, 30 Jul 2026 10:46:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e04598adeso1776820b3a.2
        for <chrome-platform@lists.linux.dev>; Thu, 30 Jul 2026 03:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785408388; x=1786013188; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dFFXcMVLSjkSWsAM8kW8KeWkJEhI6rbMU10SrXB4XOs=;
        b=fxwQ1v99W9z7GKBMddrKS4MMs65kguG7yxKU84fAOkEcmlNMfcIpSNnOLBNajV7gm9
         Y+uF1jcFwyARDLx0ERM4/eOgOlUQFnflk2R/t+XCZo4M0cLu0ge1dTFEuwHt09f/Qb0T
         nR1Pm9KisHYldeuBroJGOVBegpzZQTQvfvVx+ZUN7L8BAW6YHKWGXGevbWg06V+UhTXq
         a4DEvpVPXNIl5vlKZ7pwW60VDxrI2HO4t44DYSqXQawFYMQ8UAp5/d2YbAqHNlyYhFVN
         WmsiCCNdAW1ibUVOqTOis1DTUe2TjI5f8PO7PcDV1PcvSAQyWgmlU8OIlX8lo7OMBKZy
         auxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785408388; x=1786013188;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dFFXcMVLSjkSWsAM8kW8KeWkJEhI6rbMU10SrXB4XOs=;
        b=URWCSzUXkajCYVbnDEAT8boi1oZGSvZ9g6AqLEeLf4vvt6Udf6+EyNYsnVGUp/l7sd
         2T09ox+MGv4hP4qW9VwW/Yd/RurIp9sySD7mVwVHwqJP5/ZJiu/GDIT2UqTqUApITfkf
         9yI0uDX/lsf44fbF5ZJHLS/X2fIbFrp3AAZZGZIz7xuAj5EDawhL8Tkh/3mdP3EzyFU2
         0KDF5HYaPrXaYfLaLzdARO+Vt9v9rDY3xalIQKn0xbRRM6GBXsG83ObiTyLnlXV3mvc1
         UHu0pA62iozbnEr2duhd7QkmXqLJhKQmqSaHeicrc60aleRpV7M/uLr/3X259NAlH2RZ
         TMew==
X-Forwarded-Encrypted: i=1; AHgh+RpEW46DvAv+4k39j9rO3Ug/ZqyTtUYo7vF/ooz0U23S2oVOwI+DuUH+xKDch1U0hgXuEsKKfTLDgt3nPInGMRg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4gXrJtnKe5xK5BtsQTq2a0WUcAZS+uz8wWheS4pqrMHaNYX7+
	nG3ZCN6ctPRcwy9cyzE82L0GcuDoY6lfFLR3AwT60YUPf2xs9nY/LxJkoXD68ANeo8r/jwxqlM0
	1qVSvvC2qU19MP1OkGFnrFpd6FPuZj5iUhJTied3saHgNBrUArJzx0JWIHbmGQiHUGukQew==
X-Gm-Gg: AR+sD10U45FUdppeOrN7W3R9KMRrCwB9stU2lA4CEQsxkbtpwuznC02mhzDeMUb12/4
	1CugkF58IDlb3dUKRdZuDvS3kEiquPBJiWfJvSRubkuONa8bQ1lj1Y9lfMxk0yixyIeEiKvRJnd
	xt8neA2uMyxgkaMy/2J5Gu5DUirV/Q/AFTWOGoiVl+4oIVzmaMYludk/I8L/nPGRDqBgkvjjhS1
	h8g1fILNMnI+weg1LGSlLLACfbo+OwDMHbLHPnju8ctgixfFWe2Bq+0ii5zUetKVKSDJzgcJwsA
	H7erB2buyXDh9pXHh38RZ2ozER830NxC2b1BQOk1WanWr6FCduaGxF317vd00JrI78PQXuExn52
	YwnIOOCraYqVnB4Y9wvfatgOmIfsex/I=
X-Received: by 2002:a05:6a00:2388:b0:84e:52d0:69cb with SMTP id d2e1a72fcca58-84ebc446e5emr2058290b3a.75.1785408388139;
        Thu, 30 Jul 2026 03:46:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:2388:b0:84e:52d0:69cb with SMTP id d2e1a72fcca58-84ebc446e5emr2058252b3a.75.1785408387575;
        Thu, 30 Jul 2026 03:46:27 -0700 (PDT)
Received: from [10.218.33.235] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea03ca2c0sm2831254b3a.60.2026.07.30.03.46.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 03:46:27 -0700 (PDT)
Message-ID: <d62dfb6a-ea99-499f-b7f4-933dc257aad9@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 16:16:18 +0530
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Subject: Re: [PATCH v11 0/7] Introduction of PSCR Framework and Related
 Components
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Sebastian Reichel <sre@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-pm@vger.kernel.org,
        =?UTF-8?Q?S=C3=B8ren_Andersen?= <san@skov.dk>,
        Guenter Roeck <groeck@chromium.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        chrome-platform@lists.linux.dev, avaneesh.dwivedi@oss.qualcomm.com,
        umang.chheda@oss.qualcomm.com, faiyaz.mohammed@oss.qualcomm.com
References: <20250618120255.3141862-1-o.rempel@pengutronix.de>
 <3309e88e-e189-42ea-b74e-346aec1b4b5f@oss.qualcomm.com>
 <729b0e26-bdbc-42f9-8245-79b2942272c2@oss.qualcomm.com>
 <akJaAesz35Ml3iW4@pengutronix.de>
 <4b5321e8-05c8-4f3f-bc22-d3776e008151@oss.qualcomm.com>
 <akXnLLl_nq2G8EGI@pengutronix.de>
 <f1400208-0c47-4dc0-8b69-d3ca2b054bb4@oss.qualcomm.com>
 <e78ac252-1631-4f8c-a0e7-e48c66c20d9c@oss.qualcomm.com>
 <amZoTd1w6okw0Rw6@pengutronix.de>
Content-Language: en-US
In-Reply-To: <amZoTd1w6okw0Rw6@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6y4rpAwwzwk-i-lpoF2xTq9_KWeR2k2G
X-Proofpoint-ORIG-GUID: 6y4rpAwwzwk-i-lpoF2xTq9_KWeR2k2G
X-Authority-Analysis: v=2.4 cv=IoIutr/g c=1 sm=1 tr=0 ts=6a6b2b85 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=NEAV23lmAAAA:8 a=HbpdUXfEe2KejOgVjCkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA4MCBTYWx0ZWRfX0CHyG1vD/I1A
 3ygfvzuilayMiE6a7cjyxkobG+Kd1zJ+698XGk467InyGMnT6WFdez0nZHBzP/93e+d6pIaDmiU
 ZO3k96Lf1IaPQz0umFoax2hUHcrrrLijxIpDOj5f1XMPUKfNMPS6p+yluoy1vaXqRiyMOTn1xH2
 LvEpC+fS+r9yHvoHVN7DDIoui+TDH3SeVIf8S1UNot6/y/0F6EViX+EwvoU1SjZyTnLmUkspZ6b
 cge0wLeuqlgeqHE0Uvd/HdjWsVaKGbztdFBMD9rfT3ieyb2qcrkCNJKiSK06Q+CucCzkdZIjY2m
 8AeeZaUZV09D9Z5T1lRHTiLWVH17S+YMRylXFGfbYgy6wyXeHdl34a2oBCd+Abg49uTM5diXJzK
 HxWREGlkXbO+6+rmoNkGpxm5BBeg8MQF4DlulMy0SClMkby3QPVC+EDYSzANSbePGJTXL7OWhPf
 cF7NKihZJaKp5xAMM7w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA4MCBTYWx0ZWRfX6RnyWwcYruAh
 Spq9f/lFXNH1nmtFJIg9K5qn1rS0ZQ09EPQ8L9SjkT6sGGtuWnmD9FB4kLB/2E7q1rU0UsO+dBO
 mFLJNxJKwCmRmAjtVG/P7ncyYkqGFq8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300080


Hi Oleksij,

On 27-Jul-26 1:34 AM, Oleksij Rempel wrote:
> Hi Faruque,
> 
> On Fri, Jul 24, 2026 at 01:17:40PM +0530, Faruque Ansari wrote:
>> Hi Oleksij,
>>>>> On representating nvmem cell to the framework  - if not DT what
>>>>> is your plan
>>>>> to represent it ?
>>>>>
>>>>> How would framework discover the nvmem cell if its not DT based ?
>>>>
>>>> I'll need to re-spin it and send a new version.
>>>>
>>>> Are you on linux plumbers conference this year?
>>>>
>>>> Best Regards,
>>>> Oleksij
>>>
>>
>> Just checking in - Do you have a rough timeline for the re-spin and posting
>> the next revision?
> 
> Hier is updated version,
> 
> I did some framework refactoring to address some of comments. There are
> sysfs interface changes:
> 
> https://github.com/olerem/linux-2.6/commits/v7.2/topic/pscr/
> 
> My plan is to send first 6 patches without drivers (if acceptable to reduce
> review overhead). Can you please test the new interfaces and give me
> some feedback.

I have validated [1] shared by you on Qualcomm monaco-evk 
platform - and it works as expected.
When is your plan to submit this new version to the mailing list?

[1] https://github.com/olerem/linux-2.6/commits/v7.2/topic/pscr/

> 
> May be, if you have some time pressure for this functionality, you can
> take over the up streaming. Otherwise i'll continue..

Once you post V12 patch series, if you are occupied with other 
activities or have limited time to spend on this framework, I can 
help drive the patch series forward - addressing the comments on 
v12 and afterwards - with your Signed-off-by and Co-developed-by 
acknowledgments. If any blockers or challenges arise, We can 
co-work and collaborate to take this framework forward.

Thanks,
Faruque
