Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4FD2DFA2D
	for <chrome-platform@lists.linux.dev>; Tue,  4 Nov 2025 06:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762239160; cv=none; b=RPFIqK5onfbLNde4CML7JEGck41aqdQMdCj34PcnFdb+QCIUHlNkXq73jQNXiO24mMx70/1tF37kvAEbtRvK9MkK3WK/2MOfRxCTQVYBQEX2Q5fFQJWpnCyLdwduCO0nXWH64L43D4VF9i9SXJnzEQxtZYLF3PnC9r0L9JuFf4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762239160; c=relaxed/simple;
	bh=FkVSx0brkAi3wM3etFadZQOnS2YT5u/trHUqyfpuF1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PBwc21FA+Ek9hqu3QYV01vudUeQNZHgHEp6VVxKo3eqy43Svd5hAIbRnxrgdhe8i9+e/pkWBeHuAVaPTz1B7R5KVvRPmL21U6+jzGIT3/r/fjiyUuUlXqkHK9uCHDKjvOegzqjhHmWzv6VKStbjcxu+Sjtiw4woKj/sJk6k065g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFkorHhL; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFkorHhL"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b679450ecb6so3951243a12.2
        for <chrome-platform@lists.linux.dev>; Mon, 03 Nov 2025 22:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762239158; x=1762843958; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zIkdUqODfOw8gd3ff2/nv6ULtzZ+c6+F0JiAwTHIGtM=;
        b=mFkorHhLenxlpmOfOmvacOE8Ty0pdQ+lLqbs/yr+oaVTcUP0MwCdgWL7vM1/87Kc/U
         VCrSoPck6ORn3Mw9llt+PYkAD8oiBT8HuWteYatsfG54Vp7tRL8gD7YrIOOJ+p2JpIf0
         Of0mgQqUM3yMDO4xx0gV7TnaSbMhFPCuN4c4TAeeOFtdVCOADNUBr8BXhQaw1fwhpcaJ
         W5BLRrOJnowKCK6+sghGRDZHx5g8S/J/g+b8qbYW4hZdYt7v0lUCWxzX2lCKKYVGUt/s
         +lrJJzt8H1YjIDWqsuiY+GCeWlJz61Dc8Dm18P+YyFy4D4UkqRQUySoBDhWk262W0kfb
         Vh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762239158; x=1762843958;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zIkdUqODfOw8gd3ff2/nv6ULtzZ+c6+F0JiAwTHIGtM=;
        b=YCZTnmbX4/iH1O5NgfRjMmHfWHFWlfEEmspKbImRL4ajCSYAkRmcLWYum/Z8EaItpe
         4iTPx8UWnXtgmmAFHq7I84/lJJDTcbLzdRe/1LiB4MmSZG8tXI5bNIU9s+sCvNMGk9b3
         sNvWIy2EvTwXBrPjf2AaTSCdOVY4L9mGaIdzAo4XsiFbNxJkYO+987aeLpCiVDOuW+/r
         hKkefNCVdRzaQKEE9I4gROqiYa8jxChrGdKlTM2bC8WynIZwq5KVzLNtAGavsu80NZCV
         6K3Mg8u7MLFvfha314ZjMwjwVffulRtxlVbct7ADEOxzfAu88Qi9xQYSyNmkKZuJeqI7
         UwjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRk+NtikZO11jCE0sm8Lm+u3877QDfs1tYY7iEKkE86slaHnAhSD9WzAhYo8RKgsOGXwjRiJzifiCVm7mjME4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyApd5ubMf2jXgkH9W2/BSPYhG6G5nWhAp1rAG/I36iDcvPL93d
	sAodJ6+rrIDlWgJ6LgYuRivqfKGSY1cONcY21q3xMQNqr+UFv2x7LrGb
