Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB834481254
	for <chrome-platform@lists.linux.dev>; Wed,  1 Jul 2026 12:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910625; cv=none; b=C4NNqzmtT3deYbRbLyjwk9GhePROyRpr+yDs013j2FSABsb4H4HM/ptdh2VMa401pJI5aimXaEVCkRqbTsfKoy9737KpodIE/kHr9FDduvY0YHAbVz+H5xKNwTy+B/2Aoa1jGeJsquZ8tyQkcU3+1YkdXdtE67v2sDNKj2vpzNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910625; c=relaxed/simple;
	bh=hdIYYpVLSeX7+svp6SZ8DMOKqflnF52FNs8KE0Y2J3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iPZFXdQ1bHyQrYMcfgqZQI5P8vsMvWM3EE7Stg+S+8ErcqND65u/lzbHjNaMmVKrqaL9EOSwuZ+NTQAqEAJiwSLml6Hq3EYIsa2VGMSV8gFLs14lLyaJotC0iKjbb7Rr1qGDtpX/D4kMMLOIDd4+s+jJSDI+2oploVQ8oCDqv6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c/U6gq8j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DYPCprUH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c/U6gq8j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DYPCprUH"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8Tpp761481
	for <chrome-platform@lists.linux.dev>; Wed, 1 Jul 2026 12:57:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/OJQwxG66eoPwHB57XhMgHYByUU3ZhNy+b3VmI0FVH8=; b=c/U6gq8jxAU41MoF
	i+4cbo86vaXqtO4VTz1j3LuCB1CaF6b8u11rAv0ejfm3CEcoG8oiF82NruPVi8Fq
	DIAQVh9FDqSM/DXuXfvxSEIKEzBYwKNfF9YINoyW66dMhaLi8VNOoKztK6UzEnvz
	RG/rxG21Zp9tlw3AHieAXbz19X64XeICHg+x/kSZQRD6WqGVNN4iF9yYEYJ+dGMU
	1FAFiUclAOUWXcmCfND52cyM6QbcStUzYXljIUHAAhZq8mSTOVUP39H/9w/DSu3P
	sX0Z+FM9R8B9S58/0QMBRcZYqouLTAqpN0/Dh79vg3SOXeE7JPK8c1WULwcHdsY0
	u8U/+w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4kgw44v1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Wed, 01 Jul 2026 12:57:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37fb51faa63so681738a91.0
        for <chrome-platform@lists.linux.dev>; Wed, 01 Jul 2026 05:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782910621; x=1783515421; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/OJQwxG66eoPwHB57XhMgHYByUU3ZhNy+b3VmI0FVH8=;
        b=DYPCprUHIyhC2zHUD4Xdov9UZWH4RukZQk8M5DB+PYHkLx57qwZ1EH/UVKpgNGKrvJ
         mjF8x7f7thwi1FXb/EQ0rDD65xj2M7RlbONWNdQu94HI3OgV9+VhXl2FbgEp5fOf3+LJ
         gyvRyQkFEwGTIm/NMQRT4SzdDz7FjYhEIA0YeTpxfcf3H3U6e+HSZq1jrNwoGcbpCuoQ
         zBJbRWsRbvtupowBHp/Moa0sOVXLpmfTVSJtRWrKdrpLDJQJnPg4rOiprKBs+gMPPH6S
         gmD8iFTobKtEMUHHAuvs0zjxaxrk7nv/U8tgBfs5uw/uzw5ReG5xCz5IAFIRQ5gt6tKI
         1zbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910621; x=1783515421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/OJQwxG66eoPwHB57XhMgHYByUU3ZhNy+b3VmI0FVH8=;
        b=MTNvWTdKaBTNtcgsGthaT/We3fXII6eevqIlvHH/vx0c7lo4OsgMl0bsm0JF+93fP7
         ISufBycVvUNm6v6hdOKUMRujVh9obgiLkfFqpLGJb5ir16qZYD8xNss37ca2JO6u58WM
         LoSpB21MMmqoR7JJ/GsYVsRrT12CxBs/RYnBxC2Ww3jFyxlLMhf0fVvqUQkLLjo1D203
         XXT77Rx7n8122jTUfA/kU+pRzF1+JcWn4OuFi7IDCOobW3Dah5ZEll8UtspAIKrCkwDx
         qHDi0FT+VrgNKLxlrkIxHMaiYSsPX0ekvL/CC76pa0sPDVXIZMEzX/h2InVl2MLKEn+X
         zxzw==
