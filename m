Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2EA44C642
	for <chrome-platform@lists.linux.dev>; Tue,  4 Aug 2026 11:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785841348; cv=none; b=Th+9BW7pOiSnq7FQZHrvLzIZbq46g5KtSjDxj5ARgXr19Zyhn5Tc/537IFCZ4gf6r/4EstkHhkzpgCycHZBXO7bvGhuaTtnmWLvtfh3AYJy13HOYsoRrsXFCwR2xqMMh1VnIxqtaUmOwyOCSSb5n1+F77yR7GVXm6XeQM3aQcD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785841348; c=relaxed/simple;
	bh=BrP+m8z5UArtroO9vy4VYaIMSvWxpgz0IUCt5aZIcwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hOxV1fG2/rkP4EI2bT1m0x+r38kJlFaMoyOmN3lv/T6sCkfquReD9WwpATSXjYM618bLaFAXHertDfPudHxto31KphVEpgLG9cADVFM5tp6Bkemd/4EJqnKs0jTAyMl4eE3IWDs6rKJE3mvGQUA6TIOtjyyqhvJqP1XRA4wv564=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fmM9yrRg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=flXQSzuz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fmM9yrRg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="flXQSzuz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748CKXx3373831
	for <chrome-platform@lists.linux.dev>; Tue, 4 Aug 2026 11:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7VQIegxZjpPZ3YspDwqcWiPpjE3RowqNYy4IxabijtU=; b=fmM9yrRgfGUbBYc+
	GdXUwXlKzkpSpmM9aw1kTRMroowBL5dT1HzBFha2cgXrgzZk3d50a/R3NFiP5WU1
	F2GK9+BuXXUeJgVtVqZdwxOG9UGLetg+QKjvY0fD85aIw02RNTV6nK0AUHG0JkY1
	w7aS+7/iM7m+3nKfc350hlMyPywq1gviJNA2A3bvFj7b/ZJ7w0fT3oOCe90W0NUN
	mZawIlwhSBiS2yusR5s7OY+wQ9U0p5EUP9rJ+J63A/jHhfeVkG0u4GX+BUhb3A2m
	owEm3ZdRlryoTM7RsIt8e6P69rrMXL3v8K+9Nhr/jBlMyg8i6xLSqjAbp7qGRFVP
	WE/foQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty3r3ugn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Tue, 04 Aug 2026 11:02:24 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c3842c4ab1so3577203e0c.0
        for <chrome-platform@lists.linux.dev>; Tue, 04 Aug 2026 04:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785841338; x=1786446138; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7VQIegxZjpPZ3YspDwqcWiPpjE3RowqNYy4IxabijtU=;
        b=flXQSzuz7ew96n4T/fPI1mtZlgOiPR89JZCHiNB2YthH/+tibDp70IcJmjguwAVpP4
         ktuNSAVdO7Hzeb4xZPyAiIv3OS+SATUZXUwuWgXJpNofQ4QRcecMUCBNNYtzdODLLywH
         eWI+FqxxMmrgQpqTT8Gq1mQQjuvgsWEJXNi3B5Mf9KBUPXbEHV2J8GYSwV2RAckJ/eTF
         j57Y53NblHLQqY0QFE8PjGTxUbW3rf945rcR/8+pqviZ3BesPgJiq7UA5eYMr/D+jNpR
         wkBex+WvSWJjUadkyg9E9hAv4jvsAVRzvwLylk28tOvzPKDuztnpDEC0WRHuvzsTS/Kd
         f9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785841338; x=1786446138;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7VQIegxZjpPZ3YspDwqcWiPpjE3RowqNYy4IxabijtU=;
        b=YaruhOszbvpddk1edmLlQiyOzWOORVcAAbs6/9NT1U96E2TbBDX1Y3zKAWq9RspSAv
         4bHyQJry5nSQjlY1EpgIFSyrnegGVl6KjHzVKuUimwnAuE6G52g3/r85KOP5FoBWeYki
         lNihh9mHzbQxcBElTczdlqUUIYlFPjsc4OQ5726GqGi7x1CwXb+ZBArO0iva0AYVRuYz
         L2sZoS35njMkgrNXw7pOS5wJNr0GEvxu0Q/381O+vsIBuAUvRaA5D7fg5kXXu+iKWFbI
         5RNwPsHkHBuKvemUBuyLRbG6WO0MEzgzmfUwy01/ZcY+InTBDzGJHUCxpOHfw++dXzTs
         dl3w==
X-Forwarded-Encrypted: i=1; AHgh+RquDwtMDeC70q+g688dQuX2gUfG6KO0nxsEFl95Ca8Nvb9aR41//4MNhA/f1PPyLoEZFFEhKe6fUcQiCO35D+E=@lists.linux.dev
X-Gm-Message-State: AOJu0YzLL8mi++kI+W7MxiLdpL0Bvithk00B/O68LA8YdKW7lmRWRNeM
	KZH+CxErzHsF0fswM4HfhbJh/yA6/Ypc5UTDRZsckLQ+sn/uaf4zzCTi+FOjJgNFb/ywztunskb
	rqWoEP7m7eX9g+IQ9v76+y8672Kga8YNld7rrqSqmXblizDc0hEricNTkzMgqW21YX4fOZeA=
