Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B528828E03
	for <chrome-platform@lists.linux.dev>; Thu, 18 Jan 2024 23:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705621502; cv=none; b=U2ALrYTBcbjHlpZ7mMVpP0yWde/TH9GYohN71jA8BCW8w3PNHXSAz0wn1uvjv14JQIZUGUBoIihsLcRkm3JX6Y17NHyOqOkUS+X+9PDYEPGDHxLMqwT0sFBOg+oGTsjYRbMkjgitSiogqAIYtbm9nRHmLWqNJK7UjnfXeo028q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705621502; c=relaxed/simple;
	bh=aMNVLFTdi0wFxCWZ3XYNwXhJs/hL+2wuSEvdlhOwDiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oRpy7ibLsz2lEeZrbDeVnYg69mjdjVun0TzX9IMyEDrS7RMXmmsmxxyzDB6grGC98H7ABBvOqb4+XxIMhQEVWBlSEXENQS32ptpz8yR57aZunKqiv/LN3ZBlhGA2v9/SPf+1FGZl4om7xVqrHCt4Vd5jAr9jyr0CT7JLJvCk/Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mAqNU4/D; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mAqNU4/D"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6d9bba6d773so241210b3a.1
        for <chrome-platform@lists.linux.dev>; Thu, 18 Jan 2024 15:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705621500; x=1706226300; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/JbKVsGP4/MpRrRwfY67K8Ab07+uO9p/eeTxIc4Yvmc=;
        b=mAqNU4/DKS3lKbEZ2Cy8CCFBUaDjuwAQEeepr7T46rQ560TIrq0a4lpOTGR8ph3xCt
         PnVFPj40qQvMg8hveoQU913Q0nWY9sD45H8B9ImOo5W7hpWRJQkL90COqjNi34lfgYwk
         0C4M7rNw8ZJV4YKPVh+Ekg9BQggTUJPz38vX5fMUhSirsK+U4Co968of9u+Mz0PJhbnu
         BubM6JsssrZVUsac4kjcUFi6MQzUBBBS1dvZH5fm4L5Va1+aunGLrhG6VBMG44xLE0qS
         L826PUlDqzqTy1n4qA+Ltjfy+ifVQMQAovF1dgred86R521TxTgeZynzuRI8xhVlKYLP
         eU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705621500; x=1706226300;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/JbKVsGP4/MpRrRwfY67K8Ab07+uO9p/eeTxIc4Yvmc=;
        b=KmCqNqvEvrT2HPCLJBaJUV8neWKqI9yRaCWSUtgfAVLiIzt206rnR/cM5zsxdFJ8FV
         Hx2fykqTxq4f3hrsV34Q3Rt7GBR7YYEK+PUGJ07uwh7tsh5FNyaibdlXdqvoStQQDa3Q
         jtP0899m3nM00Xf02/K8tKvNNELhCtNsXLq5dYcYX6UMadx/VUS3GZn2iicn7AB6Od2q
         sgmYFymhQZb7zn0DKcFD6LML7mygpbW9kIubKEhJ9IVTjbJBJz7wwDTl8Pi0g2xYCRUB
         bP+jNIv1XUi+AS0Cbpp7DYKuts9EYzIhYb207Ng6OU6nrolnXxid7nmUnz9qeyrWPU0k
         2ZxQ==
X-Gm-Message-State: AOJu0YwYwacE7WSaNs0LltT5JOqDk9PEhWy/7YBw1JjMqzmAr2SY0YpU
	uX4vljEsPRkRCMJTMJorx5i0rHf+xP4efLZHkSy2jHSPZc+25qweVbCCTvO1
X-Google-Smtp-Source: AGHT+IE2/9Q6E88+TmRzE54Dvvf/54yPBfAzSl22qzTBvPa1812KBvKBni8YzRoyqSlgOjoA1rejfQ==
X-Received: by 2002:a05:6a00:4fca:b0:6db:7038:fcc1 with SMTP id le10-20020a056a004fca00b006db7038fcc1mr1956072pfb.11.1705621499984;
        Thu, 18 Jan 2024 15:44:59 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id fj2-20020a056a003a0200b006d98505dacasm3842876pfb.132.2024.01.18.15.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 15:44:59 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 18 Jan 2024 15:44:58 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Lukasz Majczak <lma@chromium.org>
Cc: Gwendal Grignou <gwendal@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Radoslaw Biernacki <biernacki@google.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v2 3/3] mfd: cros_ec: Register EC-based watchdog subdevice
Message-ID: <afc0a32f-4352-4ce7-a57d-9c5900ba91d1@roeck-us.net>
References: <20240118195325.2964918-1-lma@chromium.org>
 <20240118195325.2964918-4-lma@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240118195325.2964918-4-lma@chromium.org>

On Thu, Jan 18, 2024 at 07:53:24PM +0000, Lukasz Majczak wrote:
> Add ChromeOS EC-based watchdog as EC subdevice.
> 
> Signed-off-by: Lukasz Majczak <lma@chromium.org>
> ---
>  drivers/mfd/cros_ec_dev.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> index 603b1cd52785..d0140a285f69 100644
> --- a/drivers/mfd/cros_ec_dev.c
> +++ b/drivers/mfd/cros_ec_dev.c
> @@ -91,6 +91,10 @@ static const struct mfd_cell cros_usbpd_notify_cells[] = {
>  	{ .name = "cros-usbpd-notify", },
>  };
>  
> +static const struct mfd_cell cros_ec_wdt_cells[] = {
> +	{ .name = "cros-ec-wdt-drv", }

Assuming you drop "-drv",

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Thanks,
Guenter
