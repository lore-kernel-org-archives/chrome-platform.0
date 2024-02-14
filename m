Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F204A18021
	for <chrome-platform@lists.linux.dev>; Wed, 14 Feb 2024 10:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707906166; cv=none; b=rUtjbTHPmko2By32FaI2GL36mRI0IEJQxqYXi4+1NSzJ9ZMacC6e/S4OowtpiJkWc1QbPcekl6/jdt/THmm3PzeObmfcnZOijq9jznnKnQ3u4QqdpquXrdZGewwiusVDcgrAMicKIUfENh9dci+XFkrFbZ+oW9FAlEzWY6lQSH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707906166; c=relaxed/simple;
	bh=DrNq9NIAiSAvKQs02UieUvDi/8KRVxqBmIiu38GkvBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=he0o/Zfx8a0dX9V3bz7RJkJuZHsdIycx2jLl5SVOWRkt1ndh9YOwLpWFIaV+6pZ57LrnUgUZS1hud1qi+K8ZJr05iX3/MDJRAY+WWQGPg8v4AHdCYjmHe0qsfltrg3iE4XLO8O7g8NGvHuVW2o4jDIZjGNS+N2QYx1WBYx85S0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CrRZycvL; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CrRZycvL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707906165; x=1739442165;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=DrNq9NIAiSAvKQs02UieUvDi/8KRVxqBmIiu38GkvBA=;
  b=CrRZycvLj9Np/AYfv4x4mxm6e02oLuxgM+S6neON0tjDszUC245aY65T
   ZX6v/R7T4A9I7PGWXqTu0LzeooqY3o5LkAqD/yaEkGENwp4FbNwTiG2iv
   wJpOGKxKBSBWDwBFu6eaNwvO0wUW1CbdXJWiPfxGDW9vK2Z0hD9rAlwwx
   lTLXunBmb0DWN7PufsYYkctFI3LBqDW2vtrodaOxOCQ9jChCOnQU6SLpN
   j8G7oZwUBGLyb2Q6fo4qOQhQb7vRh3KdG00NZKa8J0kxDqFXM9Ja5PhbX
   El069Yx08286OP0h5Et5NAkOgYPTaUTWzjD/uPrD0tkEClndoD5q/AP1h
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1794765"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="1794765"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 02:22:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="935614506"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="935614506"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 14 Feb 2024 02:22:39 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 14 Feb 2024 12:22:38 +0200
Date: Wed, 14 Feb 2024 12:22:38 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Prashant Malani <pmalani@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Emilie Roberts <hadrosaur@google.com>,
	"Nyman, Mathias" <mathias.nyman@intel.com>,
	"Regupathy, Rajaram" <rajaram.regupathy@intel.com>,
	"Radjacoumar, Shyam Sundar" <ssradjacoumar@google.com>,
	Samuel Jacob <samjaco@google.com>,
	Uday Bhat <uday.m.bhat@intel.com>, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] platform/chrome: cros_ec_typec: Make sure the USB
 role switch has PLD
Message-ID: <ZcyUblecufzeso17@kuha.fi.intel.com>
References: <20240213130018.3029991-1-heikki.krogerus@linux.intel.com>
 <20240213130018.3029991-3-heikki.krogerus@linux.intel.com>
 <CACeCKadLKg89c8s68QD6VsqiKBMms6765O7mFFihqtET30pUyQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACeCKadLKg89c8s68QD6VsqiKBMms6765O7mFFihqtET30pUyQ@mail.gmail.com>

On Tue, Feb 13, 2024 at 08:55:20AM -0800, Prashant Malani wrote:
> Hi Heikki,
> 
> On Tue, Feb 13, 2024 at 5:00 AM Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
> >
> > The USB role switch does not always have the _PLD (Physical
> > Location of Device) in ACPI tables. If it's missing,
> > assigning the PLD hash of the port to the switch. That
> > should guarantee that the USB Type-C port mapping code is
> > always able to find the connection between the two (the port
> > and the switch).
> >
> > Tested-by: Uday Bhat <uday.m.bhat@intel.com>
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > ---
> >  drivers/platform/chrome/cros_ec_typec.c | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> > index 2b2f14a1b711..4d305876ec08 100644
> > --- a/drivers/platform/chrome/cros_ec_typec.c
> > +++ b/drivers/platform/chrome/cros_ec_typec.c
> > @@ -24,6 +24,23 @@
> >  #define DP_PORT_VDO    (DP_CONF_SET_PIN_ASSIGN(BIT(DP_PIN_ASSIGN_C) | BIT(DP_PIN_ASSIGN_D)) | \
> >                                 DP_CAP_DFP_D | DP_CAP_RECEPTACLE)
> >
> > +static void cros_typec_role_switch_quirk(struct fwnode_handle *fwnode)
> > +{
> > +#ifdef CONFIG_ACPI
> > +       struct fwnode_handle *switch_fwnode;
> > +
> > +       /* Supply the USB role switch with the correct pld_crc if it's missing. */
> > +       switch_fwnode = fwnode_find_reference(fwnode, "usb-role-switch", 0);
> > +       if (!IS_ERR_OR_NULL(switch_fwnode)) {
> > +               struct acpi_device *adev = to_acpi_device_node(switch_fwnode);
> > +
> > +               if (adev && !adev->pld_crc)
> > +                       adev->pld_crc = to_acpi_device_node(fwnode)->pld_crc;
> > +               fwnode_handle_put(switch_fwnode);
> > +       }
> > +#endif
> > +}
> > +
> 
> I'll reiterate my comment[ 1] from v1: can this be in the
> common Type-C code, i.e typec_register_port() ?
>
> I don't see anything in this implementation which is Chrome OS specific.

I'm sorry Prashant, I failed to notice your comment.

This is only needed for Chrome OS. The problem affects only certain
Chromebooks.

I do not want to put quirks to the generic subsystem code unless we
have to. If there are more device drivers that need the same quirk,
then we can move it there, but not before that.

This solution is in any case a hack regardless of where we put it, and
I don't like it because of that. But I don't have any better ideas
unfortunately.

thanks,

-- 
heikki
