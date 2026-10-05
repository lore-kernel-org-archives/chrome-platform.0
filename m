Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74BA455620
	for <chrome-platform@lists.linux.dev>; Mon,  5 Oct 2026 12:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203206; cv=none; b=P53V9BTquSoNv/83FdMH7XyYSAw1avJ/CyDlUJ+mW71YKfEcnD7UBvEuvBCEe7+oKFY9d/up6W1dKF5WeFtzoueacY24ZMy47skbtwqnh/y8cuCbPUH4M0GhWniWiv52Auhxv5YgwBLdpcTGJW67dD+KkHLZlGy724EyxqiyLAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203206; c=relaxed/simple;
	bh=DWqhyC/tmPKLMx1pkykGRx5DG8fgtYzZoHE+/f1kBIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EYhlOR5kfNpah25xpeTS76iruEN86VJCW3x+VHWQC43Ij2qekqGEo7ayX2uaq18LEp4FI+GrHyBv7y3TtCmbmFB+BYGVmdMizWfE9llYPmeWbqV7f5Iu5QnoH/7N2zrE/IjEgCnH9XAo1WgPkRY/hATzM2YigGtDW+rwKBbS5Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cM3WK5vQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gcp4LVAx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cM3WK5vQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gcp4LVAx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFOwD1925797
	for <chrome-platform@lists.linux.dev>; Mon, 5 Oct 2026 12:26:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0y29NJ72KUb5bWZadq5mDDroE1zzdodKPhsbmTO8YcE=; b=cM3WK5vQFupBhngF
	4PaseE+jzfQaPWuNxo9fP3m7KgaRGaX3O1CdHMy7cbSiEJJ38VxWQGgXUnMDrNA5
	7V0z2kkS+MHGO7Qxn3yvOvhChH2WZ9bbmhCF+wwEeZr1Aq84vw4Is9s78IDrP2/N
	MANmojsPccAaN33WVr8f61PMZv+vOCQPMAETHGd/WVtK+Zcba0PSE6gO+ABEVSO2
	F/q/RD5WpQXgptnvFX8RZxGPOt5Pi8/JNFs3/GDLqzXVqfiOeI4qyrCfgv+xWTKZ
	0rNvjx2aHptmxF35t6BQoyiERcMiXPLBYdnjU4NDz+/OYPw26NvOWHDqqrk+wkgP
	9Gxk5Q==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xgyt25c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Mon, 05 Oct 2026 12:26:43 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-82315dbce25so1438576a34.2
        for <chrome-platform@lists.linux.dev>; Mon, 05 Oct 2026 05:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791203203; x=1791808003; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0y29NJ72KUb5bWZadq5mDDroE1zzdodKPhsbmTO8YcE=;
        b=gcp4LVAxODUxGlu96+c2QuAceBQuWBhkIeXmhKRsaEEySES/0V6szrboBjLIsuwjKn
         59ZcAIxhrOndKAVIrd2dtL57k6++s1fWFceD/Eu34JTwJbBPvEtLrSTF4WzxQ/A25f4B
         +8TLUpJ1nL0T4IwULFbD08qu9BfhReMFJtokRM19V2kNQ+LfcP9GhSz9pxVKqrFcZQAJ
         X8jR2N4wg8hMtwplHvJmlRFfa5F/8fOmUACDEwYNVrwVBpqJAPddAyV6GOFTGb3Zxlxu
         9N1rDkpb7gNzPVAnxhpI3vwLY1AVexmFk5Gkkk5SwRsDmNPDb++BV/lbRaaRBfSZlrE4
         QAoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203203; x=1791808003;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0y29NJ72KUb5bWZadq5mDDroE1zzdodKPhsbmTO8YcE=;
        b=j1KldbXMf1wCwTmIUrSPkMTdIJMWv8blK6zHCPKa7DA2Su1kqsAamK5dVLY4PH0K1Z
         E+aMX0hhGnVJkI8Hyj0Wlnh/l+2KHgcpBhZ+a/VxFYfYGXSd2Vs40WgCfSb6GkfYFfaL
         iapIubl1f0rFRP6JvbWvaQWDboL4VgS4SzUrmPbRHpi2vyTr4P+Urao7cBT9E5zKISJA
         vJTeSi8AfiD+mrreNE9L/uBc6afRYDy6V1ufHgXD1Y568No37/nBiC3P0cDzAgMel05C
         v55MTV6lXaxP4QQidDZg36X/ts/OuGZwxyHj9h51OQMAKW4WAW1UEkKWxiMEx0nysv6/
         TB+A==
