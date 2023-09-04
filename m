Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5890881E
	for <chrome-platform@lists.linux.dev>; Mon,  4 Sep 2023 07:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693811526; x=1725347526;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/mPpebHekt4z0jKwxayEoBi46koj43+6LGMMgIGgl+g=;
  b=fxQOKw5rGFrl5S2f3bYBGpTs6oW7ANu7hWyVIM5q6b5N9tOTItJXxsqw
   YF/KzXaiuz99bsknZxyrsOUXx9DffcwzO88K2/yiuxSieLfX68JUSMLyC
   n+11hwGfRE4RpSbG/T/oyMF2ad0JeOqM23uDYQHptDcjCy/oHQ6xB5/7Z
   NztF0lAU+h7WwD9icTlCxIL5O589j3/NtIe0k0poaFTkCezdFStL8oh2o
   tTUrd38buKWL9kVO1bubY3duu6CEqatUbltr2XPSDLOnetWt0CtXBMdYr
   LTO+MK4VFLp+NCEdnkEQkN37BzOwGC3aMTi61v6PjoByqDPY9HrwGgIXz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="462901683"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="462901683"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 00:11:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="740653070"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="740653070"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orsmga002.jf.intel.com with SMTP; 04 Sep 2023 00:11:49 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 04 Sep 2023 10:11:48 +0300
Date: Mon, 4 Sep 2023 10:11:48 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Utkarsh Patel <utkarsh.h.patel@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	pmalani@chromium.org, chrome-platform@lists.linux.dev,
	andriy.shevchenko@linux.intel.com, bleung@chromium.org
Subject: Re: [PATCH v2 3/5] usb: pd: Add helper macro to get Type C cable
 speed
Message-ID: <ZPWDNLoxq22bL9gM@kuha.fi.intel.com>
References: <20230830223950.1360865-1-utkarsh.h.patel@intel.com>
 <20230830223950.1360865-4-utkarsh.h.patel@intel.com>
 <ZPWCdiSkeRA+CJ+i@kuha.fi.intel.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZPWCdiSkeRA+CJ+i@kuha.fi.intel.com>

On Mon, Sep 04, 2023 at 10:08:42AM +0300, Heikki Krogerus wrote:
> On Wed, Aug 30, 2023 at 03:39:48PM -0700, Utkarsh Patel wrote:
> > Added a helper macro to get the Type C cable speed when provided the
> > cable VDO.
> > 
> > Signed-off-by: Utkarsh Patel <utkarsh.h.patel@intel.com>
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> > ---
> > Changes in v2:
> > - This change is being added as new patch in this series.
> > 
> >  include/linux/usb/pd_vdo.h | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/include/linux/usb/pd_vdo.h b/include/linux/usb/pd_vdo.h
> > index b057250704e8..3a747938cdab 100644
> > --- a/include/linux/usb/pd_vdo.h
> > +++ b/include/linux/usb/pd_vdo.h
> > @@ -376,6 +376,7 @@
> >  	 | ((vbm) & 0x3) << 9 | (sbu) << 8 | (sbut) << 7 | ((cur) & 0x3) << 5	\
> >  	 | (vbt) << 4 | (sopp) << 3 | ((spd) & 0x7))
> >  
> > +#define VDO_TYPEC_CABLE_SPEED(vdo)	((vdo) & 0x7)
> >  #define VDO_TYPEC_CABLE_TYPE(vdo)	(((vdo) >> 18) & 0x3)

Hold on! You are not using this anywhere in the patch set?

Since this is just a helper, I think it would be appropriate to
introduce it together with a user for it.

thanks,

-- 
heikki
