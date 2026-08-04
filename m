Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620B043CED8
	for <chrome-platform@lists.linux.dev>; Tue,  4 Aug 2026 11:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785842932; cv=none; b=F4ujv5A9/vTDvN4FZjLkRnzpYJJ1RavA+tcpFVvvi167L6RUllUcCFlEHM3UpFWeiY26SwLC1+1iv0ZxQqhcJbpuJnJ1dhbg7WMPj7wREVneqBYP1giX0uXfO0Qkka1Una4QkRHSskB0lHAXw55pA8T8KXVc7NLeLbL2I5or6fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785842932; c=relaxed/simple;
	bh=8BWqG4YqfiBjM57lNnCy0KH8Akk8pgoZ1KQjJG8hIyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gl1rcT3G/+tL222BhfcDXbCtmUw8SU73HGE/aSlSHkdtipH8mzvU5XdYaG/VeLs9GnZNptdVeNaSxmL/WMLFCCD01p8CSF64CX4AkNr2xM07umfsAOlSD9UPMX/Cfic0nrGt1ddQtS8CkGNWKXsQiR3eqVGBz5XtMBJgT60Fa1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bAYlkwkT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bLbZPj1J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bAYlkwkT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bLbZPj1J"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748CGmO3236494
	for <chrome-platform@lists.linux.dev>; Tue, 4 Aug 2026 11:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mUv2doTcB2KgzQLoxafx4RHjj4cI//KwVl9sabgS/aA=; b=bAYlkwkTUdWwAann
	qho0NpK2qHNsX8QcruRCnRYdzvsvTQYXi3DmTrPv3lNOxIZv21nj//tAHX/ZxXQZ
	ObH/d/Xzh4DUkzUXACYog/kr5jZHNlMjqxCBCPLuLaSswQtbLhpF8CqMMYaohwCW
	Qtf/B6HxcUzRFXCKuDkY0W3fOrpSW9+ejkBihU9j9I0KsqsR3rET0/gADFT6144W
	xyCmHtKKTVn2IZJgsFWG/96ab+j1PZcxoUJOYDyMOeB/9UxcSlnQfT3aUHpeE8J4
	xsieTqeR6M3K2vtijqZH2RK3u6A6Hir98iFoP3yMnbxXe6JAe7EzWrCbG91Qt/Db
	oMxZRQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu5hqtbmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Tue, 04 Aug 2026 11:28:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d30035dso30637321cf.2
        for <chrome-platform@lists.linux.dev>; Tue, 04 Aug 2026 04:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785842929; x=1786447729; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mUv2doTcB2KgzQLoxafx4RHjj4cI//KwVl9sabgS/aA=;
        b=bLbZPj1JrsvlqD5A927N4sdMpqdVt7ZM6MR2/L9hlFt0SDFTG1DHRuThKZDSRp03uf
         WpHmv+qlzzSNVLXfHmpx9P6ayiZ2EiopnkzTuveocwAaG9Bkb/32ymnqBKDgOUwxAahW
         PYbiUYMahGdUq1B1XvE7/TGPNSQM417klt3dn4j5KNjDU9l4dUzLCPmG0HCw84djfRSV
         8OJNSjLPTtuQHgrBUvvSTpvP6fUKfn1Fyk2m7iGOwKsVueZzoQ1K8CWsT5C0shmCJmDz
         L0s9kFOhLVCBJJcLqzI53Bh/83dJzh5hm5zsgmmzqjHak8cN7GZd3459SBUhYxEIxLkB
         ihDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785842929; x=1786447729;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mUv2doTcB2KgzQLoxafx4RHjj4cI//KwVl9sabgS/aA=;
        b=KWxIG2FniIPaKHWIdgod3a1dcbOedwXH5lpLVL2t2VTkGFjoNaNfmoq+bE4GloRI+T
         Yl+HXJ9kjij8/6XZzgLzBxC3DzdJMgaOYtCiK8GImp5ITA2mzMO9gwyRr+xPKID9Y+Ib
         N7+u3bxkdRa7zUFdSipYj+Lyphw5E8e84ibPpwD0vBHz5Id/utwAoNoh+g68dTWxVAB+
         v395QKtZE2j8iWI1AE/0P0DsZv0U6QpyiUSUyJXN4nwaiH8+hYYYodYHru/lIXdfPmal
         SxObWLKKV7I2UAbEUEk59qK3qhLSvVNZqH/YvJRsTFF+w/J066P85QYavrkUpLm4h/2Q
         Yt9g==
X-Gm-Message-State: AOJu0Yzuheud6ZehOLvmkU48elMF9tZrBChBBAJv6GCCam9K5o/m0Yeg
	1/EtEWLxIzqsxS2keY8bawLfY3OdnfC9Jp4hXELhuLCVx6F2niJFfK/wQdG+BtQDIa+4QePkBBi
	XikAoF0kxyMzN/ouO0Aq4/IRpYXzeq5pzZPzzAkq4hE9b0pQhwZy+iXwOjxpVt8DDsa2w9zU=
