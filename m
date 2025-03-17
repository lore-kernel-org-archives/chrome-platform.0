Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E231552E3
	for <chrome-platform@lists.linux.dev>; Mon, 17 Mar 2025 08:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742201166; cv=none; b=SZ3RScazFrhWtwmEbD6KQnK96gHXKJlxxQIZW5/2GGR3XS6qCjdQ99CHRd5cNvuhiCFU7miKbaAEga8AXxlR4X1FonvwChTEYalsPfD3xFbZU5DrvVKwYMBVmnNvSmI09n5oBAdzi4/mp6272myk8uCgB+Wdo7DYaBfAcrMk38M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742201166; c=relaxed/simple;
	bh=HXbTEk6n3QynE7gKkPGXFKjRIRjrNpjqXDTnnipaiRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TAPjJ0Akd0svKdOHH1Io6LrtfttFKfpDlFWpqyYor8snITeVIBxQJnQ4NF+rkyOceqe8CzfKCdTS09BtQ+H75glfqMtYOXzQFJi4JqFVQqJVVRLQ2fQ4laI4WXM3irmtCiPHCMSHLYsKuFiwVSMfVS2K+2a5ufeLv1PNQMakIZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1++4Wfm; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1++4Wfm"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5439a6179a7so4654200e87.1
        for <chrome-platform@lists.linux.dev>; Mon, 17 Mar 2025 01:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742201163; x=1742805963; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MxbiKv6elGIs5Nn4LiqGeMrFmApt2xh9/qpgGFawsLg=;
        b=d1++4WfmRh+/w0MxZSOnmPF4VfC3KoGpibb52Rh+jp5AJZj+2GlhhEsDhNDWh5Gbw2
         a+41vGnU63UBo487TRs8mdffYep+oRF5vLRkVYliKEijvSr7CSkqSruaV6oZfiZFL0FQ
         7sSL/PwsCMRcanl8hI1kLDniVMOz5A+HaegM5CuWxKsydhzKvSmoc8MEULd7aTKJ/pfX
         aItxnjcEfO1Ort1qeM28knWnjSRBKLQNAbrZMth+4IBYHLBoGbBN8nYDGpg4uxm3jA0T
         /hrz0PSUw3eVaOckl4oOYlUOuwZN/4c0Co55fuZkxLcD0H9YS6WzHJTNYTYyjmUFSYV4
         V5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742201163; x=1742805963;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MxbiKv6elGIs5Nn4LiqGeMrFmApt2xh9/qpgGFawsLg=;
        b=eAgixjK0IUIjd2yOrwa96vq7Lrj2T6LdrPNWObOp/OvdPA7B0yrK1K3LlQ+wy8ZvaU
         HYBxpp+CmU5+VpbTu0RisON8F3KpBz4gvBn1GS1MtusuYV07XZN9zR9eknZPhAx97/5P
         BuqbS9Pif+r5DWxtmljaQYOQcRZAq+cRmOy7fgeg6vr3NsPQzy/nmTiLsf2ZOJgaC5QD
         dCIPTVg8tfJzSNJ3yz1n2zR7ecIXeY+ykmoAp6F2ATTAXyb6kcJKjVkfSEAZ48Os1siA
         6tmgViF5JmqIcn7vW21bCprWLgcOG/Mdr9xx4L9bkHv6Lm12R0A44kcWir63xOtwBpda
         JumQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjJ5YvHnk7yRpwEBdVl59daO1897Ss4C9LgTli45ty8cIe37FqbJESwVn6AkjoOTvp2Y79RZ93SK8IIo3U5QY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9hRu/nHHBBobvgDbBAakwokMOrtmvaFkQEjtARTtvKEEKpUYW
	UZSbocxD862oM9wLi7meWx5AiMej5+Oe5j2AGHcTlsha56c6VL5KZuYeHA==
X-Gm-Gg: ASbGncvRg7zagzxansxVeiLLcwQYCXuVsBKI4L+qT/MR7GFBwYadCqDsvIZ0Jeo/EzM
	OEVfLp7ougGYDT0UyPDPSlnvY8YuGJ8Iwe57+3NTW5KjoaitKup3ehebngSemYygB4hSEve6G1Z
	c5jjhOrNqnJjx50uAIkcDqfjDZE+Tg3CjfIk+7m7lsWzJCqRy+tz6npBICqArMrkj21eD9j45x4
	QsTAIVyeXLTuoCuhUgTm+cMFbXX9xIEnYzY4kEuQunYRThTrecDEgmp/x+T7wKKTSlhi9ZY2FER
	t4DMWnkfNYkJwkwd+7fW02ATfnyowbEaCRoABQGZoyCiUAweOfm2UmgS8e8FfQqOw3UywXp4ICl
	eCTwf4SqeKA/iDsU0hvXezklmWQ==
