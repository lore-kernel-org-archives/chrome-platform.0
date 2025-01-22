Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E5F20FAA1
	for <chrome-platform@lists.linux.dev>; Wed, 22 Jan 2025 11:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737545300; cv=none; b=AfTfVQddSKFFUNgeGoPjQxb9llY9YQJQCarFHgIlVyHLe3eZOYDL5sdgvcpAb+9PuGBrHQbt7Yv0k+kQ7MNrWEwcPORG/rNQVOrX4xh60p2eW7vxcHie8k0Lg1oCnmYXpOlcYUHRdD0LTBeJ2XvV1Cf8lkNVe7qN8tEEEbgy1qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737545300; c=relaxed/simple;
	bh=qgdsDOji/Ki6OjklleBu3dfhkX2SIINNrfcy28ZqIgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V/LEicDjgj3ybd7d7OXm8vO4ePlfdR6cPpGZNfdoOD5fqX70sXxEKwPri2zMcJJI9HHlO9A1mONx0tz/jeRhsxHFENaiSqkiXwJVADoeqIRZkt60xhHDMErWHEhU00vDrhXQmGfbtcQfgfWvNln5rVTPQJmhcL3lL5N6VpzZ4BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gYEpi0hH; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYEpi0hH"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53f22fd6832so7047588e87.1
        for <chrome-platform@lists.linux.dev>; Wed, 22 Jan 2025 03:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737545296; x=1738150096; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D8uucZoYmTyAW8wW7Yobh9x7Be1LOOBbsYawBwsq5P0=;
        b=gYEpi0hHKtM5JZnZwgT2rpA2SmJL3BwZqatUhm9mNZ7KHGBLdnqqB2k3BefFS+QNr9
         6OQ6QiphmPNwTuCQrhoH0Qm2r9y7nQMxcB6lz0zY9uc6JpO21Z3kxj4OCdBPNoj8kroM
         7uzJmIH6UgA3EDuJRbeMYf7sCiFOcr5ZA88tJmqel/G3k5hDjHDazs7FUSRfDV1P/WnM
         Od5osc30nrGkkpFOrfePz0JnU5N5td+jC+4PTDpqH30C5BpBaFz6vm+lYzo981XU2Pk6
         9LvVFOxeqfoPvo0UBFbbVSqOkOkVvInIUBi3chhMs5BlYwkBCQLnjobIf+agIuKfx8Ab
         UdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737545296; x=1738150096;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D8uucZoYmTyAW8wW7Yobh9x7Be1LOOBbsYawBwsq5P0=;
        b=KMKSD5g7S+9Fl9Z1GzFA++qtzkryr9hiGI5ryEKD7NmLjYAwLZTKKgchCMrZ/v6nJz
         /tb35v64rTQnf/SHjddkiSAzz39OmVa7URQMVR7Roi2HsC7mIwd7DRodWRVm5ISZWo69
         IEWonKjnNJLstI0aheqfqOM+sEu1Idfk5a7aGaOMEY4csRu5nKk+XRiAXWBmZ+rgmz4L
         b/lR2hbZWolRgx0Xb9DbSUROsaMvjey6d5skrx1l8R5GwvzAbBDsCZ152WgGwQuV+aLE
         /oEE3kqZernkw5K+C6b3kK9hmpbODH1JZQ/76blIEU5BPyHjzcdfLKiEtV72tQblaeTr
         qtbw==
X-Forwarded-Encrypted: i=1; AJvYcCXF1aOLdvMZ2QCfdPRh8FzpWGH2L8wx6v7x0ewjP+qw/YJ/9Rh3qpEGZLuX4ybxt+ZT86Jlgkv15n805if5t2w=@lists.linux.dev
X-Gm-Message-State: AOJu0YxCFWREAL2jxD71MUUY7HBx6dBbaMOiGoecmIEmaRLTjJe2k8o2
	lEjpWCgu3MzmqzOIYAubgDk/BiyWgl38utClYqko8k8UPSdXHSCy
