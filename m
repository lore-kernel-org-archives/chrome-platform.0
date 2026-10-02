Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3448440A2A
	for <chrome-platform@lists.linux.dev>; Fri,  2 Oct 2026 07:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790927265; cv=none; b=qpFN8+Ya8Mq8TI+9rxqedXACdmQMCqBkkbdrrVIh4DIz03sClF9SQo/ymAaa0/vBnRtRLVAZ5Q0hF4PxTgSWR76g/sI1EPdBMP8qjxlTcb6oqL49p3c0o0HmAt2IbtwaYhW9J+WWQCgEXLgpQhShVbiKskRuu+KlLY//3ZErZGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790927265; c=relaxed/simple;
	bh=GsiBeouX/gtaMf4zOeo+rrTtK4Uq5wqLAWhlg0LU0nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jbs/6fsA3FNFla1z8Ivib1UBPwoIEFjokgjfbz0KEVbfZTSVjndwUDiJ+4ncHnwaBfVeNqwCXpu9T3sxxQCh3QvjrawSSoBpUXXPz8vLxDTlBGT1UBRyPthdFdYCiDLYU8EmJ0u7VNwPveKjrfBRfIIN7E8uPd6TK5i+jWw9MGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cLCHH9ji; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gk9HR/eo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cLCHH9ji";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gk9HR/eo"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925im0n1542526
	for <chrome-platform@lists.linux.dev>; Fri, 2 Oct 2026 07:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=koV6fU0fBroPWgISEdPaMuGQ
	L0eL41QYrOdoT4EtC4U=; b=cLCHH9jiXbsSGmJ+tqO9aDNUTBNApEwWtKKes23z
	sPBxgFVeLXGN4ueIFrGFXakHGUflp9yq2+7fm1ktVfD6LArlcXfLmHuCxmcdkkCT
	D/WVc//7fa5pibXdEyoWnR7CWLFICLA/BY4F76o6T6gl8KifANcjwZ6Pw9S0PWKP
	EEMaPqbszLMf2rS95XltMTtP8lwpcGgKlr7z0mc2wcfN8EWp+dtqobSrfX1oOzVW
	o8u/unPL/QlRx8FVT4uQWNS9qTnDFieviRbc/uBesDPZ3bonBGn3POFCPxZsg3ZT
	YNVThu6zCo+P4cgSY3ILopBFhCH1qkBMfl8ypq2ILV+KoA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h256mrjwc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Fri, 02 Oct 2026 07:47:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a1de6d5c3so1664910685a.3
        for <chrome-platform@lists.linux.dev>; Fri, 02 Oct 2026 00:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790927261; x=1791532061; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=koV6fU0fBroPWgISEdPaMuGQL0eL41QYrOdoT4EtC4U=;
        b=Gk9HR/eoUb+Hpv9kNf8ZzGK/0QRgYEjZdHKaCdNaw1wHau0iXh8CZl0fPyf8jEf+Gt
         F9RISOHX/xjltX9p5bJV1eprafzTuma7nTKqr7pAImO5OkMIrS5tYnRzbRsBtep0Eexk
         F4sgu4PL+PrlqvyFVUqeA9xxHyAXMeXZdGW+Z27jvltK026CQfgS1FNCUZgcqt3tA0eL
         8Ri4Sn9y7ETf1XHjInOJNjjfDMqJd/03OcTwtXvLchXvQ4202ILT2fyDWLllvwjF+gJb
         mv3yOYnmm1duBZm/KSFsOUBlliBOUAQYZgJaYktY4nPIjQgehHPYMT+cGc4PcigQFQzA
         og9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790927261; x=1791532061;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=koV6fU0fBroPWgISEdPaMuGQL0eL41QYrOdoT4EtC4U=;
        b=XSAouwp6jWqLshZpdmldq1L64iRbuWohD0QVzPz7c0RpLDQBUvm2aDwU+GaCugfMOb
         +TkWEdESnYraiH/C4ZvQDzuNHcW9Uydph3n58+v/uv5TMJySFw+pbLgWSCQj+gyBZNPj
         jAyCJQJ4TAIT2MPr0mSJ6MEvWF+p/Y8Jl0MKBFP0xBaolXlOopi7NA5zVfZXc//n9dle
         VHbLZkj05vKF3zcI48eWJW67QR7FIsPTY35OMP9jsfVtn/fn+wzczuT1Rw7ecVzO3LN+
         fBuD3tQNgGMgykRq3MquxOzavWiM2peYsRfqS7r8legpZJtHeRVDqz5lp/mPAQPwQT3G
         fhQQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1f/2NX1vZaW5t40seTu7Q+uB962ZUiOKeB7mJ9H4KmfMVfDJ+L8i+xFHZwG/UuCct+qnKGOXxaqhi92WhnuQ=@lists.linux.dev
