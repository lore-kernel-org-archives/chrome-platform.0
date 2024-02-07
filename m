Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655EE85624
	for <chrome-platform@lists.linux.dev>; Wed,  7 Feb 2024 19:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707333301; cv=none; b=RmKmMvOul475NS0h5iQj912yW3PQRifJEYWeAUlMH2ttiE0FI7QtkwBCm8DQNZckFQ3GhNmY8QFJG20xifLzGsg9VYZ+eCUe/wxbBdMkjSALJwjaodJ4iXmK+P11EORY0Hll3oGCYM2+JI7EKB/l/6RGvHE3PXHBXiHv+QECrA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707333301; c=relaxed/simple;
	bh=W5k1pVrv5LT4aNFcxZhVlTsA53EzW+dLt1NS9jhtrtM=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=hC3782fUkmGw1IjNKPAdoXXIKi6PV3uPBpd3TCtI0pNMqPxGTBiNBCmf+ey0+o/8AHGroClt+rcWIphoYta8QyWwiUat9TLM00TLYecA4s8ruDhNDwdVpNQ/tQXnHU12kqx0LqpJ3Dg7T9zEVNVrwZ0mU0AydiaMBysHEIF76yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mn9+Is7K; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mn9+Is7K"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-51165a488baso1327355e87.2
        for <chrome-platform@lists.linux.dev>; Wed, 07 Feb 2024 11:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707333297; x=1707938097; darn=lists.linux.dev;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X+zCCH6HGB9saSmIAWX6wClWcswuwqRqYjvjldtPTEU=;
        b=mn9+Is7KYOT7YSVzdLf/O/PyfARig8QZn5wBUOXuI8FEFxzQ7D21mbZ1b0xHJrYprV
         C0is4jaA7+hy7bg7Pial7RxpXIH2M1Ak4I7vQxPNLA+nd9/ev9Y3CjFX58Q8UtCJLBqj
         NBcfJsLsHlWO32RDe0TXlwXI2juM1LVWP8gzD5EGjWcXuB4I+MmnJdLZwjCOEBel/6eF
         BDkaXzcXPK0meTikSq1KfV9OQwcAuhDu/tgoskd9ePYWP2zbmuEZEbypN0SS95HclAH1
         0DgzFAqxGD63UyqvFWCNSoNaDc2KUpdlRCQwxaMhhVLnGNy8JCJGI8w3RZwwiLPxPQZ8
         1iVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707333297; x=1707938097;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X+zCCH6HGB9saSmIAWX6wClWcswuwqRqYjvjldtPTEU=;
        b=d0OLKAh1UfUBFbv+NnHsjDkSSv+wL5ywfo5aaqQ/fl5txJfUWOQWIqlI8LSIU9xyFI
         7Bk9Vo5psr2wu4XQy9UF7IBs3VWH0+atGYznIVKs2UkqwSGAAVvyAr5BKu9tkg8KuoT3
         SFX6znNAYPN+WBQV61KOkPzjWpMyfWVzBW8ALVkgdbLPNvew9S/HV37oHBG8yTVvEGO+
         hhaMd/10AvX1B6uJnRzH+WA2oCjubV4oPUlzQasq9gW3y0gAGez+PjNW4UVePUu7MjAO
         8nMkY/UrJ30x7IkpNbcInvIdBXhETUA3mFAWH1UmGzlcQ+rbEt0L9YlaNStMehMQh1hr
         9RiQ==
X-Gm-Message-State: AOJu0YxUhA1ZVpU7oPoWFhF7IusycEmiij0UB+G1ehYzvbNUB+TaQutF
	2350ywyBsYEdMKKREtbs5AfJVyKCZuZXEseduG0xbKYFQm7uVrSU
X-Google-Smtp-Source: AGHT+IHKcU4DfAYC+ybYnEs2gLTCHxySWNSBciYIelNeHYnUZ8fPh5fzMREyBiwbBGy3clFkEm9THA==
X-Received: by 2002:ac2:5e9b:0:b0:511:484a:dacf with SMTP id b27-20020ac25e9b000000b00511484adacfmr4036038lfq.30.1707333297152;
        Wed, 07 Feb 2024 11:14:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVJaf54joY5YOnJj/Ss0Nd4hGJAqbezIWP2b1kTCrTyJg/4kpV5SggnJoOmsqVTGPnvnHvEnferyiH4GbdzBG4LQm6pn1iv5BDIMNxUvBv8VJNm5N/lsBsxwJlU2jGPAXj99f37HvrMGAhcqUqsHlqSaMLf9B9mFARdFI3KYtOcBzv2VrnLMcW1GP09qRny/f/1QMGzophtFIEHK81I9Jm+bAEUXLyGy02Cx51YApKq4yUsS6xGpdIcDZcN5uLo0nJqvgm5ffecpOmPbapHhRS6FYUFZv5zUO7xBo0pqspczxgnOn7H83ParBlVQJTnltkFQikDVnT5Caxo5F3+rDzhbqQ4kEF4fbH8Ebt9l6aVY+tqMx7MvyHX2BKeif1ecj1CUK2UZ8WaihZYC8VVckXwl6PWXhC8Go07t/NE0Jmx4rziXLS7lqofKKfwUlNYF7av+h6hnlLknUWNTKC7d/p9PE56nMIFTG6SBWwApe+Y7PyjgIw=
Received: from [192.168.1.105] ([178.176.76.58])
        by smtp.gmail.com with ESMTPSA id v29-20020ac25b1d000000b005115365c4aesm285924lfn.292.2024.02.07.11.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Feb 2024 11:14:56 -0800 (PST)
Subject: Re: [PATCH 2/2] platform/chrome: cros_ec_typec: Make sure the USB
 role switch has PLD
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Prashant Malani <pmalani@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Emilie Roberts <hadrosaur@google.com>,
 "Nyman, Mathias" <mathias.nyman@intel.com>,
 "Regupathy, Rajaram" <rajaram.regupathy@intel.com>,
 "Radjacoumar, Shyam Sundar" <ssradjacoumar@google.com>,
 Samuel Jacob <samjaco@google.com>, linux-usb@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 Uday Bhat <uday.m.bhat@intel.com>
References: <20240207145851.1603237-1-heikki.krogerus@linux.intel.com>
 <20240207145851.1603237-3-heikki.krogerus@linux.intel.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <338756c8-af83-c023-c5b7-757d57c76fa2@gmail.com>
Date: Wed, 7 Feb 2024 22:14:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240207145851.1603237-3-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/7/24 5:58 PM, Heikki Krogerus wrote:

> The USB role switch does not always have the _PLD (Physical
> Location of Device) in ACPI tables. If it's missing,
> assigning the PLD hash of the port to the switch. That
> should guarantee that the USB Type-C port mapping code is
> always able to find the connection between the two (the port
> and the switch).
> 
> Tested-by: Uday Bhat <uday.m.bhat@intel.com>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/platform/chrome/cros_ec_typec.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> index 2b2f14a1b711..5c14e8db08b5 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
[...]
> @@ -66,6 +67,16 @@ static int cros_typec_parse_port_props(struct typec_capability *cap,
>  		cap->prefer_role = ret;
>  	}
>  
> +	/* Assing the USB role switch the correct pld_crc if it's missing. */

   Doing what?! :-P Maybe assign?

[...]

MBR, Sergey
