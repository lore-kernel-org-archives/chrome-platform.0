Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E83F45A287
	for <chrome-platform@lists.linux.dev>; Wed,  7 Oct 2026 08:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363223; cv=none; b=CgExcbuTQjNbnHwz+RNhwSrs7uJItqEGmcjHzykV50MPd9kkTDBZw3DJfNaBsL4TyI7f9Bt4fUg1AiMZU7StRngjnGcR5qdFzRPbGbPx0VrbeQ9FvJhgP/d9KYO8mVTjoXcjNVHGq5IsnE1fqJxpVwc7cDVBCgbpKEr6tLI/+2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363223; c=relaxed/simple;
	bh=WTVvgTyFxqPZ1cVRs5+G5TuhvBcCfAZuVdQtmFu7emY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mHZ1MH7/8qv6pdzCLDuF8+6o8aMvUiERjDE9axFsocHOFOYaTNQkxK37YMMpzn5fY4sk+vdAlo46M8+xmHiuUhCoFCYuyGPyjUx1WyNd+anps+LdAELwbn2BX+BPpPsn0zXoFmK9/SrGJYCUxMuplc9yO1AZoeljZvuzOId6x4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Si3LRGom; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ukheqz6P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Si3LRGom";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ukheqz6P"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jTAN3298196
	for <chrome-platform@lists.linux.dev>; Wed, 7 Oct 2026 08:53:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PzNv9rZcCmK3aNjaFhrMCv7zcIlZ12WL5Lp8BkuyCMA=; b=Si3LRGomJBkswzF4
	FEsHiLfRGE/1ARlPkJsHTW4L3Ik1E+D2u1cblV3OBFyMX81tB7ItaLEMxfOBdC08
	NMBThEXeyYJ8jhDXwtDK+Oizush4NKYyM+ngV3Jkx21fHGkSjnbfu3Pkd7LnIw1N
	QhZLpdznME4jAB8bu2cexTOk1RvCiWf6sSE1hrlfS41scJkmkkZbdcS3FNXkk8WT
	tE3cb1ijOLfmWbwjs2xQTVhO9AIo260X4eI65VK+00N08kCkt1xBPVx94RxwYeY5
	OUvutugyRpaatT1gOZq8kJJkbPk9+2Uk593e4XemgdJPw0k0YFnH2TidmxjqLJL5
	qYWK4g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5hdcrav3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Wed, 07 Oct 2026 08:53:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb98809caso534117085a.1
        for <chrome-platform@lists.linux.dev>; Wed, 07 Oct 2026 01:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791363220; x=1791968020; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PzNv9rZcCmK3aNjaFhrMCv7zcIlZ12WL5Lp8BkuyCMA=;
        b=Ukheqz6PuT1mF+j5TThyHdX+lhiKKdYPlB8+wYOAbjDKlGmvoNidwW4jyJ+sRYXHFC
         bDBk58tQ3msittdw6Zl27ZmaMnYhsia9q7Bf0JgCJjQ0ZiUSK222XSmImQy/Z8Ivhqzs
         LoDcprwnLwT5rBFtaWhYnVaAb4LND4a/w9X5LkGIfaWTCsdOgnG+S/S/TMZRgWEagZgA
         VOiwNK9V2Takjs95f1ELf2hd2l+ZyOjq/YhrQ6nI0R1S47fTY9rlWwpc+G+2DaBZH5ak
         8XquwO8hxtlgIYAqN8VuO1TKOBYIAXJTQ8h+izxnYrl87EmDMvNH2Wj2iTeR7HBUN0Oz
         +77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363220; x=1791968020;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PzNv9rZcCmK3aNjaFhrMCv7zcIlZ12WL5Lp8BkuyCMA=;
        b=D7mZALTr+NomYe2PKR4ODktfIMsk0LAC8wgUkzHesRf4WZI1LBWM0RNegyCf+xWZvW
         DqfN21sA56oZCxyZ0odvZ/1CB+dN6f4wfI9rjFLdyn3eJ9TKftKez3LYz2SPAjlTpDgO
         G8W55z45pcTBiCbd3raQMhGrLJUv9HyAwqELEHlYXF8Q+ihgGl/ynndYx22UuMLfZhIk
         mjiKMjkZuDx+esCB1gv9Bu7ICK1TXy1S9Ws/GsSRM/SWxplCToquYY/jbOjGq2izKitE
         Wj06XVDnVv22216SNoQecqylaJR6UZwdUBayFMbj3zuAsKhLsWefoNzIsI14YUiSJSRF
         wQCg==
X-Forwarded-Encrypted: i=1; AKwUvBzUCCn4p5WTfIXsPkjzXgXaRS7dnjjayKh9R4D9vHVmJOanApPWqtUvmL7LbyDQxRCwp9qigLsRDhWNkXa70f8=@lists.linux.dev
X-Gm-Message-State: AFuF++ni9NZXRIRPo27OoS5tbAWfg1hKkEn/NrfYb49bUBUdXIzTwSie
	Lmcii1wIAqpf74+4vBzwyBkMHySIWKnHZnaBVdClKyhj2Ic75h/YK0ZHnHTzD25eiCtZXNCf3Tu
	vtTAPKeeAM3MHami4isXYOHpIq11CMrFYONauaP1Pd/GddCsuDClWKcQ5V4sCM3fFE+52cBw=
