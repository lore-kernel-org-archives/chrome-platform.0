Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95832F2C
	for <chrome-platform@lists.linux.dev>; Tue,  8 Feb 2022 05:38:10 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id v4so9269852pjh.2
        for <chrome-platform@lists.linux.dev>; Mon, 07 Feb 2022 21:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rVZQRRRcZIvdySc3NwZCT7uSR6arJIL8Zq9GUUOZI4k=;
        b=K1gzDYX3SbFK6ldfd2O/NmU+kuDtNqSbcy09BOW2CNdaqoz5YU3B20cIl7WoyQQdnb
         ylFHcebmkeNDFZA0ENi3Q/60FUXtcUvrU53HjKGtbezpcxU+h53TsE2ZXXY649qtftqL
         y0fLQ3aGARL4CdxpDFLa1WXIFSkZ9jMfHKfrMXB2jhsZZuKKJW3CR8FziESwRfWljo4D
         C2HzoBMofn8Gb58JNuLin1y/GPfUKVzT8jmbSjlBVgXF1ny2qVjgY9ukzabRXqVlBmI1
         fAJcdSd0lKkMyB/j6hX9ayC/nXWINOq8rs7iMxoUt4PrSgIdQV9MlmCYgpi49ole2qgm
         q09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rVZQRRRcZIvdySc3NwZCT7uSR6arJIL8Zq9GUUOZI4k=;
        b=1mg11yCkyd1XkBHDwVbqYJF5p7yQbgAj59Zi5imzL+C5LEhNHQlSxjt5T3SMD99106
         hmSvyAX3HLL1J/euJWHU1TELXMXUpay+HyqSQjAK7k3ZiFkaeuNJsuKj2H9OFF6m/QPy
         PY53kbWLtLhsunUq/sUlt1cP3BUAq5URazbqAV+cWFTmxQXp887DdC8Yng2gyWgk0JeO
         o9tm+ECWN/ZfjxMevFYY0JsFboRovEUGjn2ieMTolS0S6MbCFbojSD3OAP6zqspkRaPs
         293T1Qo7BTHrNAN8TPpD2PgQVJOtR4RIpzd8CUO5rEAs3c+Be15/bcdTU8NboUZ7pY8L
         7bAw==
X-Gm-Message-State: AOAM531by8j3Li2zFulvaJB6UX1/CyrMNGoUHIzJQmKOnN7/QRf6INPO
	9IeYZoEI2+zJjMe+potf/TuCYDgbBALi2w==
X-Google-Smtp-Source: ABdhPJzayIYRi1rOKJtoeQ2AgpTBrY12q1CwtfUNoU9a1c3DIlBM7Fl9mXtD4LNAmM1qtAY93XWYOA==
X-Received: by 2002:a17:90a:ab17:: with SMTP id m23mr2609289pjq.212.1644298690076;
        Mon, 07 Feb 2022 21:38:10 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:4b6f:f14d:be50:86a])
        by smtp.gmail.com with ESMTPSA id 20sm1128467pjf.15.2022.02.07.21.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 21:38:09 -0800 (PST)
Date: Tue, 8 Feb 2022 13:38:07 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	"open list:CHROMEOS EC USB TYPE-C DRIVER" <chrome-platform@lists.linux.dev>
Subject: Re: [PATCH 3/4] platform/chrome: cros_ec_typec: Configure muxes at
 start of port update
Message-ID: <YgIBv2SQdwXm7RLt@google.com>
References: <20220207214026.1526151-1-pmalani@chromium.org>
 <20220207214026.1526151-4-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207214026.1526151-4-pmalani@chromium.org>

On Mon, Feb 07, 2022 at 09:40:28PM +0000, Prashant Malani wrote:
> There are situations where the mux state reported by the Embedded
> Controller (EC), might lag the partner "connected" state. So, the mux
> state might still suggest that a partner is connected, while the PD
> "connected" state, being in Try.SNK (for example) suggests that the
> partner is disconnected.
> 
> In such a scenario, we will end up sending a disconnect command to the
> mux driver, followed by a connect command, since the mux is configured
> later. Avoid this by configuring the mux before
> registering/disconnecting a partner.

I failed to understand the description.  It looks like some protocol details.
Could you provide some brief explanation in the commit message?

On a related note, followed up the example scenario, which one of the
understanding is the most applicable:
1) The disconnect followed by a connect is suboptimal.  The patch cleans it.
2) The disconnect followed by a connect is a bug.  The patch fixes it.

> @@ -965,6 +965,11 @@ static int cros_typec_port_update(struct cros_typec_data *typec, int port_num)
>  	if (ret < 0)
>  		return ret;
>  
> +	/* Update the switches if they exist, according to requested state */
> +	ret = cros_typec_configure_mux(typec, port_num, &resp);
> +	if (ret)
> +		dev_warn(typec->dev, "Configure muxes failed, err = %d\n", ret);

It used the fact that the function returns `ret` at the end.  After the move,
the block is no longer the last thing before function returns.

Does it make more sense to return earlier if cros_typec_configure_mux() fails?
Does the rest of code need to be executed even if cros_typec_configure_mux()
fails?

> @@ -980,11 +985,6 @@ static int cros_typec_port_update(struct cros_typec_data *typec, int port_num)
>  	if (typec->typec_cmd_supported)
>  		cros_typec_handle_status(typec, port_num);
>  
> -	/* Update the switches if they exist, according to requested state */
> -	ret = cros_typec_configure_mux(typec, port_num, &resp);
> -	if (ret)
> -		dev_warn(typec->dev, "Configure muxes failed, err = %d\n", ret);
> -
>  	return ret;

If the function decides to return earlier, it can be `return 0;`.
