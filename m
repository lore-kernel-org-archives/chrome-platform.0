Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3BC189BB6
	for <chrome-platform@lists.linux.dev>; Mon, 23 Feb 2026 07:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771833173; cv=none; b=bTnJpdvOQR44PY5PP62NMSxUAxF+zxN42ERDkTlsiy2QAnF+8va6nUm0mMEYOFDlKtOcfT6YnoFOlkXQ/11yB+IHfOl5CCr7acxXnPM8v5NY9Du8JziV4PUb+mi64YX0mzN338CBQn2POFTRtcM+DFaJF0ujM5DM+C6mcm4RlLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771833173; c=relaxed/simple;
	bh=fz4C+aN3r8nwZAcncssDW/uXTRCQ4cfUmyBSzvxfmHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gzSeajoa/ZTZybwWyuKn6bkYkST7xw4vZiyd+Z2xb19c8KkVpdxEWnVtPeQ6YTeAOZZN6aPM1exbgLAGddx7naAuLqTW7dLXv1VyPecs9HAG09jo4eWN3MNgzy96YKiwZsV5vP1bePr2xZjapkzcyV60NsohRdy+VkRuBJpQnhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qWftOqYR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qWftOqYR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A17EC116C6;
	Mon, 23 Feb 2026 07:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771833173;
	bh=fz4C+aN3r8nwZAcncssDW/uXTRCQ4cfUmyBSzvxfmHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qWftOqYRkOsyuamPLvMBYYMJmCfd82PV8XNYuMiNGzBYlhfYIi+b0thSI0rVCVbQ5
	 tqB5HZOhXDN7CYMPVQvfvuJfk7cGLNwudYM55dYGY3BJrIttiddXvUxT3saOwcnFps
	 4I2eAbDqikqmF7EgsBtWExq6hgde196OR3K51TS2CRIia5JLdLVp3CfmY24/5WS+UA
	 XxmCYLS8Lr0HtBKBUGiX//SSKEn29YlqyWrildD5OWU6iStaBJ2jP9Nrlp2TW2ukf7
	 dNTVt9q3RJnPQC0bpEAzDMRI3MN2v7qeL8LXP0FQoSXmmnmnQ6S27VX2Kx211Nz/1S
	 IVmO4M5N0dlvw==
Date: Mon, 23 Feb 2026 15:52:49 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Gwendal Grignou <gwendal@chromium.org>
Cc: chrome-platform@lists.linux.dev, Gwendal Grignou <gwendal@google.com>
Subject: Re: [PATCH] platform/chrome: lightbar: Add on/off switch
Message-ID: <aZwHUbDVYqIMPmXt@tzungbi-laptop>
References: <20260204035906.703625-1-gwendal@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204035906.703625-1-gwendal@google.com>

On Tue, Feb 03, 2026 at 07:59:06PM -0800, Gwendal Grignou wrote:
> +static ssize_t single_command(struct device *dev,
> +			      enum lightbar_command cmd)
> +{
> +	struct cros_ec_dev *ec = to_cros_ec_dev(dev);
> +	struct ec_params_lightbar *param;
> +	struct cros_ec_command *msg;
> +	int ret;
> +
> +	msg = alloc_lightbar_cmd_msg(ec);
> +	if (!msg)
> +		return -ENOMEM;
> +
> +	param = (struct ec_params_lightbar *)msg->data;
> +	param->cmd = cmd;
> +	ret = lb_throttle();
> +	if (ret)
> +		goto exit;

Move lb_throttle() before `param = ...` to save cycles if it needs to exit
earlier.

> +static ssize_t on_store(struct device *dev,
> +			struct device_attribute *attr,
> +			const char *buf, size_t count)
> +{
> +	bool val;
> +	int ret;
> +
> +	ret = kstrtobool(buf, &val);
> +	if (ret < 0)
> +		return ret;
> +	if (!val)
> +		return -EINVAL;
> +
> +	ret = single_command(dev, LIGHTBAR_CMD_ON);
> +	if (ret < 0)
> +		return ret;
> +	return count;
> +}
> +
> +static ssize_t off_store(struct device *dev,
> +			 struct device_attribute *attr,
> +			 const char *buf, size_t count)
> +{
> +	bool val;
> +	int ret;
> +
> +	ret = kstrtobool(buf, &val);
> +	if (ret < 0)
> +		return ret;
> +	if (!val)
> +		return -EINVAL;
> +
> +	ret = single_command(dev, LIGHTBAR_CMD_OFF);
> +	if (ret < 0)
> +		return ret;
> +	return count;
> +}

`on_store` and `off_store` are similar.  Can they use a common helper
function?  Maybe combine with single_command() as there is no other users
of the function.
