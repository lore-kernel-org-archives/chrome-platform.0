Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABF17F
	for <chrome-platform@lists.linux.dev>; Tue,  3 May 2022 02:18:15 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id r8so16997176oib.5
        for <chrome-platform@lists.linux.dev>; Mon, 02 May 2022 19:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=laGkwi2JMs5cKXNdFPiuyuaZlbZLsdgpAHyD6QKor6E=;
        b=jEi963cY0xSdF6MSjXXJz/sx7W/ReDryUgIFdwijSV6cirSdAl0OISyAOGKPQvvYLS
         VDDd/DogiFDG4NWFJBaqKvRacbPPQrQGSjdnQC6xIoVSplCgt6eysx3zeYAvOfRMr337
         7t4wjETW0dbuPRAqA4bNaP8sKag+zRo2ceatk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=laGkwi2JMs5cKXNdFPiuyuaZlbZLsdgpAHyD6QKor6E=;
        b=z+Z5N3JI4qmXRgAATMzDdBxD/1we60Hs594WQ/ifVhFVG63OwoBVvBR/8C0B+VLgwD
         hyO04O8uHsLIOHFIlr/nKfKXD4u0K7eUtkZQBc3ra4WD+tcTG6snKF5KuIK/7OpjgBK1
         8qqEAWRdkUzSK36tuhJPm9v09qmXxhXoUEEjDeA6HcElGq9WOYP65XWexHp5lOf8tj0X
         j6vG6yFwg+DDzeLn7xaL2fEFHCrlgLnH+dTvjpucWrYt0w7aUz4LJn3Aru8+Mha8dgeC
         nDtXBeSu9u/OLwTBVxhzHKprh2vR972RVJMIM3OLsXwAEEEy9eV30XvDkR0nw+pInGhb
         97Nw==
X-Gm-Message-State: AOAM530FG+Sj/xiAFDg4ZIOZL43GYj0ifQo/Op+8fbu0gDAGwAnKSlsF
	wU45jy1NTwekDaKrgm/Bvi4DGhTRWw4F4cTM5g+eHg==
X-Google-Smtp-Source: ABdhPJwgxF7e7OaUmsTN9DQ1tI6Tga8Ca0OfGo5t/zHKneNAjjo8vRB3fW9fyLwGOXW1Tc/9OrGCxyOtKdMftc7cQn0=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr977960oif.63.1651544294289; Mon, 02 May
 2022 19:18:14 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 May 2022 19:18:13 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAD=FV=W5SeUNAiQi_h8LyUn+7EQG1Sf9N6Nq9HtVnQWqr0Ltsw@mail.gmail.com>
References: <20220429233112.2851665-1-swboyd@chromium.org> <20220429233112.2851665-3-swboyd@chromium.org>
 <CAD=FV=WAbfe9BC5QPDezz3FSEwHRFdQeZpARJYT4b9V1rNp_nA@mail.gmail.com>
 <CAE-0n53x77n2ACuMYsFrdGhSkmO_4f8Uocnb+vKhcgoiY4RPQg@mail.gmail.com> <CAD=FV=W5SeUNAiQi_h8LyUn+7EQG1Sf9N6Nq9HtVnQWqr0Ltsw@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 2 May 2022 19:18:13 -0700
Message-ID: <CAE-0n50jO8Kj1d4g-2JVQpAhJ1bjy3RM5sajDs92bz=sO1g=zg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Input: cros-ec-keyb - skip keyboard registration
 for switches compatible
To: Doug Anderson <dianders@chromium.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, LKML <linux-kernel@vger.kernel.org>, 
	patches@lists.linux.dev, chrome-platform@lists.linux.dev, 
	Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, "Joseph S. Barrera III" <joebar@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Doug Anderson (2022-05-02 18:06:39)
> Hi,
>
> On Mon, May 2, 2022 at 3:02 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Doug Anderson (2022-05-02 10:02:54)
> > > On Fri, Apr 29, 2022 at 4:31 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > > >
> > > >
> > > > diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
> > > > index eef909e52e23..1bbe2987bf52 100644
> > > > --- a/drivers/input/keyboard/cros_ec_keyb.c
> > > > +++ b/drivers/input/keyboard/cros_ec_keyb.c
> > > > @@ -536,6 +536,12 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
> > > >         u32 *physmap;
> > > >         u32 key_pos;
> > > >         unsigned int row, col, scancode, n_physmap;
> > > > +       bool register_keyboard;
> > > > +
> > > > +       /* Skip matrix registration if no keyboard */
> > > > +       register_keyboard = device_get_match_data(dev);
> > > > +       if (!register_keyboard)
> > > > +               return 0;
> > > >
> > > >         /*
> > > >          * No rows and columns? There isn't a matrix but maybe there are
> > >
> > > As per my comments in patch #1, I wonder if it makes sense to delete
> > > the "No rows and columns?" logic and settle on the compatible as the
> > > one true way to specify this.
> > >
> >
> > Ok. My only concern is that means we have to check for both compatibles
> > which is not really how DT compatible strings work. The compatible
> > string usually finds the more specific compatible that is first in the
> > list of compatibles in DT. You're essentially proposing that the
> > switches compatible could be first or last, the order doesn't matter.
>
> It's not quite what I was proposing. I think my summary really sums it up:

Alright, I'm glad I misunderstood.

>
> 1. If you have a matrix keyboard and maybe also some buttons/switches
> then use the compatible: google,cros-ec-keyb
>
> 2. If you only have buttons/switches but you want to be compatible
> with the old driver in Linux that looked for the compatible
> "google,cros-ec-keyb" and required the matrix properties, use the
> compatible: "google,cros-ec-keyb-switches", "google,cros-ec-keyb"
>
> 3. If you have only buttons/switches and don't need compatibility with
> old Linux drivers, use the compatible: "google,cros-ec-keyb-switches"
>
> ...but just to say it another way:
>
> * If you have the compatible "google,cros-ec-keyb-switches" I mean to
> say that you _only_ have switches and buttons. You'd _never_ have this
> compatible string if you truly have a matrix keyboard. If you have
> this, it will always be first.
>
> * If you only have switches and buttons but you care about backward
> compatibility then you can add a fallback compatible second:
> "google,cros-ec-keyb"
>
> * In order for the fallback compatible to be at all useful as a
> fallback (it's only useful at all if you're on an old driver), if you
> specify it you should pretend that you have matrix properties even
> though you don't really have them, just like we used to do.
>

Another important point is that the matrix properties are willfully
ignored by the new driver if the "google,cros-ec-keyb-switches"
compatible is present. Maybe it should be "google,cros-ec-no-keyb" to
describe the true intent, i.e. ignore the keyboard properties. Or
"google,cros-ec-keyboardless". I think it's confusing that I put
"switches" in the compatible. It really should be about not registering
the keyboard input device.

Anyway, I agree that we don't need to use the matrix keyboard properties
to figure out what to do. In fact, it isn't possible to remove the
properties if "google,cros-ec-keyb" is present, so checking for them is
redundant.
