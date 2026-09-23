Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14E849CF3F
	for <chrome-platform@lists.linux.dev>; Wed, 23 Sep 2026 11:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161569; cv=none; b=V6bjsb600vWuaB4XA6OlhuK6UEEn8BXZN9Iovrt2UmKOhWZP4kbsl6MG/IBv+Ab+jM83FxM7eLuxivxwLVGVwGSdJftp0j2MBj5P3HqDoky1q6MFmjHg2U1jjXyDrRAeVaq6BzvrvEvIqYAHJxaHHSrneASlJgdF3GdxVHw8Q3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161569; c=relaxed/simple;
	bh=ri1HNhpNEI3K8NJVTZY7ebXc6lZQ4qegKWKC0fyDXjo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=mkOmeZ9CRtInwssGkqWr8t/dL/6dcWVaM2qjouSUflbKf9GT5t0DKKa2cAQvC1gFaF4EUR6Gj7Nu3FSLp0Hm/npkaT67mQgdwWjvhPQ/h2Koocw5eyyCAbMVgUU2m/0dSs4KxdYrVd7+6RzHHvGOpJeSYjeNZ3S63EnB08mL5cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S6aY5p0A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xx8VNYKz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S6aY5p0A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xx8VNYKz"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA30ol3936239
	for <chrome-platform@lists.linux.dev>; Wed, 23 Sep 2026 11:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KJ8lUL5dHlGO0bO+PzLCGDgueon+wOA/1PhqsdFHMjI=; b=S6aY5p0AQtp2nezk
	x7UO8r0iOX0RIe3dgAFtTnz302sb7tzZJoy5m8tFjJz1p2B1SY2rMo90QaLG5XyD
	wI3h7K/hpzPHhTKVooOzBgxandIYeCD2Rlgi8zeKRu3YDLM0kdlqPcUC74Ipb7BC
	wPWBaHZPVXFbEnZDrJm5KYhHSBXq3Bhaz2E1G0agi2dihVD0TNY+UuHUqJfILh7Y
	2UvKjjh8/1+/5DvpNBwadSmEb8TQSLyaCKiNQaYok//xe0mJE6sS47C6sZ6TRkhq
	1n0573+GNaeE44VRtN350BszhBobTWF8EAZ94vFB5DPpCAIh4ZTUv9B0roS9GR6S
	+27XsQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv428tdfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Wed, 23 Sep 2026 11:06:02 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3282d5302ffso841469eec.1
        for <chrome-platform@lists.linux.dev>; Wed, 23 Sep 2026 04:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790161561; x=1790766361; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KJ8lUL5dHlGO0bO+PzLCGDgueon+wOA/1PhqsdFHMjI=;
        b=Xx8VNYKzoAn+YbHEMZzpH2vIGGrLqcSyCcTXGoNOR8taJIIRhlJCgYGYrHkxbtwFrA
         UOD3Gg0/sAznp+9nl7aZaxscEDVTLxuJvq76aojO5okQrWgOLUxkQWTI+RNZQjiB5VXe
         m66d41X2zyoEsBylj3lOUC6LhUCDt60w/mfqva9Wb9PwEUoZb060WCOp9iuEzmW9f1/Y
         4aR4soXpWl4YQsaWGgWYSbqBzEhj8T6baHoBQtLdY4DdJHoL4LuJ3K8kcVI6BHyVBfk3
         IbG2TdL+lOAxlj0dbL65yK0RYP/fEQVNWm2ylCleAZY0Emc9/QE802v95OiJDqUVWqhr
         25AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161561; x=1790766361;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KJ8lUL5dHlGO0bO+PzLCGDgueon+wOA/1PhqsdFHMjI=;
        b=NN7r0gIQ1cThDhj2HapX0rZ0W8uQRXdm75SOYuFmnfgccoc7U7ffRJpPRZbmWxSSr5
         kwqOaQyTg9r8Z01W3b/lVQbhWnCUiASurjd81t7oxVSnU8xYlM669FYTQiJQa4QGBVzD
         q5b8vq7squojJ0X6braM1Ocb5nRf2UlZJ9q4qmY9tJOa/p3zhvXUqKigSxtFgSBe0jlJ
         eq7mo3bG3lIV8sGN59WJDy2c9nW5dzp0ai4M1gff+xibSTgr5ePbFA6oc1vxCU9jyMTS
         ICLJBau1PQMPQb5cA9u26d6qHbelLW4gcd5bYn88RVL/+8Fmc/0MMjN6RAeHy4km6id/
         1jNQ==
X-Forwarded-Encrypted: i=1; AKwUvByfTOzJ34WI7/SyTWjPCCUKw1OoyWbz8jvUeigyQxyb03E4qPinsXpkxYtB2uwz91MdgAVWstetAGScO4XzwTc=@lists.linux.dev
X-Gm-Message-State: AFuF++n6Bvxw0o/Vnj0WFND7kFn0LtkVSoTKQQsM+mf4jOIjFw0y24QP
	Lvzd5SIhbaYtlsFL3boIMVn3LR4lOfBX+fMxEcK0xJYLsHnAKUgUijAgZmJwYy6weYymJz7v4Fn
	6R8CUU97LAMnl1yH+ce/AZcBsJKh5Xd1A90NfygcC0Hn6s1ftMfNnx26bJvnnGLHCca83Ww==
