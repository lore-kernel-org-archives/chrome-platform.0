Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36BA182B8
	for <chrome-platform@lists.linux.dev>; Tue,  9 May 2023 12:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683635945; x=1715171945;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wd04ijxppdvr2I9PyZKHDlJVnhsnmKO4X4fKV87YfQs=;
  b=KFDKMIuUwCeUPJB5tQukuYD2/Ut9UVH7Z4XvxBc17D0dPQi6zhMweexv
   0m/peH8ywKF9pRlOcN1y3TwqAgK671uwwL72NG5SsxxOexxdyo/FeJbA6
   sLqjq92w0JJ/DQw8SmuMNpkCW0kJo69ZHwq/S4FifOFJzoM/IECzWtpAg
   VLOFnw13nJOaVrTNY03M9S+k6ztpCSgrBrOc1q8wJyfflMnxK6NAYc6b+
   WvIi5tE/0/Y9rn5voUq0gxH+imb+FV87L/8XXru50yhjgb0COXuldRGcW
   9jCvPHlc6BmCZ6tyVuXhND2G8bxeyv+H91FFFNR9jew4DqJZtB6v9VfI3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="347370633"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="347370633"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 05:39:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="843083048"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="843083048"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 09 May 2023 05:38:59 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 09 May 2023 15:38:58 +0300
Date: Tue, 9 May 2023 15:38:58 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	bleung@chromium.org
Subject: Re: [PATCH] platform/chrome: cros_typec_switch: Add Pin D support
Message-ID: <ZFo+4hsf4g+BQJm1@kuha.fi.intel.com>
References: <20230508183428.1893357-1-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230508183428.1893357-1-pmalani@chromium.org>

On Mon, May 08, 2023 at 06:34:27PM +0000, Prashant Malani wrote:
> The ChromeOS EC's mux interface allows us to specify whether the port
> should be configured for Pin Assignment D in DisplayPort alternate mode
> (i.e 2 lanes USB + 2 lanes DP). Update the function that determines mux
> state to account for Pin Assignment D and return the appropriate mux
> setting.
> 
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/platform/chrome/cros_typec_switch.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/chrome/cros_typec_switch.c b/drivers/platform/chrome/cros_typec_switch.c
> index 752720483753..0eefdcf14d63 100644
> --- a/drivers/platform/chrome/cros_typec_switch.c
> +++ b/drivers/platform/chrome/cros_typec_switch.c
> @@ -51,13 +51,18 @@ static int cros_typec_cmd_mux_set(struct cros_typec_switch_data *sdata, int port
>  static int cros_typec_get_mux_state(unsigned long mode, struct typec_altmode *alt)
>  {
>  	int ret = -EOPNOTSUPP;
> +	u8 pin_assign;
>  
> -	if (mode == TYPEC_STATE_SAFE)
> +	if (mode == TYPEC_STATE_SAFE) {
>  		ret = USB_PD_MUX_SAFE_MODE;
> -	else if (mode == TYPEC_STATE_USB)
> +	} else if (mode == TYPEC_STATE_USB) {
>  		ret = USB_PD_MUX_USB_ENABLED;
> -	else if (alt && alt->svid == USB_TYPEC_DP_SID)
> +	} else if (alt && alt->svid == USB_TYPEC_DP_SID) {
>  		ret = USB_PD_MUX_DP_ENABLED;
> +		pin_assign = mode - TYPEC_STATE_MODAL;
> +		if (pin_assign & DP_PIN_ASSIGN_D)
> +			ret |= USB_PD_MUX_USB_ENABLED;
> +	}
>  
>  	return ret;
>  }

thanks,

-- 
heikki
