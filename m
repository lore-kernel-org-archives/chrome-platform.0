Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92EB3B14B8
	for <chrome-platform@lists.linux.dev>; Tue, 22 Sep 2026 07:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063125; cv=none; b=CBi+tOVmWGpgiZu8dR2ZWEmo6rjbeMcuxoU6VeSlYuQkMkfjDXrV5NpIcgqKrsqBa6BYa/aoQjtWow/4Ui+rp296d8dq5PwXrx7C1cF2/DAETJ61TZj//IRdF4YfdoUxLW6dWoSjJJTqmP2MSsE5Ricnlf50TZuoU1RiMYetes8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063125; c=relaxed/simple;
	bh=TpdKMFLGjPzefo61cvunv7j2BylXh6l1j/OMO4CLiOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZeIXGs0U21M+TQ01V24q4suk/YLq0KIGb58OGjXvWXmR9jvUmDqV3MTZaHUWPpyuS8GRmBICoeV4nVS8uKNFYBV7NwZzdAxgKeI58EFgszZudMj83GzaCpUK3Xo8OCQrsi2u3uFCVjRQs0dqcYEMnOGaIvXdJtht0DqtTXQ0y/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=od6JufOi; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="od6JufOi"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff176d5bso30788031fa.2
        for <chrome-platform@lists.linux.dev>; Tue, 22 Sep 2026 00:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790063115; x=1790667915; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v311mTme30yUrQjluYgG3Q413l6dAIYyGwWk0CumHTE=;
        b=od6JufOihQWv/dyP4gfUbywhUvnbgI/zjaHCoDKk4zxmGMfkuDXgyF5L3uesWdLD/P
         97snFEHcCUvHl7dHhM9npkvsa5WIJzCBbrTSYqKIJoB++HNC8YZavSeVdCzQOLNjFt5q
         qgfgqtHtEol6yQQw2xrZCDYge9saht+MIui6jUQS/434Jnneg9iKrRRVTu5XxQp0Bz22
         jaPhsg8vs+8A0UdtH7qfd6bbi7FYT72VgwPsnWTsuzMD8CDbZ2g53DNl56btCfeJ9h7n
         zx7pdNBuTqt+6F2KaIPx6QugmGcu5nN63ilASNu6Jhfs5RmqM2JpZG676JNDFTnKOAdw
         Jg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790063115; x=1790667915;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v311mTme30yUrQjluYgG3Q413l6dAIYyGwWk0CumHTE=;
        b=hmAS0PGimlpFUNWVwJ2TBhcMIhEozTuocRKsRfGYhzU78+Zn5XdJHFZWA0DJWrRYXv
         6ciDp1D4WqiH7G1Aw5pSl8eRDaxebblcKdNG5+RXRCVE/XWgCSZr8ZEW7YmhFOg6NHHX
         5L1j6MCJJHgUm9I64fvIau/IgKpveKLot7hDUF51QMfWad3/rYHHcsAkVlHeTZNGoctV
         yE13cBdbgUz8QtuAShLAVSoBbOgvxyLMaJTwAxcxLbP8tvoAfo4lCc/2Jw4Whyztwfh/
         8N+etsaPqDC9wLpi4WSbCHSHODh/VlUZkCoOKApfRcIJrSeX/TJsbBbVIQ22ik6dlvzn
         KH2g==
X-Forwarded-Encrypted: i=1; AKwUvBzX4fu41KhI778d+eBf/atOVHVMh3bhS3EaBDEAZpX4MeAWcJ7gIFqXvOUKQjkRtZzECqUPCTNiVS3WC3FgbNA=@lists.linux.dev
X-Gm-Message-State: AFuF++l4mQFaPBaQ4zzqnn9feHEO1MCQbNk+L9/E7xa7TZSA2UZIRJ5e
	TiblG4v9Mln2IbvkLmgp9tKrEaULr+LMLv1CY7UrlFN9kyYUVIQ6CT+y
X-Gm-Gg: AYBFou0WT+rR9h0/2pJm9pk26b+sJSt1u7UXk4IhY1oxRxWQINkBbj47vCM77FvlXZE
	qN5THHTeCHyHGh+SB4Nid7m+iwi9VcgEfzTI0mSL6aeTj73fb/KHCdFYJe+tMF9pcSo8ZYsgJmr
	5zZbawZaDgSJpga4w1H5mWsw5z+wHc39Ft1s6oSP0f3ZfIDL+D0nPBPdvqKzYq7YLGVX93FyGEz
	Y3O7ch9MrZU3xt1KptgY9iRyxUuy0QECd7rFsPIKizbe9GWl6VSHBb0NWIzguAeUpu2ADr3Ofw5
	hz93+2zhhsLcjYHKpilj28TYR3VZdAh6OO2uUuxs2IEycfHwqIqOad54gMlaoNNPvOmyqHKJ0As
	RLyU2KOTxXrUFbcGpxs280f9VKh6cgZim1WA+Mbv4IssMDXvcuZkLxtFJrobl+GPEc2XSBZ9i7X
	JM+UDzi9iT0yT4zywoBdKnet11vqWMDr4y2ZCdlfjzcJbtNbrI1I9BldRi65viRDGQ1korNuuxw
	IgvQd01cjbYlA8fMWd4QiiWeM6GQ7RzM+R2AcZcR5KDeFz5Gfdyw+4=
X-Received: by 2002:a05:651c:b23:b0:3a5:f044:fcbb with SMTP id 38308e7fff4ca-3a5fc09bb75mr30555911fa.21.1790063115207;
        Tue, 22 Sep 2026 00:45:15 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d46ad0e9sm276409e87.2.2026.09.22.00.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 00:45:14 -0700 (PDT)
