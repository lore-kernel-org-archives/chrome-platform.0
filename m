Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A4749551D
	for <chrome-platform@lists.linux.dev>; Wed,  3 Jun 2026 22:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780527555; cv=none; b=l+hikUY5Pc3CDjJ2LJk2qyr8l3NeX5BJSZhmirRZ1jzJDBPrBrlKu+mktTdrzcP6Ch/K3gL3BROJLxSlJFKVUvOuQDrx09llyuI8ZVICGj0VhHF0JLF/M6hVpkZ5E+aN+KhqEYqmLKSMsM5H2k6c0dBcvzzGEi1tmbHJlZyTCQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780527555; c=relaxed/simple;
	bh=RoiQDo2vHkOIYi8QYhXjdnc885eNLNOiDk6hnbsmcV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dyNwa5qmEqE9JxQ2Ea9C7mVKmW13UgonFXzElVeFGOU2KKyN9jPmv2OmwvU/aJK1sRk1Pb+145IQFYD3ArtMglAsjh8Gl0pODtkvjpLFjWN4t4RX95eszPuSY2lgeH3Vl7XcBcHsj2vkwOk0wvpLj9m8ZhlAT4I9soHm/WHQxCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JUsHQt0D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZfyggLfU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JUsHQt0D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZfyggLfU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653Leq9G3240997
	for <chrome-platform@lists.linux.dev>; Wed, 3 Jun 2026 22:59:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ONnM8cPGqCvQUEArvOdVRHLA
	7AjrNnYCfdYyBl3uu6Q=; b=JUsHQt0DxYLPJKgSTR9tREQC+/92i/jaL10JeZka
	jx+w7LeQXnnmF1WukUK+kcEWnvuxt/l+kFvuthhHCI4AaDnS76xdU7CZe4PJzwyz
	K4pbBszfCfx+alv7S7iFmtT9ExLdFXbo7XeJLWvND6VGIKR9I6rEOyaIC7iQ90Xg
	9iCkzFtDeVSeFE9jXjV05X+B3ZHU8eGLF3uNdxHjQ9Y5yb4DSJt1nRiG8no/6vX1
	96gpOiH9tdw6cUja413gftwtc/vaKQ+VyGGi+jsd9T/Go18S/qq31wYXJCMNU+uF
	jhitbT5yARcAW7GDcsEOVJ2x/bh93aalFtYzYhWqyr/g6Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejvd0872d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Wed, 03 Jun 2026 22:59:12 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9639f945fbbso56933241.3
        for <chrome-platform@lists.linux.dev>; Wed, 03 Jun 2026 15:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780527552; x=1781132352; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ONnM8cPGqCvQUEArvOdVRHLA7AjrNnYCfdYyBl3uu6Q=;
        b=ZfyggLfUBUmgJ6VNyhL0G7WpEADDRzkyrcKxJkbXn7rwpDbKvFI4nLIuF+OQvXUEOH
         oM7Aq9PM0IU6Mwq/4hgKyf7XLJ/ctfg6n6qMJVsMLIBwyYG/HmJVDhPF3/2P+NKnDGvE
         qH9z8YSWqUhnM6v201PHoAPT0m3mB46YAGaYSegVpZa8L52NL54jbLGJ1QTQcfkTdzij
         yoJH7Sj1KWaczMmmKo3TlWsF7EWgBOy/2zpSULEcVZvAuhPvswrj9ExcjusrwNypa9je
         XjTjVHHRS2veqyvnFrD0nM0i5/4c/A1ING1cUQvJDoRPH+X0EYMdjfF+DuADPmg/T0AH
         uggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780527552; x=1781132352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ONnM8cPGqCvQUEArvOdVRHLA7AjrNnYCfdYyBl3uu6Q=;
        b=oKznUhnJBNah56UNySHCflrNRZen3NoOLtSP7ugpZ3U6JdNFite3zJ125gUpVaNzIH
         mjxJcaTU3Avj8hSNoI+bk0X7foQnx5KwezzoZrehRlGiVClz5IV/oBiqT1iZC9oW8WMP
         jJrIPA03qi/LiRfmWhC69VhnBzGQANQIKLIf+x/N8cDyZ/rj6Lzf3SEcMUK8AJQLkGWK
         Zs92OQdA2cmGXNqjsIw8IJOZwBm7Epn1IPH4piYXipMSeAUpYkukcmfFk2ylMKCjs/vn
         xTmLZy5x2iK7Wy/Rz7xphIgtnTFde6ZAi7R4RS97WLg8AxHFTd6mwi4jTVQcqZ1Hurut
         KdEw==
X-Forwarded-Encrypted: i=1; AFNElJ9Vc5PWUv6SskbaE7lMfMuui8ZOX+cAY+nrpVyHvLUmua4/Up7kkt8i5NMbHiN6VK4xpin1keZbXCSP5mH3s64=@lists.linux.dev
X-Gm-Message-State: AOJu0YxnOp9Bq3984Ix2whJowJqAAvBOWhJSkQYZyG74v7wilVKs4Hil
	PTuE4O3gNbvJPuBFDLmlshkzsthvFPwZ/syIh+MhDDsCPrdW0p3vOgR3E3BSaMjAzaNWZMDJwFe
	iUxkN53cdvb90WHRGcbpfOlkKsq8Aa2jC8Cd25YBWNLEQzHPC1Lazf9BI5rFys74JE2niwvc=
