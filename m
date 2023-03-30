Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF1BC2CC
	for <chrome-platform@lists.linux.dev>; Thu, 30 Mar 2023 04:11:30 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id e12so12948150uaa.3
        for <chrome-platform@lists.linux.dev>; Wed, 29 Mar 2023 21:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680149489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DlqWzaTFeXNF93oCsw3CKOaZb2BdZ8J89dsRkm+g8nE=;
        b=Jwl8XnBNPHXUrgPWG3nOY/ScmyoA1qdPjqbybFRGhnJG73H8ZIYdkEMyoOxUKr4jy0
         RAMQZs8WujJX7IOJFjv2jXyqqRhX7ZHdmLOsQKgvSc6dI3y8AWEMMyZQKBu+6FM90Hu9
         LeUEchBHwB35VJfRrd9cNQUME4vv23vwGtN+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680149489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DlqWzaTFeXNF93oCsw3CKOaZb2BdZ8J89dsRkm+g8nE=;
        b=LFnP6WHVaPvJd0am6BVYGFC7tviDolLm+0mqWfIGp43Sf/LcR0PK9YoTfBSqR+LV2m
         oQQamfhaF3bgBNV4jYLiB9j8mBoY9SwI+d1SNXNaSd65GUvkRTCsfMKny7oEs0SR1zlQ
         ndJ4sYkLkUqbQLj1OWfH7BwUBwvEKcTrfwtl5o01RDu1XsVfFEMloofmE7j2lMmu+Q3s
         TGtxB9YR2w9CP4LnF7NuWmJJgc2DTKry7eIcDN82q9n1Bm4aMVbqq7qJmL+gM+S+L5nz
         GhC3fFTXmR45b0aJg+G68a+4Mz+hhYLnRcN7ouGgLcJ1lc3DseGlJGJJR0GP0dss+5cY
         wa9A==
X-Gm-Message-State: AAQBX9cakZGym6buOeGCOxyuTtvAwAHe+H9dZJFEcpFYIjkyuaXL7kWy
	RGRC//qVueBoGoEAwAr3ZIDDXa6fCJFSUinYWrNUJw==
X-Google-Smtp-Source: AKy350aOTSTGLpyThgFsYnGIfmpFWfK++5W92pNG1SY5fkfAr3BAjmNQvMlKt6sE5LGDBzYjwJbAbGBsSvz5yHx1Zxk=
X-Received: by 2002:ab0:3d9e:0:b0:764:793a:6618 with SMTP id
 l30-20020ab03d9e000000b00764793a6618mr14789585uac.1.1680149489280; Wed, 29
 Mar 2023 21:11:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230218111712.2380225-1-treapking@chromium.org> <CAMty3ZD3SY-WCtYK0dexdLxCk8d+2tJ=D9xb5uR06jPGCd=56g@mail.gmail.com>
In-Reply-To: <CAMty3ZD3SY-WCtYK0dexdLxCk8d+2tJ=D9xb5uR06jPGCd=56g@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 30 Mar 2023 12:11:18 +0800
Message-ID: <CAGXv+5HFP-1SFFBsUneyVT-42b3_6BPtQ-CkULmUT6v0pUoLbA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Add generic-display-mux driver and bindings
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Pin-yen Lin <treapking@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Nicolas Boichat <drinkcat@chromium.org>, Robert Foss <rfoss@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jonas Karlman <jonas@kwiboo.se>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	linux-mediatek@lists.infradead.org, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, chrome-platform@lists.linux.dev, 
	Guenter Roeck <groeck@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 30, 2023 at 2:10=E2=80=AFAM Jagan Teki <jagan@amarulasolutions.=
com> wrote:
>
> On Sat, Feb 18, 2023 at 4:47=E2=80=AFPM Pin-yen Lin <treapking@chromium.o=
rg> wrote:
> >
> > This series is developed for and tested on MT8173 board, and the layout=
 is:
> >
> >                                   /-- anx7688
> > -- MT8173 HDMI bridge -- GPIO mux
> >                                   \-- native HDMI
>
> What is the part number of this GPIO mux? Does mux gpio interrupt
> based and able to switch output HDMI and DP. If so, how this gpio
> interrupt is different than the HPD in native HDMI? I mean does HPD
> have any detection bottlenecks with mux gpio interrupt?

It's a full blown HDMI 1:2 demultiplexer, so DDC and HPD signals are muxed
as well. The anx7688 handles all the Type-C stuff, and our EC talks to it.
If HDMI output from the SoC needs to be muxed over for DP alt-mode, the EC
will signal the SoC.

> I do have GPIO Mux that input DSI and two outputs DMD/HDMI Input and
> HDMI Out. 2x1 with 1x2 mux.
>
> I'm thinking having a generic mux to select the specific out number of
> outputs with associated interface outputs can be a viable solution to
> address all use cases here.

AFAIK DRM doesn't allow dynamically changing the constitution of a display
pipeline, so it doesn't really work out for us.

If you're just muxing between different outputs with passive/dumb bridges,
it may still work for you.

ChenYu
