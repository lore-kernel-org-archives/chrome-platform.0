Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C965C4E1CA
	for <chrome-platform@lists.linux.dev>; Wed, 25 Sep 2024 17:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727283808; cv=none; b=Z1McCGPFhYyi1of1R5aewAMaLTn4K4RxVU7wmDSBQc6+rFE1RFIVk3w9MFjvQvYNljQRwh8Yvk5OV0SAsbRJCtM8prWyrY+JD1nDIlWITYdecdyRkZMinsNkrLbGq7qC31eyZyeWTIIU4a2ADGF5x7nrSQTh5+9wAWQw6BZezwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727283808; c=relaxed/simple;
	bh=8+CiQ3ct7rP8E1uUkFTQatMNfRnyfIR+m5/LlxoWnro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PG9utqwOfjnJiLaM8iHs6J6Y8qL+3Mn7nBJANOKHfb9q4sxfMelQzLfeOeeliqTBtBWRqgNs3rKITfUCUjUzK1upwnr0Coh0MaAGT2VDGwdUas/EF5493xZ9bJTuQTRGUFwAjMfamJAQ5b1bu0vkgnq1O0B0Q3JbC0uFI+XVpcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nh//NYXb; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nh//NYXb"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f761461150so894841fa.0
        for <chrome-platform@lists.linux.dev>; Wed, 25 Sep 2024 10:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727283805; x=1727888605; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j6Fg6bmoR8ixQy+AhumLhzrwdCnArsHCxqvb2WDz5gM=;
        b=Nh//NYXblql7VwQ5io+FiWJ+/FejiwAHt7+0UCNLWOgsvky9MhwVohNCgs8SUNRkHd
         4k4gV9/zerPsV6JuNB0teLecnaKrVT1HxXb81phRHowUqymtBskf5F88g67gldXXqBq2
         ooc8rhWG6e20P+WmhYyMadcvY9yfLsBLK3qpBarNHJrHXKY7rPSpu/MI/1R29WWiGo2H
         ERMuCqIbhaDiND4KlQhTZIPO6hQWQ1vYy6/LPbHtQ4115tDZFqeNKV68IfmikQjgjuZ5
         wyDESEBmYpHnYDtjQvladu4HBV0uMIM7ItsYNnr3Yjlk4UCZp4fZ3hY65Ev96mQzzhad
         YPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727283805; x=1727888605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j6Fg6bmoR8ixQy+AhumLhzrwdCnArsHCxqvb2WDz5gM=;
        b=Sv1dUfOubypzd2Iq4VtNFnxrcx9L6cQR6C13xasaqOoctQqEq4fghueK29JxwGekgb
         Vb7qOAN7FVRRq/wcwo1t26jTzumGINy4hl4ru+NWjM/86XHcWfQ2/E+xd4Jy2xC4OvMU
         UhAAKe9qQQvGBqPwJ0bHq2ZN/hutW+y7pdVek278ti19cBPhFrFF4Mokrad1kUlQtMf4
         pN/iW2p5ES0WzG99/SpLlB4OIOmCeFg57Ty4QSL56nn4mXctYtX1nTNkYdUIYbEUapde
         EOQ88CHdKrnc8w6JRr1H6QzyYC4yUG37iqu1TbfnNFuOE60mc3gZJYLDCWEvh+h3o51W
         bNkg==
X-Forwarded-Encrypted: i=1; AJvYcCWQvf3HXG2DtCe3hFV/2LqisDpgj6+2S2Yp6YHVI8RTsW1JKwlEiy1fapDkFsXC/2vtC6jgbvduQW6l1M7lGHc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzilMILrxi/0R4w0zZHejSzXdbikhVA1q1r2JSOzVQkTBtL4hmY
	jcGEjhpsZt2M6Ho1UOCnT3TYkkQgBV71dJfG3AvXDym79FgESzrSNkA6kldQ32M=
X-Google-Smtp-Source: AGHT+IHxEVAWh+SqVB2ZgG9Rr+GdG84Kf38DE8exr5lCzUK2QGxCZsyQeBBosbZOMBl1IwFN7iL+xw==
X-Received: by 2002:a05:651c:2126:b0:2f7:94d9:426a with SMTP id 38308e7fff4ca-2f91507e2fdmr37353561fa.5.1727283804796;
        Wed, 25 Sep 2024 10:03:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f8d283b661sm5555621fa.33.2024.09.25.10.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 10:03:22 -0700 (PDT)
Date: Wed, 25 Sep 2024 20:03:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: heikki.krogerus@linux.intel.com, tzungbi@kernel.org, jthies@google.com, 
	pmalani@chromium.org, akuchynski@google.com, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/8] platform/chrome: cros_ec_typec: Disable auto_enter
Message-ID: <vnemjw6uo3sydriabdrzwinbnam2xitrezrw3ztcymi63zakep@2rruplyjzuol>
References: <20240925162513.435177-1-abhishekpandit@chromium.org>
 <20240925092505.8.Ic14738918e3d026fa2d85e95fb68f8e07a0828d0@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925092505.8.Ic14738918e3d026fa2d85e95fb68f8e07a0828d0@changeid>

On Wed, Sep 25, 2024 at 09:25:09AM GMT, Abhishek Pandit-Subedi wrote:
> Altmodes with cros_ec are either automatically entered by the EC or
> entered by typecd in userspace so we should not auto enter from the
> kernel.

This makes policy decision for the whole platform. Consider somebody
running normal Linux distro on chromebooks. Can this be configured by
the userspace itself?

> 
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> ---
> 
>  drivers/platform/chrome/cros_ec_typec.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> index ec13d84d11b8..e06a0f2712ce 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -294,6 +294,7 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
>  	desc.svid = USB_TYPEC_DP_SID;
>  	desc.mode = USB_TYPEC_DP_MODE;
>  	desc.vdo = DP_PORT_VDO;
> +	desc.no_auto_enter = true;
>  	amode = cros_typec_register_displayport(port, &desc,
>  						typec->ap_driven_altmode);
>  	if (IS_ERR(amode))
> @@ -314,6 +315,7 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
>  		memset(&desc, 0, sizeof(desc));
>  		desc.svid = USB_TYPEC_TBT_SID;
>  		desc.mode = TYPEC_ANY_MODE;
> +		desc.no_auto_enter = true;
>  		amode = cros_typec_register_thunderbolt(port, &desc);
>  		if (IS_ERR(amode))
>  			return PTR_ERR(amode);
> -- 
> 2.46.0.792.g87dc391469-goog
> 

-- 
With best wishes
Dmitry
