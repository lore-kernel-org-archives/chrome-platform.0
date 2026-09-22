Received: from mail-lr2-f13.google.com (mail-lr2-f13.google.com [74.125.230.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C808C49E15D
	for <chrome-platform@lists.linux.dev>; Tue, 22 Sep 2026 06:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790056962; cv=none; b=Z/UoT5iRRoy+HaSQfXhuyW1lr470ozkA7pW+6ApswaBp0SmACSc8nLMHXF+axfy3jHmGV6dbHu83AknfiXTCP9hSukkNNhL75TAXR3e5Ct4SG+2LWKS7x3lUZjAciyytIMfTZwxPfE7WXvTxm68Vi6HSjSvlSuKyGEaVqnPxhOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790056962; c=relaxed/simple;
	bh=Eff6vCn+phLOaigmyo7edToilcvWUJjQqErcl9hd4nY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A7pPUrTpm2Nii+Ev2x0F9ZSZ5+2lL3TpeHUwsreOXvCkrTfN+UVdILhaBnn19IFR29r7qnpMHjfVE7fNnT1ZdaRseARtE4enUYWTuuIWJYm53Vj/RScGEyK/hsVIwvippkb3ZekMec4wGoblHAs5pWuQ6zr0N5YlEYmg87+dtY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iR5H2zny; arc=none smtp.client-ip=74.125.230.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iR5H2zny"
Received: by mail-lr2-f13.google.com with SMTP id 38308e7fff4ca-3a302c06eceso28468891fa.0
        for <chrome-platform@lists.linux.dev>; Mon, 21 Sep 2026 23:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790056959; x=1790661759; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xt+5g6YJ+qiwuKUi20nhfo5k0N4aMIWmvgMhNUyOULU=;
        b=iR5H2znyq8XOqfK0I9p2ctnuK/iFrkj91TaPw6Zhzx4CvRm3aOw+F94rpDaZf5mOr8
         RYUW+zkPZV+3NXNmglnxlrdAuV5PeLZn0poKcJnaDCe7YkMjAHSpiNCoRmMkRXj6jRJF
         7Sl5Td+lda7nAYR4u6Lk059gS+ED+3rwts2ZDuQYbcnkkXz+CDGVjf6l7fxh2TStsvmZ
         +pBRJlQZy1GmZDr74v/6mZNFs2heiq0tngwaNGZjvf1hr2Y/cjl9nUjji0fj/RAfVgkg
         5ShHgIsfk3Q0J7XMBYfGyU13OABIo2y4Ugzdz/1EXMVx++5LI8/Kobq1Ny3ChM+hBuTw
         lx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790056959; x=1790661759;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xt+5g6YJ+qiwuKUi20nhfo5k0N4aMIWmvgMhNUyOULU=;
        b=0FqdRJeXK9UGM+0JYznDz3t2djzBeNs6eFnGv41PPqRMXdqTvxIMuItNqoPYXytOte
         F7TG9SxC/v1hfTK48ibQCUIJUtusO1eved6KRp4alQ59/WLDejDf/QB2e7w4EYn/Sopf
         sCdqS2TUTizBBle+07+Xo/Jp7rtOA2cB+qMUET61Vml2Zzav2Pg0QE4J5jUcWKm1etL5
         2UNJQkL3RI5mF46ARxLAMB8Bbdx839t7K704NitDvTnsivMkpUIRE94vzrnytlmzjsY/
         PFVFqiHLXssPErpXlJWDNZDEG/hxXFeAedpUkKZGL4nuRavvKqGLlP1F2u9HdwE+6bey
         byyw==
X-Forwarded-Encrypted: i=1; AKwUvBwIFrSskUoDVOqHapxqb4aKXSPvL3wnbekgBRxAaMHe3PL7iX9jUMIskqJm9TshFgSsULh8mbUh8ZBaiscFTyI=@lists.linux.dev
X-Gm-Message-State: AFuF++muMf0t8VyDraI9Z/lW3jfpUX6ID2EKxJKKQSD1NeQDQFzblCwr
	I3Ki39vkQASbgVjHFzNmQr7w2qgCDUMVbZCKBFA2cP6F+WnSZnyRcv0k
X-Gm-Gg: AYBFou3HqZtC5WW9qdkLPP+ka1wVFWzzAYL8RJzN/ErhUarJzL4B7+evAWyGEa2m06G
	T3t3Adi8GpFcxXb9XkVZ/sZZgfU7QD3NyIybofLu/8Qmgjd5qF7BgCuos+6jGEmpGyVgrkeiJih
	ielc5xioIE8upxDGr9zkUB2JodmK2NDw9OJ5Xe2wG9Saa9MwRtiGmrpRMpTtF3PA8QrCBAC+w37
	EGSRoNBvUh8lm5Fa0Y1lSjCAt0nuAgUpWSV15WQZii2Eb4SSYxc9pyc3smSIuZ8B/3V4hKmeWoX
	fWfFcSDG1kJACJPO7gPnKqHoKKCI/ay1Uk+AhgL6v/9GgxJCzLm7Nd0fxSzbu4CKIiZEUfhfYGz
	T2mnx3S3S3urGVWMj3ofOnf4jSbBCFhIsB6I7Mk8B+DzEEwrUdY/+p5aTplmE1+ezaM97DDuOG0
	rfX5LZXjZVDRqGITaX7B3JeGItZ0CQBLXK1brf8WvpTsyOcpDWIa7YeZ0RVQNNjkuttFNer2CvY
	TmVndR/ao2HbnWA54jquqsqKeULSvrBVCP3W6rFHIj7DmC/ktmUtv8=
X-Received: by 2002:a2e:be8a:0:b0:3a3:462f:329a with SMTP id 38308e7fff4ca-3a5fc036a4bmr29953921fa.13.1790056958392;
        Mon, 21 Sep 2026 23:02:38 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a627d6b91dsm2501451fa.25.2026.09.21.23.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 23:02:37 -0700 (PDT)
Message-ID: <f20e2299-4dc1-4902-b7ec-80f11cee3745@gmail.com>
Date: Tue, 22 Sep 2026 09:02:36 +0300
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 1/6] power: Extend power_on_reason.h for upcoming
 PSCRR framework
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
 Umang Chheda <umang.chheda@oss.qualcomm.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
References: <20260921-pscrr-framework-v14-0-a16290003b7c@oss.qualcomm.com>
 <20260921-pscrr-framework-v14-1-a16290003b7c@oss.qualcomm.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260921-pscrr-framework-v14-1-a16290003b7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/09/2026 20:44, Faruque Ansari wrote:
> Prepare for the introduction of the Power State Change Reason Recorder
> (PSCRR) framework by expanding the power_on_reason.h header. This
> extension includes new power-on reasons:
> - POWER_ON_REASON_OVER_CURRENT for over-current conditions.
> - POWER_ON_REASON_REGULATOR_FAILURE for regulator failures.
> - POWER_ON_REASON_OVER_TEMPERATURE for over temperature situations.
> - POWER_ON_REASON_EC_PANIC for EC panics.
> - POWER_ON_REASON_EXTERNAL for an external reset source.
> 
> Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

> 
> changes v12:
> - add POWER_ON_REASON_EXTERNAL
> changes v10:
> - add Reviewed-by: Sebastian Reichel ...
> changes v6:
> - add POWER_ON_REASON_EC_PANIC
> - s/POWER_ON_REASON_OVERTEMPERATURE/POWER_ON_REASON_OVER_TEMPERATURE
> (cherry picked from commit a6fb08a81864e2ed17cebba9f249af3d44e42c3f)
> ---
>   include/linux/power/power_on_reason.h | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/power/power_on_reason.h b/include/linux/power/power_on_reason.h
> index 95a1ec0c403c..13e61ace14f5 100644
> --- a/include/linux/power/power_on_reason.h
> +++ b/include/linux/power/power_on_reason.h
> @@ -15,5 +15,10 @@
>   #define POWER_ON_REASON_XTAL_FAIL "crystal oscillator failure"
>   #define POWER_ON_REASON_BROWN_OUT "brown-out reset"
>   #define POWER_ON_REASON_UNKNOWN "unknown reason"
> +#define POWER_ON_REASON_OVER_CURRENT "over current"
> +#define POWER_ON_REASON_REGULATOR_FAILURE "regulator failure"
> +#define POWER_ON_REASON_OVER_TEMPERATURE "over temperature"
> +#define POWER_ON_REASON_EC_PANIC "EC panic"
> +#define POWER_ON_REASON_EXTERNAL "external reset"
>   
>   #endif /* POWER_ON_REASON_H */
> 


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