X-Gm-Gg: AYBFou2UBAx4iAy34qiBsSacnGCP9791X/qBYYk3RBU+kGsa7+hy9wmIiMnF0X9NjPL
	f6pHG2Oypr9Y794McbtteKkLT8bV82Y+y3uPdV75ej95L5cQWLA3FsOy8MRXll7w4gezCNPg0n9
	wDrAbLH4UPzJ8g4jFnlUfn31Bla02QInPIBL71IBlYC3Fj5zsICuQu+zIgwOQg/hTaEC+D4ksxp
	hIOQrTQo8+2qTwhvKu6yVFX06QLPwTLmsRPmXWZLqwgwWpj0t3trgLuEBvlNBnQTo9COONxUkmO
	W2KhBzoARi34aEjvmGWMaCV5aqPl2GdNBRlNADo/l9vao8wmZ8+3YF9MqeLwHgGpBsOjQifwpAq
	Eyat5qJkO5cv1pJF99vltE2JPCMozmQ==
X-Received: by 2002:a05:7300:2449:b0:33e:648e:d6da with SMTP id 5a478bee46e88-33e648edd00mr2396926eec.3.1790161560072;
        Wed, 23 Sep 2026 04:06:00 -0700 (PDT)
X-Received: by 2002:a05:7300:2449:b0:33e:648e:d6da with SMTP id 5a478bee46e88-33e648edd00mr2396851eec.3.1790161558688;
        Wed, 23 Sep 2026 04:05:58 -0700 (PDT)
Received: from [10.218.33.235] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9684ed70sm5224624eec.19.2026.09.23.04.05.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:05:58 -0700 (PDT)
Message-ID: <f0eef0f2-bd56-47e1-a3e5-5e83a1680c02@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:35:50 +0530
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Subject: Re: [PATCH v14 4/6] reboot: extend psc_reason with power-on and reset
 causes
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
 <20260921-pscrr-framework-v14-4-a16290003b7c@oss.qualcomm.com>
 <9ba75a42-a3cb-4ee2-bd29-84f23bbaa70c@gmail.com>
Content-Language: en-US
In-Reply-To: <9ba75a42-a3cb-4ee2-bd29-84f23bbaa70c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EZdd0/mC c=1 sm=1 tr=0 ts=6ab3b29a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=DLwBeq2uPfsNgwiNNIgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: txMMtf4nbnpTcGHIeXMsEDU84poiiQW5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX+TmS3JzX+jRy
 H7XH5PD/tqr+61Nfdc12J3Ftjpj42OdBTxOI6p3FfIEvQxc3oaQjw9FqcTttf608GdpCTcEBLmZ
 CVASRkJwkWZvNj3mHwdUeiLA4Q9H6O2RregvuK+laiF5Wke5bLCkhaWOVXZD+TtENKRZUE5v2LD
 dfM2m+wRYBJJfVgS1siWlp+CjVBKqPnjv9yb2hynK2hcMd+9fdXLfxWcWCtHYMF3G4Lpe+K30Vt
 QMoVtTy7Vy8pl5zvCtIPTigQy1Z/olQN4STEiTHRmL+8gCQFs2CKgtE/esugCzLi10sidHLOU3H
 ir87abaaldgTn2yCmE/Sw6IkTsqf7gPpeIGMFICgnLtsBUBC5mlJUN0qGLYNFpWYF3iHLpKNO2Y
 3CwV3C/gpYSTgUGqJM3Wwur+P0JpcpkyNQQS6VpLrQbF/e1zwlPRAxTOroXTQN5jsRmhw8fbzuw
 NJ4BWHWif8ymYp+7c+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX3s7KdhYaVK6Y
 mSBf1RPS5OSb4EV6ow4ynjCxMu9i4uncnmuTzKPoujFrOj7hSMds9uzO9BTn2NCV3LjbFcUh5SJ
 klmDgWLfuo+bjRHp8nR8jDsunfh4+FU=
X-Proofpoint-GUID: txMMtf4nbnpTcGHIeXMsEDU84poiiQW5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230044


Hi Matti Vaittinen,

