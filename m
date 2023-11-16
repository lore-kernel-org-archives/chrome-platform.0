Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C071530F91
	for <chrome-platform@lists.linux.dev>; Thu, 16 Nov 2023 23:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="HbqLQP+u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1700176632;
	bh=tn2YxFzqwCbtJDuuyn3bG2oSjmS/fkqMKKmyw9hErLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HbqLQP+ueOwjBU44EHztHVav6zEH3fDj+VhB6h2B5vOvhwdLCPcMVFYhLd8QYfyE2
	 U4hIoxVQPc7ByNvnbKHtLUpzWIw7JQkwnmAP2RyQfZA9s+MKzqCvmI8W1t5T4RiJ3j
	 HSa5Pm/ptkfAqbxx4pv2l1uUnSddPuvEuZTEhcNQ=
Date: Fri, 17 Nov 2023 00:17:12 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: "Dustin L. Howett" <dustin@howett.net>
Cc: Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, Kieran Levin <ktl@frame.work>, 
	Mario Limonciello <Mario.Limonciello@amd.com>
Subject: Re: [PATCH v1 3/4] cros_ec_lpc: add a quirks system, and propagate
 quirks from DMI
Message-ID: <0434b79a-b774-494c-91b3-c04d927dcf63@t-8ch.de>
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

On 2023-10-05 11:07:01-0500, Dustin L. Howett wrote:
> Some devices ship a ChromeOS EC in a non-standard configuration; quirks
> allow cros_ec_lpc to account for these non-standard configurations.
> 
> It supports the following quirks:
> - CROS_EC_LPC_QUIRK_REMAP_MEMORY: use a different port I/O base for
>   MMIO to the EC's memory region
> - CROS_EC_LPC_QUIRK_SHORT_HOSTCMD_RESERVATION: only attempt to reserve
>   0xff (rather than 0x100) I/O ports for the host command region
> 
> Signed-off-by: Dustin L. Howett <dustin@howett.net>

[..]

> +
> +	driver_data = platform_get_drvdata(pdev);
> +	if (driver_data) {
> +		quirks = driver_data->quirks;
> +
> +		if (quirks)
> +			dev_warn(dev, "loaded with quirks %8.08x\n", quirks);

dev_warn() is too loud.

[..]
