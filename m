Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB984A1E1F
	for <chrome-platform@lists.linux.dev>; Wed, 23 Sep 2026 11:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161541; cv=none; b=n75Zj99oT7qUfcZxmLfhqVFkg8xwLnFLEOc5WbSGYNwPJl67Pht2tGWclXxokrNBh5o0JgE0wxVABoHxZxHY2tB2diI/iFCLb7shafZvIXZpR3W5/Yoj6K/k5AHkyMjdOd6Cmss4T39x0pdp0sxa5Ans+vd9JTT5QXEA6HxycPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161541; c=relaxed/simple;
	bh=K0jycMTvi6wKLbEUqdHCJShvK5Y3X5IYyfoja2Jkq5Q=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=I64aGZ4hEfYNjA+mte2I2gnQJtN4mtZdJwAwDeEvb7xpSN7oRavwlRKJ9aEQwRfbHQQBRQz0P0zAyfFWmsR/yqa/PfouEuDED1VJqP9Si260s3CEyWFv5syRkav8XcFkkaW+4Ktvy7MBiXP3aDLgSwFHSmjPsD3f1BzXi0ef9oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l99FXg0U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GGvywJuM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l99FXg0U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GGvywJuM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA30BZ4087729
	for <chrome-platform@lists.linux.dev>; Wed, 23 Sep 2026 11:05:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JPqyhRbpOf17HmSBmiSMBHQE6Y0S0sQtUmXib+0l6+A=; b=l99FXg0UpAhzLGUt
	+6Q8K/jLHntnFymV2NDkyNb2/Ac43ZvW+fyp23PDom3wqiO4njAyx8gJ4Bm2fMUe
	PtQISjo3y5sp7aUMRcS07CoO/FWLVnAxtoRRAoDsxodbKSx2cSgOm4bHW56s5QLY
	juIVBFLoQCWfsQVkubqNs07OL1niyWMNpqB4zpsIilSQAP5LYzckvULmNlhJLR+w
	DG+odcyk19O50xFE9mDVW7S3qcTKpjRWr1tAWlIm2eAekQJmLYCvdEsabz1LNEv8
	1WUWQJonr6QZ58zmXiadyGqCYGoEfTVR2HlJIET+g+TmQVLNmZ4H3hrdeIo4BfMN
	aCw4UQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c419y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Wed, 23 Sep 2026 11:05:31 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-143580417b3so2810324c88.0
        for <chrome-platform@lists.linux.dev>; Wed, 23 Sep 2026 04:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790161531; x=1790766331; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JPqyhRbpOf17HmSBmiSMBHQE6Y0S0sQtUmXib+0l6+A=;
        b=GGvywJuM/wQ6Xf1xdB2/oHZDAMnxiZt9ecLFryFUDi5BBuujsoyIJ7WO2tjPHXkag1
         E2eVhJIdLfr7dLf6icCCipOTI9cpAwxwlRovOkN8ZphSkeZqQMQF0Ou1RHKtiuAwGaf/
         Hg4iP3V+2j72KrJFg0bDTr/76Te5st6UY03LZdLa68V1aPsRRT5X4/inlCZhtKRE+8BV
         ZdPJ76mQtqtPb4KHRPGAdW4S23+jJeY7ZK4iEuOo3KgYR7wSCRF+KK/EXXwbWxfLJjEb
         aJzZgS5t5UUqWZJQL4OLslKGQvfFn9wZD6g8EbmYHFkjRF4Xdx9db4arE1QHawzmsaCv
         R7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161531; x=1790766331;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JPqyhRbpOf17HmSBmiSMBHQE6Y0S0sQtUmXib+0l6+A=;
        b=SVbY8jPoYHZ26688mWhE4nv5/khPlcPr7A5zjsolHHJNsx8Me+pN34IJs2LZLxuaRM
         VOBCxr0zU7RuSIRuuATctBvc8m3YZDgu6aZItPpf0yZHO4/1HDQ2O7VEtsx8b6mQNomq
         sVoVF1cMuyrScVJ/5TNfQGIu30wfr0H608Eh8AWf4MBOqlSQPFN8GLzyk8Za2Qlly3xe
         A7v4FRb1jZxoVlp+XGaOe3rYYJt9zCheT6A3BySSa7OMpRxVniHfSEN1r2+6pxgoJgqr
         1xPKx+GxBQa8FupFfR7N9U9Fs9WDg5zA+ntsXm74mx/2zWXDwbT0A5sNdb60Da6ZdNsd
         ci0A==
