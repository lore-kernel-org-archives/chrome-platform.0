Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B204536DA1C
	for <chrome-platform@lists.linux.dev>; Mon, 29 Jun 2026 11:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782731671; cv=none; b=BFpN+uQx2C1AfkWOJuaE2vf5sYGdVspyJuHmLPXzJ5SU6q4T95Eb/lVdsS1gbaODqgzR8ExQGRuhkd4OoIQgf9uqw/G6mr3EStl7+0LPxH5am+0zNLhiMwAfI/oEYqEYI6zYVps3n+l0t0kr+b9HkXwi5AsQCv0ZNlttYTJp4UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782731671; c=relaxed/simple;
	bh=IyGlaIDF+zmd9BM8n6VXDW71QSY7Y8ncDunVoUDd608=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=HoDh6Z89/zgevEtTeBS2bny3FkPu4h88Xa4oC9PyU6BF2Stm9SaouvyRTG/slJAVChVtaICS8kq28oXvTfuQsGNyJOpGgOecNboNLqpt8zzx9vR251N79pyBP6y4L2KgXgRFSfOzjfIvc4eMHZq04TTPujWKjkYxx80yKpiIGM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SVT1Up/1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MRGu9MyB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SVT1Up/1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MRGu9MyB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATpE42656706
	for <chrome-platform@lists.linux.dev>; Mon, 29 Jun 2026 11:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0J8jBJDIfQrD/LQpf7QzmI1m3KrBYrgkBIaVXCu4gdY=; b=SVT1Up/1L1vBgJ5i
	M45p8WIYN4fkX5bUr2lZnpK2XUASNoI2ALkqKqjnoe3pDr2YWPnSjqRupW9RAOkF
	MobCFbrsXxTQdooeubbP2xT47BhqoJ5KZRZTPJZQhBhDHsS4kLPImZF5gFxkZqIR
	8cmf2aag2Zz8v19AXGuvLSKsA+fkpWbY9pW2hIs1JQEqd3DMYxFs+rGG+XioV6yv
	1pr2QtCf9w2h5iGOOo/XLXl8idchXuttwmpk8M7qI4IJIvFWx62jnervpbdmfjdg
	TkugFjYioLagi9UM1GxvRhjDdaJgWA1RdgPK8d0tK2yRGDJMvBGSNBnIBYzDfTuB
	rhTdOQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3np7ggef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Mon, 29 Jun 2026 11:14:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37c9127e316so2152838a91.1
        for <chrome-platform@lists.linux.dev>; Mon, 29 Jun 2026 04:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782731669; x=1783336469; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0J8jBJDIfQrD/LQpf7QzmI1m3KrBYrgkBIaVXCu4gdY=;
        b=MRGu9MyBtLGbYTp9nkr8+vB7dIxLzdeu+72kKjDdys3GFZYgYxnTJ439kCJVpJevcX
         rUZXwSDHRO7m/Mtbztng/TDDwzzVlSuyU469A0lokROpGn3ZyloCfBl/isCHd2y6Uu6v
         PhmRAsCm5ev61NBEkmBea1Bq/sZ8cUM0AEvuDvcIPm/Ag+8aRk2ml4FY695ShHF/t4c+
         bjdJCn4sMaRRegI8j24mY6uazwPYYwsK40hwohK6eGVPB5uHIqh542oWHe/SRnSib1bS
         bFiQ5AZcRjbyIj9slUzGx3pTP9fcntNSgyM6w23ttUeYVKXvoPWP6A/+qv05CJx9CADL
         oQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782731669; x=1783336469;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0J8jBJDIfQrD/LQpf7QzmI1m3KrBYrgkBIaVXCu4gdY=;
        b=dgowGWk568HGgZQWxvdUI85GssAe+JCaLiRTRRRH6SVCh74HNBBgNITgW0MvBeBGH6
         v/cdO3I34kWrZUu6/drdIQSuTzpL2tmpMTuYXm6/jxTJZPTVD+2DFsmUGDJ2GTDGvi5Y
         Dtqu7qAO/px2bX3b5D1+a+DPrSyFGG7JbOMYdXSNgH+dZviCuCTa2/pNFMWEWEAS6Fn/
         yAcLp2wtNEYYN7xhnW1CTY3YWqVV9rI4H9gjeGyAmOyT2e380FafcnAZ+WEAI6O2rEnN
         XUpOm347v4S1EBuf2jZE5KFZvF3IfpoLEB7oOym6CFoUmhHGgbXw43C76wcW0xEWDN/e
         RJaw==
X-Forwarded-Encrypted: i=1; AHgh+Rrfg1D9fcO+3KgsgA2HDFYUr76QatNI5/v8hRYnG1iA9he/a918DMGOHFWF0P5pso9Dv6NC48zFDh6WgrJRT5s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4+5e7unVxxmEaWlzH1K3VjVgKg3ImpnVHV5BGW11yT9SLaUN0
	aoPTLmuINCj1OHQ9ihLsBTYb73qwTaoPHqnQjj04qHf3gFlXOUCSQxco4RZwGBkod9Rc2/Y7oqE
	v02iHCcfRo3ZIK1Jbn6q2uNNUcdsoNh9kIP4eZ0Kxzyq5PGY6NYf3GKm9Y+23I8kfHhU1MA==
