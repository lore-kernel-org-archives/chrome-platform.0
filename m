Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADA71FB4
	for <chrome-platform@lists.linux.dev>; Mon, 16 Jan 2023 13:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673874443; x=1705410443;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PQR4PYqa4mE+bf4TUURtJBMGa6yXyz651NIX9P1G6Qs=;
  b=mSO2wNxUPpCWydaGpL52+8OPVR0DIIUqQWaGH1kSNkD8A0V7/J7AnQ0l
   TelHPp9w2h3FJiFfeLtRnfFIbq5El4kFBoY3pQ0uZXwNh2xHkV/SWJh2n
   luJBaS767Yf4AqS/ccZMDxgfNe0L9iyfDkM5WWFNk13B4S8ZGJllQM4rZ
   qPbTgt7HdrfK1hJPeM53xY5VDzHtKob57VW488+VjvRXsiomt5i8V4WD6
   YDCMhTyzw5c1vrSk3zwrqU9NgCo5PXOcYjjahS+d4W7l7u71g6m42xZYR
   j1u1YPfr1ksHB/CAkLySHCSsvmVRbA9EV7GI5B/oQfJ/AuVq8hBrghxxw
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="323157591"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; 
   d="scan'208";a="323157591"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2023 05:07:22 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="832831586"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; 
   d="scan'208";a="832831586"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2023 05:07:14 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id 3400E20165;
	Mon, 16 Jan 2023 15:07:11 +0200 (EET)
Date: Mon, 16 Jan 2023 13:07:11 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Prashant Malani <pmalani@chromium.org>
Cc: Pin-yen Lin <treapking@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <robert.foss@linaro.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Marek Vasut <marex@denx.de>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Javier Martinez Canillas <javierm@redhat.com>,
	Lyude Paul <lyude@redhat.com>, chrome-platform@lists.linux.dev,
	Xin Ji <xji@analogixsemi.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org, Allen Chen <allen.chen@ite.com.tw>,
	linux-acpi@vger.kernel.org, Hsin-Yi Wang <hsinyi@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v10 1/9] device property: Add remote endpoint to devcon
 matcher
Message-ID: <Y8VL/+My+s/PkG9L@paasikivi.fi.intel.com>
References: <20230112042104.4107253-1-treapking@chromium.org>
 <20230112042104.4107253-2-treapking@chromium.org>
 <Y8AL8nTcNcl6zX7H@paasikivi.fi.intel.com>
 <CACeCKaeN7KBi30M1fRWhTPgMbxF6=B+KuAS7Ny7+i9qCx+=49Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACeCKaeN7KBi30M1fRWhTPgMbxF6=B+KuAS7Ny7+i9qCx+=49Q@mail.gmail.com>

Hi Prashant,

On Thu, Jan 12, 2023 at 02:31:45PM -0800, Prashant Malani wrote:
> HI Sakari,
> 
> On Thu, Jan 12, 2023 at 5:32 AM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Pin-yen,
> >
> > On Thu, Jan 12, 2023 at 12:20:56PM +0800, Pin-yen Lin wrote:
> > > From: Prashant Malani <pmalani@chromium.org>
> > > +             /*
> > > +              * Some drivers may register devices for endpoints. Check
> > > +              * the remote-endpoints for matches in addition to the remote
> > > +              * port parent.
> > > +              */
> > > +             node = fwnode_graph_get_remote_endpoint(ep);
> > > +             if (fwnode_device_is_available(node)) {
> > > +                     ret = match(node, con_id, data);
> > > +                     if (ret) {
> > > +                             if (matches)
> > > +                                     matches[count] = ret;
> > > +                             count++;
> > > +                     }
> > > +             }
> >
> > Aren't you missing fwnode_handle-put(node) here??
> 
> It shouldn't be necessary. We aren't break-ing/continue-ing here,
> and fwnode_handle_put(node) is called latter in the loop [1][2]

It is, but node is overwritten just below this chunk --- before
fwnode_handle_put() is called on it.

> 
> BR,
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/base/property.c#n1256
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/base/property.c#n1261

-- 
Regards,

Sakari Ailus