X-Gm-Gg: AR+sD10ZSL4/dtwm/xrjSk6L7oL8lZW2tUPfgu7t/FyB4q9oYnvaDtr1Wt3xFXoDDnw
	hP3h0IQMaWv9rWdPNSGER9UTQlKeGZMvxMjd89YuYu84v8JHScqU4h47UdVbJFztt8QVXhgrkD7
	LCYKIhh5FLd8m8kAhLutJlbRax9idKdAFLCYok8y5riwEeKM6o1KUInnF2qP1GO2PpPY4jIRR44
	CLQQEY8cqVnxW1ziSOgTPE1otzGhrZhcZQVHfXq4bIHC2+WPQ45oY0Lw4E68nBJmHk2+FfMNnM1
	Xl+680OaK8D1pXw/+wEr4kwL0Xo86SMvcwmsdSCsYdDhy4rA9yQsVZrhV45pyROx/rJnRRB9nOz
	Sgs7CJhZ4f+ynPMkck69e0UH/v6Hhww==
X-Received: by 2002:a05:622a:14d:b0:51c:1241:3b09 with SMTP id d75a77b69052e-52b567f58acmr239416501cf.39.1785842929522;
        Tue, 04 Aug 2026 04:28:49 -0700 (PDT)
X-Received: by 2002:a05:622a:14d:b0:51c:1241:3b09 with SMTP id d75a77b69052e-52b567f58acmr239416081cf.39.1785842929012;
        Tue, 04 Aug 2026 04:28:49 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fec606sm95734265e9.14.2026.08.04.04.28.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 04:28:47 -0700 (PDT)
Message-ID: <64d82edc-87a0-47c7-8a17-f0d1c806a294@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 13:28:42 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/4] firmware: Rename google firmware directory to
 coreboot
To: Sean Rhodes <sean@starlabs.systems>
Cc: chrome-platform@lists.linux.dev,
        Corentin Chary
 <corentin.chary@gmail.com>,
        "Luke D. Jones" <luke@ljones.dev>,
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
 <04db0ee0-a8d5-4f30-a494-5c7f8ac757c8@oss.qualcomm.com>
 <CABtds-35m_cfT=Vm4MZkJYRe=dOPAKR6HYO_fu3SnwkdVQE0nQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CABtds-35m_cfT=Vm4MZkJYRe=dOPAKR6HYO_fu3SnwkdVQE0nQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA5MSBTYWx0ZWRfX+sd275dTK4rj
 Al79Og/CpcIInHUCsoQNhwCNc3g9j8qUONzUc6NaTIf9imIwPtnlC6Esw7RIoVnnrj20787cRdY
 o/dYaiWggtZtgaYR7LGbtxOW5bpcHWE=
X-Proofpoint-GUID: VlXb01gz72AMgD8ufdvwEHMNXkcOrXOp
X-Proofpoint-ORIG-GUID: VlXb01gz72AMgD8ufdvwEHMNXkcOrXOp
X-Authority-Analysis: v=2.4 cv=EoniaycA c=1 sm=1 tr=0 ts=6a71ccf2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=HHStz9QFAu1F9MAjIKUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA5MSBTYWx0ZWRfX3fR99qd5lLca
 D6wyxAUH3LDrJEo7R0gRebisnwQeL0BDrdMwOh8PJ9dfgtHsP+Rh7A7efzrDZWW8GZ0tAKgEQyM
 CQYKqPm27lQdnqT2tmmk3+KJs54CSfucOuGiqUfbjLM/h1dtxPdhhEc7/mS7wwzEC1cQau1wWsr
 mv2KbAQnDk7xPCFNj1eZunCPK9foxQ/JbSd+1/sXHpQ9uUsdSRawkz4y6NocaDjJdYKy34hyYRa
 hS8HhciY0aYbYmcDA/qVnqYFg2Lcr7FNvmP7hzI3T+KEg02evp8X5MCIabY0ekwoqz1OeD8Jofn
 4aYvEkk98phZK6QT09dMbGB73G2tCRDiFnGncihB1ZJrQnXo476ihdYxGPsiezEWW1aPE/AEScE
 KtLlMsOEu7uFsUzDbaCNJkjixrS8XBecdGpp6/MJZdc9KLfeuVFCqiTeOQ68VIPFqpxoG+Ds5+W
 7lEHYSV7MhiEk8o8hNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040091

On 04/08/2026 13:24, Sean Rhodes wrote:
> On Tue, 4 Aug 2026 at 12:05, Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>>
>> On 04/08/2026 13:02, Krzysztof Kozlowski wrote:
>>> On 04/08/2026 12:13, Sean Rhodes wrote:
>>>> rename to drivers/firmware/coreboot/Kconfig
>>>> index b78c644fa253..d273bd836245 100644
>>>> --- a/drivers/firmware/google/Kconfig
>>>> +++ b/drivers/firmware/coreboot/Kconfig
>>>> @@ -1,13 +1,16 @@
>>>>  # SPDX-License-Identifier: GPL-2.0-only
>>>> -menuconfig GOOGLE_FIRMWARE
>>>> -    bool "Google Firmware Drivers"
>>>> +menuconfig COREBOOT_FIRMWARE
>>>
>>> As pointed out by defconfig change, which is supposed to be separate
>>> commit, this will affect users of the kernel for no real gain.
>>>
>>> Do not change this.
>>
>> I am surprised that such change appeared at v10.
>>
>> Changelog is quite incomplete and I do not see any explanation for this.
> 
> Sorry, don't follow - so put the names back, or split it into its own patch?

I did not find explanation of this in the changelog. It cuts at v9, so
maybe that's the reason, although lore pointed me the v10 as the first
version introducing new CONFIG symbols.

Anyway, IMO renaming is really not worth if the sole reason is Google
name is disliked now.

Best regards,
Krzysztof
