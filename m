Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EBB4432
	for <chrome-platform@lists.linux.dev>; Thu, 20 Apr 2023 09:10:57 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7606ce9bfdeso77304539f.0
        for <chrome-platform@lists.linux.dev>; Thu, 20 Apr 2023 02:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681981857; x=1684573857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jApLsIPicCWYWY8ghJs6Wqkso3cOUL2m8oysLKQNPCs=;
        b=Ur9jtx0E94T0GI9XNaXArOQcj0se42481pOZjFlLPL+HB5Lj3VQ0Skl82gG5KPW/re
         V0XDWaTSQ6C8cKi+Hx/1+6fYNfQIAmbBMmPo9Tx61XMp6Lk4cMhypk7IL0R+08PSOOT6
         fulCTs04wVatbGLIdZn0FIjfOxwjNWV2iKIEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681981857; x=1684573857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jApLsIPicCWYWY8ghJs6Wqkso3cOUL2m8oysLKQNPCs=;
        b=hoGuXMV2CKiXLD/z3anjpjY+UvkI9H3H2SjFl7MkG6qS9+AVBmdVLG2AkzVXh4+Ihx
         cpznPhj9UItRgKtGUlwcdT3C9yrtvPog1n8UiGP1ftS4/QtZb5ZrleJWbf1efo6rducS
         7SFCtBGYQjzyvONOThdp940Gsd1r19ZagRmmksdnHJK0cskYuwDo0gqH8lKLg0lzlQpX
         19fRAuUSeXn3QRFMtLcO/uK7EksCk2SL3uQSbkgtGZ5ACr6biGHi8ihFIm0bEB2N9Pam
         EOsMB5ZXuVbMxm1tzBimCxA4IHDYYIh/dlKmjT4WIfSA87YP9wHuIW6EMqu/qV5s0vc7
         mPJQ==
X-Gm-Message-State: AAQBX9edA5lubzhVXuBtdRiJhG8eRlbNY4nF7GBp+K8AK/p5+KHPGJI/
	ZN8MOyuT+JCDKLGuukt8T6sL5DY4mPFj38UPgyNOZQ==
X-Google-Smtp-Source: AKy350Y4t++JqRfXaFXQUgB02uSAJYZVXkFSdgGLBxELTeSwXAZpeLFbnln9lKU9ujIzGQATjnMs8vmkMD8DbLkGgsY=
X-Received: by 2002:a02:b019:0:b0:40f:910c:92d6 with SMTP id
 p25-20020a02b019000000b0040f910c92d6mr253400jah.6.1681981856946; Thu, 20 Apr
 2023 02:10:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230331091145.737305-1-treapking@chromium.org>
 <20230331091145.737305-5-treapking@chromium.org> <CAE-0n51E5foFWQAsA73662_5e6XP426wuUCVVmcS5UWwiYpDmw@mail.gmail.com>
 <CAEXTbpdcbB_z4ZGCGzc-cM74ECKyxekbroKCWFnhH8eR=4HmvA@mail.gmail.com>
 <CAE-0n50atfmr-bFh5XtTCm4WpSijJGSe0B5JP8ni7CCYk7Bs5A@mail.gmail.com> <CAE-0n51Qy-KDGHOCr4Smpebq1fCURqvJ2RJz6KAtVpv5e+DSGA@mail.gmail.com>
In-Reply-To: <CAE-0n51Qy-KDGHOCr4Smpebq1fCURqvJ2RJz6KAtVpv5e+DSGA@mail.gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Thu, 20 Apr 2023 17:10:46 +0800
Message-ID: <CAEXTbpeKe1dVHp9cauMN-9nQb35oJ-ZhdFV-8BiWzjjhWAy0Zg@mail.gmail.com>
Subject: Re: [PATCH v15 04/10] dt-bindings: display: bridge: anx7625: Add
 mode-switch support
