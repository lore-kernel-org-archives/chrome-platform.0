Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB0B1A704B
	for <chrome-platform@lists.linux.dev>; Thu, 12 Sep 2024 12:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726145899; cv=none; b=rgI0lljScHon50pwARUWWAcg3FsTkuzcyGrGeDP8Hym62zvgI0bbaDduNKhSCogmHkxh7EfjFSTFID6W4CITz9wJHd/cDGDUNKXAzzqGoaoeTsMmD0cIog3eiuNkD6k0bLymPd3gjODIeeqs986s74Lp5T5nvEBlHEf0R9UBGYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726145899; c=relaxed/simple;
	bh=JMytHvw3cW5fuz7PGFt/aVbf6j+BbuGj2j5K/qPJfLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7GwhYZHLed4rA/kSu+ck4tP1ctJ09EnY+fG8Q/6hQ22A0Qx7yxQjR/WdkEwMpucEQ8v5xp0QsIawzP8w/+afbMGFHCC6+cXo2AeFtfOvIIgFeNkEkjt4G0gpJZx+V4I9PTwik5PGSQbYZ1fA084kvUJFfGkJ1y/TkG64Ba6HHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UDLmgX9B; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UDLmgX9B"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5365b6bd901so1052583e87.2
        for <chrome-platform@lists.linux.dev>; Thu, 12 Sep 2024 05:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726145895; x=1726750695; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sPNASrfr2JDJuTNCjZzvsAqKcoboxa5LJqI+TTVNr50=;
        b=UDLmgX9BXU1KdHqgVZupkKyqMLVgbYOR0SxVtn/52IuY/cZ4hOU7ezgEsS1f/QrOZn
         48ajvhNYF+0kc0vLnhrxBz086jaPJN9X9F6z1CWk3jD0sl0/edOonue5QL0J0p2ThhH2
         DNJW2MBu9p+MfXqmgT/5V6lL4+zot/8a3OaaCuy07gfdVS0MVHVDTLtxUNxD/bwtlOro
         skgG//BQ6DTw4A5ib/DXtKtBQ3V6T2r5JPqH5NTFuUv1PR7TT2lQO7tGGycGroTWTDAz
         eqaagigdmj0FLNVMvhl7thjaVIF6KbNoa02g3PHF1cPCFNYlr2T7dMyg1I8qsGh+ZwIU
         uNPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726145895; x=1726750695;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sPNASrfr2JDJuTNCjZzvsAqKcoboxa5LJqI+TTVNr50=;
        b=T3m3HjVxihuWS8XlXEAJAqAz6Sttwl87/oTAwiM9/gViEqnM/VMllYjG+mGZgd6+fZ
         GMajmUm1Oy6ZKCLNd42rZZunpbZ2VGeJ4GfjVD7ndMUPStIq9g9NiNxtmTeI/Gp6sCEx
         rsd4l8mINr4cr68FBumYmeJu5GlbO6esLz+SOdvYGVTACgcMxl9iEmn0FTIDMntRCLCv
         4W6/zIZ6DaED9Iioua1LLtRW+ZPWBJAH/JkfmLd3kRI8LE1EfabuITs2fcAMzrTtBBC6
         uujb35Cjlv4Ws8RD54VUNNMrSW2CR6XrrFnuSZJzmfWIq68qazJc0jvviGLm8LpmdmMC
         Hmjw==
X-Forwarded-Encrypted: i=1; AJvYcCXDOEmBsnlmZlfz6MyoBCbMyQYi/NWFO8pHTntcZY5ZmkZjKgzZ5bsGsJ00MHVHz8Yf2twxUFdaSIrbmlGvOK8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyhYxsbDcjwirWo7F0JA8mXqpyoXxu7jIcq3hqTfbOIKn5ft1g2
	6TkoDoDLjqZbSFbO+h2a4+lMJmITi1v9iRzXueBJTp/pcD5311j3p/Gld3r7NyI=
