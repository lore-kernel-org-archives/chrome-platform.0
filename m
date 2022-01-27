Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DD429CA
	for <chrome-platform@lists.linux.dev>; Thu, 27 Jan 2022 03:06:30 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id v74so1447262pfc.1
        for <chrome-platform@lists.linux.dev>; Wed, 26 Jan 2022 19:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xYVfPUL0HT1HfQJFKeNSl4bObGkqhbPgG9tLiL2+h0I=;
        b=SevtvM6HXv4iELfguL2woPmkXMhHim46mAMmEMP0q6swAdgF3maZrrxh7ag/mAqgtQ
         fs0kaH8z4VsggKzgszjxuUkMbKcs4jS0Or+6m8POYqNVdFGvDiSQv7INQEh8MxDaxFgG
         ceM0M/Q6a7lvHOtxEkys7RebrKO+MbZww0SG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xYVfPUL0HT1HfQJFKeNSl4bObGkqhbPgG9tLiL2+h0I=;
        b=CqqWuyUcdz0U42vG8DA9ldCtSub5JMjAe6l+FUtg0eVjn6XiP78eCyjs7c7Rc5RTzT
         jOM/MhpL2Ro+e1YVUIRkjV9xCcF+LE9QWgiYUdAfCdU5VEZO06Sj/vE1xcwtat8KmTrN
         Qe0/L2BB/FOIzXg2YR9AghsV6K36FCG27fVic5iA0IGhYyzX3/HAEkDlBtjNZ5bzXkK+
         MRVhnvndSyaeKqi4KTR+Q5SR1Aw+so4j7q2c0FAs/HS9h2q95MUBMOImplr99oliWUm8
         UttROnqOhPq9etyBR3wUx/DzPppt7tdpAYibsO18tLEK/ld+wP6iUFBLGrPjyQhv2mkx
         j2Cw==
X-Gm-Message-State: AOAM531xbM13pIiYN67jhG2Ywk3e0+wcBx6+B5fbD8vLb83kOSPc4R+K
	GKawCjPZHyw2HEcE2C7TF/PxHg==
X-Google-Smtp-Source: ABdhPJxNgTkHGV0XJmVs+u0EOP88+mW/sUh/5JAiRbI/CRrRnDtWpSf/IZyBLhy76fCDUJwpYVNiKA==
X-Received: by 2002:a63:c51:: with SMTP id 17mr1307984pgm.491.1643252790168;
        Wed, 26 Jan 2022 19:06:30 -0800 (PST)
Received: from chromium.org (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id v13sm3316200pfi.201.2022.01.26.19.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 19:06:29 -0800 (PST)
Date: Thu, 27 Jan 2022 03:06:28 +0000
From: Prashant Malani <pmalani@chromium.org>
To: Benson Leung <bleung@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	bleung@google.com
Subject: Re: [PATCH] MAINTAINERS: platform-chrome: Add new
 chrome-platform@lists.linux.dev list
Message-ID: <YfIMNC2zE2kyhSuP@chromium.org>
References: <20220126222233.2852280-1-bleung@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126222233.2852280-1-bleung@chromium.org>

Hi Benson,

On Jan 26 14:22, Benson Leung wrote:
> Signed-off-by: Benson Leung <bleung@chromium.org>
Reviewed-by: Prashant Malani <pmalani@chromium.org>

> ---
>  MAINTAINERS | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ea3e6c914384..cad7b0fff9f4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4537,6 +4537,7 @@ F:	drivers/input/touchscreen/chipone_icn8505.c
>  
>  CHROME HARDWARE PLATFORM SUPPORT
>  M:	Benson Leung <bleung@chromium.org>
> +L:	chrome-platform@lists.linux.dev
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
>  F:	drivers/platform/chrome/
> @@ -4544,6 +4545,7 @@ F:	drivers/platform/chrome/
>  CHROMEOS EC CODEC DRIVER
>  M:	Cheng-Yi Chiang <cychiang@chromium.org>
>  R:	Guenter Roeck <groeck@chromium.org>
> +L:	chrome-platform@lists.linux.dev
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
>  F:	sound/soc/codecs/cros_ec_codec.*
> @@ -4551,6 +4553,7 @@ F:	sound/soc/codecs/cros_ec_codec.*
>  CHROMEOS EC SUBDRIVERS
>  M:	Benson Leung <bleung@chromium.org>
>  R:	Guenter Roeck <groeck@chromium.org>
> +L:	chrome-platform@lists.linux.dev
>  S:	Maintained
>  F:	drivers/power/supply/cros_usbpd-charger.c
>  N:	cros_ec
> @@ -4558,11 +4561,13 @@ N:	cros-ec
>  
>  CHROMEOS EC USB TYPE-C DRIVER
>  M:	Prashant Malani <pmalani@chromium.org>
> +L:	chrome-platform@lists.linux.dev
>  S:	Maintained
>  F:	drivers/platform/chrome/cros_ec_typec.c
>  
>  CHROMEOS EC USB PD NOTIFY DRIVER
>  M:	Prashant Malani <pmalani@chromium.org>
> +L:	chrome-platform@lists.linux.dev
>  S:	Maintained
>  F:	drivers/platform/chrome/cros_usbpd_notify.c
>  F:	include/linux/platform_data/cros_usbpd_notify.h
> -- 
> 2.35.0.rc0.227.g00780c9af4-goog
> 
