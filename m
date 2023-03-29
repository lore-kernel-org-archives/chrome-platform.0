Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9FC63D2
	for <chrome-platform@lists.linux.dev>; Wed, 29 Mar 2023 18:10:41 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5445009c26bso308115847b3.8
        for <chrome-platform@lists.linux.dev>; Wed, 29 Mar 2023 11:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1680113440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s36Q4sLQX/3/tv2niFl6Gc9T++Xctk19QhnwqMt3BVM=;
        b=eDsYeqiG8GB4aZVHJzDU7byR1P1jPt7YE7V+7LrQkBjkHGKR65terpAGMEbNbrpWtc
         GbKOZDyCq7ZL/+Zsg31N3BVfxEvsJ1GDaWJFB38pSjVUW4/6WGSR96i/6pIpJUY1T9+N
         2W7sklR7qOx9HkWIJmhgVq8bUgKpEeVJ7TTmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680113440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s36Q4sLQX/3/tv2niFl6Gc9T++Xctk19QhnwqMt3BVM=;
        b=xhymA/ZvLlLcvXB/L8tUf7yPoCJzxUwxndVFsH9lzDZGoOVRh+fG04avYlf0BACgLM
         t8vK9kz1OEXm9jwRrglSoSKY6v7qjoa5nQOa147p4Bqfyy0QyXqAPEfDwtojskV/El94
         gImEut1x+0HqrFI9w/7EpiKHN+6gpmxunjBabibnRtll8o02uc1y1yvSRyqxASdQ1oK7
         e+UHa2UlGfd54IE+tnJ8h0vWBmvbt41ujz5WQTyW2w6SAa3L2KRdA9Xb/y2dZoxG9QDF
         BJQPItee8/5BMey+yTH7EdsdMfp08tN1PfGVI8J/lSQD8lzIt5JClWBDf3ki/nYTlXuc
         rA2g==
X-Gm-Message-State: AAQBX9fbzrJts5E9cepBHbGxwZfCZZv9hmLPwpmN2EsXwTpKdRLbRo3p
	M9eWf/HanymMcpbBp59RGvz5ueVCAB1K32ZtoN+lHQ==
X-Google-Smtp-Source: AKy350bTV90Nmmdqq5XdDMT52Ufu5ut5fzXMHi+iq0KHhNlusnr1XWTmvpO5LoXs+iXfO3xl7HbVrgeRFLebGR+jpH0=
X-Received: by 2002:a81:ac46:0:b0:544:6828:3c09 with SMTP id
 z6-20020a81ac46000000b0054468283c09mr10157919ywj.0.1680113440045; Wed, 29 Mar
 2023 11:10:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230218111712.2380225-1-treapking@chromium.org>
In-Reply-To: <20230218111712.2380225-1-treapking@chromium.org>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 29 Mar 2023 23:40:28 +0530
Message-ID: <CAMty3ZD3SY-WCtYK0dexdLxCk8d+2tJ=D9xb5uR06jPGCd=56g@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Add generic-display-mux driver and bindings
To: Pin-yen Lin <treapking@chromium.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Benson Leung <bleung@chromium.org>, 
	chrome-platform@lists.linux.dev, Nicolas Boichat <drinkcat@chromium.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Guenter Roeck <groeck@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 18, 2023 at 4:47=E2=80=AFPM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> This series is developed for and tested on MT8173 board, and the layout i=
s:
>
>                                   /-- anx7688
> -- MT8173 HDMI bridge -- GPIO mux
>                                   \-- native HDMI

What is the part number of this GPIO mux? Does mux gpio interrupt
based and able to switch output HDMI and DP. If so, how this gpio
interrupt is different than the HPD in native HDMI? I mean does HPD
have any detection bottlenecks with mux gpio interrupt?

I do have GPIO Mux that input DSI and two outputs DMD/HDMI Input and
HDMI Out. 2x1 with 1x2 mux.

I'm thinking having a generic mux to select the specific out number of
outputs with associated interface outputs can be a viable solution to
address all use cases here.

Thanks,
Jagan.
