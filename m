Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822822D600
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jan 2025 07:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736147209; cv=none; b=toPe7WF9onSUf1k44qj2YtdGb3U/lUta7Hg/s5Cims66DPhWcJKWW2FcOGH0YARgbbA7dXoikatMn/oGCPJ/bu625rW83+TMlg/6wf58vee+GbnYor3aGSvf6/MXHTGK4OHXcRCC7gtPrM2t2lURHxxAoozHRemszBPcqzP49YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736147209; c=relaxed/simple;
	bh=GUbg4aHLMsWYLz+V2S0cTUSrElvUz3q0QODYrjL3220=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KL6qAi0+a6pS3Vsx3NLkJW9eDcPqTMke98gLU5Sxa03JBxCEpuptFXPDnl+7PzJm3fzF8d56jqQMNgyYZCg/ydLvZaIGYY+1+Bzsbf/kh5oDCjr7afjceG6ZcjQYAD9w9ZwJ9puaahlduN1keLgesbXBxllMKQ7yRcYni6JvhF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qy1Mmtmi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qy1Mmtmi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2CECC4CED6;
	Mon,  6 Jan 2025 07:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736147209;
	bh=GUbg4aHLMsWYLz+V2S0cTUSrElvUz3q0QODYrjL3220=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qy1MmtmiBPY9w9So0482Q3UcMpRTnlayO5wpMEIa9Hw8iZGMTcwQUrsLy5KYnr+3g
	 jhiTxaVVWn5RyQRfFIGRt/iQ63RUz7JoE7wSjkl7uvWgmXx4nfsh2OV7v3AF1Tn6Mb
	 /gszSxZaeC8OcMzLzEF/uH5hFw7lJ56feM3nf34j8nD04aXn2ltxrazvfuvmXPsgSv
	 +b7hKkMJ9oQb/4L0eg63VFG60CgGHGCnQ+xYObIJH06OPjYZ6UmmVNtcN0zGATUC+m
	 g9m4YsagdFYy8aDwCXIzb2QChkzJBn+U3Ct/1dYlvNTKKoFi2ie8Yw9HtIJE4TEl27
	 MOGeMaWOGDd0A==
Date: Mon, 6 Jan 2025 07:06:45 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Gwendal Grignou <gwendal@chromium.org>
Cc: bleung@chromium.org, chrome-platform@lists.linux.dev, dustin@howett.net,
	ben@jubnut.com
Subject: Re: [PATCH 2/2] platform/chrome: Add Support for direct EC register
 memory access
Message-ID: <Z3uBBRFHixsNjG2e@google.com>
References: <20250103001950.2868856-1-gwendal@chromium.org>
 <20250103001950.2868856-3-gwendal@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103001950.2868856-3-gwendal@chromium.org>

On Thu, Jan 02, 2025 at 04:19:50PM -0800, Gwendal Grignou wrote:
> Able to communicate with the EC:
> ```
>  ectool version
> ...
> Build info:    brtk-0.0.0-df0ad93+ 2024-12-13 19:25:55 elmo@396-a1a
> ```

Not sure if I understand: does it originally intend to show EC firmware
version (i.e. "RW version:")?

> Coreboot must exposed the memory region:
> ```
> cat /proc/iomem | grep GOOG0004
>     fe0b0000-fe0bffff : GOOG0004:00
> ```

`grep GOOG0004 /proc/iomem`.

