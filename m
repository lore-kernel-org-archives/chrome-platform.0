Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5E913F43A
	for <chrome-platform@lists.linux.dev>; Tue, 28 May 2024 23:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716939005; cv=none; b=Zm82S9kDhKyk00N6kU5OGpUEDReURfDQWiqK7vzqgaKX2gPAYTBy4vmEmcw6HhQpL2GtXKWbYvPIzS5RrtV+3mSuWXzaUsL/xQoBeHm4aXWB75eh0VA/Ra3d8uihcg7P3BjE7PLo++Dedx9Y9j+wUoKzHhH7rxiw3SCs+1iIYJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716939005; c=relaxed/simple;
	bh=u3JWoyCmWuIDEXzw4nozaITn17g9692yK6khrCNgFsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Npp2INh/zSKnXspUEmh6JlRumaDrlvnBrORpOuQNY371SE3H+ovJPyBvOdPwiLfNHvA+w5jWh7AyoyWaTB9Lx31vXePThI1rRp+10jyz/YaGLDy8BPGnndKybHFuE0DUh75WhblWNsMCqm8ixuAKPcZibssR9/5PvytHNkV9Zvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SvL3w5TC; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SvL3w5TC"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1f449f09476so1981235ad.1
        for <chrome-platform@lists.linux.dev>; Tue, 28 May 2024 16:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716939002; x=1717543802; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=S0TMaPpYmodXALWZ1bjrbJlYf3i9gaDMevPP9GtJUgM=;
        b=SvL3w5TCssSKfPdrU2RLeTAkfJ/lidmt5Zgl2iJuk9DNB3YEzEiWP82IWAxZk44jLy
         35aNDXCbxxwC38jicWlpP/3mDvOkhmwM8XLWoT+t1EEnQ/6Y+fUhpVlUtg9ivvhjJvHJ
         gllPnvZ+QWh3+9MswVgfpKIPUP34WTjU1N19MGkNRQR1efiwpasEpkN6CafAB2b7n6pT
         AerIgjFSpcw72PqVaKIeEmZfo43jvPiLQOrcwh/Ot4/IyijjzuJRC8nEympF1QGgTcHi
         /i+3HMnzHwOZ3SjUtGWjiPRh9Tpj68I7kJ6JjZp9gvdDsiwsFi23lwcUQ+dYF2e71yiw
         ZwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716939002; x=1717543802;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0TMaPpYmodXALWZ1bjrbJlYf3i9gaDMevPP9GtJUgM=;
        b=doB9cg+sHFL0ji5s1AUAq3ZZMypTeuvjkoTZpEk7vWcmIIQQ/p/jDocQOXsXhq9fDn
         f9XnkFbiV7xsqBO+D0oCtZBZeFeo8LWgwlSty/8wEUbFPaKAkbvc3pfTfHdlrk3BThLI
         EEs41sYbMvwqGYG1GdvikMfIEzyhydttb6XDbtUTv1dXIWPeQRQqZQXtDRfmfVJiqnG0
         s06rgwWTAudtApTXAY4CnESLscf4H39Tmao4/Iq/86Pf+GVsZaVxkCcmPLopezi4ThNe
         5rNKvkQvmBK/WYZNUDCTU8WXetU8WbupL9EoKzRlwo5WRDp3yEVqMhV90nlw+z6PDLED
         qlkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUE0URM+P3SWbuqsR0Fq28PxWDXp+oGqfVFlYDmHkizDCEMx8S5J4uLah7lbXaXFJxljB+Gowl/7soKXOQn5dZEHhX3bnCsTmU/ZsmHR2C
X-Gm-Message-State: AOJu0YztQpfuogYXWEQDZZ5NzEUcXZ1pkeusY49yZqzL7k+bCpUk1PqI
	xQm9AI7YEVp7FVGRoZ3Bt4NAvsw77fu2vnPhkt8ssdMjzDHMeRKH
X-Google-Smtp-Source: AGHT+IF1v2IScTWJpA8xSStcOoZ9zJtv7yddZ1Q06rij67q1pn5cOQay1iK/sDz4axWbHA5v7dQ0xw==
X-Received: by 2002:a17:903:22cb:b0:1f0:9951:8491 with SMTP id d9443c01a7336-1f4eab1798fmr6315325ad.29.1716939001940;
        Tue, 28 May 2024 16:30:01 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c757845sm86133405ad.5.2024.05.28.16.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 16:30:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6824f030-92da-4439-af3b-8c2498f4382e@roeck-us.net>
