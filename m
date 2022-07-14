Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3EC6035
	for <chrome-platform@lists.linux.dev>; Thu, 14 Jul 2022 23:33:31 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id e69so5899783ybh.2
        for <chrome-platform@lists.linux.dev>; Thu, 14 Jul 2022 16:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MsubRRKvtCvadBkw96fGeeoDLGGa+ZYhx93FS0ltR/w=;
        b=YvP8snpox2PWYptEwSl8ESwv+ZgXeFv4nLXFKppj9+dpUFX4rNfGFLgC01KC601zFa
         y+Twc5L9b2BcH4RXMv8NPmHkOsB/ZrDM7JqwUa2nFZHxZncB+PRZNaXOaWDbKFkA0NGR
         TfWI4WNLDs5wDhRkg/kje3SepMY7lCRvi9Q6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MsubRRKvtCvadBkw96fGeeoDLGGa+ZYhx93FS0ltR/w=;
        b=eYc09ZEodv0qcJo2TQA0ruia2y5Cy14JWgCTUzrXD0+ZP/g/jXvmo8ATP8nnwUYjg6
         8ALQoHwMV/xO9yP52Ev1KVXeCK/2lGx9pNrXGOnzrsMk1FNm8iV+3HUDkB0JpgxtokhX
         XSM2cWE6h6DUbMLcstp82a3C4QX8TIHdjkmpd1uv4Ny7RFUMWBD/1lFeP/ynTkk2db/w
         77IPfM/LnZPfWeB9CNq9J6q0NNYb0pNQPaf7JzhzblPlhPcjMiiTOXlw/Kopg7GkS5b9
         imq1ErOXVsYU/CiOW37oGr8bK7ntTB49hdmmRgSL5r/YhtYGiGrg9WhKJ9Qbo+zNT/FM
         yjDw==
X-Gm-Message-State: AJIora+UzgJSqb/33JfhViKUVzdOuPr/MUn03fp7wIQRx9ZcFW6NqhAX
	/aFmOkvh9EXs3ocpvVJ0iJyGqCWd8Auz3vh8CZbBQw==
X-Google-Smtp-Source: AGRyM1vqqsxFwTXVXspgL8oYku3WBLf9OeC8nVz3gPHoLorwgfbUZF5B9XSgQ50NtnwQVC6nk/r/qvZLoTfmXBkKJhw=
X-Received: by 2002:a25:6913:0:b0:66e:3700:4235 with SMTP id
 e19-20020a256913000000b0066e37004235mr11796546ybc.240.1657841610409; Thu, 14
 Jul 2022 16:33:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220706205136.v2.1.Ic7a7c81f880ab31533652e0928aa6e687bb268b5@changeid>
 <CACeCKadV=k5J1ZSG+p8M5iBnX5nXrn-XnK62Nq_op2kJ68+-9w@mail.gmail.com>
 <CANkg5ewRc5zhBtxLhazo8Wsfa3Srj32AwZD9mD=W=Qqpqi7zJQ@mail.gmail.com>
 <CACeCKaer_hacWmLDDMJSK-KFjxqiXV8S1-ydCWGT3mkQVeN-rg@mail.gmail.com> <CANkg5exPZH7LXV93SbAbNPsX2M-kE1yHqDhfk-cB0ywS15pOPQ@mail.gmail.com>
In-Reply-To: <CANkg5exPZH7LXV93SbAbNPsX2M-kE1yHqDhfk-cB0ywS15pOPQ@mail.gmail.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Thu, 14 Jul 2022 16:33:19 -0700
Message-ID: <CACeCKafvVATzEqOnkT3-QPyfaTV8baHNKbLy8069-K+P+RPeMg@mail.gmail.com>
Subject: Re: [PATCH v2] platform/chrome: cros_ec: Send host event for prepare/complete
To: Tim Van Patten <timvp@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>, rrangel@chromium.org, 
	robbarnes@google.com, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 14, 2022 at 3:17 PM Tim Van Patten <timvp@google.com> wrote:
>
> Hi,
>
> > Calling such a theoretical new EC host command from the userspace power manager
> > would probably accomplish the same thing.
>
> We investigated something like that internally initially:
> https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/3646238)
>
> We decided to take this simpler approach instead, since it
> accomplishes the same goal without requiring new host commands.

- That link discusses updating the existing host command and the EC
implementations;
have you investigated adding a command for logging needs and calling it from
power_manager/powerd directly?
- That link addresses several busses (UART, SPI etc.) whereas this patch only
touches LPC. Is this intentional?

>
> > From the kernel documentation[2], "The prepare phase is meant to
> > prevent races by preventing new devices from being registered; the PM core
> > would never know that all the children of a device had been suspended if new
> > children could be registered at will." and "The method may also prepare the
> > device or driver in some way for the upcoming system power transition, but
> > it should not put the device into a low-power state."
> >
> > So it seems like an incorrect usage of this callback.
>
> Why is this usage incorrect?
>
> Sending the message to the EC is the preparation for the AP to enter
> the system power transition. For example, it allows the EC to begin
> watchdogging the AP once the suspend begins and stop once the resume
> completes. This allows the EC to watchdog the entire process, without
> any gaps - a beneficial side effect of this change.

OK. Is that all it does? Does this not allow the EC itself to enter a
deep sleep state,
or put connected peripherals and/or state machines in a low power state??

If you're still set on this approach, please update the function names;
setting the .prepare()/.complete() function pointers to
cros_ec_lpc_suspend/resume()
is inconsistent, if those functions aren't being used elsewhere in the file.

BR,

-Prashant
