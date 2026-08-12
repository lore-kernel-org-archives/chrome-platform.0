Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD96F40098A
	for <chrome-platform@lists.linux.dev>; Wed, 12 Aug 2026 10:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786529209; cv=none; b=ogRCwyNvPT/N+wbk+g6SHmXDXIHu3ERsfp7aqGx6FkbZ0baccRZDcFxooNg6uNJsAEDgYnT04NOT1bs9Hs4tD5XXEGN1AFiSsdB0R01mmeEJOaXTKUBWs6PvgEnSPRK4LZ3X/f8bZZ3mMEEoH8LNkmB1E5THBGYD73Yy8xPNveE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786529209; c=relaxed/simple;
	bh=RnikPEgzeTjUJnEQSdQKHOjLYEpAOh4Q0UUB04GXxj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C0bjYByIPcuh4XcvbC33vmSqPjQ744gDQLrtqdcVl+zpzoPpMTENjWOCAushGJGq+hoo2V/LZeZYgtkEVDrOEMiE6qAnZXCfjnc5qFtO824/cUgkoO79kI5ZgbuB39px+ag0HF4PegVNVOpY3yhpAXS6Prv0jGHrSI2a5TmcEtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P/0bpBRo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DxsEDbM/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P/0bpBRo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DxsEDbM/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C9fmIR3997151
	for <chrome-platform@lists.linux.dev>; Wed, 12 Aug 2026 10:06:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t/SOUpUwjDpAt++MVooTOPUKZjfOYijo38yy35xnxnE=; b=P/0bpBRoYv1osyh4
	EAkk8kxe2DJERN5N3w78B5e/+lesGS5HMl8vMkcvIwuiGa/Ahn327h+p4QMv2rc4
	SxeYZPEM1DymwEsgBin2TL34WUV5fPAjmygLIFgxTqLiNNGZEx8IBiiwNiolRDS/
	Y1fTd8ET0ui5cFVH9j56O5mDWkndWU/NU4pG8pdTGPJInpKpUByIOxTmFG7Kxt23
	C37rEApB3vYvqzcXkzjQszX/GfZ90nnYsUw6gWyYcAcCU5scrGEyRxLoKZcHhdGB
	bXweSN1dJ8RadevfMuDptwwsH3QVi6cdQtf9URG9tEeu4I+WdRei4VBYGcP75Dr5
	J67yvg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g08j5k9j8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Wed, 12 Aug 2026 10:06:46 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9087f2fe592so4441346d6.0
        for <chrome-platform@lists.linux.dev>; Wed, 12 Aug 2026 03:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786529205; x=1787134005; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t/SOUpUwjDpAt++MVooTOPUKZjfOYijo38yy35xnxnE=;
        b=DxsEDbM/Ii7PO+EwW368RTwKxUGtpaqkFu/iybjiTfNE0E8hc5FE8M3Y4CQMHxoRCL
         pueSZI0EJLeznlZfjcWgFSJwXYRRNZIv7+bpxns6owT/APwAGX5Xj8sFckEoSkTxzbEx
         e0ikEGMM0MCnKQb/TqV5492sNcpPQEKdH9jiEhvxp6Que79Pwk9CSk7NzCl4WZclcM1v
         MNgrZeUJRL0Rq3FJgD99fp7zXwE/Hvs1jNTA6tbLpfgOPeXGAkAR3g5SbRkD4SV7S26v
         mcCHJVTWMwFl/tRvFZAsszJCUWXVTMiQEPqJHNqe0DdF09AmSBw6vQPxEmAYLccmrmFY
         szwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786529205; x=1787134005;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t/SOUpUwjDpAt++MVooTOPUKZjfOYijo38yy35xnxnE=;
        b=W8g9p7RVmLt8kMgw1WsgB6y7ClBbTIpiLpFu8c7eANJK3l1BkfyMJZTrX3kx559jQm
         bmljgqL/+EaSlcJ/g8d0SWdu9v8LZG8Q0oz/soMLABaQZ1EjRuc6bVF7+QEdDfxV4sAQ
         vZVFZr4W0y/ronuNOgdsRxJaLfqe8GsUtJp2t0QNEMS0ha16Qz4tAg0cbDLWb8D2IIjz
         2rmNLN+F24WQ7U++d8WTSUUEDGhcx1jWS1fi16HcOK8DCAm67fjy9LDwTyMNb8SYJOX7
         0qeAUx4Ko7P07RfFCEe/3AcGZ27kSh2DEV5IdqdIz96WsqakavhIM2FIXWOJNc8/HOEn
         yJTg==
X-Forwarded-Encrypted: i=1; AHgh+RqTv23mb0aYDbCAugCmAamXF7ybuuht+boqhM+8dCZPPNI0x3yHpLVa5qaWUr1qJQ29uLZjX/19NvCsz8ZB+bo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxrXMOAG3y3JlAjcWATVJ6e/clGilOzaMyOcOoa1fv5Wx/Ow0pe
	ljqozaaWYNIcagIdex/5Bv8vTCsOIcJ8ATDqU+rNZ1Paj9LegGuNoj+25e8M9psAsXm53Htl5uf
	YqQlWSYuGbiwnPCZBUok8U1Ix0tK/W2R0QjqOhvHutOmKGfz+iv31CY78QpGAdazKfMdMykA=