Message-ID: <9ba75a42-a3cb-4ee2-bd29-84f23bbaa70c@gmail.com>
Date: Tue, 22 Sep 2026 10:45:13 +0300
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 4/6] reboot: extend psc_reason with power-on and reset
 causes
To: Faruque Ansari <faruque.ansari@oss.qualcomm.com>,
 Sebastian Reichel <sre@kernel.org>, Benson Leung <bleung@chromium.org>,
 Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 avaneesh.dwivedi@oss.qualcomm.com,
 Umang Chheda <umang.chheda@oss.qualcomm.com>
References: <20260921-pscrr-framework-v14-0-a16290003b7c@oss.qualcomm.com>
 <20260921-pscrr-framework-v14-4-a16290003b7c@oss.qualcomm.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260921-pscrr-framework-v14-4-a16290003b7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/09/2026 20:44, Faruque Ansari wrote:
> psc_reason covered only the protection reasons. Extend it to mirror the
> full POWER_ON_REASON_* vocabulary - power-on, watchdog, software,
> external, RTC, reset button, CPU clock and crystal failures - so a
> provider can report why the system last powered on, not only why it was
> shut down. New values are appended to keep the existing numeric ABI.
> 
> Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> 
> changes v12:
> - new patch
> ---
>   include/linux/reboot.h | 28 ++++++++++++++++++++++++++++
>   kernel/reboot.c        |  8 ++++++++
>   2 files changed, 36 insertions(+)
> 
> diff --git a/include/linux/reboot.h b/include/linux/reboot.h
> index 4c5327dd7645..13f004ad1066 100644
> --- a/include/linux/reboot.h
> +++ b/include/linux/reboot.h
> @@ -225,9 +225,28 @@ extern void orderly_reboot(void);
>    *	management errors, or an unrecoverable hardware fault requiring
>    *	immediate response.
>    *
> + * @PSCR_POWER_ON: Regular cold power-on (e.g. via a PMIC power-on request).
> + *
> + * @PSCR_WATCHDOG: Reset caused by a watchdog timeout.
> + *
> + * @PSCR_SOFTWARE: Software-initiated reset or reboot.
> + *
> + * @PSCR_EXTERNAL: Reset asserted through an external pin or reset input.
> + *
> + * @PSCR_RTC: Wake-up or power-on triggered by the RTC.
> + *
> + * @PSCR_RESET_BUTTON: Reset triggered by a user reset button.
> + *
> + * @PSCR_CPU_CLK_FAIL: Reset caused by a CPU clock failure.
> + *
> + * @PSCR_XTAL_FAIL: Reset caused by a crystal oscillator failure.
> + *
>    * @PSCR_REASON_COUNT: Number of defined power state change reasons. This
>    *	value is useful for range checking and potential future extensions
>    *	while maintaining compatibility.
> + *
> + * The reasons mirror the POWER_ON_REASON_* strings in
> + * <linux/power/power_on_reason.h>; keep the two in sync when extending.

(still a nit)
We should now also ensure the psc_reason_desc[] in reboot.c stays in 
sync... (See my nits for 3/6). I have a nagging feeling this is not 
optimal :)

Is there a reason for having this as a separate patch and not merged 
with 3/6? If yes:

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

>    */
>   enum psc_reason {
>   	PSCR_UNKNOWN,
> @@ -236,6 +255,15 @@ enum psc_reason {
>   	PSCR_REGULATOR_FAILURE,
>   	PSCR_OVER_TEMPERATURE,
>   	PSCR_EC_PANIC,
> +	/* Append new reasons here; the numeric order is ABI. */
> +	PSCR_POWER_ON,
> +	PSCR_WATCHDOG,
> +	PSCR_SOFTWARE,
> +	PSCR_EXTERNAL,
> +	PSCR_RTC,
> +	PSCR_RESET_BUTTON,
> +	PSCR_CPU_CLK_FAIL,
> +	PSCR_XTAL_FAIL,
>   
>   	/* Number of reasons */
>   	PSCR_REASON_COUNT,
> diff --git a/kernel/reboot.c b/kernel/reboot.c
> index e53fb31bad06..5d4ecc82b35e 100644
> --- a/kernel/reboot.c
> +++ b/kernel/reboot.c
> @@ -1102,6 +1102,14 @@ static const struct psc_reason_desc psc_reason_descs[] = {
>   	[PSCR_REGULATOR_FAILURE] = { "regulator-failure", POWER_ON_REASON_REGULATOR_FAILURE },
>   	[PSCR_OVER_TEMPERATURE]	 = { "over-temperature",  POWER_ON_REASON_OVER_TEMPERATURE },
>   	[PSCR_EC_PANIC]		 = { "ec-panic",	  POWER_ON_REASON_EC_PANIC },
> +	[PSCR_POWER_ON]		 = { "power-on",	  POWER_ON_REASON_REGULAR },
> +	[PSCR_WATCHDOG]		 = { "watchdog",	  POWER_ON_REASON_WATCHDOG },
> +	[PSCR_SOFTWARE]		 = { "software",	  POWER_ON_REASON_SOFTWARE },
> +	[PSCR_EXTERNAL]		 = { "external",	  POWER_ON_REASON_EXTERNAL },
> +	[PSCR_RTC]		 = { "rtc",		  POWER_ON_REASON_RTC },
> +	[PSCR_RESET_BUTTON]	 = { "reset-button",	  POWER_ON_REASON_RST_BTN },
> +	[PSCR_CPU_CLK_FAIL]	 = { "cpu-clock-failure", POWER_ON_REASON_CPU_CLK_FAIL },
> +	[PSCR_XTAL_FAIL]	 = { "crystal-failure",	  POWER_ON_REASON_XTAL_FAIL },
>   };
>   
>   /**
> 


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
