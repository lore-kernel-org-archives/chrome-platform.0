Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8716635DA48
	for <chrome-platform@lists.linux.dev>; Wed, 22 Apr 2026 15:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776872621; cv=none; b=nc9c5P+s+aK9OeNLEpXHcNyd709/MzPg43TRFuzXKHuaMZsxn9A0oBwSjTew9jY8QP9BamkJ3EH4rK7EDYwfbvORe5bgjh8Bb7J2otOD6uYhuGeP9BEJGJb8q07VlXzxZykQyjO4bSmFBrQrQOSUycSClq/Iqw8J8LoDtJ43kc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776872621; c=relaxed/simple;
	bh=Ax2QjoBCSP8zytbND0WCxmDoUuiovB4Ezv0zg39ipV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dfBcXt5zAIwht7iuB+p8yW70FXai8dTfoNTBRidnaDjZmHi7cNfx/5TKcH4uBmteZuvwp5hnjBqOQXRfn1RZw9tWVuaXNNNvwRdfzMYwMNlxHNlGHP3MkROJw1k4qAQyvutoIj6rZsvuP6JKXzKz2Nalv6o/N9o6CLz/nv67Jrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Svxg3/Wq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gYE5anvX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Svxg3/Wq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gYE5anvX"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MFfmwl3528274
	for <chrome-platform@lists.linux.dev>; Wed, 22 Apr 2026 15:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+77oBS04XiL/gsqw6a/zALDqn3hE4Tj5LuU/BpBUPZs=; b=Svxg3/Wq9+l9tUpV
	aC0N1sxiOUQ69FJ19GSuSf8FkLCTvsruvNv0jxK/p7X4+GAcYTMqc8ArpFMUnAX8
	ozk3ULHO6h6H/OEHarximX8x0qFcXPs8Wi3YS9z1tvyCCX+IoPcYfshBYAkU4IhV
	zWE9NugK2UDRW71VoM9yCjos3vZo7+/8OlwKGpY9B+wR+OHg3bR+9Hc2PAZn5n8H
	T2qI3zi1CSPUzlcWN4QQDDPINht4DL+KUzWFRhI7Fk9tYnn2hBjYR+LDz5Ppew/o
	SaJloRFK4F4zc94LWkAOqVCG0z5UB8K1mkRiCNXRlkU9K4jYbJwW5y7F5semv2Do
	hevHIw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16wr070-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Wed, 22 Apr 2026 15:43:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50da529ff48so133163141cf.3
        for <chrome-platform@lists.linux.dev>; Wed, 22 Apr 2026 08:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776872616; x=1777477416; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+77oBS04XiL/gsqw6a/zALDqn3hE4Tj5LuU/BpBUPZs=;
        b=gYE5anvXUFn1g33Y5gYEq07wo3dgIQkrQAMLHo3BSFitT2/XmpQGaktwasXSuXhvR1
         cKw0eBpHMnBFl53RukmPGr4UA7tewsVHxdmrzgtam67fsJohS19MMFrImOTaWAn64e/8
         nDWCD9lPblN+j/BsXoWZwYIQGCRdKxu9tjpe7UCRxpzIrn9MxTrj08vMMjpagjjBL8gh
         HrIdbYJA6AQ64NHE4xAhu8D1cRg9T6uDV2kU04SlrzJwi3BIBxLR9pTR3PChu1C4ZbWP
         XvXTQ0pv5qN6Zwj3wOaOhMEKnDgDcrQh6Be8OKcR++DVosDdicAcKHIiQlneY9ML8MPh
         4jaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776872616; x=1777477416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+77oBS04XiL/gsqw6a/zALDqn3hE4Tj5LuU/BpBUPZs=;
        b=Qu21U61ckHtPRrYwMTZVM7DWPzlR1Hlt3iC65G7iBQaiacVtBwTcB2yEkkQ1Tvjd4p
         QCo4CPAhg3mwY1mhG6a5IPqZYr7Z8s11YFhHIdclGoC5zCnNfUQkJI72FxdgbDyJ+EcY
         e6OJQohfO+sTsAzeC0J043zZ9/F1GHZNBCM6vKIGzcOECO0rICtDKUD2wnVaCry2ipTh
         M9qjq2EhrFWX2EuRqge9CQmfyULlmG6yV6uvRwM7Oz5v/VHrJsLzfe63Ytayfq64ZpTg
         TTDQ9T46geIDBSl7l5yb/s/s7cxHSTCfPFAHFFCpRSARIe7OhSMB4/uHWRk9ZLOxtFG1
         RfPA==
X-Forwarded-Encrypted: i=1; AFNElJ8fMFHl6TJC7Hrg4OM3pn/1r1lO1628WWIxCWskaiiA7tQGM+6HAGWuF5APLfOOOTyX2amCvpQZE7dsSpUdSEI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2CIrwkB6FNXjoEI7nYKvk6qjyuaagKWAVcVIqQYnmrAxtXe34
	Q75ATWgYtSqXSKS7kJ3lUqvt+Z8eVO/Giq1TQbkm+6Cvkpuxz3HayesDfw38tEE/j45Jqol0iiU
	Er4cB/qMAWVkRjPPQLrHR9viSevQQc4QT2y996BFD5vK5lUd8p5fJ599tb2FWCkEBbRptqis=
