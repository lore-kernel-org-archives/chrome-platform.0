Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137CDEA2
	for <chrome-platform@lists.linux.dev>; Wed, 25 Oct 2023 00:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rc0Stsvd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50297C433C7;
	Wed, 25 Oct 2023 00:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698193428;
	bh=OOSuxQm14WNxh8bzblwazb72+Ue/BHDl6bfJlSn+a9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rc0Stsvdmt6kheDfreXEeFxLVlzWJQWcB2vlMD4Dp02l0x0iYORV7WIctKw8B/LZl
	 BxaLN8o4Cbml57dnciL8E3ar5DWH1n7i8PqZJy4QOqpCOL9TtkUtB8pHYsGu+4JWk3
	 NKAe4laxAuscY7eEjKLwz6RatJv+343h/EWf5rbxl/uZep0lq6l+t5WDRti0alsyBS
	 wSCpZYAH38pMeCnRknhrI9xB9ciHaknbVsSdxOC3pVt0BRIizq6/y9fJN8ebgqjmTx
	 ggzqXm03iSrSIk7ZPLpSPa9R2BRDeRJvUQ/GU6JE2B9hd4PzvaLTc46tM5NHTVUw8F
	 4DXnFafl/rh7Q==
Date: Wed, 25 Oct 2023 08:23:45 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Lalith Rajendran <lalithkraj@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Raul E Rangel <rrangel@chromium.org>,
	Tim Van Patten <timvp@chromium.org>,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v3] platform/chrome: cros_ec_lpc: Separate host command
 and irq disable
Message-ID: <ZThgEdJuxTmucKIe@google.com>
References: <20231024105820.v3.1.Icccaed152371dbab868295a6c83d257e8409cf2d@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024105820.v3.1.Icccaed152371dbab868295a6c83d257e8409cf2d@changeid>

On Tue, Oct 24, 2023 at 10:58:21AM -0500, Lalith Rajendran wrote:
> +/**
> + * cros_ec_suspend_prepare() - Handle a suspend prepare operation for the ChromeOS EC device.
> + * @ec_dev: Device to suspend.
> + *
> + * This can be called by drivers to handle a suspend prepare stage of suspend.
> + *
> + * Return: 0 on success or negative error code.

Please update accordingly to reflect the fact.

> +/**
> + * cros_ec_suspend_late() - Handle a suspend late operation for the ChromeOS EC device.
> + * @ec_dev: Device to suspend.
> + *
> + * This can be called by drivers to handle a suspend late stage of suspend.
> + *
> + * Return: 0 on success or negative error code.

Ditto.

> + */
> +int cros_ec_suspend_late(struct cros_ec_device *ec_dev)
> +{
> +	cros_ec_disable_irq(ec_dev);
> +	return 0;
> +}
> +EXPORT_SYMBOL(cros_ec_suspend_late);
>  
> +/**
> + * cros_ec_suspend() - Handle a suspend operation for the ChromeOS EC device.
> + * @ec_dev: Device to suspend.
> + *
> + * This can be called by drivers to handle a suspend event.
> + *
> + * Return: 0 on success or negative error code.

Ditto.

> +/**
> + * cros_ec_resume_early() - Handle a resume early operation for the ChromeOS EC device.
> + * @ec_dev: Device to resume.
> + *
> + * This can be called by drivers to handle a resume early stage of resume.
> + *
> + * Return: 0 on success or negative error code.

Ditto.

> + */
> +int cros_ec_resume_early(struct cros_ec_device *ec_dev)
> +{
> +	cros_ec_enable_irq(ec_dev);
> +	return 0;
> +}
> +EXPORT_SYMBOL(cros_ec_resume_early);
>  
> +/**
> + * cros_ec_resume() - Handle a resume operation for the ChromeOS EC device.
> + * @ec_dev: Device to resume.
> + *
> + * This can be called by drivers to handle a resume event.
> + *
> + * Return: 0 on success or negative error code.

Ditto.
