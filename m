Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6EF19E96D
	for <chrome-platform@lists.linux.dev>; Mon, 16 Jun 2025 13:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080893; cv=none; b=eJruNwTnYW2Y8xmWP34D85z0px7nFFyFBl354vZlHMtn/Zjs70IhZCyrjgrFRhGjSfKrUgRdnRPCcXx1N5hwDYW6cHYUcN8TW4tkStJtT+PkPvN6j/FcnBor46fK/u2jIZRLrXLFvCaX4IqMOeuj0PQ/ARZDoKjzm25ni9DdaV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080893; c=relaxed/simple;
	bh=FMoAq8disiNRxpyZoPEjdZRccpHqtD+dH+rBSz6PpDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TOZYzXVueVbluXeeAmoHZCwJyDsPTh1lQMlufoP8+T6SdNnJ6v7Od4xQF1LshEojrdSMLcVEqAnnLGqLJOgUS7ss6Wisegs8fWF4irXMqzd1K/BiVwkia4F8bZ7x57ZEC5YaxdotRjlFreILpwO8uK/PRjKauxAd31htuZdKUCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WyEGxcsI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WyEGxcsI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8lhQB005078
	for <chrome-platform@lists.linux.dev>; Mon, 16 Jun 2025 13:34:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hV7aIlrhOYnPhaE5YGpfNg5HcLb1KNXsaP+VsHA7MAI=; b=WyEGxcsITlhYNjOc
	dq/yFfLO8UUwNsGXQF/lXCixUt7nrQQYAUihqVOX4nfcpXRfudiBAqlVcCskm2ZL
	hsp1o6KqMCLDyyvyRLmP3w7ZQxKWmwiM3pg/ndRF9446nYcYs0WzsWG9sVJF639X
	QylbWL4fUHrhsqhWRxXIdloPvCTdqBj5IraI6k2I0NsRQ1d8yQIQGFWBpZTA/Q62
	LMPCmPbiQpnwL8Gslxg20JF3sK1Mlb92OJUq4ZlJLpQ7NO0ybZJIIOtRCg5+pkuI
	OPIcm1lwfAUveLhHr5X9ImSIjzhZo1sUFQCxdQOtUFx8YR3zbGgqwcost8RbeH+Y
	laHA5g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ag230tc8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Mon, 16 Jun 2025 13:34:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5750ca8b2so686086685a.0
        for <chrome-platform@lists.linux.dev>; Mon, 16 Jun 2025 06:34:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080889; x=1750685689;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hV7aIlrhOYnPhaE5YGpfNg5HcLb1KNXsaP+VsHA7MAI=;
        b=gsl8sIxnpUjVl/+Y8tHKfyVArIl1wk97Y/fGZt6Ls+i0FF8uLD2UcZQjuxPuEFXuWv
         7pLN+Z10ZX9rJREbRAf1AMZ30oRRhHKHbGVuX6RigPQ2GX43Sh7ZOCyY5+9e7aw+9Mjk
         /+hhDuIu2vFpRBOrgrN0Eu5hK6AE6hr06deBQgPvS3UxUAzJpDDJId3pt4xCrVImWIs9
         Q/kxt6JDErSx0LyI9R2WumblDO+b7Zx67u11QK+18A8zcs4KG2n8Qwm6c/6p5UisHSAk
         kvj5WHVp3+PIJGz/rjOdAoIdOZeZcLs4S4ad4Sw8C93enPmo3FJ8RtaGanq7va9UW7zx
         sjrg==
X-Forwarded-Encrypted: i=1; AJvYcCVYbybBnPU+AiQVgGv1tMxAmCqfCI8lHfiYkK8l8LDTVVOoyYfVcdnPvJYmf7rksLdxZo7AbU0zos4hhQMvdgA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyddd8VlWHbS7KZB/QPn60qDbiKcMEVIXF9eQ+VL3gSbhAfVc/g
	AlQ3vhNvDqtkeHHh2xQuNIGE/Lccc2h8VBq2a6tGHgyFqL3VniTc076c0fSt4C8eIN/xyPCL2oB
	3h7AJz0ud497IyZzNFz8ekXML6pFYliVOCqz5mAhwe5fywvyp+bLMF21ew0aAD5jIMPPthjg=
