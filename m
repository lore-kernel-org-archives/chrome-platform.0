Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6123225397
	for <chrome-platform@lists.linux.dev>; Mon, 26 Jan 2026 07:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769411652; cv=none; b=oFe4oHeS03H8AgrIk3fiVRyNn71KXNOBhodWiFCrKoumO31o157k2nIxAOog9znR/Nrv4bUTJ3xTkf20MFouWbxtBWkM/P/5KHKF9LYgyAXox1VH4ZS/hYcAXWuAjllZM94vyqhm+H/QBiHQlxPZzIFKMc9W9wBpniJWuZ1Pv74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769411652; c=relaxed/simple;
	bh=eTefAZLgZJmt1hhEmgPo5oGxieSt/G+ppCOTIzETqsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tP+xG3io37c6YaPManGTKDknf4uDdWAxbd/nR+PEuvJwvNKb+zNP1Bw4xsD6hHM1lhSO2N0FPKkhP41p8g3Vk/4NlL7VIVVARGTc62vitsOMkClF/OtK1t419TqnNzqdPaxgBuqrdKRBV9C5XUH91spz8ZoiNUCdFl3amiwh3tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=moPaNU+j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="moPaNU+j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9038C116C6;
	Mon, 26 Jan 2026 07:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769411652;
	bh=eTefAZLgZJmt1hhEmgPo5oGxieSt/G+ppCOTIzETqsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=moPaNU+j4Zjw0ijpo89qfgD+sZE41NBBmzYnFl419gKgyLKT1OQNZ0kVS4cfq0eD+
	 NRVc8lgyvIe/NR9EnRNQW75Ka7erNaSpMhXSDUV2dQzyKN2pmplHzfTkixfCRLEgGI
	 0skIPRGsiYSclyUtKhCJZlj/Xs92g6meR5NceE514y86hxwXC3dzSJ0hhpzfmUZPAb
	 6M68/nDdG0ShUmvv9bSp6erLk93DuTnDNuehlR1rveVXLyoA5i2iNQRhMcZbIUUuAZ
	 6aM5WgrYS0ZVEc4/AamyrIf6pT+sGztiWpL5zf+qeMqcpcQ+LpWIZ4lsKymqcmSA9L
	 gn/g8/SvxlnXw==
Date: Mon, 26 Jan 2026 07:14:10 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Gwendal Grignou <gwendal@chromium.org>
Cc: chrome-platform@lists.linux.dev, Gwendal Grignou <gwendal@google.com>
Subject: Re: [PATCH 2/2] chrome: lightbar: Add support for large sequence
Message-ID: <aXcUQiEOU-bfj28W@google.com>
References: <20260124085914.836564-1-gwendal@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124085914.836564-1-gwendal@google.com>

On Sat, Jan 24, 2026 at 12:59:14AM -0800, Gwendal Grignou wrote:
> Current sequences are limited to 192 bytes. Increase support to whatever
> the EC support. If the sequence is too long, the EC will return an
> OVERFLOW error.
> 
> Test: Check sending a large sequence is received by the EC.

Please use "platform/chrome" prefix for the commit title.

> +/*
> + * Lightbar version
> + */
> +static int lb_version = -1;
> +

Does it really need to initialize to -1?

>  static ssize_t program_store(struct device *dev, struct device_attribute *attr,
>  			     const char *buf, size_t count)
>  {
> -	int extra_bytes, max_size, ret;
> +	struct cros_ec_dev *ec = to_cros_ec_dev(dev);
>  	struct ec_params_lightbar *param;
>  	struct cros_ec_command *msg;
> -	struct cros_ec_dev *ec = to_cros_ec_dev(dev);
> +	size_t extra_bytes, max_size;
> +	int ret;

`ret` and `ec` are reordered.  They look irrelevant to the patch.

> @@ -478,14 +484,22 @@ static ssize_t program_store(struct device *dev, struct device_attribute *attr,
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
> +					count, max_size);
> +
> +			return -EINVAL;
> +		}
> +	} else {
> +		extra_bytes = sizeof(*param) - sizeof(param->set_program) +
> +			sizeof(param->set_program_ex);

I don't understand the code.  What does `extra_bytes` want to count here?
Why `sizeof(param->set_program)` is involved?  I thought it should be:

  extra_bytes = sizeof(*param) - sizeof(param->set_program_ex.data);

I.e., (regardless of `lb_version`)

  extra_bytes = sizeof(*param) - EC_LB_PROG_LEN;

> +		max_size = ec->ec_dev->max_request - extra_bytes;

Is it possible that `max_size` > EC_LB_PROG_LEN?

> +	} else {
> +		size_t offset = 0;
> +		size_t payload = 0;
> +
> +		param->cmd = LIGHTBAR_CMD_SET_PROGRAM_EX;
> +		while (offset < count) {
> +			payload = min(max_size, count - offset);
> +			param->set_program_ex.offset = offset;
> +			param->set_program_ex.size = payload;
> +			memcpy(param->set_program_ex.data, &buf[offset], payload);

Follow up question, if `max_size` is possible greater than EC_LB_PROG_LEN,
it looks like the memcpy can write out of the boundary of struct
lightbar_program_ex.

> diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
> index 9cbf024f56c3..5a2fd6acdbb9 100644
> --- a/include/linux/platform_data/cros_ec_commands.h
> +++ b/include/linux/platform_data/cros_ec_commands.h
> @@ -2020,6 +2020,16 @@ struct lightbar_program {
>  	uint8_t data[EC_LB_PROG_LEN];
>  } __ec_todo_unpacked;
>  
> +/*
> + * Lightbar program for large sequences. Sequences are sent in pieces, with increasing offset.
> + * The sequences ar still limited by the amunt reserved in EC RAM.
                      ^ e                   ^^^^^ amount
> + */
> +struct lightbar_program_ex {
> +	uint16_t offset;
> +	uint8_t size;
> +	uint8_t data[EC_LB_PROG_LEN];
> +} __ec_todo_unpacked;
> +
>  struct ec_params_lightbar {
>  	uint8_t cmd;		      /* Command (see enum lightbar_command) */
>  	union {
> @@ -2066,6 +2076,7 @@ struct ec_params_lightbar {
>  		struct lightbar_params_v2_colors set_v2par_colors;
>  
>  		struct lightbar_program set_program;
> +		struct lightbar_program_ex set_program_ex;
>  	};
>  } __ec_todo_packed;
>  
> @@ -2154,6 +2165,7 @@ enum lightbar_command {
>  	LIGHTBAR_CMD_GET_PARAMS_V2_COLORS = 32,
>  	LIGHTBAR_CMD_SET_PARAMS_V2_COLORS = 33,
>  	LIGHTBAR_CMD_GET_PARAMS_V3 = 34,
> +	LIGHTBAR_CMD_SET_PROGRAM_EX = 35,
>  	LIGHTBAR_NUM_CMDS
>  };

Haven't seen the change in
https://chromium.googlesource.com/chromiumos/platform/ec/+/refs/heads/main/include/ec_commands.h,
do we need to wait until the change landed in EC firmware?
