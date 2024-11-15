Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33F2163
	for <chrome-platform@lists.linux.dev>; Fri, 15 Nov 2024 17:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731690036; cv=none; b=r7A1pyrf71dC+tkyrJcACmSG2QM7SSUjo8H3AvWePfydtT4DMw4aVHnikLJlV7pGTDuV2TBgQBwPHnIkyTCB0ZyIMxSZqBDpEDFYTNm2P1afR3EQvEqdrK48Xdvc0GvH6RyWGbeCcTzxaUYwNft6+dQ7qX8ai+1fMamM8zfISyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731690036; c=relaxed/simple;
	bh=7fHXJZ7b5NinPkpC6H0sUbUc7KsfFZpD41FsZYPZOwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A5Cs/Bb9xtr8DR9RMiM8zzHDd7VvqFSnE0ZFJosRGsBFFNdhklcad2UlJRzRlR0l1clRXgemicFBph50CfZSPSmRO9cEj5EFeTAx4CrJyCI3sarHnE69lUIRJSz4OWYjAo3tfzrE3FcgiJdBqTijUmBeCsvHhsXkhAbiICgFvuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M85GEeNb; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M85GEeNb"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53da2140769so2239695e87.3
        for <chrome-platform@lists.linux.dev>; Fri, 15 Nov 2024 09:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731690032; x=1732294832; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vp5BxYK8p9Zak2IQUNwDmBirSVmpOKud+gbkwkxz+po=;
        b=M85GEeNbQBbf7HXN/+947IBZrSFTFwtTq4JpCI7kRp4DSNsofhW2lAnlqP2FuQJir6
         V6nKu6WYgcey2PNOddk3fXQbAVoIkC+Jx5Kvziao59KUFGkb0GW4G46VyJg3vmbd241F
         tt9dxi8SNmbYmff6YVxVgNYiUGAWkAae/FuQ5iWZ2FpvuPPPhpzObRVKAM819k0AH9xs
         e8K0bDjYaN+gbvKwi6cJAvOyo0YCdEqIAFidKUH5w/55LCcQ0bbAZtG6Wh8GEPBDj0Qj
         mOOl6meLKhOnr0W8eHIExexcTyzDk+K3gACvKP/XqxVl8kwYsoUXgCTua4U552AmYFxw
         ZIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731690032; x=1732294832;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vp5BxYK8p9Zak2IQUNwDmBirSVmpOKud+gbkwkxz+po=;
        b=quGWQ3kYS5exzf1VICAYaWz68Xlwp+ltF0W+LVqRpceQLZiMKtDfGbI1h3aw2UxL7I
         ar7igV3LwCP+gVZ5rf5qyg94CC0z01Qnd/hq7jl4jWVsCGDFAgxjgx+ukuo584QDjgqJ
         16jeID4CcNV9/5A8hIPCBgXUMXE5AgmLfXeA9jFtHB22mpuK6uR4jldAWCb2PHjrczmP
         +sqBDJn2Zw0eQDzQwpfZ/g95iHWplLpzWW+vuiPK1tdP2freYi8R61wZlz01DnEpWzDK
         zXBRXPz+rPgaz2mJFdpxF9A9Iuidiw+x1yjC7mMxjtyefPDFxBZNH28Uk+CkOo5RRHLX
         y2qg==
X-Forwarded-Encrypted: i=1; AJvYcCU00vx5NJCB2FMvL80MrS4xHAcScDZMLZK+T/QnO7/ybbQSuXa5Dbu+t0CMDZnua54EUEght9riDKg9BERU5y8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwncN4q8xGys3wdNN/bDj1uBb4ATuzHE3dTMqk6I5UH47TzlWs
	Kso/jN/tFEJdHH/T2YCxzkKDRmrgJbSa+sKbHtxmiQibchm51YbjIayKTMAYaQc=
