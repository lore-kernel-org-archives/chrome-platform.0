Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE27265CC0
	for <chrome-platform@lists.linux.dev>; Tue, 25 Mar 2025 12:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742907311; cv=none; b=hX5ordA1qr6MhTEwAY/cB3zLhR28Hw+EKebU4UP14RwJAFkIF7VJxPM5NQ7SJVcjR4P6M0CDk3CI2GvXcvUMl90j8tXcXJPZeUDv7J+74ttumFZxGHM8Cr+6j0XzXk6jwIgSYLbDXHvEXhhpkfAv1t6xcZs7M2Qg3HE/SeLqUTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742907311; c=relaxed/simple;
	bh=sGjwtT0kQqdaclvo0LNNYYTMJppQyf4Ly9g9aW3Wghw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mMxCl7BL25JqRJAk1AkyEvrIzZ7FT1vGGyHeQ9yTX3IvvcWJmBHyn42/D0a4PhEc/ZgNUSz5nUmqgsdVjdOw08Ru3LjcBIH+LqX/M+E4RqpvH22l8mqUlJC78hs17Ecqp3S6/inZlNVrVdMyX2/N5lbusLpUbpDoTLKtLNm8Uf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/vZ02Rf; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/vZ02Rf"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ff6a98c638so11746302a91.0
        for <chrome-platform@lists.linux.dev>; Tue, 25 Mar 2025 05:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742907309; x=1743512109; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=D0M6Zo04/7HwG/RGrGKjHsDfbnEgUUvFdZ8bDedEanc=;
        b=m/vZ02RfF0TLq5TVyEF6SE3VdjIqZGptID/ztsDIvjsieL69uF4MD7kEc6q9CDK6s3
         NvmLm6TBWapD/wRCdb6Sfm+rXW24CzaAq6ZSB71pJfE6KwIl6xj0rKUuSGwwQ6NNOt+x
         BZ/20jhtZ5/1fA3TQyv+xDaEA/nUl1Ks5+4+8GOJRrwJCYFahIuaObzjRnvE7NfahMh+
         NmTSwmlrp7Rk79gpUg1ch/DGCzhwo9eXtik194vqtvkjrinYWoy44Y3mB/ilW7pwISt5
         iy3MXowNbZ/+iBo82UESQ/mJg5MinrRUtXAOS4DJ2WIoLKE4GfQSAUoGnxaR8U71gy1Q
         Bf6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742907309; x=1743512109;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D0M6Zo04/7HwG/RGrGKjHsDfbnEgUUvFdZ8bDedEanc=;
        b=xP0I/fMP+iSLD5O1vPo94P++/6+sWAXuFxqH1Vu9sGVcpQndexIr7IOjA9IaWLiQx6
         n8Ofg/vhHETcaEA/3sI4fc1S3vgPndxsK5mwA780Xxpe5TzA3AkOgrEC4ViYrgFoEvof
         hkUMYKm4xMMmjN2CGaJna62Im+oSVH60/b5sGL2CLGvtN/YJI08L4bkvYLQSvYfepvlI
         apMhe+mK6BfKhCLUhJNqoDiuqPXSu6plBBl0L/cs3c9VZ/+vkDlrWx1ck/EPfS4vCRxX
         MDr8T0ZdwenW+jQlKpQh+6Zyfmmw/KyzHNzPL4TplGLK5W8yo09XboEOrFQ5gr0hf5YP
         sIaw==
X-Forwarded-Encrypted: i=1; AJvYcCXXdptlk0W8EWCseZXzlWBMSCKzRCyhG45bF3WVqrDwl8sD9T/LLh2iKADXb5fF17FWWYRio3n7actae93A178=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3Euuxdx8G6C+2oULf5H2On7qgGPHaEeAbrU4nqpxlSSXMUhw2
	fi07lMwDumMW2Wzk2txHwnGhiid78uXQEo/8nC00N1pXR6TVfigS
X-Gm-Gg: ASbGncsf2FPbDhJe0BRaBtnyVrAhlmdfuVj2rD5wg2Z/Sxu6LX/DXjayX+i8S2YwnVU
	Rzipcv3pNWDSJABkzP9I1CkxPbv32eRoopTojww41W7WMTx4vBtikAMFg3zmxG8rbv7uRy8uN5e
	oYEpMmdcw474kjlrrX6I5nnLxGjPGR+l6BYWvJrD97LdqMhmiuOIesHWvAcMgGrjc3IPufngI6l
	WB3EGeMhONNpWM8Len1daecOhn/Du9CJMhETiTX3IeU4fgkB42YsSvD6r3EImp91mg9V5vMbxMy
	euG+Jd/Ki4rR9pGiRHq+I6XNUa2izvKIQCZxShjH4LE8rF6tLOZya3f2od6o24QDoU88hfBiIN/
	j7hZf8hP1YhE2Gd2TkA==
X-Google-Smtp-Source: AGHT+IGJ1A8WXkWv8tqL0/mNSt7XlUHjXISMclbtTcReoINaJs73G3ltq9M2MuxPVp6zEKsl6s0+Og==
X-Received: by 2002:a17:90b:1d46:b0:2fa:1851:a023 with SMTP id 98e67ed59e1d1-3030ff11268mr27748126a91.35.1742907309239;
        Tue, 25 Mar 2025 05:55:09 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf58c813sm14143078a91.18.2025.03.25.05.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 05:55:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <aa034893-405e-4f71-8cb6-0ccb112c36da@roeck-us.net>
Date: Tue, 25 Mar 2025 05:55:07 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hwmon: (cros_ec) Add set and get target fan RPM
 function
To: Sung-Chi Li <lschyi@chromium.org>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>,
 Jean Delvare <jdelvare@suse.com>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250318-extend_ec_hwmon_fan-v3-1-4c886385861f@chromium.org>
 <e4da28be-66ca-45d3-9ccf-34819460b463@t-8ch.de>
 <f50221fd-1d76-465b-ba53-62c08c6f8536@roeck-us.net>
 <780ce6e8-11fc-42be-b4a7-9cffbf811d78@t-8ch.de>
 <42c49b0b-cef0-49ca-a5b2-5bb05eae8dec@roeck-us.net>
 <45d0681d-3446-409c-8d9b-0309dbb93ff8@t-8ch.de>
 <7b5c4001-1a5b-4ea0-aca9-e0c88ec7a98b@roeck-us.net>
 <Z-JYQyxJErCQKo4i@google.com>
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
In-Reply-To: <Z-JYQyxJErCQKo4i@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/25/25 00:16, Sung-Chi Li wrote:

> 
> Currently, when sending the fan control setting to EC, EC will switch to manual
> fan control automatically. When system suspends or shuts down, fans are going
> back to automatic control (based on current EC implementation).
> 
> Do you mean the driver should not change the fan control method if there is no
> pwmY_enable implemented, or it is the user that should first explicitly set the
> fan to manualy mode, then the user can specify the desired fan speed?

The user should first set the fan control method to manual mode.

Unless I am missing something, setting manual mode means that pwmY_enable does have
to be implemented.

Note that the suspend/resume behavior is unexpected. The user would assume that the fan
control method is still in the same mode after resume. If resume reverts to automatic mode,
there should be a suspend/resume handler which restores the mode on resume.

Thanks,
Guenter

