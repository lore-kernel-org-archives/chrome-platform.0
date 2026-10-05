Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7699F2BDC28
	for <chrome-platform@lists.linux.dev>; Mon,  5 Oct 2026 12:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203242; cv=none; b=CWh1qj4hp5giC7JbggbWAA3t5Ut1nfO7PiPM2Hn4uaxg+ndH28hdCQ/88jcoHhEXg+6omiwgGCAf1UrxASGe1HuJ5yPbVdt4/GGKvkp4AyrjjykQOwhQadTdKY5/iwyiPrym64JfOfCHbnPy1nuYe/yqrPbS4wAlJCptADApeso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203242; c=relaxed/simple;
	bh=HM7xWW72inL8pVXjHxjEBpKztV5Tkb4GWN6CBp2ZAo4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hdLCmGMpFkv1h/IuqCApEx5cn6P3KNjeksl1pEMuoyDsoTxw6TT890o1r2zO9amLDCfuEMDzVzMeKzChprfyoVkmih6t5vDiiJn9ognnYTLPbqNlfbbHIpKhrxJW36aqSQPmAZ3HK74s8lAQf+TfKbM/GYEaAbwNTyF7fkkXV68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HjWl7pS1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OTHLwUOw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HjWl7pS1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OTHLwUOw"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFfxa1726974
	for <chrome-platform@lists.linux.dev>; Mon, 5 Oct 2026 12:27:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ku1JxzIA5L2qSeOtjta51eOG7KEMsweqrxxJaRm5ZmM=; b=HjWl7pS1l/rXQ5fC
	iBy57nsVs+CQ6C+sC+fjd0uEl54MLMqHzIKkx1wI4Gzsan4QUJYEgR/5GH0RWkUI
	FvqLEOCvkW3/ZIumt362q+uWEcHNHurQ+O1fHBkk4cRevEv/7eFrKWDQtxV1uJSq
	hNk8JG5/1pFdea4OBIJ2ksRtMErB4VCsCSXEzWxQzvO0cjDub7GnbXC93VRpvnvl
	t424W32a8IuNIp+9LZkGCCBN5GuI2c9aO7SyxhteBJVlxQ94xjM+OzL5bDVHWWZK
	mwGWCP0dZYDgIbLDjTCXUH1oS6vBNvBilnk47h6cKCpa6Xhtfy+Hlop7qPHjAfGj
	Vm36Ug==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xhs20rw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Mon, 05 Oct 2026 12:27:20 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-466d41a1d9aso2157004fac.0
        for <chrome-platform@lists.linux.dev>; Mon, 05 Oct 2026 05:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791203240; x=1791808040; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ku1JxzIA5L2qSeOtjta51eOG7KEMsweqrxxJaRm5ZmM=;
        b=OTHLwUOwCdnjwHKOcVENPbheVb11uJsM1gPKYclKidyJD/MUJywGaJyKK+BuHvmrRV
         kmYtloHzsPdAmV6Nn7hmBZKE1kbdQD6ANc76JMqzwoXZ4svlAALYRBa4tRErhsN4lMTS
         tL1He0Ft8TAs+Lzb2T7kadp20nT6cv6tr1zMQ8gu2o1Y6ylCoo1D2kvUhxbLigQN1zuH
         MkQvpNPGG4KyrWH6DuuCKQux8OIVs5RZ4n8g0hFGE65kTX9snjMTZ+W2W+Ng3kqrWGvF
         IkFpEderyxHOjTRqLLTEaHtkkK4T3jB/bO7mUT85hAH6N1LlMRs4c/L5G/Rl6cf0mOYD
         FWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203240; x=1791808040;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ku1JxzIA5L2qSeOtjta51eOG7KEMsweqrxxJaRm5ZmM=;
        b=1pyzG2+7qZsnhYHwd7uYgKivV4fnztw7E8h66eTaQd3kuetoPQ5kXj0Jr3cVEu7kPI
         HaorExliPjwRbJrQV08lkni5fmovzxFvd26t7y8c2cx0DeFRMjCrGs1EuEjpdDieoaQo
         DjkOFMd9ieUkwj/Q8NzXzVngICJACQE4jkdWqmlTSnHkBp6azfNlk6uVwLB4aF10Nxuc
         vdkvwLhx87N7QQdyyS4fGiDkop69cx8bj3xpR84BDUDN7esk9SYfzMgmv2I50KEqEZlP
         ivZ2WzE8zAHC2cAhP4IL2+nuP5wmEI8iNDmiqc98VZ+vNwlQKSD22hCVx5yaIqs1+1Ld
         XOxw==
