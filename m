Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570603209
	for <chrome-platform@lists.linux.dev>; Fri, 20 Jan 2023 21:15:42 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5018be4ae8eso27434357b3.4
        for <chrome-platform@lists.linux.dev>; Fri, 20 Jan 2023 13:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NcIIC1O7Zs3rEuEM0nyGO+WgzZl8Vikm1z2RFIGcKb0=;
        b=fhs5Iuj4i9tYiLtWZSoxdZ7lQeEEve400Bj1Vri0BU6rTFbqMbm9zOTpruHHGJiSv+
         45iwza4m7m6J/UZxVCr4lOZWhgR3egS25OP/hJ5DF5TxBJPR6a3YEs64lCSotn3bkRIl
         EpmHRQpEh50uuJCoQCzB/3vOLGZVErgkFlHxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NcIIC1O7Zs3rEuEM0nyGO+WgzZl8Vikm1z2RFIGcKb0=;
        b=hCinEPed9Pg2VgL6TZBTXJnK2RKfQiTkL+7DMXJEo1wPUwBbU0ENPOP3ciTRvJYkiW
         kMYoQVnPa0JjMnljooqDtFx7U4d14eA7PfnT5S1WvLPZZURsCCU1BulzHGiRCLohXsdu
         Yi79+/oGjajCnKc9Z1eJjwIOrsxEsNmc0l3UJHs83+Xw4e39m8qw4FqoyZQ/+ApQ4IM+
         tolCaaaKqskyad/Y2wXSsG2+0fYldfEvoEQ3amsP8nwuJoFMWyaef2HvG680UVnQXL/U
         wooNrgxmArMvbL/ELb41+4AEqXuRlNcf3Hp1dzyiXKTr+/fiFn36/4aPph/vHMYVLSz2
         QSbA==
X-Gm-Message-State: AFqh2kqjybfR+fJ52Owgi2ghM89CcOkvXCnwyPub9yB0Ee8OeeDlMajQ
	tQ0iDvObbpykMko/anQ2py6qYja7hzdVu35IM0ir/w==
X-Google-Smtp-Source: AMrXdXuzhv476FXH02ilyJSYLORoSx3+kBVAKevbSIn6Qmw3KTvOzqgdIKhThap2Fmmuhb9Bgf50pSjtYaxEVyXLlAg=
X-Received: by 2002:a0d:e8c9:0:b0:4e0:7220:22fd with SMTP id
 r192-20020a0de8c9000000b004e0722022fdmr2086808ywe.272.1674249341272; Fri, 20
 Jan 2023 13:15:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230112042104.4107253-1-treapking@chromium.org>
 <20230112042104.4107253-2-treapking@chromium.org> <Y8AL8nTcNcl6zX7H@paasikivi.fi.intel.com>
 <CACeCKaeN7KBi30M1fRWhTPgMbxF6=B+KuAS7Ny7+i9qCx+=49Q@mail.gmail.com> <Y8VL/+My+s/PkG9L@paasikivi.fi.intel.com>
In-Reply-To: <Y8VL/+My+s/PkG9L@paasikivi.fi.intel.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Fri, 20 Jan 2023 13:15:30 -0800
Message-ID: <CACeCKaeaQ+LHsnwdqtTA=O3Q=0dWz8_uNjXoNu5J_u4+HQLMsg@mail.gmail.com>
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

On Mon, Jan 16, 2023 at 5:07 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Prashant,
>
> On Thu, Jan 12, 2023 at 02:31:45PM -0800, Prashant Malani wrote:
> > HI Sakari,
> >
> > On Thu, Jan 12, 2023 at 5:32 AM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Pin-yen,
> > >
> > > On Thu, Jan 12, 2023 at 12:20:56PM +0800, Pin-yen Lin wrote:
> > > > From: Prashant Malani <pmalani@chromium.org>
> > > > +             /*
> > > > +              * Some drivers may register devices for endpoints. Check
> > > > +              * the remote-endpoints for matches in addition to the remote
> > > > +              * port parent.
> > > > +              */
> > > > +             node = fwnode_graph_get_remote_endpoint(ep);
> > > > +             if (fwnode_device_is_available(node)) {
> > > > +                     ret = match(node, con_id, data);
> > > > +                     if (ret) {
> > > > +                             if (matches)
> > > > +                                     matches[count] = ret;
> > > > +                             count++;
> > > > +                     }
> > > > +             }
> > >
> > > Aren't you missing fwnode_handle-put(node) here??
> >
> > It shouldn't be necessary. We aren't break-ing/continue-ing here,
> > and fwnode_handle_put(node) is called latter in the loop [1][2]
>
> It is, but node is overwritten just below this chunk --- before
> fwnode_handle_put() is called on it.

Ack. Thanks for pointing that out. My bad!

Pin-yen, please make this update when you send out a v11.

BR,

-Prashant
