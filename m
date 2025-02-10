Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870C71F754E
	for <chrome-platform@lists.linux.dev>; Mon, 10 Feb 2025 19:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739214605; cv=none; b=JdUkkgeJkn/uStltLHlJSq9u7xdpP1+p2scxNbTDGf2wWm0W8u8BuPvnlS8k//WeTkxTJkvfmyjx30MBr6DrUpOy2wHYof+Wj7lRQukDegCBLqO1eePnb5VUkE3QmY5F+U/lK+sTbHK5EJi0kQs5fOrp6zPBVA2k2wfVE/sjCEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739214605; c=relaxed/simple;
	bh=WVIefuTmZsO3vnxnW8tGU+cfloC8eJKmUNwKMSIntII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X1RcL7ryOmOxojjzDUppQc8fNbDADiP0G/1US9nlGjTGAHwWzZWMpInMQOKrTa1nCQHbprecxMW+scc5zskqwIj3Dx0ilFJjyU1/ZuEkJJe2i3KWJxGam5PQ7ejmj490lNFBd2NcXQufpMEZ9SLunAf4v8x9jBZXyEciEjGqmnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WFRBmUVh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WFRBmUVh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AAGiVX006587
	for <chrome-platform@lists.linux.dev>; Mon, 10 Feb 2025 19:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TjMLD9p5F/cttkJ4cOStWe5w8h70dZJC5rq8uWL15pc=; b=WFRBmUVh2jI/FRuS
	0ZHdDAmBpVta3L4prC9YoNmxxm+sLFrsirDH21c0ywidsJLrVHt5PUuXTc0EGsiI
	pwrRqykVRDE1cr1I2qkMKVxh4BrPhcvaa+d9r69iTTKT3nTIXLWinuG+zRvUiaxx
	Yre+vTyiK6xi9iOc+IQledXefACiBkZ437oQTiBCItxP6rh0JYpfA5UFhZmuSCG0
	ivhp+ndHLCQYYO4UGnjOfjs8zef1T2zYThRzjQeOE9LJWLg+cm9OsRhADXCMdmUZ
	5L7G9oYb93hrVFRAxZlKBdrfD502M50nCpiL6VMEZOcYG+a+rPnuJxyRmPa0PEJU
	RFrJGw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0guwbh0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Mon, 10 Feb 2025 19:10:02 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e440e2ddfbso11674976d6.2
        for <chrome-platform@lists.linux.dev>; Mon, 10 Feb 2025 11:10:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739214601; x=1739819401;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TjMLD9p5F/cttkJ4cOStWe5w8h70dZJC5rq8uWL15pc=;
        b=ANpIt0BRScn+YNtl58kwh4dKV/OojvaWEtWXjFZna2+2Q33CJXFAR839Hg2tNfaO93
         jymja8n+ZPglIJKa11GLiMSGdk0Y0wp9n+5Swjvmiy7E02qMRF282VpR5R06pyzu8Hlg
         2+K3V9qxjgDB4jNyoGrZtXShgUAPtACUb1/DfMtMyUe/aR13P9qMf7G9bM+P+X8sSyAj
         icW0Sz8Iy0P8IjZNK+3lCb3WdL7u/U6KGRcjEXVWftDzkHXEwnSft896NEVV5A4CBB5W
         Cbbp+KVW1l3L756QS8oq4h/cy8QN4G9mvadFBu+L15P4sexlwYXghURQx9isgzRcB434
         Cz4A==
X-Forwarded-Encrypted: i=1; AJvYcCVUQtS5Z08vod4hXpta5GY9fcmMdHnmlip12T28AgnO3jwg23q3wAnwtu/L3oBUrsnLz6djmhbbWkkswu0gJt8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7/udxg+kI6rjTphk12CjJwy0x9vxv31td1Q8miwxYME9Dpm6z
	DYAcvBNjUXw2KmckDKv/Ga8YqzWlNZ11iWItK+o1o+ErslWML2TntP5GVi8CQs3FgEgfqpSaSnQ
	9qHenxHJoflDpJhiDUlS+h/jcD3TeKn7oF7ZdJ9CjaP5KIsnNqIKGP12BIjaPVqDxjWo=
