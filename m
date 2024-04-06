Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C946638DF2
	for <chrome-platform@lists.linux.dev>; Sat,  6 Apr 2024 19:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712431417; cv=none; b=LAFcIv69DV7+dPpvh+Ho10IhcwiUCQZ442xTxiL4ICCmOQbH/8wTfxm1tr1bMSeyL39M5KEz+i+eSicnF/+TNPo4I2pJFpyWZpZy4eY7XPuP1Gh+qtcGG7tDXZG5oJROsOQ2DGO+Qy0HJ9V9max+efbeCvB4fvSWwIskw0UFtms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712431417; c=relaxed/simple;
	bh=eV+SgNm4tKfKS916MyZ5sHS7rdveFVofQ5wtP6IOY68=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=UVt5st6mKVtKmoXg5sNbw8BeDyuScjwMe1NPaDWm1ZSXTaEFPno/ZAaNOR9IY3eXAXlEJT7H3fb9hVW9JGgHg/Bw7DcL4aVFtIG+4rER32Va3D2GX5GsSOaNcg0/3Bm2T4Wvi0G0UaXfvnM3KfAKcxu8Pk0nry4gwtTnz7DKfQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gToyx+x6; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gToyx+x6"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-22a96054726so2819975fac.0
        for <chrome-platform@lists.linux.dev>; Sat, 06 Apr 2024 12:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712431415; x=1713036215; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1PILzptOyBIciuRHHN6tMGQbfo4JFzZq8KLPYV/byfo=;
        b=gToyx+x6MHX2id+DN81g+o2vcLr/+ybW2ZZpQrpaD5I9V6StNq1506A2voGZnMet03
         gQ2DetWpaywnzLWEPHfPBGYYJSupvOcaVgw1GrtwVvghGBQ/F0g2vR1xfQhm3LkVg6S5
         CQ/7ARXvdUkuOaUYmsBms0aM8n87DNqbynHu0YTyJhkE4BbDeDbOYMgXxlBXs/rQ28L0
         RFGHcIdTONnX8loLcYmMK/57ECLeJJYKDhxPvtbf79AJy0wqLnA7AfyW4FU9sp+XTbN/
         mYUy/waYHvIv6XZhLRA1cMxzLFMWnmAUT9r8rN/HItsGeziDuibtCirKOKYFuRtTUQSe
         xTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712431415; x=1713036215;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1PILzptOyBIciuRHHN6tMGQbfo4JFzZq8KLPYV/byfo=;
        b=ZyBuJE6BBN/8pkvwFLHzlPfWwGkAe3NowwR9Qaki/ptjW3dc4Jmk+8kf4Y5J6T8dVf
         iE+iDcpy65yqXer6Bj3R8LaYMbTkeaWI1xXDZ6aB421xD/nvtOamifQxg6v3I2mZg4Uy
         S7+vKyqlmQqlm6jZqUEsyBXCbga7vQsbO7XOF1N6QO9r0L7LLgIw65Xhsr2t2EKa6SLF
         7JGp4aciS0lN5AUlLRDcei6jjIRLe9aj1XahtDnJpbgY5Vrxmaa/3DghAEnbiiVTI2PI
         d9fYgGnMPzfeoMws8ELhSgHdAqG6ATT3jFnLE+cvJFbnlfm+zRK3DDC/G3+IsBbrcYhg
         6twQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcuJ8klCTdoGG7bui//+eG2Q4Fp+PCXmgWuECXGtXPD7noFsu+q9Ox+UgKhXr1dg87po5y68hpkyO9ziETFk57qBL4BZdK8gXlOEQ2zyuR
X-Gm-Message-State: AOJu0YyNn/WIRVLcwP4SujGN9H/4NC1vgqBWFhdOKReGUSe3Gcx1FUJD
	8qPFi/ADwN0ajqGMO57iNbsklKoMFgm0oWdEtq8kEGhi5w2gS701P3P0YXPY
X-Google-Smtp-Source: AGHT+IG85S0PQzZ2YvLeKWlFqy92a123bLO1h6xToRGErOh+hscC74HgBGvhGyx5LEgxdvxIOkJw4A==
X-Received: by 2002:a05:6870:15c4:b0:22e:b56d:196b with SMTP id k4-20020a05687015c400b0022eb56d196bmr5569840oad.48.1712431414844;
        Sat, 06 Apr 2024 12:23:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:70:f701:902c:1d74:b5f5:5fae? ([2600:1700:70:f701:902c:1d74:b5f5:5fae])
        by smtp.gmail.com with ESMTPSA id td16-20020a056871879000b0022f126c98e0sm136740oab.3.2024.04.06.12.23.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Apr 2024 12:23:34 -0700 (PDT)