X-Google-Smtp-Source: AGHT+IFeAg/G8whxA4gtxiYZbH0SjBZ7xoClvaA1Vcblwhy4bW0jCjldjrGw6uW7vsQd59L9ZAQ4WA==
X-Received: by 2002:a05:6512:3990:b0:549:68a7:177c with SMTP id 2adb3069b0e04-549ba3d563fmr7023614e87.7.1742201162859;
        Mon, 17 Mar 2025 01:46:02 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7a86c1sm1281669e87.21.2025.03.17.01.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 01:46:02 -0700 (PDT)
Message-ID: <a34c14c1-875d-40a4-8019-67f7b9aa4133@gmail.com>
Date: Mon, 17 Mar 2025 10:46:01 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] Documentation: Add sysfs documentation for PSCRR
 reboot reason tracking
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Sebastian Reichel <sre@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, kernel@pengutronix.de,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 linux-pm@vger.kernel.org, =?UTF-8?Q?S=C3=B8ren_Andersen?= <san@skov.dk>,
 Guenter Roeck <groeck@chromium.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, chrome-platform@lists.linux.dev
References: <20250314113604.1776201-1-o.rempel@pengutronix.de>
 <20250314113604.1776201-8-o.rempel@pengutronix.de>
 <a8f76dd0-56be-46a5-9cc1-2d17d013127d@gmail.com>
 <Z9Q4z2dPdpqVcu6u@pengutronix.de>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <Z9Q4z2dPdpqVcu6u@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/03/2025 16:10, Oleksij Rempel wrote:
> On Fri, Mar 14, 2025 at 03:38:55PM +0200, Matti Vaittinen wrote:
>> On 14/03/2025 13:36, Oleksij Rempel wrote:
>>> Add documentation for the Power State Change Reason Recorder (PSCRR)
>>> sysfs interface, which allows tracking of system shutdown and reboot
>>> reasons. The documentation provides details on available sysfs entries
>>> under `/sys/kernel/pscrr/`, explaining their functionality, example usage,
>>> and how they interact with different backend storage options (e.g., NVMEM).
>>>
>>> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>>> ---
>>>    .../ABI/testing/sysfs-kernel-reboot-pscrr     | 46 +++++++++++++++++++
>>>    1 file changed, 46 insertions(+)
>>>    create mode 100644 Documentation/ABI/testing/sysfs-kernel-reboot-pscrr
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-kernel-reboot-pscrr b/Documentation/ABI/testing/sysfs-kernel-reboot-pscrr
>>> new file mode 100644
>>> index 000000000000..7cc643f89675
>>> --- /dev/null
>>> +++ b/Documentation/ABI/testing/sysfs-kernel-reboot-pscrr
>>> @@ -0,0 +1,46 @@
>>> +What:		/sys/kernel/pscrr/reason
>>> +Date:		April 2025
>>> +KernelVersion:  6.15
>>> +Contact:	Oleksij Rempel <o.rempel@pengutronix.de>
>>> +Description:
>>> +		This file provides access to the last recorded power state
>>> +		change reason. The storage backend is configurable and, if
>>> +		supported, the reason may be stored persistently in an
>>> +		NVMEM cell or another backend.
>>> +
>>> +		Reading this file returns an integer representing the last
>>> +		recorded shutdown or reboot cause.
>>> +
>>> +		Writing an integer value to this file sets the reason to be
>>> +		stored and recorded for system analysis.
>>> +
>>> +		Example usage (values are for illustration and may not reflect
>>> +		actual reasons used in a given system):
>>> +		  Read:
>>> +			$ cat /sys/kernel/pscrr/reason
>>> +			3   # (Example: Power loss event, may differ per system)
>>> +
>>> +		  Write:
>>> +			$ echo 5 > /sys/kernel/pscrr/reason
>>> +			# Sets the reason to 5 (Example: User-triggered reboot,
>>> +			# this may not be a real value in your system)
>>> +
>>> +		Values are defined in:
>>> +		  - `include/linux/reboot.h` (enum psc_reason)
>>
>> Is it possible to provide the reason (also) as string?
>>
>> I believe we should fix the meaning of the numbers so the ABI is not
>> changing for the users. Hence we could as well document the meaning of the
>> values(?) If I read the suggestion right, we will in any case have
>> predefined set of reasons in the kernel side.
>>
>> Or, am I missing something?
> 
> Yes, it is correct, the values should be fixed for user space. Should
> they be documented in this documentation too?

I believe it could be helpful for both the user-space users and 
potential pscrr provider driver writers. It could also set things to stone.

But, I don't have much experience on the documentation like this so 
please treat this as a suggestion - but do as you see fits best.

Yours,
	-- Matti

