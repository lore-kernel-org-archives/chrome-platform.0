Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D90F1FBE8F
	for <chrome-platform@lists.linux.dev>; Thu, 13 Mar 2025 07:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741849821; cv=none; b=q7V1LWxDHFoo96sb6DbcdExgy83mt5yjPUmdoUxjc6sGqMBzY/BuJcx9TDvd6T7dYVW2tU4tqCKsutcpkfmAxbjPUkLT0AHvQPHiYZ3t1/S+KponlCoPe3NoTGF33ahE0Eg6uCf29TLNVABXKGCn6hTKGnQra1w6ZNVhXwivuuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741849821; c=relaxed/simple;
	bh=nudi+TGQps9XlV6V0TrOSaI78he7hxB5cdI2VNYI98s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SUBi9+f4DCo6Oer72k118c8NvgGmC7HS6+84oqvT5hle+Bh4Mtr7snGTOwj+e0APJg7EunnxSeKRGMbKFbCCzVdJ1y1mVC0Hwf8sA9DBKF3+AN3QNjE4isFoAsmIAY1ZF1UY5woztAKqJaEYCRQq4T6qwGeBNjmApLCgmTipNdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f9IS2YK9; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f9IS2YK9"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e4d18a2c51so107941a12.0
        for <chrome-platform@lists.linux.dev>; Thu, 13 Mar 2025 00:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741849817; x=1742454617; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TIPNMpgvaQACUq81WXkhf23EdKNGR/5Qd6zG9mSv7sE=;
        b=f9IS2YK9VNlPo5ROZi44yVcmj0R1ckpinvcZvYfu0r/Re+PFpCUeELogNQdVHdmx9I
         0pI/Mie9k/qfMWGwiHP+xnMQoETt/v86zmt5FxZiJ+rdkVeOmAx9qlLCRrHDEoWPSfNz
         C3PHtEuv2PLoJI24qqyH+Bc/NtImzeL+7TrO6+GI4LJ+L7HPEvzblaYVkQigcTnD+VUQ
         /ekw9/4Le/KZO2XoYAxpPk6KdbD4G1jt2gEOUZTDP+VvhXHykFLvGpUvRzSItTQfQujF
         EKSHtTmqLNGchAeJ209itwgD3zWg+wC90/GkQB3/em+mMpVHAvFZZenVJ5DDC57mnVF0
         QjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741849817; x=1742454617;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TIPNMpgvaQACUq81WXkhf23EdKNGR/5Qd6zG9mSv7sE=;
        b=rIOgm0Z5t/RKNAmLNHVC/X7rwdFI4NfWwaGCW8KjoCVeBtHR5/jUA7OCRY/7HLezNa
         daq2IA9RhHRn0sOEpSuPigteKv/580uj5dxCFmPLmn2L++t/7s5xa3BG8sZGLcwoBwMp
         LxOj5pnj+aBF4JCYLoNhX3SFBa9n+9X73E0PXRTEckBDIdo1k9KpADvPto9HzehmcODE
         aerg7npuj5uijwMPNDHz/l9lwzqVcxm4LyTbgQ0XZoPoj123Itrf9neqBFu9cGfOFlEZ
         nFoT3eduiWjJ+2RHJgrMAznU6W5MA2a5zPjwCXTFpYSUrb+wuDSrVu+hmUYBLqwyDpls
         zvIw==
X-Forwarded-Encrypted: i=1; AJvYcCW1a43BsFwIuvIl18SfNGdjc6Ee/AUaQPptJzQcX5jMcvhLq3n4A5HichyBH69yy4SuX6SxVzj8D6q+QZNPmgQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxP9UCSR2HXb9pC0LPG0clmjGsk02lzySEvsrDmgvVb4cU7M2Z1
	ZJtwXD0Tx8v5mg92WwkcQNU07kYQ/vWC0bk2zgzHaw7KJWaWtO+a5fuBSbKebvGUfK6C/vfc+gg
	P