X-Gm-Gg: ASbGncvdGGbJvEdf4sWZF+ux/2R2b5of+7vTA7pFuqGJpo42dOtWc2DW1XQyK6NwIUa
	LroYIOAvEsSBZTx+Pvd1i0b2PbJ89fz4obFyT/87pBGn4oObPVAqLhmC0LXDnLVLETWRYNBqP0J
	0t7NmCOC/0xZb04fvC2eaIYa3PPB5MEMpc3WrIEcYYTYvnxlbaO1MPcdTCu823o71Hmu26WmJxe
	w9OnNpOjZEPt1sEiDYJh/PnLxIGzj1wdzMsXd4VkVilBgKfZYRJ7YVwlea3+HY+QQPHbg38QouJ
	wQP6XS1timUCDbV20A7Ah2639B2h3RuvEfTmk/Tj1gvO/55xkkTf6+gkAeg=
X-Received: by 2002:a05:622a:134a:b0:471:99c5:7fe3 with SMTP id d75a77b69052e-47199c584f5mr14100331cf.13.1739214601417;
        Mon, 10 Feb 2025 11:10:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEam98rwjeVs9UefoqfCbDligsRwENEcB+iEsgJUMbLpiVYx4zPGFHlFLKn8RelVyRxUGrGHA==
X-Received: by 2002:a05:622a:134a:b0:471:99c5:7fe3 with SMTP id d75a77b69052e-47199c584f5mr14100061cf.13.1739214600903;
        Mon, 10 Feb 2025 11:10:00 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab77efe3111sm867153966b.51.2025.02.10.11.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 11:10:00 -0800 (PST)
Message-ID: <87895166-659e-475f-99bf-5791a6e1ac3b@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 20:09:57 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: chrome: Add binding for ChromeOS Pogo
 pin connector
To: Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        patches@lists.linux.dev, cros-qcom-dts-watchers@chromium.org,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Benson Leung <bleung@chromium.org>,
        devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
        Pin-yen Lin <treapking@chromium.org>
References: <20250205233016.1600517-1-swboyd@chromium.org>
 <20250205233016.1600517-2-swboyd@chromium.org>
 <74527323-31ff-4ed0-b19f-e535f26abf2b@oss.qualcomm.com>
 <CAE-0n50DXcAXQMaLtsamvxHjUrkJVBz42G6gtgKgW9Rh=qd31Q@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAE-0n50DXcAXQMaLtsamvxHjUrkJVBz42G6gtgKgW9Rh=qd31Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0SgojoIVmwwh5_rJ-NilwLeb_zEKTmi4
X-Proofpoint-GUID: 0SgojoIVmwwh5_rJ-NilwLeb_zEKTmi4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_10,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502100154

On 6.02.2025 9:43 PM, Stephen Boyd wrote:
> Quoting Konrad Dybcio (2025-02-06 03:30:50)
>> On 6.02.2025 12:30 AM, Stephen Boyd wrote:
>>> diff --git a/Documentation/devicetree/bindings/chrome/google,pogo-pin-connector.yaml b/Documentation/devicetree/bindings/chrome/google,pogo-pin-connector.yaml
>>> new file mode 100644
>>> index 000000000000..622e171b6b08
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/chrome/google,pogo-pin-connector.yaml
>>> @@ -0,0 +1,68 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/chrome/google,pogo-pin-connector.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Google Pogo Pin Connector
>>
>> This looks like a very generic piece of hw.. many boards (esp. convertibles)
>> do the same thing, with 4 or 5 pins on the bottom of the device.
> 
> Yes, connectors are basically just pins :-)
> 
>>
>> But of course hw manufacturers being hw manufacturers, many different kinds
>> of signals go through such connectors - if it's not USB then it's perhaps
>> I2C or some variation thereof
> 
> Right, and I doubt they call them "pogo".
> 
>>
>> IMO, we could perhaps add this to usb-connector.yaml as "usb-custom-connector"
>> or so
> 
> Do you have a device that could use such a generic binding? I can't
> really design something in the abstract without two or more concrete use
> cases. Coming up with something generic looks like a quagmire, because
> as you say the signals going through the pins could be anything: i2c,
> 1-wire, etc.

Right, we can't be overly generic either. FWIW I'm not standing in the way
of this patch getting merged.

Konrad

> At least this is a vendor prefixed binding, meaning a generic binding
> could supersede this one later. The risk of accepting this binding is
> low because it can be replaced by a more generic one at a later date.
> 
> I will move the file to usb/ so that it is more likely to be seen, but
> I'm hesitant to sign up to work on any sort of generic binding for USB2
> plus an extra pin used for who knows what.