X-Gm-Gg: Acq92OGxCt4hLqoKZxRSavAFUiPQpiXK3fNb4x3Q1KfpGEMgYBi8ihZ4pNNFWfJFcyL
	UhyGLibkMoUNSLBhLPsY8TDMJZKtgdYqul+MFHV11DayMacVwrcBhNySLxQf0DCrfIJ10wcF2sr
	+oaIPFDO2Ddy7bubYm2etd7Wu2cFCPP83HsHAkqPFAmRTgeHYo0ayd/RuRxuGXYigRthn0vRXda
	ZQYH+0mBaNbVAvgp2uqEiIhDbLQUqPUZezVjGMDDbL/oo8kyId9VCcAwLlRIbsjAcWBDja9LRpz
	8LZ2s7avFAkCF8TQaOCdOi9hOWO4cO9h87f0MR9bf6cJt1pa/lvYno/fdfcU/WVNN/ElhZB9rhe
	eMddE9XP+90inKW+QZrSD/1r6kdm0LPeXof9iRwzBxv0IDU5LLBYzN7r+jgvK/8RmkDHNq2omrb
	rdeSzdMRacv4rexSIACz8qGlokuuqSwQr3cdgyzdBGAGEqXw==
X-Received: by 2002:a05:6102:644b:b0:6d8:89a0:4ae4 with SMTP id ada2fe7eead31-6ec43376b39mr3216899137.18.1780527551689;
        Wed, 03 Jun 2026 15:59:11 -0700 (PDT)
X-Received: by 2002:a05:6102:644b:b0:6d8:89a0:4ae4 with SMTP id ada2fe7eead31-6ec43376b39mr3216884137.18.1780527551258;
        Wed, 03 Jun 2026 15:59:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97ac29sm880386e87.52.2026.06.03.15.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 15:59:08 -0700 (PDT)
Date: Thu, 4 Jun 2026 01:59:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-kernel@lists.infradead.org,
        Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
        linux-rockchip@lists.infradead.org,
        Julius Werner <jwerner@chromium.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: Add #{address,size}-cells to
 Chromium-based /firmware
Message-ID: <pfo7vpd3ooiyfuo3wjom7qzknnnkiyel2kdu5fjqqrq5nccysq@e63rs7lgdfl4>
References: <20260428200712.2660635-1-briannorris@chromium.org>
 <20260428200712.2660635-8-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428200712.2660635-8-briannorris@chromium.org>
X-Proofpoint-GUID: h8eq5D23rq5yU2Y-bWkCvUZTa3TwDDDC
X-Authority-Analysis: v=2.4 cv=M8h97Sws c=1 sm=1 tr=0 ts=6a20b1c0 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=1XWaLZrsAAAA:8 a=MUleZ9s-AAAA:8 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8
 a=iD_vE5mCeOLV2fS3_3cA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
 a=f0F4d6ZXEnSYrzQLsEx4:22
X-Proofpoint-ORIG-GUID: h8eq5D23rq5yU2Y-bWkCvUZTa3TwDDDC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDIyNCBTYWx0ZWRfX7LsVDNWLXlqi
 xewF7qPO6LcnpG5LV55Y1IFH5UIJKSxqcUTHrY8WItkrcD8R9W0h+WTw2IQKOM83fPWEzsnT5JL
 vPK6kE/2F/P3Zkq0U0M+C2kSQi8LPytV/OQRFTmwRd6gSKW+2kVOMOmxjj8YKndvROT994e6thV
 Vya6pKhlJxTMekF+jILNWFj0Ud0RrpetxpBfqLRacGYv/Ho0cSz4aOoROH+uCbYLnE8l/85zt9L
 OZZEmhO8eu7NrivikT5dkaFnLaALMJ+0squ1+bQQ542TjiwVnxkD/roEH0W1/7yyp1EyjJo0I0O
 E+RBHlv2mcqG2QZQ2CHVLWDyRDnZmvIAaShcPT9j6dRZgp09jG6Wlb3vpL8v7639qjBpPpfe4oS
 MNnaJvodfmm3nfNDtzlbsHgmKwmHlohx8A9qV3Z0dtceSoKH2yioYqCtsJFOQPBWwVSontVckL/
 w87mp+s8HknQmEToLiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030224

On Tue, Apr 28, 2026 at 01:06:59PM -0700, Brian Norris wrote:
> Chromium/Depthcharge bootloaders may dynamically add a few device nodes
> to a system's DTB under a /firmware node. A typical DT looks something
> like the following:
> 
> / {
>         firmware {
>                 ranges;
> 
>                 coreboot {
>                         compatible = "coreboot";
>                         reg = <...>;
>                         ...;
>                 };
>         };
> };
> 
> Notably, the /firmware node has an empty 'ranges', but does not have
> address/size-cells.
> 
> Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
> non-translatable addresses") started requiring #address-cells for a
> device's parent if we want to use the reg resource in a device node.
> This leads to errors like the following:
> 
> [    7.763870] coreboot_table firmware:coreboot: probe with driver coreboot_table failed with error -22
> 
> Add appropriate #{address,size}-cells to work around the problem.
> 
> Note that Google has also patched the Depthcharge bootloader source to
> add {address,size}-cells [1], but bootloader updates are typically
> delivered only via Google OS updates. Not all users install Google
> software updates, and even if they do, Google may not produce updated
> binaries for all/older devices.
> 
> [1] https://lore.kernel.org/all/20241209092809.GA3246424@google.com/
>     https://crrev.com/c/6051580 ("coreboot: Insert #address-cells and
>     #size-cells for firmware node")
> 
> Closes: https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/
> Fixes: 6e5773d52f4a ("of/address: Fix WARN when attempting translating non-translatable addresses")
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
