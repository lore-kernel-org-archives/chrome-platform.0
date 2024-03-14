Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AF46FE37
	for <chrome-platform@lists.linux.dev>; Thu, 14 Mar 2024 14:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710426550; cv=none; b=A+7EeTH3/Sdg//MD/LaRX8A52l8gF/JDkU+3iWdXpgynzjh0WtCxngqz3GPoqPaRb332xPhnDZ4UPk1NTj8W0JfpYPQqW49yIzVVxooKeAMWw2w0s0CWWmSuWYKBnO7PnJJGbxkALwzcw/fpUtJdvHhJeWjnA8d2AvFurrcn8RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710426550; c=relaxed/simple;
	bh=8onVvCRHALH8Z0t909CHM3Iguu/cKn1N8VI/tYUI8ds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CkMOSEru/lTbfrjUNTzHHKC1B+FYP1tKij/ZlhG2SR9Y1FJtHLCuEweBHzYECqlr6Zrdc8Pug2mxGsFJUzbTdgZEXCmS5BFGX+HEpRIOn4AP4FZ8ntw1/1SZLNVtw/2Molq2GGX9oJ3V1xQdAN/ZndG5XceIujvZWuh8a53HKMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PPFXX5yF; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PPFXX5yF"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-413f2366ef5so4396695e9.3
        for <chrome-platform@lists.linux.dev>; Thu, 14 Mar 2024 07:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710426546; x=1711031346; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vbWbnFqFcxqkfsdDIzVbGRGYMN0ey69wKPUvvi1/HTk=;
        b=PPFXX5yF75c8afkE1VvBWF09/zYs7/63q4ec7X6+qCB1VcIfQxg67n0ut4EqygJiKN
         sSPd9cZN73T6y/fsmVpo2ew3w1wQiC6s/kA9zlwisXEBFbW7xryLK70EZR6h2oek37iJ
         WY7HnRmqWH8p5dZpByL9HyfHIUoGy7nsm04AE2FkFCZ/l/n8LeBO4jD0UJmyDhscUe9p
         C7WBPfhyDT4g8myOBF2D69HQ9jF/R1uMPzk1Akho1E7VqTwVQ8O5LbGAzyBX0JmZn2qs
         P31Lhz3NiC0a84lav/u4WiZ8p+j0PsK80Sy4OK84L1ud28/xhwmJC6NkpKeR0ucEbmri
         zABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710426546; x=1711031346;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vbWbnFqFcxqkfsdDIzVbGRGYMN0ey69wKPUvvi1/HTk=;
        b=inX0g7lvoEJYwa4GUlT10mFvmaiWt2N9HpqzFm3jLojpfu1z/7PmIdb2ruKdF4/vxr
         /+EfbYhISpt8ZQ4zuYs/FFP84U6vdG6Yw+mA3J3Ng4t/ArU5XRYdQn4YggRhXOTAUIY7
         vKPblZ2ZoqEdl/irRETehgGOIKPe+4eoM+Q5dWX93vkiRcvPB6240IC9xppOg7L/b7Zv
         cKn8JUKofroqzg1h2sfmg9x5/9HScUulumZST5ZJ7yDPXi1Bz/9+k+mLEUgkdqhzO/g/
         mN6ZCEGT/2HQcPzxkKFQdOXnx8LZ0TKQjMKbRSoD54n2aA5/mDeZEaYWa5+wfda95NMB
         5b4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVxmRADk7SNMBeCZMsrEIh+lRXKwuzkiGqIoBYl5I5U/qzpM8Xh/X3B8owc/zoc6X3BUlSu7imfRYdx5tVYB1WSqsZ1z1N4/1gLVwBX6XhE
X-Gm-Message-State: AOJu0YyuFOaR9OLUXZRVx1DzQZjPL0iUOUGFYg0GJ6zhJijPVaq1v+i1
	1MW149IQhmo53VSDKFyhp8n4auXQRznq28QZeyL3RgigK9wNVmUN7V8aSttlKEk=
X-Google-Smtp-Source: AGHT+IEFJC3eV05L1hTDs8HZhZF3XOgLBa8DjaxZxdayetOHeSCXloemj3z/yiRwlOTgnlYdqt77rQ==
X-Received: by 2002:adf:e7ca:0:b0:33e:c9bd:c965 with SMTP id e10-20020adfe7ca000000b0033ec9bdc965mr1089990wrn.35.1710426546553;
        Thu, 14 Mar 2024 07:29:06 -0700 (PDT)
