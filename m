Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CBC111B
	for <chrome-platform@lists.linux.dev>; Fri,  8 Sep 2023 17:03:13 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1c0db66af1bso17197275ad.2
        for <chrome-platform@lists.linux.dev>; Fri, 08 Sep 2023 10:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694192592; x=1694797392; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R5jao51/Y0l1+96mjFOat1xOO+2+m4Y2di/OCWSkew4=;
        b=evuoH9StGBCtwhOwuzS4dmeafR+TDMPJLRZi7ec4nA7h23R1gB7u9hiV5TIkizKNR7
         com5yQJVEus1mWT9apqeOwccfwQl9qPXf8mMNJ3teQYVJHTNSMB9knYSiGAtkdH/IJNc
         o9tYbYeE1sA0J53PC6ujkVFB1NFfIDdDsdt8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694192592; x=1694797392;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5jao51/Y0l1+96mjFOat1xOO+2+m4Y2di/OCWSkew4=;
        b=kXbfYfywms4vY0GrRgsBcwHulF9LXj1XDXgKvrbRZDdXbgjZMoHlLvnVhMaF6EfIzP
         KejUZ9yJWZ4EOPBL5ntE3Mph1p+Sd4btn6J87OUwjTbZ5Q/b6tkgKwrusxAbNnsih1+x
         1tBBPlbLnDukoj9wMXalLDhLyvaqg6zzOuLGxQtYspK9G3q6FpFZPa9k/JaNEkbaFnm1
         7e4SxCBp9sGUqi6xZlfFkNhK2CiDnrEEJ0w7STiZe3J/TOFu0GGell5daL+Tudnltrdo
         F6ygWdF4j6xYeG0GkDla2olgDDFvOtX9cHcVcJUviVPb7A5kbjWkxLKuU7p/NJ0ssx8F
         VRig==
X-Gm-Message-State: AOJu0YwbA1QXuI9zAObk/hzDdglSdYIWAmpPY9VjVPZfI8eI0ebemD8G
	RlCjq7JhTzvl77GdNcr+141I6w==
X-Google-Smtp-Source: AGHT+IHs0K/2VG7TwS32NJgQ8vtkJ6LomrMNB5EEzacZHpSrUlBge4RKMp+7hHeVt/tJl2YloYnPsA==
X-Received: by 2002:a17:903:258b:b0:1bd:b79:3068 with SMTP id jb11-20020a170903258b00b001bd0b793068mr3235977plb.48.1694192592448;
        Fri, 08 Sep 2023 10:03:12 -0700 (PDT)
Received: from chromium.org (77.62.105.34.bc.googleusercontent.com. [34.105.62.77])
        by smtp.gmail.com with ESMTPSA id jf20-20020a170903269400b001b80760fd04sm1806896plb.112.2023.09.08.10.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 10:03:11 -0700 (PDT)
Date: Fri, 8 Sep 2023 17:03:10 +0000
From: Prashant Malani <pmalani@chromium.org>
To: "Patel, Utkarsh H" <utkarsh.h.patel@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
	"chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"bleung@chromium.org" <bleung@chromium.org>
Subject: Re: [PATCH v2 4/5] platform/chrome: cros_ec_typec: Add Displayport
 Alternatemode 2.1 Support
Message-ID: <ZPtTzovOMJ2gmPdy@chromium.org>
References: <20230830223950.1360865-1-utkarsh.h.patel@intel.com>
 <20230830223950.1360865-5-utkarsh.h.patel@intel.com>
 <MWHPR11MB0048D87555CACAC4DC7DF1DFA9E5A@MWHPR11MB0048.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MWHPR11MB0048D87555CACAC4DC7DF1DFA9E5A@MWHPR11MB0048.namprd11.prod.outlook.com>

Hi Utkarsh,

Just a minor thing you can fix for the next version (since it looks
like there will be one).

On Aug 31 15:24, Patel, Utkarsh H wrote:
> Hello,
> 
> >  drivers/platform/chrome/cros_ec_typec.c | 31
> > +++++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> > 
> > diff --git a/drivers/platform/chrome/cros_ec_typec.c
> > b/drivers/platform/chrome/cros_ec_typec.c
> > index d0b4d3fc40ed..8372f13052a8 100644
> > --- a/drivers/platform/chrome/cros_ec_typec.c
> > +++ b/drivers/platform/chrome/cros_ec_typec.c
> > @@ -492,6 +492,8 @@ static int cros_typec_enable_dp(struct
> > cros_typec_data *typec,  {
> >  	struct cros_typec_port *port = typec->ports[port_num];
> >  	struct typec_displayport_data dp_data;
> > +	u32 cable_tbt_vdo;
> > +	u32 cable_dp_vdo;
> >  	int ret;
> > 
> >  	if (typec->pd_ctrl_ver < 2) {
> > @@ -524,6 +526,35 @@ static int cros_typec_enable_dp(struct
> > cros_typec_data *typec,
> >  	port->state.data = &dp_data;
> >  	port->state.mode = TYPEC_MODAL_STATE(ffs(pd_ctrl->dp_mode));
> > 
> > +	/* Get cable VDO for cables with DPSID to check DPAM2.1 is
> > supported */
> > +	cable_dp_vdo = cros_typec_get_cable_vdo(port,
> > USB_TYPEC_DP_SID);
> > +
> > +	/**
> > +	 * Get cable VDO for thunderbolt cables and cables with DPSID but
> > does not
> > +	 * support DPAM2.1.
> > +	 */
> > +	cable_tbt_vdo = cros_typec_get_cable_vdo(port,
> > USB_TYPEC_TBT_SID);
> > +
> > +	if (cable_dp_vdo & DP_CAP_DPAM_VERSION) {
> > +		dp_data.conf |= cable_dp_vdo;
> > +	} else if (cable_tbt_vdo) {
> > +		u8 cable_speed = TBT_CABLE_SPEED(cable_tbt_vdo);
Can we declare this variable at the top? That is the style in this
file and quite commonly seen elsewhere.

Or better yet, just inline this and get rid of the extra variable altogether:

	dp_data.conf |= TBT_CABLE_SPEED(...) << DP_CONF_SIGNALLING_SHIFT;

> > +
> > +		dp_data.conf |= cable_speed <<
> > DP_CONF_SIGNALLING_SHIFT;
> > +
> > +		/* Cable Type */
> > +		if (cable_tbt_vdo & TBT_CABLE_OPTICAL)
> > +			dp_data.conf |= DP_CONF_CABLE_TYPE_OPTICAL <<
> > DP_CONF_CABLE_TYPE_SHIFT;
> > +		else if (cable_tbt_vdo & TBT_CABLE_RETIMER)
> > +			dp_data.conf |= DP_CONF_CABLE_TYPE_RE_TIMER <<
> > DP_CONF_CABLE_TYPE_SHIFT;
> > +		else if (cable_tbt_vdo & TBT_CABLE_ACTIVE_PASSIVE)
> > +			dp_data.conf |= DP_CONF_CABLE_TYPE_RE_DRIVER
> > << DP_CONF_CABLE_TYPE_SHIFT;
> > +	} else if (PD_IDH_PTYPE(port->c_identity.id_header) ==
> > IDH_PTYPE_PCABLE) {
> > +		u8 cable_speed = VDO_CABLE_SPEED(port-
> > >c_identity.vdo[0]);
Same here, you can inline this without affecting readability too much.


BR,

-Prashant