X-Gm-Gg: AR+sD12n7M3qMEHYXIVradSJ6IIpqPwl3meVKGMn/caTE5dV2hfYZeJbiCIUbgkhLOx
	Q8CrRpdpBoQk3cCn2aWusxvQFa1mFExnMk3jHFwmcn10LqtSvbbZtkQNt+GwN58MZI7BEBifAyl
	kjzTRqMONXCMuKjBqHajnNKAUlXvU5sXsho1v7tm72tjiYkKe88eWUNJ+ZOs072sFpwheLVyk2i
	5TkuvxuXPLiG5H+veQoI0l9WFtHmbMYBHdfBnnyUxyJQqDu2YNsK8WOme9q9MnNFJJglzx/oIuE
	rsI07aQHAEqGnavjDwtsw+Vcfc9lrTmCQJiAJYRpP5O/qck3/5FQTzTZuikkewo2zV1WwTOpcYl
	+oj5kfzYtBDISkTEhloLxWD1ts2O9qQ==
X-Received: by 2002:a05:6122:c94:b0:5c2:c0de:d291 with SMTP id 71dfb90a1353d-5c3878dbb3amr4934714e0c.9.1785841338432;
        Tue, 04 Aug 2026 04:02:18 -0700 (PDT)
X-Received: by 2002:a05:6122:c94:b0:5c2:c0de:d291 with SMTP id 71dfb90a1353d-5c3878dbb3amr4934622e0c.9.1785841337942;
        Tue, 04 Aug 2026 04:02:17 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b9441csm311773765e9.4.2026.08.04.04.02.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 04:02:16 -0700 (PDT)
Message-ID: <e0d2a22e-a0cd-4a71-82c4-b88abcc7456e@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 13:02:11 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/4] firmware: Rename google firmware directory to
 coreboot
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <6f65c9869714188539f2890aef6cf30e7bd2edcb.1785838269.git.sean@starlabs.systems>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=caPiaHDM c=1 sm=1 tr=0 ts=6a71c6c0 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=oilz1mZvSc2HNm1MEWQA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA4NyBTYWx0ZWRfX91/MA6ScMIXQ
 bGh+y6hpHTEJD+eL0fb8e04dwHNaKwhPZ04B7RbTwSyTDpThmXyQU5nKxwMMHFABmKTkSoVDPmO
 mBnGCnWyRXHGIXc1M5ACgGtTX06/thM=
X-Proofpoint-GUID: BRQ8CPoRdgj4iriy2BWFFN2T7noetNcl
X-Proofpoint-ORIG-GUID: BRQ8CPoRdgj4iriy2BWFFN2T7noetNcl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA4NyBTYWx0ZWRfX8WlDGUmgAqIj
 Jt8BYc0xMgpiCxfYuB84RGXdI/ixjJgjepwX7opL+bVS9Uiqv2Qx6ygbPNp9U3zbSYqJfwLln07
 bkUWduircDah5CLZZjQqNIVv+sXLuyjFZjqbWtTKze/ZQycV75DfVshn9KyFZiwNvXxHjmCGYbL
 iGnBoz1DlcBWgl1XG0nCWwhxzCPATp9ueBfNs6hvozFysxITeQsKvTvzsFYoinXj5CK7Wuv02c1
 A05COEnUGm+Up33nuN0dnTNNaog8sKiObrVwBquC2an0tt96ajpWoekLMIZXNl++qRqEgp4gGkb
 6B6VuM1WsxEYtHbaTqlFZZNrNjBUz12wxgvR/vmAdZ8cwlr29kQvR6giFjSyn7vx8KIQdNh9lWZ
 Uz6FouvTwviymyBYN6pGs8bObpnjLKHQNvKZVBORhQF4sStr1ZZ707CFothMK9CvDXV1yGXh/MO
 aF6oi4fteirOX99JjsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040087

On 04/08/2026 12:13, Sean Rhodes wrote:
> rename to drivers/firmware/coreboot/Kconfig
> index b78c644fa253..d273bd836245 100644
> --- a/drivers/firmware/google/Kconfig
> +++ b/drivers/firmware/coreboot/Kconfig
> @@ -1,13 +1,16 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -menuconfig GOOGLE_FIRMWARE
> -	bool "Google Firmware Drivers"
> +menuconfig COREBOOT_FIRMWARE

As pointed out by defconfig change, which is supposed to be separate
commit, this will affect users of the kernel for no real gain.

Do not change this.

Best regards,
Krzysztof
