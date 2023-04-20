Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B26C23A3
	for <chrome-platform@lists.linux.dev>; Thu, 20 Apr 2023 06:10:53 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id h4so1596243ljb.2
        for <chrome-platform@lists.linux.dev>; Wed, 19 Apr 2023 23:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681971051; x=1684563051;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cNPBzX6Y4DzEXkxrIsPy5WXkjPdEdrZU6Sa+8uyinhQ=;
        b=T6LFJAc7v8GrrcO2kqA4STxSTFczF6e9f/FFkoTN386zEbafQ9OeBNDHhzAj0y4B5y
         mjd4LqgBkN/Apo4JcK8bye9Edyo0Gu+PlOi/enVL4YyxQh4xdjTYDNPZJFb3GYxQ8Bf8
         CVvxKkEvnNo9DJ02bKZUUmN9AY23CoqMNkrT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681971051; x=1684563051;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNPBzX6Y4DzEXkxrIsPy5WXkjPdEdrZU6Sa+8uyinhQ=;
        b=NvJ4HU2igdR4YfNT9xXSMLTqhkJ4tCaGmNKLT4h3rKX27Sx+8L7X3u+yt4GpnvaiJN
         KxkD9xplnkMwhyTtO2c+HZBUjh1fscacF8ZwutNJchwjksoSR4jd+JPjVbue1MaG9taR
         DFeuJhk4kStSYxKuPdP0OHRkYeXXEx1MTTnzyYIR5HR8800buRyERGDHdsetqPJjrUjM
         txQOV0ugWiOAx026cWyfVzVpPz4tGPdR+DxPxJR98w2OWnzrHJp92iD5Dx3+whGT4Euj
         UhK4eHIHGOj00SQQm8dG7viCNI0Xra+qnb9FJrVMpZFXFrVmPhld4xoNYyqcsMysVYL6
         pmjA==
X-Gm-Message-State: AAQBX9fnY2kfhSJglZAzzgjUJCOCp3S8E8alt1BQ3AYs9/MEZOFMcKi9
	e/B6b7MsuXpCzZnHHxlA+vkm/z6f/JejWeNY5mjUZg==
X-Google-Smtp-Source: AKy350Ydm+ji1Zz5gF+5t9+VddXM85teKkwpvpc0TGbgwOoQH/RjUhZIpMjhSmt4c7794yXFCLb7VjgGzoZF/T4iQuA=
X-Received: by 2002:a2e:9051:0:b0:2a8:e4d3:11de with SMTP id
 n17-20020a2e9051000000b002a8e4d311demr105767ljg.20.1681971051475; Wed, 19 Apr
 2023 23:10:51 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 19 Apr 2023 23:10:50 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAE-0n50atfmr-bFh5XtTCm4WpSijJGSe0B5JP8ni7CCYk7Bs5A@mail.gmail.com>
References: <20230331091145.737305-1-treapking@chromium.org>
 <20230331091145.737305-5-treapking@chromium.org> <CAE-0n51E5foFWQAsA73662_5e6XP426wuUCVVmcS5UWwiYpDmw@mail.gmail.com>
 <CAEXTbpdcbB_z4ZGCGzc-cM74ECKyxekbroKCWFnhH8eR=4HmvA@mail.gmail.com> <CAE-0n50atfmr-bFh5XtTCm4WpSijJGSe0B5JP8ni7CCYk7Bs5A@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 19 Apr 2023 23:10:50 -0700
Message-ID: <CAE-0n51Qy-KDGHOCr4Smpebq1fCURqvJ2RJz6KAtVpv5e+DSGA@mail.gmail.com>
Subject: Re: [PATCH v15 04/10] dt-bindings: display: bridge: anx7625: Add
 mode-switch support
To: Pin-yen Lin <treapking@chromium.org>
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

Quoting Stephen Boyd (2023-04-13 17:22:46)
> Quoting Pin-yen Lin (2023-04-13 02:50:44)
> >
> > Actually the `mode-switch` property here is mainly because
> > `fwnode_typec_mux_get`[1] and `typec_mux_match`[2] only return matches
> > when the property is present. I am not sure what side effects would be
> > if I remove the ID-matching condition in `typec_mux_match`, so I added
> > the property here.
> >
> > Is it feasible to remove the `mode-switch` property here given the
> > existing implementation of the Type-C framework?
>
> Omitting the mode-switch property would require changes to the type-c
> framework.
>
> I'm wondering if we can have this anx driver register mode switches for
> however many endpoints exist in the output port all the time when the
> aux-bus node doesn't exist. Then the type-c framework can walk from the
> usb-c-connector to each connected node looking for a device that is both
> a drm_bridge and a mode-switch. When it finds that combination, it knows
> that the mode-switch has been found. This hinges on the idea that a
> device that would have the mode-switch property is a drm_bridge and
> would register a mode-switch with the type-c framework.
>
> It may be a little complicated though, because we would only register
> one drm_bridge for the input to this anx device. The type-c walking code
> would need to look at the graph endpoint, and find the parent device to
> see if it is a drm_bridge.

I've been thinking more about this. I think we should only have the
'mode-switch' property possible when the USB input pins (port@2) are
connected and the DPI input pins are connected (port@0). Probably you
don't have that case though?

In your case, this device should register either one or two drm_bridges
that connect to whatever downstream is actually muxing the 2 DP lanes
with the USB SS lanes onto the usb-c-connector. If that is the EC for
ChromeOS, then the EC should have a binding that accepts some number of
input ports for DP. The EC would act as a drm_bridge, or in this case
probably two bridges, and also as two type-c switches for each
drm_bridge corresponding to the usb-c-connector nodes. When DP is on the
cable, the type-c switch/mux would signal to the drm_bridge that the
display is 'connected' via DRM_BRIDGE_OP_DETECT and struct
drm_bridge_funcs::detect(). Then the drm_bridge in this anx part would
implement struct drm_bridge_funcs::atomic_enable() and configure the
crosspoint switch the right way depending on the reg property of the
output node in port@1.

Because you don't have the part that implements the orientation-switch,
you don't need to implement the code for it. I think simply adding
support in the binding for mode-switch and orientation-switch if this is
directly wired to a usb-c-connector should be sufficient. Those
properties would be at the top-level and not part of the graph binding.
