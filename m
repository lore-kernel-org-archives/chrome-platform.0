Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9E163A7
	for <chrome-platform@lists.linux.dev>; Thu,  9 Mar 2023 10:22:00 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id j8so781932ilf.4
        for <chrome-platform@lists.linux.dev>; Thu, 09 Mar 2023 02:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678357319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Ah1TtdVxfPgfmW7zrYGGBKwFiIK5NMV4NPzf8pIYnM=;
        b=B72T8/xcJkjQz7mlADugAXF75gmsMItZFaKG06Dg/eKa38XtjEmB5TesT6Tgp6ASVa
         y7A4CQ+1SKnIFvNYlOo3PnP0nSTd+8rsz+m7vcdsxyqsxg5jUheyJ7M22oT4FGRUwJFe
         UlqCyzjG+7geAfz15PsLpJSOKheBGW/Vk39Kc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678357319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Ah1TtdVxfPgfmW7zrYGGBKwFiIK5NMV4NPzf8pIYnM=;
        b=bbWofvjXdZWF7vuLL4GdDY3fQUe6rT4XwN4xFH6KVYYqJbntXsnYgW0LyJ5eSOOQ2t
         9sycXKBc+81OjLzxfWwsI+G7HUAsC+X1pHMBcpGEG4DL5iEN9CuUjEIgZwhEAuPM3Mot
         rhs2/AF1o7AxArqpJwpiFuFrSdE42eD4PDlBjgUDp3/pzy8l5ZcWw0HoZ/7rLGNlvAHN
         QExqgKHSaQ7W3vkxB4XWQfl+XZgTeMYJz4b+seeoEquEbHQppEshVhvljJDzfUzAFaKN
         1KYfWrVYvzc43gg3yCgQUsyt0S+UgoHTCS23Alsd6Ku8XFSpOTLXlkoF/EZnKsAZAPLl
         gHPQ==
X-Gm-Message-State: AO0yUKUFaToZSXtfL6oADSSnn1n7Bk9G6wjQKRSq6v/b85nvfNFp7DBw
	4GKjjg8NGFnKwMcEnwtDF2L7LFPSpwePq23rYQkHSg==
X-Google-Smtp-Source: AK7set/8LE04Zm+2ShiPru3Ucvo7TBxa+dRVhoQ8TlB/lSr0SCiXxU6ZSWYbEzWNlrck7ayKIPUPGHnsRZrsJ3nY8As=
X-Received: by 2002:a92:b512:0:b0:30f:543d:e52c with SMTP id
 f18-20020a92b512000000b0030f543de52cmr10301852ile.2.1678357319507; Thu, 09
 Mar 2023 02:21:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230303143350.815623-1-treapking@chromium.org>
 <20230303143350.815623-11-treapking@chromium.org> <ZAXWbkq4oLfrWUR7@smile.fi.intel.com>
 <CAEXTbpe=e1iA7cnzuTtcsyFxpG37YCWSK_SqZb2A8hxcyCnJBg@mail.gmail.com> <ZAiqPIm6O1JCPF7f@smile.fi.intel.com>
In-Reply-To: <ZAiqPIm6O1JCPF7f@smile.fi.intel.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Thu, 9 Mar 2023 18:21:48 +0800
Message-ID: <CAEXTbpcQAJ1HiF0eGbBFzFU2K-K7vnEEyqGtqJFHbUOxWGG3iA@mail.gmail.com>
Subject: Re: [PATCH v13 10/10] drm/bridge: it6505: Register Type C mode switches
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Prashant Malani <pmalani@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Xin Ji <xji@analogixsemi.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, Lyude Paul <lyude@redhat.com>, linux-kernel@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, chrome-platform@lists.linux.dev, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Marek Vasut <marex@denx.de>, Hsin-Yi Wang <hsinyi@chromium.org>, devicetree@vger.kernel.org, 
	Allen Chen <allen.chen@ite.com.tw>, dri-devel@lists.freedesktop.org, 
	Thomas Zimmermann <tzimmermann@suse.de>, Stephen Boyd <swboyd@chromium.org>, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Wed, Mar 8, 2023 at 11:31=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Mar 08, 2023 at 09:51:19PM +0800, Pin-yen Lin wrote:
> > On Mon, Mar 6, 2023 at 8:03=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Fri, Mar 03, 2023 at 10:33:50PM +0800, Pin-yen Lin wrote:
>
> ...
>
> > > > +             it6505->port_data[i].lane_swap =3D (dp_lanes[0] / 2 =
=3D=3D 1);
> > >
> > > ' % 2 =3D=3D 0' ?
> > >
> > Per another patch, I'll update this into `< 2`
>
> But here it should be >=3D 2 then, no?
>
Yes it should be >=3D 2 here. I wasn't really using my brain when I
replied to the mail....
> --
> With Best Regards,
> Andy Shevchenko
>
>
Best regards,
Pin-yen
