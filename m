Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BC26FE07
	for <chrome-platform@lists.linux.dev>; Thu, 14 Mar 2024 14:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710426921; cv=none; b=khfEOgYaOa4VvnOo06p7GgvwUgOvqfCbJ5FAc1sTTshtIwwNCeWe8pN3aHZkpQmlxF+j5Prp+XLQ0oK9XYmlDdCYwLuPgCtfHNd6qKBAnWrv6woIN1MK+jSu5s9D4GhHqulCWuHv6/01m5V0GmXQKSRdcToMeU/ZRso6N/gjY3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710426921; c=relaxed/simple;
	bh=AknrWmWDD8i+Y7dd/gPMPigxGYow5u8RUdyw7tjVfZI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=CuDWFS7pIV0Eso54YuzuetNmSreWlBbX7vZAmh54Lp+3N16S2jlSC1fhQ00bI8I2io1BVOCOqnjSXFozG+mULvP2MXG+7cLkw91utJ5wYYu/Mmpxi02ItVWzuBbPiPUQ8QBAuteDipIsuX6aM1FyefeDrJaKqmlkbZ74QLIbMak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YZ58CP5K; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YZ58CP5K"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-33ecb04e018so251987f8f.1
        for <chrome-platform@lists.linux.dev>; Thu, 14 Mar 2024 07:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710426918; x=1711031718; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mlfXWz2bHcMeceXPmCS8ZEw2z1gMzt2SLSx+N4MGu4M=;
        b=YZ58CP5KlE/U4jK1cVuWds+J49+pyhKwOi3CJA6HlDJlV+n0VkVJh+dYyBAVBIzSE4
         QH1rAPr69XWx2ZiE2MUbZsmK9YKmgj3qJRxxYqC6SET1L6TrPKrhKcCUHhTsUiWVdRup
         5Ig0QX4A0pe+L9MKAAHNv6m+HSTi1yn/4xFGaGXz1xMiUFhnBkwfHw/4qMM7ibMujLh4
         LapmXZT4DynCqD6bUHDNzmrWKB/+HH1hIt3NSHm3+Br8MW900pewIb/Q82Q8/mDKFSXq
         kpvNBXewjdJG1PKBUGa1dXhGhXqNLTQeACisyf/M27w9bDaWAyWoaQ7W//ZxViBIHI0T
         IX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710426918; x=1711031718;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mlfXWz2bHcMeceXPmCS8ZEw2z1gMzt2SLSx+N4MGu4M=;
        b=dA3YtgKp9cOu3eDVIg/bfJ8Kql/aego3pqWlv0xi+DkG8jLjya2hTrRzQgu8h4iVSA
         wrJG/MyCCulaW+IiZXgDBzV/d5ufoJhmQgT135E4Ta7KuZZQxqpXotI7UGAlVlbK98Uv
         JQebgOU8mmwIyjG8ibSfWh37/SAUUUNwR5UXXdRIs0Argt3BNrA2/LJshobKFN4Rv/5D
         fNN5R8+28krb8+5WJaiWKy4M3gIz/2s/8LlUUT3MkBqelrFi5pjpH4CG5MulNJ7DrpL+
         YSUjczEypT0SIJxv9uD7mwMgIv6++b3PG9Gl/l3WSpWJWbTYecKw432EP6WfhmHvFSdf
         6MVA==
X-Forwarded-Encrypted: i=1; AJvYcCVaan13Y+IonWq56p8N/+vFqw1hlOLEPyz0+LvasbSNaFuYKNkGD3JA7QtLy/Gb8rXy4Vz7ES2k4xTy5Kkcu4VDMEpESW9n7tn/Kh0wngtY
X-Gm-Message-State: AOJu0YxGRSQ+cl8mMkZW3aeQweco8Oe82C1gF3wigAAWQkTLCadfSqun
	YsLGP/CUsquydgDiDlKoP17u42WPsRR2FJq0z6CmL35F6Ey7fBxlxnotRnHqYVY=
X-Google-Smtp-Source: AGHT+IHnbAtEB8fZkJ1NYRXHqIQKiPIKagRXRe3HFnoWOZuEMo8a6yhPPUxxt4o30LCM7sIZJ4Op+g==
X-Received: by 2002:a05:6000:d01:b0:33e:9f65:3b62 with SMTP id dt1-20020a0560000d0100b0033e9f653b62mr234671wrb.49.1710426917814;
        Thu, 14 Mar 2024 07:35:17 -0700 (PDT)
Received: from [192.168.1.78] (host-92-17-96-232.as13285.net. [92.17.96.232])
        by smtp.gmail.com with ESMTPSA id a13-20020adfeecd000000b0033ec94c6277sm871235wrp.115.2024.03.14.07.35.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 07:35:17 -0700 (PDT)