On 22-Sep-26 1:15 PM, Matti Vaittinen wrote:
> On 21/09/2026 20:44, Faruque Ansari wrote:
>> psc_reason covered only the protection reasons. Extend it to 
>> mirror the
>> full POWER_ON_REASON_* vocabulary - power-on, watchdog, software,
>> external, RTC, reset button, CPU clock and crystal failures - so a
>> provider can report why the system last powered on, not only 
>> why it was
>> shut down. New values are appended to keep the existing numeric 
>> ABI.
>>
>> Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
>> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
>>
>> changes v12:
>> - new patch
>> ---
>>   include/linux/reboot.h | 28 ++++++++++++++++++++++++++++
>>   kernel/reboot.c        |  8 ++++++++
>>   2 files changed, 36 insertions(+)
>>
>> diff --git a/include/linux/reboot.h b/include/linux/reboot.h
>> index 4c5327dd7645..13f004ad1066 100644
>> --- a/include/linux/reboot.h
>> +++ b/include/linux/reboot.h
>> @@ -225,9 +225,28 @@ extern void orderly_reboot(void);
>>    *    management errors, or an unrecoverable hardware fault 
>> requiring
>>    *    immediate response.
>>    *
>> + * @PSCR_POWER_ON: Regular cold power-on (e.g. via a PMIC 
>> power-on request).
>> + *
>> + * @PSCR_WATCHDOG: Reset caused by a watchdog timeout.
>> + *
>> + * @PSCR_SOFTWARE: Software-initiated reset or reboot.
>> + *
>> + * @PSCR_EXTERNAL: Reset asserted through an external pin or 
>> reset input.
>> + *
>> + * @PSCR_RTC: Wake-up or power-on triggered by the RTC.
>> + *
>> + * @PSCR_RESET_BUTTON: Reset triggered by a user reset button.
>> + *
>> + * @PSCR_CPU_CLK_FAIL: Reset caused by a CPU clock failure.
>> + *
>> + * @PSCR_XTAL_FAIL: Reset caused by a crystal oscillator failure.
>> + *
>>    * @PSCR_REASON_COUNT: Number of defined power state change 
>> reasons. This
>>    *    value is useful for range checking and potential future 
>> extensions
>>    *    while maintaining compatibility.
>> + *
>> + * The reasons mirror the POWER_ON_REASON_* strings in
>> + * <linux/power/power_on_reason.h>; keep the two in sync when 
>> extending.
> 
> (still a nit)
> We should now also ensure the psc_reason_desc[] in reboot.c stays 
> in sync... (See my nits for 3/6). I have a nagging feeling this 
> is not optimal :)

Thanks for the review.
I will address this in patch 3/6.

> 
> Is there a reason for having this as a separate patch and not 
> merged with 3/6? If yes:
> 
Yes, there is a reason.
patch 3/6 introduces the mechanism — the struct, the token/label 
table shape, and the two accessor functions.
patch 4/6 only adds data on top of that — new enum values and 
their matching table rows, nothing else.
Keeping them separate keeps each patch focused on a single 
concern and makes review, bisection, and potential reverts more 
straightforward.

Thanks,
Faruque Ansari

> Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
>>    */
>>   enum psc_reason {
>>       PSCR_UNKNOWN,
>> @@ -236,6 +255,15 @@ enum psc_reason {
>>       PSCR_REGULATOR_FAILURE,
>>       PSCR_OVER_TEMPERATURE,
>>       PSCR_EC_PANIC,
>> +    /* Append new reasons here; the numeric order is ABI. */
>> +    PSCR_POWER_ON,
>> +    PSCR_WATCHDOG,
>> +    PSCR_SOFTWARE,
>> +    PSCR_EXTERNAL,
>> +    PSCR_RTC,
>> +    PSCR_RESET_BUTTON,
>> +    PSCR_CPU_CLK_FAIL,
>> +    PSCR_XTAL_FAIL,
>>       /* Number of reasons */
>>       PSCR_REASON_COUNT,
>> diff --git a/kernel/reboot.c b/kernel/reboot.c
>> index e53fb31bad06..5d4ecc82b35e 100644
>> --- a/kernel/reboot.c
>> +++ b/kernel/reboot.c
>> @@ -1102,6 +1102,14 @@ static const struct psc_reason_desc 
>> psc_reason_descs[] = {
>>       [PSCR_REGULATOR_FAILURE] = { "regulator-failure", 
>> POWER_ON_REASON_REGULATOR_FAILURE },
>>       [PSCR_OVER_TEMPERATURE]     = { "over-temperature",  
>> POWER_ON_REASON_OVER_TEMPERATURE },
>>       [PSCR_EC_PANIC]         = { "ec-panic",      
>> POWER_ON_REASON_EC_PANIC },
>> +    [PSCR_POWER_ON]         = { "power-on",      
>> POWER_ON_REASON_REGULAR },
>> +    [PSCR_WATCHDOG]         = { "watchdog",      
>> POWER_ON_REASON_WATCHDOG },
>> +    [PSCR_SOFTWARE]         = { "software",      
>> POWER_ON_REASON_SOFTWARE },
>> +    [PSCR_EXTERNAL]         = { "external",      
>> POWER_ON_REASON_EXTERNAL },
>> +    [PSCR_RTC]         = { "rtc",          POWER_ON_REASON_RTC },
>> +    [PSCR_RESET_BUTTON]     = { "reset-button",      
>> POWER_ON_REASON_RST_BTN },
>> +    [PSCR_CPU_CLK_FAIL]     = { "cpu-clock-failure", 
>> POWER_ON_REASON_CPU_CLK_FAIL },
>> +    [PSCR_XTAL_FAIL]     = { "crystal-failure",      
>> POWER_ON_REASON_XTAL_FAIL },
>>   };
>>   /**
>>
> 
> 

