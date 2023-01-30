Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C899C160
	for <chrome-platform@lists.linux.dev>; Mon, 30 Jan 2023 23:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675120238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p+K8e/zfLN4jZoxJoefnBbSYk/h9sMX4+P4UDlH6in4=;
	b=H91EZjtd+lk6Jju/7S+zG6ONG2LSQ5dKnNvpNeb0plDB/cOEGUcn/qRtzjYSx7nDgVptGl
	Yd8LE9ElO768DUrnCfnZbdn2DYAIBwoNV+JpjwzbrNNqcMIUqwmemtRXAj1vDLYJCkpX0M
	diN0QVoDSsMYdrQUkbLFU6Xd/MKNLGE=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-345-9A9jsourMreNMN3oGmRd9w-1; Mon, 30 Jan 2023 18:10:36 -0500
X-MC-Unique: 9A9jsourMreNMN3oGmRd9w-1
Received: by mail-qt1-f197.google.com with SMTP id cr22-20020a05622a429600b003b694a9f291so5733977qtb.1
        for <chrome-platform@lists.linux.dev>; Mon, 30 Jan 2023 15:10:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p+K8e/zfLN4jZoxJoefnBbSYk/h9sMX4+P4UDlH6in4=;
        b=SFYFMduJTo+rJcJGigd6aUd1rnXfwqgq4gxh4hamcEzUgWZlszl3IUozPrAYiBC9CY
         jB9oSNPNh/doGUv+4S1fxybDU5sapwkk4IMEwU0EWoYg5dWM8x70ixxDR+rTfJ13FIYt
         s/+vIF1qyMyaEWd4Q3GMXW0MNYOwiVHTN3kXntH5/6AaRqCMXwNUlpxXY8eBkdM1bdBZ
         OHVy3hW1oQXAvVexBgTRmHuI0u7krhgST1hWNIJ8yN5fEpbO1mxrB+b/k//17w8xyAZG
         n9ghWP26p9zSTI5BEXQYY3cz9OOQUzoL5vvuI5ZyYlhy0pAFmlfq/JZWDhw3PHVLUv94
         aItw==
X-Gm-Message-State: AO0yUKWTCHynHY8H2DAy5M2J3jSsA3o4SGjdb6hubFl1z1meOCe98nQI
	K2uXOat413YqU3TNgjZ6StMOLfqJleGndqt6ZXOUGGTgDs8/OfDukpzTospm0QskqYvZ8Bm9sJs
	OiKR2L7PwnCQH2iOXcojRkjzD7NTQ
X-Received: by 2002:a05:622a:180e:b0:3b4:2b61:da32 with SMTP id t14-20020a05622a180e00b003b42b61da32mr15365923qtc.59.1675120235970;
        Mon, 30 Jan 2023 15:10:35 -0800 (PST)
X-Google-Smtp-Source: AK7set89917aaMWXfx8H2M6z2jsMBTb17FVp8nR3WX9yHmkqkhPUzBHVr8SFkLh0Wpt7DzxdggBhnA==
X-Received: by 2002:a05:622a:180e:b0:3b4:2b61:da32 with SMTP id t14-20020a05622a180e00b003b42b61da32mr15365872qtc.59.1675120235657;
        Mon, 30 Jan 2023 15:10:35 -0800 (PST)
Received: from ?IPv6:2600:4040:5c68:6800::feb? ([2600:4040:5c68:6800::feb])
        by smtp.gmail.com with ESMTPSA id k22-20020a05620a139600b0071f17af8733sm2954494qki.64.2023.01.30.15.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 15:10:35 -0800 (PST)
Message-ID: <e620862840bcac9dcd46dd63e247966424af060f.camel@redhat.com>
Subject: Re: [PATCH v9 0/9] Register Type-C mode-switch in DP bridge
 endpoints
From: Lyude Paul <lyude@redhat.com>
To: Pin-yen Lin <treapking@chromium.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <robert.foss@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Prashant Malani <pmalani@chromium.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, dri-devel@lists.freedesktop.org, 
 Marek Vasut <marex@denx.de>, Stephen Boyd <swboyd@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Xin
 Ji <xji@analogixsemi.com>,  linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org,  chrome-platform@lists.linux.dev, Thomas
 Zimmermann <tzimmermann@suse.de>,  Allen Chen <allen.chen@ite.com.tw>,
 Javier Martinez Canillas <javierm@redhat.com>,  =?ISO-8859-1?Q?N=EDcolas?=
 "F . R . A . Prado" <nfraprado@collabora.com>,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Imre Deak <imre.deak@intel.com>, Jani Nikula <jani.nikula@intel.com>, Jim
 Cromie <jim.cromie@gmail.com>, Kees Cook <keescook@chromium.org>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Ville
 =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Mon, 30 Jan 2023 18:10:33 -0500
