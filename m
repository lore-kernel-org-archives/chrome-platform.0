Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027B833D2
	for <chrome-platform@lists.linux.dev>; Tue,  3 May 2022 19:40:27 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id h29so24766959lfj.2
        for <chrome-platform@lists.linux.dev>; Tue, 03 May 2022 12:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=PpcOEiHsSXEXVeVpcZFgM2SND6CCz4/z5LeJtfm4WzU=;
        b=JdhHrL0tSQx+VnBMXyJMkfaRUySUx/ACO57L/wJDoQ6hulsCVqtglcHHgih4Q3kmWB
         3CWzf46Zy1MeOKLYeZzswIF+wEnjJBRPpE3pmZ2QhPHij539PYuP5KlSOKO4sB25qGnI
         Nb9EjW+AFVgg4jiksSHD0Uox8x4081Yibnv+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=PpcOEiHsSXEXVeVpcZFgM2SND6CCz4/z5LeJtfm4WzU=;
        b=icVTq6pF5DKC+dmwrGJX4gMa7Myz3arSi2NJHzlPEo5ha4S3gXIekQWLqVvBvOhh6V
         w4nKj5YResi2JCUkXmrLsCqqcb8Ud6LdIglSJRDL5E2JqoEx9n68Ky8VTJaS3kp4zF1n
         hQ0xXdxoMgdCnwroaMP01qTrPlDZbd9cf+NhoDpHrauxAyP7N1lBqqnmjuYc60ZhtcPe
         ibmXy7ccau/mEkYJFLg5XLH61+14NXo/Wg2exqQBBR1x0ExARQzMEVhvLLMMAga8vKZa
         e88KYPGT2KWBy2zHwrZUmoarHtuf/JqEuEImmhz8KfPmoJcXDsdsbvk2X+75vTZC/mnk
         HfOQ==
X-Gm-Message-State: AOAM531bbmCjzwNEq6zBp4Hoyur9I2aNfu+P9bXEUT5XukHr0vajTRdb
	uQDbL6zkO2FafirPv3Ry43Y6mY0NEh+g2kI1pm3b0Fpveqo=
X-Google-Smtp-Source: ABdhPJwZ7rKvRJvg+003hnWPuIibNwH4Vp3fTUxcsMHvkAcJNe7sssEHH+Dttxg/YTKAx2walPqk4DPnLgN+bztMLrU=
X-Received: by 2002:a19:ac42:0:b0:448:1f15:4b18 with SMTP id
 r2-20020a19ac42000000b004481f154b18mr12222327lfc.32.1651606825945; Tue, 03
 May 2022 12:40:25 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 3 May 2022 12:40:23 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAD=FV=V8kfRYidvQRmx_XmGm8X3XHR_GxTkKvxkqUHdqJ5CMNg@mail.gmail.com>
References: <20220503042242.3597561-1-swboyd@chromium.org> <20220503042242.3597561-2-swboyd@chromium.org>
 <CAD=FV=V8kfRYidvQRmx_XmGm8X3XHR_GxTkKvxkqUHdqJ5CMNg@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 3 May 2022 12:40:23 -0700
Message-ID: <CAE-0n53540_=76amOxOQ0YhutOUke+ZxSaTHCuyAHUGfAVkKKQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: google,cros-ec-keyb: Introduce
 switches only compatible
To: Doug Anderson <dianders@chromium.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, LKML <linux-kernel@vger.kernel.org>, 
	patches@lists.linux.dev, chrome-platform@lists.linux.dev, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, "Joseph S. Barrera III" <joebar@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Doug Anderson (2022-05-03 08:09:04)
> Hi,
>
> On Mon, May 2, 2022 at 9:22 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > @@ -113,3 +135,56 @@ examples:
> >              /* UP      LEFT    */
> >              0x070b0067 0x070c0069>;
> >      };
> > +
> > +  - |
> > +    keyboard-controller {
> > +        compatible = "google,cros-ec-keyb-switches", "google,cros-ec-keyb";
> > +        /* Matrix keymap properties are allowed but ignored */
>
> nit: s/allowed/required/

Ok. I will roll it in and resend.

>
> This now looks reasonable and well explained to me.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks.