Received: from [192.168.1.78] (host-92-17-96-232.as13285.net. [92.17.96.232])
        by smtp.gmail.com with ESMTPSA id q2-20020a05600000c200b0033dedd63382sm854067wrx.101.2024.03.14.07.29.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 07:29:06 -0700 (PDT)
Message-ID: <9fdd04e8-cc7b-41e7-a099-055f39b3b462@linaro.org>
Date: Thu, 14 Mar 2024 14:29:05 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Update Devicetree
 identifiers
Content-Language: en-US
To: Amrit Anand <quic_amrianan@quicinc.com>, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kernel@quicinc.com, peter.griffin@linaro.org,
 linux-riscv@lists.infradead.org, chrome-platform@lists.linux.dev,
 linux-mediatek@lists.infradead.org
References: <1710418312-6559-1-git-send-email-quic_amrianan@quicinc.com>
 <1710418312-6559-2-git-send-email-quic_amrianan@quicinc.com>
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <1710418312-6559-2-git-send-email-quic_amrianan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 14/03/2024 12:11, Amrit Anand wrote:
> Update existing documentation for qcom,msm-id (interchangeably:
> qcom,soc-id) and qcom,board-id. Add support for qcom,pmic-id, qcom,oem-id
> to support multi-DTB selection on Qualcomm's boards.
> 
> "qcom,soc-id", "qcom,board-id" and "qcom,pmic-id" are tuples of two 32-bit
> values. The "qcom,oem-id" is a tuple of one 32-bit value.
> Introduce macros to help generate SOC, board, PMIC and OEM identifiers.
> QCOM_SOC_ID and QCOM_SOC_REVISION can be used to generate qcom,msm-id.
> QCOM_BOARD_ID and QCOM_BOARD_SUBTYPE can be used to generate qcom,board-id.
> QCOM_PMIC_SID and QCOM_PMIC_MODEL can be used to generate qcom,pmic-id.
> QCOM_OEM_ID can be used to generate qcom,oem-id.
> 
> Add entries for different types of SoC, boards, DDR type, Boot device
> type which are currently used by Qualcomm based bootloader.
> 
> Signed-off-by: Amrit Anand <quic_amrianan@quicinc.com>
> ---
>  include/dt-bindings/arm/qcom,ids.h | 86 ++++++++++++++++++++++++++++++++++----
>  1 file changed, 77 insertions(+), 9 deletions(-)
> 
> diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
> index f724834..dc24151 100644
> --- a/include/dt-bindings/arm/qcom,ids.h
> +++ b/include/dt-bindings/arm/qcom,ids.h
> @@ -8,9 +8,14 @@
>  #define _DT_BINDINGS_ARM_QCOM_IDS_H
>  
>  /*
> - * The MSM chipset and hardware revision used by Qualcomm bootloaders, DTS for
> - * older chipsets (qcom,msm-id) and in socinfo driver:
> + * The MSM chipset ID (soc-id) used by Qualcomm bootloaders,
> + * and in socinfo driver:
> + * where, "a" indicates Qualcomm supported chipsets, example MSM8260, MSM8660 etc
>   */
> +
> +#define QCOM_SOC_ID(a)  ((QCOM_ID_##a) && 0xffff)

