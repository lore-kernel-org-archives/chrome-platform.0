Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC31E1DE4DC
	for <chrome-platform@lists.linux.dev>; Tue, 18 Mar 2025 11:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742296663; cv=none; b=jX9a90BBKRjKsu34yBX+cxsEne7vvPSCkBaMy8nFMlWtAq7Jck5iQH3tFnniBR9KoMukHYa0QUOMuphEkyNBFSY3w/Ov4A0qpa3y0sjGCmaYP4nuQrMmc1cWr1ofijEwp4y+Y2ebNbEzMP4oxw3cnXks3NOQm/K4cVnaoMv30Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742296663; c=relaxed/simple;
	bh=2Ec7Z1ZyLJXW2zP9y6qMMcTSwNBqwQ7NVjLvy+7iE8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JKbveo4pDea2LAflq3D9wGIlLYQAW7x09mIr1o5sJAiuuAi86lvx0+rgJzAmXvj4OIlAOn6acfDhxUx1cWWH8OIPj03LAkLIZcFctl8OHc2uSBIW420yTDaMMy4/COMcCbnBDJlw54bEXypyss/Pl/Xj5mRpQpC1WQ9F6XIj/AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TaKaME/K; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TaKaME/K"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-549a4a4400aso5668758e87.0
        for <chrome-platform@lists.linux.dev>; Tue, 18 Mar 2025 04:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742296660; x=1742901460; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mOlZvPQ7plTaQIDmVp+CNwq3xUPH59xTsSW9rNTGInQ=;
        b=TaKaME/KHj1Gxi0zLeds1wXtlsz8ZkbCsOnPMdcWWha50Wb6Tz7PV5TwS5jQM3o+8E
         kWoHXbT0DaAxMFbnaHHiBCYoHBZ3ru77DQz9//f7L52TfO9HzuDfj0hYFJJhBk4Lcyhw
         lqmSdUwplKBGWVznN6J2cLlhe2X1+V53lGYw7/uTJKyMetz5cJg6AN4IplJofhYX6OEP
         ujclF0wm/ZOWLyaaz5dO2I4HKlRgH4qgbldfqOX6XIm/vUAiXw46KVlqpjNtimdckern
         l18ZSxuSpowW3XaP59FneEkbo5MOdebCtBjRWWAk6p4TQw0IoIYMiX6eZ6FAZvLihono
         joUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742296660; x=1742901460;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mOlZvPQ7plTaQIDmVp+CNwq3xUPH59xTsSW9rNTGInQ=;
        b=fNHKcdzZLN0OugEqyTxhpOqtKm0tgB3MFec0PUIfdF4C433WuLn0JHicW7e0UjhN+R
         5MZqrtMBRayAQTSLvahwaU8tl9YFv5Wj/CDwTqCqjzcV2pppvW7QVImtSiGV1dT3zoqs
         saGGmYxuLJrQ9mGiOT2455gbE9FwZhFnOhEq7FqHrCvCPaAsuEtPTsbD/8T8j18xf/SK
         ZeTYJArFTLTF4pPYImB7En54UqzmcDbO4NRYqzRoGNUnix/cj6sYU5fawglDmJQULDMy
         PS6c1nON/4Ctuk5Se+kft2XSRK9rEXru6NwyEj7u8UgoS0hdJysYb1hPZuXtVv1hH7C5
         DQbg==
X-Forwarded-Encrypted: i=1; AJvYcCXFPQszyiroio2wSXyjyBXJmn2TeNxrM9tMvFoA24SngMA+mO8rP8tjCvrx7aERkZDF7/JRMxCjwOADI3vmIrk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxxKv4oNsCWt6PTHuTS6HSua4mZb5/cAsrJsPHHp59ImMI9idFC
	7A7YGyt/pb3q3I4YGCRz8ZcHUCtCrJhvxOL2911X9XdOVtGM5now
X-Gm-Gg: ASbGnct8cCO2MkySvE8j/JcU1la1xYNzDSx2zPxG4PM2ICegCzk29LROJJ3KPfyVTw3
	2sVv4185YOJfNrZfz1Yc1EyXFO3X1uHrf551kkWRcPpP4F3/1RuWNwaqdcM8uqqnw3zxc+YWzfB
	TH3CzcQEG4UPYLGsRZnU3NkwInOmEh3uUppWKgs2trlljaInsHnEv7XuKDPlAbVDnjUZL6ME3RU
	DtAknVqWJ2wVMzIqQ7tbSJDMd/dK1mHT77ogYvzYQalbGJ/I5S2hz6OFpEcNCQkP6ddTPJVnF7t
	34r0cv+AB1VjbR+vThrsxIji4C71r7uBxKw+QdQ9VyYbmQl4DA7Qp4cmAvJ1HXvz/LjL
