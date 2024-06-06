Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B099D61FE3
	for <chrome-platform@lists.linux.dev>; Thu,  6 Jun 2024 21:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717708510; cv=none; b=KbV8gnQYZIasT0tLbjAc/talUxGfrnbSrLBa6agpDuFzJ+JjM9LQtb6JjUrh9prUTzp8qs3JZZZ/jyAI+YpLmRZ+4U9xsMjFdGjiNxqpd9+VrNZD90NtQqPv3L0QTCG15NQ+50JWh0+rB8ggoMIUTObPWxOMb/IvnerAiZHFyd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717708510; c=relaxed/simple;
	bh=YkoxsWKSsg2N16NjzFpPpAWn9SbqFRGf1ZPBljEkono=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JogQDIMT2WrRAsYh7NC6E3M+5SanP0X8r5yMofSWezw9G2CRMSsdAOdOnPrqXOa21wfZxp8+5hu3NtLzieGsD0SJsGURZzV+F4UlcQJlvFAxkL6mD/RFebpMrlNB4T15MeYpziBmrQ8QoQiizcOobKhi4DAZIwtiMFMYwiPzuOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kLX2bz65; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kLX2bz65"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f6ab88dfaeso13037655ad.2
        for <chrome-platform@lists.linux.dev>; Thu, 06 Jun 2024 14:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717708507; x=1718313307; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=zcoa1oQIPOXOdQAzOu4Ehk+5JNgeFxLcleZSqGXdpsw=;
        b=kLX2bz65CnsdC8Eez6lxabJktzEM2d3P30eRI6sMz+fUWQebM+Tf2MgRfGdmq/bCI0
         uSYxBnorhZww1soIXghST4sVvAttWx/M3wifuu/6Q1dBJHr40SGFK1n7AS8e9O0+FjJT
         dDpYXuOe7Mj0gCfZoCunJZC88isgVHisbpJ0wCA5DJQ0zBmDPgiFHDH2M0ytin/uVUVy
         DWHcdsXRz0gOj2kU+1ZsuYeYk4gXpc9hHvArwHmu1gxJuALilMoFsMtAGl7ER86Vrh6P
         2L+RJKidpTBBNowx7vGqTsQwQb1l37FK1rzdhlFm9AdM9wyhFlwXiN1kjpjIxo8kHxox
         AfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717708507; x=1718313307;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcoa1oQIPOXOdQAzOu4Ehk+5JNgeFxLcleZSqGXdpsw=;
        b=XMOXmZ3Ba7VO973hcxjBmaRA+RA+lc25xNK1r/PnjsmeJHPN9ikv2IvRmBWSlw+dCj
         sJATcYuiOuumsHv87Z/p1mVSkGgPTLOeMfaHIBxFGK1GIb06xI3lRCbt67H3Py5ipZWw
         b5kQRN2bHIYwufPKlfqDmQSqQeHd3LkA0LH4j+6zAPpUII38I/7So+EEUVunyCyGQMsw
         lpqv6Z9QN6Pj2WK7/TrqiprI54K9iM61SolGnsm9htiob5410BvMinPMVkrV2BljBI7f
         GXKYmBO0YIEiNaQhnfzfcukpp7ljwW62Jf0D9FpQJGFHDBH9dXQ0nNJTdBTBDcAh0/9l
         ut0w==
X-Forwarded-Encrypted: i=1; AJvYcCXDZh47sq1pktyuZKpJ//eMNbD00hRkEfZ2rXUvwtOUH4gmimspcfkJYNOIXBoLLViggTEC21Yl+5Nh5Fkq4adVyLwwNw7hS6c6qf+80nlB
X-Gm-Message-State: AOJu0YwLh76JiqxDS7gqggFtpik3CEozf1wwrCzd7ZeMIJOabcdt5pna
	Pyu/zg1ce5PY6JTlE3rVqVoJHglwFIRVNcXzK0SSeTq4DP30HxjnxGLVuQ==
X-Google-Smtp-Source: AGHT+IFwaLPIOzhDbwTSfRLdHW+TA8ZTWR1nM61MrPqbv/ZjJGakjaaHDuE0l6A7pdJCs5WxexPOoQ==
X-Received: by 2002:a17:902:db05:b0:1f6:9010:1cb8 with SMTP id d9443c01a7336-1f6d03ce036mr7327325ad.65.1717708506850;
        Thu, 06 Jun 2024 14:15:06 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd7e1ec5sm19796655ad.197.2024.06.06.14.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 14:15:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ce42caf8-85f7-4f8e-9058-d04884f9d823@roeck-us.net>
Date: Thu, 6 Jun 2024 14:15:04 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (cros-ec_hwmon) Fix access to restricted __le16
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Benson Leung <bleung@chromium.org>
References: <20240606180507.3332237-1-linux@roeck-us.net>
 <571aaac0-a397-4aa8-b9d5-2315f6a637d4@t-8ch.de>
 <9f2e2b48-f7b4-49da-ac02-1f73923fb9ef@roeck-us.net>
 <a9409e1f-a6d1-4d97-86c5-acb11c0115af@t-8ch.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <a9409e1f-a6d1-4d97-86c5-acb11c0115af@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/6/24 13:48, Thomas Weißschuh wrote:
> On 2024-06-06 13:16:59+0000, Guenter Roeck wrote:
>> On 6/6/24 12:53, Thomas Weißschuh wrote:
>>> Thanks!
>>>
>>> On 2024-06-06 11:05:07+0000, Guenter Roeck wrote:
>>>> 0-day complains:
>>>>
>>>> drivers-hwmon-cros_ec_hwmon.c:sparse:sparse:cast-to-restricted-__le16
>>>>
>>>> Fix by using a __le16 typed variable as parameter to le16_to_cpu().
>>>>
>>>> Fixes: bc3e45258096 ("hwmon: add ChromeOS EC driver")
>>>> Cc: Thomas Weißschuh <linux@weissschuh.net>
>>>> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
>>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>>
>>> Acked-by: Thomas Weißschuh <linux@weissschuh.net>
>>>
>>> Guenter, does sparse work locally for you?
>>>
>>
>> It does, but I use the version from git://repo.or.cz/smatch.git.
> 
> That does indeed look much better, thanks.
> 
> 
> I have another question about the endianness conversion in general.
> The only places I see doing a conversion are
> cros_ec_sensors_cmd_read_u16() and the original cros_ec hwmon driver.
> 
> Also the documentation of the EC protocol does not specify anything in
> that regard.
> Instead there is the following comment in host_event_set_bit():
> 
>     /*
>      * The overall host event implementation assumes it's running on and
>      * communicating with little-endian architectures.
>      */
> 
> Can the conversion be dropped?
> 


Unless it is wrong I don't see a reason to drop it.

Guenter