X-Gm-Gg: ASbGnctoAmIwjSxUEmC7WGoijdVzqfZyC9MXUw6IEyNDsJekSZ32MvNjnRsZHJU1S5t
	XKPy6uQnzjCIBG8czQK0haXDRtsQ86jTPYGRUkgMNh8OwiLH1h5vW98PbxcBuZzHDxHUIm7GdMP
	ds+OBHYIUeNdNvkhf/LJRQXWoRbWQ9G64r2WiF7uJK5PVMDmM5Ym2IOmznFmX/aJ4fE7DLQW/dq
	xrjqaRZx2K1VppUFbMdoG5igWnD18eG7wd7tzRzqlLHs9DQTgM1ZnyLrqt4q0FenpzIC2Ct9GCS
	d1G48WZsUlTlvGwLeO6W0KEonOPVVKLTagISy+u0sSh/CQdJRcbEX1bZQoPxpWIZsm/AwXIaXZ7
	+FtF5lJHkaCPAUTI/k4/NSfPhZxX+qfJ5u8G/7Dt4MmsY3jSvVnICb+1GrkiQlpFDJal3FdkUS2
	4=
X-Received: by 2002:a05:620a:3199:b0:7c7:a602:66ee with SMTP id af79cd13be357-7d3c6c0844dmr1350301085a.10.1750080888580;
        Mon, 16 Jun 2025 06:34:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLTCIUcu5DAwal2m5FNrqtOq8DGSlR71nrO7McbfLy27qVYIS0Mcuos0H6+koDugco0fRfIg==
X-Received: by 2002:a05:620a:3199:b0:7c7:a602:66ee with SMTP id af79cd13be357-7d3c6c0844dmr1350296785a.10.1750080888132;
        Mon, 16 Jun 2025 06:34:48 -0700 (PDT)
