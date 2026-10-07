Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC4441D62C
	for <chrome-platform@lists.linux.dev>; Wed,  7 Oct 2026 08:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791362715; cv=none; b=Mz4rKpBm07RJiKxsuixCss0rVEveMZvKeVrO9/xvbS/4jxUMwnw6hmmbineaSHotQy8BEuRMxcs15MJQHFvPutEFmmZhaltIINkwm7Tk4ACuXCGkhghq+bXz1lB5DWh+aaIJPtSokLe0I87TYlMvC4iiTlbRkixjVUAtXAaXX/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791362715; c=relaxed/simple;
	bh=cwwZ1AvHUGpQ0cX0o0ag7M/FKmG+jLvaiSKvBHQ1LUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WG972uqfsW9rCvpQfonAng5fS7+Iq5l7n7rU7WYBc5x4VgGDBllHxFM3HWfG6cJ+U2u7nyBBHy+xxk3GktZzOaWpMwXOwnFE8wGa9RvPo/kVRu4drBy7tFUvKVtTDdIiV/y5PGeWwZkfrm0zNiAzZoMXhQDaJqdGK6XjUpNH/Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P603HSJq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ednrWi0R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P603HSJq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ednrWi0R"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977je763194063
	for <chrome-platform@lists.linux.dev>; Wed, 7 Oct 2026 08:45:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ofN0xqNd1KAV8nhkxjJDPKF7aC74Hh9gM7raBNbLz50=; b=P603HSJqg5tlDHMV
	7FUTb+LYuPySuw72yexv1KsqSEtHA0LUNdHqTfAIat8pAvKPdLahK4yxMlggPFKZ
	jWAAlEVa25C3YTlbChMdUug5Y+Wp3CXT4nCvCk3Ml3qt7ii7dY8oDA5jhP8ElDJk
	Ec74g9U6ChKWsr52aIv1OLBU6HWETMdC8nrohr5YoMhQB0Rt2yuVOJEI4L5/TiOP
	3iRypcb9HmmDLWGWpvlkMnObBo5pPufLQSAxlVXzfrdqLGgmYst6hJ4qCErssUia
	SZ/CuhOEN0bCXFlf/hGFhrwLRROKFgW6yXDlDQpD5kgnzf01tmMUPrU8Y9pNj6T2
	3EwAVA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h541ukf2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Wed, 07 Oct 2026 08:45:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf7856ffso661845985a.3
        for <chrome-platform@lists.linux.dev>; Wed, 07 Oct 2026 01:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791362712; x=1791967512; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ofN0xqNd1KAV8nhkxjJDPKF7aC74Hh9gM7raBNbLz50=;
        b=ednrWi0RwHjDZnxH12RCBhmsHcubAfeQMmV7xRV60Pkp8uCcvnZKpXVaK11s3lPSn3
         Yv9/z0TeNLE4FQ+RDVKh6Jr0H2U9yDQ4QWHopwu59KaNDPUmXNOQevXHrbMs58vUqdwA
         1QqWpUad3wQfvFM3sylWlm/jLMb9E1z5qHzS60MU2TTxNeajZoh0lIzcv2sxcO+M3jz3
         7I658b/qXjR1036BpnR6Ngoq1oI11Q+bHAHwbGrmsECXO+3P4/nFqDrpw8NBd+o2Z9J6
         QOTIT9nFvNaEnpaTWrWjjg8URurLltzc9iGxIWgE96WNQQrTaSoCeWiusaWGv73C0MjD
         bG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791362712; x=1791967512;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ofN0xqNd1KAV8nhkxjJDPKF7aC74Hh9gM7raBNbLz50=;
        b=hLqnCjAao4gqbwH8SzF700tO0GYRjFH4bMhBBCVN/JgUkffF1pbX48JnJk1YALz8yf
         tP9rwqdeUed7A+Qi8+0gPLnzx/1ALqxnSEx5PC2BEDauWqY9gYV2IsQ18/83IU5OKPnp
         5DVL3G1uGhahizf6BU4SsCRHzyJB/pSFH5Allg13t4HMTLPuJL+FkC0NjKumnNlWx61L
         4i6wX6fro/zHTEmJwXvQLSmejQRS2KapUdPV9fprGJitVDiZNNem3LK45mTZfy4Sa6xQ
         DK0H+y2mj9yj/v16SJ9NDPLqlGdl8MS8S3Ev5Vw4AMvhJzhtK8Lr7k4PrEfvXyShzp3k
         QRlw==
X-Forwarded-Encrypted: i=1; AKwUvByWoJDWzSetMoWJJmHFnzxskWP57y1mqFpn07ujLh4q6+/quM/H/s62Ce6iAuT7LdBHSI0UwHh95wTbYbchm3g=@lists.linux.dev
X-Gm-Message-State: AFuF++mqC+/kZifVxeOiaVLMxw409caVldT85xLDaZM4wtH1cl2iRcg9
	aCeeUffFF60V9L+pIUnaYYH08XwuQzPE+iyGJKpAIwzswGDLnEQuygm7/dkOD9fpLXV8QiobbnJ
	LlUy6KjysodnZ5BorDjrQQZRX0xUvPN/X0gy88QM4g/wbt6lBdTMxIPYDcc8CAgLA3C/VVKw=
