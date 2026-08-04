Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F19459AF7
	for <chrome-platform@lists.linux.dev>; Tue,  4 Aug 2026 11:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785841517; cv=none; b=mLbODPGGAU4Af54GTfX0J3UgSuIQIPkgjcTbjW0Hf1spggw7+ivNnZwPL5HNtvdYmeg0VLAP9+pcD16QHOYLSAi6nDeOtjwqDDLmle/HzzNycg5WhI3hLI1VSE25UAhMnDHKkBwwkjsR84ZOkQP2ZQGvlMmnuqIFxrY1TVJ11iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785841517; c=relaxed/simple;
	bh=2lY0SOEwL0ULDDS/GDmUQgLg2WOaE32j4is5YMsE2T8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=V6nk9WPQbR8IXZmwTsGk4PhKDDPOXUbQgImRa2Rzy59gM34LduGyfySOl8DzPglCuHVBbCiT1owOoue6jo3AXThdjlrNYaWrEfrDT4OS322Rs/FcWg3hxAgdCsQnjvyYTSV4+2VMOwXwEfOknavUZlFXa9t5d8YGAiXVQWZfzBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EYNXCi6/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B5aYt0nm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EYNXCi6/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B5aYt0nm"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748CKa03546260
	for <chrome-platform@lists.linux.dev>; Tue, 4 Aug 2026 11:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SEAGrPimEHKTw1Kpbd6XZIudXgicxhiY0c8XhCSfyL0=; b=EYNXCi6/pebLxskk
	2k+9+1+e3q7sw4f0Gayb7A1RXpNyrx8ANCaLzBT+q+zFR8CGIU6muKBD8UoOSzUs
	MQv6HavyobpLTPfEG5RO6fsNEtI1a7jaftnFQSXoWesi2BqFPdt8bP+Q/nf2vgXG
	ldm+u7uoZlfGOC8GIiccWex2Lyt0EuMEqW/Aptd+EEBdfEbE9cwcK13r4/M/ILXE
	hthII4fy3Wnt8ae6iO0pCJuG1DJ/xSpm7v/0nEZ/fffII9NJpxBmyi8A4ojwRX3z
	2btOniUY4ktRwFhEmJaXQ5vZdVXS+lPwuvfzUXRxBZQXMcI4U6//QUp5nm815fm3
	5bqoBA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu3vs2kym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Tue, 04 Aug 2026 11:05:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c01ff996dso43673771cf.2
        for <chrome-platform@lists.linux.dev>; Tue, 04 Aug 2026 04:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785841501; x=1786446301; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SEAGrPimEHKTw1Kpbd6XZIudXgicxhiY0c8XhCSfyL0=;
        b=B5aYt0nmegeTaBTZtfkJmTUCqqlhkw6fU+ivYfG++iKX6Ta35Xa6k4rA2o1iTetPE0
         HuDIwIaWuwcvjDuHCAr28nn1W0+lz9E+DO9io+QT3iPdvSDKlIGlNdEwfy0MwwCdGErV
         ShLAZW1tzFq5VU9nuWBBwbOa7w444g27gRd8bJP1YxUYrsdna60z7zgJFbnLa4f7BeUD
         xm5kh3uSqixwybYJG+1cq3st3hXC9/q9SL6/MIBJcGTE12Ql2DqAkVL/w+K2WCkBUul3
         0HU9l+LzWmx6FM6WYLRzLXateljaYXo22fnAz9mTdjGl4Oj1HSEDNuP1LBMRKYjhR3oy
         M+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785841501; x=1786446301;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SEAGrPimEHKTw1Kpbd6XZIudXgicxhiY0c8XhCSfyL0=;
        b=VU2XUGketjovR8ec4F6MvqRdbiurdxk6Ar3O1GVV3L/u7GeFDE4U/+1jAImmZCxKce
         nE7E37Ov85NykczMs69luE7zMmB7KniXlNHfo/mleyjZHSxGCUoeJuOZop5EXXG+ZWrt
         RotRgu47/ic2EGpWZ56DRBH33x6Q1ybzST4cS0Wmle5cIGWaycPcVPBQEmB5+4YRQcbl
         C7PyPIo4ShtpaPtZqJslgIPUV12hqq/I9ILN9cI3Eq7oj1EonKhj6Q92GpwTEF0XyvQb
         AN1W3MCaq55R+51s/A/4O1nl4On8Fyp72LE9CMAhwRtnDj/GoypxAk3g21EQ19WwMgE/
         S95A==
