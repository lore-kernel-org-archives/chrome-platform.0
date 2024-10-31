Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329E113A865
	for <chrome-platform@lists.linux.dev>; Thu, 31 Oct 2024 18:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730400667; cv=none; b=fLtf7bXdV2MgTqdWyP3qK1VBV19Wj1E/VU8h2ueRdAXEbXq9+NlNna/dekn32anbTZtzXvS1V13XdAb05qIy2lbIu6l6WjDkt0KC8ADvczwPuVkxjn2G9QnH9/v3vS5Z5XyYDusRld1LZ+Yt9gKnPu4EtQMOsoklfY/ln7BL2mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730400667; c=relaxed/simple;
	bh=JB1gkzLJvhdq3yYTz3etpK5sKcvwuYS1ggWD0Twcx0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K97NmH6eRTXcK9AMvWRXaNzgU9XiWW3Y00kbef2x+oD1TcLtJ60gDUsEw7lthVVRlaqZdiyNUi9Bsd6/Spx4vfEgkF+qhVYh8rct3WG2EYt7MpvxameWdKdCTkpVF7546XJJvC/96rT4pQ5DmiJ/aIF9vCBTdTsB1bGdblK5uj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=unLaxdJS; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="unLaxdJS"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso20520731fa.3
        for <chrome-platform@lists.linux.dev>; Thu, 31 Oct 2024 11:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730400663; x=1731005463; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Aa9kVu7NocMuR/0c9YMpzWLqvksSSmbCb9vDA86PzA0=;
        b=unLaxdJSjapBBW99ybz5eLCkcaBkFGAfoSnK3S5WU4UBu32yRTK8lrO2ObLTah40/x
         F+x7o8068HKO7TFOplN3BW6YJFI0vWc48juQ8SUmyxK9t24YrBVPrhIu+Ov+Frrg86YW
         loMgXsYjge0mrL+dRcjVrs9IW9Q58IJWAzszGF/RYN3a7deAsBAeOVJBRgQnCog6GfaB
         9AHilVZzkpbCn8xc0fmE807dB3Tm99BHxgzIYKcw4Ltp4L5bZsMRt/yuosIKP69PAZPU
         NZVKpokyX4hwNXN1+T2TBGeG4LPs/SwVWpToiN+tNJqqPHgiCr2jnX7ljIJxDbMLWhWz
         mPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730400663; x=1731005463;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aa9kVu7NocMuR/0c9YMpzWLqvksSSmbCb9vDA86PzA0=;
        b=Tms2Ba6biwSBcZqrUBOfmhngsaSKPpvndZ0VPtygkqrseXh3/SphD87CEDrCdvWeuL
         QY8DJ/adEAbTDKdUIg18l/Hp0M71JQfoUrsZtIlVs+vLdWsy/qpNifnkfvvadd5bf4hQ
         E/r5YChjqUJZgxCm8wOliclzG7mAVTvyXJ10XUcznUZLNWAwlc7cvIKvULav3bGnMY/C
         ifVoKLLm5vPdhwuq/4cIqzp4x49lOFOsYqen77L3SGUrWgOjz3HBVEbJrrDgC6Lfp7IU
         m+X3QGmkZJXnBjrcWwdBbNOMwEwsuK28v36uzzqmBeTBo7nmpMKaS61Ob8AL27gV2cHe
         tUcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHD0Cr0pt3iznqEAK8EnodCvC0mOZRgyaRMd0aYTxUu6/FBmZCqjIh4TXtuo7k7ukaUptqiLyAma8pY+qKcQ8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyeKOuUN907SyYGtWkd6Tkj6y9XK5w6QGk4hA8DeW4BzZcGPOWb
	Gx2iucsnAbLUDR20/bBQIFfWchfxM3PEJGYko/zvDAI9rVXX3nPAs47D2erAceY=
X-Google-Smtp-Source: AGHT+IFMgIjOjSkJzL94hJp/UCIkz42/uTf1D2UZbjEjPPwaiLZazMJNGeVx3+EiWX1VPKYneCBwQQ==
X-Received: by 2002:a2e:a902:0:b0:2fb:4db1:1ab7 with SMTP id 38308e7fff4ca-2fedb82fc9amr9981491fa.39.1730400663269;
        Thu, 31 Oct 2024 11:51:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef8a6410sm3007891fa.97.2024.10.31.11.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 11:51:01 -0700 (PDT)