X-Forwarded-Encrypted: i=1; AKwUvBxR1330IrY5xN29Xww8mpvUGL70n8qwqQLs4717p803WENZc7GXTjomMU9waipqp4GjqVY7laEZNMzhBMB95xM=@lists.linux.dev
X-Gm-Message-State: AFuF++mn6cXHov1PON5ytbA4aAR7qVz/uIEDC0miZAgHHYafYM2an6ED
	zIT2Zx1g3beYh8fXSrw7zC72OgwNDNNJaAObjiBJQgdIHAVwcsfMpKNvp1vHu7eKo3eE4A6Vp83
	JIoT77BATxvU0YVfyHausxkjNDVwhXHz7tyUFeNusdIDC0JqwW6te0cRSKHeAXYZZJAJkmA==
X-Gm-Gg: AYBFou1ULgQ7k/LeVo9vaORDYMgZO+Qgnl7t+f3KoguKgjYyAT4ZduyyW2NYjElNKZ9
	+jA2XaVZaipKKAcz0PM6dUnzDlWFdGn8u5vMNLKjIKdkOxj5EgKHQjMbac1KqVlWe+HzzY8ImhC
	JZJaWTzlABjE2EOiJ1Gi2MKj2/nxnjWkLuEuIQxZnZ8cjpFo9UvA5jS+a/JpnV4qrJRpod2VQDy
	xNh7rSRCWzLGvxhq0u3Go4MyNydwywPpwyelBu/AYoREsZsyPck9vWxP3Ose5EtS8xxDnGS4VIo
	8M24RTh94V4iTB3Oul2aOhZUWOcDhwLm6gnpV0xPQxY+Z9rlcwmugcml7rbMlrLddod8cyzChOS
	vXmb0W22NIRXU4M3xctrjxf1ryBMh5g==
X-Received: by 2002:a9d:53c8:0:b0:822:e8ac:7d20 with SMTP id 46e09a7af769-822e8ac7d64mr6133266a34.6.1791203203070;
        Mon, 05 Oct 2026 05:26:43 -0700 (PDT)
X-Received: by 2002:a9d:53c8:0:b0:822:e8ac:7d20 with SMTP id 46e09a7af769-822e8ac7d64mr6133232a34.6.1791203202474;
        Mon, 05 Oct 2026 05:26:42 -0700 (PDT)
Received: from [10.218.33.235] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82279c7cd33sm12170590a34.14.2026.10.05.05.26.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 05:26:41 -0700 (PDT)
Message-ID: <c5b6538b-98f0-4feb-81bf-531b9d350654@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 17:56:33 +0530
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 5/6] power: reset: Introduce PSCR Recording Framework
 for Non-Volatile Storage
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Benson Leung <bleung@chromium.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        Guenter Roeck <groeck@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        avaneesh.dwivedi@oss.qualcomm.com,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Francesco Valla <francesco@valla.it>
References: <20260924-pscrr-framework-v15-0-7af87107e0d3@oss.qualcomm.com>
 <20260924-pscrr-framework-v15-5-7af87107e0d3@oss.qualcomm.com>
 <ar90GoaxTV8pjonY@mai.linaro.org>
Content-Language: en-US
From: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
In-Reply-To: <ar90GoaxTV8pjonY@mai.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Nq5CB738I1rh4s-n_D3I9rpVG6O7UG_L
X-Proofpoint-ORIG-GUID: Nq5CB738I1rh4s-n_D3I9rpVG6O7UG_L
X-Authority-Analysis: v=2.4 cv=A6b5rKWG c=1 sm=1 tr=0 ts=6ac39783 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iCmAgw2Nae9LL_8LRIEA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX9xxgYgkOVt32
 1MHiLXv4ZD8EooObjqK7fFTz4v4ZOS5+scOj4WjroRypIvc4yom53E8Kn1ac3hqYnS3wb+XTrs/
 XQzvvjV8jcFjZJPfJEy0XxVJbuk5BExAne566xY+NZdyaRT/LoeBJ1fHVYZkrss/201aizWHRCj
 xh/E7dfC6uW0pk+NBXdEfvCwR5vhHrrmztYY6CC10MbPqM92i0a2GCFLAIdB+Yw3kPD9MwN0cS2
 Yby433dreUrA5jlrtdRvUaDH2BohbwYvLGk4gpi57ho4pm0e6d04x8+VDODf2kR6fb2OAqN4L+q
 CC60b/kmbsGrf9H3nsFdJh+P9ma3nx3tTTkfr8YU6QR8Z498bHNVGdPWtog9KYBuXf4Tnwt+/2z
 8XY9SYTPsCUir4KyKBGcbVTl8kIZZ4HtjC5DYY52WX43ng4+pbjOECLS1gc7kRmZ7eHG+WlvBK3
 khe7NjTH2n5G+qWhU0Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX/FkEpHNQrD/S
 /Mq9Z1vs/TLfP/qX+cyiKAV0vYo+dJF4HeDT6iVqpmT9fAb1SP1R0sL5+cULKV0kcCMkYfvSB7h
 GT/gisvOt8EcGk20ucmqA0Xv+MQ6Sdg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050048

