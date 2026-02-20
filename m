Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F7930AD05
	for <chrome-platform@lists.linux.dev>; Fri, 20 Feb 2026 07:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771573901; cv=none; b=F3+mmyDZT3RgLarfxdsx2foxP00Z6MfyyLZCuV5PRCk3dGvCpm7yZnSDMbqtWQplurg79BCk8cTjeeoIO+NzW47R4ofE3bbWqHGGhfVFYbzMSPZ6DrC80GGzHBS3EsN7Iw/EbYbRZRiEbqgq2Y7T/hoqmUjGQeBfUGJ0WlQx1FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771573901; c=relaxed/simple;
	bh=oiflSM6gYbeTj0TmrVYHD4ZZM3D4l4EXVDqgwe/yO/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y8w5Yc+Obvq3sHmQTjT8MEW5lL8mH2R4Rje6dPTZLanfLbJj7NdBSPle18vi9G9XaRejR58ovhlPA/MGDVl5b23yiNQIJIDrYfbTWN4PQ2bHz5E42/buQGeDKSLXMBUzT1E48PxyH0M5z1ckv4rMEoI32+BzjhFbh/0LmZomKVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QdnH8Yi8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QdnH8Yi8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E28E6C116D0
	for <chrome-platform@lists.linux.dev>; Fri, 20 Feb 2026 07:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771573900;
	bh=oiflSM6gYbeTj0TmrVYHD4ZZM3D4l4EXVDqgwe/yO/k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QdnH8Yi87tus1z4rJnCjzK+To2WMNrlPYBrJMBReSeHY5pn3nEhUvIuxat7WOBztG
	 nDLu0OJBWbt6rRONoyitl1AOgnHYWj3hb052MXHbTLH3QWXXQgXLPU5XBhn1+AYHMP
	 VT/EfSnvZbDFQCrJRxnZ+qEEYfcp0L0SpoBkektY/XIBYTHk4oyYLDzmtigKWZ/kiR
	 XYojsjKUko13SOyORWeOH2dqQpiXU/G7qHA6OP1H/fVhGetUtE9/Fgm2l4TMGfeyNw
	 LILerca1zwJXa6d6SVLn4mpzmWYIKcRK4L1fQ4cgJ3YpTfiFF0Z/WsKOddsT9y/u93
	 YvdvppEGR++Tg==
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-649dbff9727so1863584d50.3
        for <chrome-platform@lists.linux.dev>; Thu, 19 Feb 2026 23:51:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWLS6G8XDgoBXcyWiIHBW190weK1IhtqszGwPh4/T2tQeQRhKwwTKqYv1VGxj1/HYVVP67Gkk0nsL7zuOyCBj0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzoxlKgODhkEd5Mhb/SqIecYJ5zXHVGMfDnymp/8JKm1U+CYZtE
	ZRTd3bpRyKzIboWzy+b9zKQz8PlGjoU+Hjz/I2rQ/ZUldo2eY/5bUxSGnDr6tBEuuFDOIx8IKV+
	mc0RbVfCr13dy+CXrvW74kcDOwTHfmkU=
X-Received: by 2002:a05:690e:4189:b0:649:4906:770a with SMTP id
 956f58d0204a3-64c21a40bf5mr14993420d50.8.1771573900157; Thu, 19 Feb 2026
 23:51:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260213092958.864411-1-tzungbi@kernel.org> <20260213092958.864411-4-tzungbi@kernel.org>
In-Reply-To: <20260213092958.864411-4-tzungbi@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Feb 2026 08:51:29 +0100
X-Gmail-Original-Message-ID: <CAD++jLn6XxLp7hdBOHbvAJ2bxY4dnfiWDV_UVT+EAyaKmV3Naw@mail.gmail.com>
X-Gm-Features: AaiRm51U0_fc9geEqiP5FW1MP92Ex0sMe_rh2hTztlhJlTdYXe4YiGdLqNQRa2Y
Message-ID: <CAD++jLn6XxLp7hdBOHbvAJ2bxY4dnfiWDV_UVT+EAyaKmV3Naw@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] gpio: sysfs: Remove redundant check for struct gpio_chip
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Johan Hovold <johan@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, chrome-platform@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tzung-Bi,

thanks for your patch!

This is semantically correct, so the comments are not about that.

On Fri, Feb 13, 2026 at 10:31=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:

> gpiochip_sysfs_unregister() is only called by gpiochip_remove() where
> the struct gpio_chip is ensured.
>
> Remove the redundant check.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

(...)

> -void gpiochip_sysfs_unregister(struct gpio_device *gdev)
> +void gpiochip_sysfs_unregister(struct gpio_chip *chip)

Here it is chip

> -static inline void gpiochip_sysfs_unregister(struct gpio_device *gdev)
> +static inline void gpiochip_sysfs_unregister(struct gpio_chip *chip)

And here.

> @@ -1286,7 +1286,7 @@ void gpiochip_remove(struct gpio_chip *gc)
>         struct gpio_device *gdev =3D gc->gpiodev;

But you can see that we call it "gc" (gpiochip).

Chip is more ambiguous I think, can you use "gc" everywhere?

Either way, because the patch is so nice:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