X-Forwarded-Encrypted: i=1; AKwUvBycXA5WMBHzinGg7mUCdhgJ8OmE0dWI8DMidXQ8ok3x+E8WJFiWvcEG/DZ24H32l6aXn3iba8jMo3zZX8dCUOQ=@lists.linux.dev
X-Gm-Message-State: AFuF++k40lLgUt5ZisNqam9qEXeTBwOa/vwMFFdYHajOYLHSuHL3jpx5
	OwWBStilrkii+rlEh3nwDTYAFqRaH2Z+uaX2THdNk06TXFs66Kmt0n/I87560ipLoa5SrjnUTjy
	aMmA7Ax7EDADNzPGcmim+XuBpp+rQX/S9pMSGt3eQhOXosdTrK0G+/n5t5jxuleJ5zuVFPQ==
X-Gm-Gg: AYBFou0R8i2hU7MS2XPjWaGkn2lJp0BKlf5nZRd6lWZiOacX4J5UEib/esZoWsnDlrF
	oq309gpdYnWWRnk5ftU14Mg5wbjKsfCabTXyKaLLO+nsvf18AhhnOaih/nKkn0UiMEaiArr5wNf
	uxNCvDoKNJ1+nz4jgKAAm5x3si/DQiPgoQ7jzT2oyhrfb3JN2P0+FVSmdHmofaSF0FchSbm7TQx
	shWxkSTChAQHtQBUdRRdEgEYehzmJwAsP8pSJjrvU31P0zum1D/u3o1IfA8DU3Q21xVCSjX49t7
	S2IqmO4uNOUtiXjUW5zzqLwZHA0Ti7tud85KpddPAkw4OC1XVrZpWWQ+fxC2LTQrW1pAiLH6gH6
	kXNO5Y2F6LKCv11pd1/qGwxmBaRcXCmSs27lkQ3g3
X-Received: by 2002:a05:7022:7f0b:b0:13f:c02f:60b8 with SMTP id a92af1059eb24-144f9166ab0mr2272820c88.6.1790161530732;
        Wed, 23 Sep 2026 04:05:30 -0700 (PDT)
X-Received: by 2002:a05:7022:7f0b:b0:13f:c02f:60b8 with SMTP id a92af1059eb24-144f9166ab0mr2272778c88.6.1790161529904;
        Wed, 23 Sep 2026 04:05:29 -0700 (PDT)
Received: from [10.218.33.235] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983d73fsm7741663c88.6.2026.09.23.04.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:05:29 -0700 (PDT)
Message-ID: <1188ca90-d3c9-40ce-ae8a-56262b4192d1@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:35:22 +0530
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Subject: Re: [PATCH v14 3/6] reboot: add parsable tokens for power state
 change reasons
To: Matti Vaittinen <mazziesaccount@gmail.com>,
        Sebastian Reichel <sre@kernel.org>, Benson Leung <bleung@chromium.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        Guenter Roeck <groeck@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        avaneesh.dwivedi@oss.qualcomm.com,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
References: <20260921-pscrr-framework-v14-0-a16290003b7c@oss.qualcomm.com>
 <20260921-pscrr-framework-v14-3-a16290003b7c@oss.qualcomm.com>
 <f4d2e209-1c89-447a-a5d1-92696b51b614@gmail.com>
Content-Language: en-US
In-Reply-To: <f4d2e209-1c89-447a-a5d1-92696b51b614@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX6OCHmhazU1Ld
 SvoPmgz3F5KN3Vp25jW9/9i60wI8Gd11dfXiIHUzgRFi+ltpFIxXD2WlHVC4alepdWEPKiOc1eY
 4oAwfqYEYtdNwJddRHo4EJ2pIbG1B4K85mP2/pPHLHnhU4gkweCCZz5TF1BVpwKXVAdyh/c3rwH
 okPby3gX6sW6qKFx4rlqT083rpBYk0dalyVuvDBNtn20B/RE4VANimCYi0UB5SMffOGiZ6ytB33
 lbm49ZtPPeVlxwY9324nBgD2J+35f6SvIX0WmcGfLOlGC+tTova+IeXYJ2IO8BlemXbGlE+R4gp
 iWtIvy4yNWhidabTfdb1mZK1FhmQC/AgTdvo19uh5RcgOTuI6B7cu6MNDQTy8+iweyRRjVpf9FX
 CnszPXncs0Wax8sFffZHEeELIgQ8/cK49fRPTtm/oJgRA08fYxzZlseJZCIQaNabl+jlg83fVE4
 T628d1Abf7kjv39WB2w==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab3b27b cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=6S1-GrwmiCmPnoYEXswA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: o2q0wSbrjRnoJFYP2BOulWm0uXku4gZ-
