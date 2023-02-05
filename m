Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C5827716
	for <chrome-platform@lists.linux.dev>; Sun,  5 Feb 2023 21:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675631507; x=1707167507;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xm3HIRSFDbFA71kRsh0phLher1JTnUxzuHlDRPbBskE=;
  b=NO1QFNCiw9xWlMZb/5UZgLtxWvbyDO+IBHJ+hoVnXN7dbeqvPKmMX8PW
   fLBQ0d2A3UPwHIq/i82xcD3wTlVWsZ1Bxno2OS6t+Q7dh2VYTtlJYxyqK
   /ZBOcQRO6h0e7lJodW26g/wBp+iQ7q2PmWR6DpDF3vZ/bsCOkzN5FJ+BG
   vg+AirtGUkOwvSf2BJvJ73a//WIJn1jIJ0f7cOK8gL3KJfxHwC0289PrG
   oBKGLOnqx7jm/e+mWv9ifAES69iL1vib73SddOpMl7ualPL3MRoRjAH4M
   K3/Ex10UKbmRfrgokSAJERwxSKc4PkKcunuer/o+2oDF+GJLeuXLwsdHQ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="309423299"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="309423299"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 13:11:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="659664078"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="659664078"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 13:11:37 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0A95F12190B;
	Sun,  5 Feb 2023 23:11:34 +0200 (EET)
Date: Sun, 5 Feb 2023 23:11:34 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Pin-yen Lin <treapking@chromium.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
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
	Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>, devicetree@vger.kernel.org,
	Allen Chen <allen.chen@ite.com.tw>, Lyude Paul <lyude@redhat.com>,
	linux-acpi@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Marek Vasut <marex@denx.de>, Xin Ji <xji@analogixsemi.com>,
	Stephen Boyd <swboyd@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	chrome-platform@lists.linux.dev, Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v11 1/9] device property: Add remote endpoint to devcon
 matcher
Message-ID: <Y+AbhnfJvScvHTGY@kekkonen.localdomain>
References: <20230204133040.1236799-1-treapking@chromium.org>
 <20230204133040.1236799-2-treapking@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230204133040.1236799-2-treapking@chromium.org>

Hi Pin-yen,

On Sat, Feb 04, 2023 at 09:30:32PM +0800, Pin-yen Lin wrote:
> From: Prashant Malani <pmalani@chromium.org>
> 
> When searching the device graph for device matches, check the
> remote-endpoint itself for a match.
> 
> Some drivers register devices for individual endpoints. This allows
> the matcher code to evaluate those for a match too, instead
> of only looking at the remote parent devices. This is required when a
> device supports two mode switches in its endpoints, so we can't simply
> register the mode switch with the parent node.
> 
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>

Thanks for the update.

I intended to give my Reviewed-by: but there's something still needs to be
addressed. See below.

> 
> ---
> 
> Changes in v11:
> - Added missing fwnode_handle_put in drivers/base/property.c
> 
> Changes in v10:
> - Collected Reviewed-by and Tested-by tags
> 
> Changes in v6:
> - New in v6
> 
>  drivers/base/property.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index 2a5a37fcd998..e6f915b72eb7 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
> @@ -1223,6 +1223,22 @@ static unsigned int fwnode_graph_devcon_matches(struct fwnode_handle *fwnode,
>  			break;
>  		}
>  
> +		/*
> +		 * Some drivers may register devices for endpoints. Check
> +		 * the remote-endpoints for matches in addition to the remote
> +		 * port parent.
> +		 */
> +		node = fwnode_graph_get_remote_endpoint(ep);

Here fwnode_graph_get_remote_endpoint() returns an endpoint...

> +		if (fwnode_device_is_available(node)) {

and you're calling fwnode_device_is_available() on the endpoint node, which
always returns true.

Shouldn't you call this on the device node instead? What about match()
below?

> +			ret = match(node, con_id, data);
> +			if (ret) {
> +				if (matches)
> +					matches[count] = ret;
> +				count++;
> +			}
> +		}
> +		fwnode_handle_put(node);
> +
>  		node = fwnode_graph_get_remote_port_parent(ep);
>  		if (!fwnode_device_is_available(node)) {
>  			fwnode_handle_put(node);

-- 
Kind regards,

Sakari Ailus
