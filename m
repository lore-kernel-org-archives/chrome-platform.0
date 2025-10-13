Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F4CEEC0
	for <chrome-platform@lists.linux.dev>; Mon, 13 Oct 2025 20:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760386906; cv=none; b=LiUn3mP5pMy8Yi0P7z7rNvNfvsFeBtZJCDHnfdABE8swH0Mb56/XOF7BKtbBopQAJapTaiYFBz9I9Zz2UrQMNbBSUSafJCd1rK7ASZ14WWpYT6jZLRjfBBZ0wc64ukidXkPKkXEft50Wt9E/avwMuNb8vsVrj+TJnqnwWM9gHRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760386906; c=relaxed/simple;
	bh=OPlABqwzLaPodfRRLAnhDx6XJmnrg5s/0t49tmLODaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A0e2vE1OoTiWEmlvmhgN508nysoYN7aNqNkhyUNgGPQcSYiKcGzjmKAIavHMYUyVPzawIcS/rD6R9zz5PF1RclsrdONv1GIJWDruYqM0hDycojb9Sbb3PT3jp1BZL6VTdqk1MZeAdTkT2GvoXDsLdZxEFatOY0SqF4XhKpf43ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VS+s4O94; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VS+s4O94"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHDKNJ020990
	for <chrome-platform@lists.linux.dev>; Mon, 13 Oct 2025 20:21:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mJ4RcD6MPZiKYcvMSEcaW4l9YhL0RV3NoM0vOj+TUVE=; b=VS+s4O94kq/XbEsf
	pizSfxkl7OYxoZidEhgcwOIpSn6IMDdSA2DRlZkNTSYdl+l2qRd4wD2cHZsuWfbO
	bJYWHXExERqrXm7wXCMbCwA54zlWnS+BcGpz6MFw1WXMOVCX6hyGM4nsa9DxWT3u
	u3I97KSTRHDUaD9tlkRRx7TnEYeIc76JaNSODiGGuzRfcvVVdPEL7mT/7J3T89xr
	fDIarCSDaXNSZbZu3qL9x3+1UePFY/ThEjNMLkhtQSLAOdOQSwywI+78FXtX4AgA
	50lgEDipk3oGCw80uAUokyPlBxvg1c3cWYRdbkzm8E599XcmSfUXfcMqoJT56XuW
	tbXV3g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd8x3u4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Mon, 13 Oct 2025 20:21:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8544316ef6aso589948885a.1
        for <chrome-platform@lists.linux.dev>; Mon, 13 Oct 2025 13:21:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760386901; x=1760991701;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mJ4RcD6MPZiKYcvMSEcaW4l9YhL0RV3NoM0vOj+TUVE=;
        b=FVgj7m4MeSO++8JGIH3d1DsCjeOW7gMHO10Qgd0EQAbLPP0EHjDmP9cBrKCaPM7ZfB
         MhtVtNopOBaItk/9XYulO4mVYYeadglWnXi8ERp5KIpKRAANyPhcHqLhfxmnm1eU6qER
         jCSmJY53cLaS8/1qaoJzEDH4sGjD2CPcLkm7jJ2emfKqkPYRxCFfLINDXDwXomQh0zgp
         y+ca0jt75i98Z6JGlgx9mTkCsgVDe5D4/hu/NczzNehhzluKfpAWVEyEximMl6Vju3TL
         QT9erI+W/COBNi94SIuwIFpTw5flqe/Ga/+HRIuAGFiRD6WXgPBiBym5umYC6u90Jt+O
         TFtA==
X-Forwarded-Encrypted: i=1; AJvYcCX/g2DTVpwHieUMVKKdgFfj/d3mpKHPxnd7kWj6VbSr9C6gF5z/GBmvID6Pu71xQ7gXgbm/7rEMB50oP1bJs8I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxh3NpmP2RrnTy3y0XIhDDpLNIsnzpsiPM7M5Zasne2KtAeXhIZ
	3QtImd4DS0TUQiyzuT+Z7GnBBvvSgr++IF+qUU/UAIDzcnWlVGRRJR2iw9EfeK051v0gVmx57La
	2RPjMjdPpAchuPb0TpX4nStZ7toqUAXxrdozT2ul/g7xGtlQ7ROhsL++hsPk4zS/Q+lgi7Ig=
X-Gm-Gg: ASbGncsEL7IsBKnZmH8Dj5UTReDOXzCs+16RIdtsdIB8/TJH9DXYOPvsD25+XrRyhnp
	2iYKIV4OnEnj+vhXsVFH6+Myd14OQXY74DcD9JCXzhC3/hK8sQkyHp92kg0kjZ0lP/s2XS39Ueq
	OXtlJFspzIzkdPynMv1OWOdAfkdWLexhB6HdZCAGuWAY+KcIglxELqlvRuGPZcIiuZBnWWOUrLy
	odpQhoteGAwBs5Wso4CPC1zUx8ecUFC/1/W1uWsbZgjyRtIvwK/tW7nIL+vFFBY6BLPOVril1GK
	kqNEHyy7p1k8mT8+RrKjNkjVftnra7V313D+OelYzf2hQCAgJdXdj7Sm3OL4JXNXs1H3Ut8hE17
	48fq+MLntrzaWuJ2a4Z7K9Kqz69jmpdSsOVPVabKuG9xRB8zsO/hnVmI7SVdfP5lBlpx1/fl3LI
	2JTgx9jkK8wmdmyw==