X-Gm-Gg: AR+sD1138Qq/ET+vyRd1C/6CZIIMqCte5vOZflfOYiJaBdBk9QVKJ9m/GHoQ5lZSb7C
	tQx20tTLUerTqfnIoV4f/VJ/3NkAmZKHY+irCAT5ftqy/NteIOplB4QRbXacVtjy2MPRPnOqywA
	/i73/4f4eeptVljFNJhlRXiDIJw2IUpW19FZNBPuCSKs1kOSkKiVBwSKxZUXcfN7eiQAV1rLVwo
	ID4SIU6FLabcU/JuC8nmi+higcZTZn+QNV8FNmozrXlS1tndCqStm2F2ch57bJVwdxildvJFsR7
	B8zXsQSICoZiUHaAdbnNdI7PBQtIMUh+9lTtfNBqfqhDazYfsnxmz+oUgbAfvNON7uR4NUJaFWv
	vktUhAx6ex7xKHgjEHgqZHphoGLo9jQ==
X-Received: by 2002:ac8:5854:0:b0:52d:3ccc:968b with SMTP id d75a77b69052e-52d646b85b6mr26390351cf.9.1786529205382;
        Wed, 12 Aug 2026 03:06:45 -0700 (PDT)
X-Received: by 2002:ac8:5854:0:b0:52d:3ccc:968b with SMTP id d75a77b69052e-52d646b85b6mr26389931cf.9.1786529204950;
        Wed, 12 Aug 2026 03:06:44 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997c946ce1sm34512735e9.5.2026.08.12.03.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 03:06:44 -0700 (PDT)
Message-ID: <c8e4a3d3-a96d-4fd1-85a6-881e68385c83@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 12:06:40 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/4] firmware: Rename google firmware directory to
 coreboot
To: Julius Werner <jwerner@chromium.org>
Cc: Sean Rhodes <sean@starlabs.systems>, chrome-platform@lists.linux.dev,
        Corentin Chary <corentin.chary@gmail.com>,
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
        Thomas Zimmermann <tzimmermann@suse.de>,
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
 <64d82edc-87a0-47c7-8a17-f0d1c806a294@oss.qualcomm.com>
 <CAODwPW8B2-i4Ne-ZTVUM_H-EZwn2hoaC4joRhxNM=CREDd_aUg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAODwPW8B2-i4Ne-ZTVUM_H-EZwn2hoaC4joRhxNM=CREDd_aUg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA4MSBTYWx0ZWRfX+DZJKsI7IFmy
 zVyyjOJb3+XEgCWgWy1s8xkbGVZUnDb+ShkZfDIIX0h26Mr/FEzf+ctodAlqGw7XRKUcSYHUweT
 RppNZ+SfHEnSIl2Antsxt9Xbj4UFGBE=
X-Authority-Analysis: v=2.4 cv=evHvCIpX c=1 sm=1 tr=0 ts=6a7c45b6 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=WubhEmtZWPFaE_0rBY8A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: kr1N2y6gQXKAQwS5TTIDtL1puEpTNb-V
X-Proofpoint-ORIG-GUID: kr1N2y6gQXKAQwS5TTIDtL1puEpTNb-V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA4MSBTYWx0ZWRfX1Kj4HmF5rO2m
 7YAEgP8E0SBWSqr4M3QEqPfQ3o25nnRbFCAI6e2qBVuuaM/FxL4J/5mdv8h+dktiIPfNNJvJ91l
 cA+r8dHcQXRgxUGQsv55S0WEdauq3pvocWvM94fHJUKsJrTKwt/840VaQLgOWKkqsP1QrKHjPPO
 cBPOMRbBo0c2P7aexCy3UyReqfUxB1FfloWvGSSfKdPC4baUbU8mRuc9dQNQk6CFpnFZJiz5PyK
 Dk+DgM1K2OBjQyWxN7SQcPlfdEfOeXvYrQdP2uDajmOLIr45sgJUzVtQVq6BjH1bqM6AHEAjZqR
 aj2f2xsJSRgYsMUA/nBXLLsG0wpPm9ojvqNn74qxU/QmSnPAhKhTE6KErGkoNFfdVYrApEhylAD
 mPvRcyzZZWPsZyDuswhRwe8MFkkYHY6wXbJoCECIcOD1Oftv+shG4oKVi0bNVhE2kyo+bJLjCk9
 Rv285o2WXoqOSkcpmjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120081

On 11/08/2026 22:21, Julius Werner wrote:
>>>>> Do not change this.
>>>>
>>>> I am surprised that such change appeared at v10.
>>>>
>>>> Changelog is quite incomplete and I do not see any explanation for this.
>>>
>>> Sorry, don't follow - so put the names back, or split it into its own patch?
>>
>> I did not find explanation of this in the changelog. It cuts at v9, so
>> maybe that's the reason, although lore pointed me the v10 as the first
>> version introducing new CONFIG symbols.
>>
>> Anyway, IMO renaming is really not worth if the sole reason is Google
>> name is disliked now.
> 
> Krzysztof, the idea with this change was to introduce the new Kconfig
> symbols that more accurately represent the new directory structure
> while keeping the old symbol names available as fallback symbols for
> people who continue using old .config files. Doesn't that avoid the
> pain to users you're concerned about? I thought doing renames like
> this cleanly was the whole point of the `transitional` feature in the
> Kconfig language. Why do we have that lever if we don't want to use it
> for the kind of cases it was meant for?

To me 'transitional' is when you actually make changes to drivers, their
dependencies or to whatever Kconfig hierarchy is there.

I do not consider marketing or pure "I do not like this name" as valid
reasons, because this is developer string (or kernel/distro
configurator) not end-user visible thing. And for us, the developers,
this marketing does not matter.

Anyway, defconfig change must be separate because it goes via different
tree, unless this is non bisectable. Keeping it here initially confused
me into thinking you are actually breaking use cases (which you are not).



Best regards,
Krzysztof
