Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641B82F41
	for <chrome-platform@lists.linux.dev>; Wed, 13 Apr 2022 20:44:30 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id c64so3856348edf.11
        for <chrome-platform@lists.linux.dev>; Wed, 13 Apr 2022 13:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9t746E0a3Zsh93FlmUmusMHEf6L1/F6+kRTi3ZPWd3U=;
        b=NpPyUcrQ7ZOjuUtydpO0p2toOxFON7X+5zw1Y63SEiUiNqQ4gztOMnnPJOXGMzYTSC
         5rYy7JDvRCd8Y15GeAIxAzAfXIgI7S33JA/ZAmDD9vgR0zHszTSDxGCrQWWaXRl9v8ue
         GqUiGQHi4etpqlM/9j3h0Rn+mq48g3srPc1X8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9t746E0a3Zsh93FlmUmusMHEf6L1/F6+kRTi3ZPWd3U=;
        b=IgXXjMRzh9NdIr1q6LxF0yflLOby+fm8xd8ijA3IcM3xN3fQVghXHpUwc41L81KXqE
         bzsDG3EocZlq0OCP6pHyJoq+Bg6Encw0pjSQ6pnqIhLJLv76jCxc/79AytTPRwDQigEJ
         oJuN7knJMcYfieHl/DzS4M1GEqaxaPQRoOyI7DhFSW6zD02G6Ns6KpDz+ZWS/vTuYgJH
         nmELdn6iBXSGPPQe1F0r+HHceSMYa9aAmsdc7rdU/qJtPQDOtVpVFMeA8CryJHYCqFFu
         Rt2N4ciAYYAxV8ThMJEToIIDVefI4AGPlXwPJvGO8A++VKIFA2a+IbwiELjvdcavkXCr
         fhFw==
X-Gm-Message-State: AOAM531b4sWPQJWYqBJcouU5x0WLqaCDy8COE+uljAw5rk0UJcq0WotM
	s8FQQfMp4TvFdRod0bUvwJPJ5xhYcoXFyw==
X-Google-Smtp-Source: ABdhPJx56m/xURQDdfJ5we1ZhuYMnYo2WHagfZ6mgZ/EBz4Dg6cFoVlIxL/Ew3fQ/xSNYGrJUzxfbA==
X-Received: by 2002:a05:6402:26c8:b0:419:2e54:9262 with SMTP id x8-20020a05640226c800b004192e549262mr45002191edd.61.1649882668458;
        Wed, 13 Apr 2022 13:44:28 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id x13-20020a05640226cd00b00420c275a484sm3973edd.83.2022.04.13.13.44.25
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 13:44:25 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id m14so4300920wrb.6
        for <chrome-platform@lists.linux.dev>; Wed, 13 Apr 2022 13:44:25 -0700 (PDT)
X-Received: by 2002:adf:c14d:0:b0:207:a28f:f5dd with SMTP id
 w13-20020adfc14d000000b00207a28ff5ddmr420309wre.679.1649882664627; Wed, 13
 Apr 2022 13:44:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220413033334.1514008-1-swboyd@chromium.org> <20220413033334.1514008-2-swboyd@chromium.org>
In-Reply-To: <20220413033334.1514008-2-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 13 Apr 2022 13:44:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ux8AmWpsphRL2waUSrp_Vioykn5WTui4UpzsGLr4fdcA@mail.gmail.com>
Message-ID: <CAD=FV=Ux8AmWpsphRL2waUSrp_Vioykn5WTui4UpzsGLr4fdcA@mail.gmail.com>
Subject: Re: [PATCH 1/2] Input: cros-ec-keyb: Only register keyboard if
 rows/columns exist
To: Stephen Boyd <swboyd@chromium.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, LKML <linux-kernel@vger.kernel.org>, 
	patches@lists.linux.dev, 
	"open list:HID CORE LAYER" <linux-input@vger.kernel.org>, chrome-platform@lists.linux.dev, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Hsin-Yi Wang <hsinyi@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, Apr 12, 2022 at 8:33 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> If the device is a detachable, we may still probe this device because
> there are some button switches, e.g. volume buttons and power buttons,
> registered by this driver. Let's allow the device node to be missing row
> and column device properties to indicate that the keyboard matrix
> shouldn't be registered. This removes an input device on Trogdor devices
> such as Wormdingler that don't have a matrix keyboard, but still have
> power and volume buttons. That helps userspace understand there isn't
> a keyboard present when the detachable keyboard is disconnected.
>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Hsin-Yi Wang <hsinyi@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>
> I tried to use mkbp info to query the number of rows and columns, but my
> EC firmware doesn't have commit 8505881ed0b9 ("mkbp: Separate MKBP_INFO
> host command from the keyboard driver") so it always returns 8 and 13
> for the rows and columns. Sigh. With updated firmware we could query it,
> or we could rely on DT like we do already.
>
> Originally I was setting the properties to 0, but
> matrix_keypad_parse_properties() spits out an error message in that case
> and so it seems better to delete the properties and check for their
> existence instead. Another alternative would be to change the compatible
> to be "google,cros-ec-keyb-switches" or something that indicates there
> are only switches and no matrix keyboard.
>
>  drivers/input/keyboard/cros_ec_keyb.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

I do wonder if there will be any unintentional side effects here.
Specifically, even though there is truly no keyboard here, I wonder if
anything in the system is relying on the EC to simulate keypresses
even on tablets where the keyboard isn't actually there...

OK, I guess not. While I think it _used_ to be the case that you could
simulate keyboard inputs from the EC console even for devices w/out a
keyboard, it doesn't seem to be the case anymore. I just tried it and
nothing made it through to the AP.

Seems reasonable to me:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