Date: Tue, 28 May 2024 16:29:58 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] hwmon: add ChromeOS EC driver
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Stephen Horvath <s.horvath@outlook.com.au>,
 Jean Delvare <jdelvare@suse.com>, Benson Leung <bleung@chromium.org>,
 Lee Jones <lee@kernel.org>, Guenter Roeck <groeck@chromium.org>,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 chrome-platform@lists.linux.dev, Dustin Howett <dustin@howett.net>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Moritz Fischer <mdf@kernel.org>
References: <20240507-cros_ec-hwmon-v2-0-1222c5fca0f7@weissschuh.net>
 <20240507-cros_ec-hwmon-v2-1-1222c5fca0f7@weissschuh.net>
 <SY4P282MB30635BA1D4087113E79921B5C5F52@SY4P282MB3063.AUSP282.PROD.OUTLOOK.COM>
 <9cf224dd-51eb-4608-abcf-06f337d08178@t-8ch.de>
 <SY4P282MB306325BB023A95198F25A21DC5F12@SY4P282MB3063.AUSP282.PROD.OUTLOOK.COM>
 <c9b110eb-ff0e-41f2-9492-8a5d8c3c01d0@roeck-us.net>
 <b8072b36-688f-41b8-8b32-40fc4fa4d148@t-8ch.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <b8072b36-688f-41b8-8b32-40fc4fa4d148@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/28/24 09:15, Thomas Weißschuh wrote:
