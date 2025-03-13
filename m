Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AA41FAC57
	for <chrome-platform@lists.linux.dev>; Thu, 13 Mar 2025 23:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741909020; cv=none; b=bjHJe1ovnB66RKj+XyXLXE+z5WeIyWjaQxx4baPKLMpt1GPICJrg4I/I8S+yp27ZiMUOuHeWj7bqOWxCwyzYhcoBfUuj3p8/sxa5UhfL6LoG8zO6wwWzIP/TmCfcjmxpgJPAOBRI7pCBXg9JmyKH/kRmToqFTuvUGljFx+MFbOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741909020; c=relaxed/simple;
	bh=heNQMoaASzMgnAGg8FIo6sshUkCJ/+HlHZD3xDULFps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AejmL/L6g0ClJbB+3Hs+rksyBrAJdxSaEpVnaAS4Si9U5ZP91BjMeeq5/BswB5oFWPymtWDwDucBVXpxm/5cugmWQg1l0evwSp8XsaVN9qLFVRQxkEgsahf//Rzsnb8zSEUfF5lABm4y9vIdlrcswQRo/snP2aSX1BBj+TSlbwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZTG6xe2; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZTG6xe2"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-224019ad9edso40632865ad.1
        for <chrome-platform@lists.linux.dev>; Thu, 13 Mar 2025 16:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741909017; x=1742513817; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=pvZ3NjvDQucP+b6gUBiGyaTJOTqX9NynS/VORumDxWc=;
        b=NZTG6xe2cP12T3q8ekHVVskCO7xX4ErHQ8v6YwDw+QudcQDhhbRRlhbbNWVpq4eb6u
         tROAUTu0PLvS+pME2UJzx3GY3JCnANg99beaDPyO3YiKPxszY9bikMA4C97O7WX2wT0a
         ieNEokN8H59wdzn7v72fu18u+3NNzjDFPSz2eql+UW+0b9oISsmtAhO7ZSkWsntyEAdO
         WnG5Et54cGXpTPdVciYPOPRlswmaxnE8tbMUklqRkgtCb6LBEVsgYAAzSmdrb92keye5
         KoOmxQ48avJL4pRHpWtXo29IE3Po6ROuPyd3Xj1kQMsnJGKNgZ7c5LyFZOfFTvoy6Ip3
         Cb5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741909017; x=1742513817;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvZ3NjvDQucP+b6gUBiGyaTJOTqX9NynS/VORumDxWc=;
        b=m0Ilc/38kASKVXKJqngzw8RN5JdqWYsAFrUE67VTyWhN0nKlgI/ic0LAeGzqSJ8U6d
         21bk+syzV+O3pgKDaEVt152KRW1v6FYnaymX5OHPT1QtKq4kD4drrZKj4ihsXhTBD8C5
         nVcqPRUbK6AuIDBoJZNCNFUUN3zYWdB+Pa+fAV5XkOw7+dk/yZJVozGz4UWvYU3oiwSM
         Bhth4UVLnzcvmZ0FblLI8V7wYwDmsQ/eSZ7eYgRGocFpF94o3I4HCeXq64PL9fmifZ8y
         uYUblpkqZeU45ruVM8iGCwTLQ5AqNMXoXx8ZFMpdADoGQu4PUEgL7gZA2ykPyhvDfc4c
         WGyQ==
X-Forwarded-Encrypted: i=1; AJvYcCW09R3pJAHlyNKJNVf4SXnGzW+Eo1IL+vwlc9we3EZJpjZHlw2yT6b4oF/kAwFiY/yMAp9ARNZ9BgJE5tLn1Q0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yylzwp4OKffABeR/gL1R5wxcAK5FRDq/Ekz+wMmuoIVAR1mTix6
	Wi9mB7x3KPsunCR0RbT55URuuY//xpqqO6bZox1nzUnSErxZj7ZS
X-Gm-Gg: ASbGnctDrA6LNbANxw8V3uwZ8CrhSq97GCDWHE0EVwo87jCe4FeH3DnH2Bkpb2ScJvn
	dxeigRt24SwXNmsdQfLiBXHzUyXY0Wd+MKt95xYSuWB5tSj4iRFcNSLDI9smTr/cUJG2dE/nq53
	Br8cC7Qzn58jq25tyxbLFAeguswI8bUj4i31VpGxMlyVG5M5WhHi+gA8TkCjOvc3wWAICmrpY0F
	dgP9YUMpcv7kQIVLKYS+WZSYcTidbVjKZJZ/NXN/w2XKDLJ80Va1sfkCD/YrqpDhXFwnPqpy1tv
	axRvyoLr+xdQO3SZBMDM/8F2R7alwPiBjN2It2TbW76qTKw8yXDJwx3lGUDgdczKdVHDpPgbdBt
	cZlvTNTZvxVLKFyM3Cw==
X-Google-Smtp-Source: AGHT+IHFyhH8wq5/B3eBtB/BDaMT4VJzJIcP4ftczyi30Yl5qBqAadO5cNDN3vyAqKPlRi6a4pnncg==
X-Received: by 2002:a05:6a00:2daa:b0:730:8a5b:6e61 with SMTP id d2e1a72fcca58-73722311dc6mr474300b3a.2.1741909016890;
        Thu, 13 Mar 2025 16:36:56 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737116b2bfasm1976914b3a.177.2025.03.13.16.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 16:36:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <523fe47a-73da-4eec-80b7-61408e0ba27b@roeck-us.net>
Date: Thu, 13 Mar 2025 16:36:54 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hwmon: (cros_ec) Add reading target fan RPM function
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>,
 Sung-Chi Li <lschyi@chromium.org>
Cc: Jean Delvare <jdelvare@suse.com>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250313-extend_ec_hwmon_fan-v1-0-5c566776f2c4@chromium.org>
 <20250313-extend_ec_hwmon_fan-v1-2-5c566776f2c4@chromium.org>
 <782e6319-2082-4f05-9987-fa68439701ef@t-8ch.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <782e6319-2082-4f05-9987-fa68439701ef@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/13/25 09:24, Thomas Weißschuh wrote:
> On 2025-03-13 12:47:43+0800, Sung-Chi Li wrote:
>> Implement the functionality of reading the target fan RPM setting from
>> ChromeOS embedded controller under framework.
>>
>> Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
>> ---
>>   drivers/hwmon/cros_ec_hwmon.c | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
>> index b2fec0768301f116f49c57b8dbfb042b98a573e1..73bfcbbaf9531be6b753cfef8045fd5dab5b2ab3 100644
>> --- a/drivers/hwmon/cros_ec_hwmon.c
>> +++ b/drivers/hwmon/cros_ec_hwmon.c
>> @@ -36,6 +36,19 @@ static int cros_ec_hwmon_read_fan_speed(struct cros_ec_device *cros_ec, u8 index
>>   	return 0;
>>   }
>>   
>> +static int cros_ec_hwmon_read_fan_target(struct cros_ec_device *cros_ec, u8 index, int32_t *speed)
> 
> int32_t is a userspace type. In the kernel use i32, or even better u32.
> 

Seems to be pretty widely used to complain about.

$ git grep int32_t drivers/ | wc
   43662  192381 3555402

Also, in comparison:

$ git grep i32 drivers/ | wc
     820    4009   68486

Guenter