X-Received: by 2002:a05:620a:199b:b0:80f:2813:59dc with SMTP id af79cd13be357-88351de7416mr3153449785a.3.1760386901063;
        Mon, 13 Oct 2025 13:21:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/z/7lOJkqWBEOhjCXS+YrAq8drXSpYYmNd19CD2+9J0KPLEiTcxk0vcY8yHb76CEcLaTfmg==
X-Received: by 2002:a05:620a:199b:b0:80f:2813:59dc with SMTP id af79cd13be357-88351de7416mr3153446885a.3.1760386900632;
        Mon, 13 Oct 2025 13:21:40 -0700 (PDT)
Received: from ?IPV6:2001:14bb:a3:45ca:256e:fa61:5020:8e5? (2001-14bb-a3-45ca-256e-fa61-5020-8e5.rev.dnainternet.fi. [2001:14bb:a3:45ca:256e:fa61:5020:8e5])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59092ed98d9sm3637387e87.24.2025.10.13.13.21.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 13:21:39 -0700 (PDT)
Message-ID: <c4e1cb13-1bb1-452b-8214-aaf52ae57a3f@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 23:21:38 +0300
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] usb: typec: cros_ec_ucsi: Load driver from OF and
 ACPI definitions
To: Jameson Thies <jthies@google.com>
Cc: akuchynski@chromium.org, abhishekpandit@chromium.org, krzk+dt@kernel.org,
        robh@kernel.org, bleung@chromium.org, heikki.krogerus@linux.intel.com,
        ukaszb@chromium.org, tzungbi@kernel.org, devicetree@vger.kernel.org,
        chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251009010312.2203812-1-jthies@google.com>
 <20251009010312.2203812-3-jthies@google.com>
 <alnlmxbcv3ivhh7iolfqsurhknnm2o6i6waxq7kuhmzcbeljr5@a4wy3prshu3c>
 <CAMFSARdzoZrv4oXxVAYRcZJgxdLcrTMVAVGa=D8H=9c1vZ0zKQ@mail.gmail.com>
 <fciyxaedvyqeppldl26rsy7hogoi2zks6tq6m2yu5xerfjxo3g@u6vzsiicv5ke>
 <CAMFSARc7ySH4VhGbwd+CXXC9845NUkf-RE4gKeTW8D_9zNY--g@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CAMFSARc7ySH4VhGbwd+CXXC9845NUkf-RE4gKeTW8D_9zNY--g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sNF_xHJN4V17W-wVV8MZ2eR6U4AMalom
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXxHQHJP+No0YS
 5hzAI66iow0RRW647yYn82jkodn270r5FxfEySvBz2MsMd2CrwykoSMHwavlRoJgvAMY+pP4FGg
 Oc6QSPuDjGM2IIm9Uyy77v0XXa/6/l22tbmiD0+w2hpJaA4k64hIydaeiJTaDz3bLWxIhmurpEf
 PUCjVwEXJmLdN4IyKBFSlCtgofeFH1LalZ4rsGoutPNFRy47eAx3Y4tSI5Kv+Q9omjPCwddCW4j
 iKdV164M3pF+EH/iTIfZ2Hd9cOS8u6iNXsjsRzJ1tVL1N7w8fovBVzxDq8S/jZ41MVEkEJMKm7I
 axf1y/ZBFRMcXA5bvD+Es1LVTNxUqaNFzNbvCqxg3zspbh3RxLDmSQj5YFTn+eaVXYiam1uvyTQ
 OZnUOauBRTqytRrOeHQ5PR07omo0/w==
X-Proofpoint-GUID: sNF_xHJN4V17W-wVV8MZ2eR6U4AMalom
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68ed5f56 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=oOrn3VzuZvLnv9Y8q_0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On 13/10/2025 22:49, Jameson Thies wrote:
>> IIRC, MFD devices support binding subdevices to the OF nodes. Do you
>> plan to use it? Could you possibly point out the example DTs?
> 
> I'm not planning to add this, we want to move away from using the
> cros_ec_dev mfd to load cros_ec_ucsi. On upcoming devices using
> cros_ec_ucsi will just be loaded based on ACPI/DT. Regarding example
> DTs, I'll point this out in the comment.


Ack, thanks for the explanation. It might be a good idea to add 
something similar to the commit message.


-- 
With best wishes
Dmitry
