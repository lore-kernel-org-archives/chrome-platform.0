Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712172556E
	for <chrome-platform@lists.linux.dev>; Wed, 18 Jun 2025 12:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750251214; cv=none; b=oVtOR5PEnX4XeMSpqBgxIwx48bVHnNujx1+sCOHQNu0kbgJN+PINfzdVcJjtXECBiBHE+fuq+TBXD6nWFsXEW7I6p3rfpZ3kSaK/CallpZd7nfpCMfJQ2iZnRIh7zcD98lonkV3T2siaSmrcz36U45Fxv2r97jZtSEKvaJU8kCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750251214; c=relaxed/simple;
	bh=sacsAAKCzzZLnS5k6vyAPfe6zVW2ePNHSkbl5+yXPEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ct4sX9Mql8ME+dGkid6YfnVvKyhpuzdx/skIXDFKs1qlX81Y9oRdEC7lrx5VxnBpwPVYT23K34wVHTi8qiQJ2rSuvXizLTOOsth0RLr4zH1L3b+YlS5MleLFWt4E+wJNVkVxRwVBvSRmJ1nMDdgoaybZJv/u2wUDyNLliomDSqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URbFHGzI; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URbFHGzI"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-747fba9f962so607593b3a.0
        for <chrome-platform@lists.linux.dev>; Wed, 18 Jun 2025 05:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750251212; x=1750856012; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=oRWjUaUzjwZIRs1Yr8RHoGlgQsJ2OGgk2bJ45eNBrT4=;
        b=URbFHGzIdJuuvYZVMNY5yBlT14nRLFfibPWAe2mDkV65KTZvAlpdrPsIMbFB2K2zaC
         qEwi+fkEaOWANrr3WvDRTsW+Dr/nRKXz/bdLni8AwvfwTgmVFeiNcENihzX1GQG80M0C
         Q/h792A4eCYQlZkH84kG2fyb1UUpEd8IkiT06rLZZEgbBHLbk/S5cI8DcG/BQXXblvyi
         ddmCLuThxuVhCUpjNTqNFdg2bONMqULa9iCG3FeFEB7AY42h+B5DheQkqSrpgKIx+E7h
         S5ko5IgFlzYVCnd1Uo7kTGp5GQyn6RfwhxSwB0nFL6QjMiF+xTYABZnj7W7he5dKlsZp
         v9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251212; x=1750856012;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRWjUaUzjwZIRs1Yr8RHoGlgQsJ2OGgk2bJ45eNBrT4=;
        b=ntOOmRvsfX6m6Ziob148udYyW6/lcTY+C2RjR/mL/d6SeUT8M5adK31secVLP83p5f
         +25/zViP1cbiGVlWtL0Iqx6aaF6++ayJCZbszQOwC7sew9lBLtlauXcmPLXUfVbhyiWk
         0vX6ruQ9jhuHQmEKwuWjnzcVyh8qETCi6I6d385vnh0S0dn8FXyrIowym7Hr3IRV4BT3
         K0nO6w7g/Bd8AkEBqOqBmyiplV2m9bX8CRzrJIjUhdXiUkINnq+BfsSRL7DYE0VgNs70
         QyQ7O02yDXtiVU2Ghv8nd4FwfVgFRR3bNkHFmEuVAF9yVitzc/6fA6AKnBndcUVJISte
         k0Zg==
X-Forwarded-Encrypted: i=1; AJvYcCV+msxqtqYcTxJJQ7SzIGjTJ+xRc0BE6UAtAWTL17iKKpLf6Tnto4sE4bXbuzquPtZRm7x72/jrrmHD+qh36u4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1yVPuxAPvUuhjNThLC7eK2KLS/sJqUDz+IAUuI8gLSpmJLzIz
	bUiEqjtQOYeOjaT45t+Fqd7uHktmuq9ZY2d237FEWgYWH/JydOfKyc14
