Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7390423B63C
	for <chrome-platform@lists.linux.dev>; Wed,  9 Jul 2025 18:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752086745; cv=none; b=hBRX7aEU8yh1Bfv8sfINjqSMe1QaC6KP4CHz98DNwwK/XbsJW/2+hUIsJXNTO74Ij/9qcqaSApgD3K+L7noqzk9Jy+1lrVpcjwPOpkHDCi2LfipwRGvg9Hz06rq7PbeoleDGZgmqoLRPiz6Bcx6kOZJtHZ29BSPvVhl3NRkHzd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752086745; c=relaxed/simple;
	bh=o2Srecg70C75Z0HRthLG9/BGvcwKUvr73fa64M/sWXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CEtziN6ovqgY9KLEE2nQOTbSRZp+tiJ1Jz7NjrSx80mC+UyhGMNuF0gQi5OAnTXR3EGNfMgdo5ahSk8xeC1jezJtllV+BVuWo0w5FVFsW52FJI2srDtlos4VvOc3stwDo11uMjmS54T4yUPfD4va0BgyCiQP3iE7mvGZ/vx5rmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vnRKLBi/; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vnRKLBi/"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-234b440afa7so2821815ad.0
        for <chrome-platform@lists.linux.dev>; Wed, 09 Jul 2025 11:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752086744; x=1752691544; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yOErlnwQv8NggrVRfX0yyFZwivCXNjTKt1C2jEBasoc=;
        b=vnRKLBi/Q4gIqNxVP2CHqN5rc1ad7dz4mRMmQis7knQy4cVYWoFRcBBA7l3SYozw0Y
         Sa9G46gDNFqeXkPBrldht0QqpeLYEPOXS91olxPeEQ9iOrpMaYTTyLWpG4dcqEQ98eH3
         Ag3tZ88yt4slzWIIWOIdD/2ETDfb/JFWiPwm+TkYQqLcE8VdtlDfGkfaY4+ao3XlR0kW
         9eHsOlOJ/BIt2mSzYPrZE2VlSX2xFP2+Oo9uH4PeuAo1P32DpwyXuc1wkE0nS6mq78yK
         fOWzB9Y31A1zPgfyGPYRSsV9GLv5IwKu7c0hytEvUxdragVllt16NmwsIxEqZeflSur1
         vBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752086744; x=1752691544;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yOErlnwQv8NggrVRfX0yyFZwivCXNjTKt1C2jEBasoc=;
        b=OBLN3cLPpNJUXJ+2xePK4RIrDkE0amwXMdTmjCuR7fNz+NPSM9/6QzxKAWBbmgDmQJ
         YGEyI+GBk2ZFjKsUZYjp3oBk1/+UuMh1e/utV02+2UIM428z0bH54HmZEWOPZ9QdqqiB
         rlo6V9cgnf51abXCVD8Xb1U0EN3vfTFNJnq2aRrrjsPD6yyxrQIegxfBbdHudgUxkdj9
         qnB1DGHBd3xvx4E5JYf/nJxSaIWDjvUymwUkJudNTfj/AoIXUH1uv5WIFRFYnfzXb3lG
         jy+vygZ2Y/futR4iRvsobY521vNlH23TfVQmfBYRJOV5sfgPfVzEaStDqCZOPN9RK2U1
         /9oQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1hqovMQTKxWWndQbxvPVzV4luiypFvIn2KeXF6TNvA5moOED7HaL2Z38StKrJwQbfs5wu3qEyoEZYTA67Q6w=@lists.linux.dev
X-Gm-Message-State: AOJu0YwVucRFUAM/G0I/T4Im0O7HVlmYJkentpPFfkx7bePXtCRy7G/C
	4FCxpArKJbNYroyNQ8VA1x9MQPQalhbY3dNhDGykt+QCMWKQS7+h5DZ0K9u5qd2FVg==
X-Gm-Gg: ASbGncsZkzljcmloj+Ao8S/i+tiX4+FK7gqIeq2Fn5wcHoBnf7OjDLOUZrz+I0HssQz
	CegPBGm2An/Vi7/YJQVySivYGSfVnauNzoH5uqGY03BLvpmssKP0MOBJYJHyZ+2Cb4PsAiiztJy
	w0sceWDZPrhl+oUQ3p1anUVT5GuUl+lCH135R1V3EYPMfhieyegVBT5TFqbWG8ZkDc8TedbNk55
	pa8NZO84jr+K83vnVVLhvi8BTNXkrG+nBgRFTXM3n/nCsI2q8OWnIwY8rOK5w9U5thGSrpMI9z1
	fOyC+CQPxeIiBD8vcQKqma5HVckJ3kcp96I4IHNkMLXp8Jju5XdMLtVjSl1XHbkboVATzMYWzti
	SmfDButVd1WLtKy5+ujCsE7Hk
