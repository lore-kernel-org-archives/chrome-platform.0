Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0B05137
	for <chrome-platform@lists.linux.dev>; Fri, 18 Mar 2022 21:12:09 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id w127so10081934oig.10
        for <chrome-platform@lists.linux.dev>; Fri, 18 Mar 2022 14:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=n34Xs2LUJxel1XU83dIKxQOsnVS224E+z08R602YCdU=;
        b=EvQpHpyMC77rLLEvn9MpsqWL0o8A2T7VFQvNGpeLOEH0VGsDX41YNdLPSvHrSXoRo6
         8X7HcCJbTswjPPlHmbnBc/e+c/N9LwooWCRKufVh9wwI7lJkss7MWzi9Yb8zmdIuwAsO
         JCDIrfe5wxbXu5CDc1/0OP4wu/zSOG7Nsc7DY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=n34Xs2LUJxel1XU83dIKxQOsnVS224E+z08R602YCdU=;
        b=JSyt8ptW7hiGji5sNuiP87sY913dTW3vlcYxnCfoUHzfEOSPRilQn8NgK0jaZfFRSH
         JxVC3dZr/caJ2m0WI+mB7wT7IRkhXem9YQ7/IwFNDrLkcRYAtZo5NGym8cFnF8fFSWsd
         3H0LU9TjBbQxxyLXXyltJPErQSgcL2WV0hU9G5MHsXdntydaFYnPex0nNKzDXYDWZHUn
         TByTAESojSqQnUhzcqZr1V5YuUwFu17Eogdln/gA3tYbggURr4gRLpQMnKIqEgvWDHIe
         HD5ZavN/A3dHiD04/n4Kn3lxq2s7MTEc05XBc2aNhlOuJFa1GRJ/GfHztZckQsTOPY9O
         HHbQ==
X-Gm-Message-State: AOAM531zagZWSTX2XuQ1xgoRn3pX3VFU67L5ly9J72rzCO5bNRT6xad7
	n8ELqrylPAJIhNXePU+cufUFTtnJ3zpHmqta9skelg==
X-Google-Smtp-Source: ABdhPJw0zCFmhg5T+KaHMIkI9yocntmnv6XcFAgnwKNk6tLkUngfx+sEnsZubJNjXUqla/UYhwzVdjmiB7FhdH0czNU=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr5152331oif.63.1647637928460; Fri, 18
 Mar 2022 14:12:08 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Mar 2022 14:12:08 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAD=FV=WV+rssDpUdq0fVuVKf4b7DwTsFgodAX8wi-eLEoxTa3g@mail.gmail.com>
References: <20220318015451.2869388-1-swboyd@chromium.org> <20220318015451.2869388-2-swboyd@chromium.org>
 <CAD=FV=WV+rssDpUdq0fVuVKf4b7DwTsFgodAX8wi-eLEoxTa3g@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 18 Mar 2022 14:12:08 -0700
Message-ID: <CAE-0n52Cy3KKUQBuzMUE0+r7DfQKPAFRnYijQHmuA5safhw6mg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: chrome: Add ChromeOS fingerprint binding
To: Doug Anderson <dianders@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, LKML <linux-kernel@vger.kernel.org>, 
	chrome-platform@lists.linux.dev, Rob Herring <robh+dt@kernel.org>, 
	devicetree@vger.kernel.org, Guenter Roeck <groeck@chromium.org>, 
	Craig Hesling <hesling@chromium.org>, Tom Hughes <tomhughes@chromium.org>, 
	Alexandru M Stan <amstan@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Doug Anderson (2022-03-18 13:49:05)
> Hi,
>
> On Thu, Mar 17, 2022 at 6:54 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Add a binding to describe the fingerprint processor found on Chromebooks
> > with a fingerprint sensor.
>
> It might be worth mentioning that previously these fingerprint devices
> were described using "google,cros-ec-spi" just to provide context?

Sure I squashed it in.

>
>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: <devicetree@vger.kernel.org>
> > Cc: Guenter Roeck <groeck@chromium.org>
> > Cc: Douglas Anderson <dianders@chromium.org>
> > Cc: Craig Hesling <hesling@chromium.org>
> > Cc: Tom Hughes <tomhughes@chromium.org>
> > Cc: Alexandru M Stan <amstan@chromium.org>
> > Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> > Cc: Matthias Kaehlcke <mka@chromium.org>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >  .../bindings/chrome/google,cros-ec-fp.yaml    | 66 +++++++++++++++++++
> >  1 file changed, 66 insertions(+)
> >  create mode 100644 Documentation/
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
