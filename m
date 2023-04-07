Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32BE621
	for <chrome-platform@lists.linux.dev>; Fri,  7 Apr 2023 02:33:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E59AC433EF;
	Fri,  7 Apr 2023 02:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680834830;
	bh=3rM6oeJbrkuiKmQOERi1z5vHxAPes5n8PBDrEeL3XjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EmuIQG+6jC36yrygIPsYPvQg/r9sf/Eec0s6+QZ0CuDqctd1XK183FTlcUQuMVJko
	 fsx5WTLVlOPVahbYySXagZ/d+C2fkNsdnVG9RDWbcGDdHFcGD5t5ZFSrhTlRALupNH
	 t40dwNPdRHePxt4QHa1vL2tI96lS9reiSCoQh4crjOdXtVOgOQ2LA0qQMMvma5lV8C
	 sRc1B0I6Ot0KcNXUVH00WAy9Kji3CMfU5Ta9vg5wnnaq02di9+8MFrV82WtBP+sb8o
	 a8oXJwNs2ngb+l3wcZ4kDbMETIguSBLYqLXbash0Md0YBg+KiToxeBdeeZm8/Ne2yY
	 lbOmDqlz/iE5Q==
Date: Fri, 7 Apr 2023 10:33:47 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Rob Barnes <robbarnes@google.com>
Cc: chrome-platform@lists.linux.dev, dnojiri@chromium.org,
	groweck@chromium.org, gwendal@chromium.org
Subject: Re: [PATCH] platform/chrome: cros_ec: Separate logic for getting
 panic info
Message-ID: <ZC+BC062FGL5ylMb@google.com>
References: <20230406095423.1.I8e3c16fbecd17956b0a44fc486a8ede3ddb13eec@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230406095423.1.I8e3c16fbecd17956b0a44fc486a8ede3ddb13eec@changeid>

On Thu, Apr 06, 2023 at 04:14:14PM +0000, Rob Barnes wrote:
> -static int cros_ec_create_panicinfo(struct cros_ec_debugfs *debug_info)
> +/**
> + * Returns the size of the panicinfo data fetched from the EC
> + */
> +static int cros_ec_get_panicinfo(struct cros_ec_device *ec_dev, uint8_t *data,
> +				 int data_size)
>  {
> -	struct cros_ec_device *ec_dev = debug_info->ec->ec_dev;
> -	int ret;
> +	int ret = 0;

`ret` doesn't need to be initialized.  It will be overridden soon anyway.

> -	insize = ec_dev->max_response;
> +	if (!data || data_size <= 0)
> +		return -EINVAL;

How about `data_size > ec_dev->max_response`?

> -	msg = devm_kzalloc(debug_info->ec->dev,
> -			sizeof(*msg) + insize, GFP_KERNEL);
> +	msg = devm_kzalloc(ec_dev->dev, sizeof(*msg) + data_size, GFP_KERNEL);

In the case, it doesn't have to be devm anymore.

>  	ret = cros_ec_cmd_xfer_status(ec_dev, msg);
> +
> +	if (ret < 0)
> +		goto free;

If possible, please remove the extra blank line to make them look as a whole.

> +free:
> +	devm_kfree(ec_dev->dev, msg);

Given that the function controls the memory's lifecycle, it doesn't have to
be devm.

> +static int cros_ec_create_panicinfo(struct cros_ec_debugfs *debug_info)
> +{
> +	struct cros_ec_device *ec_dev = debug_info->ec->ec_dev;
[...]
> +	ret = cros_ec_get_panicinfo(ec_dev, data, ec_dev->max_response);
> +
>  	if (ret < 0) {
>  		ret = 0;
>  		goto free;

Ditto, please remove the extra blank line if possible.
