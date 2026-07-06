Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4663138B7AA
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jul 2026 09:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330662; cv=none; b=Br9OCUwjNPukFOKUCi439FA6SeGtDPTCNqsRcM7QzazsUaU5pMHTWyQohPK9vsM1g/thsnGcUr8MaFPU0ibT2bfCz7xkWsHjfEE1hQV2A3ek58k7L0a4Phli1mujMkJ2ko2DG62eBVOfSmExj1h+GDWXtpShYJASmP4s3Yiw6Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330662; c=relaxed/simple;
	bh=2pB3xK88kaQ2OwiJOt+1p0rqigF97sxkklqXZ52XiMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lQz4JbZDJVrDJ7/D12LC5SUOt2iVDWS4nqOmQ5mXaTg8699B32OEK9dH3luiUXohTqvp0wXIy1dOdLkPzkg5wt0BU50V6UEF0MuRpBhAohzBshFXGjw4Z7K50EcG8AgWH4dAUoSIkQTicy+MUGtX1vzOPVCDSFgVlK/2Ifv79/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PjEtZuca; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dPANqSjj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PjEtZuca";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dPANqSjj"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666943684108150
	for <chrome-platform@lists.linux.dev>; Mon, 6 Jul 2026 09:37:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a4T8aHrk2TNFMP8btMDJqGfwbP8KJpLV7dRHZSLqCcI=; b=PjEtZucaCRTi6mcl
	yswok8GRrThyBpS/jkQMfznK6b3NUTSt8swW8GUcl1X/bFTh7kd1YO+nOBfPedgo
	1qes7uzQce6RCSqguBuThFdtHGBSC4AFER2U++MvY+7kRjabcIYXDQhrdtDOSjKc
	3SLCmNRmXBRGkxkyiIcPlvhYEKDRf4hkhpYm+dr88vxmU9+V36Twi8TA9vjFrPfI
	zDMtsh6HNoHoWYZgEGA2YVdbbt9rqWhaIeujq5/GQYnO9VRJlxuH9va6bonpagUv
	QNJqLzvMYtECCdeqgI68JnqnKduR11gfyk5DtPVebTnSi1h/Gj4VMgT4YJKFwGXv
	xbRJVA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxrjwg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Mon, 06 Jul 2026 09:37:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so15290205ad.1
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jul 2026 02:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330658; x=1783935458; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a4T8aHrk2TNFMP8btMDJqGfwbP8KJpLV7dRHZSLqCcI=;
        b=dPANqSjj9a6HcQmr11YrDLcS660HmK3iKJeGdN6OHuxkLpwOQx2wr8qOXiTbbaHaFb
         WQVAWL4hIwotXON2jaZ5I00OLzJ8rljwFMjoC7mOyqSrDRz3PwpyG3eWXiC8vuuvXvhu
         dFjZvMMf6FWGNzcOA8GhQSpWdsicPDIb9OYj7jPA5XFo0I25FA6gkwDVBRKqBcgOtFLP
         Fu7xB+11VFLmT6/+yH8OstuKcOa79PLLOKIsrnx1iuzdxv0YeJJ4dfF3Xg0dKsPR86h+
         sr+u3Egylu5rRP1eSOXBgy6bz8XIeZjjq+V2/Gh6OOpX3Uazo25sLVt8Jz+wVMpjflmd
         VzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330658; x=1783935458;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a4T8aHrk2TNFMP8btMDJqGfwbP8KJpLV7dRHZSLqCcI=;
        b=iUdMD9WmKAmzB4nz2CyILtN1iZO3QTT9vk38n+P086S+tJjXzukgGiUALb0ekmKM6L
         RERlW1fSOHB0UR0tiMgDWAd8nnu7zj9ZC+gCmCNFYTAAw11JTPFBIIQlhZfFrScLMwc+
         LVk3Wx7Nh9FQuHKFLzYFzqgbsIIstOYLCU+muBK1jFb2IibPFWJAJyWmHlwkOZx+S0JL
         MXqK5lSz1CRGz5J4MYefiseT/Zt4OWisRle+y/imM5osWVyPBgyf7siFQ8/fa4PitNn3
         vs9vbH1KHnaOFsrZKoV64y4l3egWPF7wmczZbT6jCbAZzHhMtlu6m6D9QOhROGHnv6YL
         lezw==
X-Forwarded-Encrypted: i=1; AHgh+RqWzuiSbJDI7/AQBOFxEumj/zn3daEHOL4VKMoqgdSJP41PjpTmKS9BIWW0XJ0TiOpMdssTgDaxQZKoEtXYbU4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyeYa0W8BX3Uh5Zk0G3kzAmPXwMCeNXJgFJj6EpPDtM5s/Rqnum
	DfKawfpw9DyAmoVSYW0TRosQeuPysfvkipKvYOezJEEoSK5P74eHzS6DphPSOPsILrZoINGdkPm
	lvBBq4ZbfKKUwRVcdlluzPdGVAGYakF7NciI4H1ro6RbdgBHd9SLoVyGYCILNqq7IGKJM2Q==
