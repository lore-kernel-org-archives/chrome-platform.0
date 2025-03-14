Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A811FF7DB
	for <chrome-platform@lists.linux.dev>; Fri, 14 Mar 2025 13:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741959542; cv=none; b=aXjJSEhwyWqUAByK0FPZ1HpsKjUvWSat5XYEQNq21UM0KdyE+cli8wi3wzD5jItXhNuoKjcWeI9Urse2LkcUVlfphx3FsT8XM5P82vJY6or1XfNdqDgJvgk0uhxPSBARzCazG1IFqImVgT5TCzVzRmlV1Y+Z7VUu4N0yoyGiUPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741959542; c=relaxed/simple;
	bh=hCH0QbOU7YEFPetxxX91L6YysqIx/EQog2etLguJj28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=snp8BZ46eBrdPPDeXJZPjCXivKNyB0tIb5RxSZOpUa5R1TY627dsyvrrAssKNzLDioikTCMscz5s48RVn9g3MEzbeJ7U2gNrGZTvLstMdiECuYoH6J8ZD31BtRTfKB60qCsfxcMHUpErTgQ3Aq3o8Sgp5mb4l00LR+PKxhOkVcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e8d+vccu; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e8d+vccu"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54998f865b8so1876886e87.3
        for <chrome-platform@lists.linux.dev>; Fri, 14 Mar 2025 06:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741959539; x=1742564339; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZhzCTWJ98QeetX0Lqy44K0mjT6jwPvVzdYi9tkPlycc=;
        b=e8d+vccuNf8uCZtqXGRyKStEDkLsytw46giuFLK3T8iSnjnthPefz37/eAWOzi2qw5
         arULZ89zuORUfX1D7qdqcYIS615qUMNc6mLZog7tOhIPpKyRq+toqkKjduyhqnWH+yKx
         62Lppu3WpgRczs41sxEcKLJNGlgyjPSwC4PqowDhAXdpsbBHw6O8Cz0U0XKI1Gqs7Pm5
         TPyPUZgJl0ZrrNd+c3BTr/9nPPbP65S763+zP2aOX6tmNY8j+70l1Km6InLAQCDlcLiR
         CwDYtwq8CzOyWWuH6X9mXB7BplZ06rURwaHotJXmKRyldt9wrfU5WRQIVe2KkUI4I1Z6
         cPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741959539; x=1742564339;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZhzCTWJ98QeetX0Lqy44K0mjT6jwPvVzdYi9tkPlycc=;
        b=CvrUpTpO0biR7XRfRZdG/Kyv+QXWiP6l85ju9QFMRbNcBOKPU4B/BT92IYUE+yv5Yj
         y4Nd5HWkFDH45lfvtlDbJyzjbc5TKkoODjTOBd1HqxeWSt9jttc2+B8qvfC2P2bM777H
         BNNk5kA9mK/cwZXtGF6amzOch3vwgh4BKNgJrGDE36hBjYO95BCVzR2VVxL2l49cCdLj
         FFwiw3IbRHU6w5F5HrhyGw1df6qUyGRmW+4I7LUzDVczUxfKvZveRIPnzjCRCq3OTQdB
         JDePs4gTqXR+gpyFqqu+YLwWKJPgAmYp19NRL26AcP0xhiLftU1hSlkaP4EVnJHG6HvQ
         ZDrg==
X-Forwarded-Encrypted: i=1; AJvYcCW7Ui4tV29arKXacGPdiPHfXTzvJetR5VToiCnKlOcyrGDF/a7SfiqR/1syH5nEDEtfNh1DBdZGSQbbSlI+GIs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzK6xwljh3FHA1JQ6SBBdSxpOpGzyI9gbJ+nhMwbjEPvjXGq5Fc
	Wiq13GKGbeB+pjo+Tr1D+Zd94x6Cs6EsE6Ow7k5U42T/Du3iUSnj
X-Gm-Gg: ASbGncvDyvszWflLxdUM2MCjGZxD8wh7Lnt8NjOnYNRlHPlZNZ0Fj3MARMIETnd4HR7
	A3E2DCOWj056p025ZDOZgQvMDCF6wSVB5/1wrzx76VAlICvtrZhflz6Z/liGWCDcu2s1Pixe6oM
	qv5iZ9Ov5eT8l/t769vljyXU9neN4FzJme8zvBdsrBdoRrcirtUtq2kqM0KqbX/N95v1Vf+g1+T
	A0gmszb/a64ctlkJXV8IjpTOIoAboisW4pxcA3aEaEp6cnrVL4nEMQnJzyQ5fZ48wFiiz/E7mDO
	Wn7PFmpzmayDManP5c6QN8dPJiLBfgjDP+2AQuHtcDuUQvFpF6r2HtAF02hEbnX7/vY+pasfB2U
	dPjk+y177F/FzJ1S1Q6NbXm42Pg==
