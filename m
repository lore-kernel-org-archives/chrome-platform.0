Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B14B1DFE00
	for <chrome-platform@lists.linux.dev>; Wed, 30 Apr 2025 15:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746027491; cv=none; b=nsbaAJd56/DVoXSnLgytf0KWJn8Ia+iBemttD4hqgA/+TPUmrMSaxglk2c1NFVlm+SntG8g8wH++QSoK6vuSS6xqCC28OxkTpT7/PKsszLxt7WLMQBsWcpaSwb1NAYG9qSdp5UWmWjXRuOeSmf2MrF/H19WeMUWiKKhyLL5zBOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746027491; c=relaxed/simple;
	bh=jq7xIeO77eaJ64hkjucE+eWbmVeK5TQKe0cJF7lIkmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nRDIuvpP7mhthqB2wTG/zLCM8J9NdnFEvZdJ6kf+wp6BimW8jboB3ewknjirQjNX/nUHt/3FHPbFJeQVtnkQ3Nf6Ca5F4GX31Vx1PT4svEi0HjwWgS01b30hxfgUu1lnO/WZi/WVox6UvC6lPGwawmwK8kS5n5CAi/oY78APNRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NRt8K00Y; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NRt8K00Y"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-225df540edcso12648165ad.0
        for <chrome-platform@lists.linux.dev>; Wed, 30 Apr 2025 08:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746027489; x=1746632289; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=fHjsabH6fpkrPdOBG+eF0QMh9HQU6YKJXwURj40tUJw=;
        b=NRt8K00YeP+kcnOATZPcHAcaJ1NJLYtlsYfr5ye7JDYrvzrcAOqAWZVp8LAoBghs7R
         a9TYowmo9NbVhIKvqja10YnpgLtfyU7z4snytJCkUeGNB8Fbxs90p5zeXSTYc+kWZSLc
         zt+aoTAw3FKc/1bGh7e1fMU4oC1i8M4pnFZWJ7xPyGzxv7tRf2OH0jl+QLRB2EW4oZ1w
         oTYYC4y5GLwwVJ5BSJyy+7r5qK5eIf2y2nF8OEVeqaP4/T/cQtbDD0gyO4ohs9kmrbum
         y/YPhXFNrXSr5KpV45wDv6/rOiigu9ceIrG1tAWzJVtzUx5jvAX5cZHUqu32TmpXTCUz
         kfqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746027489; x=1746632289;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHjsabH6fpkrPdOBG+eF0QMh9HQU6YKJXwURj40tUJw=;
        b=pmYlkzFTn6FsmMl9t+3Z7HmPssMpQe0/Wev2ej/4ER4LLVma3pd66nAKR4PSBpkO+A
         IdmXUzr+eS+rr4ttJdly6BW5gauNCkqiyhIrvsaBqhbt4gsXpM8LZ5ptNfK0zRyF5kQt
         xLvjcQyOWrBSgzeZW/ygjxCsNigO9UEaUofAxSeZj4uqfm0TImNbYSJp7pJs6IcodBi2
         DisrPee3S92ZD0pEjjyog2VtUh9pRt38VMh74Ump5ybAspZ7P0ElNFhFeQaxlJVJDObU
         cVDjvXDQF0rUu/ql4rF9QOaa53qajOc/8fZAevp0xWHpUG8P40HuRMkUlcr554Nhs0Ch
         4FnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcXEZSnrU4AXmJ5gzWezzBdMlHxUplM53cqIj7i63LCUW1RSvdQ6oSLa8mTX/cq2Dby8nLtRWs9H31LCySrMo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxq2prwUdx00kdH4IXI2rMsJQa7S5E04kYYYjfjmgGH+pz7X48E
	dCvbvMdYX/AdYZdTzB89zNzptI0fXweQGgAk1sc5D2zXx1wcgD/6