X-Gm-Gg: AfdE7clALkr+uwBn7l68jKONUJnqRxoyTGThcrUfeaq4KRwkZKjDV5cXkAXTUtaCuZt
	HvvH7FwAEOH4sY15G01lBjujR/ehbQ51Nn9+EVe1iMcpFawJrtiTT7QWA7v/e8YvwFWSFU+Ms3N
	kt5sZTfsQ0HGQsngEMZhLxMT09dvjHqoojBztsK/5G/0jJADthzHvpdVrI2Qw0vwYCDQ1DgJ1Vq
	It8jvBr2+1VKlkVAaNsEJA6v8v+dxKioHljdiQW1KbtG6MLpdr5H+NJNP95OF5g6aKRiC9xFELQ
	B17DvUsTnTKPpboKD2M0t+2+C8hKyWqSvt5uVY3XKOqYT6GLeIOB2yPxYf8nyBaxM7W63gFs4Fn
	14JFBzwff5T7RGmL5VHijkNcyhnouBTMxhV8FTGHFJQ==
X-Received: by 2002:a17:902:da89:b0:2cc:8ad3:423d with SMTP id d9443c01a7336-2cc8ad3485amr46920755ad.29.1783330657850;
        Mon, 06 Jul 2026 02:37:37 -0700 (PDT)
X-Received: by 2002:a17:902:da89:b0:2cc:8ad3:423d with SMTP id d9443c01a7336-2cc8ad3485amr46920355ad.29.1783330657304;
        Mon, 06 Jul 2026 02:37:37 -0700 (PDT)
Received: from [10.218.33.235] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7147244sm46960145ad.36.2026.07.06.02.37.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:37:36 -0700 (PDT)
Message-ID: <f1400208-0c47-4dc0-8b69-d3ca2b054bb4@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 15:06:56 +0530
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
 <4b5321e8-05c8-4f3f-bc22-d3776e008151@oss.qualcomm.com>
 <akXnLLl_nq2G8EGI@pengutronix.de>
Content-Language: en-US
From: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
In-Reply-To: <akXnLLl_nq2G8EGI@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oDrakrfwnE_8nnTe8ELgDRUM37G1mEVc
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4b7762 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=eap3bQE5FA6eWK0dIFoA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfX1yXJI6lmV0Uw
 TIK6Ga7MKFK9R/2asZTZg8WHN9eBP2b4INR9oZ2JFoiUy/7C4sMr4OQ7wef3bkKYwQfctLO1aiu
 AQDZWWlrwcjzJvuvPaxdk3X4OFYbdzE=
X-Proofpoint-GUID: oDrakrfwnE_8nnTe8ELgDRUM37G1mEVc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfX+c1OyQRqEGyK
 paoEujDSAFaLlMKHYXcN00uydgazSHqS98oQ02rMZTozecro6P4iGHf2xDZ86/GuPr+gI/p/6kD
 RILa+9NQ7DSntvqHWMrGv+bxNi24TiIIiKBwLuY/V+4HMhiGfqtc/MRed6zC+Iu1wRbXTVxjKmy
 UZCZ7SuzmI4+OL9278yzOqwtrXM12eHng0xDE7xyWScM/uDydPYKPG4iSzf1D2+RAF5ZgKFHAPZ
 CydrB702zClfoEYpH+VwBcjri9RPNOvWH4MIgPkjh1Tm7KzhCmbWVrDQDR9oiSwI+/mtEzFiOcK
 Uuv7Ue92SudKnV/K8nEJFFMdbNo3WQIZ8fah76lYxasDXJTBNu+k33VvTUpmaSLGrxUtz+P9OLf
 uTA1TLgNik9kkWashE8oHA3Q4KPX8D9CnyMpuolh/nW/oZ9uy7OD6bpbPOA9BF3MPIwssa6rT29
 v9J5XiMW1iiBya+hO5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060096

Hi Oleksij,

On 02-Jul-26 9:51 AM, Oleksij Rempel wrote:
> Hi Faruque,
> 
> On Wed, Jul 01, 2026 at 06:26:37PM +0530, Faruque Ansari wrote:
>> Hi Oleksij,
>>
>> On 29-Jun-26 5:11 PM, Oleksij Rempel wrote:
>>> Hi Faruque,
>> Thank You for sharing your rational behind and idea behind this framework !
>> IMO it would be better to have a single framework to represent all the
>> reboot reasons of a system and not just the reboot reasons caused because of
>> errors
>> Ex capturing reboot reasons like ota, bootloader,recovery etc ... currently
>> nvmem reboot driver does not expose a sysfs/ABI which user app can use to
>> infer reboot reason ...
>> Also, it would be extend this framework to also support firmware triggered
>> reboot reasons  ...
>> Do you have any plan to extend this framework to support userspace triggered
>> reboot reasons as well like bootloader, recovery, ota etc ?
>> And also extend the framework to support vendor specific reboot reasons
>> which can be triggered by firmware  ?
> 
> I have nothing against it. My imagination was limited only by some of
> existing problems :)
> 
>> We can co-work to extend this framework  ?
> 
> Sure. Should I put it somewhere on git, so you can try your changes
> on top of it?
> 
>> On representating nvmem cell to the framework  - if not DT what is your plan
>> to represent it ?
>>
>> How would framework discover the nvmem cell if its not DT based ?
> 
> I'll need to re-spin it and send a new version.
> 
> Are you on linux plumbers conference this year?
> 
> Best Regards,
> Oleksij

Thanks for the explanation.
Having the code available in a git tree would definitely make 
collaboration easier. If you can publish the latest version, I'll 
take a look and try a few ideas on top of it.

I'm interested to see the updated approach to nvmem cell 
representation in the next revision.

Unfortunately, I won't be attending Linux Plumbers Conference 
this year.

Thanks,
Faruque Ansari