X-Forwarded-Encrypted: i=1; AKwUvBzvEnUUTDsxTaMoySbxloILBv03rDyMpjDE/cqyk/RXsmFaPDx8c2DO84m5iDFC6v0dljS5Oa6TRpNy4+WcUF8=@lists.linux.dev
X-Gm-Message-State: AFq9FYJNHFkvhmD6XbRUkuDawFLFUA5I5ZnKNL+Be8wLiUe0vs4kQjK2
	nDPvVzoknuNjTfF/RjWEfEHqt8t3RCgHdBzBC/zd6oNpKMh59nZzhi+9DCycRw1F1s5B/TmGtah
	XPmY48UKRsV0dZWQWjw2QP4tPl+4XqLRUsLxnhPfepLG79rFQ3urWidTb5l0mgIyX2Zs6rg==
X-Gm-Gg: AYBFou3eTarAX14ZmONyJ30m5wOwttF17N8eRkiIDMO4mld8LLWLxJpxj56eWyvuNEm
	99RDLXz3PgSTzkYzOJH9jfhHTmc+66cT5YxZjwchAS/1He+i3gWWSCquAz+QCmRdcuphsJymcfO
	HDjOM9C9QlFtA6gwyUgthKD+uJExjI9cGsY5j/FE2C67EyiipENWd3xCadOS3y41gBYx7wFPips
	CHxbme616cQQ1U/Rv/GrQpbCogC3UGXqvk5oqljUioctBy8GKWXKc8IREspB5r+wJpOznubwGIf
	851qHng0GRvkw3JduwAvEPPHvOyUj3PMVX1xk3R9g8flLfStA+Lkhf0pwHrkGJJcmq/JjrngJkd
	TqjV0GihFJduzYBokMl700W0fH30bLA==
X-Received: by 2002:a05:6870:8262:b0:48f:e363:5cc6 with SMTP id 586e51a60fabf-49e1600a4cdmr8908537fac.52.1791203239719;
        Mon, 05 Oct 2026 05:27:19 -0700 (PDT)
X-Received: by 2002:a05:6870:8262:b0:48f:e363:5cc6 with SMTP id 586e51a60fabf-49e1600a4cdmr8908496fac.52.1791203239158;
        Mon, 05 Oct 2026 05:27:19 -0700 (PDT)
Received: from [10.218.33.235] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49e16a4ecacsm9110158fac.1.2026.10.05.05.27.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 05:27:18 -0700 (PDT)
Message-ID: <e4ff494b-0321-4d63-b648-1b26f42be2b3@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 17:57:10 +0530
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Subject: Re: [PATCH v14 2/6] reboot: hw_protection_trigger: use standardized
 numeric shutdown/reboot reasons instead of strings
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
        Umang Chheda <umang.chheda@oss.qualcomm.com>
References: <20260921-pscrr-framework-v14-0-a16290003b7c@oss.qualcomm.com>
 <20260921-pscrr-framework-v14-2-a16290003b7c@oss.qualcomm.com>
 <ar9e9-xnxO8rbJk0@mai.linaro.org>
Content-Language: en-US
In-Reply-To: <ar9e9-xnxO8rbJk0@mai.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Pfp8Bo-pyvHA3sz-IY-8a1UfKWnYwk7G
X-Proofpoint-GUID: Pfp8Bo-pyvHA3sz-IY-8a1UfKWnYwk7G
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfXyEOujCe954XT
 LWte+Jk+fdMGeql1n7zs48lUDmAihSg1EeTDZmMiLHO4Xn9vuzFabX6nKS3+xBqN4gm+BK8MPWX
 eOfvDKWAFYiEQkH/ju6/Rq6hUBmuYiY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX9mr6m1K7YxqE
 ppoEkEHY3KXQooJMaTMrlPF8XpOUIipwb6k2jvU0Des7ga0fCZFgGyzuNVFtXHe7BU0fq0IzovX
 7s5iyllRhp3dbojyfHM7naaIIgYsr2aj0r0Gko3Fh4xA8Y+4mAq93zYb6g1wUe/gpn2CXeDY9T6
 NWLi5H2wST8AwCt7xRw5R/e+LLh9It9YY3CnABKLZULKj4ec5gaLp+v6c5S7x9qjojwe3zRxyVl
 lDS4/kFtZhI0Wca/DITSuCoikCXdC4V2lIrM7G4vW1FBwd9NbPmWrjy2AM03/xnlWsBfDl3MwvP
 OUDjcrxdYD2nfuAEZel5LjP5UVVj9gOkmJ+28w5XMpBSMuBdgrjGBJtjP7dDGmP3LPwSb3gHGzu
 2rIMLFgHLnDjM5aKxlv2WhEfQ6mFWEOr7h/H+3eP3JOs0YG16dvws6pNQ9cOeJUEAQNQm3GajnF
 aEC/zc5pHWlC/TtcIlw==
