Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9FF3FAE09
	for <chrome-platform@lists.linux.dev>; Wed,  5 Aug 2026 09:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785922493; cv=none; b=BOo+NeCd5qSqsbpXbySZPK0Lt7HzIM0UhfqlZ2cO1YCOwt3BI6hXzDxaJ/zJm+K6O94jS6oBA5VwTqCV3khS+WbDFjNEMVpBc5wrbcMAo3lKO0jzYW89PmFp20rdq+LKIq5Bj32UI+BbW6lwIevYudLVQ4GdGqQvbDMjfx577aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785922493; c=relaxed/simple;
	bh=dV6g+gIuky6zMstwQNkcrOGQkQ/MIr5qyWCvKwM2YDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jGgp/27GpzVUzqcqWsxvh6D8ZhgKSzTJMZ6XpJDCtxLXWBMIaSdoJIb1ywyrhdAhdV7+5hFSvfGoAIBIDbfp/asxC1Hohn/utCmZ7tDskddq3nWNDFs0FOtW0Fl+Rufj+ePPV465YEKEkIXcmzGo65im68LiH9oJpuZIizUM2F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vc16W7Ib; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N1bDTK7a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vc16W7Ib";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N1bDTK7a"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758dCGQ3540144
	for <chrome-platform@lists.linux.dev>; Wed, 5 Aug 2026 09:34:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R844a+nE9SMqvOZgkc4r1dVB3L2gr8OvOjIy5HHKmno=; b=Vc16W7IbevsVQAX5
	JizULoemvZfytYummiktERpTzaARzqCR9d1yrtO3dTiHIzYwm6vexhQ3GrtT9KXC
	NiqFjs89jK0E3n7YVG4NbwTbTbplUFozR5m3L0MSLf/wLbyJv5bysncrV8ASmNlw
	990IhG55uIfDt2UaB5JUUF3Ucd6NrKXVWbkMwJVODjroKMpl20rb7kq8bnKR3ich
	Npa+rd8pWcWwORcmhokFzh/zopMYU1L/RDgL2UCg1XkkH3SDJ6cptpUwLKK80Hhb
	VgeTFm5pEwp8c0gzreY6FVEaFCig6t7VPcrXwBGW8W6dbjpp7C8o2XeiK3FFnrjn
	la/ktQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuu3uhybk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Wed, 05 Aug 2026 09:34:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cccfa32670so11411485ad.2
        for <chrome-platform@lists.linux.dev>; Wed, 05 Aug 2026 02:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785922491; x=1786527291; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R844a+nE9SMqvOZgkc4r1dVB3L2gr8OvOjIy5HHKmno=;
        b=N1bDTK7azfuct4h8uWGnUX4Ol00WsWCTMy4wn/Xs9VGaFK/Jx5ZbbpOPCakKHt2TxB
         qTDu771f/cEZa2EozV4M4gWZX0O0N+YbIhM7/LR9O701CqYEwpPZFJ2sq8jOTTSHhfGk
         +FpWd+IwzXh9hQFzuyjojiV+1csPMOfnEG16gCCvkVn/KxcmfrXCNUUaVsiuF9WEIx4u
         IEedo6icg1K5aJMdoqDWaRe3TcyMpWY7cgFXsQdx6bZN//qETNBpYVJ9Ot8+ijiNF16O
         qzZgrfPm1Rw05pzohqvjWoB0aD8ZPecdSJPk4h/bvgvaFnpyzDp7udYoBkR4YSLS1dU0
         yAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785922491; x=1786527291;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R844a+nE9SMqvOZgkc4r1dVB3L2gr8OvOjIy5HHKmno=;
        b=b0RWpTXjwu1kX4yBZkXZlm92Gvge7Zfq3IoQ82/JI6QcHXdostGQyLncQIw/mSkV5v
         e0bDcoxRZz2PrDk6Z51Wj248ELNZp5hK7yYPlf5geSg6QMhLEnc+mqNTNWs/BhzhMb7s
         FIUOBidbKJ9F8ggZystdjB8ehwUJ4OxCJ14aei+5AA7UGq+Dcq7/8laokAB5T7XAfsKe
         ODUaSHzMpOj5qvAqWp8iiwJGCus2D3GkHzicow/Bkf8Lh4PsnnhGkAVCXY77zS8VKHr0
         tWKQ+qu66dIBvguCz/3jxEW8w7brSte3N4rgN0wW2mg5yEg69wosEgd2kJC3P3iY1It6
         QyMA==
X-Forwarded-Encrypted: i=1; AHgh+RpWa01kV3R863F6HXbFDdFHM5lPRdb581r1KaSGfoKHxFiHK3ibSGlWTIMBgpvxMlmJeSvAD94B6+pMYJnLU8E=@lists.linux.dev
X-Gm-Message-State: AOJu0YzikThiO6SfPEQ2KeyGZlJstqrpSGeLR4Mkjg5Iu2CIa8Ha5xM4
	xedP5jMx4ntH31fKE4qZf9vr9zhkXyZDek6LRzZaeFg8w51547UuLHKeOkv3PYpRoFHG0QSzyXN
	FMxgCDBXukpAXrBmk8FcgWcM581TsR6ryRkdo0B5qMD3yXuBGtrB5znna/trsb/VqtR7tmg==
