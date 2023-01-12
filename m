Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905002F33
	for <chrome-platform@lists.linux.dev>; Thu, 12 Jan 2023 22:31:58 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id p188so20450794yba.5
        for <chrome-platform@lists.linux.dev>; Thu, 12 Jan 2023 14:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/C/ZRKjPzNTEZUCk+rnSkeE6htJTMyaRVi+BQ5BKJ+U=;
        b=JUPY63vtT6QcwqD9Ws2QE/pf7jC1/0su4w2j3d9Xn0NTdACzrFBjxjuFHWgpThUZws
         imdknTpaWEjV9uHtradW98A1u35lfMGg1dddhCwsBClQF94e0939KX7UTkXNgez4GIry
         JxaKGHbkQ7QWJVTYQ0VQgYI43iHND9qXIlcZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/C/ZRKjPzNTEZUCk+rnSkeE6htJTMyaRVi+BQ5BKJ+U=;
        b=4egUmO73BamCobhaMiAg0VsraNENYB/LqW5jga+qfTXGZbhOsSLpLeHdN7KhK+FgHD
         Mnqe+xxpKMn3Ckdfei7oJECf2maHoxsrH6zfjTh/0qcddgJerk+JoAgVyhglSFwsWHXb
         dHpYz59n+qtAFDhZVVolidU1Lzce+XtBq7mQaYPEztCgw81JeE+ukxcN6+2S2aPakUF3
         57h6jG0pPApqp+eQ9OCWim+5CruNyLRL99hkLM+8CMIKm8Mu9Ujs0mRRzsIZ7KAFCRbs
         dnVuCusOfGQZD1iDpf+JjldO2dBgo2gDyVL2sjTBnbm7wObIzn1arQ5A6hHFmhJy1fKo
         omqA==
X-Gm-Message-State: AFqh2kpDlZLM4rvipmbiIXL+rOoYS0svU7hzVSoBrPxf0KY80VxcfeYu
	CUVM752Ut0rFowKqJ42YsSyzTgChgc9GTBZKo55W1w==
X-Google-Smtp-Source: AMrXdXuznEwChU9VQQ72rYVGqmbsFrMqOVBPMbeBVwgDM2AWPc/3hytO7eUeE33HPvr9ax9Vk/LALEeTjlK/OvpNWf8=
X-Received: by 2002:a25:1083:0:b0:7ae:5e48:383b with SMTP id
 125-20020a251083000000b007ae5e48383bmr2843942ybq.223.1673562717561; Thu, 12
 Jan 2023 14:31:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230112042104.4107253-1-treapking@chromium.org>
 <20230112042104.4107253-2-treapking@chromium.org> <Y8AL8nTcNcl6zX7H@paasikivi.fi.intel.com>
In-Reply-To: <Y8AL8nTcNcl6zX7H@paasikivi.fi.intel.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Thu, 12 Jan 2023 14:31:45 -0800
Message-ID: <CACeCKaeN7KBi30M1fRWhTPgMbxF6=B+KuAS7Ny7+i9qCx+=49Q@mail.gmail.com>
Subject: Re: [PATCH v10 1/9] device property: Add remote endpoint to devcon matcher
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Pin-yen Lin <treapking@chromium.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <robert.foss@linaro.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Stephen Boyd <swboyd@chromium.org>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Marek Vasut <marex@denx.de>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, 
	Javier Martinez Canillas <javierm@redhat.com>, Lyude Paul <lyude@redhat.com>, chrome-platform@lists.linux.dev, 
	Xin Ji <xji@analogixsemi.com>, Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org, 
	Allen Chen <allen.chen@ite.com.tw>, linux-acpi@vger.kernel.org, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"

HI Sakari,

On Thu, Jan 12, 2023 at 5:32 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Pin-yen,
>
> On Thu, Jan 12, 2023 at 12:20:56PM +0800, Pin-yen Lin wrote:
> > From: Prashant Malani <pmalani@chromium.org>
> > +             /*
> > +              * Some drivers may register devices for endpoints. Check
> > +              * the remote-endpoints for matches in addition to the remote
> > +              * port parent.
> > +              */
> > +             node = fwnode_graph_get_remote_endpoint(ep);
> > +             if (fwnode_device_is_available(node)) {
> > +                     ret = match(node, con_id, data);
> > +                     if (ret) {
> > +                             if (matches)
> > +                                     matches[count] = ret;
> > +                             count++;
> > +                     }
> > +             }
>
> Aren't you missing fwnode_handle-put(node) here??

It shouldn't be necessary. We aren't break-ing/continue-ing here,
and fwnode_handle_put(node) is called latter in the loop [1][2]

BR,

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/base/property.c#n1256
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/base/property.c#n1261