Message-ID: <a5eac9d5-1e88-4d7a-b8e8-677f6d116782@linaro.org>
Date: Thu, 14 Mar 2024 14:35:16 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] dt-bindings: qcom: Update DT bindings for multiple
 DT
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
To: Amrit Anand <quic_amrianan@quicinc.com>, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kernel@quicinc.com, peter.griffin@linaro.org,
 linux-riscv@lists.infradead.org, chrome-platform@lists.linux.dev,
 linux-mediatek@lists.infradead.org, Simon Glass <sjg@chromium.org>
References: <1710418312-6559-1-git-send-email-quic_amrianan@quicinc.com>
 <1710418312-6559-3-git-send-email-quic_amrianan@quicinc.com>
 <f6f317d9-830d-4c38-998f-b229b3d9f95a@linaro.org>
In-Reply-To: <f6f317d9-830d-4c38-998f-b229b3d9f95a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 14/03/2024 14:20, Caleb Connolly wrote:
> Hi Amrit,
> 
> On 14/03/2024 12:11, Amrit Anand wrote:
>> Qualcomm produces a lot of "unique" boards with slight differences in
>> SoC's and board's configuration. For eg, there can be SM8150v1 on MTPv1,
>> SM8150v1 on MTPv2, SM8150v2 on MTPv2, SM8150v2 on MTPv2 with a different
>> PMIC, SM8150v2 with no modem support and so on. For instance, suppose we
>> have 3 SoC, each with 4 boards supported, along with 2 PMIC support for
>> each case which would lead to total of 24 DTB files. Along with these
>> configurations, OEMs may also add certain additional board variants. Thus
>> a mechanism is required to pick the correct DTB for the corresponding board.
>>
>> Introduce mechanism to select required DTB using newly introduced device
>> tree properties "board-id" and "board-id-type". "board-id" will contain
>> the list of values of "qcom,soc-id", "qcom,board-id", "qcom,pmic-id" or
>> "qcom,oem-id". "board-id-types" contains the type of parameter which is
>> entered. It can be either "qcom,soc-id", "qcom,board-id", "qcom,pmic-id"
>> or "qcom,oem-id".
> 
> Thanks for working on this, it's nice to finally see this logic
> documented in the kernel.
>>
>> Qualcomm based bootloader will use these properties to pick the best
>> matched DTB to boot the device with.
>>
>> Signed-off-by: Amrit Anand <quic_amrianan@quicinc.com>
>> ---
>>  Documentation/devicetree/bindings/arm/qcom.yaml | 90 +++++++++++++++++++++++++
>>  1 file changed, 90 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index 7f80f48..dc66ae9 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -1100,6 +1100,76 @@ properties:
>>        kernel
>>        The property is deprecated.
>>  
>> +  board-id:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
>> +    minItems: 2
>> +    description: |
>> +      Qualcomm specific bootloader uses multiple different identifiers
>> +      (qcom,soc-id, qcom,board-id, qcom,pmic-id, qcom,oem-id) to select
>> +      single Devicetree among list of Devicetrees. For different identifiers,
>> +      the selection can be done either based on exact match (where the
>> +      identifiers information coming from firmware should exactly match
>> +      the ones described in devicetree) or best match (firmware provided
>> +      identifier information closely matches with the one of the Devicetree).
>> +      Below table describes matching criteria for each identifier::
>> +      |----------------------------------------------------------------------|
>> +      |  DT property  |  Individual fields   |   Exact  |  Best  |  Default  |
>> +      |----------------------------------------------------------------------|
>> +      | qcom,soc-id   |                                                      |
>> +      |               |  Chipset Id          |     Y    |    N   |     -     |
>> +      |               |  SoC Revision        |     N    |    Y   |     -     |
>> +      | qcom,board-id |                                                      |
>> +      |               |  Board Id            |     Y    |    N   |     -     |
>> +      |               |  Board Major         |     N    |    Y   |     -     |
>> +      |               |  Board Minor         |     N    |    Y   |     -     |
>> +      |               |  Subtype             |     Y    |    N   |     0     |
>> +      |               |  DDRtype             |     Y    |    N   |     0     |
>> +      |               |  BootDevice Type     |     Y    |    N   |     0     |
>> +      | qcom,pmic-id  |                                                      |
>> +      |               |  Slave Id            |     Y    |    N   |     0     |
>> +      |               |  PMIC Id             |     Y    |    N   |     0     |
>> +      |               |  PMIC Major          |     N    |    Y   |     0     |
>> +      |               |  PMIC Minor          |     N    |    Y   |     0     |
>> +      | qcom,oem-id   |                                                      |
>> +      |               |  OEM Id              |     Y    |    N   |     0     |
>> +      |----------------------------------------------------------------------|
>> +      For best match, identifiers are matched based on following priority order::
>> +      SoC Revision > Board Major > Board Minor > PMIC Major > PMIC Minor
>> +
>> +  board-id-types:
>> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>> +    description:
>> +       Each field and helper macros are defined at include/dt-bindings/arm/qcom,ids.
>> +    minItems: 2
>> +    items:
>> +       oneOf:
>> +         - const: qcom,soc-id
>> +           description:
>> +              Matches Qualcomm Technologies, Inc. boards with the specified SoC.
>> +              2 integers are needed to describe a soc-id. The first integer is the
>> +              SoC ID and the second integer is the SoC revision.
>> +              qcom,soc-id = <soc-id  soc-revision>
>> +         - const: qcom,board-id
>> +           description: |
>> +              Matches Qualcomm Technologies, Inc. boards with the specified board.
>> +              2 integers are needed to describe a board-id. The first integer is the
>> +              board ID. The second integer is the board-subtype.
>> +              qcom,board-id = <board-id  board-subtype>
This is a recursive definition. You partially described the individual
fields above, you should do that here.