X-Google-Smtp-Source: AGHT+IF9RM7FJT3xEMac/N766Zoy/DqJgTLXUwbeVf2ff03TgVWgKHdv4rG6j7goNdi57Bh5Mx7ulA==
X-Received: by 2002:a05:6512:1250:b0:533:4c73:a244 with SMTP id 2adb3069b0e04-53678ff8a49mr1446551e87.61.1726145894937;
        Thu, 12 Sep 2024 05:58:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f90da18sm1940012e87.293.2024.09.12.05.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 05:58:13 -0700 (PDT)
Date: Thu, 12 Sep 2024 15:58:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
	Pavan Holla <pholla@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v6 3/8] usb: typec: ucsi: Implement ChromeOS UCSI driver
Message-ID: <lqs2y5gvsaij5rg4o4krruseuijinqgzky6kiorjegham4aumq@fx2doq5j7wkq>
References: <20240910101527.603452-1-ukaszb@chromium.org>
 <20240910101527.603452-4-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240910101527.603452-4-ukaszb@chromium.org>

On Tue, Sep 10, 2024 at 10:15:22AM GMT, Łukasz Bartosik wrote:
> From: Pavan Holla <pholla@chromium.org>
> 
> Implementation of a UCSI transport driver for ChromeOS.
> This driver will be loaded if the ChromeOS EC implements a PPM.
> 
> Signed-off-by: Pavan Holla <pholla@chromium.org>
> Co-developed-by: Łukasz Bartosik <ukaszb@chromium.org>
> Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
> ---
>  MAINTAINERS                           |   7 +
>  drivers/usb/typec/ucsi/Kconfig        |  13 ++
>  drivers/usb/typec/ucsi/Makefile       |   1 +
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 273 ++++++++++++++++++++++++++
>  4 files changed, 294 insertions(+)
>  create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi.c
> 

[...]

> +
> +static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd)
> +{
> +	struct cros_ucsi_data *udata = ucsi_get_drvdata(ucsi);
> +	bool ack = UCSI_COMMAND(cmd) == UCSI_ACK_CC_CI;
> +	int ret;
> +
> +	if (ack)
> +		set_bit(ACK_PENDING, &udata->flags);
> +	else
> +		set_bit(COMMAND_PENDING, &udata->flags);
> +
> +	ret = cros_ucsi_async_control(ucsi, cmd);
> +	if (ret)
> +		goto out;
> +
> +	if (!wait_for_completion_timeout(&udata->complete, WRITE_TMO_MS))
> +		ret = -ETIMEDOUT;
> +
> +out:
> +	if (ack)
> +		clear_bit(ACK_PENDING, &udata->flags);
> +	else
> +		clear_bit(COMMAND_PENDING, &udata->flags);
> +	return ret;
> +}
> +
> +struct ucsi_operations cros_ucsi_ops = {
> +	.read_version = cros_ucsi_read_version,
> +	.read_cci = cros_ucsi_read_cci,
> +	.read_message_in = cros_ucsi_read_message_in,
> +	.async_control = cros_ucsi_async_control,
> +	.sync_control = cros_ucsi_sync_control,

Please use ucsi_sync_control_common instead.

> +};
> +
> +static void cros_ucsi_work(struct work_struct *work)
> +{
> +	struct cros_ucsi_data *udata = container_of(work, struct cros_ucsi_data, work);
> +	u32 cci;
> +
> +	if (cros_ucsi_read_cci(udata->ucsi, &cci))
> +		return;
> +
> +	if (UCSI_CCI_CONNECTOR(cci))
> +		ucsi_connector_change(udata->ucsi, UCSI_CCI_CONNECTOR(cci));
> +
> +	if (cci & UCSI_CCI_ACK_COMPLETE &&
> +	    test_and_clear_bit(ACK_PENDING, &udata->flags))
> +		complete(&udata->complete);
> +	if (cci & UCSI_CCI_COMMAND_COMPLETE &&
> +	    test_and_clear_bit(COMMAND_PENDING, &udata->flags))
> +		complete(&udata->complete);

ucsi_notify_common(). Why are you ignoring these functions?

-- 
With best wishes
Dmitry
