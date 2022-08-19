Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2592623CD
	for <chrome-platform@lists.linux.dev>; Fri, 19 Aug 2022 10:47:52 +0000 (UTC)
Received: by mail-ua1-f44.google.com with SMTP id m21so1619650uab.13
        for <chrome-platform@lists.linux.dev>; Fri, 19 Aug 2022 03:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=OUBWcj+l2fZhAH1BrINxznZbkgscwekzK7SpRP2VydY=;
        b=BDVsMt6jVkLAZUOdrMtoDTZJvO0/HENdJAxcJSe6p2JOEuOLxZr2AdO+vhtUep2v9a
         9adeu3JKEUmAbohxo54WDpYRnED0hmdcrvFOpPS3EfwQajcqaohrFUYNdtwBRdvncqM4
         /iyEBGQu+BHjHyXjLujXPFApQ5Pli4SsZGV4Rg8e+2PsnG3FwhhzSuwiQaporfaF2xgy
         WBkuycImAGHqGIQeH55INbFHbN55brtlgJsZjX6lYZAu+mwxQRGHtL9LU065e4ZfYlRB
         yuY38/DwaD++nOb5EPCgEe7ETEucrMUTDnQhGvWufOUBwn024zkgHnprHSRAV7Vj3Imi
         Uc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=OUBWcj+l2fZhAH1BrINxznZbkgscwekzK7SpRP2VydY=;
        b=eI6jV4i5zz8vh2E3EKQ6Sso73rUpAwdvXYm+iENaQc+U8jnqrOSx8u8P40vfVxX4T2
         Wy3cagdFkSUDEjlyrYMuBd9aPZHB7oV48VPvLnh+uUTygqaGXoLnM0Mc9ybRNZyq4PVY
         e5FtYVUFg6MlPaGLaSvWDwiRXk0nu/Waz/4PXbhy2WT9fd3YlJuYUmhPhb8WAMGIkVF7
         ghhbW/cUBlYv2fGZa3B3vBen4uFkw+B8mJJKL+x8XOhGwbZChV8Cni8LFIbQUb54ivXh
         fNQOn5UChP3kHrYoIKuV3olNLgHvt4Kt+lOYVKxW1783x4jszhL5ksa/yB3yPyoJZ8l9
         Yujg==
X-Gm-Message-State: ACgBeo164xushxRwzLXKLBzfoDgci9j+YaLdzbvJ38YHHAXguUdQzHT3
	tjo2Qx218KkRCnybLXq53pc2WmdTQC42FOKou/pPNg==
X-Google-Smtp-Source: AA6agR5rsRD98PksJa5P0Cw1+qZGpWvSleTb3FomztyCM7UJ1Bssw3ZhU2uX9j6qL+N89imUfYdNVQEZjRbNOafAnMc=
X-Received: by 2002:a9f:35c9:0:b0:387:967a:fa31 with SMTP id
 u9-20020a9f35c9000000b00387967afa31mr2614022uad.70.1660906070973; Fri, 19 Aug
 2022 03:47:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Yv8dpCFZJdbUT5ye@kili>
In-Reply-To: <Yv8dpCFZJdbUT5ye@kili>
From: Guenter Roeck <groeck@google.com>
Date: Fri, 19 Aug 2022 03:47:40 -0700
Message-ID: <CABXOdTddCmyYQ9NqOAoW6jZ00b-60EDPPfwoJUpMTtGUPp3T5Q@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: fix memory corruption in ioctl
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Benson Leung <bleung@chromium.org>, 
	Enric Balletbo i Serra <enric.balletbo@collabora.com>, Guenter Roeck <groeck@chromium.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, 
	Gwendal Grignou <gwendal@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 18, 2022 at 10:20 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> If "s_mem.bytes" is larger than the buffer size it leads to memory
> corruption.
>
> Fixes: eda2e30c6684 ("mfd / platform: cros_ec: Miscellaneous character device to talk with the EC")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_chardev.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/platform/chrome/cros_ec_chardev.c b/drivers/platform/chrome/cros_ec_chardev.c
> index fd33de546aee..2442dce4e208 100644
> --- a/drivers/platform/chrome/cros_ec_chardev.c
> +++ b/drivers/platform/chrome/cros_ec_chardev.c
> @@ -327,6 +327,9 @@ static long cros_ec_chardev_ioctl_readmem(struct cros_ec_dev *ec,
>         if (copy_from_user(&s_mem, arg, sizeof(s_mem)))
>                 return -EFAULT;
>
> +       if (s_mem.bytes > sizeof(s_mem.buffer))
> +               return -EINVAL;
> +
>         num = ec_dev->cmd_readmem(ec_dev, s_mem.offset, s_mem.bytes,
>                                   s_mem.buffer);
>         if (num <= 0)
> --
> 2.35.1
>
