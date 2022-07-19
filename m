Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C865393
	for <chrome-platform@lists.linux.dev>; Tue, 19 Jul 2022 19:31:53 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id mf4so29123995ejc.3
        for <chrome-platform@lists.linux.dev>; Tue, 19 Jul 2022 12:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RAU//37IhkSd2RP/wWuWqS7ZhbqNjkZqDAj9Jtyjxa4=;
        b=ji9VZB/X3hbNV8q9nSl61V1uJbsSlXFiowQ+IgcJlPoy7x/ZkgYfb24lVXvXmhy9yu
         5NzaaEZUdK8B80C6oxUSxlLue9eLNWCy9txZe6eUf1wyUOBLnjijcNC0Bxbyvmnm4Vqf
         s4V6mmibLy2x7kolQ94j/XKL1vPbjJ7+ynTcHPseK48L+mKg6/H3OcYxjEaNv4LYMtGS
         GfbGskI3pF42oqw6TgclVpSYFNfDw6zhIIZiYuwbK2IFGrcUSoHnpj8b+J9Q63/cbdA8
         vimIP/SXYRNFF4Kgox9hrLIRi8OnC0iJjAqS6MD6sVlrApmyKxo/UFSzI6QJH+G8RCDr
         K44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RAU//37IhkSd2RP/wWuWqS7ZhbqNjkZqDAj9Jtyjxa4=;
        b=W38GDrp71KtNHbkGQAqbB0478JIa/yN0NzUpttDBxNyx6/smeSjGhQrxQ7FIXeCLMK
         JhA8leleo6qAu+xekS14uKxY3J220VQtqZ+N9kYIldfK34MA4owR0uHN2E9Tcrsq7HQg
         e41tqCVhlnq+RGbLM8ndWVKrIauhB0ewHqyrxoRYsYuvcb/b+9taktmcL/c9O7mSpX6G
         HKVzkKFWVY6Qsa8jvEVxy2NnDq0lhszsPovg9bKsrUxgv8oQdP515npvwW1ObfWw7TNA
         1HqWQbH3/vSzaJ8Tu7HsJaNDLPVgPb2Mhjwk4flMyn2wVsaiJRlxRW+R4ijezdDMmhjV
         fLDQ==
X-Gm-Message-State: AJIora/T/JNFGWGSueugObpMdrvIdG+mMD47bw66n/1aW53+aTXfcyj+
	PaqGI8rhI7URvcigqRssTAanMHUdWfWb+T4hjwE/7Q==
X-Google-Smtp-Source: AGRyM1uCskMut1g6IC9zHvM6uNkhvM+7YlQDg4xUxNPflA1/5PGzdLDxXoPK7pQiiaYChUzJQrkwam1AHGbhPdCH6uE=
X-Received: by 2002:a17:907:a06f:b0:72b:564c:465b with SMTP id
 ia15-20020a170907a06f00b0072b564c465bmr31572545ejc.344.1658259111567; Tue, 19
 Jul 2022 12:31:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220718105047.2356542-1-tzungbi@kernel.org> <CABXOdTdKpqsqajhQzQ1aEp6bsa96ONN6nz9EWZv6jGSuN0_LTA@mail.gmail.com>
 <YtY460lI465ne00L@google.com>
In-Reply-To: <YtY460lI465ne00L@google.com>
From: Guenter Roeck <groeck@google.com>
Date: Tue, 19 Jul 2022 12:31:40 -0700
Message-ID: <CABXOdTe_FMXGhuX_u8QQ=uDxiPwZ=Oo1Ehw4FqjH9m-N6M=GhQ@mail.gmail.com>
Subject: Re: [PATCH v2] platform/chrome: cros_kbd_led_backlight: fix build warning
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 18, 2022 at 9:54 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> On Mon, Jul 18, 2022 at 06:28:22AM -0700, Guenter Roeck wrote:
> > On Mon, Jul 18, 2022 at 3:51 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> > >
> > > drivers/platform/chrome/cros_kbd_led_backlight.c got a new build warning
> > > when using the randconfig in [1]:
> > > >>> warning: unused variable 'keyboard_led_drvdata_ec_pwm'
> > >
> > > The warning happens when CONFIG_CROS_EC is set but CONFIG_OF is not set.
> > > Reproduce:
> > > - mkdir build_dir
> > > - wget [1] -O build_dir/.config
> > > - COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 \
> > >   O=build_dir ARCH=s390 SHELL=/bin/bash drivers/platform/chrome/
> > >
> > > Fix the warning by using __maybe_unused.  Also use IS_ENABLED() because
> > > CROS_EC is a tristate.
> >
> > Is that sufficient ? What happens if CROS_KBD_LED_BACKLIGHT=y and
> > CROS_EC=m ? I suspect you might need IS_REACHABLE() instead of
> > IS_ENABLED().
>
> For current code, it's impossible to set CROS_KBD_LED_BACKLIGHT=y and
> CROS_EC=m without setting ACPI=y.  Given that the dependencies:
> CHROME_PLATFORMS [=y] && LEDS_CLASS [=y] && (ACPI [=n] || CROS_EC [=m]).
>
> $ ./scripts/kconfig/merge_config.sh -n <(cat <<EOF
> CONFIG_MODULES=y
>
> CONFIG_NEW_LEDS=y
> CONFIG_LEDS_CLASS=y
>
> CONFIG_CHROME_PLATFORMS=y
> CONFIG_CROS_EC=m
> CONFIG_CROS_KBD_LED_BACKLIGHT=y
> EOF
> )
> [...]
> Value requested for CONFIG_CROS_KBD_LED_BACKLIGHT not in final .config
> Requested value:  CONFIG_CROS_KBD_LED_BACKLIGHT=y
> Actual value:     CONFIG_CROS_KBD_LED_BACKLIGHT=m
>

It is actually possible to configure CONFIG_CROS_KBD_LED_BACKLIGHT=y
with CONFIG_CROS_EC=m, by also setting CONFIG_LEDS_CLASS=y. However,
that doesn't seem to matter since the critical symbol is CROS_EC_PROTO
which is boolean.
Given that, IS_ENABLED should be fine.

Reviewed-by: Guenter Roeck <groeck@chromium.org>

Thanks,
Guenter

> However, when ACPI=y, `keyboard_led_drvdata_ec_pwm` is unused.  Instead, it
> uses `keyboard_led_drvdata_acpi` for current code.
>
> I guess IS_ENABLED() is sufficient.  Does it make sense?
