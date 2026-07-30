Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED28636212E
	for <chrome-platform@lists.linux.dev>; Thu, 30 Jul 2026 03:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785382374; cv=none; b=SKbfjAunI5FnMRoeYP92tiFn8rKaUmOViBJw2xV0kDB3j193CaTYL9oCUHpS+p5eiuBZBGab0CWhHu8SWXSWNiCWQ1IzHig+HvkEJnEBLCR3Y+D917LyIAqy/YcLdkURPV8DYind5WPYe4JtMOtiAYEmx/8lGk53cIehzBZde2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785382374; c=relaxed/simple;
	bh=sUjxahiJCowomeCIYbkuXRmwZs0NHyPUvz525ndNpPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e7QMydsSoA5/vvQ3o051ROXUTZRjMhsG9ggOb2mxFBkgIEVKCyexoG313KduMK5XURk7e4jN17H2ZfB2pol0txW7bWC7YJrLYo9mcuXKOV/3OOf7pET9aO3Ep4crMO1+PP1P8Dx/mUeuZCRwrcvY91En1ZxzOwsyBv8jhsDnTe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mZWF/nYD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZWF/nYD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D41401F000E9;
	Thu, 30 Jul 2026 03:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785382372;
	bh=P41rP7hZckr1WiAIyhqEQUTpbqMzNb1r7AKQSSdMoFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mZWF/nYDclwqrLfA7B+PgTVflNxfuNG6WF9JiF2FPse6dH+SSViukdjF/GdcS0zRg
	 b7lL6AnM/MxXtT46tjsLQr3eFn7y/bAGoJwBtK+DWeOe2hc4cCu/wu2bfPoOgrIY2u
	 f93DJ8v1RXZMCeF6RKvNCxWVxecPsRODUtgBPeGsO0BkGj0JO7ugiQ4z3zgBiv7RDG
	 NnnffgqwPt1EC2nfqKBvU69+WwydPmD5EVZyjH50IBlmjiIVECBrZiRCd9oqWN6Mql
	 A7ZLGMCtBjiJHw4CKskLjOjij5KgqlAbJuB3yZJmsmPIaRLunQmM+2GFftEinse3r4
	 27lJWEBSiLzGw==
Date: Thu, 30 Jul 2026 03:32:49 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Alexis Savery <asavery@google.com>
Cc: chrome-platform@lists.linux.dev
Subject: Re: [PATCH v3] platform/chrome: lightbar: Limit payload size to EC
 packet limit
Message-ID: <amrF4dQ8TjxOZGMf@google.com>
References: <20260729221459.1006-1-asavery@google.com>
 <20260730005956.559287-1-asavery@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730005956.559287-1-asavery@google.com>

On Wed, Jul 29, 2026 at 05:59:56PM -0700, Alexis Savery wrote:
> The LIGHTBAR_CMD_SET_PROGRAM_EX command encapsulates its payload data
> with an 8-bit size field `uint8_t size` and is natively capped by the V3

The u8 size field can't wrap or contain the payload itself.  To be more
technically accurate, please rephrase "encapsulates".

> packet bounds limit array `EC_LPC_HOST_PACKET_SIZE`. However, the driver
> currently allows the payload chunk to bypass this protocol limit if the
> SPI transmission layer negotiates a larger physical `max_request`.

EC_LPC_HOST_PACKET_SIZE is only for LPC.  Protocol SPI uses another value
(e.g., SPI_MAX_REQUEST_SIZE).

> @@ -496,9 +496,14 @@ static ssize_t program_store(struct device *dev, struct device_attribute *attr,
>  			return -EINVAL;
>  		}
>  	} else {
> +		/*
> +		 * The EC limits all version 3 host packets to EC_LPC_HOST_PACKET_SIZE.
> +		 */
>  		extra_bytes = offsetof(typeof(*param), set_program_ex) +
>  			sizeof(param->set_program_ex);
> -		max_size = ec->ec_dev->max_request - extra_bytes;
> +		max_size = min_t(size_t, ec->ec_dev->max_request,
> +				 EC_LPC_HOST_PACKET_SIZE);
> +		max_size -= extra_bytes;

How about:

    max_size = min(ec->ec_dev->max_request - extra_bytes,
                   sizeof(param->set_program_ex.size));