Received: from ?IPV6:2001:14bb:a4:c3fb:c59f:e024:c669:a69b? (2001-14bb-a4-c3fb-c59f-e024-c669-a69b.rev.dnainternet.fi. [2001:14bb:a4:c3fb:c59f:e024:c669:a69b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b331ce2dfsm15414821fa.105.2025.06.16.06.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 06:34:47 -0700 (PDT)
Message-ID: <34cb0398-a986-48e3-a15b-7bfda6081e21@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 16:34:45 +0300
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] USB Type-C mode selection
To: Andrei Kuchynski <akuchynski@chromium.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        Jameson Thies <jthies@google.com>, Benson Leung <bleung@chromium.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <groeck@chromium.org>,
        Pooja Katiyar
 <pooja.katiyar@intel.com>,
        Badhri Jagan Sridharan <badhri@google.com>,
        RD Babiera <rdbabiera@google.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
References: <20250616133147.1835939-1-akuchynski@chromium.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250616133147.1835939-1-akuchynski@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yWHwmDtW-14GGpbt8wCi5YECHTo9Xvq5
X-Authority-Analysis: v=2.4 cv=edY9f6EH c=1 sm=1 tr=0 ts=68501d79 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=JmsPOU3ckOcHMdB6JcMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA4NSBTYWx0ZWRfX89Fnjg472Td8
 LrDx4+qccSaISBPbsTFKlqLovN1zM3BhCeT3zeUt3Z2biv7TxE2IfiyLxhIE9Ke+r0S8w09ElSj
 c9aP7sa4MWwhhH2nUMCB2jpGrRJfQ6wESbC1exHKAVonXD22a5wiEppdhLkqjRBlPg6GUieoDBR
 P3MKhM1sIxHuU8OKAwUIfwSw2d2KHKR3EpruMtEAti/802h49I75XeTW+mWAmsW2XUXOAqrBew+
 RGWti0l3Fi2dr1cgxU/T5jzUKBkkXMlpSqAqPDY0jdZ7Ro7PTgQe1XENZAS9hx5F9FekeQn5gEX
 xSWikSMtFjA0iYhMwEJgJHv9KhCsSciF9nhSgqIA0GghjkStrLqUcMM0ype2Sagl3x7ICS0x88b
 I6lDec+9Fs+mc314Hu9UxZz32xbPa5dh0M4CtRZrht6yK8h7BO5b1nqyS+AcPb2q/dgraUuw
X-Proofpoint-GUID: yWHwmDtW-14GGpbt8wCi5YECHTo9Xvq5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_06,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160085

On 16/06/2025 16:31, Andrei Kuchynski wrote:
> This patch series introduces a flexible mechanism for USB Type-C mode
> selection, enabling into USB4 mode, Thunderbolt alternate mode, or
> DisplayPort alternate mode.
> Two new sysfs attributes are exposed to provide user control over mode
> selection:
> `altmode_priorities`: Allows users to define their preferred order for
> attempting mode entry.
> `mode_selection`: Initiates an automatic mode entry process based on the
> configured priorities and reports the outcome.
> The mode selection logic attempts to enter prioritized modes sequentially.
> A mode is considered successfully negotiated only when its alternate mode
> driver explicitly reports a positive status. Alternate mode drivers are
> required to report their mode entry status (either successful or failed).
> If an alt-mode driver does not report its status within a defined timeout
> period, the system automatically proceeds to attempt entry into the next
> preferred mode.
> 
> This series was tested on a ChromeOS Brya device running kernel 6.6, and on
> an Android OS device with kernel 6.12.

Both kernels are terribly old. Please run the tests on top of linux-next 
or usb-next.

> 
> Andrei Kuchynski (10):
>    usb: typec: Add alt_mode_override field to port property
>    platform/chrome: cros_ec_typec: Set alt_mode_override flag
>    usb: typec: ucsi: Set alt_mode_override flag
>    usb: typec: Expose alternate mode priorities via sysfs
>    usb: typec: Implement automated alternate mode selection
>    Revert "usb: typec: displayport: Receive DP Status Update NAK request
>      exit dp altmode"
>    usb: typec: Report altmode entry status via callback
>    usb: typec: ucsi: displayport: Propagate DP altmode entry result
>    platform/chrome: cros_ec_typec: Propagate altmode entry result
>    platform/chrome: cros_ec_typec: Report USB4 mode entry status via
>      callback
> 
>   Documentation/ABI/testing/sysfs-class-typec  |  34 ++
>   drivers/platform/chrome/cros_ec_typec.c      |  11 +
>   drivers/platform/chrome/cros_typec_altmode.c |  32 +-
>   drivers/platform/chrome/cros_typec_altmode.h |   6 +
>   drivers/usb/typec/Makefile                   |   2 +-
>   drivers/usb/typec/altmodes/displayport.c     |  17 +-
>   drivers/usb/typec/altmodes/thunderbolt.c     |   6 +
>   drivers/usb/typec/class.c                    |  95 +++-
>   drivers/usb/typec/class.h                    |  16 +
>   drivers/usb/typec/mode_selection.c           | 505 +++++++++++++++++++
>   drivers/usb/typec/mode_selection.h           |  42 ++
>   drivers/usb/typec/ucsi/displayport.c         |   4 +-
>   drivers/usb/typec/ucsi/ucsi.c                |   2 +
>   include/linux/usb/pd_vdo.h                   |   2 +
>   include/linux/usb/typec.h                    |   1 +
>   include/linux/usb/typec_altmode.h            |  12 +
>   include/linux/usb/typec_dp.h                 |   2 +
>   include/linux/usb/typec_tbt.h                |   3 +
>   18 files changed, 775 insertions(+), 17 deletions(-)
>   create mode 100644 drivers/usb/typec/mode_selection.c
>   create mode 100644 drivers/usb/typec/mode_selection.h
> 


-- 
With best wishes
Dmitry
