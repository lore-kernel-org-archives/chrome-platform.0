Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC6F2F25
	for <chrome-platform@lists.linux.dev>; Wed,  9 Feb 2022 09:05:07 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id y6so4053493ybc.5
        for <chrome-platform@lists.linux.dev>; Wed, 09 Feb 2022 01:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IPF0PjuZF19JidGX9B02b4KeSaFHazqRUzXT4U3ZGOo=;
        b=Q7RX2xsVwtzySD8bB3ppxCCCC35bwPle8mNdnUYSw6B7hTXWTmcu+xxx34B095S5GP
         gUZaBRcI22uTSfhknWNHyIpRmF71Szon+ZHRmIhk2qfsCP8r8iE1Ib5AvUXqPb8ANFv9
         6zzOrfnR2w//SA4hnga+TZXQ+k2WqDAYqaTgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IPF0PjuZF19JidGX9B02b4KeSaFHazqRUzXT4U3ZGOo=;
        b=XqKICOz2TIXDVuLDO1gnTw0yuz5ZOv7likgsNMduRDvPEeeWh9Qms8G2+529QMFpz0
         69gXCtaI+UhMiLl8X8x0qJM3Irw/EK6ouxtbPwDh6fM/ZmKGuGSDntWPhN/9CZ+TM0Wc
         31yGQhEgHh6McccdeEfI2cpbcol8H6e0jnbjYKr0SbzWhTUxwPPCOWnODj+wd4qz/xOP
         8RuA81ftFF9FfQzhWZBor4NARtGKc5yTbCeAKge+WDSOfInk1DlW+UX9gTDFbnDvnvcy
         JEDv4PAdL4oejoQqMAB8SRoYchVovJYCHzfdiEXRxcQ/d6NvYvQm2csv0iNhzrkunFvb
         kUyQ==
X-Gm-Message-State: AOAM5306udjlPf2mO7dUXYBTFCYY85L888s16cOy3v9nl59hGqCvtb3h
	uUqinB8FSsLhg/6Y/8KinrF1+5FsJ6kCKn/OHZYSag==
X-Google-Smtp-Source: ABdhPJzXzw01hWj9cS/+Efn3FknC2m6fGl1/vOpHEF2QbGtMrXYty9/sHmbp9NaeGCwEPm1kzf5WEwHA60h+EZhGeqQ=
X-Received: by 2002:a81:e245:: with SMTP id z5mr1106749ywl.282.1644397506236;
 Wed, 09 Feb 2022 01:05:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220208031242.227563-1-tzungbi@google.com> <YgLC8trl9L30Ofwn@google.com>
In-Reply-To: <YgLC8trl9L30Ofwn@google.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Wed, 9 Feb 2022 17:04:39 +0800
Message-ID: <CAFv8NwK2Bd-guWPE+Uub1x0zguPHZBxZALDmLiurthq-KJKgPg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update cros_ec_codec maintainers
To: Benson Leung <bleung@google.com>
Cc: Tzung-Bi Shih <tzungbi@google.com>, broonie@kernel.org, bleung@chromium.org, 
	alsa-devel@alsa-project.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 9, 2022 at 3:22 AM Benson Leung <bleung@google.com> wrote:
>
> Hi Tzung-Bi,
>
> On Tue, Feb 08, 2022 at 11:12:42AM +0800, Tzung-Bi Shih wrote:
> > Updates cros_ec_codec maintainers.
> >
> > Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
>
> Acked-By: Benson Leung <bleung@chromium.org>
Acked-By: Cheng-Yi Chiang <cychiang@chromium.org>

Thanks Tzungbi!
>
> > ---
> >  .../devicetree/bindings/sound/google,cros-ec-codec.yaml          | 1 +
> >  MAINTAINERS                                                      | 1 +
> >  2 files changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
> > index 77adbebed824..c3e9f3485449 100644
> > --- a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
> > +++ b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
> > @@ -8,6 +8,7 @@ title: Audio codec controlled by ChromeOS EC
> >
> >  maintainers:
> >    - Cheng-Yi Chiang <cychiang@chromium.org>
> > +  - Tzung-Bi Shih <tzungbi@google.com>
> >
> >  description: |
> >    Google's ChromeOS EC codec is a digital mic codec provided by the
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 568152aa9973..a1f4fd15e770 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -4573,6 +4573,7 @@ F:      drivers/platform/chrome/
> >
> >  CHROMEOS EC CODEC DRIVER
> >  M:   Cheng-Yi Chiang <cychiang@chromium.org>
> > +M:   Tzung-Bi Shih <tzungbi@google.com>
> >  R:   Guenter Roeck <groeck@chromium.org>
> >  L:   chrome-platform@lists.linux.dev
> >  S:   Maintained
> > --
> > 2.35.0.263.gb82422642f-goog
> >
>
> --
> Benson Leung
> Staff Software Engineer
> Chrome OS Kernel
> Google Inc.
> bleung@google.com
> Chromium OS Project
> bleung@chromium.org