X-Google-Smtp-Source: AGHT+IHRrzx4sh1fkJneoEq99zQMT8VlMI4f6yDZI/hglJ3VA6yZDbjQ0cdqMIe9VHzQYIFJD4uwkg==
X-Received: by 2002:a05:6512:3b24:b0:53d:a95b:b2e7 with SMTP id 2adb3069b0e04-53dab3b0f70mr1607911e87.55.1731690031976;
        Fri, 15 Nov 2024 09:00:31 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da6530f83sm626597e87.163.2024.11.15.09.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 09:00:30 -0800 (PST)
Date: Fri, 15 Nov 2024 19:00:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Pavan Holla <pholla@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v7 2/3] usb: typec: ucsi: Implement ChromeOS UCSI driver
Message-ID: <jatq645z65hthaud4up6h6mxbggqpm73djtd6t3fxxkwccsifu@bb7bn24b7dak>
References: <20241115155234.1587589-1-ukaszb@chromium.org>
 <20241115155234.1587589-3-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241115155234.1587589-3-ukaszb@chromium.org>

On Fri, Nov 15, 2024 at 03:52:33PM +0000, Łukasz Bartosik wrote:
> From: Pavan Holla <pholla@chromium.org>
> 
> Implementation of a UCSI transport driver for ChromeOS.
> This driver will be loaded if the ChromeOS EC implements a PPM.
> 
> Signed-off-by: Pavan Holla <pholla@chromium.org>
> Co-developed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Co-developed-by: Łukasz Bartosik <ukaszb@chromium.org>
> Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
> ---
>  MAINTAINERS                           |   7 +
>  drivers/usb/typec/ucsi/Kconfig        |  13 ++
>  drivers/usb/typec/ucsi/Makefile       |   1 +
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 248 ++++++++++++++++++++++++++
>  4 files changed, 269 insertions(+)
>  create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi.c

> +static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd)
> +{
> +	return ucsi_sync_control_common(ucsi, cmd);
> +}
> +
> +struct ucsi_operations cros_ucsi_ops = {
> +	.read_version = cros_ucsi_read_version,
> +	.read_cci = cros_ucsi_read_cci,
> +	.read_message_in = cros_ucsi_read_message_in,
> +	.async_control = cros_ucsi_async_control,
> +	.sync_control = cros_ucsi_sync_control,

.sync_control = ucsi_sync_control_common,

> +};
> +

[...]

> +
> +static int __maybe_unused cros_ucsi_suspend(struct device *dev)
> +{
> +	struct cros_ucsi_data *udata = dev_get_drvdata(dev);
> +
> +	cancel_work_sync(&udata->work);
> +
> +	return 0;
> +}
> +
> +static void __maybe_unused cros_ucsi_complete(struct device *dev)
> +{
> +	struct cros_ucsi_data *udata = dev_get_drvdata(dev);
> +
> +	ucsi_resume(udata->ucsi);
> +}
> +
> +static const struct dev_pm_ops cros_ucsi_pm_ops = {
> +#ifdef CONFIG_PM_SLEEP
> +	.suspend = cros_ucsi_suspend,
> +	.complete = cros_ucsi_complete,
> +#endif

SET_SYSTEM_SLEEP_PM_OPS ? Or even better, DEFINE_SIMPLE_DEV_PM_OPS() ?

What is the reason for using complete() instead of resume()?

> +};
> +
> +static const struct platform_device_id cros_ucsi_id[] = {
> +	{ KBUILD_MODNAME, 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, cros_ucsi_id);
> +
> +static struct platform_driver cros_ucsi_driver = {
> +	.driver = {
> +		.name = KBUILD_MODNAME,
> +		.pm = &cros_ucsi_pm_ops,
> +	},
> +	.id_table = cros_ucsi_id,
> +	.probe = cros_ucsi_probe,
> +	.remove = cros_ucsi_remove,
> +};
> +
> +module_platform_driver(cros_ucsi_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("UCSI driver for ChromeOS EC");
> -- 
> 2.47.0.338.g60cca15819-goog
> 

-- 
With best wishes
Dmitry
