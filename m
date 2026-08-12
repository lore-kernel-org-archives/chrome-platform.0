Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB98D3BF692
	for <chrome-platform@lists.linux.dev>; Wed, 12 Aug 2026 10:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786529337; cv=none; b=dqKVol9/ffHqMIcV40Bo5QlYO1gOnHz2nSXrPjzlOxpnPki5pwK4CWcAsRUGCRs72RNKjlT29+5SWKWPS+eBmNSCsLmC1M7oDmjEOIyUo/8Xj/UHiz4KRj4MgpualTjsOryujdppPFv66aYcJFYmbTwrQM+OghZqkzEA7DAqGIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786529337; c=relaxed/simple;
	bh=cp49XHaRfrDqnDYoNs9YFT62ZnGM6id6uYMDIkqC4x4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=boZteOuabadk6gIyFLxJaFYaYPkx7qxwA+f8u7S0FsA9G7o1HtG3LTi4u2w4XzExleFhvksKUQx7UNkU0yHfJcCoLyDgx5mhqB9UkcOrlSe6D9VbLOLM2X+M4kxlaS28rVt6A/phelJoRXif3PWSyuKUQzXQ3tPM/8DaEX5zc1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W/tu1/Vl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QGa8V5pK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W/tu1/Vl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QGa8V5pK"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C9fvJ73357816
	for <chrome-platform@lists.linux.dev>; Wed, 12 Aug 2026 10:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mpmAQvf63WFWZ8A0PHDHvJxNSfZra1rqR63BiUT7B0E=; b=W/tu1/VlrSvlae9j
	HXVw2pO+K0bPd6C4A89ekThl6N4CzpnsWPQtZg0mLfT4a/G7WYJlP44emaSvhNjP
	5p7cZYNEinl2M2vQAh+jyYdY21xcLxFYf+VqeZNzO6C5nzcXzhWcG2wSYvQha8Yj
	0+QPBPSTR317GqqBHpkjEZIyh/feeba3o/suvjQh7I3/g8QTFlTv+ddqqZj80x3e
	BCoBlLkGab0BQTXoOB8j+HewEh8e8FsEQOcVYFYltBaxXiaY5si7+W0SfjYMGvhe
	eCvcLPfjDNsztY2tcTB3luWUtC+sIWitQo8BFL2FGg0fsmp7o8dsR8Lr0QibjFA7
	dr8dAQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hj1h9m8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Wed, 12 Aug 2026 10:08:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so71117185a.3
        for <chrome-platform@lists.linux.dev>; Wed, 12 Aug 2026 03:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786529334; x=1787134134; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mpmAQvf63WFWZ8A0PHDHvJxNSfZra1rqR63BiUT7B0E=;
        b=QGa8V5pKeHOIlMPPiztm1dlL9wAbQqT0T8VQ5rQkb75ndrr7aPaGG9coCAWYT3Bcmb
         mI9v+usq72HnqV2dZnJfjcX6uvVN6x03DYe4yd1+fTYiz5TCFisj7vtC4EhxSG4aprOP
         FtTpNeqQYkRTGdq/lAW8/PcW/VO6P1IQ5wXVcTjYn1aGtSx0OyzCuiEtNI44Eps5BKpf
         pA6S9QWWwQ7sxOOuTAbtDYh4CnP7WiWsMItoVuo9Hvd1zUuC3kKhj6gFH69HOy0cmiYZ
         RbEXVoe4+MIU2YkvOeCPtYVyvZErq0YEpNV68Wxwjw7bl7woH4CBO2FwuSoECromRNAN
         0UwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786529334; x=1787134134;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mpmAQvf63WFWZ8A0PHDHvJxNSfZra1rqR63BiUT7B0E=;
        b=XD2LMjrNiiAiyFs0ugpakoz3NpU8s69akhMpwsh5cUf+H7fo+tINuH9eHgirtPrkOQ
         1Cs5PFvO5Ajt0rZem86uBjUhvwtbkqg8KaaRJmq2qoZvvXpasTlXtUdMlqHEMe3Nmpls
         0UN0NTk9FZv2yp0GMoYffkZtDdx6QqgFOHnTEh5zJt2udzmJoUuiYn+2BXS0FeSWqLrj
         wlmBtbWCC4OVWmYk3UJ7xRUlo7XOXM44/iEbZLNOOyHYTfKqa+HNWJukVY9OhMmYRAUA
         I2Fb3QxJMW7iUDpjGG0uPdKoxOP2Fen1/gwa9d1KTyxQOecKrCsH9Uyo+myCyAJl7vpx
         VEPg==