> Can observe the commands flowing between AP and EC:
> cd /sys/kernel/debug/tracing
> echo 1 > events/cros_ec/enable
> echo 1 > tracing_on
> cat trace_pipe
>      kworker/7:0-51      [007] .....   188.619393: cros_ec_request_start: version: 0, offset: 0, command: EC_CMD_CONSOLE_SNAPSHOT, outsize: 0, insize: 0
>      kworker/7:0-51      [007] .....   188.625656: cros_ec_request_done: version: 0, offset: 0, command: EC_CMD_CONSOLE_SNAPSHOT, outsize: 0, insize: 0, ec result: EC_RES_SUCCESS, retval: 0
>      kworker/7:0-51      [007] .....   188.625663: cros_ec_request_start: version: 1, offset: 0, command: EC_CMD_CONSOLE_READ, outsize: 1, insize: 248
>      kworker/7:0-51      [007] .....   188.635119: cros_ec_request_done: version: 1, offset: 0, command: EC_CMD_CONSOLE_READ, outsize: 1, insize: 248, ec result: EC_RES_SUCCESS, retval: 147
>      kworker/7:0-51      [007] .....   188.635130: cros_ec_request_start: version: 1, offset: 0, command: EC_CMD_CONSOLE_READ, outsize: 1, insize: 248
>      kworker/7:0-51      [007] .....   188.642764: cros_ec_request_done: version: 1, offset: 0, command: EC_CMD_CONSOLE_READ, outsize: 1, insize: 248, ec result: EC_RES_SUCCESS, retval: 0
>      timberslide-3755    [005] .....   188.643039: cros_ec_request_start: version: 0, offset: 0, command: EC_CMD_GET_UPTIME_INFO, outsize: 0, insize: 44
>      timberslide-3755    [006] .....   188.650876: cros_ec_request_done: version: 0, offset: 0, command: EC_CMD_GET_UPTIME_INFO, outsize: 0, insize: 44, ec result: EC_RES_SUCCESS, retval: 44
>      timberslide-3755    [006] .....   188.650912: cros_ec_request_start: version: 0, offset: 0, command: EC_CMD_GET_UPTIME_INFO, outsize: 0, insize: 44
>      timberslide-3755    [006] .....   188.657907: cros_ec_request_done: version: 0, offset: 0, command: EC_CMD_GET_UPTIME_INFO, outsize: 0, insize: 44, ec result: EC_RES_SUCCESS, retval: 44
>      kworker/7:0-51      [007] .....   198.858864: cros_ec_request_start: version: 0, offset: 0, command: EC_CMD_CONSOLE_SNAPSHOT, outsize: 0, insize: 0
>      kworker/7:0-51      [007] .....   198.866866: cros_ec_request_done: version: 0, offset: 0, command: EC_CMD_CONSOLE_SNAPSHOT, outsize: 0, insize: 0, ec result: EC_RES_SUCCESS, retval: 0
>      kworker/7:0-51      [007] .....   198.866882: cros_ec_request_start: version: 1, offset: 0, command: EC_CMD_CONSOLE_READ, outsize: 1, insize: 248
>      kworker/7:0-51      [007] .....   198.874414: cros_ec_request_done: version: 1, offset: 0, command: EC_CMD_CONSOLE_READ, outsize: 1, insize: 248, ec result: EC_RES_SUCCESS, retval: 0

Can't it observe the trace before applying the patch?  I failed to
connect the trace and the direct memory accesses.


On a related note, the patch should use prefix "cros_ec_lpc" too.

> +static int cros_ec_lpc_direct_read(struct cros_ec_lpc *ec_lpc, unsigned int offset,
> +				   unsigned int length, u8 *dest)
> +{
[...]
> +	// Check range

To be consitent to the rest of code, don't use C99 comment style.  Or just
drop it as the intent is clear.

> +static int cros_ec_lpc_direct_write(struct cros_ec_lpc *ec_lpc, unsigned int offset,
> +				    unsigned int length, const u8 *msg)
> +{
[...]
> +	// Check range

Same here.

> +static acpi_status cros_ec_lpc_resources(struct acpi_resource *res, void *data)
> +{
> +	struct cros_ec_lpc *ec_lpc = data;
> +
> +	switch (res->type) {
> +	case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
> +		ec_lpc->mem32 = res->data.fixed_memory32;
> +		break;
> +	case ACPI_RESOURCE_TYPE_EXTENDED_IRQ:
> +		/* Ignored, using a more generic way to find IRQ. */
> +	case ACPI_RESOURCE_TYPE_END_TAG:

If nothing to do (or comment) in the case, could it drop the case?

> @@ -498,29 +560,52 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
[...]
> +		if (ec_lpc->mem32.address_length) {
> +			ec_lpc->base = devm_ioremap(dev,
> +						    ec_lpc->mem32.address,
> +						    ec_lpc->mem32.address_length);
> +			if (IS_ERR(ec_lpc->base))
> +				return AE_ERROR;

`PTR_ERR(...)`?
