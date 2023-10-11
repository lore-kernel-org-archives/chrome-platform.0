Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A34354F6
	for <chrome-platform@lists.linux.dev>; Wed, 11 Oct 2023 05:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PJrysrdD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02790C433C7;
	Wed, 11 Oct 2023 05:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697002189;
	bh=skZqT3UKtp7HZNYXne+NJGxNZSRCmklrxrp52lsdMrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PJrysrdD3vPAwMLTHdQtXF8qw6UTyP7MRboPvxyHMjvJTm+bJMptdTiddl/ectquw
	 1LRBc/J66O1qMgQNsjWzdEZEY28zz8zhKzQVnYHe/Fc6wcMjIYpUTDMy1ZpbIO8qAR
	 81/GDyUOPWiipw/h0KLqrY+pVkMwFRHnq+SE6G1tbbQGqZ0K6wASbkhWE9mtc6cgL/
	 G6HzhSJQgagMYZsjLD1gyjXNbtNVW8RUCOoyfvsmSIAbVvRX6QZAwNcxPV+NJPQOVL
	 pYHDNWe/uLrGrNIo2qXpLZHhp3lPIOSmA3tn/tnrnYM0CgtuX6qEolh9wq88wyqJ6x
	 cVFQm+EeWJywg==
Date: Wed, 11 Oct 2023 13:29:45 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: "Dustin L. Howett" <dustin@howett.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, Kieran Levin <ktl@frame.work>,
	Mario Limonciello <Mario.Limonciello@amd.com>
Subject: Re: [PATCH v1 2/4] cros_ec_lpc: pass driver_data from DMI down to
 the device
Message-ID: <ZSYyyQDsHr5VfEew@google.com>
References: <20231005160701.19987-1-dustin@howett.net>
 <20231005160701.19987-4-dustin@howett.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005160701.19987-4-dustin@howett.net>

On Thu, Oct 05, 2023 at 11:07:00AM -0500, Dustin L. Howett wrote:
> @@ -615,14 +615,17 @@ static int __init cros_ec_lpc_init(void)
>  {
>  	int ret;
>  	acpi_status status;
> +	const struct dmi_system_id *dmi_match;
>  
>  	status = acpi_get_devices(ACPI_DRV_NAME, cros_ec_lpc_parse_device,
>  				  &cros_ec_lpc_acpi_device_found, NULL);
>  	if (ACPI_FAILURE(status))
>  		pr_warn(DRV_NAME ": Looking for %s failed\n", ACPI_DRV_NAME);
>  
> +	dmi_match = dmi_first_match(cros_ec_lpc_dmi_table);
> +
>  	if (!cros_ec_lpc_acpi_device_found &&
> -	    !dmi_check_system(cros_ec_lpc_dmi_table)) {
> +	    !dmi_match) {

The `!dmi_match` then can join to previous line.
