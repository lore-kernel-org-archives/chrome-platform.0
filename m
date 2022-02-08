Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F392F2C
	for <chrome-platform@lists.linux.dev>; Tue,  8 Feb 2022 05:35:34 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id i30so16976100pfk.8
        for <chrome-platform@lists.linux.dev>; Mon, 07 Feb 2022 21:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5++rdI0ZCWNhcJF9Ilqv0aOk35l2OcJh7Wbsyuqc6/E=;
        b=tcDzdm4a9mAzCZ2Y5FVfN7nHkgGzltgu/EMIfTzbrvddMVPWn/x84T/ysCG9mEZnGm
         BvNGlDvtRLYesNb+tVqpanRwatqOymYxEzChcUKNgrnAWX5FmfmLvwARnvJePwWkK7Cs
         xFk2lp92gZJ84ZKQQh3+0t46g8V9DLia9mj6W82NtDDqiTHTTJi1fzI1uj50QFlWQh5A
         5nhuJs2NMJ1EquCy5B2kU6iK/ixMoiLl8WKX/ERWAlsLcR2abBpUNUrf9yM8VDMIQLtb
         i7xq1PB8oc2NSdD+yUnTTDBHO9XOtY7urxFxKu20yAgSQcJ4d2fS1EpQKluyNPnN76fc
         ct8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5++rdI0ZCWNhcJF9Ilqv0aOk35l2OcJh7Wbsyuqc6/E=;
        b=Cv4eTVKHrgMwvxuqJZdK1bd53VY9T8TtU31rS4VxPxvwUYU6EAMCyMU13svWt6iXMz
         ipI5qzkHFd5aHx9BoxhuZDDMb+mWZbIiaTM2oYVANO0B+ik2QRILt4kgZ2ki8nwqYkiA
         9NhbUh/+LMwToos6ZSmPZLX5Evc+rQGVJbah2X1hU08gQh08V9Mdi7kcxr74nnE2cOMe
         wmAGbWjHLBW4oke3orfqyE3fgqPJu5wIMQOSbFrrVwYdNsBjo8Kl66ZhZERqDpnoUBWp
         RBjwCdS5rMDfLUwoHqYNd2J2Y+GIfRLc7KCY3GrhAYri5k/y7q2UZxTje2EdHLA/QKpg
         0vgw==
X-Gm-Message-State: AOAM530lV6vo+tqYsz3K5TS5PTYCFsSFNoZAOE+D7oCm5zOHGCX+p+fg
	SZCTURmcFT7f+GAVJ4qWEXtP5w==
X-Google-Smtp-Source: ABdhPJxWfuxerOV2oKsf9gfNCpBlp6s/F+hNb9jAcsXRiXhxoWf2TUqLBnsdWoFORWvLI4irmmjtUg==
X-Received: by 2002:aa7:828c:: with SMTP id s12mr453619pfm.6.1644298533822;
        Mon, 07 Feb 2022 21:35:33 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:4b6f:f14d:be50:86a])
        by smtp.gmail.com with ESMTPSA id d22sm13850182pfl.71.2022.02.07.21.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 21:35:33 -0800 (PST)
Date: Tue, 8 Feb 2022 13:35:30 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, Benson Leung <bleung@chromium.org>,
	"open list:CHROMEOS EC USB TYPE-C DRIVER" <chrome-platform@lists.linux.dev>,
	Guenter Roeck <groeck@chromium.org>
Subject: Re: [PATCH 2/4] platform/chrome: cros_ec_typec: Get mux state inside
 configure_mux
Message-ID: <YgIBIlnLPiV+49HI@google.com>
References: <20220207214026.1526151-1-pmalani@chromium.org>
 <20220207214026.1526151-3-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207214026.1526151-3-pmalani@chromium.org>

On Mon, Feb 07, 2022 at 09:40:26PM +0000, Prashant Malani wrote:
> Move the function which gets current mux state inside the
> cros_typec_configure_mux() function. It is better to group those
> bits of functionality together, and it makes it easier to move around
> cros_typec_configure_mux() later.

nit: s/Move/Moves/.

>  static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
> -				uint8_t mux_flags,
>  				struct ec_response_usb_pd_control_v2 *pd_ctrl)
>  {
>  	struct cros_typec_port *port = typec->ports[port_num];
> +	struct ec_response_usb_pd_mux_info mux_resp;
> +	struct ec_params_usb_pd_mux_info req = {
> +		.port = port_num,
> +	};
>  	struct ec_params_usb_pd_mux_ack mux_ack;
>  	enum typec_orientation orientation;
>  	int ret = 0;
>  
> +	ret = cros_ec_command(typec->ec, 0, EC_CMD_USB_PD_MUX_INFO,
> +			      &req, sizeof(req), &mux_resp, sizeof(mux_resp));

It was `req` and `resp` in cros_typec_get_mux_info().  However, `mux_resp` for
separating from `struct ec_response_usb_pd_control_v2 resp` in
cros_typec_port_update().

It would be neat to be either {`req`, `resp`} or {`mux_req`, `mux_resp`} in
cros_typec_configure_mux().
