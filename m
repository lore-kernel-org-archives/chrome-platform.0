Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBF518A6B4
	for <chrome-platform@lists.linux.dev>; Fri, 27 Sep 2024 09:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727428062; cv=none; b=S+8qYjRbUGJJpqa+BvdrAZj8S1F9yIqpXVif7+uwxIvkauVmywsQYS/H98NgB6xwvnthX/1H1BsYE1sn9Lg00MyICrY9jxlwd+lFOUaFxD1kSLvzGcH8Lq0B9PGUleEXLI1dp/cWWeel6sT2sWxVvbVdEoEEjyIGIuHZnhkSV7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727428062; c=relaxed/simple;
	bh=n9K+M/M4rIeKAh1/1h57NW9b2sVRQ7AIdfsOF6GuIRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G4rJ7ud2zjmORoSW2OzeCpoIwuYxQLZRjK5c7+OHXG72CY6IZbQb7cKr6MBkJia+6PE3la1VcdgL01CDT0G3Dfmz1iCZFVfDD41Vss3GkhALtpooPBm5k/NPA9kwyvX3RWWfSvbvRvtN3gVvB7YZL8kLHPpWM+sJuu4lEiU+xGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zyZLmbBp; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zyZLmbBp"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5365928acd0so2496410e87.2
        for <chrome-platform@lists.linux.dev>; Fri, 27 Sep 2024 02:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727428059; x=1728032859; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zV6HJXNQV5T8CuQJ/tUTNkNzYTYxFtQgwRH9nbfuoYI=;
        b=zyZLmbBpG/sIqHYURDBTAeoAULh8aMnhP9W3N137gH+X2SMBrhFxveGXfUUeQut1X9
         jlXCTJTcdpTRYByJSjvwux0cezgfTTSYr/7oBlzgKvf/qipshjnRlPn1N45QsABWe/0y
         5LQGOIzBM0aH40j1ORzi96xAjNzXbDHZohg1kcMwzzzZJe/tT5fn+QuU4T1mMNFP2b8A
         USh8Fa3RiniyFuDvJVBNwTBvpZJgxM1gyBZC0NBk5p7eQMWUWduz+SMFz9XGU+gTK8Rs
         6O0bZrBd0sNUyumWf43gAJj0guSdzfTvLN7LiI2dR7rBt1oOYEfCRAeskDFGPbij7S04
         OK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727428059; x=1728032859;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zV6HJXNQV5T8CuQJ/tUTNkNzYTYxFtQgwRH9nbfuoYI=;
        b=k8dJylsr0oB7pp84YqJQPFssdOBB++oDRyjwzF9Rl1vO9A0oA8xQ5J4gu36o6OuGdw
         hd8zcKt3QUmM+4G3DwpoAbsT13GnLOE2qpHjAiRTEq8YwibeAD76ncx5yUtloAFHhbtQ
         8bUZRIPjwCizixvkrw/KZAS5hqGfRZaRCn2oFojLb8NoVvp6DzSKRb9eHyzKgVFvp5vO
         wNkmnaPegmb0222tf8jvIg1CiiH1ESSnZbAAqhjB89nqheWRT9qxnq4H5oYYGHJOuu6o
         D97cKPNz4gpmLXCbP/PfrvXOP3Lg25ILyjs079ujCzmeaCva8Ork/HyNPDLFf5WORojZ
         SSmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtQdlLxOGSmg6fH7LbzTdK8K/W72aMiezfB6NX3vM2Z7AzzqHii80TN1SqDlqMt/NqlJevA6QW6yrCcrYl3uY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyk+aX7ylk3GOeR8rjL0X2TFyZsW2X3vzhYB/Ntl/D67wNdm6Q8
	E118uYb52ChdeD+c1vcJc15STnBZVG0Hrh0j2V3REgC7FMGkyBbPpBsA5B2gff4=
X-Google-Smtp-Source: AGHT+IFkcv299YnvolWkIC1E1HkuCwx2dv/Up573YO3Yhdrr3UgZ8MGnRH7kuRz896USQfoNddYuEQ==
X-Received: by 2002:a05:6512:b90:b0:52c:9383:4c16 with SMTP id 2adb3069b0e04-5389fc3afc7mr1245883e87.22.1727428058948;
        Fri, 27 Sep 2024 02:07:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5389fd548a4sm237693e87.42.2024.09.27.02.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 02:07:37 -0700 (PDT)
Date: Fri, 27 Sep 2024 12:07:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: heikki.krogerus@linux.intel.com, tzungbi@kernel.org, jthies@google.com, 
	pmalani@chromium.org, akuchynski@google.com, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] platform/chrome: cros_ec_typec: Displayport support
Message-ID: <m3wg4vkohfueeilcqjd6ulmga2xacrr3jhveyhn7d2lnxuqrvs@pwteuldtp5p3>
References: <20240925162513.435177-1-abhishekpandit@chromium.org>
 <20240925092505.6.I142fc0c09df58689b98f0cebf1c5e48b9d4fa800@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925092505.6.I142fc0c09df58689b98f0cebf1c5e48b9d4fa800@changeid>

On Wed, Sep 25, 2024 at 09:25:07AM GMT, Abhishek Pandit-Subedi wrote:
> Add support for entering and exiting displayport alt-mode on systems
> using AP driven alt-mode.
> 
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> ---
> 
>  MAINTAINERS                                   |   5 +-
>  drivers/platform/chrome/Makefile              |   2 +
>  drivers/platform/chrome/cros_ec_typec.c       |  13 +-
>  drivers/platform/chrome/cros_ec_typec.h       |   1 +
>  drivers/platform/chrome/cros_typec_altmode.h  |  34 +++
>  .../platform/chrome/cros_typec_displayport.c  | 247 ++++++++++++++++++
>  6 files changed, 299 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/platform/chrome/cros_typec_altmode.h
>  create mode 100644 drivers/platform/chrome/cros_typec_displayport.c
> 
> diff --git a/drivers/platform/chrome/cros_typec_altmode.h b/drivers/platform/chrome/cros_typec_altmode.h
> new file mode 100644
> index 000000000000..a8b37a18c83a
> --- /dev/null
> +++ b/drivers/platform/chrome/cros_typec_altmode.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __CROS_TYPEC_ALTMODE_H__
> +#define __CROS_TYPEC_ALTMODE_H__
> +
> +struct cros_typec_port;
> +struct typec_altmode;
> +struct typec_altmode_desc;
> +struct typec_displayport_data;
> +
> +#if IS_ENABLED(CONFIG_TYPEC_DP_ALTMODE)
> +struct typec_altmode *
> +cros_typec_register_displayport(struct cros_typec_port *port,
> +				struct typec_altmode_desc *desc,
> +				bool ap_mode_entry);
> +
> +int cros_typec_displayport_status_update(struct typec_altmode *altmode,
> +					 struct typec_displayport_data *data);
> +#else

As pointed out by the robot, the stubs should be 'static inline'

> +struct typec_altmode *
> +cros_typec_register_displayport(struct cros_typec_port *port,
> +				struct typec_altmode_desc *desc,
> +				bool ap_mode_entry)
> +{
> +	return typec_port_register_altmode(port->port, desc);
> +}
> +
> +int cros_typec_displayport_status_update(struct typec_altmode *altmode,
> +					 struct typec_displayport_data *data)
> +{
> +	return 0;
> +}
> +#endif
> +#endif /* __CROS_TYPEC_ALTMODE_H__ */

-- 
With best wishes
Dmitry