X-Gm-Gg: AYBFou2M7JI+f7+nzzu/KqXy5n2qBIJaAdJzcBw5csD5d5gK4dgLmh6HNp98FFIYvKj
	4fhgVorLJsUOphCLc7Uyx+Ti9yyJEGayHPb1UocDDGsOqH5rJiRb0FbmZpafana+KFmzDkFY1P8
	rQOp3/3VVOoXOcH2WlTVDlnCs9vFpTflbAsEkfVvrkIf4AhjYRsUkO6saEhFuEtTlvOwrsCmiPE
	5KI992m84IuVeoMIjCNnutA3eua20/7VTFSMqfyVkbK5QAXXrGneHW7SVovNF/SBq/6I5TshNwR
	AgB0JT6JUbIWgUOOlpgI6YbPpxjXfw/+eyHCZTqcYoPvyf+PqAm7UnLBoE4TP8rM9JDsDfBJ3MG
	s3LPe9XW/HD+xqqylvK3VX5PYYUsBruQTpVuxpuikNqrb
X-Received: by 2002:a05:620a:1721:b0:93e:9809:dc00 with SMTP id af79cd13be357-93e9b8f03demr282565885a.83.1791362712156;
        Wed, 07 Oct 2026 01:45:12 -0700 (PDT)
X-Received: by 2002:a05:620a:1721:b0:93e:9809:dc00 with SMTP id af79cd13be357-93e9b8f03demr282562285a.83.1791362711696;
        Wed, 07 Oct 2026 01:45:11 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c7256434bsm3895171f8f.15.2026.10.07.01.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 01:45:11 -0700 (PDT)
Message-ID: <5ce48dc0-b8ac-4d6b-9918-8d4af08ce719@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 10:45:06 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v16 5/6] power: reset: Introduce PSCR Recording Framework
 for Non-Volatile Storage
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
        Ulf Hansson <ulfh@kernel.org>, Francesco Valla <francesco@valla.it>
References: <20261007-pscrr-framework-v16-0-3642c277bebb@oss.qualcomm.com>
 <20261007-pscrr-framework-v16-5-3642c277bebb@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20261007-pscrr-framework-v16-5-3642c277bebb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: K8Q-3_Ey8J8PT-L85esWdIHu5PC63Cqh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNCBTYWx0ZWRfXyw1ZgetrxuMg
 WFmDh1CKz/wFhXsPDFHbr+C5Vs6CySGaa+MplBx5EUPSiBMelD1KvJRGIbq2Mu47cTCxQD9c9Gs
 xcziuk1wIftVLUzJxlosfjYTq8Sd0sM=
X-Authority-Analysis: v=2.4 cv=XZYcX455 c=1 sm=1 tr=0 ts=6ac60698 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ESGm2P_6vxgoHrSgdVYA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNCBTYWx0ZWRfX0elMBVY3pXBD
 OGaSybKQR5qCjY9741q1lT/nbSIj8japhyjP7MCsnUJ6i/SdPyl4Q+Oaol6BtqnQT9jT3swy0eF
 v1F2s4RbEYO7rN2QC9Rz7XkENqYyhI7rd40oT4Zxd/VM50aJGpj4xOcyBqChYuWi1jsLkJb5bj/
 vp31qKAg0aUSgTEaUikifzdr7vpsJkXasSaElBSW8PCSK/r+bPgEjnopRZBOq/xfexhJSah7mW9
 wwoTS2/nyNeRmW8aLOFv27DLkAJ0P8OW1X/s7R7UlmcuhDiKynTsi5LPHqTOccybeza5Kk4zMH8
 z57bjjUyP7p9PJV1M8YHv1+uhWA0PJhDZRD5zYP9FgkicTfpeEeC6B1FHf2zMiZR+VliNm53Dyp
 WVK/jauTmGLPPbG3Np9HAgQNDuK1qozm0IwJi+52GwiJvlrRbnN7/jtm/VOwptuOKvMVokxlkkM
 99YeJB91TA68ngYLrug==
X-Proofpoint-ORIG-GUID: K8Q-3_Ey8J8PT-L85esWdIHu5PC63Cqh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070034

On 10/7/26 09:06, Faruque Ansari wrote:
> Introduce the Power State Change Reasons Recording (PSCRR) framework: a
> generic mechanism to record why the last power state change (shutdown or
> reboot) happened - under-voltage, thermal, watchdog, software-triggered,
> etc. - so a postmortem reason survives a reboot or an abrupt power loss.
> 
> PSCRR is built around providers. A provider is either a hardware reason
> source (a PMIC, SoC reset controller or watchdog exposing a reset cause)
> or a recorder that persists the reason across a power cycle (an NVMEM or
> RTC scratch cell). Each provider gets a directory under
> /sys/kernel/pscrr/providerN/ exposing its name, backing device, the set
> of observed reasons (as tokens), its capabilities, the reasons it
> supports and - for recorders - a record policy. The reason set is
> deliberately not collapsed to a single winning cause, since resets are
> often multi-causal.
> 
> Reasons are the numeric enum psc_reason values from reboot.h, shared with
> the POWER_ON_REASON_* vocabulary, so they store compactly in small
> battery-backed cells. The current reason (get/set_psc_reason(), set by
> the thermal/regulator/hw_protection paths) is written to every recorder
> from the reboot notifier.
> 
> Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Reported-by: Francesco Valla <francesco@valla.it>
> Closes: https://lore.kernel.org/all/178749889134.204450.5740187753642158305.b4-review@b4/
> Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> 
Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
