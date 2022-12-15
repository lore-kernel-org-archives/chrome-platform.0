Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C6A6AA6
	for <chrome-platform@lists.linux.dev>; Thu, 15 Dec 2022 22:01:30 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id e7-20020a17090a77c700b00216928a3917so4108918pjs.4
        for <chrome-platform@lists.linux.dev>; Thu, 15 Dec 2022 14:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tT3e/BlligUWUFhcZfX4iVlpqtA9bkBjABn6+pGDkBo=;
        b=Legp2iApAg21IOMNB/w8A4Pg82zRjGYDL1b8x97fAiSxxcv+HlX9V7BuC1PL8QVGhn
         mkp+qLcm5NOLpWgILHZFfOtkR8jhe7mvyOnsq4dR8c+WAfOYlsDCRJtP2FerRkW4XPLl
         u7Lo0mLMYmyB4HimZPgtetRp0VRpHqmDHXxti7mYvIHKbi1sYBTAUCC8zDG7kzohMsWM
         z+XM2QyL1FC8P+O1NnyVLq+pDS9BMtVsU67F6JEigptxT+Rnetz4tj8cb+yE3TP+4D22
         nilrfOApy4zY9PmwvP/NGQ6bwIsYJo1Qkl4SHV2ORFR1pPziUWuEG7DGDvntk6xfm8/K
         XjeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tT3e/BlligUWUFhcZfX4iVlpqtA9bkBjABn6+pGDkBo=;
        b=7OqzzFqMIuZnmPyJWubz1eQ6IZWW+0EASoSDXG9ugMOsk/qApAmZ01MxH1yigROjEI
         BJnNeasdE7rPJafCmBjJP1+y9SF98XAzTB59ftCHwMMfAtMcHrvoGp610OcZj69RhUQH
         fR8qNKIyeXua6HepbH2qfulGXb8WHayl4RdgkasIR0zsG9utlCF2LkgSr3l6Nvuu4WUw
         TA74/yNCWeOEHeHxaYTUaVt58K0CrTh5Vo+hlEeorNcZbjfYZb6fqFrR1QFqSQygA8ON
         XzcPuRdpBNnb63sv/MXwlnqKpEiT1YpaG2RSJQDxBZ/TT/333t89HSHcyu2n2QRRVTe3
         F2iQ==
X-Gm-Message-State: ANoB5pm9AVJNcDuai806sy6uHmMvhOBxxDf3QCNDjBClAyILnv6t4zew
	qrbuPUsNslVIJocy9XulsQg=
X-Google-Smtp-Source: AA0mqf4DqlzuM7laIaEvYTSbFNVU8bvo5QfFiwdX7jTZt4xcTeA0HUeubcr6MPPHgQkt8hggDGYAAg==
X-Received: by 2002:a17:903:1d1:b0:189:c47b:af27 with SMTP id e17-20020a17090301d100b00189c47baf27mr41321392plh.10.1671141690248;
        Thu, 15 Dec 2022 14:01:30 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:6004:4a46:4691:4e2c])
        by smtp.gmail.com with ESMTPSA id x15-20020a170902a38f00b00178b6ccc8a0sm132738pla.51.2022.12.15.14.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 14:01:29 -0800 (PST)
Date: Thu, 15 Dec 2022 14:01:25 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Joe Wu <joewu@msi.corp-partner.google.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
	Xiang wangx <wangxiang@cdjrlc.com>, linux-input@vger.kernel.org,
	Derek Huang <derekhuang@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benson Leung <bleung@chromium.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	Furquan Shaikh <furquan@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	Douglas Anderson <dianders@chromium.org>,
	"Dustin L . Howett" <dustin@howett.net>,
	Guenter Roeck <groeck@chromium.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH] cros_ec_keyb: Add 3 buttons for monitor function
Message-ID: <Y5uZNVzEgsKzlPD0@google.com>
References: <20221215061550.18993-1-joewu@msi.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221215061550.18993-1-joewu@msi.corp-partner.google.com>

Hi Joe,

On Thu, Dec 15, 2022 at 02:15:50PM +0800, Joe Wu wrote:
> This patch is to add extra 3 buttons: 'brightness up',
> 'brightness down' and 'leave PC(cros) mode' to support
> monitor navigation function.

I understand "brightness up" and "brightness down" but I have no idea
what "leave PC(cros) mode" means. I also do not think we should be
abusing F13 for this.

Thanks.

> 
> Signed-off-by: Joe Wu <joewu@msi.corp-partner.google.com>
> 
> ---
> 
>  drivers/input/keyboard/cros_ec_keyb.c          | 15 +++++++++++++++
>  include/linux/platform_data/cros_ec_commands.h |  3 +++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
> index c14136b733a9..bf1cf0b782d2 100644
> --- a/drivers/input/keyboard/cros_ec_keyb.c
> +++ b/drivers/input/keyboard/cros_ec_keyb.c
> @@ -100,6 +100,21 @@ static const struct cros_ec_bs_map cros_ec_keyb_bs[] = {
>  		.code		= KEY_VOLUMEDOWN,
>  		.bit		= EC_MKBP_VOL_DOWN,
>  	},
> +	{
> +		.ev_type        = EV_KEY,
> +		.code           = KEY_BRIGHTNESSUP,
> +		.bit            = EC_MKBP_BRI_UP,
> +	},
> +	{
> +		.ev_type        = EV_KEY,
> +		.code           = KEY_BRIGHTNESSDOWN,
> +		.bit            = EC_MKBP_BRI_DOWN,
> +	},
> +	{
> +		.ev_type        = EV_KEY,
> +		.code           = KEY_F13,
> +		.bit            = EC_MKBP_CROS_LEAVE,
> +	},
>  
>  	/* Switches */
>  	{
> diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
> index 5744a2d746aa..79218da8a8cb 100644
> --- a/include/linux/platform_data/cros_ec_commands.h
> +++ b/include/linux/platform_data/cros_ec_commands.h
> @@ -3471,6 +3471,9 @@ struct ec_response_get_next_event_v1 {
>  #define EC_MKBP_VOL_UP		1
>  #define EC_MKBP_VOL_DOWN	2
>  #define EC_MKBP_RECOVERY	3
> +#define EC_MKBP_BRI_UP          4
> +#define EC_MKBP_BRI_DOWN        5
> +#define EC_MKBP_CROS_LEAVE      6
>  
>  /* Switches */
>  #define EC_MKBP_LID_OPEN	0
> -- 
> 2.17.1
> 

-- 
Dmitry