To: Stephen Boyd <swboyd@chromium.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Benson Leung <bleung@chromium.org>, 
	Daniel Scally <djrscally@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <groeck@chromium.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Prashant Malani <pmalani@chromium.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Rob Herring <robh+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Xin Ji <xji@analogixsemi.com>, 
	Marek Vasut <marex@denx.de>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lyude Paul <lyude@redhat.com>, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-acpi@vger.kernel.org, chrome-platform@lists.linux.dev, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 20, 2023 at 2:10=E2=80=AFPM Stephen Boyd <swboyd@chromium.org> =
wrote:
>
> Quoting Stephen Boyd (2023-04-13 17:22:46)
> > Quoting Pin-yen Lin (2023-04-13 02:50:44)
> > >
> > > Actually the `mode-switch` property here is mainly because
> > > `fwnode_typec_mux_get`[1] and `typec_mux_match`[2] only return matche=
s
> > > when the property is present. I am not sure what side effects would b=
e
> > > if I remove the ID-matching condition in `typec_mux_match`, so I adde=
d
> > > the property here.
> > >
> > > Is it feasible to remove the `mode-switch` property here given the
> > > existing implementation of the Type-C framework?
> >
> > Omitting the mode-switch property would require changes to the type-c
> > framework.
> >
> > I'm wondering if we can have this anx driver register mode switches for
> > however many endpoints exist in the output port all the time when the
> > aux-bus node doesn't exist. Then the type-c framework can walk from the
> > usb-c-connector to each connected node looking for a device that is bot=
h
> > a drm_bridge and a mode-switch. When it finds that combination, it know=
s
> > that the mode-switch has been found. This hinges on the idea that a
> > device that would have the mode-switch property is a drm_bridge and
> > would register a mode-switch with the type-c framework.
> >
> > It may be a little complicated though, because we would only register
> > one drm_bridge for the input to this anx device. The type-c walking cod=
e
> > would need to look at the graph endpoint, and find the parent device to
> > see if it is a drm_bridge.
>
> I've been thinking more about this. I think we should only have the
> 'mode-switch' property possible when the USB input pins (port@2) are
> connected and the DPI input pins are connected (port@0). Probably you
> don't have that case though?

No we don't have the use case that uses the USB input pins on anx7625.
>
> In your case, this device should register either one or two drm_bridges
> that connect to whatever downstream is actually muxing the 2 DP lanes
> with the USB SS lanes onto the usb-c-connector.

What do you mean by "muxing the 2 DP lanes with the USB SS lanes''? In
our use case, the USB data lanes from both ports are connected to a
USB hub, but the DP lanes are muxed by the crosspoint switch on
anx7625. HPD and AUX for the external display are muxed by the EC. You
can find the diagram at
https://lore.kernel.org/linux-usb/YxGzk6DNAt0aCvIY@chromium.org/

> If that is the EC for
> ChromeOS, then the EC should have a binding that accepts some number of
> input ports for DP. The EC would act as a drm_bridge, or in this case
> probably two bridges, and also as two type-c switches for each
> drm_bridge corresponding to the usb-c-connector nodes. When DP is on the
> cable, the type-c switch/mux would signal to the drm_bridge that the
> display is 'connected' via DRM_BRIDGE_OP_DETECT and struct
> drm_bridge_funcs::detect(). Then the drm_bridge in this anx part would
> implement struct drm_bridge_funcs::atomic_enable() and configure the
> crosspoint switch the right way depending on the reg property of the
> output node in port@1.

So there will be two drm bridges that act as the downstreams for
anx7625, and we find the downstream with connector_status_connected to
configure the crosspoint switch? How do we support that kind of
topology given that the drm bridge chain is currently a list? Are you
suggesting making the bridge topology to a tree, or maintaining the
two downstreams inside the anx7625 driver and not attaching them to
the bridge chain?

Also, if we still register mode switches on the two downstream
bridges, why do you prefer that over the original approach that
register switches in the anx7625 driver?

>
> Because you don't have the part that implements the orientation-switch,
> you don't need to implement the code for it. I think simply adding
> support in the binding for mode-switch and orientation-switch if this is
> directly wired to a usb-c-connector should be sufficient. Those
> properties would be at the top-level and not part of the graph binding.
