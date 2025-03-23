Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB909444
	for <chrome-platform@lists.linux.dev>; Sun, 23 Mar 2025 16:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742746933; cv=none; b=alJmQlBeSb99R33zy1QVNpeyl1qKC8T0hwuvoY2cUNA2bjMrjGgg+VzGk9jFxeD8gbMTfygvFkyYmYd01dfw6WhW0MecwEstaIZSlTpMEBZypH756iKC1XkXajTeAMBFD+28jM/hT+fLlbZzB+pAkmRgrXT6U3a9qYqZkn3lh5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742746933; c=relaxed/simple;
	bh=q036Fe1iv7cT4AB1zv/nFiTHRNdV9yUpdS90/TLI2GE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oGNSdkJfBc0AMfesphYkXjWelI5ohR+fifUEvFfC7ZuwTW8TCQT2gN9fL8/9uYPXGrKAh1YHyltufpvxdRWODJ5zGQOtDsZI6AJj7TvnBqU9HSiiVTkS/ij60xEhkSHqmlL1PDq+yvdqiVLkQiT0VazJLE98KJfzZ8k7d2t4Eek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eI9v/Vkf; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eI9v/Vkf"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22548a28d0cso57253235ad.3
        for <chrome-platform@lists.linux.dev>; Sun, 23 Mar 2025 09:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742746929; x=1743351729; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=pTdAK/wKY7jfSKtQEJkVe+qAv5L7d4bZvz1PDGMc/tU=;
        b=eI9v/VkfS28wEnXZwoeaimiN3B3HqSDJGhzQDpo2QHnUhYW28LuTRjKBqfEv+jUFzS
         1k3vKGoPT3sBjYX45somGP4a/FQ+sEEHhN7xVlB9tn55s3Xaaxl5qjjvzDeyIP6xK7OY
         nV0Oa4LZU+X4dfKRYcxCtZuBS6ttIVgL7V75K7ydFSwPj2ZN/cU89Xcjp31O8Aij2xEI
         rH2sIX78HQuIsFujLLlMoYDB8K4S/vErVVMwmKGjvNYpa0wBR6Qtud+ACve2OrGXj40R
         1EkCE9nCSEBPb17ofcLwvIi3LFwpZuLtnmUP/WoiTi/CgAJE0ielkWdTDFI6/hhSVAXa
         qvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742746929; x=1743351729;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pTdAK/wKY7jfSKtQEJkVe+qAv5L7d4bZvz1PDGMc/tU=;
        b=UE9A6D6A9jbpy/ZtAhyazp8qdrqIHSGxkMhqokHIAmL+0C1BCiL08mY2vTvKd6Q3vi
         QrAGogu9bDFCcaBkpW3gvy8Sh78eF41gg3phm1krjaKlXCmaAjegIOayzbd+Gx+PQcz4
         JaQxZhKWl4Y5AhzedwQMZf3kTr+oC8Q3443nyTBsabTYVHNeVpfYTa63JOabtGKYFWnO
         QGhzo99nvf1N07b8bEhaGgOHE0Rwp4u4uHV1EPs9u1dMbn/ViWVE6N3Q+KVx6jxIStPX
         I+Ad1BMHgaDfyJt3d9w7sPwuhjMN/UWp0cq5KxL1euBiXF3/zxUUBj3s815MlFTSgNym
         79mA==
X-Forwarded-Encrypted: i=1; AJvYcCU4gaIUJuJ6Pvh0B4/QQI41kPXwJjayIkMZWfz4aAMwHiJ+L/SuUg1bznxwDdfgI0YFepeatAlIxb9nACS6e7s=@lists.linux.dev
X-Gm-Message-State: AOJu0YwSdELANytfWql24Ntx+xJZOtsrQ7xbX4GBvDZXF+58QOGnAbap
	8tf780ycLwl6yvYRcm+uH2wE1ky+ugMcnp0PsIkPHx39N5kHapz0
X-Gm-Gg: ASbGncun4Ou3uoF+8sAYweZCJq8hdYetYYxZ6GpkSSeVJwFYrgbgAst3CC+L/aPKmHZ
	0Q2h5q12cjK4VVqDzTllsbtiXwdJRMFQH22tuqzRY/CnCDcPt5y7upM3zo1H6pnQVkligt5Pi6Z
	eZGgWxI9t/N48LQBmh62cOno3+Z2m9TSZbjcfYw3s/GVIbsHlsvVxVKlCFC4LykhWNNaTjxLzPX
	rFnVBx5qzEeq3gyrpVsztXev4w/xsSuO4ZYgyMZpgeC+qbH6S46zO/1rwtjdX/53/F0NoCNpZES
	r/Y+XVB0QL9HlY7l9RnVgaIDbiqONtwNuhLr72iejVhHxE/sLKtGQLGMKbMGwoli9t21wkL3p+P
	7T9pWEIULyus/IECpog==
