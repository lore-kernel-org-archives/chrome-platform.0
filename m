Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8490C3A785A
	for <chrome-platform@lists.linux.dev>; Thu, 15 Jan 2026 14:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768489197; cv=none; b=noWKytyZWdY6W+YpZMMk4EcpcNqerHh3yN9x3nsQNV1Fea+XKdEj64QliW3NGhGiGR1w6Zl1Sr6AYi/uREFlqF/eMSPQnf9hHMQx0dcfo71dYjyEPxunfiiILnGT2ATz5tPf3zVwR02RPJ92iRQ54y+lIUboS0/4O79Y4F1AQjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768489197; c=relaxed/simple;
	bh=gXoI2O8+xVQi6gOwspTCtKXpFpyWlqwJWXjGm+1H+vY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vATT0CtoyEkPU63qz4eKH3rswmUn6H0HByjrFR9rYPpbZkLq998JVrrzJCE+FV3VG+IoDXJ8+IOdGJcoU0h6kbdxlJslK4sIJ5GB8/ZIdS3Ir20JMaH/QwEpkL1FnR6eb39C+kvShMpC8ftztt4dqDDEZ7YtvbHJ0agXRRacObc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aT4Sjp3o; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aT4Sjp3o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768489192; x=1800025192;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gXoI2O8+xVQi6gOwspTCtKXpFpyWlqwJWXjGm+1H+vY=;
  b=aT4Sjp3oqF9OPQS6pra8W36bU9Z3skYHpa/7O+XpEs2V+keE6bO+G/jf
   4nKfXYyM4Zrg5FHWfuyiKAOlzSPLiNJc2NuifpmCCV71Fnb7FLT/2pRyA
   5RJ6RRhpTOVbWqI5FMnZg01z2+xEiu/zExmkr092g9S8fSS6bbIF2nTA/
   oZvMfxEYwT3RzyrJs86Mp19Wy+gEYu9ImPn9+JEzUJycdoYhnKlPGqui+
   iLfoxc1j8L+p58x/8Om2koEuxMeLYpKbYCqWNLhRPa0UP6cdddurtzyYm
   YF5iN8ofWdIZOng+yZ/2YKszImYZJN+k+JrHjjXQxDqAP41CZMnDp5dM1
   A==;
X-CSE-ConnectionGUID: gm/cDhuhSvWb8E4Xoujsrg==
X-CSE-MsgGUID: YSTQgBh9QIeVm2EevZ6T4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80906930"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="80906930"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 06:59:48 -0800
X-CSE-ConnectionGUID: hxNWxTP/S7uRZVcgJ6uYrw==
X-CSE-MsgGUID: Dh5X0pf8Tbu4FyqPzhj3wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="228047403"
Received: from spandruv-mobl5.amr.corp.intel.com (HELO kuha) ([10.124.220.243])
  by fmviesa002.fm.intel.com with SMTP; 15 Jan 2026 06:59:41 -0800
Received: by kuha (sSMTP sendmail emulation); Thu, 15 Jan 2026 16:59:19 +0200
Date: Thu, 15 Jan 2026 16:59:19 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>, Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>
Subject: Re: [PATCH v4 7/8] usb: typec: ucsi: Support mode selection to
 activate altmodes
Message-ID: <aWkAx-QjfwQGJ6Eb@kuha>
References: <20260113130536.3068311-1-akuchynski@chromium.org>
 <20260113130536.3068311-8-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113130536.3068311-8-akuchynski@chromium.org>

Tue, Jan 13, 2026 at 01:05:35PM +0000, Andrei Kuchynski kirjoitti:
> If the ucsi port driver supports modes selection, it should implement
> `add_partner_altmodes` and `remove_partner_altmodes` ucsi operations. With
> these operations the driver can manage the mode selection process.
> Once partner altmodes are registered, `add_partner_altmodes` is called to
> start the mode selection. When the partner is unregistered,
> `remove_partner_altmodes` is supposed to stop any ongoing processes and
> clean up the resources.
> 
> `typec_altmode_state_update` informes mode selection about the current mode
> of the Type-C connector.
> 
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 11 +++++++++++
>  drivers/usb/typec/ucsi/ucsi.h |  4 ++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index deb210c066cb5..4a6e23b55b10c 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -314,6 +314,7 @@ void ucsi_altmode_update_active(struct ucsi_connector *con)
>  {
>  	const struct typec_altmode *altmode = NULL;
>  	u64 command;
> +	u16 svid = 0;
>  	int ret;
>  	u8 cur;
>  	int i;
> @@ -335,6 +336,10 @@ void ucsi_altmode_update_active(struct ucsi_connector *con)
>  	for (i = 0; con->partner_altmode[i]; i++)
>  		typec_altmode_update_active(con->partner_altmode[i],
>  					    con->partner_altmode[i] == altmode);
> +
> +	if (altmode)
> +		svid = altmode->svid;
> +	typec_altmode_state_update(con->partner, svid, 0);
>  }
>  
>  static int ucsi_altmode_next_mode(struct typec_altmode **alt, u16 svid)
> @@ -609,6 +614,8 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
>  			desc.vdo = alt[j].mid;
>  			desc.svid = alt[j].svid;
>  			desc.roles = TYPEC_PORT_DRD;
> +			desc.mode_selection = con->ucsi->ops->add_partner_altmodes &&
> +					con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE;

Can't you just use that con->typec_cap.no_mode_control flag here?

Maybe also consider squashing that patch 3/8 into this one while at it.

>  			ret = ucsi_register_altmode(con, &desc, recipient);
>  			if (ret)
> @@ -831,6 +838,8 @@ static int ucsi_check_altmodes(struct ucsi_connector *con)
>  	if (con->partner_altmode[0]) {
>  		num_partner_am = ucsi_get_num_altmode(con->partner_altmode);
>  		typec_partner_set_num_altmodes(con->partner, num_partner_am);
> +		if (con->ucsi->ops->add_partner_altmodes)
> +			con->ucsi->ops->add_partner_altmodes(con);
>  		ucsi_altmode_update_active(con);
>  		return 0;
>  	} else {
> @@ -1119,6 +1128,8 @@ static void ucsi_unregister_partner(struct ucsi_connector *con)
>  		return;
>  
>  	typec_set_mode(con->port, TYPEC_STATE_SAFE);
> +	if (con->ucsi->ops->remove_partner_altmodes)
> +		con->ucsi->ops->remove_partner_altmodes(con);
>  
>  	typec_partner_set_usb_power_delivery(con->partner, NULL);
>  	ucsi_unregister_partner_pdos(con);

thanks,

-- 
heikki
