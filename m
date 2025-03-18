Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45482080D3
	for <chrome-platform@lists.linux.dev>; Tue, 18 Mar 2025 11:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742297178; cv=none; b=B+Sp7HDO0Pr3bNZcYvWHPEM0S9yhkLxGUmNE+d2pJYI6S4xuZvAkBf+bi5A0774qTgwOg0FxiTyngBqF0TmNiauCDiYy0uedOo/l8oJ/zVbgMiIdQzPVG7ZkVMl/gpyLMcBYh99UqHjrFJXip/LElmI9zZO4UgFgq3UXaa0n5zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742297178; c=relaxed/simple;
	bh=V0jgOiffCLkxm0OMAOIqhoH49dNtMd4X/16OaH5jjwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uhAsYBFEfe5Be0PnyFiLhzg77K3UuObaRR9DIvHKGNrTDjc9PHmiZC09nNFHZN7QT/DG6gk6HvI9ZUu0Nt+efTK/ptojREawdiCfyhE+YPZPL1XaizJk2r+1UgNPtjL9Un6zc0beGfMRUliMlUa89ClC0g8GJrr9y/jZ/85CYW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7kEYJcw; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7kEYJcw"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30c05fd126cso52013361fa.3
        for <chrome-platform@lists.linux.dev>; Tue, 18 Mar 2025 04:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742297171; x=1742901971; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=btQLCq7XpQDCc3ShAJyVvb50nNp5mbjOUHKo263Hklw=;
        b=Z7kEYJcwIIJE7GV1WhQiw/9xyKAKOA52nlIDJDkgOufhD0kLVldV6QrUgbGw6wdegV
         6Ff57v1CsHDYuxKUvM57C/c9NQvKsv1oIzijKAtRMiiBWvrcCNf3v3Pl4JfE5lRB2lHj
         v4yG/THpr0U2eH1SO6nRJsL8n+ckQcis6fo94Xt9QvtbyPeaIpH0KyzKNx/NhORgq4k3
         0xvDqpFKBfMqeMJL6kCl15uSI5tZpFW7grI/+geRTCIZPorQ7ICLXNVu5fOkZX47LRrD
         4zuAqekOvEuNPrIhlFpyruIT/IjANbctCckWC+ZNiwFrjkiVCLII/wFjUGZMt6liSNzM
         mcpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742297171; x=1742901971;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=btQLCq7XpQDCc3ShAJyVvb50nNp5mbjOUHKo263Hklw=;
        b=JpN4IRvJhHS38A3vwhr1Rh6AjwgjoNUhxO/57mHBV3pB87omNvwHcUWKbzLbxmZUkF
         Xk3ZJWSVkxuf1cwrAgLQYuiSwT8fqNWHZ0dmOWR+xqvRFTghVFQmy3yHfHg8BPQ3FEgi
         paPd4arjpk2ScDVRqJ3+32u8FkM/v0kjpMQY4y7HW6V9HsFbVD9l94kAtxVzvzdJ4PKi
         j+91jTMr42eBErOrqSbVV353OE1Jfx+o8tyLnj2JeESjsvvGuwz17THeqECh3Caj+V4J
         /+mTVqfLvT6X64Qi8yEd0xu1Pq+BBLaQz7empIXP8+UYCu6JLly+yYVwqU2uYhW+p3Db
         cLNg==
X-Forwarded-Encrypted: i=1; AJvYcCW0P1nROOIgrKUQ8A0wXekLrLmQ/U/87A9li6jjd1YWGiO2spXQKR9xkX+JLBxLMdHw7gs76WOePMxXx821zkY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRHCMKJalI8PBewu8YlECpSHdJAMMu0iL7oE77xjpZ5P1RmurH
	kaT90T+evEMfWMzleGULOXL8wTgFE9zRla7g4lzMpjG0MePj1xfB
X-Gm-Gg: ASbGncsamwl+I4mbmMvhOvJK/qhusMdx6YxfPVfuRgptxjs8H+VBMxUfCJKKpIHGzK1
	8iHThqj1vc4nSv+wPRtPXjXcMUhKY+s1EILZdkoIjnj9vOUbyd+9qdb7PgpMCeLBo6EnMgLVbqO
	MmyCy0S2ginmxbodsE7s2uOlpLGuF9RJmrgr74b7zVIwE4FBs7q0hUtR8PynHahEsgbcgzQapVb
	zyMcFo++s7iyk4oh5NUI7fNVrlE35wmtq0MowKv/SPiEUg0uozq7zvMbO1oh1HY3Liy9cYTCoJ4
	Q2ZbL0uZF867MpvF1dvJ1lG1VDkemtOGLyIxTj/GY2ocneguuGBh1lhrYg==