X-Gm-Message-State: AFuF++k+Cfum3G/sBDAaHQ8FbfAQfVYRLNJvFQ62GIO5DNuhV2fF4DUX
	iqgaR0EIbMKMBMO4J1SP68QV8iKN29TlEhQTmOEh6UNCrQa4gA8KvT/kkZShgUa771rrENk3acS
	7ZNuIMRaHSG4c3xCl2lecpvxVJvJwq8L5IiF24gEDvQiye5Fn6FsuD8rJHTf7jvMaCNe7uxc=
X-Gm-Gg: AYBFou009kxO7BvLPvps+iYsP+1SaZGZ4m5OK03iRZOoX/INU1qbEeK4s0JqY9IZ2Ki
	DWlo5DhnDoLY8I3xB3XkIibDZ5SGJ09H12GVtweSYjg7wgWUj2XGHzUSV6uWxgF8qCz0rBDSG9n
	MdnQbUOwxLbKLlbPASv5lhHtHQvTMFWMhb6CsXZrVI3WtI+TRe60vLzAK9FWx7Gm9VBgMY2Naql
	8S0RffS/v5MkiIysGildQBv95WHsUS+aXSmq40EB+yntgUz7z+IxfXPFw5GdP7aUxjHCmOOMRj5
	CLOq5uFWb1a5w3HcJMRVJGI4uWJethX5nYL+YFxGOnZEpcaYgwiDn1YZq5xvU1Zzzta4Tr4C/iA
	SFe4b7h7bfEJCMcc1lUWk
X-Received: by 2002:a05:620a:1a05:b0:937:5298:7820 with SMTP id af79cd13be357-93ce7a9de10mr312519985a.8.1790927261335;
        Fri, 02 Oct 2026 00:47:41 -0700 (PDT)
X-Received: by 2002:a05:620a:1a05:b0:937:5298:7820 with SMTP id af79cd13be357-93ce7a9de10mr312517585a.8.1790927260779;
        Fri, 02 Oct 2026 00:47:40 -0700 (PDT)
Received: from mai.linaro.org ([2a05:6e02:1041:c10:f14c:b716:c104:4712])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027741586sm59554805e9.14.2026.10.02.00.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:47:40 -0700 (PDT)
Date: Fri, 2 Oct 2026 09:47:37 +0200
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
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
Subject: Re: [PATCH v14 2/6] reboot: hw_protection_trigger: use standardized
 numeric shutdown/reboot reasons instead of strings
Message-ID: <ar9e9-xnxO8rbJk0@mai.linaro.org>
References: <20260921-pscrr-framework-v14-0-a16290003b7c@oss.qualcomm.com>
 <20260921-pscrr-framework-v14-2-a16290003b7c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-pscrr-framework-v14-2-a16290003b7c@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzMCBTYWx0ZWRfX8Eu+Pv0sctPg
 KMIgE5Bn6C1EkLGIApg1YW2CJyQHt3dIKWiVV8ysvjf+jKziv8sLJlLs7fpqOVDC5k/TFWrCcdX
 U5XOAmaeBDSn+0h4KxDrDUin2W9Y7vo=
X-Proofpoint-ORIG-GUID: 6pQU6ecnMCyZyZQlZxEwEwhGaj9l2Z0K
X-Authority-Analysis: v=2.4 cv=b80ncdGx c=1 sm=1 tr=0 ts=6abf619e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=pD7qEO7pPVLmAv5tJawA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 6pQU6ecnMCyZyZQlZxEwEwhGaj9l2Z0K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzMCBTYWx0ZWRfX3ZRzvRgraJau
 aelZOnWcfQ0qb35EbeGyX6/WgiFpRd/1WhLdymCGI1kdfM4lrSWZfITjN9ViMPvqXLMkKztEgGd
 w7KzbM00YKHKGqrYMN/c4ayMAUTCS+JKM/o1c4+dclBH2Hr0jFZonCaK7kWPvKG1So/YM4ewjnc
 e0IUMLVBuFYwVSfVHAyJN3SCr9PWpB6JJsHG577fP6gEpoUJYMw34P2y1AArFNpgbRzvmnQXpxD
 iaMGFb7WQcEZAibEaKpvZLahPtpVm2z+h9x2zwAii3XxCw1YiRe7qfwZQmeHFDp0MDgxKmseX1B
 5fEk1Sv7fKnCTu2/b2nL2F7YKO2PkqSX1OO9b0bsrEg3H5SfzANqwkoN3jw7qP7t+S7xJ2iSrbd
 pNWYMH0vk0kn6IdtalYZ0HIx5Pf1jrwnVVV+Fna+Uu2muypluy/YYshnz68S2POq6xeocV2QhPh
 aQWcPZ/Nzmfiah6Yb3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020030

