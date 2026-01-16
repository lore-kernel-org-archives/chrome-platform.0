Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A027A39341E
	for <chrome-platform@lists.linux.dev>; Fri, 16 Jan 2026 14:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768574334; cv=none; b=sKQoX96AB9hsfU+uRo0p7/AymEuha+bSx8OwKFVPj0NsoyGZvTCp0NuElacXJ6uMYtE0YH8fhAL/9Dna+Ch3+R0g49fBZRS1HTgVM4bLoY1n5GtPbDz59xPuU/LO2vmDmtYLQUCD3IeNUYHtkEEumYwENbAn99b2HLGQVQQvKAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768574334; c=relaxed/simple;
	bh=CeYWVW8VfM0P+9OVOOOqSKgq9221JvmOkwmMFowPykI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eC8kXt0P5yfRja+GoPnBbHoU8k83b1qGK3XYAvrPhvkXp5ePmJcGuCDwjYt7MBc2foE9D9s1aZQ9AOHgIqanyjobqHseyN2j8n16QQ3YTzt9mOsn+yHT7ae+XKn48zQ9JKwmYYO9yY/m/917AjqCFK9iJNRIbdB0KNZmxadA3cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PQEVgjpJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQEVgjpJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3249DC19423
	for <chrome-platform@lists.linux.dev>; Fri, 16 Jan 2026 14:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768574334;
	bh=CeYWVW8VfM0P+9OVOOOqSKgq9221JvmOkwmMFowPykI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PQEVgjpJy7anhYu69qk39dAN28YD03PPdTZVU9AhQC76WyrJV5EWCvl6pHigdr4fC
	 7TeKSEqg5HwWzH85+/50XTka8w9RtlkCxJCAfDm22NMvYhmQJC2QpZ+9wjcW6GA8rf
	 I9zIEcApykBDYBi8MiD5octTdbbQF5czLaYVUsQ7U8kM+dPCobWtMYj9vB2wfZWTYL
	 APK8JW/YkY0oS8uGtNKat5q6wvN0dkyT+oddEAKh4HDWaZqrC1UYw2RLQSW6On7kbU
	 H/svw+5QYdpq89KwBOu/SJS54gInTP9rHEQ6tSD71ENaDedaS38ojOYJ7jH8t9b2j3
	 Fg8x375/+X6lw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59a10df8027so2402798e87.0
        for <chrome-platform@lists.linux.dev>; Fri, 16 Jan 2026 06:38:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWPexFI/uMzzJAK4lzPCCJzl2WK/vt0uJmWtxLnDuEIh82RMFA6I7xchQBdINf1e2BqJw7dH44uJS/vuyz6DFo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxS3o0q6qqp/22jcqP5lrYiC/+JlG/DqXB218U3xsaGFMMBLy1S
	KQ6c0mTcwlWKvXhhtco4U5T/PG9GsRDkTRbscu1Umkpcf3wtCqJIJxK6YE9adpKFOfmirWOV9oB
	na5NmGzSqDZJ9w1F09PDOx4BjvQJ7N2fR7JuiA5odbg==
X-Received: by 2002:a05:6512:2209:b0:595:910c:8eea with SMTP id
 2adb3069b0e04-59baeedb8d0mr1047903e87.32.1768574329704; Fri, 16 Jan 2026
 06:38:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260116081036.352286-1-tzungbi@kernel.org> <20260116081036.352286-2-tzungbi@kernel.org>
 <20260116141356.GI961588@nvidia.com>
In-Reply-To: <20260116141356.GI961588@nvidia.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 16 Jan 2026 15:38:37 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfNHuTYsZJ+_RqPN1TtLOHsenv2neD5wvhA18NH6m7XjA@mail.gmail.com>
X-Gm-Features: AZwV_QgKGGwLD0w6o4kmw7zFNYd6T1XDEchQCsf09zNM0M9ftM2EdmkAv3QwV20
Message-ID: <CAMRc=MfNHuTYsZJ+_RqPN1TtLOHsenv2neD5wvhA18NH6m7XjA@mail.gmail.com>
Subject: Re: [PATCH 01/23] gpiolib: Correct wrong kfree() usage for `kobj->name`
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-kselftest@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Dan Williams <dan.j.williams@intel.com>, linux-gpio@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 3:14=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Fri, Jan 16, 2026 at 08:10:14AM +0000, Tzung-Bi Shih wrote:
> > `kobj->name` should be freed by kfree_const()[1][2].  Correct it.
> >
> > [1] https://elixir.bootlin.com/linux/v6.18/source/lib/kasprintf.c#L41
> > [2] https://elixir.bootlin.com/linux/v6.18/source/lib/kobject.c#L695
> >
> > Cc: stable@vger.kernel.org
> > Fixes: c351bb64cbe6 ("gpiolib: free device name on error path to fix km=
emleak")
> > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> > ---
> >  drivers/gpio/gpiolib.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index 5eb918da7ea2..ba9323432e3a 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -1263,7 +1263,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *=
gc, void *data,
> >  err_free_descs:
> >       kfree(gdev->descs);
> >  err_free_dev_name:
> > -     kfree(dev_name(&gdev->dev));
> > +     kfree_const(dev_name(&gdev->dev));
> >  err_free_ida:
> >       ida_free(&gpio_ida, gdev->id);
> >  err_free_gdev:
>         kfree(gdev);
>
> I don't think users should be open coding this, put_device() frees the
> dev_name properly. The issue here is that the code doesn't call
> device_initialize() before doing dev_set_name() and then tries to
> fiddle a weird teardown sequence when it eventually does get initialized:
>
> err_remove_from_list:
>         if (gdev->dev.release) {
>                 /* release() has been registered by gpiochip_setup_dev() =
*/
>                 gpio_device_put(gdev);
>                 goto err_print_message;
>         }
>
> If gpiochip_add_data_with_key() is split into two functions, one that
> does kzalloc(), some initialization and then ends with
> device_initialize(), then a second function that calls the first and
> does the rest of the initialization and error unwinds with
> put_device() it will work a lot better.
>

In theory yes but you wouldn't be the first one to attempt to improve
it. This code is very brittle when it comes to GPIO chips that need to
be initialized very early into the boot process. I'm talking old
drivers in arch which call this function without even an associated
parent struct device. When I'm looking at it now, it does seem
possible to call device_initialize() early but whether that will work
correctly for all existing users is a bigger question.

I'm open to trying it after v7.0-rc1 is tagged. This would give it
enough time in linux-next to make sure it works.

Bartosz