What is DDR type? What information is encoded that doesn't make sense to
describe elsewhere in DT?

Same for "bootdevice type", why would you pick a different DT based on
whether the bootloader was loaded from UFS or NAND? Why does this
information belong in DT?
>> +         - const: qcom,pmic-id
>> +           description: |
>> +              Qualcomm boards can be attached to multiple PMICs where slave-id (SID)
>> +              indicates the address of the bus on which the PMIC is attached. It can be
>> +              any number. The model for a PMIC indicates the PMIC name attached to bus
>> +              described by SID along with  major and minor version. 2 integers are needed
>> +              to describe qcom,pmic-id. The first integer is the slave-id and the second integer
>> +              is the pmic model.
>> +              qcom,pmic-id = <pmic-sid pmic-model>

Same questions here, why don't you just walk the DT and read the
compatible properties of PMIC nodes?
>> +         - const: qcom,oem-id
>> +           description: |
>> +              Matches Qualcomm Technologies, Inc. boards with the specified OEM ID.
>> +              1 integer is needed to describe the oem-id.
>> +              qcom,oem-id = <oem-id>
>> +
>>  allOf:
>>    # Explicit allow-list for older SoCs. The legacy properties are not allowed
>>    # on newer SoCs.
>> @@ -1167,4 +1237,24 @@ allOf:
>>  
>>  additionalProperties: true
>>  
>> +examples:
>> +  - |
>> +    #include <dt-bindings/arm/qcom,ids.h>
>> +    / {
>> +         model = "Qualcomm Technologies, Inc. sc7280 IDP SKU1 platform";
>> +         compatible = "qcom,sc7280-idp", "google,senor", "qcom,sc7280";
>> +
>> +         #board-id-cells = <2>;
>> +         board-id = <QCOM_SOC_ID(SC7280) QCOM_SOC_REVISION(1)>,
>> +                    <QCOM_SOC_ID(SC7280) QCOM_SOC_REVISION(2)>,
>> +                    <QCOM_BOARD_ID(IDP, 1, 0) QCOM_BOARD_SUBTYPE(UFS, ANY, 1)>;
>> +         board-id-types = "qcom,soc-id",
>> +                          "qcom,soc-id",
>> +                          "qcom,board-id";
> Forgive me if this is a particularly cynical view, but this seems
> incredibly blatant, the "qcom,board-id" property is deprecated for
> various good reasons, just using a key/value map where "qcom,board-id"
> is a key doesn't change that. There are two main issues I have with the
> proposal here:
> 
> 1. This breaks backwards compatibility, millions of production devices
> with bootloaders that will never receive another update might be
> compatible with the downstream "qcom,board-id" property, but they won't
> work with this.
> 2. A top level board-id property that isn't namespaced implies that it
> isn't vendor specific, but the proposed implementation doesn't even
> pretend to be vendor agnostic.
> 
> U-Boot also has some ideas around this issue, there you can pass in
> multiple DTBs and provide some board specific "best match" function.
> I think there's definitely some value in exposing this information, but
> there's no good reason to define the same data as `qcom,board-id` while
> breaking production bootloaders.
>> +
>> +         #address-cells = <2>;
>> +         #size-cells = <2>;
>> +    };
>> +
>> +
>>  ...
> 

-- 
// Caleb (they/them)
