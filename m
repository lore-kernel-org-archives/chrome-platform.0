Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA532D607
	for <chrome-platform@lists.linux.dev>; Thu, 18 Jan 2024 18:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705601875; cv=none; b=sqKzXqkBAZPzVIh1XS5UeWCk3oKktlsPRTF85r27wvMcKW4JYhnqQuzEOo0V0hMuttZgO+lQYGG23dGSQ+mO+G2m/HgpPBogk1zeBaLIeOQPCRzpQnTftA9FxpgzkLMKNYYNYLcmsDvHKcI5lDUSNqA4aZJRGnAFKYa8R6BzSBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705601875; c=relaxed/simple;
	bh=GgYxmDgNgkRKqRQU34wt4wjvEoRSOCZom/wFi94Q4D4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=orjqcYYqWspRjx4PmCLVx2KEYJ6Oo4VbvpK6smY9DJDEAmcgBVnZaX3Yk/DmFWnVB5X9t9X2EMRSpHMwD00Qy7Q6U8WspfH0/CvAvrjO2bU7eGMu/3bY7S3dvHjjHN6t5DFT0AQXxVnc8HeNfvP4PinK21Eb3ISXrpe1TyJRc+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uir4KLH2; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uir4KLH2"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d70696b6faso8314705ad.3
        for <chrome-platform@lists.linux.dev>; Thu, 18 Jan 2024 10:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705601873; x=1706206673; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=pl7+ELVBzjqED23yow1i0CKbGM/yfHUEyL86AcCYaaE=;
        b=Uir4KLH2liFG86r6SPoMhkBKdU2e2Jx9nA6/304ewqLzI9PHRU3a/HVUJwPJOTACTf
         LuJisZI86HHGH3bLhXxpqEsM8xfQp2vteyKWmMf219cEdxNQUiyKbYR9Gd2sovjWrwSz
         Vx3iz7Hbv0EaE2zs3CJjvOwivYCd9foN/LeY6o2PCbgFOsdyznqsKz1bnWcYD9vYurMB
         p9CrnZDKjyGTMYhWS2lyVtfhkDsz/F6Y30h3yXZApNStHcxikhA44/6RlkydHRaBMAg+
         EMmAOfAcrbg5UNKyiSB1Ki+MNPbx8rCiZi9SFqpz8KbTvPINXkSZlkZAGO8Yga9V1WAX
         J0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705601873; x=1706206673;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pl7+ELVBzjqED23yow1i0CKbGM/yfHUEyL86AcCYaaE=;
        b=ZIVBGy30jsatufBhi7qbaRzojYo9PI2usny3D3MXo8+gpKab8UtD1uxGkz5BGvA3jR
         IkqWKZ3S5S4Rya4XX+R92nmiCBKo4uRrZsm3pXxrvULgztQo2N8VkZja1gWuuSKLrabz
         +b1sdLhTo3/w5uAfhj8EbU63iK4sd41+UWT7j6Dy7SE8swXO/Lmxu/BKE5ffd/TO8qHb
         F852ICpJtg0425d86cyRfdaJQUIFHe3HtTWay2nMGRNmPUyPiIywn+Hr1EYtjSc6ckE7
         XidMcHpMGY8r3XJUYqxwfsHd7yDJXfXqwdzap6ZxtYoRWYf4ehYbkYy/zc6av5h3OUIt
         oG8g==
X-Gm-Message-State: AOJu0Yz/CZAGEIQvwyIyd3zuhMIG1wiIHxq4EuIXSMS3aP59zx8v6Dsz
	8RL0cH3/HgNs05DL+60QrNcFYFh4niFCJ5O+CmTMhDIrXFb57rc5
X-Google-Smtp-Source: AGHT+IFMKI/LJ1WWtT5pUFoflRfr9kprGoJjufAe4mNSBiLITfqi6LyetPhEVUTBOtx1ja5OK7fypg==
X-Received: by 2002:a17:902:f68f:b0:1d6:f27f:2b51 with SMTP id l15-20020a170902f68f00b001d6f27f2b51mr1463192plg.8.1705601872925;
        Thu, 18 Jan 2024 10:17:52 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id kx12-20020a170902f94c00b001d49608e3dfsm1687324plb.50.2024.01.18.10.17.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 10:17:52 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <82563d8e-5987-4a1b-8265-22d20f8d6902@roeck-us.net>
Date: Thu, 18 Jan 2024 10:17:50 -0800
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: watchdog: Add ChromeOS EC watchdog
Content-Language: en-US
To: =?UTF-8?Q?=C5=81ukasz_Majczak?= <lma@chromium.org>
Cc: Gwendal Grignou <gwendal@chromium.org>, Lee Jones <lee@kernel.org>,
 Benson Leung <bleung@chromium.org>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Radoslaw Biernacki <biernacki@google.com>, linux-kernel@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-watchdog@vger.kernel.org
References: <20240117102450.4080839-1-lma@chromium.org>
 <6b1190af-7b28-461d-bcd0-2aaeb0a1fa38@roeck-us.net>
 <CAE5UKNpLmN0sKktML1+hEzgRkHKS_X_wv==MPV8G5djeG+B9FA@mail.gmail.com>
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
In-Reply-To: <CAE5UKNpLmN0sKktML1+hEzgRkHKS_X_wv==MPV8G5djeG+B9FA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/18/24 10:08, Łukasz Majczak wrote:
> Hi Guenter
> 
> Please see my comments below
> 
> On Wed, Jan 17, 2024 at 5:23 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 1/17/24 02:24, Lukasz Majczak wrote:
>>> This adds EC-based watchdog support for ChromeOS
>>> based devices equipped with embedded controller (EC).
>>>
>>> Signed-off-by: Lukasz Majczak <lma@chromium.org>
>>
>> checkpatch --strict says:
>>
>> total: 0 errors, 0 warnings, 14 checks, 455 lines checked
>>
>> Please fix.
> 
> ACK, Although I would keep uint16_t/uint32_t types in
> cros_ec_commands.h as those are shared with EC firmware.
> 

Makes sense. Thanks!

Guenter