How is QCOM_SOC_ID(SC7280) ever better than QCOM_ID_SC7280? What does
this mask give you? It's going into a 32-bit field and not being OR'd
with anything else...
> +
> +
>  #define QCOM_ID_MSM8260			70
>  #define QCOM_ID_MSM8660			71
>  #define QCOM_ID_APQ8060			86
> @@ -266,16 +271,79 @@
>  #define QCOM_ID_IPQ5302			595
>  #define QCOM_ID_IPQ5300			624
>  
> + /* The SOC revision used by Qualcomm bootloaders (soc-revision) */
> +
> +#define QCOM_SOC_REVISION(a)		(a & 0xff)
> +
>  /*
> - * The board type and revision information, used by Qualcomm bootloaders and
> - * DTS for older chipsets (qcom,board-id):
> + * The board type and revision information (board-id), used by Qualcomm bootloaders
> + * where, "a" indicates board type which can be either MTP, QRD etc
>   */
> +
>  #define QCOM_BOARD_ID(a, major, minor) \
> -	(((major & 0xff) << 16) | ((minor & 0xff) << 8) | QCOM_BOARD_ID_##a)
> +	(((major & 0xff) << 16) | ((minor & 0xff) << 8) | ((QCOM_BOARD_ID_##a) & 0xff))
> +
> +#define QCOM_BOARD_ID_MTP		0x8
> +#define QCOM_BOARD_ID_LIQUID		0x9
> +#define QCOM_BOARD_ID_DRAGONBOARD	0xA
> +#define QCOM_BOARD_ID_QRD		0x11
This replaces the previous definition of QCOM_BOARD_ID_QRD which was
decimal 11, now you're defining it as hex 0x11? I'm guessing this was a
typo.
> +#define QCOM_BOARD_ID_ADP		0x19
> +#define QCOM_BOARD_ID_HDK		0x1F
> +#define QCOM_BOARD_ID_ATP		0x21
> +#define QCOM_BOARD_ID_IDP		0x22
> +#define QCOM_BOARD_ID_SBC		0x24
> +#define QCOM_BOARD_ID_QXR		0x26
> +#define QCOM_BOARD_ID_X100		0x26
> +#define QCOM_BOARD_ID_CRD		0x28
> +
> +/*
> + * The platform subtype is used by Qualcomm bootloaders and
> + * DTS (board-subtype)
> + * where, "a" indicates boot device type, it can be EMMC,
> + * UFS, NAND or OTHER (which can be used for default).
> + * "b" indicates DDR type which can be 128MB, 256MB,
> + * 512MB, 1024MB, 2048MB, 3072MB, 4096MB or ANY 
> + * (which can be used for default).
> + */
> +#define QCOM_BOARD_SUBTYPE(a, b, SUBTYPE) \
> +	(((QCOM_BOARD_BOOT_##a & 0xf) << 16) | ((QCOM_BOARD_DDRTYPE_##b & 0x7) << 8) | \
> +	(SUBTYPE & 0xff))
> +
> +/* Board DDR Type where each value indicates higher limit */
> +#define QCOM_BOARD_DDRTYPE_ANY		0x0
> +#define QCOM_BOARD_DDRTYPE_128M		0x1
> +#define QCOM_BOARD_DDRTYPE_256M		0x2
> +#define QCOM_BOARD_DDRTYPE_512M		0x3
> +#define QCOM_BOARD_DDRTYPE_1024M	0x4
> +#define QCOM_BOARD_DDRTYPE_2048M	0x5
> +#define QCOM_BOARD_DDRTYPE_3072M	0x6
> +#define QCOM_BOARD_DDRTYPE_4096M	0x7
>  
> -#define QCOM_BOARD_ID_MTP			8
> -#define QCOM_BOARD_ID_DRAGONBOARD		10
> -#define QCOM_BOARD_ID_QRD			11
> -#define QCOM_BOARD_ID_SBC			24
> +/* Board Boot Device Type */
> +#define QCOM_BOARD_BOOT_EMMC		0x0
> +#define QCOM_BOARD_BOOT_UFS		0x1
> +#define QCOM_BOARD_BOOT_NAND		0x2
> +#define QCOM_BOARD_BOOT_OTHER		0x3
> +
> +/*
> + * The PMIC slave id is used by Qualcomm bootloaders to
> + * indicates which PMIC is attached (pmic-sid)
> + */
> +
> +#define QCOM_PMIC_SID(a)		(a & 0xff)
> +
> +/*
> + * The PMIC ID is used by Qualcomm bootloaders to describe the ID
> + * of PMIC attached to bus described by SID (pmic-model)
> + */
> +
> +#define QCOM_PMIC_MODEL(ID, major, minor) \
> +	(((major & 0xff) << 16) | ((minor & 0xff) << 8) | (ID & 0xff))
> +
> +/*
> + * The OEM ID consists of 32 bit value to support OEM boards where they
> + * have slight differences on top of Qualcomm's standard boards
> + */
> +#define QCOM_OEM_ID(a)		(a & 0xffffffff)
>  
>  #endif /* _DT_BINDINGS_ARM_QCOM_IDS_H */

-- 
// Caleb (they/them)
