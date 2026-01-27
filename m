Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5251B4244
	for <chrome-platform@lists.linux.dev>; Tue, 27 Jan 2026 08:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769501832; cv=none; b=E5oqwZI9Vjuh4rCmnQEVm7x1v+pEicdIIgcEMc8XnT0M1Obc5vIs5FVn7gyM3vv8fjytVdYNcN0wgZrJzHVA3o/nvmLdeaBZz+iyvxY9+R+4Ki9XhUBezwRBgdegXQkXDJsb7bQZ/vNijNiChtg2sYKXzk91mjnVKzNn+3lg25Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769501832; c=relaxed/simple;
	bh=Cv8ULhdY9hlYEWHkGHz+8wtqg/yt/0F8ftcn6HSPJ9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rbxNrhRf0GTpfX62uvd8n1DVfN1VbhjI3orihZr6tzGh2Vf/bBwEy0o1iIepTdMoTXzOrUoFhjUPQ90lT/Ta9oIgLOXcNwltavmoIs8miZhCR95n7RHWMU6pQOpBES1i+CcxsJTEbFpF+qjX94AUMzkW4d0NdxrqPqWiv1D1kKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E4RWjy3F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E4RWjy3F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 366EDC116C6;
	Tue, 27 Jan 2026 08:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769501831;
	bh=Cv8ULhdY9hlYEWHkGHz+8wtqg/yt/0F8ftcn6HSPJ9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E4RWjy3FSutHb4bjjNDWkAiKtGyYymwjSr20K3SNGNnkVj9OK2Hzs1FlcqUogNRWu
	 gdyKHJ5rBfa3Na13TEdFfdg/g1VJZLz7i3UyzEIbATMNvUOcCziV4/LkiIaNgL+JYS
	 +1dBwbVRlQ4hBTHtiDJTVFGZBiOuhPaojJCiYu8JHCkg17U5ivDIN0fjam+bHmFcpV
	 9sUcfi/vtl8VgYkMBsTs0gQd47mZJm/tVqWyiDeEtK7W6T3tejse/6RHLnifC/JODc
	 /1lRVamDS+gHL1wq4ZbdTgapZXjbfh7fMNgarFUfHHO6qQpsCaS0YwG/+dtqfpDXSC
	 BtT4m/mr0KNMg==
Date: Tue, 27 Jan 2026 08:17:08 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Gwendal Grignou <gwendal@chromium.org>
Cc: chrome-platform@lists.linux.dev, Gwendal Grignou <gwendal@google.com>
Subject: Re: [PATCH v2 1/2] platform: chrome: lightbar: Report number of
 segments
Message-ID: <aXh0hEZNk2gmLncI@google.com>
References: <20260127063434.789047-1-gwendal@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127063434.789047-1-gwendal@google.com>

On Mon, Jan 26, 2026 at 10:34:33PM -0800, Gwendal Grignou wrote:
> Add attribue `num_segments` to return the number of exposed LED segments
> in the lightbar. It can be smaller than the number of physical leds in
> the lightbar.
> 
> Test: Check the attribute is present and returns a value when read.
> 
> Signed-off-by: Gwendal Grignou <gwendal@google.com>
> ---
> Changes in v2:
> - Put local variables at beginning of num_segments_show()
> - Cleanup return logic.
> 
>  drivers/platform/chrome/cros_ec_lightbar.c    | 43 +++++++++++++++++++
>  .../linux/platform_data/cros_ec_commands.h    | 11 +++++

The patch generally looks good to me.  We have to wait the header change
landed in firmware.

> +static ssize_t num_segments_show(struct device *dev,
> +				 struct device_attribute *attr, char *buf)
> +{
> +	struct ec_params_lightbar *param;
> +	struct ec_response_lightbar *resp;
> +	struct cros_ec_command *msg;
> +	struct cros_ec_dev *ec = to_cros_ec_dev(dev);
> +	uint32_t num = 0;
> +	int ret;
> +
> +	ret = lb_throttle();
> +	if (ret)
> +		return ret;
> +
> +	msg = alloc_lightbar_cmd_msg(ec);
> +	if (!msg)
> +		return -ENOMEM;
> +
> +	param = (struct ec_params_lightbar *)msg->data;
> +	param->cmd = LIGHTBAR_CMD_GET_PARAMS_V3;
> +	msg->outsize = sizeof(param->cmd);
> +	msg->result = sizeof(resp->get_params_v3);
             ^^^^^^ insize
It seems you missed the comment from v1.