X-Authority-Analysis: v=2.4 cv=Q6tHcI2a c=1 sm=1 tr=0 ts=6ac397a8 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=djRMLSAIY_qdro3gjIQA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050048

Hi Daniel Lezcano,

On 02-Oct-26 1:17 PM, Daniel Lezcano wrote:
> On Mon, Sep 21, 2026 at 11:14:17PM +0530, Faruque Ansari wrote:
> 
> [ ... ]
> 
>> +/**
>> + * enum psc_reason - Enumerates reasons for power state changes.
>> + *
>> + * This enum defines various reasons why a system might transition into a
>> + * shutdown, reboot, or kexec state. While originally intended for hardware
>> + * protection events, `psc_reason` can be extended to track other system
>> + * transitions, such as controlled reboots triggered by software or
>> + * maintenance operations.
>> + *
>> + * The values in this enumeration provide structured and standardized
>> + * identifiers that replace free-form string descriptions. They are designed
>> + * to be stored efficiently, making them suitable for use in environments
>> + * with limited storage, such as battery-backed RTC registers, non-volatile
>> + * memory, or bootloader communication mechanisms.
>> + *
>> + * Importantly, the order of these values **must remain stable**, as
>> + * bootloaders, user-space tools, or post-mortem investigation utilities
>> + * may rely on their numerical representation for consistent behavior.
>> + *
>> + * @PSCR_UNKNOWN: Unknown or unspecified reason for the power state change.
>> + *	This value serves as a default when no explicit cause is recorded.
>> + *
>> + * @PSCR_UNDER_VOLTAGE: Shutdown or reboot triggered due to supply voltage
>> + *      dropping below a safe threshold. This helps prevent instability or
>> + *      corruption caused by insufficient power.
>> + *
>> + * @PSCR_OVER_CURRENT: System shutdown or reboot due to excessive current draw,
>> + *      which may indicate a short circuit, an overloaded power rail, or other
>> + *      hardware faults requiring immediate action.
>> + *
>> + * @PSCR_REGULATOR_FAILURE: A critical failure in a voltage regulator, causing
>> + *      improper power delivery. This may be due to internal component failure,
>> + *      transient conditions, or external load issues requiring mitigation.
>> + *
>> + * @PSCR_OVER_TEMPERATURE: System shutdown or reboot due to excessive thermal
>> + *	conditions. This attempts to prevent hardware damage when temperature
>> + *	sensors detect unsafe levels, often impacting CPUs, GPUs, or power
>> + *	components.
>> + *
>> + * @PSCR_EC_PANIC: Shutdown or reboot triggered by an Embedded Controller (EC)
>> + *	panic. The EC is a microcontroller responsible for low-level system
>> + *	management, including power sequencing, thermal control, and battery
>> + *	management. An EC panic may indicate critical firmware issues, power
>> + *	management errors, or an unrecoverable hardware fault requiring
>> + *	immediate response.
>> + *
>> + * @PSCR_REASON_COUNT: Number of defined power state change reasons. This
>> + *	value is useful for range checking and potential future extensions
>> + *	while maintaining compatibility.
>> + */
>> +enum psc_reason {
>> +	PSCR_UNKNOWN,
>> +	PSCR_UNDER_VOLTAGE,
>> +	PSCR_OVER_CURRENT,
>> +	PSCR_REGULATOR_FAILURE,
>> +	PSCR_OVER_TEMPERATURE,
>> +	PSCR_EC_PANIC,
>> +
>> +	/* Number of reasons */
>> +	PSCR_REASON_COUNT,
>> +};
>> +
>> +#define PSCR_MAX_REASON	(PSCR_REASON_COUNT - 1)
> 
> May be I missed it but where is PSCR_MAX_REASON used in this series?

Ack. Agree, PSCR_MAX_REASON is not used anywhere in this series. 
It appears to be a leftover from an earlier revision. I'll remove 
it in the next version. Thanks for catching that.

> [ ... ]
> 
>> +/**
>> + * psc_reason_to_str - Converts a power state change reason enum to a string.
>> + * @reason: The `psc_reason` enum value to be converted.
>> + *
>> + * This function provides a human-readable string representation of the power
>> + * state change reason, making it easier to interpret logs and debug messages.
>> + *
>> + * Return:
>> + * - A string corresponding to the given `psc_reason` value.
>> + * - `"Invalid"` if the value is not recognized.
>> + */
>> +const char *psc_reason_to_str(enum psc_reason reason)
>> +{
>> +	if (reason < 0 || reason >= PSCR_REASON_COUNT)
>> +		return "Invalid";
> 
> s/Invalid/Invalid reason/
> 
> [ ... ]

Ack. I'll fix it in the next revision.

Thanks,
Faruque Ansari

> With that fixed you can add:
> 
> Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