Date: Thu, 31 Oct 2024 20:51:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: heikki.krogerus@linux.intel.com, tzungbi@kernel.org, 
	linux-usb@vger.kernel.org, chrome-platform@lists.linux.dev, jthies@google.com, 
	akuchynski@google.com, pmalani@chromium.org, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] platform/chrome: cros_ec_typec: Thunderbolt
 support
Message-ID: <a5emtussqri2jxhchhh4rz5i54lpjij5jxcuuilnkdu2n7tdpo@g2l4xiqrxxzs>
References: <20241030212854.998318-1-abhishekpandit@chromium.org>
 <20241030142833.v2.6.Ic61ced3cdfb5d6776435356061f12307da719829@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030142833.v2.6.Ic61ced3cdfb5d6776435356061f12307da719829@changeid>

On Wed, Oct 30, 2024 at 02:28:37PM -0700, Abhishek Pandit-Subedi wrote:
> Add support for entering and exiting Thunderbolt alt-mode using AP
> driven alt-mode.
> 
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> ---
> 
> Changes in v2:
> - Refactored thunderbolt support into cros_typec_altmode.c
> 
>  drivers/platform/chrome/cros_ec_typec.c      | 29 ++++---
>  drivers/platform/chrome/cros_typec_altmode.c | 85 ++++++++++++++++++++
>  drivers/platform/chrome/cros_typec_altmode.h | 14 ++++
>  3 files changed, 116 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> index 7997e7136c4c..3e043b1c1cc8 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -304,21 +304,26 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
>  	typec_altmode_set_drvdata(amode, port);
>  	amode->ops = &port_amode_ops;
>  #endif
> -
>  	/*
>  	 * Register TBT compatibility alt mode. The EC will not enter the mode
> -	 * if it doesn't support it, so it's safe to register it unconditionally
> -	 * here for now.
> +	 * if it doesn't support it and it will not enter automatically by
> +	 * design so we can use the |ap_driven_altmode| feature to check if we
> +	 * should register it.
>  	 */
> -	memset(&desc, 0, sizeof(desc));
> -	desc.svid = USB_TYPEC_TBT_SID;
> -	desc.mode = TYPEC_ANY_MODE;
> -	amode = typec_port_register_altmode(port->port, &desc);
> -	if (IS_ERR(amode))
> -		return PTR_ERR(amode);
> -	port->port_altmode[CROS_EC_ALTMODE_TBT] = amode;
> -	typec_altmode_set_drvdata(amode, port);
> -	amode->ops = &port_amode_ops;
> +	if (typec->ap_driven_altmode) {
> +		memset(&desc, 0, sizeof(desc));
> +		desc.svid = USB_TYPEC_TBT_SID;
> +		desc.mode = TYPEC_ANY_MODE;
> +		amode = cros_typec_register_thunderbolt(port, &desc);
> +		if (IS_ERR(amode))
> +			return PTR_ERR(amode);
> +		port->port_altmode[CROS_EC_ALTMODE_TBT] = amode;
> +
> +#if !IS_ENABLED(CONFIG_TYPEC_TBT_ALTMODE)
> +		typec_altmode_set_drvdata(amode, port);
> +		amode->ops = &port_amode_ops;
> +#endif

Why? Usually having the code block under an #if is a frowned upon
practice.

> +	}
>  
>  	port->state.alt = NULL;
>  	port->state.mode = TYPEC_STATE_USB;

[...]

> diff --git a/drivers/platform/chrome/cros_typec_altmode.h b/drivers/platform/chrome/cros_typec_altmode.h
> index c6f8fb02c99c..c71568314e3f 100644
> --- a/drivers/platform/chrome/cros_typec_altmode.h
> +++ b/drivers/platform/chrome/cros_typec_altmode.h
> @@ -31,4 +31,18 @@ static inline int cros_typec_displayport_status_update(struct typec_altmode *alt
>  	return 0;
>  }
>  #endif
> +
> +#if IS_ENABLED(CONFIG_TYPEC_TBT_ALTMODE)
> +struct typec_altmode *
> +cros_typec_register_thunderbolt(struct cros_typec_port *port,
> +				struct typec_altmode_desc *desc);
> +#else
> +struct typec_altmode *

static inline struct ...
LGTM otherwise

> +cros_typec_register_thunderbolt(struct cros_typec_port *port,
> +				struct typec_altmode_desc *desc)
> +{
> +	return typec_port_register_altmode(port->port, desc);
> +}
> +#endif
> +
>  #endif /* __CROS_TYPEC_ALTMODE_H__ */
> -- 
> 2.47.0.163.g1226f6d8fa-goog
> 

-- 
With best wishes
Dmitry