X-Google-Smtp-Source: AGHT+IHp+pjQHewdxhxdhXjAb7AHr19mAfFloImy7dF2DkvFzyLcoPPgreehc44oS0N8uADZE3CHGQ==
X-Received: by 2002:a05:6512:308f:b0:549:86c8:113a with SMTP id 2adb3069b0e04-54a03b8d777mr2826078e87.15.1742296659689;
        Tue, 18 Mar 2025 04:17:39 -0700 (PDT)
Received: from [172.16.183.207] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba864de4sm1621258e87.139.2025.03.18.04.17.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 04:17:39 -0700 (PDT)
Message-ID: <cda899c6-4330-465c-80b2-63c9da73505b@gmail.com>
Date: Tue, 18 Mar 2025 13:17:38 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/7] Documentation: Add sysfs documentation for PSCRR
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
References: <20250318094716.3053546-1-o.rempel@pengutronix.de>
 <20250318094716.3053546-8-o.rempel@pengutronix.de>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250318094716.3053546-8-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/03/2025 11:47, Oleksij Rempel wrote:
> Add documentation for the Power State Change Reason Recorder (PSCRR)
> sysfs interface, which allows tracking of system shutdown and reboot
> reasons. The documentation provides details on available sysfs entries
> under `/sys/kernel/pscrr/`, explaining their functionality, example usage,
> and how they interact with different backend storage options (e.g., NVMEM).
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
> changes v7:
> - document expected values
> ---
>   .../ABI/testing/sysfs-kernel-reboot-pscrr     | 79 +++++++++++++++++++
>   1 file changed, 79 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-kernel-reboot-pscrr
> 
> diff --git a/Documentation/ABI/testing/sysfs-kernel-reboot-pscrr b/Documentation/ABI/testing/sysfs-kernel-reboot-pscrr
> new file mode 100644
> index 000000000000..9aa3df8f2fc7
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-kernel-reboot-pscrr
> @@ -0,0 +1,79 @@
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

nit:
Now that the 'number' <=> 'reason' relation is fixed, we might drop the 
"may differ" etc. Perhaps just:

		Example usage:
		  Read:
			$ cat /sys/kernel/pscrr/reason
			3   # (Example: Power loss event)

		  Write:
			$ echo 5 > /sys/kernel/pscrr/reason
			# Sets the reason to 5 (Example: User-triggered reboot)

Maybe adding a note that not all values are supported on all systems.


> +
> +		Values are defined in:
> +		  - `include/linux/reboot.h` (enum psc_reason)
> +
> +		Supported Values:
> +		Defined in `include/linux/reboot.h` (enum psc_reason):
> +
> +		+-------+---------------------------+--------------------------+
> +		| Value | Symbol                    | Description              |
> +		+-------+---------------------------+--------------------------+
> +		| 0     | PSCR_UNKNOWN              | Unknown or unspecified   |
> +		|       |                           | power state change reason|
> +		+-------+---------------------------+--------------------------+
> +		| 1     | PSCR_UNDER_VOLTAGE        | Supply voltage drop below|
> +		|       |                           | safe threshold.          |
> +		+-------+---------------------------+--------------------------+
> +		| 2     | PSCR_OVER_CURRENT         | Excessive current draw,  |
> +		|       |                           | potential short circuit. |
> +		+-------+---------------------------+--------------------------+
> +		| 3     | PSCR_REGULATOR_FAILURE    | Failure in voltage       |
> +		|       |                           | regulator, preventing    |
> +		|       |                           | stable power delivery.   |
> +		+-------+---------------------------+--------------------------+
> +		| 4     | PSCR_OVER_TEMPERATURE     | Unsafe system temperature|
> +		|       |                           | detected by sensors.     |
> +		+-------+---------------------------+--------------------------+
> +		| 5     | PSCR_EC_PANIC             | Shutdown/reboot triggered|
> +		|       |                           | by Embedded Controller   |
> +		|       |                           | (EC) panic.              |
> +		+-------+---------------------------+--------------------------+
> +
> +		(Note: The actual reason codes used on a specific system depend
> +		on hardware capabilities and configuration.)

I like this. Nice and clean.

A side note which you can consider if you feel like:
This, as far as I understand, will also make the ABI out of this. So, 
perhaps there should be comments in enum psc_reason and the defines in 
Defined in 'include/linux/reboot.h' that they are part of an ABI, and 
must not be changed? I suppose user-space tools may get unhappy if these 
values change between the kernel versions.

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
> +		Supported Values:
> +		Same as `/sys/kernel/pscrr/reason` (see above).
> +

All in all, this looks very good to me.

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Yours,
	-- Matti
