Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9304F3FB1B
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jan 2025 03:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736221220; cv=none; b=tm20GM4cHqWel8pMfY8DDRerfyGFP3xqBOuOJBf0x4xu5xQAg2X8HAWGllzdPWHP4GxYuwa8e2ES2fpmGweI3tjlFHpkDuu3U4lN+C2LuclKPm7MLtFI4foew+83frIRcph9HU31xMk5+I7mHYOXSJqxdhYXQioIY0VMXOKsNEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736221220; c=relaxed/simple;
	bh=eGPy/Nq+10HoOfBNsBgaoVH+NwSO9f4g93K/IN4WRvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aHVV2KBldtBXnVMu0ZBIOsuKGXUOxEpEZCunVbKn9DQq3ZFt9xLzBlkn/Yyw+I5o44zaiKqLV+YDq1tdJaxmiHzt9QaAYMfNBFhGihiqQrlSCPEFzxS1/FE5TyDJLL8PnXfu1awh8aLsDYvsm469mE/4fdsBHvhn+lDDF6SqMX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pa7wfrLS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pa7wfrLS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED651C4CEDE;
	Tue,  7 Jan 2025 03:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736221220;
	bh=eGPy/Nq+10HoOfBNsBgaoVH+NwSO9f4g93K/IN4WRvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pa7wfrLSWwc99jx20SxeEuLXDj2wUNGCXiNtQsHVx9Zq0FJZjlmMzGiViwRrYCwvF
	 p7kpiLxp8pqmoKh+4Tlb4b31uUr9yGrbfF8Z5aWuzSgr6zxHXiARWNr+obtX14jUgn
	 jYh4BH+NSyJ2Dpq8PWhX4eQOBuyJXmOm7vI3ShhWizbaJ4ZBLB5Tco8Omgqh6Y3OGJ
	 SBP9ADhdZemnsKaRmlHkaJ93AWaJU8/mr89LJmStmxAdgtXkuA6rzyio/pSLyM7/et
	 Op2hX00dnzy8zY/yWPQ9kBa7ZXFlYnUBoYLfLqodhUq+/XmeF1KMszh0DNrce/LIgm
	 iA3kXVoLO6srQ==
Date: Tue, 7 Jan 2025 03:40:16 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Gwendal Grignou <gwendal@chromium.org>
Cc: bleung@chromium.org, chrome-platform@lists.linux.dev, dustin@howett.net,
	ben@jubnut.com
Subject: Re: [PATCH v2 2/2] platform/chrome: cros_ec_lpc: Add Support for
 direct EC register memory access
Message-ID: <Z3yiIGWEO4mOOMNP@google.com>
References: <20250106185232.1635556-1-gwendal@chromium.org>
 <20250106185232.1635556-3-gwendal@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106185232.1635556-3-gwendal@chromium.org>

On Mon, Jan 06, 2025 at 10:52:32AM -0800, Gwendal Grignou wrote:
> Add support to access EC memory region HOST command and ACPI memory
> region directly.
> 
> The memory region comes from the CRS ACPI resource descriptor.
> 
> Able to communicate with the EC:
> ```
>  ectool version
> ...
> Build info:    brtk-0.0.0-df0ad93+ 2024-12-13 19:25:55 elmo@396-a1a
> ```

Asked in v1 too: why the build info for `ectool` is important?  Or is it
just an example for communicating with EC?

> Coreboot must exposed the memory region:
> ```
> cat /proc/iomem | grep GOOG0004
>     fe0b0000-fe0bffff : GOOG0004:00
> ```

Asked in v1 too: `grep GOOG0004 /proc/iomem` does the same thing and should
be more concise.  It's fine if you'd like to keep it.

> Can observe the commands flowing between AP and EC.

Could you provide some more context?  Couldn't we see the trace without the
patch?  I guess these (includes above) is just a test scenario.

If I understand the whole series correctly, it tries to support some Realtek
EC which needs to read the memory region info from ACPI instead of the
well-known ones.  If so, the commit message should provide some more context
about the new way for probing.

> @@ -498,29 +555,52 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
[...]
> +	if (adev) {
> +		/*
> +		 * Retrieve the resource information in the CRS register, if available.
> +		 */
> +		status = acpi_walk_resources(adev->handle, METHOD_NAME__CRS,
> +					     cros_ec_lpc_resources, ec_lpc);
> +		if (ACPI_FAILURE(status)) {
> +			dev_err(dev, "failed to get resources\n");
> +			return -ENODEV;
> +		}
> +		if (ec_lpc->mem32.address_length) {
> +			ec_lpc->base = devm_ioremap(dev,
> +						    ec_lpc->mem32.address,
> +						    ec_lpc->mem32.address_length);
> +			if (IS_ERR(ec_lpc->base))
> +				return -EINVAL;

Just realized that ioremap*() doesn't return ERR but NULL.  It should use
`!ec_lpc->base`.