X-Google-Smtp-Source: AGHT+IHhHP8WC9J3/0rzpqhynsVgnNp0+YbSnGY2zXLovTWOTw/fE6eMRG6LuxgOAPf71XnOwcGe5Q==
X-Received: by 2002:a17:902:e890:b0:235:f1e4:3383 with SMTP id d9443c01a7336-23ddb199307mr49689115ad.7.1752086743316;
        Wed, 09 Jul 2025 11:45:43 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c845820bcsm156142795ad.171.2025.07.09.11.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 11:45:41 -0700 (PDT)
Date: Wed, 9 Jul 2025 18:45:36 +0000
From: Benson Leung <bleung@google.com>
To: Radu Vele <raduvele@google.com>
Cc: Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] platform/chrome: cros_ec_typec: Add role swap ops
Message-ID: <aG640KbIPP5hqSg2@google.com>
References: <20250709132232.2475172-1-raduvele@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709132232.2475172-1-raduvele@google.com>

Hi Radu and Abhishek,

Thanks for this change!

On Wed, Jul 09, 2025 at 01:22:31PM +0000, Radu Vele wrote:
> From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> 
> Add the pr_set and dr_set typec_operations to registered typec ports.
> This enables sysfs to control power and data role when the port is
> capable of doing so.
> 
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Co-developed-by: Radu Vele <raduvele@google.com>
> Signed-off-by: Radu Vele <raduvele@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/platform/chrome/cros_ec_typec.c | 77 ++++++++++++++++++++++++-
>  1 file changed, 76 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> index 7678e3d05fd3..289429ef959f 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -58,8 +58,83 @@ static int cros_typec_enter_usb_mode(struct typec_port *tc_port, enum usb_mode m
>  			  &req, sizeof(req), NULL, 0);
>  }
>  
> +static int cros_typec_perform_role_swap(struct typec_port *tc_port, int target_role, u8 swap_type)
> +{
> +	struct cros_typec_port *port = typec_get_drvdata(tc_port);
> +	struct cros_typec_data *data = port->typec_data;
> +	struct ec_response_usb_pd_control_v2 resp;
> +	struct ec_params_usb_pd_control req;
> +	int role, ret;
> +
> +	/* Must be at least v1 to support role swap. */
> +	if (!data->pd_ctrl_ver)
> +		return -EOPNOTSUPP;
> +
> +	/* First query the state */
> +	req.port = port->port_num;
> +	req.role = USB_PD_CTRL_ROLE_NO_CHANGE;
> +	req.mux = USB_PD_CTRL_MUX_NO_CHANGE;
> +	req.swap = USB_PD_CTRL_SWAP_NONE;
> +
> +	ret = cros_ec_cmd(data->ec, data->pd_ctrl_ver, EC_CMD_USB_PD_CONTROL,
> +				&req, sizeof(req), &resp, sizeof(resp));
> +	if (ret < 0)
> +		return ret;
> +
> +	switch (swap_type) {
> +	case USB_PD_CTRL_SWAP_DATA:
> +		role = (resp.role & PD_CTRL_RESP_ROLE_DATA) ? TYPEC_HOST :
> +						TYPEC_DEVICE;
> +		break;
> +	case USB_PD_CTRL_SWAP_POWER:
> +		role = (resp.role & PD_CTRL_RESP_ROLE_POWER) ? TYPEC_SOURCE :
> +						TYPEC_SINK;
> +		break;
> +	default:
> +		dev_warn(data->dev, "Unsupported role swap type %d", swap_type);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (role == target_role)
> +		return 0;
> +
> +	req.swap = swap_type;
> +	ret = cros_ec_cmd(data->ec, data->pd_ctrl_ver, EC_CMD_USB_PD_CONTROL,
> +				&req, sizeof(req), &resp, sizeof(resp));
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	switch (swap_type) {
> +	case USB_PD_CTRL_SWAP_DATA:
> +		typec_set_data_role(tc_port, resp.role & PD_CTRL_RESP_ROLE_DATA ?
> +									TYPEC_HOST :
> +									TYPEC_DEVICE);
> +		break;
> +	case USB_PD_CTRL_SWAP_POWER:
> +		typec_set_pwr_role(tc_port, resp.role & PD_CTRL_RESP_ROLE_POWER ?
> +									TYPEC_SOURCE :
> +									TYPEC_SINK);
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int cros_typec_dr_swap(struct typec_port *port, enum typec_data_role role)
> +{
> +	return cros_typec_perform_role_swap(port, role, USB_PD_CTRL_SWAP_DATA);
> +}
> +
> +static int cros_typec_pr_swap(struct typec_port *port, enum typec_role role)
> +{
> +	return cros_typec_perform_role_swap(port, role, USB_PD_CTRL_SWAP_POWER);
> +}
> +
>  static const struct typec_operations cros_typec_usb_mode_ops = {
> -	.enter_usb_mode = cros_typec_enter_usb_mode
> +	.enter_usb_mode = cros_typec_enter_usb_mode,
> +	.dr_set = cros_typec_dr_swap,
> +	.pr_set = cros_typec_pr_swap
>  };
>  
>  static int cros_typec_parse_port_props(struct typec_capability *cap,
> -- 
> 2.50.0.727.gbf7dc18ff4-goog
> 