X-Forwarded-Encrypted: i=1; AHgh+Rq3g1SXltFRIjYp2KfOrmD0eDe976g2+4kuGLKmNtVdRpbIhXbEPu+dIRde6IreMLghYaFcfsihL9Hojx08SJM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3XMJBYHxS1wWv5acW63iSiPUJ0C9OjMU2VX9dkYThs/InZBGD
	07G5FHEpb0CsZU6xJ70bNRRopNxuLbpvuEHVHdZ8YDGHRjJQsDpNKQkP+ZvqsiJ0O8QP/FOi58c
	gXRbMbx+qgwvJrrhBuz1fNXcfW9FYeWLTvDViFsr2Wb2MUxQzn/lIAGfkKSypn6Tot4rUw5Y=
X-Gm-Gg: AR+sD130+JrjXs4oi178ep0oYHfgBrz1Nsv1pShRxFKJyKrD9jOcbfiewdS0tt4W51V
	3ZnzRO7kaKkXq1IU2K0QXpoNPOKswdVNmW6Xqsz0acujDLHy2qK/N953Fnjlf5TvUr3pddumyBw
	OzJg+7RFOu915BBruV2YOvu95xRxY9u0v420NuSAGDo0zZdHxNqrDQbV4aw+JIhRyJX/J35KdUU
	QTI9ZmgrBb8TtBF/RB55UY5DogH9PCag96+lPc3i8+48sNom22vimZINB0AchtcoJRNsbDhPwTR
	D30uLxGYwTJZKhPWH7z8dpbFfUA2RIYL2tgPFwAfVNELeQAx4R3eFS8rJcfTOrNKEodKsm036BE
	5wGnoV/VSWt5+rP8oqRe2ftEt5ZJ6eQ==
X-Received: by 2002:a05:622a:5c09:b0:517:6d6c:187f with SMTP id d75a77b69052e-52d64719ec8mr31154021cf.14.1786529333727;
        Wed, 12 Aug 2026 03:08:53 -0700 (PDT)
X-Received: by 2002:a05:622a:5c09:b0:517:6d6c:187f with SMTP id d75a77b69052e-52d64719ec8mr31153361cf.14.1786529333276;
        Wed, 12 Aug 2026 03:08:53 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150d5dfadsm6433746f8f.29.2026.08.12.03.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 03:08:52 -0700 (PDT)
Message-ID: <c2bc1b2d-1191-4f1d-a627-626513993b6d@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 12:08:48 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/4] firmware: Rename google firmware directory to
 coreboot
To: Sean Rhodes <sean@starlabs.systems>, chrome-platform@lists.linux.dev
Cc: corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev,
        hansg@kernel.org, ilpo.jarvinen@linux.intel.com, prasanth.ksr@dell.com,
        jorge.lopez2@hp.com, mpearson-lenovo@squebb.ca,
        derekjohn.clark@gmail.com, josh@joshuagrisham.com,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dell.Client.Kernel@dell.com, florian.fainelli@broadcom.com,
        chenhuacai@kernel.org, mst@redhat.com, wenst@chromium.org,
        tzungbi@kernel.org, briannorris@chromium.org, jwerner@chromium.org,
        tzimmermann@suse.de, javierm@redhat.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@gmail.com, simona@ffwll.ch, andersson@kernel.org,
        geert@linux-m68k.org, dmitry.baryshkov@oss.qualcomm.com, arnd@arndb.de,
        ebiggers@kernel.org, luca.weiss@fairphone.com, michal.simek@amd.com,
        sven@kernel.org, u.kleine-koenig@baylibre.com, bhelgaas@google.com,
        dakr@kernel.org, o-takashi@sakamocchi.jp, titouan.ameline@gmail.com,
        kees@kernel.org, dri-devel@lists.freedesktop.org,
        oliver@liuxiaozhen.dev
References: <CABtds-3MAA8y5ksGcps6s-iLx8dOF7EoJEJH9079Y_E+-bJB4A@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CABtds-3MAA8y5ksGcps6s-iLx8dOF7EoJEJH9079Y_E+-bJB4A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Il4nILNdcH59P8WDp3W4CR0AsNiEx5PC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA4MSBTYWx0ZWRfX0ZvUfUMk4TRn
 pmWlBv2MyJAMtRjLBc+H3dkRc0JxSINy0trhVAMjSeRhiZw+f0Oc6bSYJbt+OVGwdPtTqbcg3I4
 rf7HFsUjJtxNu8UAzldav7ycE+3ZxL4Ih8mOG/Me9Rcs40gG7rbnMUCPicyHG+a3r1OkHIf3Yg2
 HMgU+pzJEKLifzOyXAeXcrNQ9tAR4dOyXz8hgeXwXbU16+/2tTzt8JuVDlxiuIDGuBb4ZHy+2GR
 B+WOjrrBU9OEUB4T/F/NpSlmE6+oxjfNuYIJGrflEdzcDObug+4oRA8x5ArOACAJxgaSRd8EvR4
 u9pDvDvv3DIw0M2aM3T8fzDK6kDRIJVZMHRraqlC8G9MOELvANj62WpD+7EpeFsII5nSKyOYEd+
 n46v6L85MI5wkRbZAYQqymMxR/IUT3vZfoIirXA1+yDpHvYYGJgvNZupe+qAe+4z8ykLOucX7m/
 iIIRsIJQhdZ4Pe0Cg+Q==
