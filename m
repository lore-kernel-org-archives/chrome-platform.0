Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9E229CA
	for <chrome-platform@lists.linux.dev>; Tue,  1 Feb 2022 18:29:59 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id r65so53518245ybc.11
        for <chrome-platform@lists.linux.dev>; Tue, 01 Feb 2022 10:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=I7jVNfxfiR6L9cpor2lIeHYS68RLOhT6ui7FFhcZWz8=;
        b=DE+IbdQ63PDvuuuh9gJIWrSsywRKD8r77zIfVu8whigf/Ly1xuNWc66zIh1s30fhb5
         dJinz/fjR2Eno8I8Mm6DoNhea7xR51a5wbnq4XVYC2VAvphzzzIJVJKyIHlZ/VqTfE0e
         w8/+D7iv7bwBy4BKrKOGSoR3LxqqyLNZVFP+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=I7jVNfxfiR6L9cpor2lIeHYS68RLOhT6ui7FFhcZWz8=;
        b=ne4Bj8JgV0YCQj6bVgEnCWzzXNJ5KWJd7etOoXGi5+ky0cDaQmMRj1YfkGeHmWzqZM
         k/On+AHW9WAsGtwzwvHQoTdxSFa3pxvZuhwkkI3HCKXJOnFzzZIa9iTUl1KYr7HI53OR
         1wTF1cpE175TFYvpKNbw2Ahqkr/Hts2O7Acm4Vlo9aP16WJBHJYGT9V0f2r/0sf+dMyL
         2/xRWHlaGo5fdxFKahPwNyYcBkjiZeUU7JcXPb71EQNb7esb4d9yugtYg6wlJj2EIj1W
         UWNE/VRW1kQEWx+aSjqG+6b0malSWpBhJnxOS92ADpdH6KKwJgk++/McGxIM3tAVnnYe
         IYig==
X-Gm-Message-State: AOAM532P3jaGbZoLyH9hWOtGNq9Jd6gG3Br2nkCscdEEKYepUIOH/rHT
	+8r6Q26RESrjosB/L3Pa8jp6iJvWHb0hTZE3cpsrkg==
X-Google-Smtp-Source: ABdhPJwPxuDKdBHh2HvzjmJlvoYFjqoLZkyj4AU5NDzGKsornYRfx+d/FQCt96plRhZ/ajyaShJX1vAIstG2jAjhfXE=
X-Received: by 2002:a25:ad14:: with SMTP id y20mr28247979ybi.155.1643740198548;
 Tue, 01 Feb 2022 10:29:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220126190219.3095419-1-pmalani@chromium.org>
 <20220126230411.nn2illij4wbpdm4q@eve> <YfHUXtJPU77wtCPb@chromium.org> <20220201121745.r4dbilp3fpqhjuty@eve>
In-Reply-To: <20220201121745.r4dbilp3fpqhjuty@eve>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 1 Feb 2022 10:29:47 -0800
Message-ID: <CACeCKadF3Yn-DvE+fgVPDq84K0VO-L-5j8UxOEk3zZGpkDFixg@mail.gmail.com>
Subject: Re: [PATCH v2] platform/chrome: cros_ec_typec: Check for EC device
To: Alyssa Ross <hi@alyssa.is>
Cc: linux-kernel@vger.kernel.org, Tzung-Bi Shih <tzungbi@google.com>, 
	Benson Leung <bleung@chromium.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
	Guenter Roeck <groeck@chromium.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alyssa,

On Tue, Feb 1, 2022 at 4:17 AM Alyssa Ross <hi@alyssa.is> wrote:
>
> Hi Prashant,
>
> On Wed, Jan 26, 2022 at 11:08:14PM +0000, Prashant Malani wrote:
> > Hi Alyssa,
> >
> > On Jan 26 23:04, Alyssa Ross wrote:
> > > On Wed, Jan 26, 2022 at 07:02:20PM +0000, Prashant Malani wrote:
> > > > The Type C ACPI device on older Chromebooks is not generated correc=
tly
> > > > (since their EC firmware doesn't support the new commands required)=
. In
> > > > such cases, the crafted ACPI device doesn't have an EC parent, and =
it is
> > > > therefore not useful (it shouldn't be generated in the first place =
since
> > > > the EC firmware doesn't support any of the Type C commands).
> > > >
> > > > To handle devices which use these older firmware revisions, check f=
or
> > > > the parent EC device handle, and fail the probe if it's not found.
> > > >
> > > > Fixes: fdc6b21e2444 ("platform/chrome: Add Type C connector class d=
river")
> > > > Reported-by: Alyssa Ross <hi@alyssa.is>
> > > > Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> > > > Signed-off-by: Prashant Malani <pmalani@chromium.org>
> > > > ---
> > > > Hi Alyssa, could you kindly test this with your existing setup? Tha=
nks!
> > >
> > > Hi Prashant, I'm happy to test, but I'm on vacation until the end of =
the
> > > week so probably won't get a chance before Monday.
> >
> > No worries, whenever you get the chance is fine.
> >
> > >
> > > I'm guessing I should be testing with latest upstream coreboot (now t=
hat
> > > your fix there has been applied)?
> >
> > You should use the coreboot with which you discovered the crash, so the
> > one which *doesn't* contain the fix.
>
> I applied this patch to Linux 5.17-rc2 and tested with the
> coreboot_tiano-eve-mrchromebox-20210806.rom firmware.
>
> The Oops has been replaced with
> "cros-ec-typec: GOOG0014:00: couldn't find parent EC device".
> My laptop now reboots correctly =E2=80=94 the hang on reboot is gone.
>
> The cros_ec_typec driver ends up being loaded, but no devices are bound
> to it.  This differs from the behaviour with upstream coreboot
> (cabf9e33a7), where cros_ec_typec does not end up being loaded.
>
> Assuming all that's the intended behaviour:

Yep, that's WAI. Thanks a lot for testing this, and yes, we'll be sure
to reach out
for future help with validating changes.

Best regards,