X-Forwarded-Encrypted: i=1; AHgh+RoNyi7PHnOS01HMrcZQWgafSisya8iBEmcdfjPu2EPj0Ffrz6Nv3GEvv/JcxXuLmeT8BDjq4JZZIDgGJC1dS8c=@lists.linux.dev
X-Gm-Message-State: AOJu0YyYuHjtxBgUiebIcIKFCxdkqCwn2hGuXYVErmiQsVe8tBP6usFq
	kJoGW6e1asRqFt9JokSgAz+mGtgR+zTBICHlpNQhbtle88oGz8xsHETLpK1dFCjIA3sTTEjfjoM
	24UeVHFqiehpqQolbiAZutMV23q/M+JVGPRzI+Tbs7jYMwroE4mEBj07sMCLPKswuWZMeAhw=
X-Gm-Gg: AR+sD13OnzdEmTqGvvdVfq+iecBPJ5wi+6008Z/BhFtJwhxpkiezryrYFfDYFyIymz9
	oTYoEVh9QYcB2jd3+pJ1WAjFwOVqfOYy+uWAI+osXGPdsNr2r2VYrr4nOjUN3aIgdxz9+Rrd0pm
	WGiPDf5kGuiQ8pUdEyHa6wltvrc/MhDO7qY6UQNhLmSyI7CqN8hzxgOOOr6MSA3K+sfmsqdi2dp
	DWW2s3SvKPmgSRL46Y7x2DPUB8wMmcYJKnhI6fqxippWDjwpZMuUYMVBv8B4FguCh3J/MhvSNx3
	aPoBmEkOawAcJT9O5VtqhmusydYdPAJpDea0pq4AhV/T+7h9bKsPu+GiN2vUOg2yz9HlERT/M3H
	rs7ttakgDtpPqiqITlq9QxccqCqJygQ==
X-Received: by 2002:a05:622a:5916:b0:51c:15c5:2bf7 with SMTP id d75a77b69052e-52b56695898mr286920071cf.12.1785841501200;
        Tue, 04 Aug 2026 04:05:01 -0700 (PDT)
X-Received: by 2002:a05:622a:5916:b0:51c:15c5:2bf7 with SMTP id d75a77b69052e-52b56695898mr286918941cf.12.1785841500668;
        Tue, 04 Aug 2026 04:05:00 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807eb1256sm159296705e9.2.2026.08.04.04.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 04:04:59 -0700 (PDT)
Message-ID: <04db0ee0-a8d5-4f30-a494-5c7f8ac757c8@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 13:04:55 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/4] firmware: Rename google firmware directory to
 coreboot
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Sean Rhodes <sean@starlabs.systems>, chrome-platform@lists.linux.dev
Cc: Corentin Chary <corentin.chary@gmail.com>,
        "Luke D. Jones"
 <luke@ljones.dev>,
        Denis Benato <denis.benato@linux.dev>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Prasanth Ksr <prasanth.ksr@dell.com>,
        Jorge Lopez <jorge.lopez2@hp.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        "Derek J. Clark" <derekjohn.clark@gmail.com>,
        Joshua Grisham <josh@joshuagrisham.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dell.Client.Kernel@dell.com,
        Florian Fainelli
 <florian.fainelli@broadcom.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Chen-Yu Tsai <wenst@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
        Brian Norris <briannorris@chromium.org>,
        Julius Werner <jwerner@chromium.org>,
        Thomas Zimmermann
 <tzimmermann@suse.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Michal Simek <michal.simek@amd.com>, Sven Peter <sven@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Danilo Krummrich <dakr@kernel.org>,
        Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        Titouan Ameline de Cadeville <titouan.ameline@gmail.com>,
        Kees Cook <kees@kernel.org>, dri-devel@lists.freedesktop.org,
        Oliver Lin <oliver@liuxiaozhen.dev>
