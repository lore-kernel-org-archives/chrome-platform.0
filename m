Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3FD629
	for <chrome-platform@lists.linux.dev>; Tue, 24 May 2022 01:28:22 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id b5so7536635plx.10
        for <chrome-platform@lists.linux.dev>; Mon, 23 May 2022 18:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sRdkO9LWoK6gu3O6tCs/6pS6ffPvexve2L+r8+1P1Mc=;
        b=MR+QpekimCNHYVTg/y19FR/jbueG7WKak0RbDHffuGp91Uu9dUwWWsmwhZ1meXGDtH
         u96NPpxkfqqQl5rlTbk9qVerNPjsyG9j0sJWbLBUm0UrNi5iSS27bDVBJBtRnksauOTm
         K2hHqUZxln7S7HaaFH4vuNV38c4PL0lmy598DMZ3PA42tZNTn+ohVcPS2Wng03+EtV5A
         5AEEnVEKtMSacNFdvAkti8NswhlkJtJwDSv+0ASp9KafpHpHfZh0MHqzubbWuvwAkcNq
         tIy3FFCadANe4AiIpFQ4pjtAU5GV6U/NKOFLxtoe2VAXi14HvlCoKysEDynD/GE/ei3h
         r8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sRdkO9LWoK6gu3O6tCs/6pS6ffPvexve2L+r8+1P1Mc=;
        b=6Tlj8QyoxSv8oDbf6bMYZTJccLBEuYV4Jd40M0/Yn5WY058vEMU0Ncp04RcxDBQLeN
         D8qk0x08qH1EOoqztSf5hsDVfaRCZhNb0aIKYAfyBeBk7Mbnx4GN4i0lI0fuph0j8tQV
         v3gR8jH7QobyoXYhKuf8YXAFYSzauhCIRaZlsjneH1hia9oNKxu9Fni7DPS2FjisrFn4
         2Wl7HoZ612GGTTkSqfc1S6o05WFsGVnDFgwheO27MoahbtpDeoCdFD0T1srZ37unYLkw
         454hKjbZaeBrxuz4Gxkop/e55GZx7sVsu33Geb1/u3NwQr7UuTIsppCT13G8u7Q5DA2p
         nu8A==
X-Gm-Message-State: AOAM531otK2NNsUS9DtX1j3Wjc8xwqRNTxym6Md0IvyrDZHZQ3Vc3Fv8
	R/lI0QyXhWJLFcOcZkgwdfrQOqSbdWrLwr1IyR9Z2A==
X-Google-Smtp-Source: ABdhPJwD5caICs9kSETeFxAO9el0xMpeE855aAndFiUT36QQ7C+udGQBDWOTuISOgzhnsjSfpzdkzCz5zj3ruW6lPKo=
X-Received: by 2002:a17:903:40d2:b0:161:a2d9:3230 with SMTP id
 t18-20020a17090340d200b00161a2d93230mr25125435pld.57.1653355701583; Mon, 23
 May 2022 18:28:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220523090822.3035189-1-tzungbi@kernel.org> <165335341249.17704.13803710194044994542.git-patchwork-notify@kernel.org>
In-Reply-To: <165335341249.17704.13803710194044994542.git-patchwork-notify@kernel.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Tue, 24 May 2022 09:28:10 +0800
Message-ID: <CA+Px+wU_pbmWOmB9wSOOWCHqsBAGVHy3w6ya_6fj4d0+VtTmBA@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] platform/chrome: cros_kbd_led_backlight: add EC
 PWM backend
To: patchwork-bot+chrome-platform@kernel.org
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, bleung@chromium.org, groeck@chromium.org, 
	robh+dt@kernel.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, mka@chromium.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, May 24, 2022 at 8:50 AM
<patchwork-bot+chrome-platform@kernel.org> wrote:
>
> Hello:
>
> This series was applied to chrome-platform/linux.git (for-kernelci)
> by Tzung-Bi Shih <tzungbi@kernel.org>:
>
> On Mon, 23 May 2022 17:08:17 +0800 you wrote:
> > The series adds EC PWM as an backend option for ChromeOS keyboard LED
> > backlight.
> >
> > The 1st patch reorder the headers alphabetically.
> >
> > The 2nd patch separates the ACPI backend.
> >
> > [...]
>
> Here is the summary with links:
>   - [v4,1/5] platform/chrome: cros_kbd_led_backlight: sort headers alphabetically
>     https://git.kernel.org/chrome-platform/c/a4da30150ab4
>   - [v4,2/5] platform/chrome: cros_kbd_led_backlight: separate ACPI backend
>     (no matching commit)
>   - [v4,3/5] dt-bindings: add google,cros-kbd-led-backlight
>     (no matching commit)
>   - [v4,4/5] platform/chrome: cros_kbd_led_backlight: support OF match
>     (no matching commit)
>   - [v4,5/5] platform/chrome: cros_kbd_led_backlight: support EC PWM backend
>     (no matching commit)

No.  They haven't all got R-b tags and one of the commits was pushed
mistakenly.  I have updated the for-kernelci branch again to fix it
up.
