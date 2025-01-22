Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CAA23A9
	for <chrome-platform@lists.linux.dev>; Wed, 22 Jan 2025 11:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737544719; cv=none; b=j3jjheDbHA87ZFraphexLZ5vPUXeM1t1ZjWmkLAT0BnS9gHpEYClXYPBt73oG8Blq6HOaTHHOrC80SmO6ylYkic88T88M6OWSbKkDwyS4ERvoB70TxuFydQHSlD/KInLopSpbrLZpxauPUrnpLzcSShuuX890nB9oLnnbDBVI2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737544719; c=relaxed/simple;
	bh=VkIsIxFqNnFXBeJpYhyYhbtCp2L6Z0FpexhGbCLsYwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pGWRBItwvuqdfGn8u8L26oT96Djn5RK/u6oXF3XaLSREF5P8ZLjAIJCC4fIKkxe6q0poOvL+oE3AHbugpQdQ/XCdAF+Yc7uFq0zdPb1zWhz1f8i7TXuwKWMrYHKpnmtPvzNtxCVkh/h13BVvxCgRsHiXGSlPe73Cj7aTi6aD2xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I1m9nIc4; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I1m9nIc4"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30613802a59so72658681fa.0
        for <chrome-platform@lists.linux.dev>; Wed, 22 Jan 2025 03:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737544715; x=1738149515; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IHnhEphz7DnDm4X924MxgWq7ImAvK6C+Os9CX2NZWyk=;
        b=I1m9nIc4s+HAL/12ZVhXxr1DHW/aHhHWiNqrLbt1j33B3a5SzYpFnCGJb2aXNSwZWt
         PNNjUSru+siXlxNK8Emal+trGaPKFKuST8Chpq2mlPc9Z3K4L/ekyrZ4un9VSPsgXo3n
         kIs92c4WSKFumkP8poTW5TwRmxIQAkU3mugBSzo6QK0uNkS6gMdq/xeHkV2qFrvFV2H/
         JV4jriL6wdQqt3r2rZ8X7U32owbMgMgUNkh4uvhLQ6jnip81ezc29AzpSZ0xpJjHvVT1
         yqSLCn/zxTZMcNzLlEZG+Mgnoph/4ibkC68gCt0KYsuz+xJFNvdIkL99fMmHqoozkgcr
         Maow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737544715; x=1738149515;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IHnhEphz7DnDm4X924MxgWq7ImAvK6C+Os9CX2NZWyk=;
        b=kHjHaq0ZMSgY5VpGfAAIXTabRAOvLGJHivrvOns+vSPrNmpNNC4UDXFiXzkAG0ku1+
         ueDGabppQLC3dIZYsfkCazJoPBLILReQjE3BGtU0MCGiKlwMsByPkKpJ+dZN24A8o9xK
         uHNRvqcXTRe6u2dv4Y0cIbaOJoE0B8GtHtIMarEVtZK6gAlBOBWwKeuT6ocdkZt/G3wW
         5BRUWEvp7mPifpixskcXs2qtoDJQ1KE5wW+USi7++uOwPFC0MVhaRJAh9O/4AkNnFfGq
         S0IhICPF0l1gz1RxRh+OFZCAkmnS0pntOKyba5hiVsuvwAVnsgPHYdW/Jhk8quR5jb26
         F75g==
X-Forwarded-Encrypted: i=1; AJvYcCWLOc2QROH26EkUmJSUqEsjWP/lJ+x5mprOU5ftpaJuGqUAwy/Lr8ieJNHseLS1gKJbKkmvHkb7zSmEyHhi4dw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwRP1GFzWXFuHyuf4lCa1nkUj6DlU+kQKcpYFrv2Ruk30EvCVUc
	BG7jtLKf5zoYPDJ/8mB9XOqspQZcNRLGfFHB+NnGsQg8NxUO9S55
X-Gm-Gg: ASbGncvdNGPjFBy7h5hgdCMdPKxBeUDI8QnyIGgzO1yZJCTI/rg2qvOA+83yZTpo+bl
	n3v7g/y3MFdYOB96Onl0mKEO3a7VYvvxYaYwFUtWdG/+sCqJqDVDK/pVurIlJxe1zVoam/1F517
	tc3glhG7Yh+sYfOzoS4WKV9jKD2KV4n5vPy3vOQ48aNFqJJOWp8tXvNp5voUajDVsug2z6pZxbv
	b6ilVL1Fui4jQOr2T7f8ZDxwNdiwjtmW7GCtlSw5sPrXbYyviqW9u32XGLUKQEl46INAX9zPyPw
	HB8l1Ww=
X-Google-Smtp-Source: AGHT+IFhihhIAFdpOqRUkM/GOfhDJsLCkBNl8oVs51jpSRx6+pmdoU/RFlOu7IKHaOw9TUD6UWkJVQ==
X-Received: by 2002:a2e:b8ce:0:b0:300:34b2:f89e with SMTP id 38308e7fff4ca-3072ca97ef0mr77473731fa.17.1737544715028;
        Wed, 22 Jan 2025 03:18:35 -0800 (PST)
Received: from [172.16.183.207] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a35a057sm26180611fa.48.2025.01.22.03.18.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 03:18:33 -0800 (PST)
Message-ID: <eb123791-a63d-4a59-a8c2-e7716201d976@gmail.com>
Date: Wed, 22 Jan 2025 13:18:31 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] regulator: allow user configuration of hardware
 protection action
To: Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Fabio Estevam
 <festevam@denx.de>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Jonathan Corbet <corbet@lwn.net>, Serge Hallyn <serge@hallyn.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-security-module@vger.kernel.org,
 chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
 kernel@pengutronix.de
References: <20250113-hw_protection-reboot-v2-0-161d3fc734f0@pengutronix.de>
 <20250113-hw_protection-reboot-v2-8-161d3fc734f0@pengutronix.de>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250113-hw_protection-reboot-v2-8-161d3fc734f0@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/01/2025 18:25, Ahmad Fatoum wrote:
> When the core detects permanent regulator hardware failure or imminent
> power failure of a critical supply, it will call hw_protection_shutdown
> in an attempt to do a limited orderly shutdown followed by powering off
> the system.
> 
> This doesn't work out well for many unattended embedded systems that don't
> have support for shutdown and that power on automatically when power is
> supplied:
> 
>    - A brief power cycle gets detected by the driver
>    - The kernel powers down the system and SoC goes into shutdown mode
>    - Power is restored
>    - The system remains oblivious to the restored power
>    - System needs to be manually power cycled for a duration long enough
>      to drain the capacitors
> 
> Allow users to fix this by calling the newly introduced
> hw_protection_trigger() instead: This way the hw_protection commandline
> or sysfs parameter is used to dictate the policy of dealing with the
> regulator fault.
> 
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