Hi Daniel Lezcano,

On 02-Oct-26 2:36 PM, Daniel Lezcano wrote:
> On Thu, Sep 24, 2026 at 12:38:46PM +0530, Faruque Ansari wrote:
>> Introduce the Power State Change Reasons Recording (PSCRR) framework: a
>> generic mechanism to record why the last power state change (shutdown or
>> reboot) happened - under-voltage, thermal, watchdog, software-triggered,
>> etc. - so a postmortem reason survives a reboot or an abrupt power loss.
>>
>> PSCRR is built around providers. A provider is either a hardware reason
>> source (a PMIC, SoC reset controller or watchdog exposing a reset cause)
>> or a recorder that persists the reason across a power cycle (an NVMEM or
>> RTC scratch cell). Each provider gets a directory under
>> /sys/kernel/pscrr/providerN/ exposing its name, backing device, the set
>> of observed reasons (as tokens), its capabilities, the reasons it
>> supports and - for recorders - a record policy. The reason set is
>> deliberately not collapsed to a single winning cause, since resets are
>> often multi-causal.
>>
>> Reasons are the numeric enum psc_reason values from reboot.h, shared with
>> the POWER_ON_REASON_* vocabulary, so they store compactly in small
>> battery-backed cells. The current reason (get/set_psc_reason(), set by
>> the thermal/regulator/hw_protection paths) is written to every recorder
>> from the reboot notifier.
> 
> [ ... ]
> 
>> +menuconfig PSCRR
>> +	bool "Power State Change Reasons Recording (PSCRR) Framework"
>> +	depends on POWER_RESET
>> +	help
>> +	  Enables the Power State Change Reasons Recording (PSCRR) framework.
>> +
>> +	  PSCRR records why the system last shut down or rebooted into
>> +	  non-volatile storage, so the reason survives the reset and can be
>> +	  read by the bootloader or early user space on the next boot. Reasons
>> +	  come from software (thermal or regulator hardware-protection events,
>> +	  a watchdog pretimeout, a kernel panic, a controlled reboot) or from
>> +	  hardware reset-cause registers (PMIC, SoC reset controller, watchdog).
> 
> [ ... ]
> 
>> +static int pscrr_reboot_notifier(struct notifier_block *nb,
>> +				 unsigned long action, void *unused)
>> +{
>> +	guard(mutex)(&pscrr_lock);
>> +
>> +	/*
>> +	 * A reboot, halt or power-off that reaches here with no more specific
>> +	 * reason is software-initiated by definition. Record it as such rather
>> +	 * than leaving it unattributed; a real cause set earlier (thermal,
>> +	 * under-voltage, ...) is already latched and left untouched.
>> +	 */
>> +	if (get_psc_reason() == PSCR_UNKNOWN)
>> +		set_psc_reason(PSCR_SOFTWARE);
>> +
>> +	pscrr_record_current();
>> +
>> +	return NOTIFY_DONE;
>> +}
>> +
>> +static struct notifier_block pscrr_reboot_nb = {
>> +	.notifier_call = pscrr_reboot_notifier,
>> +};
> 
> I'm worried about the mechanism. The call to set_psc_reason() sets a
> global variable and pscrr_record_current() write its value to the
> NVMEM backend.
> 
> That is done from the reboot notifier.
> 
> Is this notifier called in all cases, eg. watchdog reset or emergency
> reboot ? It sounds possible the reason is set but then the notifier is
> not called thus not written in the non-volatile medium, no ?

Ack.
Thanks for your review.

You're right. The current core series reliably records only 
orderly reboot/shutdown paths via the reboot notifier chain; 
emergency_restart() bypasses it, so the reason may be set but not 
recorded.

Panic-driven emergency reboots (e.g. sysrq-c and watchdog 
pretimeout panic) are addressed by my follow-up v3 series [1], 
which records the reset cause via panic_notifier_list before 
panic() reaches emergency_restart().

For true hardware resets (e.g. watchdog bite, brownout, or 
external reset), no Linux code executes, so software recording is 
not possible. Those cases are expected to be handled by PMIC/SoC 
reset-cause providers on the subsequent boot. The PMIC 
reset-cause provider is planned to be posted as a separate series 
once NVMEM provider support is accepted.

[1] 
https://lore.kernel.org/all/20260804-pscrr-reboot-reason-v3-0-e706dbfc7465@oss.qualcomm.com/

Thanks,
Faruque Ansari

> 
> [ ... ]

