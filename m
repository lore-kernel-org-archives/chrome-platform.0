Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B09B23D1
	for <chrome-platform@lists.linux.dev>; Mon, 27 Nov 2023 03:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K+sDRcKV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6825AC433C8;
	Mon, 27 Nov 2023 03:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701055861;
	bh=WzXmY2vCZ4ZoRECVXBKvYCx3dk6opBjVYPb/k16BYJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K+sDRcKV0I/NKDmq8aY9CeBKf2PZUEbWNF4qsCc6IQU+x9brTkDcX3T6CdVZgaxiJ
	 oZZcheOw+8DNk3wzIubFkfy2DxJxqqWzoKlq2rpgcDVefL+m4iXWugSx7kD0aYnmmp
	 L0fuCPkz6C7GGBJDr0GpDIANpyfW4x7JG5HeZjM7EaQJMSExhwEyycSbFnxkUIs464
	 e0kOSL/VnqWC2dosCiT+2kQu5u31OKApSe7B1qCpL3RYogyLCk9NnLjF3CyKGMA6jz
	 kCgHo1Xk+3DN1ZcvBXZxqJg/nJ4oymkuPP7lVFLvAiWRoTNU7xEDJOIpFXkGU/ZnTx
	 gzKhAFKwoF23g==
Date: Mon, 27 Nov 2023 11:30:58 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: "Dustin L. Howett" <dustin@howett.net>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev
Subject: Re: [PATCH v2 3/4] platform/chrome: cros_ec_lpc: add a "quirks"
 system
Message-ID: <ZWQNcgf5dFkPikH2@google.com>
References: <20231005160701.19987-1-dustin@howett.net>
 <20231126192452.97824-1-dustin@howett.net>
 <20231126192452.97824-4-dustin@howett.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231126192452.97824-4-dustin@howett.net>

On Sun, Nov 26, 2023 at 01:24:51PM -0600, Dustin L. Howett wrote:
> @@ -363,8 +386,11 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
>  	acpi_status status;
>  	struct cros_ec_device *ec_dev;
>  	struct cros_ec_lpc *ec_lpc;
> +	struct lpc_driver_data *driver_data;
> +	int region1_size = EC_HOST_CMD_REGION_SIZE;
>  	u8 buf[2] = {};
>  	int irq, ret;
> +	u32 quirks = 0;
>  
>  	ec_lpc = devm_kzalloc(dev, sizeof(*ec_lpc), GFP_KERNEL);
>  	if (!ec_lpc)
> @@ -372,6 +398,20 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
>  
>  	ec_lpc->mmio_memory_base = EC_LPC_ADDR_MEMMAP;
>  
> +	driver_data = platform_get_drvdata(pdev);
> +	if (driver_data) {
> +		quirks = driver_data->quirks;
> +

From readability's perspective:
If seeing a variable is initialized, the code reader would expect: "there must
be some reasons" (at least for me).  For the case, I think the reason is
unobvious.
