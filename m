Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D9633FC
	for <chrome-platform@lists.linux.dev>; Wed,  6 Apr 2022 21:32:38 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id f18so4195990edc.5
        for <chrome-platform@lists.linux.dev>; Wed, 06 Apr 2022 14:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a32qnBztE2IXtzvLnaEci16ST2DBqAaVGBlmBFvRnDc=;
        b=Am3wn/I//RT+8eEj8AGDpa3XAgi7OxffpcM51aNFuWlwe39zYgN3D7PZ0yNbmCtitb
         8XL+DUuK3lUirphpaiMnKyQHtTcKLbM9hGqiE5K3nG1hjkYzjpCbMfLYcjqj9VXadHUY
         7+eJOKPbRDfaBR8hmjQR4txexhRpvrohH/03Dv4dUHm40iAgkDAUL6nxY5zatf5qFMmF
         OMlBQQ5e7roLBLt1v4e+U88WesZhkMtEAPZ8+bQ3LRuYmd9MKC4iUUiFMeByMa1+zH8R
         D8h/aSuF7uNcLC1A2g0lo9no+3zg4xnad0m77CDSPc7HbBu1+CllhuMZqV5zidnJOcnG
         CMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a32qnBztE2IXtzvLnaEci16ST2DBqAaVGBlmBFvRnDc=;
        b=5GNE0WGHtSvfFUUbF+Wyp10V7wzUu9V3PaAnlU8xIrYfWzGqY+6NgMhdngosDuvK2G
         B5kVz7KpkoGA34xmXYELvUsBOwTbhNnem4S8Xkgh5M4KiUDRFBDhrLXp2B7riRmmhgGL
         Izyig82Wq8NcA7R8DulEP1gKtSAH09UwMrB05V6QNNa53LyH6L2S6E90qdxFc9NcY137
         2HroZ/7/mLoaDnhjjR5tdpwvx3NvVpgc0M8wRd7KBtXbtkUZ0/T6yepvqZVB4CROMjqB
         2q3n0ChmhYmBxtS5S23eGDsSt/Lwj+YpNHFakcKsAY1/GPiOpXDneCHgGQEfhsMta96v
         f8lA==
X-Gm-Message-State: AOAM531jTlkX0hXmqy3nSdq0U5AGUy4aQrqyyuO4xMO9ny+S6HRT/XwS
	pmqnq8ATsk/n/OqulLFYiTSWAxEcAYT8PJ7S2vcbGQ==
X-Google-Smtp-Source: ABdhPJy7jr2rjkpSgrB0uWoNfSr5yY0hfXjtoI1MFRT5vPFgLXCaEZb/W4AjmRfU/AXvAIpD1uyXUeDLWbd253pxzOw=
X-Received: by 2002:aa7:cb8b:0:b0:410:9aaf:2974 with SMTP id
 r11-20020aa7cb8b000000b004109aaf2974mr10907125edt.173.1649280757166; Wed, 06
 Apr 2022 14:32:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220404041101.6276-1-akihiko.odaki@gmail.com> <Yk4DGZfpYbK8dofL@chromium.org>
In-Reply-To: <Yk4DGZfpYbK8dofL@chromium.org>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 6 Apr 2022 14:32:26 -0700
Message-ID: <CABXOdTcY3w56hc7kWsDLxKU-c6fCLYt_jigK13tKjjm9OHi2+w@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Check for EC driver
To: Prashant Malani <pmalani@chromium.org>
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	chrome-platform@lists.linux.dev, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 6, 2022 at 2:16 PM Prashant Malani <pmalani@chromium.org> wrote:
>
> Hi Akihiko,
>
> Thanks for the patch.
>
> On Apr 04 13:11, Akihiko Odaki wrote:
> > The EC driver may not be initialized when cros_typec_probe is called,
> > particulary when CONFIG_CROS_EC_CHARDEV=m.
> >
> > Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> > ---
> >  drivers/platform/chrome/cros_ec_typec.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> > index 4bd2752c0823..7cb2e35c4ded 100644
> > --- a/drivers/platform/chrome/cros_ec_typec.c
> > +++ b/drivers/platform/chrome/cros_ec_typec.c
> > @@ -1084,6 +1084,9 @@ static int cros_typec_probe(struct platform_device *pdev)
> >       }
> >
> >       ec_dev = dev_get_drvdata(&typec->ec->ec->dev);
> > +     if (!ec_dev)
> > +             return -EPROBE_DEFER;
> > +
>
> Just a quick check: are you still seeing this issue with 5.18-rc1, which
> contains a null check for the parent EC device [1] ?
>

I may be missing something, but from the context I suspect this may
make the problem worse. My understanding was that the problem was seen
specifically if CONFIG_CROS_EC_CHARDEV=m. In that situation, it
appears that the parent EC device does _not yet_ exist. If the driver
returns -ENODEV in that situation, it will never be instantiated. The
big question for me is why the type C device is instantiated in the
first place if the parent EC device does not [yet] exist. I have not
been able to identify the code path where this happens.

There is a similar problem with other EC child devices which are also
sometimes instantiated even though the parent EC device does not exist
(ie dev_get_drvdata(pdev->dev.parent) returns NULL). That can happen
if the parent EC device instantiation fails because of EC
communication errors (see https://b.corp.google.com/issues/228118385
for examples [sorry, internal only, I can't make it public]). I think
we need to track down why that happens and prevent child devices from
being instantiated in the first place instead of trying to work around
the problem in the child drivers.

Guenter

> Thanks,
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/platform/chrome?id=ffebd90532728086007038986900426544e3df4e
