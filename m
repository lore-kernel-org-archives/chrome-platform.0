Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452481A317D
	for <chrome-platform@lists.linux.dev>; Mon, 26 Jan 2026 07:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769411636; cv=none; b=s/7+ywqrSWekzSq3oXz2CtixeTKDc/oIFgPmeVbZNxxhxVfaZZ24Hk32p/Hcfiihz6YcjUgmtbOaBdG+qg8g/pEJV895Si1uQaju4rR/DpfL7iny/frCrHIphQZTysiAtYrDPMhVuC5BgSu9V0xM0n2TsztAfdISMQWh/LDJCvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769411636; c=relaxed/simple;
	bh=CVVs/oPEukNzE7O949/itCIEPxRti4sN7qmcImoBaIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJO+b0NrRmqcbyeVTslKH5a05a5Tamx8wZX4BU7YIiEgl2UDfI7f4CPZqXNsgbZB6+MDBR6pHT/ocBsoKt53smyjq43yO+wRaUIByyVzNcZ16bVX1vcrMMeRSBC7vp3Ce93bNR21Xuxmam0tYNAgTi+HQec/adib4sGh3ZTE5+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dQF0/8EU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dQF0/8EU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3691AC116C6;
	Mon, 26 Jan 2026 07:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769411635;
	bh=CVVs/oPEukNzE7O949/itCIEPxRti4sN7qmcImoBaIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dQF0/8EUMrrYJK8sbYTDb85qIYth/R09rh9bi6+JpRDz+n8eKXio4QlcPzYy8/ETW
	 bzubCUrFkC5MaTVsZ1BNjD2dHiV8UWXlaB7izmXEmyy8VRgL5+sywMQgBchxffgrUf
	 3yL4h6iKJ+wL0DQdmwir7vU3C5i9xB7+H7izAUWhiqkiHHh5520DEHQLEtdwzhE9zf
	 eN6CodHQcfdFcHtMzvFbOQ3gP0lyAJLzuumcBnx9zksH3pNaXzp08n+4xzcK4ksEQM
	 SHP94eIwzB/JzZdN96ey3feT+aOyBeJ/4M75fmb22AyWj8Cjq94Q6jGXKea706W/md
	 TlLt4iOWVqHjQ==
Date: Mon, 26 Jan 2026 07:13:53 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Gwendal Grignou <gwendal@chromium.org>
Cc: chrome-platform@lists.linux.dev, Gwendal Grignou <gwendal@google.com>
Subject: Re: [PATCH 1/2] chrome: lightbar: Report number of segments
Message-ID: <aXcUMXt0kN9W26PV@google.com>
References: <20260124085856.826357-1-gwendal@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124085856.826357-1-gwendal@google.com>

On Sat, Jan 24, 2026 at 12:58:55AM -0800, Gwendal Grignou wrote:
> Add attribue `num_segments` to return the number of exposed LED segments
> in the lightbar. It can be smaller than the number of physical leds in
> the lightbar.
> 
> Test: Check the attribute is present and returns a value when read.

Please use "platform/chrome" prefix for the commit title.

> +static ssize_t num_segments_show(struct device *dev,
> +				 struct device_attribute *attr, char *buf)
> +{
> +	uint32_t num = 0;

`./scripts/checkpatch.pl --strict`:
CHECK: Prefer kernel type 'u32' over 'uint32_t'

> +	struct cros_ec_dev *ec = to_cros_ec_dev(dev);
> +	int ret;
> +
> +	ret = lb_throttle();
> +	if (ret)
> +		return ret;
> +
> +	struct ec_params_lightbar *param;
> +	struct ec_response_lightbar *resp;
> +	struct cros_ec_command *msg;

For clarity, I prefer to move the 3 declarations before calling lb_throttle()
in the case.

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

> +	ret = cros_ec_cmd_xfer_status(ec->ec_dev, msg);
> +	if (ret < 0 && ret != -EINVAL)
> +		goto exit;
> +
> +	if (msg->result == EC_RES_SUCCESS) {
> +		resp = (struct ec_response_lightbar *)msg->data;
> +		num = resp->get_params_v3.reported_led_num;
> +	}
> +
> +	/*
> +	 * Anything else (ie, EC_RES_INVALID_COMMAND) - no direct control over
> +	 * LEDs, return that no leds are supported.
> +	 */
> +	ret = 0;
> +exit:
> +	kfree(msg);
> +	if (ret)
> +		return ret;
> +	return sysfs_emit(buf, "%d\n", num);
                                 ^ `num` is an u32.
> +}

How about:

      ret = sysfs_emit(buf, "%u\n", num);
  exit:
      kfree(msg);
      return ret;


> diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
> index 69294f79cc88..9cbf024f56c3 100644
> --- a/include/linux/platform_data/cros_ec_commands.h
> +++ b/include/linux/platform_data/cros_ec_commands.h
> @@ -2005,6 +2005,14 @@ struct lightbar_params_v2_colors {
>  	struct rgb_s color[8];			/* 0-3 are Google colors */
>  } __ec_todo_packed;
>  
> +struct lightbar_params_v3 {
> +	/*
> +	 *  Number of LEDs reported by the EC.
> +	 *  May be less than the actual number of LEDs in the lightbar.
> +	 */
> +	uint8_t reported_led_num;
> +} __ec_todo_packed;
> +
>  /* Lightbar program. */
>  #define EC_LB_PROG_LEN 192
>  struct lightbar_program {
> @@ -2086,6 +2094,8 @@ struct ec_response_lightbar {
>  		struct lightbar_params_v2_thresholds get_params_v2_thlds;
>  		struct lightbar_params_v2_colors get_params_v2_colors;
>  
> +		struct lightbar_params_v3 get_params_v3;
> +
>  		struct __ec_todo_unpacked {
>  			uint32_t num;
>  			uint32_t flags;
> @@ -2143,6 +2153,7 @@ enum lightbar_command {
>  	LIGHTBAR_CMD_SET_PARAMS_V2_THRESHOLDS = 31,
>  	LIGHTBAR_CMD_GET_PARAMS_V2_COLORS = 32,
>  	LIGHTBAR_CMD_SET_PARAMS_V2_COLORS = 33,
> +	LIGHTBAR_CMD_GET_PARAMS_V3 = 34,
>  	LIGHTBAR_NUM_CMDS
>  };

Haven't seen the change in
https://chromium.googlesource.com/chromiumos/platform/ec/+/refs/heads/main/include/ec_commands.h,
do we need to wait until the change landed in EC firmware?
