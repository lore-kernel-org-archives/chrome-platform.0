Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AC426CE2C
	for <chrome-platform@lists.linux.dev>; Wed, 28 Jan 2026 05:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769577013; cv=none; b=VS25LueqYWjT6GdsuPiHOFMuYzGAmKyF8+eBn6RGbs2vaSsgM6ijDn4tIpyLkywTs3mivFHjkb3/wMLLZ8XmD5RDHpT5V6EbpXsEpkYvh1Dq6FZKKPvYLmVNZuqlaoy4xZ8hDYF4lTTaHg6qY3Eda4n3jf3zAXa69M2M3RKGgAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769577013; c=relaxed/simple;
	bh=X0o+rDnrLi0hmxiIdjq8OqvXynQVdy4kiYFZSyVvoWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HKsjsY9OoE74/KLKV8ug51iTTzuTWn4z+HezP7x874LAsQ5RyqG/MFSlXtqKDMQIDlJZ9azJNZ2VIhvKbsD2eamaUvxv03KoqjmSRhWnvh+DP1bHJhbwHxDJ5Tr62nIz6PZeT0wororeWD/GQORBshkLlOQ6Z2fb4k8P4ijGCTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SBNvTMMT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SBNvTMMT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E4F4C4CEF1;
	Wed, 28 Jan 2026 05:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769577012;
	bh=X0o+rDnrLi0hmxiIdjq8OqvXynQVdy4kiYFZSyVvoWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SBNvTMMTfWp4hcboy8RRkqvGMb6UpQEeJSJ7xMzf/Rbh4wQ1MegY+Qn1nfq9c9+15
	 It5zbYCxNZPpyMZFxCNO5nxYg6uqp5CsOnHcsf+vebnTr2CRxScvDbkH1yhHGA3Ixz
	 vporbcRRlakdzvWIu0NtFSKktgZ2jEfwuI4ot3ush0cB/iOGfjJpNxrivqtcsheAxk
	 eSkQSo0MXOvzA7JEpFY8nzJ3fWnOwvNNy4aBO0hAoyxTp29aQc98/2YH0HXLjprXdo
	 6noITkl4yYvTiP+2738qdxR29dBlCRHgiM1SXgJvAEiMfYoYVUlnSYHMcS3a/KERgK
	 i3RD9uPYUxPFA==
Date: Wed, 28 Jan 2026 05:10:10 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Gwendal Grignou <gwendal@chromium.org>
Cc: chrome-platform@lists.linux.dev, Gwendal Grignou <gwendal@google.com>
Subject: Re: [PATCH v3 2/2] platform: chrome: lightbar: Add support for large
 sequence
Message-ID: <aXmaMhDv5YqVT58s@google.com>
References: <20260128030259.1703848-1-gwendal@google.com>
 <20260128030259.1703848-2-gwendal@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128030259.1703848-2-gwendal@google.com>

On Tue, Jan 27, 2026 at 07:02:59PM -0800, Gwendal Grignou wrote:
> @@ -475,14 +483,22 @@ static ssize_t program_store(struct device *dev, struct device_attribute *attr,
>  	 * and send a program that is too big for the protocol. In order
>  	 * to ensure the latter, we also need to ensure we have extra bytes
>  	 * to represent the rest of the packet.
> +	 * With V3, larger program can be sent, limited only by the EC.
> +	 * Only the protocol limit the payload size.
>  	 */
> -	extra_bytes = sizeof(*param) - sizeof(param->set_program.data);
> -	max_size = min(EC_LB_PROG_LEN, ec->ec_dev->max_request - extra_bytes);
> -	if (count > max_size) {
> -		dev_err(dev, "Program is %u bytes, too long to send (max: %u)",
> -			(unsigned int)count, max_size);
> -
> -		return -EINVAL;
> +	if (lb_version < 3) {
> +		extra_bytes = sizeof(*param) - sizeof(param->set_program.data);
> +		max_size = min(EC_LB_PROG_LEN, ec->ec_dev->max_request - extra_bytes);
> +		if (count > max_size) {
> +			dev_err(dev, "Program is %zu bytes, too long to send (max: %zu)",
> +				count, max_size);
> +
> +			return -EINVAL;
> +		}
> +	} else {
> +		extra_bytes = sizeof(*param) - sizeof(param->set_program) +
> +			sizeof(param->set_program_ex);
> +		max_size = ec->ec_dev->max_request - extra_bytes;

Not sure if you read comments from v1 [1].  I still think the calculation of
`extra_bytes` is tricky.

[1] https://lore.kernel.org/chrome-platform/aXhWlV6SyaAAum-Q@google.com/

> diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
> index 9cbf024f56c3..144243143034 100644
> --- a/include/linux/platform_data/cros_ec_commands.h
> +++ b/include/linux/platform_data/cros_ec_commands.h
> @@ -2020,6 +2020,17 @@ struct lightbar_program {
>  	uint8_t data[EC_LB_PROG_LEN];
>  } __ec_todo_unpacked;
>  
> +/*
> + * Lightbar program for large sequences. Sequences are sent in pieces, with
> + * increasing offset. The sequences are still limited by the amount reserved in
> + * EC RAM.
> + */
> +struct lightbar_program_ex {
> +	uint16_t offset;
> +	uint8_t size;
> +	uint8_t data[0];
> +} __ec_todo_unpacked;

Not sure if you read comments from v1 [1].  Please use flexible array member
(i.e., []) and evaluate if it needs any flexible array helpers.
