Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5BF7B
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jun 2022 16:16:09 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id z7so27750316edm.13
        for <chrome-platform@lists.linux.dev>; Wed, 08 Jun 2022 09:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xj7h12UkZIB4SsfQQ+SZ6RUvCHFdGip3OqzBInEc28s=;
        b=su+DB+FEUDTr+F2VLRr+X1PXTruzq0D1wec0lhVPqBRoWsnVJ9fAC9K7QDoZ1RsTl8
         dUSLW1/g7MHRHilP/lspdCnDtksPo0tN1Fat08Wc316vzYXA86SZoccWJQdTQ3f6NMiA
         Y2LeATMewXgJug1Ocn77JxKWxbfpF7/YZ9H493mLQ4QfmsiwoIY0MdH+uZMGMvzP0mP2
         LoUfaJXAtvpvAJxc6/JAeGKRFoTBKCdXDomwtSVTeQZFlgy86+kCPORnI3SDSWVzR5o2
         rWGbgR5roMExQuHmTQqdwePDcM9aU8bS5nvi4G/mBPGP7DRcK4qQzWxTwQz9L8WJ0lxG
         I3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xj7h12UkZIB4SsfQQ+SZ6RUvCHFdGip3OqzBInEc28s=;
        b=E6gZM0T62yen/GMbih+D+s0Oj8uLVjPUN77fP7qR2YBD81PMZ6cgx+UogLNpdN5R7v
         QxBCVr4zqOOmHW5AofwH2DNlsQh4D5uwzxjyMTKNeFYTiMWCB0rOYkRz1hQx7rjRH21j
         DWgMAsDQoqARUrk3x6Rkp0OCgHrOQsC9jKMSbaYgKGWTaGccqz8fi4I70avhPF+R7Hc2
         aSuLa06J1jgZXhdKBDtiKxLZVcBWOP0riIukmIQ5toj+0sKrUP1EYIhPSQuzxDS0GPdT
         l39tV5Rrd5nbiQKQcSPC8n7pmLyYYcRBP0uRUqMtSiotdGgA4z7TPpGcXL+brAdaqMNA
         qIyA==
X-Gm-Message-State: AOAM533KKl8uDEHyY2vclTdUWVEUv5PnF3Ss8CWIrQM82fHM1j3OjLbG
	KllyWII1UxUYza793FUJMTTVF3JraPhkrF0M+QUOfvRoQ/8u8oSk
X-Google-Smtp-Source: ABdhPJxwfJ42pptzM92imvlryrZlItqv3Cbj/UxDQ72rgxDEHUTsEb1kqZ7cX9QGe1sEO/XMA/D3bkxzsaHFTTRk+ME=
X-Received: by 2002:aa7:c84d:0:b0:431:4226:70c9 with SMTP id
 g13-20020aa7c84d000000b00431422670c9mr23414709edt.51.1654704967667; Wed, 08
 Jun 2022 09:16:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220608110734.2928245-1-tzungbi@kernel.org> <20220608110734.2928245-14-tzungbi@kernel.org>
In-Reply-To: <20220608110734.2928245-14-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 8 Jun 2022 09:15:56 -0700
Message-ID: <CABXOdTegzx8Xpp3QPn8XyjLt1Rdr7ztkLcY53+vHmEEVKYSr4Q@mail.gmail.com>
Subject: Re: [PATCH v3 13/23] platform/chrome: cros_ec: don't allocate `din`
 and `dout` in cros_ec_register()
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 8, 2022 at 4:08 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> Don't allocate `din` and `dout` in cros_ec_register() as they will be
> allocated soon in cros_ec_query_all().
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
> No change from v2.
>
>  drivers/platform/chrome/cros_ec.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
> index e51a3f2176c7..29d3b544dafb 100644
> --- a/drivers/platform/chrome/cros_ec.c
> +++ b/drivers/platform/chrome/cros_ec.c
> @@ -188,14 +188,8 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
>         ec_dev->max_passthru = 0;
>         ec_dev->ec = NULL;
>         ec_dev->pd = NULL;
> -
> -       ec_dev->din = devm_kzalloc(dev, ec_dev->din_size, GFP_KERNEL);
> -       if (!ec_dev->din)
> -               return -ENOMEM;
> -
> -       ec_dev->dout = devm_kzalloc(dev, ec_dev->dout_size, GFP_KERNEL);
> -       if (!ec_dev->dout)
> -               return -ENOMEM;
> +       ec_dev->din = NULL;
> +       ec_dev->dout = NULL;
>
>         mutex_init(&ec_dev->lock);
>
> --
> 2.36.1.255.ge46751e96f-goog
>
