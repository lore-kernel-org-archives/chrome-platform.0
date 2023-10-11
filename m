Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F145D354F6
	for <chrome-platform@lists.linux.dev>; Wed, 11 Oct 2023 05:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QypSIes6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61C50C433C7;
	Wed, 11 Oct 2023 05:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697002232;
	bh=5Z/ugVxZNFjeNmDN+6fQgQvyp7aiPUUD5JAodyyLHKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QypSIes6N53Vhg/l20qYTNlVNYow/PFI53iry1rW6Oo2E6s/dIZyMZmKNjZoiN0Hv
	 iepjdlphyv2QChNgR2upLvFkoWtSC8RoJLZ1NgpL0bdEhXUZ9dvjI7/u1iqNDxpeLW
	 I7eKd8/x4SWWN6VoBWIsyKzpP6Qcv8NCTqnlYOxYnlZQnZOMcxlpB72SGha8aO2rkd
	 277gQVaiFigpml/+AGonziASeb7RkAbydOdPv2z5I+gFXBQd+NEQaHrOfW2IoHvsVK
	 FWnho7rpRhq7BBIzcbYBcz7GP5c+mihmiNAT/yI9bWtPXFs4wEsDa74Zz6p1aif0z4
	 06LfTapu0JhyQ==
Date: Wed, 11 Oct 2023 13:30:29 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: "Dustin L. Howett" <dustin@howett.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, Kieran Levin <ktl@frame.work>,
	Mario Limonciello <Mario.Limonciello@amd.com>
Subject: Re: [PATCH v1 3/4] cros_ec_lpc: add a quirks system, and propagate
 quirks from DMI
Message-ID: <ZSYy9UlN4TWIGAT6@google.com>
References: <20231005160701.19987-1-dustin@howett.net>
 <20231005160701.19987-5-dustin@howett.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005160701.19987-5-dustin@howett.net>

On Thu, Oct 05, 2023 at 11:07:01AM -0500, Dustin L. Howett wrote:
> - CROS_EC_LPC_QUIRK_SHORT_HOSTCMD_RESERVATION: only attempt to reserve
>   0xff (rather than 0x100) I/O ports for the host command region

What if it still reserves 0x100 I/O ports for these deivces?

> @@ -34,6 +34,27 @@
>  /* True if ACPI device is present */
>  static bool cros_ec_lpc_acpi_device_found;
>  
> +/* If this quirk is enabled, the driver will only reserve 0xFF I/O ports
> + * (rather than 0x100) for the host command mapped memory region.
> + */
[...]
> +/* If this quirk is enabled, lpc_driver_data.quirk_mmio_memory_base will be used
> + * as the base port for EC mapped memory.
> + */

See https://www.kernel.org/doc/html/latest/process/coding-style.html#commenting

> @@ -363,14 +384,32 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
>  	acpi_status status;
>  	struct cros_ec_device *ec_dev;
>  	struct cros_ec_lpc *ec_lpc;
> +	struct lpc_driver_data *driver_data;
> +	int region1_size;
>  	u8 buf[2] = {};
>  	int irq, ret;
> +	u32 quirks = 0;
>  
>  	ec_lpc = devm_kzalloc(dev, sizeof(*ec_lpc), GFP_KERNEL);
>  	if (!ec_lpc)
>  		return -ENOMEM;
>  
>  	ec_lpc->mmio_memory_base = EC_LPC_ADDR_MEMMAP;
> +	region1_size = EC_HOST_CMD_REGION_SIZE;

`quirks` doesn't need to initialize; or move it to a more limited scope.
Instead, `region1_size` can just initialize to EC_HOST_CMD_REGION_SIZE.