X-Gm-Gg: AR+sD10TfvDFBvFnd+PC5oeBWw+bsgxRTv0qPqi9g31OfZJsv8WYmDOSXNFLsx/cbO4
	OLKhNx4lZfBMUl7JGHdzHJAtJykN1Kk320nnpU+Z574KKZkFe/FVxLZ3bVQCctmaE++GjZ03iFQ
	qU9c32ZjYR7ZJZP4F5NNcHb9gDdWng27AfBtieSa1g1eZazi2PTniQM4PIC9/D6H10TfTgnlwsH
	FuTdNgQBw8nwPBcHuK8YchQi5ZKVbAGbJvSfnEFnWFDzGECgzgkDs9ctROC9pCBKg8MfTwJ8wRK
	lbK6Lwj5psOhs/FLGkFoPmLAUOlUULa67dxquRySe8CMSODC7NHatHalMlLeq4uW1z9NcHDDXzy
	COrwGmF6kDqhcqWkqBmR89yBwU+rCNJY=
X-Received: by 2002:a17:902:d48b:b0:2c9:cf62:6f61 with SMTP id d9443c01a7336-2d0ca78de48mr51423175ad.17.1785922490791;
        Wed, 05 Aug 2026 02:34:50 -0700 (PDT)
X-Received: by 2002:a17:902:d48b:b0:2c9:cf62:6f61 with SMTP id d9443c01a7336-2d0ca78de48mr51422845ad.17.1785922490288;
        Wed, 05 Aug 2026 02:34:50 -0700 (PDT)
Received: from [10.92.205.160] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0a9da7748sm16109445ad.0.2026.08.05.02.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 02:34:49 -0700 (PDT)
Message-ID: <b8813d68-dcf2-4836-acd5-4ada63c20f51@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 15:04:42 +0530
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 0/6] Introduce the Power State Change Reasons
 Recording (PSCRR) framework
To: Oleksij Rempel <o.rempel@pengutronix.de>,
        Sebastian Reichel <sre@kernel.org>, Benson Leung <bleung@chromium.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
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
        Andrew Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>,
        Francesco Valla <francesco@valla.it>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        chrome-platform@lists.linux.dev
References: <20260731095959.296056-1-o.rempel@pengutronix.de>
Content-Language: en-US
From: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
In-Reply-To: <20260731095959.296056-1-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA3NSBTYWx0ZWRfXwM12yMUN1KmB
 iVst4Dq02KL0b97g6R7WTsrAOVRULY+V3v8u5GYz1mu5LMFVeNOAEcG5MkmED9FO3slMa/kam2b
 5tZz1K9LB4XmMpBl8BdmLXAnw1BHiGY=
X-Proofpoint-GUID: y_A_4yaOOp9BojxP2gaAmFvHuSt7Wsic
X-Authority-Analysis: v=2.4 cv=B5aJFutM c=1 sm=1 tr=0 ts=6a7303bb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=M1_pdOmx35iQhsToLGUA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: y_A_4yaOOp9BojxP2gaAmFvHuSt7Wsic
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA3NSBTYWx0ZWRfXwXrLBIoHBHdV
 SZ9qb+PADWMsqu4UbBbeqDNnlTxl3o5RzQX3oz6zfJCea8aFDw/E0BwT+HRnrD9RAjdc7gmZtWU
 7KVvPhL+wMvQDeopSFsayQQ8qHM4t06UsqxXE+o+YP2Fjj6j2U712Vo3FA5H3o+dKi7xRNwqs/m
 ddLwrhwIHXu4fGpZ9NQC71PnPmV3dfF5OnKRw4kcZ/dXyFHN9iX/VdEAwffDrOAK22ssB1gtKC4
 H8/NO+KvhS3vurKpT1mzmLFntsOhFLXHvWpJGrcxUiGDZFt9A8kqWGvu+5jlSYaQ+aAMsUVzF4/
 /vSwoHI0Ooh8HS8YWN9mU8Fx+FG+/WRTmMplx4cN+MC0TBIgpSMvtEdI4PzTTZft4fxYlxZq9fi
 hJ1J5SWXWGR3b++vOOr1BQqpoVhLXTSVjdryVKd2ndM7KYAcxVq2fIXWpC4RapBBjJlxLYkhOlw
 JWR5PzVEuzDrUEKBVrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050075

Hi Oleksij,

On 31-Jul-26 3:29 PM, Oleksij Rempel wrote:
> changes v12:
> - Drop all provider drivers and their tests; post the framework alone. The
>    NVMEM-cell binding a recorder needs to pick its storage is still
>    deadlocked, and several projects already need the framework - so unblock
>    the core now and let the providers (NVMEM, PMIC, ...) follow separately.
> - Rework into a multi-provider design (per-provider /sys/kernel/pscrr/
>    directories); add reason tokens and a built-in /chosen/reset-source
>    provider.
> 

When do you plan to post the provider series (NVMEM, PMIC, etc.) 
separately to the mailing list?

Thanks
Faruque Ansari
