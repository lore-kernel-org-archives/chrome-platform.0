Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95F738F622
	for <chrome-platform@lists.linux.dev>; Mon,  2 Mar 2026 09:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772444222; cv=none; b=gUJD+hAg38dK/wvj7T7u5BFsi0n6QxtwUax1DaPaMzQGvvdb4YisYRQoZoShihCvQR15rElzhhLCoL5NcdYSkt2cWPClvqIO1ReMUkeEKps11JvMNlK2WyZwhLyAVuIfO5gTJV/ITComeTo/aE2hKtXjJmXZetEep4B0wJVVDpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772444222; c=relaxed/simple;
	bh=/NOp8y06KChdk8LJ/vG6dQWQel7PeHlNho48yaYgYOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qCUf500BX6Zs+rAmqQ4eiQaBxhBj0M8zUqWkxZNqyJZ984NdK6t/fIouZroTdQnx6+KvoaqHIc84UHgrk/LqGiyionu4RZA2dFj57QrFA7W6Ns9lUJQNsRZLAfvxBo9X+Dql7eSoJ/tUJ2rLgQzO+4qGio+BYTuq1FmEnpepqGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MqgRPO4f; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MqgRPO4f"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-65c01595082so6539312a12.3
        for <chrome-platform@lists.linux.dev>; Mon, 02 Mar 2026 01:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772444218; x=1773049018; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HzEgCqxvjH+3BmwidCaHmyf6O+HU7TyRw9v2I7ODIxw=;
        b=MqgRPO4fF4Q+6ON9soJa4uVAxqZ4zLEht8u8fBABgD1l4fYXgAcDxDKgnnQ0PiS2Vj
         ZSexbE4BHdoQ3cLa/XZjC5sq8oz+bE6I8R8NrXQiqktrHydRxL40XCBa1MdSCpC7fvWx
         W4nahMsViIUlYwMvt/0UapqiPjpPz0zcVjpDjq3EsR6FGRHvLrbhiMd1MoXNT0EUMD6/
         jxR13U7sYQzQ3lAHQd2kVBANgNlHk1z1VB1YD80qorM0PEKp3uTUF8yL4yx31ZcDXZlh
         xAYGlQTLE01Q+ceYEWAgUFLree9SX9VC+nephmGMed561VJTLB/ehgA61nphc0V///KM
         6ESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772444218; x=1773049018;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HzEgCqxvjH+3BmwidCaHmyf6O+HU7TyRw9v2I7ODIxw=;
        b=Ly5YIKHf7EkqHPDSpN6FzeWpitBNgRK9YhT7STlM/qOyE9im7tRxj9gcbwTTnPE5D8
         GJ0Yuob0r3Pazrta3ucNhImO/AxK3KW4rvW73XlORlUHSiN2/ioHwRzccDCCBp4n1XIC
         Iim/wf/8D46RJIDxYw9iQoJ4+kqHxBKN6IMNG9mQjecqB+HjMMfveKX/T8gpOyEHfciD
         fPyacTPAG8sNAsdIkcDs8I6Zet0fFkH2COyqdX+mzBB3BJnpL8nKK1jIhyynnu8Mziod
         VpKeOAPV8fOh7r0R4ChyjK8nuge/b2JzX6k6wdMZaj/j2HTnPODFVFliutMzEOjWDNsH
         I4Kw==
X-Forwarded-Encrypted: i=1; AJvYcCWeo/etzDBT3jKBpsiM10i4Uk8a44UjcfPDfbDkAUR1ICMKE+JNwTfxpDQYCqbb5VdajM+bxCG4jB4JhKFbCyA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwAKDxM2aKPzBxziZCNxVdS8gO0mBhvJQG47zte/70UsNS7kUlc
	yUvfjwQHeC8ct0rpAehMN+6XXaOOxH7f9843mEN12dLEJoXW01LA0+Rb