X-Authority-Analysis: v=2.4 cv=K6ES2SWI c=1 sm=1 tr=0 ts=6a7c4636 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=nDlYxSoMtbksMSfX03oA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Il4nILNdcH59P8WDp3W4CR0AsNiEx5PC
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA4MSBTYWx0ZWRfX4PzbMMtp/6l8
 kIg7bt81siAV2EOGFblp3IeWwXgtdny8jChUzvqYz9HSq1TiZFbVR2m0U/SB9+1GxWZMSmiKaWQ
 Sh4Ssh4iE6/GV6OA65KBWEygycxIS3c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120081

On 06/08/2026 22:28, Sean Rhodes wrote:
> Most drivers in drivers/firmware/google are coreboot table drivers rather
> than Google-specific firmware drivers. Rename the directory to coreboot
> and update the Kconfig prompt, build path and maintainer entry.
> 
> Keep the existing CONFIG_GOOGLE_* symbols to avoid user configuration
> churn in this mechanical move.
> 
> Signed-off-by: Sean Rhodes <sean@starlabs.systems>
> ---
>  MAINTAINERS                                                 | 4 ++--
>  drivers/firmware/Kconfig                                    | 2 +-
>  drivers/firmware/Makefile                                   | 2 +-
>  drivers/firmware/{google => coreboot}/Kconfig               | 6 +++---
>  drivers/firmware/{google => coreboot}/Makefile              | 0
>  drivers/firmware/{google => coreboot}/cbmem.c               | 0
>  drivers/firmware/{google => coreboot}/coreboot_table.c      | 0
>  drivers/firmware/{google => coreboot}/coreboot_table.h      | 0
>  .../firmware/{google => coreboot}/framebuffer-coreboot.c    | 0
>  drivers/firmware/{google => coreboot}/gsmi.c                | 0
>  drivers/firmware/{google => coreboot}/memconsole-coreboot.c | 0
>  .../firmware/{google => coreboot}/memconsole-x86-legacy.c   | 0
>  drivers/firmware/{google => coreboot}/memconsole.c          | 0
>  drivers/firmware/{google => coreboot}/memconsole.h          | 6 +++---
>  drivers/firmware/{google => coreboot}/vpd.c                 | 0
>  drivers/firmware/{google => coreboot}/vpd_decode.c          | 0
>  drivers/firmware/{google => coreboot}/vpd_decode.h          | 0
>  17 files changed, 10 insertions(+), 10 deletions(-)
>  rename drivers/firmware/{google => coreboot}/Kconfig (94%)
>  rename drivers/firmware/{google => coreboot}/Makefile (100%)
>  rename drivers/firmware/{google => coreboot}/cbmem.c (100%)
>  rename drivers/firmware/{google => coreboot}/coreboot_table.c (100%)
>  rename drivers/firmware/{google => coreboot}/coreboot_table.h (100%)
>  rename drivers/firmware/{google => coreboot}/framebuffer-coreboot.c (100%)
>  rename drivers/firmware/{google => coreboot}/gsmi.c (100%)
>  rename drivers/firmware/{google => coreboot}/memconsole-coreboot.c (100%)
>  rename drivers/firmware/{google => coreboot}/memconsole-x86-legacy.c (100%)
>  rename drivers/firmware/{google => coreboot}/memconsole.c (100%)
>  rename drivers/firmware/{google => coreboot}/memconsole.h (82%)
>  rename drivers/firmware/{google => coreboot}/vpd.c (100%)
>  rename drivers/firmware/{google => coreboot}/vpd_decode.c (100%)
>  rename drivers/firmware/{google => coreboot}/vpd_decode.h (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e6a8c271e79d..62ddee473f55 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11069,14 +11069,14 @@ S:	Maintained
>  F:	Documentation/networking/device_drivers/ethernet/google/gve.rst
>  F:	drivers/net/ethernet/google
> 
> -GOOGLE FIRMWARE DRIVERS
> +COREBOOT FIRMWARE DRIVERS

This is incorrectly placed now. All the entries follow strict
alphabetical order.

BTW, only this patch reached mailing list (and me):
https://lore.kernel.org/all/CABtds-3MAA8y5ksGcps6s-iLx8dOF7EoJEJH9079Y_E+-bJB4A@mail.gmail.com/

Best regards,
Krzysztof
