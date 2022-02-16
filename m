Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E351FA9
	for <chrome-platform@lists.linux.dev>; Wed, 16 Feb 2022 02:31:36 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id x11so867951pll.10
        for <chrome-platform@lists.linux.dev>; Tue, 15 Feb 2022 18:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tMSwIfjOv1Uyh0Rn8c3FPvnNt2awh1M6+sjpagFNNPs=;
        b=MrvjeIXCQ0Ol/ZNcfXLD9ryra3Lxo0LuahOeXNhhVa8XVLk1mUyCn13YOkRJMEu7rU
         /IiaUHNDr77cLli/X5P8Akq/dF6VCwimLY3cWD9peCVXcnFV56IY9C7gNqaju6Y/YLy3
         eWTGx5T7KUECG4JNaraqfYDi4uVSFg/kF5Iv+0n6BeHzpnTgQ2e9eIrsYZF3XfWZ3GhB
         WuEwHitGwU6yPS5Z7i9bu7dfGGKty0EU7dChAqeZ/QpqjScnH0TkUWB4Mm5UyxLYNufD
         qI3yU6sUDxkiD/3h9BfUlAfCRDkDWa7tEV0xEIg4ifAS6TMM+5ZGqlOi2GdVTXx1/dcO
         Nq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tMSwIfjOv1Uyh0Rn8c3FPvnNt2awh1M6+sjpagFNNPs=;
        b=4xXLo4ugSDBBNG2C2aOSpWntUVuT5rDoYMznsQXMGjLlzqsnA2Ffa0sFU+hmas06xR
         4O4xzNPCzCyii5/iXitHtMzCxfaahm13ROd8AmlOX+hw9fwGeb/YbF9mrpoTC/wjmOds
         6x4W/4g4Jl5Ka3kUgSk0UtRe6vfU4YNTiEdjBWEuz1lGhForeavCkZjS05NfikhNacOs
         A/pzwh4VfkBHjpuE8XfRASrXeF0cbckM2jubwDeR+xzMYiPTFo9kdgEI0FOl3osWzU0r
         HvEVJFxjtj7rsd20AxMfiAhi+8y0ujQW2TLpIwH6t7Q3mAT9aEknCW7Do6ejbCrWcP8R
         drzQ==
X-Gm-Message-State: AOAM532w9VI80z2Q8+LMUJ0dBAlJWUL8Mr4yjHZXWuA8sOB9RzFuROPM
	iA8Gfz+4g8ASeGX+0pxFaYCVNw==
X-Google-Smtp-Source: ABdhPJyU2ukSn0pACLz1YQlEvjfxSBDTqZwAmjsrkqyhGVLNZmkSRDuKwLpWoQymGsMeVVJJ0nyyig==
X-Received: by 2002:a17:902:82c7:b0:14f:252d:67e7 with SMTP id u7-20020a17090282c700b0014f252d67e7mr777069plz.27.1644978695666;
        Tue, 15 Feb 2022 18:31:35 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:adf7:46e7:cef5:ba49])
        by smtp.gmail.com with ESMTPSA id 7sm18442035pjo.45.2022.02.15.18.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 18:31:35 -0800 (PST)
Date: Wed, 16 Feb 2022 10:31:32 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Prashant Malani <pmalani@chromium.org>
Cc: bleung@chromium.org, groeck@chromium.org, robh+dt@kernel.org,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] platform/chrome: cros_kbd_led_backlight: support OF
 match
Message-ID: <YgxiBO7jDtyhWwlb@google.com>
References: <20220214053646.3088298-1-tzungbi@google.com>
 <20220214053646.3088298-5-tzungbi@google.com>
 <CACeCKac+b1Rp6bZFALn=sbh8gkJbWeKTC=8bdzp+-90pgq=wSw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACeCKac+b1Rp6bZFALn=sbh8gkJbWeKTC=8bdzp+-90pgq=wSw@mail.gmail.com>

On Tue, Feb 15, 2022 at 05:10:04PM -0800, Prashant Malani wrote:
> On Sun, Feb 13, 2022 at 9:37 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
> > diff --git a/drivers/platform/chrome/cros_kbd_led_backlight.c b/drivers/platform/chrome/cros_kbd_led_backlight.c
> > index 814f2b74c602..ba853e55d29a 100644
> > --- a/drivers/platform/chrome/cros_kbd_led_backlight.c
> > +++ b/drivers/platform/chrome/cros_kbd_led_backlight.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/kernel.h>
> >  #include <linux/leds.h>
> >  #include <linux/module.h>
> > +#include <linux/of_device.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/slab.h>
> >
> > @@ -128,8 +129,11 @@ static int keyboard_led_probe(struct platform_device *pdev)
> >         int error;
> >
> >         drvdata = acpi_device_get_match_data(&pdev->dev);
> > -       if (!drvdata)
> > -               return -EINVAL;
> > +       if (!drvdata) {
> > +               drvdata = of_device_get_match_data(&pdev->dev);
> > +               if (!drvdata)
> > +                       return -EINVAL;
> > +       }
> 
> I'm not familiar with this driver, so can't do a full review, but
> shouldn't device_get_match_data()
> from property.h [1] be able to handle both DT and ACPI cases?
> 
> [1]: https://elixir.bootlin.com/linux/v5.17-rc4/source/include/linux/property.h

Yes, it does[2][3].  Thanks for the feedback, will fix it in next version.

[2]: https://elixir.bootlin.com/linux/v5.17-rc4/source/drivers/of/property.c#L1474
[3]: https://elixir.bootlin.com/linux/v5.17-rc4/source/drivers/acpi/property.c#L1386
