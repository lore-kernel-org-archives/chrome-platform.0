Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E37729AA
	for <chrome-platform@lists.linux.dev>; Mon, 25 Apr 2022 20:12:51 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-e93ff05b23so4165418fac.9
        for <chrome-platform@lists.linux.dev>; Mon, 25 Apr 2022 13:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=4WsHbvMFtfCO4s6g5Z/Ba4D0j5zDJD/OJ+xdomCe93g=;
        b=hVNPteKE/AbRszScEp3f58YVOQPMhjkU/lwe3GRxf8FURBAz7mr/kqhv5rwGd/569q
         DfCG2jHhYTXKydBLGnL0gqjTREwgINkl+xqXsFBCzTaUh0buSs8+UD2QbjicOLYnJCJ/
         ruFc9xWlkwhPHeFUknrf0ycgg/fyOhbtZBjWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=4WsHbvMFtfCO4s6g5Z/Ba4D0j5zDJD/OJ+xdomCe93g=;
        b=kkJBO7YEXrMHimTnpVOY8kdzbBUmjQwLTKRvhu5Ah7nqb6fbxt9NB4nbNu3w+PmXvT
         QR8uZrvoCgQk5IP/LCs7PIicNtWPJXaAXc/ka50qrqe83UISLpB/eUgtZH4fMWnaPCDG
         VjvPpJomphvEZxYSpKoavaOKn53HSsoVU8u/qyRDD+Fgu73OaFnqECVruUmbw8FZgwLk
         cLoZuevZkB1N1415IAXkNDT7y45Yi21m2pcUbxZppqbuiY+HwX+n31F3R3GF83RiZe1i
         1DnBT81QW9E2aO2iXxEpuWVqoVYvMwbBJ81sHAk9QTpCjy82OQGjj1smetVBSggUVdYV
         9i7A==
X-Gm-Message-State: AOAM531VvYVtA6d6aqIhR2GrQa5724KXN4DjiXAWqfBCq7hmmqJr3OGf
	thOKtdqvj5cj9+MKDvE7FrbbnCM6zJnq1U9kC1rhEw==
X-Google-Smtp-Source: ABdhPJwBcUHuuofxNADsFoXO6XpSPVQwW4abM1ZYARF/lutQMaCVG6TzIX/8R3w7WDwoFpbGX/Ty2z56yD6GIPb2kMI=
X-Received: by 2002:a05:6870:15ca:b0:e9:551:6d1c with SMTP id
 k10-20020a05687015ca00b000e905516d1cmr6307596oad.193.1650917570622; Mon, 25
 Apr 2022 13:12:50 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 25 Apr 2022 13:12:50 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YmYZt7WQC17aE1fS@google.com>
References: <20220413033334.1514008-1-swboyd@chromium.org> <20220413033334.1514008-2-swboyd@chromium.org>
 <YmYZt7WQC17aE1fS@google.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 25 Apr 2022 13:12:50 -0700
Message-ID: <CAE-0n51NugMRXEruDdgpNBkBBowQ6NdZBGUrHs5sEBecrmd=Ww@mail.gmail.com>
Subject: Re: [PATCH 1/2] Input: cros-ec-keyb: Only register keyboard if
 rows/columns exist
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	linux-input@vger.kernel.org, chrome-platform@lists.linux.dev, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Douglas Anderson <dianders@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Dmitry Torokhov (2022-04-24 20:47:03)
> >
> > +     /*
> > +      * No rows and columns? There isn't a matrix but maybe there are
> > +      * switches to register in cros_ec_keyb_register_bs() because this is a
> > +      * detachable device.
> > +      */
> > +     if (!device_property_read_bool(dev, "keypad,num-rows") &&
> > +         !device_property_read_bool(dev, "keypad,num-cols"))
>
> Why are we abusing device_property_read_bool() for properties that are
> not flags instead of using device_property_present()?
>

Because I wrote this using DT APIs first and wasn't aware that
device_property_present() was a thing. I'll resend it with that API
usage.
