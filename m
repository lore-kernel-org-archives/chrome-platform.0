Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF321369
	for <chrome-platform@lists.linux.dev>; Tue, 19 Apr 2022 14:58:57 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id f17so31467919ybj.10
        for <chrome-platform@lists.linux.dev>; Tue, 19 Apr 2022 07:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XG8kQ+XIcj/kxQkqKlX6Of1DGaCLk+DsEI9aRIpWeLs=;
        b=Oy9TvaCS/0qIZZ8t1TL2LJxxehNvhY1VAoqRcmRrlCdVK69gizdMFSGDeZiX0xLCOf
         2KcC7dEOo6dIqoY7Z3aCU/K+5ky2qwleELsn/kkkKEgDhWUXVGKy6Nq3RKuutKo2UkCM
         vP4RFdEK7kzA6azj/1KzhyiPNPwQ1YXsTxuq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XG8kQ+XIcj/kxQkqKlX6Of1DGaCLk+DsEI9aRIpWeLs=;
        b=7mX6V1TIhtVS4UlCDqOAJEXIbina7DOkMxm7cJNBKEqGlVdR/1w0XSHXAaixqFjKbK
         EJG/RFXYqvnE6edUJhm2FoMW7Zy2iyUiLUh1rh0v9jHoO1yOYU+kkGOSprQiNg5kLFeY
         axrz/kO5Mpd1mAp74EqXH65TxMNAMCXUIPo5ZbqUusQQ+lQOGoDrfZwMjxI3WMEv4eL5
         eXuThacdwGDg6COQPf72rOxq4ycAuFIRSBmbxjQdHIqsn78Qd0USmRklXOvJlcNmQAY5
         BL58c9lesUuJUtU8IOKpzkpJCZwUIElvQlryjvmAlmVKgTajTduoKTv+M/pZ4KKihA5m
         HkFA==
X-Gm-Message-State: AOAM531iUiA9dhRmhieDdhKJYI8papTWJ7d+Eqoi2Jm8thRWqGzcgec4
	dK6oPvFyGapHY9ie4CWJtEDlGZ315uiFC0uBFTur0A==
X-Google-Smtp-Source: ABdhPJyvxzwabX5yi+4hLlFDW7j672aGNtFoJ1IdyVEymCiqxg7DCHw1Bd0ZglILn50oMoTJO2soBbS5WmSx/OFgbVs=
X-Received: by 2002:a25:3258:0:b0:641:d47c:8321 with SMTP id
 y85-20020a253258000000b00641d47c8321mr15399843yby.294.1650380337072; Tue, 19
 Apr 2022 07:58:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220419000408.3202635-1-swboyd@chromium.org> <Yl4Au/O/am/ZbX9J@chromium.org>
 <CAE-0n507D9W5BFfG2vXqN1cqvnrQKLbLw7YejGb5_kH+7X62sw@mail.gmail.com>
In-Reply-To: <CAE-0n507D9W5BFfG2vXqN1cqvnrQKLbLw7YejGb5_kH+7X62sw@mail.gmail.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 19 Apr 2022 07:58:46 -0700
Message-ID: <CACeCKac83uiwdAf2RWqc9DxEft2+BSBn5Kp5PMR23UGKJyk5KQ@mail.gmail.com>
Subject: Re: [PATCH v2] mfd: cros_ec_dev: Only register PCHG device if present
To: Stephen Boyd <swboyd@chromium.org>
Cc: Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Daisuke Nojiri <dnojiri@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 19, 2022 at 7:55 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Prashant Malani (2022-04-18 17:22:19)
> > On Apr 18 17:04, Stephen Boyd wrote:
> > > +             retval = mfd_add_hotplug_devices(ec->dev,
> > > +                                     cros_ec_pchg_cells,
> > > +                                     ARRAY_SIZE(cros_ec_pchg_cells));
> > > +             if (retval)
> > > +                     dev_warn(ec->dev, "failed to add pchg: %d\n",
> > > +                              retval);
> > Tiny nit: Can this fit in 1 line (100 chars[1])?
> >
>
> I'm matching the style of other lines in this file (this is copy
> pasta). I'll let the maintainer decide what to do.

Quite a bit of that code predates the char limit update, but OK.
