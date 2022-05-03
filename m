Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C22197
	for <chrome-platform@lists.linux.dev>; Tue,  3 May 2022 01:06:55 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id k23so30786846ejd.3
        for <chrome-platform@lists.linux.dev>; Mon, 02 May 2022 18:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+GS/UD7rTSn/SrbnLBVwvNdcnYAN1i32IbtuzZWmvMs=;
        b=GjPF8T0LFSfzHmDfzTyaQdTHc7/c7Au3dfdO9t7Jo7HNtVLIYTlK7boOyvbs8TaHWd
         u9Fc4NyJgxlRHYIObzxW3VHsk8uI5SiIRPIDVCqgNVN2nW1uFL7RyBgX5amGCEBX1Dqa
         wMPbnPQOsxEp8F4lvG7gMmlYdyq2+7Bca8HEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+GS/UD7rTSn/SrbnLBVwvNdcnYAN1i32IbtuzZWmvMs=;
        b=MRGJ6QstxP5glaw4bJJ4MkFrVhxI13Nv7E6FzqAnET1/Ia/rtOp5nG+gTPIye3V9V/
         NEjACCsyfn+C4o7T8RUVR3zbALe5wrPWxFPkPGYxdzsxO2FsV0NJG5zxN9qNNkk5nDri
         tVJt4AnsNY992dmoHnF/oSOEIRbNemaMyeNIU87v+xuyW9+cBUBrLTyCMzBhC45gkCeJ
         77NTBYLpqlE/F/M0s5Uqz8gcdLHZntRQQlQNz8N5XeWNY7b7ZlWyI2fnA0qjxwRH84Fc
         GoUzRSd3xaK+/EkI4n5LcYC3mN5moHtGFYQz+uX3zn0nFTHAnA7GM+qBkFwco5vMA2bF
         I9Dg==
X-Gm-Message-State: AOAM530tfo6Ju+S5ts5GIbm5tYHzT44D62ovH82VA1WxltEpP2PcQZhv
	mH+fGetnZUruVmfIHnqkt/5fukrdaxyBlhKT
X-Google-Smtp-Source: ABdhPJxiSGC1UM59mt+mWY/eLr79Uhaa/0S5kEHDE4RA+J1wdxFenUmA0JX9sFFUtsBTiMi7K2OMQg==
X-Received: by 2002:a17:907:7f8d:b0:6da:b3d6:a427 with SMTP id qk13-20020a1709077f8d00b006dab3d6a427mr13005186ejc.509.1651540013067;
        Mon, 02 May 2022 18:06:53 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id f12-20020a056402150c00b0042617ba638esm7236708edw.24.2022.05.02.18.06.51
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 18:06:51 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id e24so21453561wrc.9
        for <chrome-platform@lists.linux.dev>; Mon, 02 May 2022 18:06:51 -0700 (PDT)
X-Received: by 2002:a5d:6d09:0:b0:20c:53a9:cc30 with SMTP id
 e9-20020a5d6d09000000b0020c53a9cc30mr10094457wrq.513.1651540011049; Mon, 02
 May 2022 18:06:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220429233112.2851665-1-swboyd@chromium.org> <20220429233112.2851665-3-swboyd@chromium.org>
 <CAD=FV=WAbfe9BC5QPDezz3FSEwHRFdQeZpARJYT4b9V1rNp_nA@mail.gmail.com> <CAE-0n53x77n2ACuMYsFrdGhSkmO_4f8Uocnb+vKhcgoiY4RPQg@mail.gmail.com>
In-Reply-To: <CAE-0n53x77n2ACuMYsFrdGhSkmO_4f8Uocnb+vKhcgoiY4RPQg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 2 May 2022 18:06:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W5SeUNAiQi_h8LyUn+7EQG1Sf9N6Nq9HtVnQWqr0Ltsw@mail.gmail.com>
Message-ID: <CAD=FV=W5SeUNAiQi_h8LyUn+7EQG1Sf9N6Nq9HtVnQWqr0Ltsw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Input: cros-ec-keyb - skip keyboard registration
 for switches compatible
To: Stephen Boyd <swboyd@chromium.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, LKML <linux-kernel@vger.kernel.org>, 
	patches@lists.linux.dev, chrome-platform@lists.linux.dev, 
	Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	"Joseph S. Barrera III" <joebar@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, May 2, 2022 at 3:02 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Doug Anderson (2022-05-02 10:02:54)
> > On Fri, Apr 29, 2022 at 4:31 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > >
> > > diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
> > > index eef909e52e23..1bbe2987bf52 100644
> > > --- a/drivers/input/keyboard/cros_ec_keyb.c
> > > +++ b/drivers/input/keyboard/cros_ec_keyb.c
> > > @@ -536,6 +536,12 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
> > >         u32 *physmap;
> > >         u32 key_pos;
> > >         unsigned int row, col, scancode, n_physmap;
> > > +       bool register_keyboard;
> > > +
> > > +       /* Skip matrix registration if no keyboard */
> > > +       register_keyboard = device_get_match_data(dev);
> > > +       if (!register_keyboard)
> > > +               return 0;
> > >
> > >         /*
> > >          * No rows and columns? There isn't a matrix but maybe there are
> >
> > As per my comments in patch #1, I wonder if it makes sense to delete
> > the "No rows and columns?" logic and settle on the compatible as the
> > one true way to specify this.
> >
>
> Ok. My only concern is that means we have to check for both compatibles
> which is not really how DT compatible strings work. The compatible
> string usually finds the more specific compatible that is first in the
> list of compatibles in DT. You're essentially proposing that the
> switches compatible could be first or last, the order doesn't matter.

It's not quite what I was proposing. I think my summary really sums it up:

1. If you have a matrix keyboard and maybe also some buttons/switches
then use the compatible: google,cros-ec-keyb

2. If you only have buttons/switches but you want to be compatible
with the old driver in Linux that looked for the compatible
"google,cros-ec-keyb" and required the matrix properties, use the
compatible: "google,cros-ec-keyb-switches", "google,cros-ec-keyb"

3. If you have only buttons/switches and don't need compatibility with
old Linux drivers, use the compatible: "google,cros-ec-keyb-switches"

...but just to say it another way:

* If you have the compatible "google,cros-ec-keyb-switches" I mean to
say that you _only_ have switches and buttons. You'd _never_ have this
compatible string if you truly have a matrix keyboard. If you have
this, it will always be first.

* If you only have switches and buttons but you care about backward
compatibility then you can add a fallback compatible second:
"google,cros-ec-keyb"

* In order for the fallback compatible to be at all useful as a
fallback (it's only useful at all if you're on an old driver), if you
specify it you should pretend that you have matrix properties even
though you don't really have them, just like we used to do.

-Doug