X-Forwarded-Encrypted: i=1; AHgh+Rox3einYfmg2ZeB8eL33ag/V4GjPBS2TSRu2Wwg61oN//g92Ok561wluRjK0uVqc8NVFG6pJZNEDjCQKRatq3A=@lists.linux.dev
X-Gm-Message-State: AOJu0YwBKJawEks1ruVLh3CPK2MfPSvfBNr3DsaoeUYqEDYodz8cmLDl
	p+9gj2fZI9NKBvZFcw8puCzAUZx0uvgluhy6e1L/BXwAbsuMVgJhkSoLQ5eoubd685bLBndta5K
	MUxdh0ibcmYZ7rhXT+VSkCCIA4vl2/xBLoGJLaTqqWEI5huARJyMBkq6Ez/qLBPdthUfFSQ==
X-Gm-Gg: AfdE7cmBw1ruOfSLXa6ODXVxVn/ojMLqZ1TL+Zpsc3DKvhYjxJESY0/MkHVsDiESjuW
	6Rl4T8Bl7CS4LP6IEBd4Qh8C/29xIsIO1FQhf6/aD+H5aG1RCRscY1HG7D6tdoS5fRYcb0SWGhZ
	BKjw1IYQ4733G6Sq8qDZwF1ycrINuMyqa91FRA+HCmbGrLtpo0oVkTXCkEjPVEkB/h1o9LMaETB
	/kyLAroUqFk/QM5hV2WzfnbJiHk3JG0uZcwB51ENFt1C+NcvAjaQ+K6jg8sk5CknDS9dZMySqDB
	aTjbRG4LMkhao7PV5/5pTg+4/Dq+vtprYQLMB0i52YiDLacriMQTVKen63bT0kcrsQxeGB2DZPn
	JaJ9cRKvYjP0vRdhitnzkQ0HBqlCXLYjd2UCJoxDV
X-Received: by 2002:a17:90b:520d:b0:37e:cb9:fd7d with SMTP id 98e67ed59e1d1-3806a04dc16mr5209501a91.17.1782910621059;
        Wed, 01 Jul 2026 05:57:01 -0700 (PDT)
X-Received: by 2002:a17:90b:520d:b0:37e:cb9:fd7d with SMTP id 98e67ed59e1d1-3806a04dc16mr5209457a91.17.1782910620416;
        Wed, 01 Jul 2026 05:57:00 -0700 (PDT)