X-Proofpoint-GUID: o2q0wSbrjRnoJFYP2BOulWm0uXku4gZ-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX0bWrUUIzREHf
 gxTOLxNLriZeholKAbqf9dKEj4c17rjye/SI/PNOeEAykm9cgUl/j2tdbHNmfrKmeJgAe+S4Sro
 V4INqi+EW1VAtYHBKWyxaFmW9IhDDaM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230044

Hi Matti Vaittinen,

On 22-Sep-26 1:07 PM, Matti Vaittinen wrote:
> On 21/09/2026 20:44, Faruque Ansari wrote:
>> psc_reason_to_str() returns human-readable labels that contain 
>> spaces
>> (e.g. "over temperature"). Those are fine for logs but unusable as
>> values in a space-separated sysfs list or as a write target.
>>
>> Extend the single reason descriptor table with a stable, space- 
>> free
>> token next to the existing label, and add psc_reason_to_token() 
>> and
>> psc_reason_from_token() so consumers can emit and parse reasons 
>> without
>> inventing their own string table.
>>
>> Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
>> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
>>
>> changes v12:
>> - new patch
>> ---
>>   include/linux/reboot.h |  2 ++
>>   kernel/reboot.c        | 77 +++++++++++++++++++++++++++++++++ 
>> ++++++-----------
>>   2 files changed, 63 insertions(+), 16 deletions(-)
>>
>> diff --git a/include/linux/reboot.h b/include/linux/reboot.h
>> index 08a7549bbc40..4c5327dd7645 100644
>> --- a/include/linux/reboot.h
>> +++ b/include/linux/reboot.h
>> @@ -244,6 +244,8 @@ enum psc_reason {
>>   #define PSCR_MAX_REASON    (PSCR_REASON_COUNT - 1)
>>   const char *psc_reason_to_str(enum psc_reason reason);
>> +const char *psc_reason_to_token(enum psc_reason reason);
>> +int psc_reason_from_token(const char *token, enum psc_reason 
>> *reason);
>>   /**
>>    * enum hw_protection_action - Hardware protection action
>> diff --git a/kernel/reboot.c b/kernel/reboot.c
>> index d5a45db82c3d..e53fb31bad06 100644
>> --- a/kernel/reboot.c
>> +++ b/kernel/reboot.c
>> @@ -1084,34 +1084,79 @@ void set_psc_reason(enum psc_reason 
>> reason)
>>   }
>>   EXPORT_SYMBOL_GPL(set_psc_reason);
>> -static const char * const pscr_reason_strs[] = {
>> -    [PSCR_UNKNOWN]            = POWER_ON_REASON_UNKNOWN,
>> -    [PSCR_UNDER_VOLTAGE]      = POWER_ON_REASON_BROWN_OUT,
>> -    [PSCR_OVER_CURRENT]       = POWER_ON_REASON_OVER_CURRENT,
>> -    [PSCR_REGULATOR_FAILURE]  = 
>> POWER_ON_REASON_REGULATOR_FAILURE,
>> -    [PSCR_OVER_TEMPERATURE]   = POWER_ON_REASON_OVER_TEMPERATURE,
>> -    [PSCR_EC_PANIC]           = POWER_ON_REASON_EC_PANIC,
>> +/**
>> + * struct psc_reason_desc - Descriptor for a power state 
>> change reason.
>> + * @token: Stable, parsable identifier without spaces (e.g. 
>> "over-temperature").
>> + *       Suitable for use in sysfs values and as a user/kernel 
>> contract.
>> + * @label: Human-readable description (e.g. "over 
>> temperature"), for logs.
>> + */
>> +struct psc_reason_desc {
>> +    const char *token;
>> +    const char *label;
>> +};
>> +
>> +static const struct psc_reason_desc psc_reason_descs[] = {
>> +    [PSCR_UNKNOWN]         = { "unknown",          
>> POWER_ON_REASON_UNKNOWN },
>> +    [PSCR_UNDER_VOLTAGE]     = { "under-voltage",      
>> POWER_ON_REASON_BROWN_OUT },
>> +    [PSCR_OVER_CURRENT]     = { "over-current",      
>> POWER_ON_REASON_OVER_CURRENT },
>> +    [PSCR_REGULATOR_FAILURE] = { "regulator-failure", 
>> POWER_ON_REASON_REGULATOR_FAILURE },
>> +    [PSCR_OVER_TEMPERATURE]     = { "over-temperature",  
>> POWER_ON_REASON_OVER_TEMPERATURE },
>> +    [PSCR_EC_PANIC]         = { "ec-panic",      
>> POWER_ON_REASON_EC_PANIC },
>>   };
> 
> nit:
> Is there a reason for having the label as a define while token is 
> a plain string? It may be just me, but I would have expected the 
> userland contract to be defined in a header. (It may be just my 
> false expectation though!).

Thanks for the review.

On token vs. label: I'd prefer to keep token as a plain literal 
in reboot.c. Unlike label, which mirrors the shared 
POWER_ON_REASON_* definitions and is used by code outside 
reboot.c, token is introduced by this patch and is only produced 
and consumed by psc_reason_to_token() and psc_reason_from_token() 
within this file.
Since there are no external users that need the string to be 
shared, moving it to a header doesn't provide additional benefit.

> 
>>   /**
>> - * psc_reason_to_str - Converts a power state change reason 
>> enum to a string.
>> - * @reason: The `psc_reason` enum value to be converted.
>> - *
>> - * This function provides a human-readable string 
>> representation of the power
>> - * state change reason, making it easier to interpret logs and 
>> debug messages.
>> + * psc_reason_to_str - Human-readable label for a power state 
>> change reason.
>> + * @reason: The `psc_reason` value to convert.
>>    *
>> - * Return:
>> - * - A string corresponding to the given `psc_reason` value.
>> - * - `"Invalid"` if the value is not recognized.
>> + * Return: The label string, or "Invalid" if @reason is out of 
>> range. For a
>> + * stable, parsable form use psc_reason_to_token() instead.
>>    */
>>   const char *psc_reason_to_str(enum psc_reason reason)
>>   {
>>       if (reason < 0 || reason >= PSCR_REASON_COUNT)
>>           return "Invalid";
>> -    return pscr_reason_strs[reason];
>> +    return psc_reason_descs[reason].label;
> 
> nit:
> I would feel a tad safer if the psc_reason_descs[] was always 
> guaranteed to be initialized up-to PSCR_REASON_COUNT. Having the 
> enum and PSCR_REASON_COUNT defined in one place, and 
> psc_reason_descs[] initialized here, adds a window for: "I added 
> new enum value, forgot to update the psc_reason_descs[]". Can we 
> add a NULL check or are we on a very performance critical path here?
> 

Thanks for pointing this out. I'll fix it in the next revision.

>>   }
>>   EXPORT_SYMBOL_GPL(psc_reason_to_str);
>> +/**
>> + * psc_reason_to_token - Stable, parsable token for a power 
>> state change reason.
>> + * @reason: The `psc_reason` value to convert.
>> + *
>> + * Return: The token string (no spaces), or "invalid" if 
>> @reason is out of
>> + * range. Round-trips with psc_reason_from_token().
>> + */
>> +const char *psc_reason_to_token(enum psc_reason reason)
>> +{
>> +    if (reason < 0 || reason >= PSCR_REASON_COUNT)
>> +        return "invalid";
>> +    return psc_reason_descs[reason].token;
> 
> Please, see my comment above.
> 
>> +}
>> +EXPORT_SYMBOL_GPL(psc_reason_to_token);
>> +
>> +/**
>> + * psc_reason_from_token - Parse a reason token into a 
>> `psc_reason` value.
>> + * @token: A token as returned by psc_reason_to_token(). A 
>> trailing newline is
>> + *       tolerated.
>> + * @reason: Output; set on success.
>> + *
>> + * Return: 0 on success or -EINVAL if @token matches no known 
>> reason.
>> + */
>> +int psc_reason_from_token(const char *token, enum psc_reason 
>> *reason)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < PSCR_REASON_COUNT; i++) {
>> +        if (sysfs_streq(token, psc_reason_descs[i].token)) {
> 
> I suppose my comment applies here as well.
> 
>> +            *reason = i;
>> +            return 0;
>> +        }
>> +    }
>> +
>> +    return -EINVAL;
>> +}
>> +EXPORT_SYMBOL_GPL(psc_reason_from_token);
>> +
>>   /**
>>    * __hw_protection_trigger - Trigger an emergency system 
>> shutdown or reboot
>>    *
> 
> After all these years in the business - it's hard to be as 
> confident as I used to. ;) So, I won't say [aloud] that my 
> preferred way is the only correct way. Please weigh my comments 
> and decide as you see best, this is "good enough" for me if you 
> don't agree with my suggestions.

I agree with your suggestion and will incorporate it in the next 
version.

Thanks,
Faruque Ansari

> 
> Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> Yours,
>    -- Matti
> 