Message-ID: <a1236789-ddf6-4e55-8566-5bd47f28ce3b@gmail.com>
Date: Sat, 6 Apr 2024 14:23:33 -0500
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] platform/chrome: cros_ec_lpc: add support for AMD
 Framework Laptops
Content-Language: en-US
From: Mario Limonciello <superm1@gmail.com>
To: "Dustin L. Howett" <dustin@howett.net>, Tzung-Bi Shih
 <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev
References: <20231126192452.97824-1-dustin@howett.net>
 <20240403004713.130365-1-dustin@howett.net>
 <84eafee2-150e-4711-9eb9-1a013f363332@gmail.com>
In-Reply-To: <84eafee2-150e-4711-9eb9-1a013f363332@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 4/6/24 13:48, Mario Limonciello wrote:
> 
> 
> On 4/2/24 19:47, Dustin L. Howett wrote:
>> This patch series adds support for the AMD models of the Framework
>> Laptop (both 13" and 16").
>>
>> These models of Framework Laptop have switched to an NPCX embedded
>> controller, which uses the original Chrome EC linear memory-mapped I/O
>> model.
>>
>> However, these devices are not configured in a way that is compatible
>> with the cros_ec driver. Instead of mapping EC memory to I/O ports
>> [0x900, 0x9FF], they map it to ports [0xE00, 0xEFF].
>>
>> To address this difference without impacting cros_ec_lpcs' compatibility
>> with Chromebook/Chromebox devices or the existing Framework Laptop
>> platform, these patches add DMI match-specific driver data through which
>> we can detect per-machine "quirks".
>>
>> Quirks toggle changes in cros_ec_lpcs' behavior, such as remapping the
>> memory MMIO window.
>>
>> Changes in v2:
>> * Separated Framework Laptop (Intel) and Framework Laptop (AMD)
>> * dev_warn has been demoted to dev_info
>> * Style fixes
>> * Reworded the individual patch bodies for clarity and style
>>
>> Changes in v3:
>> * Addressed dev_warn feedback from Thomas Weissschuh
>> * Removed the host command region quirk; Framework Computer is slated to
>>    release a firmware update that addresses the I/O region issue from
>>    this series' v1 and v2. This leaves just one quirk, with the potential
>>    for future quirks (e.g. changes required to reduce EC bus contention
>>    on the Intel Framework Laptops)
>>
>>
>> Dustin L. Howett (4):
>>    platform/chrome: cros_ec_lpc: introduce a priv struct for the lpc
>>      device
>>    platform/chrome: cros_ec_lpc: pass driver_data from DMI to the device
>>    platform/chrome: cros_ec_lpc: add a "quirks" system
>>    platform/chrome: cros_ec_lpc: add quirks for the Framework Laptop
>>      (AMD)
>>
>>   drivers/platform/chrome/cros_ec_lpc.c | 81 ++++++++++++++++++++++++---
>>   1 file changed, 74 insertions(+), 7 deletions(-)
>>
> 
> I tested on top of a Framework 13 AMD running BIOS 03.05.
> 
> I found that there are some errors shown related to charging abilities 
> for the PD controller.  Should cros-usbpd-charger support be quirked out 
> when run on a FW laptop?
> 
> [    5.545352] cros-usbpd-charger cros-usbpd-charger.4.auto: No USB PD 
> charging ports found
> [    5.546722] cros-usbpd-charger cros-usbpd-charger.4.auto: Unexpected 
> number of charge port count
> [    5.546730] cros-usbpd-charger cros-usbpd-charger.4.auto: Failing 
> probe (err:0xffffffb9)
> [    5.546735] cros-usbpd-charger cros-usbpd-charger.4.auto: probe with 
> driver cros-usbpd-charger failed with error -71
> 

They're all stemming from a missing return statement when no ports were 
found.  It shouldn't block this series which otherwise works fine.

Tested-by: Mario Limonciello <superm1@gmail.com>

I'll send out another patch to add that return code which can be 
discussed separately.