X-Gm-Gg: ATEYQzyIJCISSAZrr+Kpob16whMYasBc9fMGRxS4oUlE8EIMcM+FAYsSxJ0pkBW4oln
	qlHl5UyXmgD5ShOzujqWNzkeJw7sc7HoLX0oLZoUbwcbEE3Fn9sC/WEYr5up9Evw8WDmVBy5Hn1
	6jZz+sPXRBJrJImaB8rnjPOGj9gB2Sj+1O8zoBMU5DpVr+/VhWprbsA8YflhFUgcpkuoZM+qaPm
	/Td/0x7br7OpQhjVyGhwEAIa0apr9UaRbpe/mjnOfGlqjORcqd9/wayOHOvahAjlh6wNj4V907I
	3vwJEZhyFV4H6G4KBvQbQq/jhcl9LNQmDibo3+7VN9tx0YLFlPIxVtPXfSyonnH78S+5mtQwQmM
	2r+diFe5+7w1f+0jSH+oOCH0wdMYjw339G/mY5dZFq/L0W/xFN1sM1qp7iVJZ/vo+op4ffXO1o4
	09uSzo+isTRWAU7GRnB6JSeSajcsM=
X-Received: by 2002:a17:907:6d11:b0:b8f:9636:9acc with SMTP id a640c23a62f3a-b9376386bbemr716057866b.17.1772444217797;
        Mon, 02 Mar 2026 01:36:57 -0800 (PST)
Received: from [192.168.0.102] ([46.53.247.255])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aec7091sm452340666b.58.2026.03.02.01.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 01:36:57 -0800 (PST)
Message-ID: <cd1506b7-0438-4505-946e-4fc90961d3e3@gmail.com>
Date: Mon, 2 Mar 2026 12:36:56 +0300
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/8] platform/chrome: cros_ec_typec: Thunderbolt
 support
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
 heikki.krogerus@linux.intel.com, tzungbi@kernel.org,
 linux-usb@vger.kernel.org, chrome-platform@lists.linux.dev
Cc: akuchynski@google.com, sboyd@kernel.org, pmalani@chromium.org,
 badhri@google.com, rdbabiera@google.com, dmitry.baryshkov@linaro.org,
 jthies@google.com, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org
References: <20241213233552.451927-1-abhishekpandit@chromium.org>
 <20241213153543.v5.7.Ic61ced3cdfb5d6776435356061f12307da719829@changeid>
Content-Language: en-US
From: Dzmitry Sankouski <dsankouski@gmail.com>
In-Reply-To: <20241213153543.v5.7.Ic61ced3cdfb5d6776435356061f12307da719829@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/14/24 2:35 AM, Abhishek Pandit-Subedi wrote:
> Add support for entering and exiting Thunderbolt alt-mode using AP
> driven alt-mode.
> 
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> ---
>
(...)

> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> index 1bcaa7269395..1ac5798d887f 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -303,18 +303,19 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
>   
>   	/*
>   	 * Register TBT compatibility alt mode. The EC will not enter the mode
> -	 * if it doesn't support it, so it's safe to register it unconditionally
> -	 * here for now.
> +	 * if it doesn't support it and it will not enter automatically by
> +	 * design so we can use the |ap_driven_altmode| feature to check if we
> +	 * should register it.
>   	 */
> -	memset(&desc, 0, sizeof(desc));
> -	desc.svid = USB_TYPEC_TBT_SID;
> -	desc.mode = TYPEC_ANY_MODE;
> -	amode = typec_port_register_altmode(port->port, &desc);
> -	if (IS_ERR(amode))
> -		return PTR_ERR(amode);
> -	port->port_altmode[CROS_EC_ALTMODE_TBT] = amode;
> -	typec_altmode_set_drvdata(amode, port);
> -	amode->ops = &port_amode_ops;

The last usage of port_amode_ops is deleted here. Is this a mistake?
AFAIU from kernel docs, port_amode_ops needed for alternate mode driver 
to send vdm messages to partner. Now, when it's unused, how does 
alternate modes work in this driver?

> +	if (typec->ap_driven_altmode) {
> +		memset(&desc, 0, sizeof(desc));
> +		desc.svid = USB_TYPEC_TBT_SID;
> +		desc.mode = TBT_MODE;
> +		amode = cros_typec_register_thunderbolt(port, &desc);
> +		if (IS_ERR(amode))
> +			return PTR_ERR(amode);
> +		port->port_altmode[CROS_EC_ALTMODE_TBT] = amode;
> +	}
>   
>   	port->state.alt = NULL;
>   	port->state.mode = TYPEC_STATE_USB;