References: <cover.1785838269.git.sean@starlabs.systems>
 <6f65c9869714188539f2890aef6cf30e7bd2edcb.1785838269.git.sean@starlabs.systems>
 <e0d2a22e-a0cd-4a71-82c4-b88abcc7456e@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e0d2a22e-a0cd-4a71-82c4-b88abcc7456e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA4NyBTYWx0ZWRfX8LbOByfkSRYD
 tdbi35AZuS738m4Q7U6rqa9N6uLA30r3Fa7dGy9Lps40OdVsllXHkPy6Z9CBwzLjPXtgk11SAS1
 4GROvcVY7YpnFRyhvYr/EzzEHLbKk3F5MgchKZ5IrSj3H7rTdGxr6RUz4D7klVO2SD7iWNiH6/O
 lRhwmJ8VZWZn7xsMl5i5fm9M5o0On/umnFQe1fLXuvZF7aXXY/GOvV+w7uK7+xBg6KXeUJ5zTTB
 KmfW2BCXJplex0lz3PR5dzdr8m2+197eCq7TrGW4wX7poR9ywkN3duJqCc7eT7c+UQLyBwBcvc7
 9qnBm2SqfqFJEhXmRLQiErWtkjJ11Oj/y7yt+MpcZgsNFRW9Bt2cO9PEfVMwSt1PBEL2G+uYeDn
 iJADgt8VkC4588C3Tl0UCQmXTXNrul6iLJRKlsILc+ZwxGs3WQOt/8HI/Xe55bvSW0HY6gssjme
 Vwfhcy+1VkcDGC7YZmA==
X-Proofpoint-ORIG-GUID: C07g3jRQEy4Gnj4KhUyfOTgCnaTVkPrs
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA4NyBTYWx0ZWRfX97VmnIK5kvap
 JfL6pGrVy5N3fcGnPRiHE3Yui8HZUfddoreeroeKJ1xG5pr3AOYH6sREEi+CVpuG9nQYnzTaMZc
 mQyFy0FYFqTsPZAaRU9yYLNxX7EZ+VI=
X-Authority-Analysis: v=2.4 cv=EK82FVZC c=1 sm=1 tr=0 ts=6a71c762 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=fqswe53bbStJ6VhJXE8A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: C07g3jRQEy4Gnj4KhUyfOTgCnaTVkPrs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 phishscore=0 clxscore=1011 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040087

On 04/08/2026 13:02, Krzysztof Kozlowski wrote:
> On 04/08/2026 12:13, Sean Rhodes wrote:
>> rename to drivers/firmware/coreboot/Kconfig
>> index b78c644fa253..d273bd836245 100644
>> --- a/drivers/firmware/google/Kconfig
>> +++ b/drivers/firmware/coreboot/Kconfig
>> @@ -1,13 +1,16 @@
>>  # SPDX-License-Identifier: GPL-2.0-only
>> -menuconfig GOOGLE_FIRMWARE
>> -	bool "Google Firmware Drivers"
>> +menuconfig COREBOOT_FIRMWARE
> 
> As pointed out by defconfig change, which is supposed to be separate
> commit, this will affect users of the kernel for no real gain.
> 
> Do not change this.

I am surprised that such change appeared at v10.

Changelog is quite incomplete and I do not see any explanation for this.

Best regards,
Krzysztof