Received: from [172.20.10.3] ([106.195.73.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095d4c263sm1876770a91.3.2026.07.01.05.56.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 05:56:59 -0700 (PDT)
Message-ID: <4b5321e8-05c8-4f3f-bc22-d3776e008151@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 18:26:37 +0530
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
Content-Language: en-US
From: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
In-Reply-To: <akJaAesz35Ml3iW4@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Co2PtH4D c=1 sm=1 tr=0 ts=6a450e9d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=1uYXuS+mtKqEVW6EmjfGNQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=fA3yq6K1D-CQ7x3jqe0A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 8KDY8nRacsMcWcDpQSuuY4JIRb08K6Gc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEzNSBTYWx0ZWRfXwK7+mL3H6+LZ
 43yoyhIGo4ySaU68PRPbuGi8tJY9Wg+RclofSDtb9dYJsYihP2sVCzNghFttpBdDbNag7eDF40L
 12ZsBIX3IxcT0bnM82cxaDaQXVgOdW8=
X-Proofpoint-GUID: 8KDY8nRacsMcWcDpQSuuY4JIRb08K6Gc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEzNSBTYWx0ZWRfX0cxT1SZ6sKoi
 D4qaeu9uEdPncBw4HeDzybiUxuhgVoCILAE5q4AEwpzreMIl3+wm+CEJUwDtD7raHUj68O479ax
 VSEk6hyt8nXN7fY6aT3gCOmkUTdi5oZhIrnH0igb1rm6UkgFDSMPggdiy5X/v8sd0eYym1IxkJ0
 yYjn1qmvhOadSrZgzL8LoPNimhvsWxIxrynPbzJsFP7oP2IfoE7WwFhkJSPt6/wd49JlrGd1qu8
 8oIBl8nsgDKB9sUO6Ks4vlvWodiukm3jntndRWXo9khjL819ZhiDH0h9xl5VeZtWyLWFa7p7RsH
 /3o8tW8wuSD9yL5ELLYQotTYFYwQml7w6EyskEdj33zPQwCqo1XNDig8pAQTsW3uPyE33V3dxp5
 Y08lWUj7yk33sTzz4SFRgUzdNVs/sHWs+J2WPB45Ev5ZCQHeAJWbHyXFZqkViq1AJSlwkJHZFR1
 ndsL+fa5skDLw1gljbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010135

Hi Oleksij,

On 29-Jun-26 5:11 PM, Oleksij Rempel wrote:
> Hi Faruque,
> 
> On Mon, Jun 29, 2026 at 04:44:18PM +0530, Faruque Ansari wrote:
>> On 29-Jun-26 4:40 PM, Faruque Ansari wrote:
>>> Hi Oleksij,
>>>
>>>>
>>>> Hello all,
>>>>
>>>> This patch series introduces the Power State Change Reasons Recording
>>>> (PSCRR) framework and its related components into the kernel. The PSCR
>>>> framework is designed for systems where traditional methods of storing
>>>> power state change reasons, like PMICs or watchdogs, are inadequate. It
>>>> provides a structured way to store reasons for system shutdowns and
>>>> reboots, such as under-voltage or software-triggered events, in
>>>> non-volatile hardware storage.
>>>>
>>>> These changes are critical for systems requiring detailed postmortem
>>>> analysis and where immediate power-down scenarios limit traditional
>>>> storage options. The framework also assists bootloaders and early-stage
>>>> system components in making informed recovery decisions.
>>>>
>>>>
>>>
>>> Just wanted to understand rational behind creating this new framework
>>> (PSCRR) for
>>> reboot reason recording and not considering extending the existing
>>> nvmem-reboot
>>> framework ? As, this framework already provides a way to represent nvmem
>>> cell in
>>> the DT and the driver as well can discover it. Would it be correct if
>>> nvmem-reboot
>>> driver itself is extended with the features which this framework provides ?
>>>
>>> or was there any other reason you decided to create a new framework ?
> 
> There are two main reasons:
> - nvmem-reboot - Tells the reboot target - What should system do after
>    reboot. This frameworks is collecting information - why we
>    rebooted/booted in the first place.
> - System may have more then one recorder or source of information. Non
>    of it provides full picture. This framework should provide easier
>    access to different providers. For example:
>    - SoC tells PoR
>    - PMIC tells PoR
>    - Watchdog tells nothing
>    - nvmem storage - tells under-voltage.
> 
>    All of them provide own opinion on what is happened. Evaluation or
>    prioritisation should not be done in the kernel
> 
> So far i struggled with DT, but may be i need to put it to the side for
> now to go forward?
> 
> Best Regards,
> Oleksij



Thank You for sharing your rational behind and idea behind this 
framework !
IMO it would be better to have a single framework to represent 
all the reboot reasons of a system and not just the reboot 
reasons caused because of errors
Ex capturing reboot reasons like ota, bootloader,recovery etc ... 
currently nvmem reboot driver does not expose a sysfs/ABI which 
user app can use to infer reboot reason ...
Also, it would be extend this framework to also support firmware 
triggered reboot reasons  ...
Do you have any plan to extend this framework to support 
userspace triggered reboot reasons as well like bootloader, 
recovery, ota etc ?
And also extend the framework to support vendor specific reboot 
reasons which can be triggered by firmware  ?

We can co-work to extend this framework  ?

On representating nvmem cell to the framework  - if not DT what 
is your plan to represent it ?
How would framework discover the nvmem cell if its not DT based ?

Thanks,
Faruque Ansari