X-Gm-Gg: ASbGncvIB8G4yWTy5e9VDkUl2heTuAMn9u8ZEgAHGJ1PL7VnZj+2S5HW/ecxLUxCyPL
	X1ko8T8A8a9VlvUim8e5uinRVm9HRafbKqjdoyUAIlYEeNpXeGnl+FOkFMrXjGdT2hgPlzvwmUE
	CLpKqJUKVMMT+FwgSizzsuy2GfyN9YU4xCviz2R4j1xV1NfxhEN4Ul1ZA3TcMf2BQvP12IBbR+t
	wPgEMl8vtn0ulWpjMA19egVEV2uWIpa28NX3AZITWa/cTotl3SK8lJ3q9ihBEoZ59MEX3zwt6qd
	W3qWjgt1mcSxeA1lTvT/3UtrjK8lkEbunO2bzZ9+igVyBCXp2F8Gd0Ao8YcM0LQ/ALIrjSBdvCC
	9yZRWvQ0ULmvNINxTZeA95QlamrkbPANY1YI=
X-Google-Smtp-Source: AGHT+IERtSS9P9ZtjKKvs3VvAEIr7hcaMZrpGn27OIO94ymZWevJlHzD/jO84tw7z3Fi0w6Mflbb+Q==
X-Received: by 2002:a05:6a00:180b:b0:740:6f6:7338 with SMTP id d2e1a72fcca58-748e6ec3dbemr3273988b3a.3.1750251211577;
        Wed, 18 Jun 2025 05:53:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffecfc5sm11231863b3a.13.2025.06.18.05.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 05:53:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6cd4eb0f-4b4b-4540-877b-6531023b4a5d@roeck-us.net>
Date: Wed, 18 Jun 2025 05:53:29 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] hwmon: (cros_ec) add PWM control over fans
To: Sung-Chi Li <lschyi@chromium.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
References: <20250512-cros_ec_fan-v3-0-a9f2b255f0cd@chromium.org>
 <20250512-cros_ec_fan-v3-2-a9f2b255f0cd@chromium.org>
 <ca2c10be-3dc4-45e1-b7fc-f8db29a1b6a0@t-8ch.de> <aFJqLkkdI86V3fM9@google.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <aFJqLkkdI86V3fM9@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/18/25 00:26, Sung-Chi Li wrote:
> On Mon, May 12, 2025 at 09:30:39AM +0200, Thomas Weißschuh wrote:
> 
> Sorry for the late reply, I missed mails for this series.
> 
>> On 2025-05-12 15:11:56+0800, Sung-Chi Li via B4 Relay wrote:
>>> From: Sung-Chi Li <lschyi@chromium.org>
>>>   static int cros_ec_hwmon_read_temp(struct cros_ec_device *cros_ec, u8 index, u8 *temp)
>>>   {
>>>   	unsigned int offset;
>>> @@ -73,7 +117,9 @@ static long cros_ec_hwmon_temp_to_millicelsius(u8 temp)
>>>   static int cros_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>>>   			      u32 attr, int channel, long *val)
>>>   {
>>> +	u8 control_method;
>>>   	struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
>>> +	u8 pwm_value;
>>>   	int ret = -EOPNOTSUPP;
>>>   	u16 speed;
>>>   	u8 temp;
>>
>> Ordering again.
>>
>> This should be:
>>
>> struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
>> int ret = -EOPNOTSUPP;
>> u8 control_method;
>> u8 pwm_value;
>> u16 speed;
>> u8 temp;
>>
>> or:
>>
>> struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
>> u8 control_method, pwm_value, temp;
>> int ret = -EOPNOTSUPP;
>> u16 speed;
>>
>> <snip>
>>
> 
> Would you mind to share the sorting logic, so I do not bother you with checking
> these styling issue? Initially, I thought the sorting is based on the variable
> name, but after seeing your example (which I am appreciated), I am not sure how
> the sorting works. Is it sorted along with the variable types (
> "u8 control_method", "u16 speed", etc)? If that is the case, why "u16 speed" is
> in the middle of the u8 group variables?
> 


It is called "reverse christmas tree". Longer lines first.

Guenter