X-Gm-Gg: AeBDieta6ExhmskVUvtM3PNwCqlfq5kmnFFUlrOwPlhKgTZAuGf9LNSZDIeN46tpqr3
	3N4ICmcrG31WYZzW6A9HimuPBt3tR+9uTCKtPjyDVDaUQ2rurT+QBOFeXJUFNUYR+4LwfljT50r
	UZdMdr6virEh5HbVFy4b7Gc4UJRFWmlHFM6EPt1C9wS5BNw17LhOSxGKgLR662gF4qt1SDwRagK
	u47q9JgC4qV/lyhAfeuC1E56WvBK+xjcBKY8N61bCvsJ9bPrfczpm8GbOViOglrg/xKhePu/PQC
	0Mi4KFCqlO1lBHcgn2yRoQ1MioF5b6ajCP7rg9Z6XGo35YKGYGlpvPJgUdogQwmHWN882JZKKHf
	HU4PLNUq7gONpVRy8yV4FXp5zWkQuojL7dsVcH+NheDBc2XfwSSdZSsh4bBr6FKxtDBFWXASSw1
	D2xz7UIO0JAokUz4g+dfE=
X-Received: by 2002:ac8:7f55:0:b0:50e:defb:9dc2 with SMTP id d75a77b69052e-50edefba0b3mr156546311cf.27.1776872616316;
        Wed, 22 Apr 2026 08:43:36 -0700 (PDT)
X-Received: by 2002:ac8:7f55:0:b0:50e:defb:9dc2 with SMTP id d75a77b69052e-50edefba0b3mr156545681cf.27.1776872615792;
        Wed, 22 Apr 2026 08:43:35 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb78becdsm222848065e9.5.2026.04.22.08.43.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 08:43:34 -0700 (PDT)
Message-ID: <2ba6472b-4071-4576-855f-4e4e774e8375@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 17:43:32 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/14] hwmon:: Use non-OF thermal cooling device
 register function
To: Guenter Roeck <linux@roeck-us.net>, rafael@kernel.org
Cc: gaurav.kohli@oss.qualcomm.com, Zhang Rui <rui.zhang@intel.com>,
        Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Benson Leung <bleung@chromium.org>,
        =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Amit Kucheria
 <amitk@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        "open list:CHROMEOS EC HARDWARE MONITORING" <chrome-platform@lists.linux.dev>
References: <20260419182203.4083985-1-daniel.lezcano@oss.qualcomm.com>
 <20260419182203.4083985-8-daniel.lezcano@oss.qualcomm.com>
 <7e4a008b-74c9-40fa-8fff-ee4fa830e3dd@roeck-us.net>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <7e4a008b-74c9-40fa-8fff-ee4fa830e3dd@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE1MiBTYWx0ZWRfXx5GsdiCA4+sC
 YlEv2Gmg0bxXSsBLVZN6oJogA3Z3QCPDBsMo8a6hK2e7pEIBgwT/Ud4JjOEg+AB7O0OmGfMr1Uh
 L4CI3DGhVnYDJ+/H8OMWsqcWIQxIiEvVMdRzZERME0DKbDCalONPWWnI1rQd6p3xwZWUUdEWO+X
 N1F7rmPLkaiiM+w4fTP7vYrWzvo3Pfwq9i7QoXblW6PVhEy+XAGvLxy0eeux/HNSbZkyBylf/jf
 O4YNBYcuCiCJEpIBxnvGav/7BH5kx9Wre3DpuUBr6zd2nIGVSKr7/DjTXQ53LJJYEs0WajD35i0
 46Ktv3WdfcJvFznHWz9WxA+7I003cPB/kZj/7ltfBny37tw4ENu5cGNz1Wmj4dMOMPsI8UjApGk
 Fefnk0BODlpltcAM4+UwMXY8Ng/Q2xkyuHeSPS8rNI2tpwjfj4MAM7FB/KkA2ByzJ3VSrwroYSE
 eCQUH5W3e/q5MaBuDMw==
X-Authority-Analysis: v=2.4 cv=dL+WXuZb c=1 sm=1 tr=0 ts=69e8eca8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=_jlGtV7tAAAA:8 a=g8TOPbrVlzZQXTNCp-oA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-GUID: RzO6K32rCdWz-f8Ajifa0bENgTxY-BjW
X-Proofpoint-ORIG-GUID: RzO6K32rCdWz-f8Ajifa0bENgTxY-BjW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220152

On 4/22/26 13:59, Guenter Roeck wrote:
> On 4/19/26 11:21, Daniel Lezcano wrote:
>> Make HWMON drivers which are not based on device tree to use the
>> corresponding non-OF functions.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> 
> Acked-by: Guenter Roeck <linux@roeck-us.net>

Thanks for the review