X-Google-Smtp-Source: AGHT+IG6VUBxkvp+7lvxHnroaakUBVaLpnjcK/uvgzdR3iT+X6iOcICEAXpe7ZWNj+UCrT+OXfH2xg==
X-Received: by 2002:a17:902:d2d1:b0:224:24d5:f20a with SMTP id d9443c01a7336-22780e231a1mr188255455ad.48.1742746928770;
        Sun, 23 Mar 2025 09:22:08 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811c1b8fsm53154905ad.154.2025.03.23.09.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Mar 2025 09:22:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7b5c4001-1a5b-4ea0-aca9-e0c88ec7a98b@roeck-us.net>
Date: Sun, 23 Mar 2025 09:22:07 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hwmon: (cros_ec) Add set and get target fan RPM
 function
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>
Cc: Sung-Chi Li <lschyi@chromium.org>, Jean Delvare <jdelvare@suse.com>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250318-extend_ec_hwmon_fan-v3-1-4c886385861f@chromium.org>
 <e4da28be-66ca-45d3-9ccf-34819460b463@t-8ch.de>
 <f50221fd-1d76-465b-ba53-62c08c6f8536@roeck-us.net>
 <780ce6e8-11fc-42be-b4a7-9cffbf811d78@t-8ch.de>
 <42c49b0b-cef0-49ca-a5b2-5bb05eae8dec@roeck-us.net>
 <45d0681d-3446-409c-8d9b-0309dbb93ff8@t-8ch.de>
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
In-Reply-To: <45d0681d-3446-409c-8d9b-0309dbb93ff8@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/23/25 09:05, Thomas Weißschuh wrote:
> On 2025-03-22 09:10:40-0700, Guenter Roeck wrote:
>> On 3/22/25 08:23, Thomas Weißschuh wrote:
>>> On 2025-03-22 07:12:48-0700, Guenter Roeck wrote:
>>>> On 3/22/25 06:55, Thomas Weißschuh wrote:
>>>>> On 2025-03-18 15:45:23+0800, Sung-Chi Li wrote:
>>>>>> The ChromeOS embedded controller (EC) supports closed loop fan speed
>>>>>> control, so add the fan target attribute under hwmon framework, such
>>>>>> that kernel can expose reading and specifying the desired fan RPM for
>>>>>> fans connected to the EC.
>>>>>>
>>>>>> When probing the cros_ec hwmon module, we also check the supported
>>>>>> command version of setting target fan RPM. This commit implements the
>>>>>> version 0 of getting the target fan RPM, which can only read the target
>>>>>> RPM of the first fan. This commit also implements the version 1 of
>>>>>> setting the target fan RPM to each fan respectively.
>>>>>>
>>>>>> Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
>>>>>> ---
>>>>>> ChromeOS embedded controller (EC) supports closed-loop fan control. We
>>>>>> anticipate to have the fan related control from the kernel side, so this
>>>>>> series register the HWMON_F_TARGET attribute, and implement the read and
>>>>>> write function for setting/reading the target fan RPM from the EC side.
>>>>>
>>>>> Should it be possible to switch back to automatic control?
>>>>> I can't find anything in the hwmon ABI about it.
>>>>> And neither in the CrOS EC source.
>>>>>
>>>>> Am I missing something?
>>>>>
>>>>
>>>> Not sure I understand the context, but the fan control method is normally
>>>> selected with pwmX_enable, which is defined as
>>>>
>>>>                   Fan speed control method:
>>>>
>>>>                   - 0: no fan speed control (i.e. fan at full speed)
>>>>                   - 1: manual fan speed control enabled (using `pwmY`)
>>>>                   - 2+: automatic fan speed control enabled
>>>
>>> So far I associated pwmY_enable = 1 with the pwmY attribute.
>>> Also controlling it through fanY_target does make sense though.
>>> It could be clearer from the docs IMHO.
>>>
>>> That also means that the patch under discussion needs to implement the
>>> pwmY_enable attribute.
>>>
>>
>> Does it ? Does setting the target fan speed automatically change the fan
>> control method ? Normally that is orthogonal: One does not necessarily
>> want to enable a specific fan control method after setting a single related
>> attribute, but do that only after all attributes have been set.
> 
> With the currently proposed patch setting fanY_target automatically
> switches to manual control. And then there is no way to go back to
> automatic control.
> 

The driver should not do that.

>> For example, there could be another attribute specifying how fast the fan
>> speed should be adjusted, or there could be minimum and/or maximum permitted
>> pwm values. I am not saying that this is the case here, but setting a target
>> fan speed should not automatically change the fan control method.
> 
> Makes sense.
> This goes back to my original question: If pwmY_enable is *not*
> implemented, how would it be possible to switch between the different
> mechanisms?

It isn't. However, as I said above, the driver should not change the fan control
method when writing fanX_target. If that happens in the EC, the driver would need
to check first if it is in manual mode and only permit setting fanX_target if
that is the case.

Guenter