X-Gm-Gg: AYBFou3t3X2oLJxKGuViLN3SKWhn/NEKOkHxZQIDhL3YLz+VyxOoaOQplaFV+6UxTQo
	cwNY6w2CWMcrOGTlYqIjGzLbcuVlQ+nZjTh/itWM3mTcwDvNUvva4H3jT37EX8ChZFoNkS6Rm3o
	a5/lzx6CoZmV/tVH62OI3RtjW7xPQ3jG15f8odsVU1jLrB4VelXJke8dR9Z68sJiP4o8EcqIfLP
	KgiQchVL9gJ9fG6gmT37oXkR5chwBjBM7FICB+FCdsVrwt/tAf05RvuSZm/VvHn52EPQkXEGglo
	wXpaceAEwg2pJ/eTb2uMHkwMKxiMv20ajCH0AfT0Q9M6Xyc5+o5Dj+GgaIUJX0s1BD+M2VwPywx
	5We+rpge6GNJRMhwz
X-Received: by 2002:a05:620a:4013:b0:93e:9809:dbf9 with SMTP id af79cd13be357-93e9b8e0532mr259043485a.76.1791363220442;
        Wed, 07 Oct 2026 01:53:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4013:b0:93e:9809:dbf9 with SMTP id af79cd13be357-93e9b8e0532mr259040285a.76.1791363219916;
        Wed, 07 Oct 2026 01:53:39 -0700 (PDT)
Received: from [10.40.4.24] ([37.168.19.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f493761sm81524535e9.2.2026.10.07.01.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 01:53:39 -0700 (PDT)
Message-ID: <37c88c2b-e500-48fb-a982-9a56540ecac4@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 10:53:25 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v16 6/6] Documentation: Add sysfs documentation for PSCRR
To: Faruque Ansari <faruque.ansari@oss.qualcomm.com>,
        Sebastian Reichel <sre@kernel.org>, Benson Leung <bleung@chromium.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        Guenter Roeck <groeck@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        avaneesh.dwivedi@oss.qualcomm.com,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>
References: <20261007-pscrr-framework-v16-0-3642c277bebb@oss.qualcomm.com>
 <20261007-pscrr-framework-v16-6-3642c277bebb@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20261007-pscrr-framework-v16-6-3642c277bebb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bfWClQA1fexiXUpxg6aWxZGPabOV4l7o
X-Authority-Analysis: v=2.4 cv=aKFlOr9m c=1 sm=1 tr=0 ts=6ac60895 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=YKLnzF1Vlz+PFNxJOoRadg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=IOfPLNtac2teg-F3z00A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX+/apBwdn7VnR
 xRzc+xR73rmjibZ1T/AzG5A+KW+hfO1ToTHVMF/pM73g3FU6vOOCwOwMLEs5oT/WHPEvgC63aYQ
 UzX/ueqn+pnM/8GZxgejZWgSGfyteIU=
X-Proofpoint-ORIG-GUID: bfWClQA1fexiXUpxg6aWxZGPabOV4l7o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfXy+IRpktgKm72
 Da23u9osMOxF2TVpO3rX4Ehe3YwpLSsa+MN9IqI6dv3uaxDaEmp2hzhC14UHCDDCCtuXyTTNKrt
 7revtVdcEUqaXP/NJq1OV09FdPWVxsLyE22ZvNEFSA6OQPsROH8ivliW9oz7jjxvtN+K4h7CIxq
 prRy9nytzaEKzEj69Y2GLih1gKFGnkwoVctu+Greai81YYDV28RJ+PDKE6DX/MZFiRwSpt+CHmQ
 7xhBFsVYqn1xjw4VUss8M4+j6aXUPfbdCmf3Q5152QYXmCEZB1Yx+Z9IVjhZtUirvMwMTmEOKOk
 gmW4IsjyAvpQCWCjuMwv+/0CqFjY67odVcFLts9QdsVyWD1yDfUTjT1rRyXwkqtjamGQ42rG9+J
 b2rleMWvXW00LrCYG7BDFIFW0Ztgu8FBCcp6kX46G7rN8zoiRNSQYfe/vp4k8AHRqv8gbrssixY
 7eQsJ2LobtplGVT3YuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

On 10/7/26 09:06, Faruque Ansari wrote:
> Document the Power State Change Reasons Recording (PSCRR) sysfs interface
> under /sys/kernel/pscrr/: the per-provider directories and their name,
> device, reason, caps, supported_reasons and record_policy attributes,
> including the stable reason token values.
> 
> Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> 
> Changes v15:
> - Add Reviewed-by tags from Matti Vaittinen.
> changes v12:
> - rewrite for the per-provider interface (providerN/ directories with
>    caps, supported_reasons and record_policy)
> - rename the file to sysfs-kernel-pscrr to match the sysfs path
> - refresh KernelVersion/Date
> - drop Reviewed-by: Matti Vaittinen; the documentation was rewritten
> changes v8:
> - simplify and clarify example sysfs value comments
> - add note that not all values are meaningful on every system
> changes v7:
> - document expected values
> ---
Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