In-Reply-To: <20230109084101.265664-1-treapking@chromium.org>
References: <20230109084101.265664-1-treapking@chromium.org>
Organization: Red Hat Inc.
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Don't know if this still needs reviews from me (feel free to respond if it
does!), but I wanted to say nice work! This is something I've wanted to see
added to DRM for a while =E2=99=A5


On Mon, 2023-01-09 at 16:40 +0800, Pin-yen Lin wrote:
> This series introduces bindings for anx7625/it6505 to register Type-C
> mode-switch in their output endpoints, and use data-lanes property to
> describe the pin connections.
>=20
> The first two patch modifies fwnode_graph_devcon_matches and
> cros_typec_init_ports to enable the registration of the switches.
>=20
> Patch 4~6 introduce the bindings for anx7625 and the corresponding driver
> modifications.
>=20
> Patch 7~9 add similar bindings and driver changes for it6505.
>=20
> v7: https://lore.kernel.org/all/20230105132457.4125372-1-treapking@chromi=
um.org/
> v6: https://lore.kernel.org/all/20221124102056.393220-1-treapking@chromiu=
m.org/
> v5: https://lore.kernel.org/linux-usb/20220622173605.1168416-1-pmalani@ch=
romium.org/
>=20
> Changes in v9:
> - Collected Reviewed-by tag
> - Fixed subject prefix again
> - Changed the naming of the example node for it6505
>=20
> Changes in v8:
> - Fixed the build issue when CONFIG_TYPEC=3Dm
> - Fixed some style issues
> - Fixed the subject prefixes for the bindings patch
> - Fixed the bindings for data-lanes properties
>=20
> Changes in v7:
> - Fix the long comment lines
> - Extracted the common codes to a helper function
> - Fixed style issues in anx7625 driver
> - Removed DT property validation in anx7625 driver.
> - Fixed style issues in it6505 driver
> - Removed the redundant sleep in it6505 driver
> - Removed DT property validation in it6505 driver
> - Rebased to drm-misc-next
> - Fixed indentations in bindings patches
> - Added a new patch to fix indentations in Kconfig
>=20
> Changes in v6:
> - Changed it6505_typec_mux_set callback function to accommodate with
>   the latest drm-misc patches
> - Changed the driver implementation to accommodate with the new binding
> - Dropped typec-switch binding and use endpoints and data-lanes propertie=
s
>   to describe the pin connections
> - Added new patches (patch 1,2,4) to fix probing issues
> - Changed the bindings of it6505/anx7625 and modified the drivers
>   accordingly
> - Merged it6505/anx7625 driver changes into a single patch
>=20
> Pin-yen Lin (7):
>   drm/display: Add Type-C switch helpers
>   dt-bindings: display: bridge: anx7625: Add mode-switch support
>   drm/bridge: anx7625: Check for Type-C during panel registration
>   drm/bridge: anx7625: Register Type C mode switches
>   dt-bindings: display: bridge: it6505: Add mode-switch support
>   drm/bridge: it6505: Fix Kconfig indentation
>   drm/bridge: it6505: Register Type C mode switches
>=20
> Prashant Malani (2):
>   device property: Add remote endpoint to devcon matcher
>   platform/chrome: cros_ec_typec: Purge blocking switch devlinks
>=20
>  .../display/bridge/analogix,anx7625.yaml      |  99 ++++++++++++-
>  .../bindings/display/bridge/ite,it6505.yaml   |  93 ++++++++++--
>  drivers/base/property.c                       |  15 ++
>  drivers/gpu/drm/bridge/Kconfig                |  21 +--
>  drivers/gpu/drm/bridge/analogix/Kconfig       |   1 +
>  drivers/gpu/drm/bridge/analogix/anx7625.c     | 101 +++++++++++++-
>  drivers/gpu/drm/bridge/analogix/anx7625.h     |  13 ++
>  drivers/gpu/drm/bridge/ite-it6505.c           | 119 +++++++++++++++-
>  drivers/gpu/drm/display/drm_dp_helper.c       | 132 ++++++++++++++++++
>  drivers/platform/chrome/cros_ec_typec.c       |  10 ++
>  include/drm/display/drm_dp_helper.h           |  16 +++
>  11 files changed, 591 insertions(+), 29 deletions(-)
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