X-Google-Smtp-Source: AGHT+IH1My44mUZhsIp30MFzqw7ymCnGpSbaC4sDTDo0UIMwA5zmXEolpYiOvBXwOInnJCKMdYyptw==
X-Received: by 2002:a05:6512:b0e:b0:545:3032:bc50 with SMTP id 2adb3069b0e04-549c38fb8f3mr1052670e87.19.1741959538508;
        Fri, 14 Mar 2025 06:38:58 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba881f66sm525666e87.178.2025.03.14.06.38.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 06:38:56 -0700 (PDT)
Message-ID: <a8f76dd0-56be-46a5-9cc1-2d17d013127d@gmail.com>
Date: Fri, 14 Mar 2025 15:38:55 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] Documentation: Add sysfs documentation for PSCRR
 reboot reason tracking
To: Oleksij Rempel <o.rempel@pengutronix.de>,
 Sebastian Reichel <sre@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org,
 =?UTF-8?Q?S=C3=B8ren_Andersen?= <san@skov.dk>,
 Guenter Roeck <groeck@chromium.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, chrome-platform@lists.linux.dev
References: <20250314113604.1776201-1-o.rempel@pengutronix.de>
 <20250314113604.1776201-8-o.rempel@pengutronix.de>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250314113604.1776201-8-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/03/2025 13:36, Oleksij Rempel wrote:
> Add documentation for the Power State Change Reason Recorder (PSCRR)
> sysfs interface, which allows tracking of system shutdown and reboot
> reasons. The documentation provides details on available sysfs entries
> under `/sys/kernel/pscrr/`, explaining their functionality, example usage,
> and how they interact with different backend storage options (e.g., NVMEM).
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>   .../ABI/testing/sysfs-kernel-reboot-pscrr     | 46 +++++++++++++++++++
>   1 file changed, 46 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-kernel-reboot-pscrr
> 
> diff --git a/Documentation/ABI/testing/sysfs-kernel-reboot-pscrr b/Documentation/ABI/testing/sysfs-kernel-reboot-pscrr
> new file mode 100644
> index 000000000000..7cc643f89675
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-kernel-reboot-pscrr
> @@ -0,0 +1,46 @@
> +What:		/sys/kernel/pscrr/reason
> +Date:		April 2025
> +KernelVersion:  6.15
> +Contact:	Oleksij Rempel <o.rempel@pengutronix.de>
> +Description:
> +		This file provides access to the last recorded power state
> +		change reason. The storage backend is configurable and, if
> +		supported, the reason may be stored persistently in an
> +		NVMEM cell or another backend.
> +
> +		Reading this file returns an integer representing the last
> +		recorded shutdown or reboot cause.
> +
> +		Writing an integer value to this file sets the reason to be
> +		stored and recorded for system analysis.
> +
> +		Example usage (values are for illustration and may not reflect
> +		actual reasons used in a given system):
> +		  Read:
> +			$ cat /sys/kernel/pscrr/reason
> +			3   # (Example: Power loss event, may differ per system)
> +
> +		  Write:
> +			$ echo 5 > /sys/kernel/pscrr/reason
> +			# Sets the reason to 5 (Example: User-triggered reboot,
> +			# this may not be a real value in your system)
> +
> +		Values are defined in:
> +		  - `include/linux/reboot.h` (enum psc_reason)

Is it possible to provide the reason (also) as string?

I believe we should fix the meaning of the numbers so the ABI is not 
changing for the users. Hence we could as well document the meaning of 
the values(?) If I read the suggestion right, we will in any case have 
predefined set of reasons in the kernel side.

Or, am I missing something?

> +
> +What:		/sys/kernel/pscrr/reason_boot
> +Date:		April 2025
> +KernelVersion:  6.15
> +Contact:	Oleksij Rempel <o.rempel@pengutronix.de>
> +Description:
> +		This file provides the last recorded power state change reason
> +		from before the current system boot. If a supported backend
> +		(e.g., NVMEM) is configured, this value is retained across
> +		reboots.
> +
> +		Example usage (values are for illustration and may not reflect
> +		actual reasons used in a given system):
> +		  Read:
> +			$ cat /sys/kernel/pscrr/reason_boot
> +			2   # (Example: Over-temperature shutdown, may differ per system)
> +