X-Gm-Gg: ASbGncta9MlMm6l3CHHcsTCfescAUO/HChNIawdhHP+9I5Zj+A2tg6cgcWa9F7zuPPc
	M3JmKU+6++AC9PpYqsC8xg/vvfNnevbzACbcIEMEoiFWPshRISyzZp6vWf6MGVbBCZTVJgXLb80
	hv9RKJQEzsoFSw+Kspt67aB30uVZuk3zVZ1dDMljyJlFxAP87U3DgEKSXTiaMQgP+RUhQ4CQMAk
	9FsnomKQfsz2jUVBitFQf2Isi8liSErlig/CK5qPO/Tsk0YB1muVPV09oxBfrnJIFZm2H3ed2DP
	E17mKMs=
X-Google-Smtp-Source: AGHT+IFY2ZBn6rdMHyRFnFAwDqHZp13c5/EODEKdU4E4T1JbLWhr6Ok/wScVhHBxOQ5gw+OI+RSfxw==
X-Received: by 2002:a05:6512:159b:b0:540:1fd9:b634 with SMTP id 2adb3069b0e04-5439c28255cmr8070137e87.34.1737545295590;
        Wed, 22 Jan 2025 03:28:15 -0800 (PST)
Received: from [172.16.183.207] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af78d62sm2171995e87.241.2025.01.22.03.28.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 03:28:13 -0800 (PST)
Message-ID: <7b6d3226-4422-415a-9146-16c421463ac5@gmail.com>
Date: Wed, 22 Jan 2025 13:28:12 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/12] reboot: reboot, not shutdown, on
 hw_protection_reboot timeout
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
 <20250113-hw_protection-reboot-v2-2-161d3fc734f0@pengutronix.de>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250113-hw_protection-reboot-v2-2-161d3fc734f0@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/01/2025 18:25, Ahmad Fatoum wrote:
> hw_protection_shutdown() will kick off an orderly shutdown and if that
> takes longer than a configurable amount of time, an emergency shutdown
> will occur.
> 
> Recently, hw_protection_reboot() was added for those systems that don't
> implement a proper shutdown and are better served by rebooting and
> having the boot firmware worry about doing something about the critical
> condition.
> 
> On timeout of the orderly reboot of hw_protection_reboot(), the system
> would go into shutdown, instead of reboot. This is not a good idea, as
> going into shutdown was explicitly not asked for.
> 
> Fix this by always doing an emergency reboot if hw_protection_reboot()
> is called and the orderly reboot takes too long.
> 
> Fixes: 79fa723ba84c ("reboot: Introduce thermal_zone_device_critical_reboot()")
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
>   kernel/reboot.c | 70 ++++++++++++++++++++++++++++++++++++++++-----------------
>   1 file changed, 49 insertions(+), 21 deletions(-)
> 
> diff --git a/kernel/reboot.c b/kernel/reboot.c
> index 847ac5d17a659981c6765699eac323f5e87f48c1..222b63dfd31020d0e2bc1b1402dbfa82adc71990 100644
> --- a/kernel/reboot.c
> +++ b/kernel/reboot.c
> @@ -932,48 +932,76 @@ void orderly_reboot(void)
>   }
>   EXPORT_SYMBOL_GPL(orderly_reboot);
>   
> +static const char *hw_protection_action_str(enum hw_protection_action action)
> +{
> +	switch (action) {
> +	case HWPROT_ACT_SHUTDOWN:
> +		return "shutdown";
> +	case HWPROT_ACT_REBOOT:
> +		return "reboot";
> +	default:
> +		return "undefined";
> +	}
> +}
> +
> +static enum hw_protection_action hw_failure_emergency_action;

nit: Do we have a (theoretical) possibility that two emergency restarts 
get scheduled with different actions? Should the action be allocated 
(maybe not) for each caller, or should there be a check if an operation 
with conflicting action is already scheduled?

If this was already considered and thought it is not an issue:

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>


Yours,
	-- Matti
