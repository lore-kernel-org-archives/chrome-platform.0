Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE9210E0
	for <chrome-platform@lists.linux.dev>; Wed, 25 May 2022 15:11:43 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id n8so18840678plh.1
        for <chrome-platform@lists.linux.dev>; Wed, 25 May 2022 08:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JyixjUdddf6I90XP9MdFK6+higCWyl5KeV+gVWtp6WU=;
        b=f20Va32dKRJKc/hg0L61Ym/jpgUK0f5vPl1fJoIrhHp4ZYZ651lh4oqGY4DK+jeg4J
         j/5F1rr/CFGPSwCgQSnzLJcizT05k7U/pFvaGcJ5lkhZrGqDWv9IscCatZuGe25yR9q2
         gcabwG6JEe6AnZbUxaBC1uMGDPQd6VHlNYBrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JyixjUdddf6I90XP9MdFK6+higCWyl5KeV+gVWtp6WU=;
        b=7ZLn/+nnVZcb51JelB/EsjdE2iZrw7IG1TLq4Z9p3cQYF2VDN9vX56R+eLl/XHxs9C
         6ekZu4D9K5cuy3z9Af3VRaMNcGnoXh/7PkfQ5OP7MKbsoxow/xt0JvMSpbw3MZ61a6As
         JFjLr/+CJqPw5j39pSTh25li/ZwlOPJThXoIjQlHbntlAnQUEO3c8B92Up0z3yOftXBO
         wcdQUT4SEB0lmBiX0bizq8rVr7/NJhrXDRBoTjLfquA+G4hwdUgMvQvoG/Pz+zaEW8ZL
         RN7AM1bLzEX6w1Y77Iy1T9MJXFsD7RL6suoj5MLyI03A/jzrzBonAEYgKCzd4Omk+xeu
         d22A==
X-Gm-Message-State: AOAM532XuYgKAYIuW/OjamR+x9V5MmwNxaYxZ8Ay3BrCUujaT4/6wIOs
	EacA9NiAmjmJcMqVKfKYtwh+Ow==
X-Google-Smtp-Source: ABdhPJxgS1VuqYEu6r9Y57sGqJnQIEGTKr/QvLaXom2H7c4IuIt24COlf9Rl55IoJgxqziOXj1S5PA==
X-Received: by 2002:a17:90a:6487:b0:1df:7e0f:c93e with SMTP id h7-20020a17090a648700b001df7e0fc93emr10975351pjj.77.1653491502589;
        Wed, 25 May 2022 08:11:42 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:4d83:f549:9abd:427])
        by smtp.gmail.com with UTF8SMTPSA id a21-20020a637055000000b003c14af505fesm8581222pgn.22.2022.05.25.08.11.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 May 2022 08:11:42 -0700 (PDT)
Date: Wed, 25 May 2022 08:11:40 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, robh+dt@kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v4 4/5] platform/chrome: cros_kbd_led_backlight: support
 OF match
Message-ID: <Yo5HLJs81/KoXSBT@google.com>
References: <20220523090822.3035189-1-tzungbi@kernel.org>
 <20220523090822.3035189-5-tzungbi@kernel.org>
 <Yo07IDqYuQUzeL+N@google.com>
 <Yo2jhTpsa5Vw4+61@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yo2jhTpsa5Vw4+61@google.com>

On Wed, May 25, 2022 at 11:33:25AM +0800, Tzung-Bi Shih wrote:
> On Tue, May 24, 2022 at 01:08:00PM -0700, Matthias Kaehlcke wrote:
> > On Mon, May 23, 2022 at 05:08:21PM +0800, Tzung-Bi Shih wrote:
> > > +#ifdef CONFIG_OF
> > > +static const struct of_device_id keyboard_led_of_match[] = {
> > > +	{
> > > +		.compatible = "google,cros-kbd-led-backlight",
> > > +	},
> > > +	{}
> > > +};
> > > +MODULE_DEVICE_TABLE(of, keyboard_led_of_match);
> > > +#endif
> > > +
> > >  static struct platform_driver keyboard_led_driver = {
> > >  	.driver		= {
> > >  		.name	= "chromeos-keyboard-leds",
> > >  		.acpi_match_table = ACPI_PTR(keyboard_led_acpi_match),
> > > +		.of_match_table = of_match_ptr(keyboard_led_of_match),
> > 
> > You need to put this assignment inside an '#ifdef CONFIG_OF' block,
> > otherwise the compiler won't find 'keyboard_led_of_match' when
> > CONFIG_OF isn't set.
> 
> It doesn't need as of_match_ptr() already guarded it.

I learned something new today :)

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