X-Google-Smtp-Source: AGHT+IHzlAWaDOts8D3ujQUd5J6woXe3kP3cM1wyrozycFymsmVYWCH0d8Z8sZUCZAPAcv22hhV2VQ==
X-Received: by 2002:a2e:8844:0:b0:30c:514d:92ed with SMTP id 38308e7fff4ca-30c514d9327mr82647391fa.14.1742297170547;
        Tue, 18 Mar 2025 04:26:10 -0700 (PDT)
Received: from [172.16.183.207] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f1c306esm19038491fa.72.2025.03.18.04.26.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 04:26:10 -0700 (PDT)
Message-ID: <e87c1389-c173-47ee-8b01-cb0764a55afc@gmail.com>
Date: Tue, 18 Mar 2025 13:26:09 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/7] reboot: hw_protection_trigger: use standardized
 numeric shutdown/reboot reasons instead of strings
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
 <20250318094716.3053546-3-o.rempel@pengutronix.de>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250318094716.3053546-3-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/03/2025 11:47, Oleksij Rempel wrote:
> Prepares the kernel for the Power State Change Reason (PSCR) recorder,
> which will store shutdown and reboot reasons in persistent storage.
> 
> Instead of using string-based reason descriptions, which are often too
> large to fit within limited storage spaces (e.g., RTC clocks with only 8
> bits of battery-backed storage), we introduce `enum psc_reason`. This
> enumerates predefined reasons for power state changes, making it
> efficient to store and retrieve shutdown causes.
> 
> Key changes:
> - Introduced `enum psc_reason`, defining structured reasons for power state
>    changes.
> - Replaced string-based shutdown reasons with `psc_reason` identifiers.
> - Implemented `get_psc_reason()` and `set_psc_reason()` for tracking the
>    last shutdown cause.
> - Added `psc_reason_to_str()` to map enum values to human-readable strings.
> - Updated `hw_protection_trigger()` to use `psc_reason` instead of string
>    parameters.
> - Updated all consumers of `hw_protection_trigger()` to pass an appropriate
>    `psc_reason` value instead
>    of a string.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

> +
> +/**
> + * enum psc_reason - Enumerates reasons for power state changes.
> + *
> + * This enum defines various reasons why a system might transition into a
> + * shutdown, reboot, or kexec state. While originally intended for hardware
> + * protection events, `psc_reason` can be extended to track other system
> + * transitions, such as controlled reboots triggered by software or
> + * maintenance operations.
> + *
> + * The values in this enumeration provide structured and standardized
> + * identifiers that replace free-form string descriptions. They are designed
> + * to be stored efficiently, making them suitable for use in environments
> + * with limited storage, such as battery-backed RTC registers, non-volatile
> + * memory, or bootloader communication mechanisms.
> + *
> + * Importantly, the order of these values **must remain stable**, as
> + * bootloaders, user-space tools, or post-mortem investigation utilities
> + * may rely on their numerical representation for consistent behavior.

Oh, here is the comment I was asking for in the other patch. So, this is 
all fine - please ignore my comment in the other patch.

> + *
> + * @PSCR_UNKNOWN: Unknown or unspecified reason for the power state change.
> + *	This value serves as a default when no explicit cause is recorded.
> + *
> + * @PSCR_UNDER_VOLTAGE: Shutdown or reboot triggered due to supply voltage
> + *      dropping below a safe threshold. This helps prevent instability or
> + *      corruption caused by insufficient power.
> + *
> + * @PSCR_OVER_CURRENT: System shutdown or reboot due to excessive current draw,
> + *      which may indicate a short circuit, an overloaded power rail, or other
> + *      hardware faults requiring immediate action.
> + *
> + * @PSCR_REGULATOR_FAILURE: A critical failure in a voltage regulator, causing
> + *      improper power delivery. This may be due to internal component failure,
> + *      transient conditions, or external load issues requiring mitigation.
> + *
> + * @PSCR_OVER_TEMPERATURE: System shutdown or reboot due to excessive thermal
> + *	conditions. This attempts to prevent hardware damage when temperature
> + *	sensors detect unsafe levels, often impacting CPUs, GPUs, or power
> + *	components.
> + *
> + * @PSCR_EC_PANIC: Shutdown or reboot triggered by an Embedded Controller (EC)
> + *	panic. The EC is a microcontroller responsible for low-level system
> + *	management, including power sequencing, thermal control, and battery
> + *	management. An EC panic may indicate critical firmware issues, power
> + *	management errors, or an unrecoverable hardware fault requiring
> + *	immediate response.
> + *
> + * @PSCR_REASON_COUNT: Number of defined power state change reasons. This
> + *	value is useful for range checking and potential future extensions
> + *	while maintaining compatibility.
> + */
> +enum psc_reason {
> +	PSCR_UNKNOWN,
> +	PSCR_UNDER_VOLTAGE,
> +	PSCR_OVER_CURRENT,
> +	PSCR_REGULATOR_FAILURE,
> +	PSCR_OVER_TEMPERATURE,
> +	PSCR_EC_PANIC,
> +
> +	/* Number of reasons */
> +	PSCR_REASON_COUNT,
> +};
