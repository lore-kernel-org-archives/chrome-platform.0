Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2616E14E2E8
	for <chrome-platform@lists.linux.dev>; Mon, 27 Jan 2025 16:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737994958; cv=none; b=efgXUQm4FA+cuIl4rePn1qWRKO++z599BhgA8II+A9eMAG3j7fC1SXi0YeQ0SOggiqqV5KYS60IiWguUknWOLwwRhjZq1LEVCGm7GDJi1w/blFMocUWeYiGeikirFicPpnbMJ454lqSJv0S/gf9/oHnn5r0ZHNY6gAOFo2/rHuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737994958; c=relaxed/simple;
	bh=mm4rP0iaMTMNq5B3bs4Liuf0T8GiuKwnxmOrmD3OkaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h0q3tuCLG8TLKPn0VXv6kPeN1UkBxc/3i2kh3+Ni00Or7wzEjipHygZSuBBIxUEopF0Q4nJ86EfX9JrToXuG2+AMRoja4a/2qNggBowsZke2yo4iUco/8CuJ1q7vZNtcsve3YdWiHFjKAGgl3HQu5BtPQ0z4EPzxGYz4ukyB4a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fnO3+D4N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fnO3+D4N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61A8BC4CEE4;
	Mon, 27 Jan 2025 16:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737994957;
	bh=mm4rP0iaMTMNq5B3bs4Liuf0T8GiuKwnxmOrmD3OkaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fnO3+D4NaRUbj3uJoVmPud+Pelr/7P5DafrTitUaeFufNMI/RQGNNPACT3x5SFjgq
	 ICc2Drx+r95EPII4fn/55n5oFcbOxGG5XNUJeIJqnzTfR7IJwsXPGINbTZ4Dr6QjnJ
	 FKHHIZezqP+GNJN6VXoTPCaDgao9vC80ZpGfJoqPX6eiZj6RR7onqMPidI6nj2CT8T
	 f/cb4eg8dslY2e+PTphOKUFi1Ka28fv0R97xqTMHwqN7aDv3wQJFoXWKAVWRjhZoeb
	 X8A5kEso4DPR9mKoOJtpUHgOEFlArtz45Q5Y4YzO4cfvfhWKwLBG8lhIeiIwxNGBEP
	 cEiL0d53etKjA==
Date: Tue, 28 Jan 2025 00:22:33 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Daniel Schaefer <dhs@frame.work>
Cc: chrome-platform@lists.linux.dev, linux@frame.work,
	"Dustin L. Howett" <dustin@howett.net>
Subject: Re: [PATCH] chrome/cros_ec_lpc: Match on Framework ACPI device
Message-ID: <Z5eyyUJgdlNRBmAl@tzungbi-laptop>
References: <20250124023021.9418-1-dhs@frame.work>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124023021.9418-1-dhs@frame.work>

On Fri, Jan 24, 2025 at 10:30:21AM +0800, Daniel Schaefer wrote:
> This patch loads the cros_ec_lpc driver based on a Framework FRMWC006
> ACPI device, which mirrors GOOG0004, but also applies npcx quirks for
> Framework systems.

s/This patch loads/Load/.  On a related note, "platform/chrome: cros_ec_lpc:"
is the preferred prefix for the patch.

> Matching on ACPI will let us avoid having to change the SMBIOS match
> rules again and again.

Does it mean the following DMI match is not comprehensive enough and
would need to change again and again?

```
.matches = {
	DMI_MATCH(DMI_SYS_VENDOR, "Framework"),
	DMI_MATCH(DMI_PRODUCT_FAMILY, "Laptop"),
},
.driver_data = (void *)&framework_laptop_npcx_lpc_driver_data,
```

> I tested all new possible combinations and they all behave as expected.
> If there is any match, /dev/cros_ec will be present, with the below
> dmesg.
> I did not test any device with GOOG0004.
> 
> | DMI match | FRMWC004 match | Notes
> | False     | False          | 3rdparty
> | True      | False          | Current framework
> | False     | True           | Possible future framework
> | True      | True           | Future framework
> 
> ```
> > sudo dmesg | grep cros_ec_lpcs
> [   17.521972] cros_ec_lpcs FRMWC004:00: loaded with quirks 00000001
> [   17.534012] cros_ec_lpcs FRMWC004:00: Chrome EC device registered
> ```
> 
> ```
> [   74.366596] cros_ec_lpcs cros_ec_lpcs.0: loaded with quirks 00000001
> [   74.377921] cros_ec_lpcs cros_ec_lpcs.0: Chrome EC device registered
> ```

Just in case if you don't want to include them in the commit messages,
please put them after "---"[1].

[1]: https://docs.kernel.org/process/submitting-patches.html

>  /* True if ACPI device is present */
>  static bool cros_ec_lpc_acpi_device_found;
> +static bool cros_ec_lpc_frmw_acpi_device_found;

I guess it doesn't need the flag.  See below.

> @@ -526,6 +532,8 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
>  	ec_lpc->mmio_memory_base = EC_LPC_ADDR_MEMMAP;
>  
>  	driver_data = platform_get_drvdata(pdev);
> +	if (!driver_data)
> +		driver_data = platform_get_drvdata(&cros_ec_lpc_device);

NACK, it doesn't look like a good idea to me.  It uses `cros_ec_lpc_device`
merely for passing the pointer of struct lpc_driver_data.  It should use
acpi_device_get_match_data() instead.

> @@ -698,6 +706,7 @@ static void cros_ec_lpc_remove(struct platform_device *pdev)
>  
>  static const struct acpi_device_id cros_ec_lpc_acpi_device_ids[] = {
>  	{ ACPI_DRV_NAME, 0 },
> +	{ FRMW_ACPI_DRV_NAME, 0 },

So, if the NCPX is the only valid driver data for FRMW_ACPI_DRV_NAME,
how about `{ FRMW_ACPI_DRV_NAME, &framework_laptop_npcx_lpc_driver_data },`?
As a result, the cros_ec_lpc_probe() can get it via
acpi_device_get_match_data().

>  static int __init cros_ec_lpc_init(void)
>  {
>  	int ret;
>  	const struct dmi_system_id *dmi_match;
>  
>  	cros_ec_lpc_acpi_device_found = !!cros_ec_lpc_get_device(ACPI_DRV_NAME);
> +	cros_ec_lpc_frmw_acpi_device_found = !!cros_ec_lpc_get_device(FRMW_ACPI_DRV_NAME);
>  
>  	dmi_match = dmi_first_match(cros_ec_lpc_dmi_table);
>  
> -	if (!cros_ec_lpc_acpi_device_found && !dmi_match) {
> +	if (cros_ec_lpc_frmw_acpi_device_found) {
> +		platform_set_drvdata(&cros_ec_lpc_device,
> +				(void *)&framework_laptop_npcx_lpc_driver_data);

NACK.  See above comment.
