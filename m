Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710171A5B8F
	for <chrome-platform@lists.linux.dev>; Tue, 16 Sep 2025 13:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758028338; cv=none; b=ZKFqJAs/B6J5vCE1P6v2VwqrYrvMHFmtdA/NGAZdLV9vBGSaDV0MYQD2CzuMZ+ceWDa68Z8M+3za5ONCufEDm+8DfKLhgyHETFXEHOiUKVozGGUt525CahYnrzLA/IG5PHv03kTlvp2LL9B3vo9+Hyp+aF+zfDGCpJgCE/9tWxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758028338; c=relaxed/simple;
	bh=BvfyFTru9mXRTZz7YArqGXU+e/DDntydsXP6ZZ6RHcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=If0gHgyYk5dU+J2cRf2Qm/AIc89zTi9dxCr0rUEGf5teVbGGdpCHyYfS9MhfPXjh8TW1C9XFw1IRGRbNhrETxm/Xi7G5tKMXmnFOw5fAepqu2/Tp+0aR5N1tw+IKskhfkAwM+w29ytUkWgq7Uwl6p1cnJY4gI1RoLXK0RQ+Cuuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=niFEL/jR; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="niFEL/jR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758028337; x=1789564337;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BvfyFTru9mXRTZz7YArqGXU+e/DDntydsXP6ZZ6RHcA=;
  b=niFEL/jR9ptfk6xuazJeWcajjUM6kIcf1tqb+4+zuccTmII39YsJyxTe
   isU4rrH8UPAkIx0Sj9gK5ic0fzdIjHu/vTgkvfmkZ8JSPBkViLO4vzhiF
   URcDEx12W5X6wr7IeaUb0u0YW+BAak1EioRyn9wOmsQggnSNS9oSIqKJS
   XGMPQ//NWcbvYOehmCSRjYVIe+bX8ckCywXjJfT17YOPNYTRVppYCzUYb
   hsM11o9jNfnD+74WjIFsOSf/B1iIfUSjEPkd0AS45ADMfil8jzsvG/PCD
   /DlMc8jlgnrRzbHRIqvq2UoZaw9D02JShwIDnAC1hyL8GBKmLXB+yE59J
   g==;
X-CSE-ConnectionGUID: GKn4xN72TkGjZYYo/vSvpA==
X-CSE-MsgGUID: zITnP8qxSoe8QqYDO/aHIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60253730"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60253730"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 06:12:17 -0700
X-CSE-ConnectionGUID: /x4HogcOTKqgXPeIt6uj2Q==
X-CSE-MsgGUID: 42EV5/ekTMC2BezzGoHhTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="175354969"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa008.fm.intel.com with SMTP; 16 Sep 2025 06:12:13 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 16 Sep 2025 16:12:12 +0300
Date: Tue, 16 Sep 2025 16:12:12 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/5] USB Type-C alternate mode selection
Message-ID: <aMliLCWFKy5Esl0-@kuha.fi.intel.com>
References: <20250909123028.2127449-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909123028.2127449-1-akuchynski@chromium.org>

On Tue, Sep 09, 2025 at 12:30:23PM +0000, Andrei Kuchynski wrote:
> This patch series introduces a flexible mechanism for USB Type-C mode
> selection, enabling into USB4 mode, Thunderbolt alternate mode, or
> DisplayPort alternate mode.
> 
> New sysfs `mode_selection` attribute is exposed to provide user control
> over mode selection. It triggers an alternate mode negotiation.
> The mode selection logic attempts to enter prioritized modes sequentially.
> A mode is considered successfully negotiated only when its alternate mode
> driver explicitly reports a positive status. Alternate mode drivers are
> required to report their mode entry status (either successful or failed).
> If the driver does not report its status within a defined timeout period,
> the system automatically proceeds to attempt entry into the next preferred
> mode.

I'm still struggling to understand what is the benefit from this - why
would you want the user space to explicitly start the entry process
like this? Instead why would you not just take full control over the
alt modes in user space by enabling the them one by one in what ever
order you want?

I don't believe you can make this approach scale much if and when in
the future the use cases change. Right now I don't feel comfortable
with this at all.

thanks,

> This series was tested on an Android OS device with kernel 6.16.
> This series depends on the 'USB Type-C alternate mode priorities' series:
> https://lore.kernel.org/all/20250905142206.4105351-1-akuchynski@chromium.org/ 
> 
> Andrei Kuchynski (5):
>   usb: typec: Implement mode selection
>   usb: typec: Expose mode_selection attribute via sysfs
>   usb: typec: Report altmode entry status via callback
>   usb: typec: ucsi: displayport: Propagate DP altmode entry result
>   platform/chrome: cros_ec_typec: Propagate altmode entry result
> 
>  Documentation/ABI/testing/sysfs-class-typec  |  11 +
>  drivers/platform/chrome/cros_ec_typec.c      |   9 +
>  drivers/platform/chrome/cros_typec_altmode.c |  32 +-
>  drivers/platform/chrome/cros_typec_altmode.h |   6 +
>  drivers/usb/typec/altmodes/displayport.c     |  19 +-
>  drivers/usb/typec/altmodes/thunderbolt.c     |  10 +
>  drivers/usb/typec/class.c                    |  37 ++
>  drivers/usb/typec/class.h                    |   4 +
>  drivers/usb/typec/mode_selection.c           | 345 +++++++++++++++++++
>  drivers/usb/typec/mode_selection.h           |  25 ++
>  drivers/usb/typec/ucsi/displayport.c         |  10 +-
>  include/linux/usb/typec_altmode.h            |  11 +
>  include/linux/usb/typec_dp.h                 |   2 +
>  include/linux/usb/typec_tbt.h                |   3 +
>  14 files changed, 516 insertions(+), 8 deletions(-)
> 
> -- 
> 2.51.0.384.g4c02a37b29-goog

-- 
heikki
