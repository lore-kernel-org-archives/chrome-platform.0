Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7ACA54
	for <chrome-platform@lists.linux.dev>; Tue, 23 Aug 2022 08:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661242301; x=1692778301;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jGZiRk5UFvIPLRGeEMdOMoJukJQ485whBLPB7y6qoMM=;
  b=M1vTNiDmIR9zzXExLSwSc91s3fTeGWQ1TBLfcJ1pygfSoPz1WB6ucQ54
   7tpgSu7mCJcD5lgEJ36Z5wUYsqn7AMHuiOSXrfFkx9SbzyailZEcwGKxF
   Qn67AZbzrlhWncu1lluK+w7dLXafKha8GgH3EEp5SXBBGohVxtTERBLP1
   DHvH2jaOzL8uyf5v25aDPjPTD6ZBkom0qxz2a+uscReoN42icWC3r+cZC
   sN0tejcYLlDxwOgUA6WvLXjCTG05uaiOT91g42pZUrnhBtcB4vRZ3LizA
   TIUBdhrzbFnxuBcUmS4W6ZTWTS9VrHpIvU/o/7tYJ882u8jHtT+Le6vmZ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="276651631"
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; 
   d="scan'208";a="276651631"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2022 01:11:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; 
   d="scan'208";a="751604341"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 23 Aug 2022 01:11:22 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 23 Aug 2022 11:11:21 +0300
Date: Tue, 23 Aug 2022 11:11:21 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	bleung@chromium.org,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Guenter Roeck <groeck@chromium.org>
Subject: Re: [PATCH 1/4] platform/chrome: cros_ec_typec: Add bit offset for
 DP VDO
Message-ID: <YwSLqfuP5u0Up8oS@kuha.fi.intel.com>
References: <20220819190807.1275937-1-pmalani@chromium.org>
 <20220819190807.1275937-2-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220819190807.1275937-2-pmalani@chromium.org>

On Fri, Aug 19, 2022 at 07:08:02PM +0000, Prashant Malani wrote:
> Use the right macro while constructing the DP_PORT_VDO to ensure the Pin
> Assignment offsets are correct.
> 
> Fixes: 1ff5d97f070c ("platform/chrome: cros_ec_typec: Register port altmodes")
> Signed-off-by: Prashant Malani <pmalani@chromium.org>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/platform/chrome/cros_ec_typec.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> index de6ee0f926a6..4d81d8d45b73 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -25,7 +25,8 @@
>  
>  #define DRV_NAME "cros-ec-typec"
>  
> -#define DP_PORT_VDO	(BIT(DP_PIN_ASSIGN_C) | BIT(DP_PIN_ASSIGN_D) | DP_CAP_DFP_D)
> +#define DP_PORT_VDO	(DP_CONF_SET_PIN_ASSIGN(BIT(DP_PIN_ASSIGN_C) | BIT(DP_PIN_ASSIGN_D)) | \
> +				DP_CAP_DFP_D)
>  
>  /* Supported alt modes. */
>  enum {
> -- 
> 2.37.1.595.g718a3a8f04-goog

-- 
heikki