> On 2024-05-28 08:50:49+0000, Guenter Roeck wrote:
>> On 5/27/24 17:15, Stephen Horvath wrote:
>>> On 28/5/24 05:24, Thomas Weißschuh wrote:
>>>> On 2024-05-25 09:13:09+0000, Stephen Horvath wrote:
>>>>> I was the one to implement fan monitoring/control into Dustin's driver, and
>>>>> just had a quick comment for your driver:
>>>>>
>>>>> On 8/5/24 02:29, Thomas Weißschuh wrote:
>>>>>> The ChromeOS Embedded Controller exposes fan speed and temperature
>>>>>> readings.
>>>>>> Expose this data through the hwmon subsystem.
>>>>>>
>>>>>> The driver is designed to be probed via the cros_ec mfd device.
>>>>>>
>>>>>> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
>>>>>> ---
>>>>>>     Documentation/hwmon/cros_ec_hwmon.rst |  26 ++++
>>>>>>     Documentation/hwmon/index.rst         |   1 +
>>>>>>     MAINTAINERS                           |   8 +
>>>>>>     drivers/hwmon/Kconfig                 |  11 ++
>>>>>>     drivers/hwmon/Makefile                |   1 +
>>>>>>     drivers/hwmon/cros_ec_hwmon.c         | 269 ++++++++++++++++++++++++++++++++++
>>>>>>     6 files changed, 316 insertions(+)
>>>>>>
>>>>
>>>> <snip>
>>>>
>>>>>> diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
>>>>>> new file mode 100644
>>>>>> index 000000000000..d59d39df2ac4
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/hwmon/cros_ec_hwmon.c
>>>>>> @@ -0,0 +1,269 @@
>>>>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>>>>> +/*
>>>>>> + *  ChromesOS EC driver for hwmon
>>>>>> + *
>>>>>> + *  Copyright (C) 2024 Thomas Weißschuh <linux@weissschuh.net>
>>>>>> + */
>>>>>> +
>>>>>> +#include <linux/device.h>
>>>>>> +#include <linux/hwmon.h>
>>>>>> +#include <linux/kernel.h>
>>>>>> +#include <linux/mod_devicetable.h>
>>>>>> +#include <linux/module.h>
>>>>>> +#include <linux/platform_device.h>
>>>>>> +#include <linux/platform_data/cros_ec_commands.h>
>>>>>> +#include <linux/platform_data/cros_ec_proto.h>
>>>>>> +#include <linux/units.h>
>>>>>> +
>>>>>> +#define DRV_NAME    "cros-ec-hwmon"
>>>>>> +
>>>>>> +struct cros_ec_hwmon_priv {
>>>>>> +    struct cros_ec_device *cros_ec;
>>>>>> +    u8 thermal_version;
>>>>>> +    const char *temp_sensor_names[EC_TEMP_SENSOR_ENTRIES + EC_TEMP_SENSOR_B_ENTRIES];
>>>>>> +};
>>>>>> +
>>>>>> +static int cros_ec_hwmon_read_fan_speed(struct cros_ec_device *cros_ec, u8 index, u16 *speed)
>>>>>> +{
>>>>>> +    u16 data;
>>>>>> +    int ret;
>>>>>> +
>>>>>> +    ret = cros_ec->cmd_readmem(cros_ec, EC_MEMMAP_FAN + index * 2, 2, &data);
>>>>>> +    if (ret < 0)
>>>>>> +        return ret;
>>>>>> +
>>>>>> +    data = le16_to_cpu(data);
>>>>>> +
>>>>>> +    if (data == EC_FAN_SPEED_NOT_PRESENT)
>>>>>> +        return -ENODEV;
>>>>>> +
>>>>>
>>>>> Don't forget it can also return `EC_FAN_SPEED_STALLED`.
>>>>
>>>> Thanks for the hint. I'll need to think about how to handle this better.
>>>>
>>>>> Like Guenter, I also don't like returning `-ENODEV`, but I don't have a
>>>>> problem with checking for `EC_FAN_SPEED_NOT_PRESENT` in case it was removed
>>>>> since init or something.
>>>>
>>
>> That won't happen. Chromebooks are not servers, where one might be able to
>> replace a fan tray while the system is running.
> 
> In one of my testruns this actually happened.
> When running on battery, one specific of the CPU sensors sporadically
> returned EC_FAN_SPEED_NOT_PRESENT.
> 

What Chromebook was that ? I can't see the code path in the EC source
that would get me there.

>>>> Ok.
>>>>
>>>>> My approach was to return the speed as `0`, since the fan probably isn't
>>>>> spinning, but set HWMON_F_FAULT for `EC_FAN_SPEED_NOT_PRESENT` and
>>>>> HWMON_F_ALARM for `EC_FAN_SPEED_STALLED`.
>>>>> No idea if this is correct though.
>>>>
>>>> I'm not a fan of returning a speed of 0 in case of errors.
>>>> Rather -EIO which can't be mistaken.
>>>> Maybe -EIO for both EC_FAN_SPEED_NOT_PRESENT (which should never happen)
>>>> and also for EC_FAN_SPEED_STALLED.
>>>
>>> Yeah, that's pretty reasonable.
>>>
>>
>> -EIO is an i/o error. I have trouble reconciling that with
>> EC_FAN_SPEED_NOT_PRESENT or EC_FAN_SPEED_STALLED.
>>
>> Looking into the EC source code [1], I see:
>>
>> EC_FAN_SPEED_NOT_PRESENT means that the fan is not present.
>> That should return -ENODEV in the above code, but only for
>> the purpose of making the attribute invisible.
>>
>> EC_FAN_SPEED_STALLED means exactly that, i.e., that the fan
>> is present but not turning. The EC code does not expect that
>> to happen and generates a thermal event in case it does.
>> Given that, it does make sense to set the fault flag.
>> The actual fan speed value should then be reported as 0 or
>> possibly -ENODATA. It should _not_ generate any other error
>> because that would trip up the "sensors" command for no
>> good reason.
> 
> Ack.
> 
> Currently I have the following logic (for both fans and temp):
> 
> if NOT_PRESENT during probing:
>    make the attribute invisible.
> 
> if any error during runtime (including NOT_PRESENT):
>    return -ENODATA and a FAULT
> 
> This should also handle the sporadic NOT_PRESENT failures.
> 
> What do you think?
> 
> Is there any other feedback to this revision or should I send the next?
> 

No, except I'd really like to know which Chromebook randomly generates
a EC_FAN_SPEED_NOT_PRESENT response because that really looks like a bug.
Also, can you reproduce the problem with the ectool command ?

Thanks,
Guenter