X-Gm-Gg: ASbGncuWfhaTfi+yErWU9SMvUWH86iH9UInspzise6B+FBVv7feAUqcAS5cv6rZKO2X
	PRwg16yoe5ZBu2SdpOjV8cO8KMMx9PnTvhc5XHmu8NnVMti22/tKU2PYDr/bj9Mld836nzkXrV0
	EploH1o9mt7q1j98bv1LG9VWQxLIggWgv8F7ua5t2OdHYN6/cE3vpXWb/HIp7eeEiXMCcuYw/Y5
	o3FVGLXnW/t1KyPZxpiSJjDCLyXjm9c9xMJ7QxRZRrowHiqVqqfiib+N/Dl6h/d8sIrgnWzASk1
	IRMtNmAwGgVCns07NRi6c1cn83iuv5dGbwSkReFGgHTrHRsKQRwdrt50fudrdHw=
X-Google-Smtp-Source: AGHT+IHwNh8Lx8mi4327vSGxzOotD8FcetvPsnqbMqLzIH73o66Q5vduqsZMQbIghSXMFWU9TTgjQA==
X-Received: by 2002:a05:6402:268f:b0:5e0:36fa:ac1c with SMTP id 4fb4d7f45d1cf-5e75f983d16mr4935457a12.9.1741849817597;
        Thu, 13 Mar 2025 00:10:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e81692e67bsm402988a12.15.2025.03.13.00.10.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 00:10:17 -0700 (PDT)
Message-ID: <f6b84c52-b0f7-4ab4-b05a-dc78e1d7556f@linaro.org>
Date: Thu, 13 Mar 2025 08:10:13 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: Add cros-ec-ucsi to cros-ec-typec
 device tree documentation
To: Jameson Thies <jthies@google.com>, tzungbi@kernel.org,
 ukaszb@chromium.org, bleung@chromium.org, heikki.krogerus@linux.intel.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, groeck@chromium.org,
 swboyd@chromium.org, akuchynski@chromium.org
Cc: devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250312195951.1579682-1-jthies@google.com>
 <20250312195951.1579682-2-jthies@google.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250312195951.1579682-2-jthies@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/03/2025 20:59, Jameson Thies wrote:
> Add documentation for the cros-ec-ucsi device tree definition. Defining
> this node will load the cros_ec_ucsi driver which is used for USB-C port

Your patch does not do it at all.

> control on PDC based ChromeOS systems. Additionally, update mantainers
> list to reflect changes to the ChromeOS USB owners.
> 
> Signed-off-by: Jameson Thies <jthies@google.com>

You need to work on upstream, not downstream trees.

You CC-ed an address, which suggests you do not work on mainline kernel
or you do not use get_maintainers.pl/b4/patman. Please rebase and always
work on mainline or start using mentioned tools, so correct addresses
will be used.

> ---
>  .../bindings/chrome/google,cros-ec-typec.yaml       | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
> index 9f9816fbecbc..ab39c5280681 100644
> --- a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
> +++ b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
> @@ -8,17 +8,24 @@ title: Google Chrome OS EC(Embedded Controller) Type C port driver.
>  
>  maintainers:
>    - Benson Leung <bleung@chromium.org>
> -  - Prashant Malani <pmalani@chromium.org>
> +  - Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> +  - Łukasz Bartosik <ukaszb@chromium.org>
> +  - Jameson Thies <jthies@google.com>
> +  - Andrei Kuchynski <akuchynski@chromium.org>
>  
>  description:
>    Chrome OS devices have an Embedded Controller(EC) which has access to
>    Type C port state. This node is intended to allow the host to read and
>    control the Type C ports. The node for this device should be under a
> -  cros-ec node like google,cros-ec-spi.
> +  cros-ec node like google,cros-ec-spi. On TCPC systems, ChromeOS should
> +  use cros-ec-typec. On PDC systems, ChromeOS should use cros-ec-ucsi.

What does it mean? How is it related to description?

>  
>  properties:
>    compatible:
> -    const: google,cros-ec-typec
> +    oneOf:
> +      - items:
> +          - const: google,cros-ec-typec
> +          - const: google,cros-ec-ucsi

I don't understand at all why you are growing now this with fallback.
And if you tested your patch, you would see it does not make any sense.

NAK, test your patches before posting.

Best regards,
Krzysztof