X-Gm-Gg: AfdE7cmXRQVZUFUv4fDIIsLjNsKTtnCfqeqzZZgy2rXu1eIpUdzwXzs+kxLmjalCDx4
	PHX+wcY+zmEAFIdRCMSrcN5q+u05PzRnAKZz8p/mYLun+rb7N/xi/1LkxLkEFhGqJOJJBPMnzRv
	sG5GmLIxoWPXCjyuWlIxbDJ6D2Ogx3MfbLjPu3F5568L4KRNjFPNCmZrO3mPLHh+eL6grPM3IE2
	JcIYsgvucA0SLuemSyL8Tr7lzQq1sSnePZBRDJrApzzup+kJ6SvIwze6xeChbpdZfr/yBBBAXQl
	0stuVdNlDTvVB0+vvzWGT4nmZfbqTvOUrMo/T7H8LHFAOoqwNAk0O6I3jtkooj9uA//yjkTTU5A
	QVflRTus6Shthw1bUAgRvAce/H3ajJ5wlQHN5mdPlDQ==
X-Received: by 2002:a17:902:c403:b0:2c7:ef3b:e17e with SMTP id d9443c01a7336-2c7fc797f69mr144891555ad.33.1782731668652;
        Mon, 29 Jun 2026 04:14:28 -0700 (PDT)
X-Received: by 2002:a17:902:c403:b0:2c7:ef3b:e17e with SMTP id d9443c01a7336-2c7fc797f69mr144891065ad.33.1782731667977;
        Mon, 29 Jun 2026 04:14:27 -0700 (PDT)
Received: from [10.92.200.168] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c92ddca789sm55167755ad.12.2026.06.29.04.14.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 04:14:27 -0700 (PDT)
Message-ID: <729b0e26-bdbc-42f9-8245-79b2942272c2@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 16:44:18 +0530
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/7] Introduction of PSCR Framework and Related
 Components
From: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
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
        chrome-platform@lists.linux.dev, avaneesh.dwivedi@oss.qualcomm.com,
        umang.chheda@oss.qualcomm.com
References: <20250618120255.3141862-1-o.rempel@pengutronix.de>
 <3309e88e-e189-42ea-b74e-346aec1b4b5f@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3309e88e-e189-42ea-b74e-346aec1b4b5f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5MSBTYWx0ZWRfX+U8oHz4QOuSW
 NNfRf0NNwbS3K1kvq8jvoT2rX9HIH3FiuUV1RUgqJ/0fADPWcE/dyHDn64xH439KCMm45RqQGO+
 Qo1s2ADDvSGGo5P9Tcu6xx40L1FM1vFNDWb/t+Z6WR5Yow0n7Fv3kqwNyyTiJ4D8IP46Y312kEd
 WLLjm1b1R9/j2MepsjVmI2o6WAbXftsPPtjbcXY6ZNMmYBxizcLAoEClhvrGK5MuaGQ+mQuqvUx
 jAXzWo+WzbX2rewbt5xMdqfx0G/8ISh637L0nKe3rwm+p2hz4D2m5z4YAv54H1lcn2Iu+R8g8FG
 Rw60riKCXNcInds9m2tuBxvs1qfyNjAMFsQYWVHflzuUNYyh9K0s94Pti6aeUqP8HucxY+aa8Mx
 N9rz+5JGe5ouYrhgc9TJtbX2mJkbAuZkGUU9wlwaveqWSArl07QjsVZucl4uOCzjAMPdT89oshg
 yL6arcJEyqiE+DO5gVg==
X-Proofpoint-GUID: WIrCEef4JCK3hMoZO8gj_zlwuxrJ-uja
X-Proofpoint-ORIG-GUID: WIrCEef4JCK3hMoZO8gj_zlwuxrJ-uja
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5MSBTYWx0ZWRfX+A15Uu/C224r
 yEg1WUIx44qV8hPEA53qj3+6BnSF23ydNpxEnPXeFj8n8F4la4bmybeoJwkHFxaekylRIOgJAVJ
 3I59EmML7guUog1wgg1Gu2Ylf1zsJfc=
X-Authority-Analysis: v=2.4 cv=OcWoyBTY c=1 sm=1 tr=0 ts=6a425395 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKVNV-Xjcw2sXtYmnfQA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290091



On 29-Jun-26 4:40 PM, Faruque Ansari wrote:
> Hi Oleksij,
> 
>>
>> Hello all,
>>
>> This patch series introduces the Power State Change Reasons Recording
>> (PSCRR) framework and its related components into the kernel. The PSCR
>> framework is designed for systems where traditional methods of storing
>> power state change reasons, like PMICs or watchdogs, are inadequate. It
>> provides a structured way to store reasons for system shutdowns and
>> reboots, such as under-voltage or software-triggered events, in
>> non-volatile hardware storage.
>>
>> These changes are critical for systems requiring detailed postmortem
>> analysis and where immediate power-down scenarios limit traditional
>> storage options. The framework also assists bootloaders and early-stage
>> system components in making informed recovery decisions.
>>
>>
> 
> Just wanted to understand rational behind creating this new framework 
> (PSCRR) for
> reboot reason recording and not considering extending the existing 
> nvmem-reboot
> framework ? As, this framework already provides a way to represent nvmem 
> cell in
> the DT and the driver as well can discover it. Would it be correct if 
> nvmem-reboot
> driver itself is extended with the features which this framework provides ?
> 
> or was there any other reason you decided to create a new framework ?
> 
> Thanks,
> Faruque

