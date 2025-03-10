Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D943D22CBF3
	for <chrome-platform@lists.linux.dev>; Mon, 10 Mar 2025 14:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741617876; cv=none; b=JEje95mzs0giaGj2bmePCSRMrZRTmAJvY6SojdOnq6Tjp7ykiehiu9birATRy2gsvXaBY6cJ0PmVkNwrNn6pISEJWi6KB6T+/E+7ahaASlC24w+mKXv9WTC6U1j9bnLqJjVB3i2MBdBPANnG7QEucLhPCxsdwDYaadRT6nFKPOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741617876; c=relaxed/simple;
	bh=QRALNFtdN+eVm7tbZOOG157YtH485xLMQcdhF3aH1K0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n0e3iPRyRqPjR8iZmVPXZCpb53bLoBC6XKxCj0uksmXBgpTPBKcTUAkIf0pH/sEFJdp53NmtfVd87R4vaJTMCtJa7243C/vB2QxC1+zDNCki6K2srknKBq5vcJuxP2ru4iOEkQiQOW+N61KJ9Fmk00w5rK89JWpXumI1wYV8Zrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IVkrbTBn; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IVkrbTBn"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30795988ebeso46200401fa.3
        for <chrome-platform@lists.linux.dev>; Mon, 10 Mar 2025 07:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741617873; x=1742222673; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fErUntllWsLjAOuJrcnV9q/2Ltwr2+uinPcLby2r5I8=;
        b=IVkrbTBngNLKuTe6n1+IPRHNvH9NJBrAvv5/7+zRgnA4YLQ4dX74VFX+FNICtpxapy
         hIPEu/K6R42ckU/aEcqTaUk6/X/ArvwKX18cA6d9kpa1REKTjADos7RSzc9PucDXKmro
         BCKKJxN/BEgZ3nV0IoE5Jy1zMHmWuoCZXn74yuVsMh+XXgZpafeydFJgkkTWfL2G8VhQ
         6DQCq1gyWnoFqggt7tZWs0JuT9sZ3MMvADSMysIrjml6I6gjEmhoF7RZSg6o0g1R9hCQ
         +2/x1uubgzeAdHrPRU1aDlDaC0NwZvWBMtPhLaZSEy7FcVAVqAEWUwNA/7sGKArxJeiZ
         miJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741617873; x=1742222673;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fErUntllWsLjAOuJrcnV9q/2Ltwr2+uinPcLby2r5I8=;
        b=XQq9erOTzv8kn45jEW4WksI5JsMAAwlheaZVSW3cne0i4ElJJlkl+rbNiICLcnNNSm
         PYWPa3nK7lpqcruy/7rpSKhGeliTkDgYVNrkDynHptwsRQLy3z2sasI+9HO7sGZ8vJEB
         /wRWZ3FQ1GpxJY/bz+YKE3dTQXhclYHAHCgbHkYJjqWXukmN18i78zqcDM3aUF3LtFhx
         DFmKablNlvvu0keQnvLldQk6Zdd373sMZS+KuMqqR/h2xpkY9GIn3ROiAs8Fmit/EL6q
         IZsN2gTvUz1F++Ls2ZhlTzPd2usAWH5gZsnIvCF6KXUFVefBG37/xJSRub+dwUAVCnLs
         KceA==
X-Forwarded-Encrypted: i=1; AJvYcCUj7Rs7qe7wT2wT4ZonVdjKZD6HD8Io62w8hKdWcC74Iwfc5bTgnujbh8n3h0GaWxK/xL5j0sPHmYoQhUOnopk=@lists.linux.dev
X-Gm-Message-State: AOJu0YylKdzTC4n3oMq8oijt/WBpOUPEJj1csTsd51FNxXciO8J+9HfG
	7Q/jRLo8Poaz9LTBsOEWgyd8vxD3FXDnOBDT5vfS1qKEmk0cEVbq
X-Gm-Gg: ASbGncv0n9EqGLT7dYU96OYw5FXJAtlg6iSfhyQM9ZR1e2YfwhITHGe8f9Pb9OYDwwf
	1BVRHEpvjDTi0kU4htzTbhD+tUwOIg3oySE9MlvKTNOXHnDbMz+DDnNVtdCff570JlNUc1x+nrY
	pZQSxca8ToMLqfKBcEtUlNLjxB6i9uJ1+PTWa/zNzNfigzWGXJYswnTXscmfFK2bVdFLXjXrylw
	NqCtXo51ce+9dCPZvYgKOOtvtEcwI9uQuR2THgrN4UlTRF3Wj2bGmKEVRwRxgKEOZDmHMOLtIcA
	VzaX/REeqcnl9tR2/q6xnXVDYMjnb4DfTPvYMjX5DP8QZOvVloHbFuOQeCKShs0v1HODoTfjLKz
	1QLCcmKw0dXTEw55cZo8j8JeFZQ==
X-Google-Smtp-Source: AGHT+IH4FjRMCiAVJcOW54+yHBkZfOm6jFItnfmr9qhQZcQ7xY0zUfHMZWO62R1wiuF+voU7frBmdQ==
X-Received: by 2002:a2e:be11:0:b0:30c:d32:aba8 with SMTP id 38308e7fff4ca-30c0d32af78mr15711901fa.30.1741617872593;
        Mon, 10 Mar 2025 07:44:32 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30be99e81cbsm16554601fa.93.2025.03.10.07.44.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 07:44:32 -0700 (PDT)
Message-ID: <82383b62-0537-4d73-9495-8b880ef9dbb2@gmail.com>
Date: Mon, 10 Mar 2025 16:44:30 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/15] gpio: bd71828: use new line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ray Jui <rjui@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Michael Buesch <m@bues.ch>,
 Thomas Richard <thomas.richard@bootlin.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Andy Shevchenko <andy@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, chrome-platform@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250310-gpiochip-set-conversion-v1-0-03798bb833eb@linaro.org>
 <20250310-gpiochip-set-conversion-v1-4-03798bb833eb@linaro.org>
 <475375c9-9d72-4583-a21e-37b17c6b8c46@gmail.com>
 <CAMRc=MfofTMnfCYenUTstWUeGN5RYzJTrg2nGSzCe8tdBMksmw@mail.gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <CAMRc=MfofTMnfCYenUTstWUeGN5RYzJTrg2nGSzCe8tdBMksmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/03/2025 15:22, Bartosz Golaszewski wrote:
> On Mon, Mar 10, 2025 at 2:20 PM Matti Vaittinen
> <mazziesaccount@gmail.com> wrote:
>>
>>> @@ -28,12 +27,10 @@ static void bd71828_gpio_set(struct gpio_chip *chip, unsigned int offset,
>>>         * we are dealing with - then we are done
>>>         */
>>>        if (offset == HALL_GPIO_OFFSET)
>>> -             return;
>>> +             return 0;
>>
>> Should this be -EINVAL (or, can this check be just dropped?) Value of an
>> input pin is tried to be set.
>>
> 
> I don't want to break existing users but I did notice that and figured
> that we should rather check this in core GPIO code not each individual
> driver.

Makes sense :) Thanks!

In that case,

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

> 
> I put that on my TODO list.
> 
> Bart