X-Gm-Gg: ASbGncs8cjgOWAB2smapFXzG3LLzr8ikyKMzuhl8vT4XdaC39tMQNJqBGlywBY9c0tp
	wvOm/hNkLLhprGcsUlyPhRFEjvm3tltsAmlxm3hK39WIvSAqEQfrc637KBe4qxdlGSL9apPRp+K
	Pk4tiOc7oQnmDyf1Agkwd/PkWcllvAvLDeBd/0iLme0GXjadZH0DGBikcrjk/BWHQDGpervGyMy
	yDu32RDantQ+Gksv3/ZJLa2a8sKkS6Aw5sZL1hufQXhxabXolGR+Jh+uK2KVgLiOdsX0uZY7YcM
	l8arURNuEzAOw32IcpydaSsf3vXDDMZc++/1FKd5ye00hLWHjTatbE0oh+J+19LuVqXZwa2Ku4H
	+65qrW92xqqWy8A==
X-Google-Smtp-Source: AGHT+IE/H2x6a5Mtbx/fguSOrdjhkx//xFewkDPsKtncemcwNV6cOLrLoG5Yq57u/BBNJsaN0SKihQ==
X-Received: by 2002:a17:902:e809:b0:223:fb95:b019 with SMTP id d9443c01a7336-22df481ab3dmr48754565ad.24.1746027489252;
        Wed, 30 Apr 2025 08:38:09 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76bdfsm124403265ad.31.2025.04.30.08.38.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 08:38:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <63b2d985-92d4-40dd-b2b2-ab55796abc52@roeck-us.net>
Date: Wed, 30 Apr 2025 08:38:06 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] hwmon: (cros_ec) register fans into thermal framework
 cooling devices
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Sung-Chi Li <lschyi@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
References: <20250429-cros_ec_fan-v1-0-a8d9e3efbb1a@chromium.org>
 <20250429-cros_ec_fan-v1-3-a8d9e3efbb1a@chromium.org>
 <ec2f7e54-0582-475d-af91-42d9be65cd3e@t-8ch.de> <aBGCB6_4XR4Z-vFI@google.com>
 <2518c6a3-6524-48b3-8e64-8990a61cc608@t-8ch.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <2518c6a3-6524-48b3-8e64-8990a61cc608@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/30/25 07:36, Thomas Weißschuh wrote:
> On 2025-04-30 09:51:03+0800, Sung-Chi Li wrote:
>> On Tue, Apr 29, 2025 at 10:45:56PM +0200, Thomas Weißschuh wrote:
>>> On 2025-04-29 16:14:23+0800, Sung-Chi Li via B4 Relay wrote:
>>>> From: Sung-Chi Li <lschyi@chromium.org>
>>>>
>>>> Register fans connected under EC as thermal cooling devices as well, so
>>>> these fans can then work with the thermal framework.
>>>>
>>>> During the driver probing phase, we will also try to register each fan
>>>> as a thermal cooling device based on previous probe result (whether the
>>>> there are fans connected on that channel, and whether EC supports fan
>>>> control). The basic get max state, get current state, and set current
>>>> state methods are then implemented as well.
>>>
>>> There is also HWMON_C_REGISTER_TZ, however it depends on OF.
>>> But this patch looks very generic, so maybe it makes sense to implement
>>> it in the hwmon core.
>>>
>>
>> Hi, the HWMON_C_REGISTER_TZ is for registering a thermal sensor, and here I
>> registered it as thermal cooling devices, so they are different. I followed
>> other hwmon drivers:
>>
>>    - gpio-fan.c
>>    - aspeed-pwm-tacho.c
>>    - max6650.c
>>    - qnap-mcu-hwmon.c
>>    - ...
> 
> Indeed, sorry.
> 
>> . These hwmon drivers also manually registered other cooling devices, and that
>> makes sense to me, so I think it is good to just register cooling devices rather
>> than make big changes to hwmon core.
> 
> The implementation does look like a lot of boilerplate.
> If Guenter doesn't chime in, let's stick with the current approach.
> 

Someone could make the necessary improvements to the hwmon core and clean up the drivers
implementing that boilerplate today, but that should be a separate patch series, and this
series should not depend on it.

Patches welcome ...

Thanks,
Guenter