X-Gm-Gg: ASbGncsSwdhjwVSm/Zw8jtFQVKo24YEuS5C3AT8WU7V8hS7UkeukTXybyFNN9gElaEj
	4JqCRvifA18hJhejZ+aBVTqpvMDDvlelyydLXpxXrf/KSxsgMZjP7TDjNh63NZgrz9N4BUP4anO
	rCdFRac5sXn/aTL1QIkU6IWCw3DSc/MSKHq4/lgncfrXT4LUS/uMQoMfOhLnYHSxdmiXf8Oh9+W
	sbQE0/Ws0q/DZDceMnnTNxuyiNmZha1e1S6Kll2oEQjLYfjdknoltetrDwfsWaG+s3vMEKAbsJk
	EouJRltQG6ypnh8kGlPv8EnaTZ5neBIc9v7dstFwJ0/nXo8R6v51lVi0XDI7hVRc/LYeuYoTNFa
	fBKBnK+6t8AjOjrswzlXGlTtft53tvtHx4M/tPAeV+dnsgmfhnSKZ8P/Ji8pGHJQ+bgkjUw1BnV
	Y77JTb3TVh9YlRmQ9Z904RajnLMp0fjzrmyCv6LwE1NA==
X-Google-Smtp-Source: AGHT+IFSmco6HSPi6m1DVchdg1bmfnqGjZC8lXy+DIksGsNr3zNzYPNb2jyRRf1A92QFgeFIXwfAjQ==
X-Received: by 2002:a17:902:ce83:b0:295:24ab:fb08 with SMTP id d9443c01a7336-29524abfc65mr187010795ad.47.1762239158395;
        Mon, 03 Nov 2025 22:52:38 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:1f2a:f7de:951a:621a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a3a80esm14183105ad.73.2025.11.03.22.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 22:52:37 -0800 (PST)
Date: Mon, 3 Nov 2025 22:52:35 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, linux-input@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH] Input: cros_ec_keyb - Fix an invalid memory access
Message-ID: <54pq37etkmtdwuckfxuprfikhmmoy2fzxjulas7uywqdbfiw2z@qquunvgrcqyw>
References: <20251104064353.3072727-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104064353.3072727-1-tzungbi@kernel.org>

Hi Tzung-Bi,

On Tue, Nov 04, 2025 at 06:43:53AM +0000, Tzung-Bi Shih wrote:
> If cros_ec_keyb_register_matrix() isn't called (due to
> `buttons_switches_only`) in cros_ec_keyb_probe(), `ckdev->idev` remains
> NULL.  An invalid memory access is observed in cros_ec_keyb_process()
> when receiving an EC_MKBP_EVENT_KEY_MATRIX event in cros_ec_keyb_work()
> in such case.
> 
>   Unable to handle kernel read from unreadable memory at virtual address 0000000000000028
>   ...
>   x3 : 0000000000000000 x2 : 0000000000000000
>   x1 : 0000000000000000 x0 : 0000000000000000
>   Call trace:
>   input_event
>   cros_ec_keyb_work
>   blocking_notifier_call_chain
>   ec_irq_thread
> 
> It's still unknown about why the kernel receives such malformed event,
> in any cases, the kernel shouldn't access `ckdev->idev` and friends if
> the driver doesn't intend to initialize them.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
>  drivers/input/keyboard/cros_ec_keyb.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
> index f7209c8ebbcc..635ee99fe0bd 100644
> --- a/drivers/input/keyboard/cros_ec_keyb.c
> +++ b/drivers/input/keyboard/cros_ec_keyb.c
> @@ -261,6 +261,11 @@ static int cros_ec_keyb_work(struct notifier_block *nb,
>  	case EC_MKBP_EVENT_KEY_MATRIX:
>  		pm_wakeup_event(ckdev->dev, 0);
>  
> +		if (!ckdev->idev) {
> +			dev_info(ckdev->dev, "No key matrix\n");

I think this should be dev_warn_once().

> +			return NOTIFY_OK;
> +		}
> +
>  		if (ckdev->ec->event_size != ckdev->cols) {
>  			dev_err(ckdev->dev,
>  				"Discarded incomplete key matrix event.\n");


Thanks.

-- 
Dmitry