On Mon, Sep 21, 2026 at 11:14:17PM +0530, Faruque Ansari wrote:

[ ... ]

> +/**
> + * enum psc_reason - Enumerates reasons for power state changes.
> + *
> + * This enum defines various reasons why a system might transition into a
> + * shutdown, reboot, or kexec state. While originally intended for hardware
> + * protection events, `psc_reason` can be extended to track other system
> + * transitions, such as controlled reboots triggered by software or
> + * maintenance operations.
> + *
> + * The values in this enumeration provide structured and standardized
> + * identifiers that replace free-form string descriptions. They are designed
> + * to be stored efficiently, making them suitable for use in environments
> + * with limited storage, such as battery-backed RTC registers, non-volatile
> + * memory, or bootloader communication mechanisms.
> + *
> + * Importantly, the order of these values **must remain stable**, as
> + * bootloaders, user-space tools, or post-mortem investigation utilities
> + * may rely on their numerical representation for consistent behavior.
> + *
> + * @PSCR_UNKNOWN: Unknown or unspecified reason for the power state change.
> + *	This value serves as a default when no explicit cause is recorded.
> + *
> + * @PSCR_UNDER_VOLTAGE: Shutdown or reboot triggered due to supply voltage
> + *      dropping below a safe threshold. This helps prevent instability or
> + *      corruption caused by insufficient power.
> + *
> + * @PSCR_OVER_CURRENT: System shutdown or reboot due to excessive current draw,
> + *      which may indicate a short circuit, an overloaded power rail, or other
> + *      hardware faults requiring immediate action.
> + *
> + * @PSCR_REGULATOR_FAILURE: A critical failure in a voltage regulator, causing
> + *      improper power delivery. This may be due to internal component failure,
> + *      transient conditions, or external load issues requiring mitigation.
> + *
> + * @PSCR_OVER_TEMPERATURE: System shutdown or reboot due to excessive thermal
> + *	conditions. This attempts to prevent hardware damage when temperature
> + *	sensors detect unsafe levels, often impacting CPUs, GPUs, or power
> + *	components.
> + *
> + * @PSCR_EC_PANIC: Shutdown or reboot triggered by an Embedded Controller (EC)
> + *	panic. The EC is a microcontroller responsible for low-level system
> + *	management, including power sequencing, thermal control, and battery
> + *	management. An EC panic may indicate critical firmware issues, power
> + *	management errors, or an unrecoverable hardware fault requiring
> + *	immediate response.
> + *
> + * @PSCR_REASON_COUNT: Number of defined power state change reasons. This
> + *	value is useful for range checking and potential future extensions
> + *	while maintaining compatibility.
> + */
> +enum psc_reason {
> +	PSCR_UNKNOWN,
> +	PSCR_UNDER_VOLTAGE,
> +	PSCR_OVER_CURRENT,
> +	PSCR_REGULATOR_FAILURE,
> +	PSCR_OVER_TEMPERATURE,
> +	PSCR_EC_PANIC,
> +
> +	/* Number of reasons */
> +	PSCR_REASON_COUNT,
> +};
> +
> +#define PSCR_MAX_REASON	(PSCR_REASON_COUNT - 1)

May be I missed it but where is PSCR_MAX_REASON used in this series?

[ ... ]

> +/**
> + * psc_reason_to_str - Converts a power state change reason enum to a string.
> + * @reason: The `psc_reason` enum value to be converted.
> + *
> + * This function provides a human-readable string representation of the power
> + * state change reason, making it easier to interpret logs and debug messages.
> + *
> + * Return:
> + * - A string corresponding to the given `psc_reason` value.
> + * - `"Invalid"` if the value is not recognized.
> + */
> +const char *psc_reason_to_str(enum psc_reason reason)
> +{
> +	if (reason < 0 || reason >= PSCR_REASON_COUNT)
> +		return "Invalid";

s/Invalid/Invalid reason/

[ ... ]

With that fixed you can add:

Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
