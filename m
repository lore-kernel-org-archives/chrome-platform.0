Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EC1A54
	for <chrome-platform@lists.linux.dev>; Tue, 23 Aug 2022 08:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661242469; x=1692778469;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/7zmWejdZuev7ngTwo5eoEvHxIaRq/RdYNea6XiCCs4=;
  b=B8bFSR71WND09iqOZCrgnz2pzCc6vw+qcuCcpil7H69msVo2gqGI129y
   0e7a4HOzUz7jTzTtIlSa2gJGeyGU8d0Dnu7SqBBhSMj0CVBE99Zth59HZ
   H3y4/LzSz1H4xPFHuZa6bJ2Itiq+9LEZMkJAJ4oSQeArWJfyyuLTyUBQ3
   /E7dvtueNTgSq04htfxlah/ouaqvRhawzDCh+Na2euD8iRXw+FhOdWaJs
   /zrCo05V9hM9HirEF4kMGYM49Yvy3ujzqIy+02oa/7FB5Od1lqAk+4qkB
   f3+RTAJApuqB2HJQD0VCZAEkTMnFNN6rugCqyAdOvnLMQg8NlZJ3OQ8aV
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="292365807"
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; 
   d="scan'208";a="292365807"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2022 01:14:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; 
   d="scan'208";a="751605160"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 23 Aug 2022 01:14:26 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 23 Aug 2022 11:14:25 +0300
Date: Tue, 23 Aug 2022 11:14:25 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	bleung@chromium.org,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Guenter Roeck <groeck@chromium.org>
Subject: Re: [PATCH 2/4] platform/chrome: cros_ec_typec: Correct alt mode
 index
Message-ID: <YwSMYb67PMAEkv8f@kuha.fi.intel.com>
References: <20220819190807.1275937-1-pmalani@chromium.org>
 <20220819190807.1275937-3-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220819190807.1275937-3-pmalani@chromium.org>

Hi,

On Fri, Aug 19, 2022 at 07:08:03PM +0000, Prashant Malani wrote:
> Alt mode indices used by USB PD (Power Delivery) start with 1, not 0.
> 
> Update the alt mdoe registration code to factor this in to the alt mode
> descriptor.
> 
> Fixes: de0f49487db3 ("platform/chrome: cros_ec_typec: Register partner altmodes")
> Signed-off-by: Prashant Malani <pmalani@chromium.org>

Shouldn't this be applied also to the stable kernels?

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/platform/chrome/cros_ec_typec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> index 4d81d8d45b73..dc5722db2066 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -698,7 +698,7 @@ static int cros_typec_register_altmodes(struct cros_typec_data *typec, int port_
>  		for (j = 0; j < sop_disc->svids[i].mode_count; j++) {
>  			memset(&desc, 0, sizeof(desc));
>  			desc.svid = sop_disc->svids[i].svid;
> -			desc.mode = j;
> +			desc.mode = j + 1;
>  			desc.vdo = sop_disc->svids[i].mode_vdo[j];
>  
>  			if (is_partner)
> -- 
> 2.37.1.595.g718a3a8f04-goog

-- 
heikki
