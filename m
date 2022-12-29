Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E740D1110
	for <chrome-platform@lists.linux.dev>; Thu, 29 Dec 2022 20:09:56 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-46d4840b51fso213907607b3.12
        for <chrome-platform@lists.linux.dev>; Thu, 29 Dec 2022 12:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J28Z96tBdJMq17EQqMBm5q55q+5j73xIyMXGRvEOFxc=;
        b=Q/jTZNTYdOQ2BDp0njm6m6X+vbhJ3aiU2T6zC4eL+9K6MwvPJ44/cyU5/5k/BUox3o
         2sdcGrGJBR0zryqbckA4M0LLdWlsPJI8TuwvyGqZ/kiPlElCFREm2hdW/OwZCbMZTAz8
         3mC1c8Pk9s9TMVtpDubJE032hBmlGGRK13rrYkMSYr60GEISYV8hgnrj116+EBliTNVw
         hsM7Fvo2Qy8Ycv2uiRp6ngNiyLUV7NFxRWiN1gryEeUgk30bMLVCxhdyejU/92K+kjkp
         NSr2BcAu1OjaePdL/rm/E7aocjvcpWzWWLjnaTCVDSgXcddMiFvegls/EodhXLy5wcLy
         7iog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J28Z96tBdJMq17EQqMBm5q55q+5j73xIyMXGRvEOFxc=;
        b=4U5Jwc2FPrhHhQoarKzAAri5TvQBhupYlu/u05cUbEpA2gFftDKSbc+SAfgHRtHkOD
         iFMrtQMillv/7pSfQxNP5ByuGo81t/W6yexoafqEoPGve/1tLAk/N/zSZKqZ8vopEt4a
         TRqzXbpnYn/8Uf4g1JTMov2jHUlaybl64gJ5OLzgnxPw3xJmv1kiw5oYPMb53ghiNtdi
         XF5Yj+Hzu/YV8ftvjvRpfbXhWoO5qxUT3SA43kgsgBbQASuKkde8+lVAaPtjWYzJKuml
         5SroB0EmLGtWIVWgX9iq17veJgZfKbftw0xOPNtOwvFk5MWy/Jn3a87c42wZK/caQZnE
         yX+w==
X-Gm-Message-State: AFqh2koB36tgPil0YywAgN4zxXCzbwzwW7nAiK7POjRdbCX7EGw7SqCp
	4I/lz5eLCKyKLr0RfbugKSZ0G2SNysTIJztjWkbNiw==
X-Google-Smtp-Source: AMrXdXurYwmOjunXcbAZ9793heR9PqBvPSez+JlQth09hsBSvwnB5YvwFmCVR4Eh+eJkXs2o6K8IxtJgaNY7bE48sOQ=
X-Received: by 2002:a81:581:0:b0:370:4b5e:cb52 with SMTP id
 123-20020a810581000000b003704b5ecb52mr3412769ywf.157.1672344595817; Thu, 29
 Dec 2022 12:09:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221229094738.2304044-1-tzungbi@kernel.org> <CANg-bXD_KiMTR2UWbCQOpCJZqHMb3Txi+VFLw6iS6F_nE5aJEg@mail.gmail.com>
In-Reply-To: <CANg-bXD_KiMTR2UWbCQOpCJZqHMb3Txi+VFLw6iS6F_nE5aJEg@mail.gmail.com>
From: Guenter Roeck <groeck@google.com>
Date: Thu, 29 Dec 2022 12:09:44 -0800
Message-ID: <CABXOdTdA-DxCvM-=YPqb-GXKJhFLujTRWEmsTKkPH6OtiZfWew@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_uart: fix race condition
To: Mark Hasemeyer <markhas@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, bleung@chromium.org, groeck@chromium.org, 
	chrome-platform@lists.linux.dev, robertzieba@google.com, 
	bhanumaiya@chromium.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

On Thu, Dec 29, 2022 at 8:58 AM Mark Hasemeyer <markhas@chromium.org> wrote:
>
> > diff --git a/drivers/platform/chrome/cros_ec_uart.c b/drivers/platform/chrome/cros_ec_uart.c
> > index 0cef2888dffd..6916069f1599 100644
> > --- a/drivers/platform/chrome/cros_ec_uart.c
> > +++ b/drivers/platform/chrome/cros_ec_uart.c
> > @@ -270,7 +270,6 @@ static int cros_ec_uart_probe(struct serdev_device *serdev)
> >         }
> >
> >         serdev_device_set_drvdata(serdev, ec_dev);
> > -       serdev_device_set_client_ops(serdev, &cros_ec_uart_client_ops);
> >         init_waitqueue_head(&ec_uart->response.wait_queue);
> >
> >         ec_uart->serdev = serdev;
> > @@ -300,6 +299,8 @@ static int cros_ec_uart_probe(struct serdev_device *serdev)
> >                            sizeof(struct ec_response_get_protocol_info);
> >         ec_dev->dout_size = sizeof(struct ec_host_request);
> >
> > +       serdev_device_set_client_ops(serdev, &cros_ec_uart_client_ops);
> > +
> >         return cros_ec_register(ec_dev);
> >  }
> Thanks for catching this. As a sanity check, I compiled and loaded the driver on
> my local setup with these changes. LGTM.

Please consider replying with a Reviewed-by: and/or Tested-by: tag.

Thanks,
Guenter
