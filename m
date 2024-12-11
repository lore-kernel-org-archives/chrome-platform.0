Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598621D9359
	for <chrome-platform@lists.linux.dev>; Wed, 11 Dec 2024 10:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733911855; cv=none; b=K3JnW9NQs8I3BFvJlPu39assLPCsfYn/GDA7KFdhX7Rz9Ag29y1IX+Yux1XXeVqqsIR2dHCXyjAKwVYoOdPmPaXoZtym6QCEEjAjRABozmnlD57G6pifg6ceSzF+lx+1YdlGnMYclOB6nn1Hl/tYNrG8xkivylbA8/azJxdBDb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733911855; c=relaxed/simple;
	bh=sNNiv+krDX57PlrYyuWWXeuKjkBe0UFYHO9uiQNqXG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tqzl+RdmlKUM/0uJqYF1fA9x0+m0orDPenFRYu037NFVFwMQ3AIJwgDwFH+fVvJPxVCg+VCdHE0Go89IvltqzMx1anc0EbIgkBqcC+GClqBe3FDalQ9mj0fO7GPBoRiQegj2k51enecCpPuLkEh/vriCDLLBef0lyooG67Fz/M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BB70WKd3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BB70WKd3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733911855; x=1765447855;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sNNiv+krDX57PlrYyuWWXeuKjkBe0UFYHO9uiQNqXG0=;
  b=BB70WKd3mJXjInV3bUIyLKvewQm9YpG1PtFnTh2Geecmaaut4fwMB/vx
   r51DUUWd47mAGmeJg7w6a35qHiZmLDdObkFX3laGA2UJGGO4AXR4XqeJl
   6TX+Aezl4asA6pN+YHd+Dbuaqkxo2d2lDwEWvcIMacXd4Rotx5ZIzBLHu
   3vw89eUpSa/TBa1JwjzlqU2clVqzdGKH2oMGf2GngrHxXvXeLxeSOGjtA
   5cqEz1Gzktfd3VQVS+zOEvKLGxRsXuQ/Ehb/RIIlvxPMqaWgG2FbZpSE0
   FcU4NcfpWoFazEzSYtIQ/eePyowr6yujjyWesyVfaLNONkYgTWqNmVel2
   A==;
X-CSE-ConnectionGUID: HCdnIpQhT4GAFOosb+nTMQ==
X-CSE-MsgGUID: dyNzPZakRyqlZRWKQSu+ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="51691222"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; 
   d="scan'208";a="51691222"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 02:10:54 -0800
X-CSE-ConnectionGUID: Nrl286v4QTazqEvqznmoJQ==
X-CSE-MsgGUID: fIyu/4MPR3acJyQWLcffgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="126675079"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa001.fm.intel.com with SMTP; 11 Dec 2024 02:09:43 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 11 Dec 2024 12:09:42 +0200
Date: Wed, 11 Dec 2024 12:09:42 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: tzungbi@kernel.org, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev, akuchynski@google.com,
	pmalani@chromium.org, jthies@google.com,
	dmitry.baryshkov@linaro.org, badhri@google.com,
	rdbabiera@google.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/7] usb: typec: Print err when displayport fails to
 enter
Message-ID: <Z1lk5pf-tGeNd342@kuha.fi.intel.com>
References: <20241206233830.2401638-1-abhishekpandit@chromium.org>
 <20241206153813.v4.3.I6cff9d767b0f8ab6458d8940941e42c920902d49@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206153813.v4.3.I6cff9d767b0f8ab6458d8940941e42c920902d49@changeid>

On Fri, Dec 06, 2024 at 03:38:14PM -0800, Abhishek Pandit-Subedi wrote:
> Print the error reason for typec_altmode_enter so users can understand
> why displayport failed to enter.
> 
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  drivers/usb/typec/altmodes/displayport.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> index 3245e03d59e6..e292780ec309 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -252,7 +252,8 @@ static void dp_altmode_work(struct work_struct *work)
>  	case DP_STATE_ENTER:
>  		ret = typec_altmode_enter(dp->alt, NULL);
>  		if (ret && ret != -EBUSY)
> -			dev_err(&dp->alt->dev, "failed to enter mode\n");
> +			dev_err(&dp->alt->dev, "failed to enter mode: %d\n",
> +				ret);

One line is enough.

>  		break;
>  	case DP_STATE_ENTER_PRIME:
>  		ret = typec_cable_altmode_enter(dp->alt, TYPEC_PLUG_SOP_P, NULL);

thanks,

-- 
heikki
